import { getHasura } from "../../../../utilities/hasura";
import { AppType, Language, MezError } from "../../../models/Generic/Generic";
import { Operator } from "../../../models/Services/Service";
import { AuthorizationStatus } from "../../../models/Generic/Generic";

export async function getRestaurantOperators(restaurantId: number): Promise<Operator[]> {
  let chain = getHasura();

  let response = await chain.query({
    restaurant_operator: [{
      where: {
        restaurant_id: {
          _eq: restaurantId
        },
        _and: [{
          restaurant_id: {
            _eq: restaurantId
          },
          operator_details: {
            status: {
              _eq: AuthorizationStatus.Authorized
            }
          }
        }]
      }
    }, {
      id: true,
      user_id: true,
      operator_details: {
        id: true,
        owner: true,
        online: true,
        notification_info: {
          token: true,
          turn_off_notifications: true
        },
      },
      user: {
        firebase_id: true,
        language_id: true,
      }
    }]
  });
  if(response.restaurant_operator == null) {
    throw new MezError("restaurantNotfound");
  }
  
  return response.restaurant_operator.map((r:any): Operator => {
    return {
      id: r.id,
      detailsId: r.operator_details.id,
      userId: r.user_id,
      serviceProviderId: restaurantId,
      status: AuthorizationStatus.Authorized,
      owner: r.operator_details.owner,
      online: r.operator_details.online,
      notificationInfo: (r.operator_details.notification_info) ? {
        appType: AppType.Restaurant,
        token: r.operator_details.notification_info.token,
        turnOffNotifications: r.operator_details.notification_info.turn_off_notifications
      }: undefined,
      user: {
        id: r.user_id,
        firebaseId: r.user.firebase_id,
        language: r.user.language_id as Language
      }
    }
  });
}

export async function getRestaurantOperator(restaurantOperatorId: number): Promise<Operator> {
  let chain = getHasura();

  let response = await chain.query({
    restaurant_operator_by_pk: [{
      id: restaurantOperatorId
    }, {
      user_id: true,
      operator_details: {
        id: true,
        status: true,
        owner: true,
        online: true,
        notification_info: {
          token: true,
          turn_off_notifications: true
        },
      },
      restaurant_id: true,
      user: {
        firebase_id: true,
        language_id: true,
      }
    }]
  });
  if(response.restaurant_operator_by_pk == null) {
    throw new MezError("operatorNotFound");
  }
  return {
    id: restaurantOperatorId,
    userId: response.restaurant_operator_by_pk.user_id,
    detailsId: response.restaurant_operator_by_pk.operator_details.id,
    serviceProviderId: response.restaurant_operator_by_pk.restaurant_id,
    status: response.restaurant_operator_by_pk.operator_details.status as AuthorizationStatus,
    owner: response.restaurant_operator_by_pk.operator_details.owner,
    online: response.restaurant_operator_by_pk.operator_details.online,
    notificationInfo: (response.restaurant_operator_by_pk.operator_details.notification_info) ? {
      appType: AppType.Restaurant,
      token: response.restaurant_operator_by_pk.operator_details.notification_info.token,
      turnOffNotifications: response.restaurant_operator_by_pk.operator_details.notification_info.turn_off_notifications
    }: undefined,
    user: {
      id: response.restaurant_operator_by_pk.user_id,
      firebaseId: response.restaurant_operator_by_pk.user.firebase_id,
      language: response.restaurant_operator_by_pk.user.language_id as Language
    }
  };
}

export async function getRestaurantOperatorByUserId(restaurantOperatorUserId: number): Promise<Operator> {
  let chain = getHasura();

  let response = await chain.query({
    restaurant_operator: [{
      where: {
        user_id: {
          _eq: restaurantOperatorUserId
        },
      }
    }, {
      id: true,
      restaurant_id: true,
      operator_details: {
        id: true,
        status: true,
        owner: true,
        online: true,
        notification_info: {
        token: true,
        turn_off_notifications: true
        },
      },
      user: {
        firebase_id: true,
        language_id: true,
      }
    }]
  });
  if(response.restaurant_operator == null) {
    throw new MezError("operatorNotFound");
  }
  return {
    id: response.restaurant_operator[0].id,
    detailsId: response.restaurant_operator[0].operator_details.id,
    userId: restaurantOperatorUserId,
    serviceProviderId: response.restaurant_operator[0].restaurant_id,
    status: response.restaurant_operator[0].operator_details.status as AuthorizationStatus,
    owner: response.restaurant_operator[0].operator_details.owner,
    online: response.restaurant_operator[0].operator_details.online,
    notificationInfo: (response.restaurant_operator[0].operator_details.notification_info) ? {
      appType: AppType.Restaurant,
      token: response.restaurant_operator[0].operator_details.notification_info.token,
      turnOffNotifications: response.restaurant_operator[0].operator_details.notification_info.turn_off_notifications
    }: undefined,
    user: {
      id: restaurantOperatorUserId,
      firebaseId: response.restaurant_operator[0].user.firebase_id,
      language: response.restaurant_operator[0].user.language_id as Language
    }
  };
}