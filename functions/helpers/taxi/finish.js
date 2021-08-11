
const promoters = require('../promoters');
const notification = require("../notification");
module.exports = ( firebase, uid, data ) => { return finish(firebase, uid, data) }

async function finish(firebase, uid) {
  
  let orderId = (await firebase.database().ref(`/taxiDrivers/${uid}/state/currentOrder`).once('value')).val();
  if (orderId == null) {
    return {
      status: "Error",
      errorMessage: "Driver has not accepted any ride"
    }
  }

  let response = await firebase.database().ref(`orders/taxi/${orderId}`).transaction(function(order){
    if(order != null){
      if(order.lock == null){
        order.lock = true
      } else{
        console.log('attempt to finish ride');
        return
      }
    }
    return order
  })
  if(!response.committed){
    return{
      status: 'Error',
      errorMessage: 'attempt to finish ride but locked'
    }
  }

  order = response.snapshot.val()
  
  if (order.status != "inTransit") {
    firebase.database().ref(`orders/taxi/${orderId}/lock`).remove()
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

  firebase.database().ref(`orders/taxi/${orderId}/lock`).remove()
  return {
    status: "Success",
    message: "finished"
  };
}