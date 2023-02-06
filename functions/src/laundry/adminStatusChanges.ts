import { ServerResponseStatus } from "../shared/models/Generic/Generic";
import { DeliveryType, OrderType, PaymentType } from "../shared/models/Generic/Order";
import { orderInProcess, LaundryOrderStatus, LaundryOrder, LaundryOrderStatusChangeNotification } from "../shared/models/Services/Laundry/LaundryOrder";
import *  as rootDbNodes from "../shared/databaseNodes/root";
import { expectedPreviousStatus, passChecksForLaundry } from "./helper";
import { Notification, NotificationAction, NotificationType } from "../shared/models/Notification";
import { LaundryOrderStatusChangeMessages } from "./bgNotificationMessages";
import { orderUrl } from "../utilities/senders/appRoutes";
import { getLaundryOrder } from "../shared/graphql/laundry/order/getLaundryOrder";
import { getCustomer } from "../shared/graphql/user/customer/getCustomer";
import { CustomerInfo } from "../shared/models/Generic/User";
import { HttpsError } from "firebase-functions/v1/auth";
import { updateLaundryOrderStatus } from "../shared/graphql/laundry/order/updateOrder";
import { capturePayment, PaymentDetails } from "../utilities/stripe/payment";
import { ParticipantType } from "../shared/models/Generic/Chat";
import { pushNotification } from "../utilities/senders/notifyUser";

interface ChangeStatusDetails {
  orderId: number,
}

export async function cancelOrder(userId: number, changeStatusDetails: ChangeStatusDetails) {
  await changeStatus(changeStatusDetails.orderId, LaundryOrderStatus.CancelledByAdmin, userId)
};

export async function readyForDeliveryOrder(userId: number, changeStatusDetails: ChangeStatusDetails) {
  await changeStatus(changeStatusDetails.orderId, LaundryOrderStatus.ReadyForDelivery, userId)
};


async function changeStatus(orderId: number, newStatus: LaundryOrderStatus, userId: number) {

  await passChecksForLaundry(orderId, userId);

  let order: LaundryOrder = await getLaundryOrder(orderId);
  let customer: CustomerInfo = await getCustomer(order.customerId);

  if (newStatus == LaundryOrderStatus.Delivered || newStatus == LaundryOrderStatus.CancelledByAdmin) {
    if (!orderInProcess(order.status)) {
      throw new HttpsError(
        "internal",
        "Order cannot be cancelled because it is not in process"
      );
    }
  } else if (expectedPreviousStatus(newStatus) != order.status) {
    throw new HttpsError(
      "internal", 
      `Status is not ${expectedPreviousStatus(newStatus)} but ${order.status}`,
    );
  }
  if (newStatus == LaundryOrderStatus.CancelledByAdmin) {
    if (order.paymentType == PaymentType.Card) {
      let paymentDetails: PaymentDetails = {
        orderId: orderId,
        orderType: OrderType.Laundry,
        serviceProviderId: order.storeId,
        orderStripePaymentInfo: order.stripeInfo!
      }
      capturePayment(paymentDetails, 0)
    }
    order.refundAmount = order.totalCost;
  }

  order.status = newStatus
  updateLaundryOrderStatus(order);

  let notification: Notification = {
    foreground: <LaundryOrderStatusChangeNotification>{
      status: newStatus,
      time: (new Date()).toISOString(),
      notificationType: NotificationType.OrderStatusChange,
      orderType: OrderType.Laundry,
      notificationAction: newStatus != LaundryOrderStatus.CancelledByAdmin
        ? NotificationAction.ShowSnackBarAlways : NotificationAction.ShowPopUp,
      orderId: orderId
    },
    background: LaundryOrderStatusChangeMessages[newStatus],
    linkUrl: orderUrl(OrderType.Laundry, orderId)
  }
  
  pushNotification(
    customer.firebaseId, 
    notification, 
    customer.notificationInfo,
    ParticipantType.Customer, 
    customer.language
  )

  if(order.deliveryType == DeliveryType.Delivery) {
    // Delivery order status change
    // if(!(order.deliveryId)) {
    //   throw new HttpsError(
    //     "internal",
    //     "No delivery id"
    //   );
    // }
    // let deliveryOrder: DeliveryOrder = await getDeliveryOrder(order.deliveryId);
    // if (newStatus == RestaurantOrderStatus.CancelledByAdmin) {
    //   deliveryOrder.status = DeliveryOrderStatus.CancelledByServiceProvider;
    //   updateDeliveryOrderStatus(deliveryOrder);
    // }
    // if(order.status == RestaurantOrderStatus.ReadyForPickup && deliveryOrder.status != DeliveryOrderStatus.AtPickup) {
    //   deliveryOrder.status = DeliveryOrderStatus.PackageReady;
    //   updateDeliveryOrderStatus(deliveryOrder);
    // }
    // if (deliveryOrder.deliveryDriver && deliveryOrder.deliveryDriver.user?.firebaseId) {
    //   notification.linkUrl = orderUrl(OrderType.Restaurant, order.orderId!);
    //   pushNotification(deliveryOrder.deliveryDriver.user.firebaseId, 
    //     notification, 
    //     deliveryOrder.deliveryDriver.notificationInfo,
    //     ParticipantType.DeliveryDriver,
    //     deliveryOrder.deliveryDriver.user?.language,
    //   );
    // }
  }
}

