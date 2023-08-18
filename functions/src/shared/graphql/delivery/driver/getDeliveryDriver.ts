import { getHasura } from "../../../../utilities/hasura";
import { AppType, AuthorizationStatus, Language, MezError } from "../../../models/Generic/Generic";
import { DeliveryDriver, DeliveryServiceProviderType } from "../../../models/Generic/Delivery";
// import { ParticipantType } from "../../../models/Generic/Chat";

export async function getDeliveryDriver(deliveryDriverId: number): Promise<DeliveryDriver> {

  let chain = getHasura();
  let response;
  // if (deliveryDriverType == ParticipantType.RestaurantOperator) {
  //   response = await chain.query({
  //     restaurant_operator_by_pk: [{
  //       id: deliveryDriverId
  //     }, {
  //       user: {
  //         id: true,
  //         firebase_id: true,
  //         language_id: true,
  //         image: true,
  //         name: true,
  //         phone: true
  //       },
  //       notification_info: {
  //         token: true,
  //         turn_off_notifications: true
  //       },
  //     }]
  //   });
  //   if (response.restaurant_operator_by_pk == null) {
  //     throw new HttpsError(
  //       "internal",
  //       "No operator with that id found"
  //     );
  //   }
  //   return {
  //     userId: response.restaurant_operator_by_pk.user.id,
  //     user: {
  //       id: response.restaurant_operator_by_pk.user.id,
  //       firebaseId: response.restaurant_operator_by_pk.user.firebase_id,
  //       language: response.restaurant_operator_by_pk.user.language_id as Language,
  //       image: response.restaurant_operator_by_pk.user.image,
  //       name: response.restaurant_operator_by_pk.user.name,
  //       phoneNumber: response.restaurant_operator_by_pk.user.phone
  //     },
  //     notificationInfo: (response.restaurant_operator_by_pk.notification_info) ? {
  //       appType: AppType.RestaurantApp,
  //       token: response.restaurant_operator_by_pk.notification_info.token,
  //       turnOffNotifications: response.restaurant_operator_by_pk.notification_info.turn_off_notifications
  //     } : undefined,
  //     deliveryDriverType: ParticipantType.RestaurantOperator
  //   }
  // }
  // else {
    response = await chain.query({
      delivery_driver_by_pk: [{
        id: deliveryDriverId
      }, {
        user_id: true,
        delivery_company_type: true,
        delivery_company_id: true,
        status: true,
        online: true,
        user: {
          firebase_id: true,
          language_id: true,
          image: true,
          name: true,
          phone: true
        },
        notification_info: {
          token: true,
          turn_off_notifications: true
        },
      }]
    });
    if (response.delivery_driver_by_pk == null) {
      throw new MezError("driverNotFound");
    }
    return {
      id: deliveryDriverId,
      userId: response.delivery_driver_by_pk.user_id,
      deliveryCompanyType: response.delivery_driver_by_pk.delivery_company_type as DeliveryServiceProviderType,
      companyId: response.delivery_driver_by_pk.delivery_company_id,
      status: response.delivery_driver_by_pk.status as AuthorizationStatus,
      online: response.delivery_driver_by_pk.online,
      user: {
        id: response.delivery_driver_by_pk.user_id,
        firebaseId: response.delivery_driver_by_pk.user.firebase_id,
        language: response.delivery_driver_by_pk.user.language_id as Language,
        image: response.delivery_driver_by_pk.user.image,
        name: response.delivery_driver_by_pk.user.name,
        phoneNumber: response.delivery_driver_by_pk.user.phone
      },
      notificationInfo: (response.delivery_driver_by_pk.notification_info) ? {
        appType: AppType.Delivery,
        token: response.delivery_driver_by_pk.notification_info.token,
        turnOffNotifications: response.delivery_driver_by_pk.notification_info.turn_off_notifications
      } : undefined,
      // deliveryDriverType: ParticipantType.DeliveryDriver
    }
  // }
}

