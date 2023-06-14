import { NotificationForQueue } from "../Notification";
import { AppType, NotificationInfo } from "./Generic";
import { OrderType } from "./Order";
import { UserInfo } from "./User";

export type Participants = { [key in ParticipantType]?: Record<string, Participant> };


export enum ChatType {
  Direct = "direct",
  Group = "group"
}

export enum ChatInfoAppName {
  CustomerApp = "CustomerApp",
  DeliveryAdminApp = "DeliveryAdminApp",
  DeliveryApp = "DeliveryApp",
  MezAdminApp = "MezAdminApp",
  RestaurantApp = "RestaurantApp",
  LaundryApp = "LaundryApp",
  BusinessApp = "BusinessApp"
}

export const AppTypeToChatInfoAppName: Record<AppType, ChatInfoAppName> = {
  [AppType.Customer]: ChatInfoAppName.CustomerApp,
  [AppType.DeliveryAdmin]: ChatInfoAppName.DeliveryAdminApp,
  [AppType.Delivery]: ChatInfoAppName.DeliveryApp,
  [AppType.MezAdmin]: ChatInfoAppName.MezAdminApp,
  [AppType.Business]: ChatInfoAppName.BusinessApp,
  [AppType.Restaurant]: ChatInfoAppName.RestaurantApp,
  [AppType.Laundry]: ChatInfoAppName.LaundryApp,
}

export interface ChatInfo {
  chatTitle: string,
  chatImage: string,
  phoneNumber?: string,
  participantType?: ParticipantType,
  parentLink?: string
}

export enum ParticipantType {
  Customer = "customer",
  Taxi = "taxi",
  DeliveryOperator = "deliveryOperator",
  DeliveryDriver = "deliveryDriver",
  LaundryOperator = "laundryOperator",
  RestaurantOperator = "restaurantOperator",
  MezAdmin = "mezAdmin",
  BusinessOperator = "businessOperator",
}

export enum RecipientType {
  Customer = "customer",
  DeliveryDriver = "deliveryDriver",
  Laundry = "laundry",
  Restaurant = "restaurant",
  Business = "business",
  DeliveryCompany = "deliveryCompany",
}

export const RecipientTypeToChatInfoAppName: Record<RecipientType, ChatInfoAppName> = {
  [RecipientType.Customer]: ChatInfoAppName.CustomerApp,
  [RecipientType.DeliveryCompany]: ChatInfoAppName.DeliveryAdminApp,
  [RecipientType.DeliveryDriver]: ChatInfoAppName.DeliveryApp,
  [RecipientType.Business]: ChatInfoAppName.BusinessApp,
  [RecipientType.Restaurant]: ChatInfoAppName.RestaurantApp,
  [RecipientType.Laundry]: ChatInfoAppName.LaundryApp,
}
export const RecipientAppType: Record<RecipientType, AppType> = {
  [RecipientType.Customer]: AppType.Customer,
  [RecipientType.DeliveryCompany]: AppType.DeliveryAdmin,
  [RecipientType.DeliveryDriver]: AppType.Delivery,
  [RecipientType.Business]: AppType.Business,
  [RecipientType.Restaurant]: AppType.Restaurant,
  [RecipientType.Laundry]: AppType.Laundry,
}

export const AppParticipant: Record<AppType, ParticipantType> = {
  [AppType.Customer]: ParticipantType.Customer,
  [AppType.DeliveryAdmin]: ParticipantType.DeliveryOperator,
  [AppType.Delivery]: ParticipantType.DeliveryDriver,
  [AppType.MezAdmin]: ParticipantType.MezAdmin,
  [AppType.Business]: ParticipantType.BusinessOperator,
  [AppType.Restaurant]: ParticipantType.RestaurantOperator,
  [AppType.Laundry]: ParticipantType.LaundryOperator
}


export function getAppTypeFromParticipantType(participantType: ParticipantType): AppType {
  return Object.keys(AppParticipant).filter(function(key) {return AppParticipant[key as AppType] === participantType})[0] as AppType;
}


export interface Chat {
  chatId: number,
  chatInfo: Partial<Record<ChatInfoAppName, ChatInfo>>,
  messages?: Array<Message>
  chatType: ChatType
  participants?: Array<Participant>;
  isServiceProviderChat?: boolean;
}

export interface Participant extends UserInfo {
  participantType: ParticipantType,
  notificationInfo: NotificationInfo | null
}

export interface Message {
  userId: string;
  message: string,
  timestamp: string
}


export interface MessageNotificationForQueue extends NotificationForQueue {
  message: string,
  userId: number,
  chatId: number,
  chatType: ChatType,
  participantType: ParticipantType,
  messageId: number,
  orderId?: number,
  orderType: OrderType
}

export enum CallNotificationtType {
  Incoming = "incoming",
  EndCall = "endCall"

}
export interface CallNotificationForQueue extends NotificationForQueue {
  chatId: number,
  callerId: number,
  callerParticipantType: ParticipantType,
  recipientId: number,
  recipientParticipantType: ParticipantType,
  callNotificationType: CallNotificationtType,
}

export interface ParticipantAgoraDetails {
  uid: number,
  token: string,
  expirationTime: string
}

export interface ParticipantWithAgora extends Participant {
  agora: ParticipantAgoraDetails
}
