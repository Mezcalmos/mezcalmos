import { NotificationAction, NotificationType, OrderNotification } from "../models/Notification";
import { OrderType } from "../models/Order";
import * as fcm from "../../utilities/senders/fcm"
import { DeliveryAdmin } from "../models/DeliveryAdmin";

import { ParticipantType } from "../models/Chat";
import { NewRestaurantOrderNotification, RestaurantOrderStatus, RestaurantOrderStatusChangeNotification } from "../../restaurant/models/RestaurantOrder";
import * as foreground from "../../utilities/senders/foreground";
import { UserInfo } from "../models/User";

export async function notifyDeliveryAdminsNewOrder(
  deliveryAdmins: Record<string, DeliveryAdmin>,
  orderId: string,
  restaurant: UserInfo) {
  let foregroundNotificaiton: NewRestaurantOrderNotification = {
    time: (new Date()).toISOString(),
    notificationType: NotificationType.NewOrder,
    orderType: OrderType.Restaurant,
    orderId: orderId,
    notificationAction: NotificationAction.ShowSnackBarAlways,
    restaurant: restaurant
  }

  let fcmNotification: fcm.fcmPayload = {
    token: [],
    payload: {
      notification: {
        title: "Nueva Pedido",
        body: `Hay una nueva orden de alimento`,
        tag: NotificationType.NewOrder
      }
    },
    options: {
      priority: fcm.NotificationPriority.High
    }
  };
  notifyDeliveryAdmins(deliveryAdmins, foregroundNotificaiton, fcmNotification);
}

export async function notifyDeliveryAdminsCancelledOrder(deliveryAdmins: Record<string, DeliveryAdmin>,
  orderId: string) {
  let foregroundNotificaiton: RestaurantOrderStatusChangeNotification = {
    status: RestaurantOrderStatus.CancelledByCustomer,
    time: (new Date()).toISOString(),
    notificationType: NotificationType.OrderStatusChange,
    orderType: OrderType.Restaurant,
    notificationAction: NotificationAction.ShowPopUp,
    orderId: orderId,
  }

  let fcmNotification: fcm.fcmPayload = {
    token: [],
    payload: {
      notification: {
        title: "Pedido Cancellado",
        body: `Hay un pedido que es cancelado`,
        tag: NotificationType.OrderStatusChange
      }
    },
    options: {
      priority: fcm.NotificationPriority.High
    }
  };
  notifyDeliveryAdmins(deliveryAdmins, foregroundNotificaiton, fcmNotification);
}

async function notifyDeliveryAdmins(
  deliveryAdmins: Record<string, DeliveryAdmin>,
  foregroundNotificaiton: OrderNotification,
  fcmNotification: fcm.fcmPayload) {
  let notificationTokens: Array<string> = [];
  for (let adminId in deliveryAdmins) {
    let payload: foreground.fgPayload = {
      particpantType: ParticipantType.DeliveryAdmin,
      userId: adminId,
      notification: foregroundNotificaiton
    }
    foreground.push(payload)
    let admin: DeliveryAdmin = deliveryAdmins[adminId]
    if (admin.notificationInfo?.deviceNotificationToken) {
      notificationTokens.push(admin.notificationInfo.deviceNotificationToken);
    }
  }
  fcmNotification.token = notificationTokens;
  fcm.push(fcmNotification);
}