import { $ } from "../../../../../../hasura/library/src/generated/graphql-zeus";
import { LaundryRequestDetails, ReqLaundryError } from "../../../../laundry/laundryRequest";
import { getHasura } from "../../../../utilities/hasura";
import { DeliveryDirection, DeliveryOrder, DeliveryOrderStatus, DeliveryServiceProviderType } from "../../../models/Generic/Delivery";
import { AppType, MezError } from "../../../models/Generic/Generic";
import { DeliveryType, OrderType } from "../../../models/Generic/Order";
import { MezAdmin } from "../../../models/Generic/User";
import { LaundryOrder, LaundryOrderStatus } from "../../../models/Services/Laundry/LaundryOrder";
import { ServiceProvider } from "../../../models/Services/Service";

export async function createLaundryOrder(
    customerId: number,
    laundryRequestDetails: LaundryRequestDetails, 
    laundryStore: ServiceProvider, 
    mezAdmins: MezAdmin[]
): Promise<{laundryOrder: LaundryOrder, fromCustomerDeliveryOrder: DeliveryOrder}> {
    let chain = getHasura();

    let laundryOperatorsDetails = laundryStore.operators?.map((v) => {
        return {
            participant_id: v.userId,
            app_type_id: AppType.Laundry
        };
    }) ?? [];

    let mezAdminDetails = mezAdmins!.map((m:any) => {
        return {
          participant_id: m.id,
          app_type_id: AppType.MezAdmin
        };
    });

    let response = await chain.mutation({
        insert_laundry_order_one: [{
            object: {
                customer_id: customerId,
                store_id: laundryRequestDetails.storeId,
                payment_type: laundryRequestDetails.paymentType,
                delivery_type: laundryRequestDetails.deliveryType,
                customer_app_type: laundryRequestDetails.customerAppType,
                notes: laundryRequestDetails.notes,
                tax: laundryRequestDetails.tax ?? undefined,
                scheduled_time: laundryRequestDetails.scheduledTime,
                stripe_fees: laundryRequestDetails.stripeFees ?? undefined,
                discount_value: laundryRequestDetails.discountValue ?? undefined,
                customer_location_gps: $`customer_location_gps`,
                customer_address: laundryRequestDetails.customerLocation.address,
                delivery_cost: laundryRequestDetails.deliveryCost,
                status: LaundryOrderStatus.OrderReceived,
                chat: {
                    data: {
                        chat_participants: {
                            data: [{
                                participant_id: customerId,
                                app_type_id: AppType.Customer
                            },
                            ...laundryOperatorsDetails,
                            ...mezAdminDetails]
                        }
                    }
                },
                from_customer_delivery: (laundryRequestDetails.deliveryType == DeliveryType.Delivery) ? {
                    data: {
                        customer_id: customerId,
                        order_type: OrderType.Laundry,
                        dropoff_gps: $`dropoff_gps` ,
                        dropoff_address: laundryStore.location.address,
                        pickup_gps: $`customer_location_gps`,
                        package_ready:true,
                        pickup_address: laundryRequestDetails.customerLocation.address,
                        schedule_time: laundryRequestDetails.scheduledTime,
                        chat_with_customer: {
                        data: {
                            chat_participants: {
                                data: [{
                                    participant_id: customerId,
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
                        payment_type: laundryRequestDetails.paymentType,
                        delivery_cost: laundryRequestDetails.deliveryCost / 2,
                        direction : DeliveryDirection.FromCustomer,
                        status: DeliveryOrderStatus.OrderReceived,
                        service_provider_id: (laundryStore.deliveryDetails.selfDelivery) 
                            ? laundryStore.id 
                            : laundryStore.deliveryPartnerId,
                        service_provider_type: (laundryStore.deliveryDetails.selfDelivery) 
                            ? DeliveryServiceProviderType.Laundry
                            : DeliveryServiceProviderType.DeliveryCompany,
                        
                        scheduled_time: laundryRequestDetails.scheduledTime,
                        trip_distance: laundryRequestDetails.tripDistance,
                        trip_duration: laundryRequestDetails.tripDuration,
                        trip_polyline: laundryRequestDetails.tripPolyline,
                        distance_from_base: laundryRequestDetails.distanceFromBase
                    }
                }: undefined,
            }
        }, {
            id: true,
            chat_id: true,
            order_time: true,
            from_customer_delivery: {
                id: true,
                chat_with_customer_id: true,
                chat_with_service_provider_id: true,
            },
        }],
    }, {
        "customer_location_gps": {
            "type": "Point",
            "coordinates": [laundryRequestDetails.customerLocation.lng, laundryRequestDetails.customerLocation.lat ],
        },
        "dropoff_gps": {
            "type": "Point",
            "coordinates": [laundryStore.location.lng, laundryStore.location.lat ],
        }
    })

    if(response.insert_laundry_order_one == null) {
        throw new MezError(ReqLaundryError.OrderCreationError);
    }
    let laundryOrder: LaundryOrder = {
        orderId: response.insert_laundry_order_one.id,
        customerId,
        storeId: laundryRequestDetails.storeId,
        spDetailsId: laundryStore.serviceProviderDetailsId,
        paymentType: laundryRequestDetails.paymentType,
        deliveryType: laundryRequestDetails.deliveryType,
        customerAppType: laundryRequestDetails.customerAppType,
        notes: laundryRequestDetails.notes,
        tax: laundryRequestDetails.tax,
        scheduledTime: laundryRequestDetails.scheduledTime,
        stripeFees: laundryRequestDetails.stripeFees,
        discountValue: laundryRequestDetails.discountValue,
        customerLocation: laundryRequestDetails.customerLocation,
        deliveryCost: laundryRequestDetails.deliveryCost,
        status: LaundryOrderStatus.OrderReceived,
        chatId: response.insert_laundry_order_one.chat_id
    }

    if(laundryRequestDetails.deliveryType == DeliveryType.Delivery) {
        if(response.insert_laundry_order_one.from_customer_delivery == null) {
            throw new MezError(ReqLaundryError.OrderCreationError);
        }
        laundryOrder.fromCustomerDeliveryId = response.insert_laundry_order_one.from_customer_delivery.id;
        return {
            laundryOrder,
            fromCustomerDeliveryOrder: {
                deliveryId: response.insert_laundry_order_one.from_customer_delivery.id,
                orderType: OrderType.Laundry,
                pickupLocation: laundryRequestDetails.customerLocation,
                dropoffLocation: laundryStore.location,
                chatWithServiceProviderId: response.insert_laundry_order_one.from_customer_delivery.chat_with_service_provider_id,
                chatWithCustomerId: response.insert_laundry_order_one.from_customer_delivery.chat_with_customer_id,
                paymentType: laundryRequestDetails.paymentType,
                status: DeliveryOrderStatus.OrderReceived,
                customerId: customerId,
                deliveryCost: laundryRequestDetails.deliveryCost / 2,
                packageCost: 0,
                orderTime: response.insert_laundry_order_one.order_time,
                tripDistance : laundryRequestDetails.tripDistance,
                tripDuration : laundryRequestDetails.tripDuration,
                tripPolyline : laundryRequestDetails.tripPolyline,
                serviceProviderType: DeliveryServiceProviderType.Laundry,
                serviceProviderId: laundryStore.id!,
                direction: DeliveryDirection.FromCustomer,
                packageReady: true,
                distanceFromBase: laundryRequestDetails.distanceFromBase
            }
        }
    }
    return {
        laundryOrder,
        fromCustomerDeliveryOrder: {
            deliveryId: 0,
            orderType: OrderType.Laundry,
            pickupLocation: laundryStore.location,
            dropoffLocation: laundryRequestDetails.customerLocation,
            chatWithServiceProviderId: 0,
            chatWithCustomerId: 0,
            paymentType: laundryRequestDetails.paymentType,
            status: DeliveryOrderStatus.OrderReceived,
            customerId: customerId,
            deliveryCost: laundryRequestDetails.deliveryCost,
            packageCost: 0,
            orderTime: response.insert_laundry_order_one.order_time,
            tripDistance : laundryRequestDetails.tripDistance,
            tripDuration : laundryRequestDetails.tripDuration,
            tripPolyline : laundryRequestDetails.tripPolyline,
            serviceProviderType: (laundryStore.deliveryDetails.selfDelivery == false && laundryStore.deliveryPartnerId) 
                ? DeliveryServiceProviderType.DeliveryCompany 
                : DeliveryServiceProviderType.Laundry,
            serviceProviderId: (laundryStore.deliveryDetails.selfDelivery == false && laundryStore.deliveryPartnerId) 
                ? laundryStore.deliveryPartnerId 
                : laundryStore.id,
            direction: DeliveryDirection.FromCustomer,
            packageReady: false,
        }
    }
}