export async function getDeliveryDrivers(deliveryCompanyIds: number[]): Promise<DeliveryDriver[]> {

  let chain = getHasura();
  let response = await chain.query({
    delivery_company: [{
      where: {
        id: {
          _in: deliveryCompanyIds
        }
      }
    }, {
      id: true
    }],
    delivery_driver: [{
      where: {
        _and: [{
          delivery_company_type: {
            _eq: DeliveryServiceProviderType.DeliveryCompany
          },
        }, {
          delivery_company_id: {
            _in: deliveryCompanyIds
          }
        }]
      }
    }, {
        id: true,
        user_id: true,
        delivery_company_type: true,
        delivery_company_id: true,
        status: true,
        online: true,
        current_location: true,
        user: {
          firebase_id: true,
          language_id: true,
          image: true,
          name: true,
          phone: true
        },
        notification_info: {
          token: true,
          turn_off_notifications: true
        },
      }]
    });
    if(response.delivery_company.length == 0) {
      throw new MezError("noDeliveryCompanyFound");
    }
    if (response.delivery_driver.length == 0) {
      throw new MezError("deliveryCompaniesHaveNoDrivers");
    }
    return response.delivery_driver.map((d: any) => {
      return {
        id: d.id,
        userId: d.user_id,
        deliveryCompanyType: DeliveryServiceProviderType.DeliveryCompany,
        companyId: d.delivery_company_id,
        status: d.status as AuthorizationStatus,
        online: d.online,
        user: {
          id: d.user_id,
          firebaseId: d.user.firebase_id,
          language: d.user.language_id as Language,
          image: d.user.image,
          name: d.user.name,
          phoneNumber: d.user.phone
        },
        notificationInfo: (d.notification_info) ? {
          appType: AppType.Delivery,
          token: d.notification_info.token,
          turnOffNotifications: d.notification_info.turn_off_notifications
        } : undefined,
        // deliveryDriverType: ParticipantType.DeliveryDriver
      }
    })
    
  // }
}


export async function getAllDrivers(): Promise<DeliveryDriver[]> {

  let chain = getHasura();
  let response = await chain.query({
    delivery_company: [{}, {
      id: true
    }],
    delivery_driver: [{
      where: {
        delivery_company_type: {
          _eq: DeliveryServiceProviderType.DeliveryCompany
        },
        status: {
          _eq: AuthorizationStatus.Authorized
        },
        online: {
          _eq: true
        }
      }
    }, {
        id: true,
        user_id: true,
        delivery_company_type: true,
        delivery_company_id: true,
        status: true,
        online: true,
        current_location: true,
        user: {
          firebase_id: true,
          language_id: true,
          image: true,
          name: true,
          phone: true
        },
        notification_info: {
          token: true,
          turn_off_notifications: true
        },
      }]
    });
    if(response.delivery_company.length == 0) {
      throw new MezError("noDeliveryCompanyFound");
    }
    if (response.delivery_driver.length == 0) {
      throw new MezError("deliveryCompaniesHaveNoDrivers");
    }
    return response.delivery_driver.map((d: any) => {
      return {
        id: d.id,
        userId: d.user_id,
        deliveryCompanyType: DeliveryServiceProviderType.DeliveryCompany,
        companyId: d.delivery_company_id,
        status: d.status as AuthorizationStatus,
        online: d.online,
        user: {
          id: d.user_id,
          firebaseId: d.user.firebase_id,
          language: d.user.language_id as Language,
          image: d.user.image,
          name: d.user.name,
          phoneNumber: d.user.phone
        },
        notificationInfo: (d.notification_info) ? {
          appType: AppType.Delivery,
          token: d.notification_info.token,
          turnOffNotifications: d.notification_info.turn_off_notifications
        } : undefined,
        // deliveryDriverType: ParticipantType.DeliveryDriver
      }
    })
    
  // }
}