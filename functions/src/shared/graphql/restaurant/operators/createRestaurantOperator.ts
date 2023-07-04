import { notification_info_constraint, notification_info_update_column } from "../../../../../../hasura/library/src/generated/graphql-zeus";
import { AddOperatorDetails, AddOperatorError } from "../../../../serviceProvider/addOperator";
import { getHasura } from "../../../../utilities/hasura";
import { AppType, AuthorizationStatus, MezError } from "../../../models/Generic/Generic";
import { Operator, ServiceProvider } from "../../../models/Services/Service";

export async function createRestaurantOperator(operatorUserId: number, addOpDetails: AddOperatorDetails, restaurant: ServiceProvider): Promise<Operator> {

  let chain = getHasura();
  let response = await chain.query({
    restaurant_operator: [{
        where: {
            user_id: {
                _eq: operatorUserId,
            },
            restaurant_id: {
                _eq: restaurant.id
            }
        }
    }, {
        id: true,
    }],
    notification_info: [{
        where: {
            user_id: {
                _eq: operatorUserId
            },
            app_type_id: {
                _eq: AppType.Restaurant
            }
        }
    }, {
        id: true,
    }]
  })
  if(response.restaurant_operator.length) {
    throw new MezError(AddOperatorError.UserAlreadyAnOperator);
  }

  let mutationResponse = await chain.mutation({
    insert_restaurant_operator_one: [{
      object: {
        user_id: operatorUserId,
        restaurant_id: restaurant.id,
        operator_details: {
          data: {
            user_id: operatorUserId,
            app_type_id: AppType.Restaurant,
            app_version: addOpDetails.appVersion,
            status: AuthorizationStatus.AwaitingApproval,
          }
        }
      }
    }, {
      id: true,
      details_id: true,
    }]
  });
  if(mutationResponse.insert_restaurant_operator_one == null) {
    throw new MezError(AddOperatorError.OperatorCreationError);
  }


  if(addOpDetails.notificationToken) {
    chain.mutation({
      insert_notification_info_one: [{
        object: {
          app_type_id: AppType.Restaurant,
          token: addOpDetails.notificationToken,
          user_id: operatorUserId,
          turn_off_notifications: false,
        },
        on_conflict: {
          constraint: (
            notification_info_constraint.notification_info_app_type_id_user_id_key
          ),
          update_columns: [notification_info_update_column.token]
        }
      }, {
        id: true
      }]
    })
  }
  return {
    id: mutationResponse.insert_restaurant_operator_one.id,
    detailsId: mutationResponse.insert_restaurant_operator_one.details_id,
    userId: operatorUserId,
    online: true,
    serviceProviderId: restaurant.id,
    status: AuthorizationStatus.AwaitingApproval,
    notificationInfo: (addOpDetails.notificationToken) ? {
      appType: AppType.Restaurant,
      token: addOpDetails.notificationToken,
      turnOffNotifications: false
    }: undefined,
  }
}