import { HttpsError } from "firebase-functions/v1/auth";
import { getHasura } from "../../../../utilities/hasura";
import { AppType, Language } from "../../../models/Generic/Generic";
import { Operator } from "../../../models/Services/Service";
import { AuthorizationStatus } from "../../../models/Generic/Generic"

export async function getLaundryOperators(laundryStoreId: number): Promise<Operator[]> {
    let chain = getHasura();
  
    let response = await chain.query({
      laundry_operator: [{
        where: {
          store_id: {
            _eq: laundryStoreId
          },
          status: {
            _eq: "authorized"
          }
        }
      }, {
        id: true,
        user_id: true,
        operator_details: {
          status: true,
          owner: true,
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
    if(response.laundry_operator == null) {
      throw new HttpsError(
        "internal",
        "No laundry with that id found"
      );
    }
    
    return response.laundry_operator.map((r): Operator => {
      return {
        id: r.id,
        userId: r.user_id,
        serviceProviderId: laundryStoreId,
        status: r.operator_details.status as AuthorizationStatus,
        owner: r.operator_details.owner,
        notificationInfo: (r.operator_details.notification_info) ? {
          appType: AppType.LaundryApp,
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

  export async function getLaundryOperatorByUserId(laundryOperatorUserId: number): Promise<Operator> {
    let chain = getHasura();
  
    let response = await chain.query({
      laundry_operator: [{
        where: {
          user_id: {
            _eq: laundryOperatorUserId
          },
        }
      }, {
        id: true,
        store_id: true,
        operator_details: {
          status: true,
          owner: true,
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
    if(response.laundry_operator.length == null) {
      throw new HttpsError(
        "internal",
        "No laundry operator with that user id or store id found"
      );
    }
    return {
      id: response.laundry_operator[0].id,
      userId: laundryOperatorUserId,
      serviceProviderId: response.laundry_operator[0].store_id,
      status: response.laundry_operator[0].operator_details.status as AuthorizationStatus,
      owner: response.laundry_operator[0].operator_details.owner,
      notificationInfo: (response.laundry_operator[0].operator_details.notification_info) ? {
        appType: AppType.LaundryApp,
        token: response.laundry_operator[0].operator_details.notification_info.token,
        turnOffNotifications: response.laundry_operator[0].operator_details.notification_info.turn_off_notifications
      }: undefined,
      user: {
        id: laundryOperatorUserId,
        firebaseId: response.laundry_operator[0].user.firebase_id,
        language: response.laundry_operator[0].user.language_id as Language
      }
    };
  }