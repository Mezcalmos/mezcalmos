const notification = require("../notification");

const functions = require("firebase-functions");
const firebase = require("firebase-admin");


const keys = require("../keys").keys()
const hasuraModule = require("../hasura");

const hasura = new hasuraModule.Hasura(keys.hasura)

module.exports = functions.https.onCall(async (data, context) => {
  if (!context.auth) {
    return {
      status: "Error",
      errorMessage: "User needs to be signed in"
    }
  }
  let response = await request(firebase, context.auth.uid, data, hasura)
  return response
});


module.exports = ( firebase, uid, data, hasura) => { return request(firebase, uid, data, hasura) }

async function request(firebase, uid, data, hasura) {
  if (!data.from || !data.to || !data.distance || !data.duration
    || !data.estimatedPrice || !data.paymentType || !data.polyline) {
    return {
      status: "Error",
      errorMessage: "Required from, to, distance, duration, polyline, estimatedPrice and paymentType"
    }
  }

  // response = await firebase.database().ref(`users/${uid}/lock`).transaction(function (lock) {
  //   if (lock == true) {
  //     return
  //   } else {
  //     return true
  //   }
  // })

  // if (!response.committed) {
  //   return {
  //     status: 'Error',
  //     errorMessage: 'can not request in the middle of another request'
  //   }
  // }

  // let customerCurrentOrder = (await firebase.database().ref(`/users/${uid}/state/currentOrder`).once('value')).val();

  // if (customerCurrentOrder) {
  //   firebase.database().ref(`users/${uid}/lock`).remove()
  //   return {
  //     status: "Error",
  //     errorMessage: "Customer is already in another taxi"
  //   }
  // }

  notification.notifyDriversNewRequest(firebase);

  let user = (await firebase.database().ref(`/users/${uid}/info`).once('value')).val();

  let payload = {
    from: data.from,
    to: data.to,
    distance: data.distance,
    duration: data.duration,
    polyline: data.polyline,
    estimatedPrice: data.estimatedPrice,
    customer: {
      id: uid,
      name: user.displayName.split(' ')[0],
      image: user.photo
    },
    orderType: "taxi",
    status: "lookingForTaxi",
    orderTime: (new Date()).toISOString(),
    paymentType: data.paymentType,
    routeInformation: {
      duration: data.duration,
      distance: data.distance,
      polyline: data.polyline
    }
  }
  let orderRef = await firebase.database().ref(`/orders/taxi`).push(payload);
  firebase.database().ref(`/customers/${uid}/orders/${orderRef.key}`).set(payload);
  firebase.database().ref(`/openOrders/taxi/${orderRef.key}`).set(payload);
  await firebase.database().ref(`/customers/inProcessOrders/${uid}/${orderRef.key}`).set(payload);
  let chat = {
    participants: {},
    chatType: "order",
    orderType: "taxi"
  }
  chat.participants[uid] = {
    name: user.displayName.split(' ')[0],
    image: user.photo,
    particpantType: "customer",
    phoneNumber: (user.phoneNumber) ? user.phoneNumber : null
  }
  firebase.database().ref(`/chat/${orderRef.key}`).set(chat);
  // firebase.database().ref(`users/${uid}/lock`).remove()
       
  let req = await hasura.insertOrder({
    order: {
      orderId: orderRef.key,
      customerId: uid,
      orderTime: payload.orderTime,
      finalStatus: payload.status,
      pickUpLocation: { type: "Point", coordinates: [payload.from.lng, payload.from.lat] },
      dropOffLocation: { type: "Point", coordinates: [payload.to.lng, payload.to.lat] },
      offeredPrice: payload.estimatedPrice
    }
  })

  console.log(req)

  return {
    status: "Success",
    orderId: orderRef.key
  }
}