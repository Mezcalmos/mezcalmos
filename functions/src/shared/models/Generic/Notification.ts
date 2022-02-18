import { fcmNotification } from "../../../utilities/senders/fcm";
import { Language } from "./Generic";
import { OrderType } from "./Order";
import { UserInfo } from "./User";

export enum NotificationType {
  NewOrder = "newOrder",
  OrderStatusChange = "orderStatusChange",
  NewMessage = "newMessage"
}

export enum NotificationAction {
  ShowPopUp = "showPopUp",
  ShowSnackBarAlways = "showSnackbarAlways",
  ShowSnackbarOnlyIfNotOnPage = "showSnackbarOnlyIfNotOnPage"
}

export interface Notification {
  foreground: ForegroundNotification,
  background: BackgroundNotification
}

export interface ForegroundNotification {
  time: string,
  notificationType: NotificationType,
  notificationAction: NotificationAction
}

export type BackgroundNotification = Record<Language, fcmNotification>

export interface NewMessageNotification extends ForegroundNotification {
  chatId: string,
  sender: UserInfo,
  message: string,
  orderId: string
}

export interface OrderNotification extends ForegroundNotification {
  orderType: OrderType,
  orderId: string,
}