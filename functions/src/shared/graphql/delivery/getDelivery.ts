import { HttpsError } from "firebase-functions/v1/auth";
import { getHasura } from "../../../utilities/hasura";
import { AppType, Language } from "../../models/Generic/Generic";
import { PaymentType } from "../../models/Generic/Order";
import { DeliveryDriverType, DeliveryOrder, DeliveryOrderStatus } from "../../models/Services/Delivery/DeliveryOrder";

export async function getDeliveryOrder(deliveryId: number): Promise<DeliveryOrder> {
  let chain = getHasura();

  let response = await chain.query({
      delivery_order_by_pk: [{
        id: deliveryId
      }, {
        pickup_gps: true,
        pickup_address: true,
        dropoff_gps: true,
        dropoff_address: true,
        chat_with_service_provider_id: true,
        chat_with_customer_id: true,
        payment_type: true,
        status: true,
        customer_id: true,
        delivery_cost: true,
        package_cost: true,
        order_time: true,
        deliverer_app_type_id: true,
        notification_token: true,
        deliverer_id: true,
        deliverer: {
          id: true,
          delivery_company_type: true,
          delivery_company_id: true,
          user: {
            id: true,
            firebase_id: true,
            language_id: true,
          },
          
          status: true,
        }
      }]
  });
  if(response.delivery_order_by_pk == null) {
    throw new HttpsError(
      "internal",
      "No order with that id found"
    );
  }
  let delivery: DeliveryOrder = {
    deliveryId: deliveryId,
    pickupLocation: {
      lat: response.delivery_order_by_pk.pickup_gps.coordinates[1],
      lng: response.delivery_order_by_pk.pickup_gps.coordinates[0],
      address: response.delivery_order_by_pk.pickup_address,
    },
    dropoffLocation: {
      lat: response.delivery_order_by_pk.dropoff_gps.coordinates[1],
      lng: response.delivery_order_by_pk.dropoff_gps.coordinates[0],
      address: response.delivery_order_by_pk.dropoff_address,
    },
    chatWithServiceProviderId: response.delivery_order_by_pk.chat_with_service_provider_id,
    chatWithCustomerId: response.delivery_order_by_pk.chat_with_customer_id,
    paymentType: response.delivery_order_by_pk.payment_type as PaymentType,
    status: response.delivery_order_by_pk.status as DeliveryOrderStatus,
    customerId: response.delivery_order_by_pk.customer_id,
    deliveryCost: response.delivery_order_by_pk.delivery_cost,
    packageCost: response.delivery_order_by_pk.package_cost,
    orderTime: response.delivery_order_by_pk.order_time,
    delivererAppType: response.delivery_order_by_pk.deliverer_app_type_id as AppType
  }

  if(response.delivery_order_by_pk.deliverer_app_type_id == AppType.RestaurantApp) {
    let operatorResponse = await chain.query({
      restaurant_operator_by_pk: [{
        id: response.delivery_order_by_pk.deliverer_id!
      }, {
        user_id: true,
        user: {
          firebase_id: true,
          language_id: true
        }
      }]
    });
    delivery.deliveryDriver = {
      userId: operatorResponse.restaurant_operator_by_pk?.user_id!,
      user: {
        id: operatorResponse.restaurant_operator_by_pk?.user_id!,
        firebaseId: operatorResponse.restaurant_operator_by_pk?.user.firebase_id!,
        language: operatorResponse.restaurant_operator_by_pk?.user.language_id as Language
      },
      notificationInfo: (response.delivery_order_by_pk.notification_token) ? {
        AppTypeId: AppType.RestaurantApp,
        token: response.delivery_order_by_pk.notification_token as string
      } : undefined,
      deliveryDriverType: DeliveryDriverType.RestaurantOperator
    }
  } else if(response.delivery_order_by_pk.deliverer) {
    delivery.deliveryDriver = {
      id: response.delivery_order_by_pk.deliverer.id,
      deliveryCompanyType: response.delivery_order_by_pk.deliverer.delivery_company_type,
      deliveryCompanyId: response.delivery_order_by_pk.deliverer.delivery_company_id,
      status: response.delivery_order_by_pk.deliverer.status,
      userId: response.delivery_order_by_pk.deliverer.user.id,
      user: {
        id: response.delivery_order_by_pk.deliverer.user.id,
        firebaseId: response.delivery_order_by_pk.deliverer.user.firebase_id,
        language: response.delivery_order_by_pk.deliverer.user.language_id as Language
      },
      notificationInfo: (response.delivery_order_by_pk.notification_token) ? {
        AppTypeId: AppType.DeliveryApp,
        token: response.delivery_order_by_pk.notification_token as string
      } : undefined,
      deliveryDriverType: DeliveryDriverType.DeliveryDriver

    }
  }
  return delivery;
}