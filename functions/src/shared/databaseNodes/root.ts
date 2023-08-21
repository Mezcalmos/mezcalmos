import * as firebase from "firebase-admin";
import { OrderType } from "../models/Generic/Order";
import { ParticipantType } from "../models/Generic/Chat";

export function notificationsNode(particpantType: ParticipantType, firebaseUserId: string) {
  return firebase.database().ref(`/notifications/${particpantType}/${firebaseUserId}`)
}

export function userInfoNode(userId: string) {
  return firebase.database().ref(`/users/${userId}/info`)
}

const participantTypeToNodeMap: { [id in ParticipantType]: string } = {
  [ParticipantType.Customer]: "customers",
  [ParticipantType.DeliveryOperator]: "deliveryAdmins",
  [ParticipantType.TaxiDriver]: "taxis",
  [ParticipantType.DeliveryDriver]: "deliveryDrivers",
  [ParticipantType.LaundryOperator]: "operators/laundry",
  [ParticipantType.RestaurantOperator]: "operators/restaurant",
  [ParticipantType.MezAdmin]: "medAdmins",
  [ParticipantType.BusinessOperator]: "operators/business"
};

export function notificationInfoNode(participantType: ParticipantType, userId: string) {
  return firebase.database().ref(`/${participantTypeToNodeMap[participantType]}/info/${userId}/notificationInfo`);
}

export function inProcessOrders(orderType?: OrderType, orderId?: string) {
  return orders(OrderStatus.InProcess, orderType, orderId);
}

export function openOrders(orderType: OrderType, orderId?: string) {
  return orders(OrderStatus.Open, orderType, orderId);
}

export function pastOrders(orderType: OrderType, orderId?: string) {
  return orders(OrderStatus.PastOrders, orderType, orderId);
}

export function notificationsQueueNode(notificationId?: string) {
  let dbNode: string = `notificationQueue2`
  if (notificationId != undefined) {
    dbNode += `/${notificationId}`
  }
  return firebase.database().ref(dbNode);
}

enum OrderStatus {
  InProcess = "inProcess",
  Open = "open",
  PastOrders = "past"
}

function orders(orderStatus: OrderStatus, orderType?: OrderType, orderId?: string) {
  let dbNode: string = `orders/${orderStatus}`
  if (orderType != undefined) {
    dbNode += `/${orderType}`
  }
  if (orderId != undefined) {
    dbNode += `/${orderId}`
  }
  return firebase.database().ref(dbNode);
}