import { $ } from "../../../../../hasura/library/src/generated/graphql-zeus";
import { getHasura } from "../../../utilities/hasura";
import { DeliveryDirection, DeliveryOrder, DeliveryOrderStatus, DeliveryServiceProviderType } from "../../models/Generic/Delivery";
import { AppType, MezError } from "../../models/Generic/Generic";
import { OrderType } from "../../models/Generic/Order";
import { LaundryOrder } from "../../models/Services/Laundry/LaundryOrder";
import { ServiceProvider } from "../../models/Services/Service";

export async function createLaundryToCustomerDeliveryOrder(
    laundryOrder: LaundryOrder, 
    laundryStore: ServiceProvider, 
    fromCustomerDelivery: DeliveryOrder
): Promise<DeliveryOrder> {
    let chain = getHasura();

    let mezAdmins = await chain.query({
        mez_admin: [{}, {
            user_id: true,
        }]
    });

    let mezAdminDetails = mezAdmins.mez_admin.map((m:any) => {
        return {
          participant_id: m.user_id,
          app_type_id: AppType.MezAdmin
        };
    });
    let laundryOperatorsDetails = laundryStore.operators?.map((v) => {
        return {
            participant_id: v.userId,
            app_type_id: AppType.Laundry
        };
    }) ?? [];

    let response = await chain.mutation({
        insert_delivery_order_one: [{
            object: {
                customer_id: laundryOrder.customerId,
                order_type: OrderType.Laundry,
                dropoff_gps: $`dropoff_gps`,
                dropoff_address: laundryOrder.customerLocation!.address,
                pickup_gps:  $`pickup_gps`,
                direction : DeliveryDirection.ToCustomer,
                pickup_address: laundryStore.location.address,
                schedule_time: laundryOrder.scheduledTime,
                chat_with_customer: {
                data: {
                    chat_participants: {
                        data: [{
                            participant_id: laundryOrder.customerId,
                            app_type_id: AppType.Customer
                        },]
                    }
                }
                },
                chat_with_service_provider: {
                    data: {
                        chat_participants: {
                            data: [...laundryOperatorsDetails, ...mezAdminDetails]
                        }
                    }
                },
                payment_type: laundryOrder.paymentType,
                delivery_cost: laundryOrder.deliveryCost - fromCustomerDelivery.deliveryCost,
                package_cost: laundryOrder.itemsCost,
                package_ready: true,
                status: DeliveryOrderStatus.OrderReceived,
                service_provider_id: (laundryStore.deliveryDetails.selfDelivery) 
                    ? laundryStore.id 
                    : laundryStore.deliveryPartnerId,
                service_provider_type: (laundryStore.deliveryDetails.selfDelivery) 
                    ? DeliveryServiceProviderType.Laundry
                    : DeliveryServiceProviderType.DeliveryCompany,
                
                scheduled_time: laundryOrder.scheduledTime,
                trip_distance: fromCustomerDelivery.tripDistance,
                trip_duration: fromCustomerDelivery.tripDuration,
                trip_polyline: fromCustomerDelivery.tripPolyline,
            }
        }, { 
            id: true,
            chat_with_customer_id: true,
            chat_with_service_provider_id: true,
            order_time: true
        }]
    }, {
        "dropoff_gps": {
            "type": "Point",
            "coordinates": [laundryOrder.customerLocation!.lng, laundryOrder.customerLocation!.lat ],
            },
        "pickup_gps": {
            "type": "Point",
            "coordinates": [laundryStore.location.lng, laundryStore.location.lat ],
        },
    });
    if(!(response.insert_delivery_order_one)) {
        throw new MezError("orderCreationError");
    }
    await chain.mutation({
        update_laundry_order_by_pk: [{
            pk_columns: {
                id: laundryOrder.orderId
            },
            _set: {
                to_customer_delivery_id: response.insert_delivery_order_one.id
            }
        }, {
            id: true,
        }]
    });
    laundryOrder.toCustomerDeliveryId = response.insert_delivery_order_one.id;
    return {
        deliveryId: response.insert_delivery_order_one.id,
        orderType: OrderType.Laundry,
        pickupLocation: laundryOrder.customerLocation,
        dropoffLocation: laundryStore.location,
        chatWithServiceProviderId: response.insert_delivery_order_one.chat_with_service_provider_id,
        chatWithCustomerId: response.insert_delivery_order_one.chat_with_customer_id,
        paymentType: laundryOrder.paymentType,
        status: DeliveryOrderStatus.OrderReceived,
        customerId: laundryOrder.customerId,
        deliveryCost: laundryOrder.deliveryCost / 2,
        packageCost: laundryOrder.itemsCost,
        orderTime: response.insert_delivery_order_one.order_time,
        tripDistance : fromCustomerDelivery.tripDistance,
        tripDuration : fromCustomerDelivery.tripDuration,
        tripPolyline : fromCustomerDelivery.tripPolyline,
        serviceProviderType: (laundryStore.deliveryDetails.selfDelivery == false && laundryStore.deliveryPartnerId) 
            ? DeliveryServiceProviderType.DeliveryCompany 
            : DeliveryServiceProviderType.Laundry,
        serviceProviderId: (laundryStore.deliveryDetails.selfDelivery == false && laundryStore.deliveryPartnerId) ? laundryStore.deliveryPartnerId : laundryStore.id,
        direction: DeliveryDirection.ToCustomer,
        packageReady: true,
    }
}