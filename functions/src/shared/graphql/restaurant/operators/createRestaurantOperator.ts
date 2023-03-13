import { HttpsError } from "firebase-functions/v1/auth";
import { getHasura } from "../../../../utilities/hasura";
import { AppType, AuthorizationStatus } from "../../../models/Generic/Generic";
import { Operator, ServiceProvider } from "../../../models/Services/Service";
import { AddOperatorDetails } from "../../../operator/addOperator";

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
                _eq: AppType.RestaurantApp
            }
        }
    }, {
        id: true,
    }]
  })
  if(response.restaurant_operator.length) {
      throw new HttpsError(
          "internal",
          "The operator is already working for this restaurant"
      );
  }

  let mutationResponse = await chain.mutation({
    insert_restaurant_operator_one: [{
      object: {
        user_id: operatorUserId,
        restaurant_id: restaurant.id,
        operator_details: {
          data: {
            user_id: operatorUserId,
            app_type_id: AppType.RestaurantApp,
            app_version: addOpDetails.appVersion,
            notification_info: (addOpDetails.notificationToken) 
              ? {
                data: {
                  token: addOpDetails.notificationToken,
                  user_id: operatorUserId,
                  turn_off_notifications: false,
                  app_type_id: AppType.RestaurantApp
                }
              }: undefined,
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
    throw new HttpsError(
      "internal",
      "operator creation error"
    );
  }
  return {
    id: mutationResponse.insert_restaurant_operator_one.id,
    detailsId: mutationResponse.insert_restaurant_operator_one.details_id,
    userId: operatorUserId,
    online: true,
    serviceProviderId: restaurant.id,
    status: AuthorizationStatus.AwaitingApproval,
    notificationInfo: (addOpDetails.notificationToken) ? {
      appType: AppType.RestaurantApp,
      token: addOpDetails.notificationToken,
      turnOffNotifications: false
    }: undefined,
  }
}