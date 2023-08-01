import { getHasura } from "../../../../utilities/hasura";
import { AuthorizationStatus, AppType, Language, MezError } from "../../../models/Generic/Generic";
import { Operator } from "../../../models/Services/Service";

export async function getBusinessOperatorByUserId(businessOperatorUserId: number): Promise<Operator> {
  let chain = getHasura();

  let response = await chain.query({
    business_operator: [{
      where: {
        user_id: {
          _eq: businessOperatorUserId
        }
      }
    }, {
      id: true,
      business_id: true,
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
  if(response.business_operator.length == 0) {
    throw new MezError("businessOperatorNotFound");
  }
  return {
    id: response.business_operator[0].id,
    detailsId: response.business_operator[0].operator_details.id,
    userId: businessOperatorUserId,
    serviceProviderId: response.business_operator[0].business_id,
    status: response.business_operator[0].operator_details.status as AuthorizationStatus,
    online: response.business_operator[0].operator_details.online,
    owner: response.business_operator[0].operator_details.owner,
    notificationInfo: (response.business_operator[0].operator_details.notification_info) ? {
      appType: AppType.Business,
      token: response.business_operator[0].operator_details.notification_info.token,
      turnOffNotifications: response.business_operator[0].operator_details.notification_info.turn_off_notifications
    }: undefined,
    user: {
      id: businessOperatorUserId,
      firebaseId: response.business_operator[0].user.firebase_id,
      language: response.business_operator[0].user.language_id as Language
    }
  };
}


export async function getBusinessOperators(businessId: number): Promise<Operator[]> {
  let chain = getHasura();

  let response = await chain.query({
    business_operator: [{
      where: {
        business_id: {
          _eq: businessId
        }
      }
    }, {
      id: true,
      business_id: true,
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
        id: true,
        firebase_id: true,
        language_id: true,
      }
    }]
  });
  if(response.business_operator.length == 0) {
    throw new MezError("businessNotFound");
  }
  return response.business_operator.map((o:any) => {
    return {
      id: o.id,
      detailsId: o.operator_details.id,
      userId: o.user.id,
      serviceProviderId: o.business_id,
      status: o.operator_details.status as AuthorizationStatus,
      owner: o.operator_details.owner,
      online: o.operator_details.online,
      notificationInfo: (o.operator_details.notification_info) ? {
        appType: AppType.Business,
        token: o.operator_details.notification_info.token,
        turnOffNotifications: o.operator_details.notification_info.turn_off_notifications
      }: undefined,
      user: {
        id: o.user.id,
        firebaseId: o.user.firebase_id,
        language: o.user.language_id as Language
      }
    }
  })
}

export async function getBusinessOperator(operatorId: number): Promise<Operator> {
  let chain = getHasura();

  let response = await chain.query({
    business_operator_by_pk: [{
      id: operatorId
    }, {
      id: true,
      business_id: true,
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
      user: {
        firebase_id: true,
        language_id: true,
      }
    }]
  });
  if(response.business_operator_by_pk == null) {
    throw new MezError("operatorNotFound");
  }
  return {
    id: response.business_operator_by_pk.id,
    detailsId: response.business_operator_by_pk.operator_details.id,
    userId: response.business_operator_by_pk.user_id,
    serviceProviderId: response.business_operator_by_pk.business_id,
    status: response.business_operator_by_pk.operator_details.status as AuthorizationStatus,
    online: response.business_operator_by_pk.operator_details.online,
    owner: response.business_operator_by_pk.operator_details.owner,
    notificationInfo: (response.business_operator_by_pk.operator_details.notification_info) ? {
      appType: AppType.Business,
      token: response.business_operator_by_pk.operator_details.notification_info.token,
      turnOffNotifications: response.business_operator_by_pk.operator_details.notification_info.turn_off_notifications
    }: undefined,
    user: {
      id: response.business_operator_by_pk.user_id,
      firebaseId: response.business_operator_by_pk.user.firebase_id,
      language: response.business_operator_by_pk.user.language_id as Language
    }
  };
}