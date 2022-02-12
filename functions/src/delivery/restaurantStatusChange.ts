import * as functions from "firebase-functions";
import { AuthData } from "firebase-functions/lib/common/providers/https";
import { ServerResponse, ServerResponseStatus } from "../shared/models/Generic/Generic";
import { OrderType } from "../shared/models/Generic/Order";
import { RestaurantOrderStatusChangeNotification, RestaurantOrder, RestaurantOrderStatus } from "../shared/models/Services/Restaurant/RestaurantOrder";
import * as restaurantNodes from "../shared/databaseNodes/restaurant";
import * as customerNodes from "../shared/databaseNodes/customer";
import *  as rootDbNodes from "../shared/databaseNodes/root";
import * as deliveryDriverNodes from "../shared/databaseNodes/deliveryDriver";
import { Notification, NotificationAction, NotificationType } from "../shared/models/Generic/Notification";
import { pushNotification } from "../shared/notification/notifyUser";
import { isSignedIn } from "../shared/helper/authorizer";
import { restaurantOrderStatusChangeMessages } from "../restaurant/bgNotificationMessages";
import { finishOrder } from "../restaurant/helper";

let statusArrayInSeq: Array<RestaurantOrderStatus> =
  [
    RestaurantOrderStatus.ReadyForPickup,
    RestaurantOrderStatus.OnTheWay,
    RestaurantOrderStatus.Delivered
  ]

export const startDelivery = functions.https.onCall(async (data, context) => {
  let response: ServerResponse = await changeStatus(data, RestaurantOrderStatus.OnTheWay, context.auth)
  return response
});

export const finishDelivery = functions.https.onCall(async (data, context) => {
  let response: ServerResponse = await changeStatus(data, RestaurantOrderStatus.Delivered, context.auth)
  return response
});

function expectedPreviousStatus(status: RestaurantOrderStatus): RestaurantOrderStatus {
  return statusArrayInSeq[statusArrayInSeq.findIndex((element) => element == status) - 1];
}

async function changeStatus(data: any, newStatus: RestaurantOrderStatus, auth?: AuthData): Promise<ServerResponse> {

  let response = await isSignedIn(auth)
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
  let deliveryDriverId: string = auth!.uid;
  let order: RestaurantOrder = (await rootDbNodes.inProcessOrders(OrderType.Restaurant, orderId).once('value')).val();
  if (order == null) {
    return {
      status: ServerResponseStatus.Error,
      errorMessage: `Order does not exist`,
      errorCode: "orderDontExist"
    }
  }

  if (order.dropoffDriver.id != deliveryDriverId) {
    return {
      status: ServerResponseStatus.Error,
      errorMessage: `Order does not belong to this delivery driver`,
    }
  }

  if (expectedPreviousStatus(newStatus) != order.status) {
    return {
      status: ServerResponseStatus.Error,
      errorMessage: `Status is not ${expectedPreviousStatus(newStatus)} but ${order.status}`,
      errorCode: "invalidOrderStatus"
    }
  }

  order.status = newStatus

  let notification: Notification = {
    foreground: <RestaurantOrderStatusChangeNotification>{
      status: newStatus,
      time: (new Date()).toISOString(),
      notificationType: NotificationType.OrderStatusChange,
      orderType: OrderType.Restaurant,
      notificationAction: NotificationAction.ShowPopUp,
      orderId: orderId
    },
    background: restaurantOrderStatusChangeMessages[newStatus]
  }

  pushNotification(order.customer.id!, notification);

  if (newStatus == RestaurantOrderStatus.Delivered) {
    await finishOrder(order, orderId);
  } else {
    customerNodes.inProcessOrders(order.customer.id!, orderId).update(order);
    restaurantNodes.inProcessOrders(order.customer.id!, orderId).update(order);
    rootDbNodes.inProcessOrders(OrderType.Restaurant, orderId).update(order);
    await deliveryDriverNodes.inProcessOrders(deliveryDriverId, orderId).update(order)
  }
  return { status: ServerResponseStatus.Success }
}