export async function setWeight(userId: number, data: any) {

  if (data.costsByType == null) {
    return {
      status: ServerResponseStatus.Error,
      errorMessage: `Expected costsByType`,
      errorCode: "orderIdNotGiven"
    }
  }

  await passChecksForLaundry(data.orderId, userId);


  let order: LaundryOrder = await getLaundryOrder(data.orderId)

  if (order.status != LaundryOrderStatus.AtLaundry) {
    return {
      ok: false,
      error: {
        status: ServerResponseStatus.Error,
        errorMessage: `Order weight can only be changed when status is at laundry`,
        errorCode: "orderNotAtLaundry"
      }
    }
  }

  let orderId = data.orderId;
  // order.costsByType = data.costsByType;
  // order.cost = order.shippingCost + order.costsByType?.weighedCost

  // customerNodes.inProcessOrders(order.customer.firebaseId!, orderId).update(order);
  // await laundryNodes.inProcessOrders(order.laundry.firebaseId, orderId).update(order);
  rootDbNodes.inProcessOrders(OrderType.Laundry, orderId).update(order);
  // if (order.dropoffDriver)
  //   deliveryDriverNodes.inProcessOrders(order.dropoffDriver.firebaseId, orderId).update(order);

  return { status: ServerResponseStatus.Success }
};

export async function setEstimatedLaundryReadyTime(userId: number, data: any) {

  if (data.estimatedLaundryReadyTime == null) {
    return {
      status: ServerResponseStatus.Error,
      errorMessage: `Expected estimatedLaundryReadyTime`,
      errorCode: "orderIdNotGiven"
    }
  }

  await passChecksForLaundry(data.orderId, userId);


  let order: LaundryOrder = await getLaundryOrder(data.orderId)

  let orderId = data.orderId;
  // order.estimatedLaundryReadyTime = data.estimatedLaundryReadyTime;

  // customerNodes.inProcessOrders(order.customer.firebaseId!, orderId).update(order);
  // await laundryNodes.inProcessOrders(order.laundry.firebaseId, orderId).update(order);
  rootDbNodes.inProcessOrders(OrderType.Laundry, orderId).update(order);
  // if (order.dropoffDriver)
  //   deliveryDriverNodes.inProcessOrders(order.dropoffDriver.firebaseId, orderId).update(order);

  return { status: ServerResponseStatus.Success }
};
