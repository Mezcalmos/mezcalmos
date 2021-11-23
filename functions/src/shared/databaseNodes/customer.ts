import * as firebase from "firebase-admin";

export function cart(customerId: string) {
  return firebase.database().ref(`/customers/info/${customerId}/cart`)
}

export function lock(customerId: string) {
  return firebase.database().ref(`/customers/info/${customerId}/lock`)
}

export function notificationInfo(customerId: string) {
  firebase.database().ref(`/customers/info/${customerId}/notificationInfo`);
}

export function pastOrders(customerId: string, orderId?: string) {
  let dbNode: string = `/customers/pastOrders/${customerId}`
  if (orderId != undefined) {
    dbNode += `/${orderId}`
  }
  return firebase.database().ref(dbNode);
}

export function inProcessOrders(customerId: string, orderId?: string) {
  let dbNode: string = `/customers/inProcessOrders/${customerId}`
  if (orderId != undefined) {
    dbNode += `/${orderId}`
  }
  return firebase.database().ref(dbNode);
}



