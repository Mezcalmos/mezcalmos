import * as functions from "firebase-functions";
import { AuthData } from "firebase-functions/lib/common/providers/https";
import { ServerResponse, ServerResponseStatus } from "../shared/models/Generic/Generic";
import { OrderType } from "../shared/models/Generic/Order";
import { orderInProcess, LaundryOrderStatus, LaundryOrder, LaundryOrderStatusChangeNotification } from "../shared/models/Services/Laundry/LaundryOrder";
import * as customerNodes from "../shared/databaseNodes/customer";
import *  as rootDbNodes from "../shared/databaseNodes/root";
import * as deliveryDriverNodes from "../shared/databaseNodes/deliveryDriver";
import * as laundryNodes from "../shared/databaseNodes/services/laundry";
import { checkDeliveryAdmin, isSignedIn } from "../shared/helper/authorizer";
import { finishOrder } from "./helper";
import { Notification, NotificationAction, NotificationType } from "../shared/models/Notification";
import { pushNotification } from "../utilities/senders/notifyUser";
import { LaundryOrderStatusChangeMessages } from "./bgNotificationMessages";
import { ParticipantType } from "../shared/models/Generic/Chat";
import { orderUrl } from "../utilities/senders/appRoutes";

let statusArrayInSeq: Array<LaundryOrderStatus> =
  [LaundryOrderStatus.OrderReceieved,
  LaundryOrderStatus.OtwPickup,
  LaundryOrderStatus.PickedUp,
  LaundryOrderStatus.AtLaundry,
  LaundryOrderStatus.ReadyForDelivery,
  LaundryOrderStatus.OtwDelivery,
  LaundryOrderStatus.Delivered
  ]

export const cancelOrder =
  functions.https.onCall(async (data, context) => {
    let response: ServerResponse = await changeStatus(data, LaundryOrderStatus.CancelledByAdmin, context.auth)
    return response;
  });

export const readyForDeliveryOrder = functions.https.onCall(async (data, context) => {
  let response: ServerResponse = await changeStatus(data, LaundryOrderStatus.ReadyForDelivery, context.auth)
  return response
});

function expectedPreviousStatus(status: LaundryOrderStatus): LaundryOrderStatus {
  return statusArrayInSeq[statusArrayInSeq.findIndex((element) => element == status) - 1];
}

async function changeStatus(data: any, newStatus: LaundryOrderStatus, auth?: AuthData): Promise<ServerResponse> {

  let response = await isSignedIn(auth)
  if (response != undefined) {
    return response;
  }

  response = await checkDeliveryAdmin(auth!.uid)
  if (response != undefined) {
    return response;
  }

  if (data.orderId == null) {
    return {
      status: ServerResponseStatus.Error,
      errorMessage: `Expected order id`,
      errorCode: "orderIdNotGiven"
    }
  }

  let orderId: string = data.orderId;
  let order: LaundryOrder = (await rootDbNodes.inProcessOrders(OrderType.Laundry, orderId).once('value')).val();
  if (order == null) {
    return {
      status: ServerResponseStatus.Error,
      errorMessage: `Order does not exist`,
      errorCode: "orderDontExist"
    }
  }

  // TO ADD: when customers choose their laundry
  // if (order.serviceProviderId == null) {
  //   return {
  //     status: ServerResponseStatus.Error,
  //     errorMessage: `Order does not have a laundry`,
  //     errorCode: "laundryDontExist"
  //   }
  // }

  if (newStatus == LaundryOrderStatus.CancelledByAdmin) {
    if (!orderInProcess(order.status))
      return {
        status: ServerResponseStatus.Error,
        errorMessage: `Order cannot be cancelled because it is not in process`,
        errorCode: "orderNotInProcess"
      }
  } else if (expectedPreviousStatus(newStatus) != order.status) {
    return {
      status: ServerResponseStatus.Error,
      errorMessage: `Status is not ${expectedPreviousStatus(newStatus)} but ${order.status}`,
      errorCode: "invalidOrderStatus"
    }
  }

  if (newStatus == LaundryOrderStatus.ReadyForDelivery && order.dropoffDriver == null) {
    return {
      status: ServerResponseStatus.Error,
      errorMessage: `Order cannot be ready for delivery when drop off driver is null`,
    }
  }

  order.status = newStatus
  if (newStatus == LaundryOrderStatus.CancelledByAdmin)
    await finishOrder(order, orderId);
  else if (newStatus == LaundryOrderStatus.ReadyForDelivery) {
    customerNodes.inProcessOrders(order.customer.id!, orderId).update(order);
    laundryNodes.inProcessOrders(order.laundry.id).update(order);
    await rootDbNodes.inProcessOrders(OrderType.Laundry, orderId).update(order);
    deliveryDriverNodes.inProcessOrders(order.dropoffDriver.id, orderId).update(order);
  }

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
    linkUrl: orderUrl(ParticipantType.Customer, OrderType.Laundry, orderId)
  }

  pushNotification(order.customer.id!, notification);


  notification.linkUrl = orderUrl(ParticipantType.DeliveryDriver, OrderType.Laundry, orderId)  
  if (order.dropoffDriver)
    pushNotification(order.dropoffDriver.id!, notification, ParticipantType.DeliveryDriver);
  else if (order.pickupDriver)
    pushNotification(order.pickupDriver.id!, notification, ParticipantType.DeliveryDriver);

  return { status: ServerResponseStatus.Success }
}


// export const assignToLaundry = functions.https.onCall(async (data, context) => {

//   let response = await isSignedIn(context.auth)
//   if (response != undefined) {
//     return response;
//   }

//   response = await checkDeliveryAdmin(context.auth!.uid)
//   if (response != undefined) {
//     return response;
//   }

//   if (data.orderId == null) {
//     return {
//       status: ServerResponseStatus.Error,
//       errorMessage: `Expected order id`,
//       errorCode: "orderIdNotGiven"
//     }
//   }

//   if (data.laundryId == null) {
//     return {
//       status: ServerResponseStatus.Error,
//       errorMessage: `Expected laundry id`,
//       errorCode: "orderIdNotGiven"
//     }
//   }

//   let orderId: string = data.orderId;
//   let laundryId: string = data.laundryId;
//   let order: LaundryOrder = (await rootDbNodes.inProcessOrders(OrderType.Laundry, orderId).once('value')).val();
//   if (order == null) {
//     return {
//       status: ServerResponseStatus.Error,
//       errorMessage: `Order does not exist`,
//       errorCode: "orderDontExist"
//     }
//   }

//   if (order.serviceProviderId != null) {
//     return {
//       status: ServerResponseStatus.Error,
//       errorMessage: `Order already has a laundry`,
//       errorCode: "laundryAlreadyExist"
//     }
//   }

//   let laundry: Laundry = await getLaundry(laundryId);
//   if (laundry == null) {
//     return {
//       status: ServerResponseStatus.Error,
//       errorMessage: `Laundry does not exist`,
//       errorCode: "laundryDontExist"
//     }
//   }

//   order.serviceProviderId = laundryId;
//   order.laundry = laundry.info;
  
//   customerNodes.inProcessOrders(order.customer.id!, orderId).update(order);
//   await rootDbNodes.inProcessOrders(OrderType.Laundry, orderId).update(order);
//   return response
// });