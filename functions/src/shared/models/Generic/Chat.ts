import { OrderType } from "./Order";
import { UserInfo } from "./User";


export interface Chat {
  chatType: ChatType;
  orderType?: OrderType;
  chatId: string;
  orderId?: string;
  messages?: Record<string, Message>;
  participants: Record<string, Participant>;
}

export enum ChatType {
  Order = "order",
}

export enum ParticipantType {
  Customer = "customer",
  Taxi = "taxi",
  // TaxiAdmin = "taxiAdmin",
  DeliveryAdmin = "deliveryAdmin",
  Restaurant = "restaurant",
  DeliveryDriver = "deliveryDriver"
}

export interface Participant extends UserInfo {
  particpantType: ParticipantType
}

export interface Message {
  chatId: string;
  orderId: string;
  userId: string;
  notified?: boolean;
  message: string,
  timestamp: string
}

export async function buildChatForOrder(
  orderId: string,
  customerId: string,
  customerInfo: Participant,
  serviceProviderId: string,
  serviceProviderInfo: Participant,
  orderType: OrderType): Promise<Chat> {
  let chat: Chat = {
    orderId: orderId,
    chatId: orderId,
    chatType: ChatType.Order,
    orderType: orderType,
    participants: {
      [customerId]: customerInfo,
      [serviceProviderId]: serviceProviderInfo,
    }
  }
  return chat;
}