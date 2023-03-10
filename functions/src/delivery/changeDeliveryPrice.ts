import { HttpsError } from "firebase-functions/v1/auth";
import { getCourierOrder, getCourierOrderFromDelivery } from "../shared/graphql/delivery/courier/getCourierOrder";
import { getDeliveryOrder } from "../shared/graphql/delivery/getDelivery";
import { updateDeliveryChangePriceRequest } from "../shared/graphql/delivery/updateDelivery";
import { getLaundryOrder, getLaundryOrderFromDelivery } from "../shared/graphql/laundry/order/getLaundryOrder";
import { getRestaurantOrder, getRestaurantOrderFromDelivery } from "../shared/graphql/restaurant/order/getRestaurantOrder";
import { getCustomer } from "../shared/graphql/user/customer/getCustomer";
import { ParticipantType } from "../shared/models/Generic/Chat";
import { ChangePriceStatus, DeliveryOrder } from "../shared/models/Generic/Delivery";
import { OrderType } from "../shared/models/Generic/Order";
import { CustomerInfo } from "../shared/models/Generic/User";
import { Notification, NotificationAction, NotificationType, OrderNotification } from "../shared/models/Notification";
import { CourierOrder } from "../shared/models/Services/Courier/Courier";
import { LaundryOrder } from "../shared/models/Services/Laundry/LaundryOrder";
import { RestaurantOrder } from "../shared/models/Services/Restaurant/RestaurantOrder";
import { pushNotification } from "../utilities/senders/notifyUser";

export interface ChangePriceDetails {
    deliveryOrderId: number,
    newPrice: number,
    reason: string,
}

export async function changeDeliveryPrice(userId: number, changePriceDetails: ChangePriceDetails) {
    
    let deliveryOrder: DeliveryOrder = await getDeliveryOrder(changePriceDetails.deliveryOrderId);

    if(deliveryOrder.deliveryDriver == null || deliveryOrder.deliveryDriver.userId != userId) {
        throw new HttpsError(
            "internal",
            `Driver not assigned to order`,
        );
    }
    deliveryOrder.changePriceRequest = {
        newPrice: changePriceDetails.newPrice,
        oldPrice: deliveryOrder.deliveryCost,
        reason: changePriceDetails.reason,
        status: ChangePriceStatus.Requested
    }
    updateDeliveryChangePriceRequest(deliveryOrder);

    notifyCustomer(deliveryOrder);
}

interface ChangePriceResponseDetails {
    accepted: boolean,
    orderId: number,
    orderType: OrderType,
}

export async function changeDeliveryPriceResponse(userId: number, changePriceResponseDetails: ChangePriceResponseDetails) {
    //check order
    //accepted -> mutation to change delivery price of delivery and sp order
    //rejected -> remove driver
    //notify driver
    let customerId: number;
    switch (changePriceResponseDetails.orderType) {
        case OrderType.Restaurant:
            let restaurantOrder: RestaurantOrder = await getRestaurantOrder(changePriceResponseDetails.orderId);
            customerId = restaurantOrder.customerId;
            break;
        case OrderType.Laundry:
            let laundryOrder: LaundryOrder = await getLaundryOrder(changePriceResponseDetails.orderId);
            customerId = laundryOrder.customerId;
            break;
        default:
            let courierOrder: CourierOrder = await getCourierOrder(changePriceResponseDetails.orderId);
            customerId = courierOrder.customerId;
            break;
    }
    if(userId != customerId) {
        throw new HttpsError(
            "internal",
            `Order does not belong to this customer`,
        );
    }

    if(changePriceResponseDetails.accepted) {
        
    } else {

    }

    // deliveryOrder.changePriceRequest = {
    //     newPrice: changePriceDetails.newPrice,
    //     oldPrice: deliveryOrder.deliveryCost,
    //     reason: changePriceDetails.reason,
    //     status: ChangePriceStatus.Requested
    // }
    // updateDeliveryChangePriceRequest(deliveryOrder);
}

async function notifyCustomer(deliveryOrder: DeliveryOrder) {
    let orderId: number;
    switch (deliveryOrder.orderType) {
        case OrderType.Restaurant:
            let restaurantOrder: RestaurantOrder = await getRestaurantOrderFromDelivery(deliveryOrder.deliveryId);
            orderId = restaurantOrder.orderId;
            break;
        case OrderType.Laundry:
            let laundryOrder: LaundryOrder = await getLaundryOrderFromDelivery(deliveryOrder);
            orderId = laundryOrder.orderId;
            break;
        default:
            let courierOrder: CourierOrder = await getCourierOrderFromDelivery(deliveryOrder);
            orderId = courierOrder.id;
            break;
    }
    let customer: CustomerInfo = await getCustomer(deliveryOrder.customerId);
    let notification: Notification = {
        foreground: <OrderNotification>{
            time: (new Date()).toISOString(),
            notificationType: NotificationType.NewCounterOffer,
            orderType: deliveryOrder.orderType,
            notificationAction: NotificationAction.ShowSnackBarAlways,
            orderId
        },
        background: {
            en: {
                title: `Delivery price change request`,
                body: `Driver is requesting change in delivery price`
            },
            es: {
                title: `Solicitud de cambio de precio de entrega`,
                body: `El conductor está solicitando un cambio en el precio de entrega`
            }
        },
        linkUrl: `/`
    };
    pushNotification(
        customer.firebaseId,
        notification,
        customer.notificationInfo,
        ParticipantType.Customer,
        customer.language
    );
}
