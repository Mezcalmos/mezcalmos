
const notification = require("../notification");
module.exports = ( firebase, uid, data ) => { return finish(firebase, uid, data) }

async function finish(firebase, orderId) {
  let order = (await firebase.database().ref(`/orders/taxi/${orderId}`).once('value')).val();
  if (order == null) {
    return {
      status: "Error",
      errorMessage: "Order id does not match any order"
    }
  }

  if (order.status != "inTransit") {
    return {
      status: "Error",
      errorMessage: "Ride status is not inTransit but " + order.status
    }
  }

  let update = {
    status: "droppedOff",
    rideFinishTime: (new Date()).toUTCString()
  }
  firebase.database().ref(`/orders/taxi/${orderId}`).update(update)
  firebase.database().ref(`/users/${order.customer.id}/orders/${orderId}`).update(update);
  firebase.database().ref(`/taxiDrivers/${order.driver.id}/orders/${orderId}`).update(update);
  firebase.database().ref(`/taxiDrivers/${order.driver.id}/state/currentOrder`).remove()
  firebase.database().ref(`/users/${order.customer.id}/state/currentOrder`).remove()
  firebase.database().ref(`/inProcessOrders/taxi/${orderId}`).remove();
  firebase.database().ref(`/fulfilledOrders/${orderId}`).set(order)
  update.notificationType = "orderStatusChange"
  update.orderId = orderId
  update.orderType = "taxi"
  update.time = update.rideFinishTime
  delete update.rideFinishTime
  notification.push(firebase, order.customer.id, update)


  promoters.checkCustomerIncentives(firebase, order.customer, order.driver)
  promoters.checkDriverIncentives(firebase, order.customer, order.driver)

  return {
    status: "Success"
  };
}