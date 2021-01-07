module.exports = { request, accept }

//possible statuses: lookingForTaxi, onTheWay, inTransit, droppedOff
async function request(admin, data, uid) {
  let payload = {}
  if(!data.from) {
    return { status:"Error", errorMessage: "Required from location"}
  }
  // Check valid values for from
  payload.from = data.from;
  if(data.to) {
    // Check valid values for to
    payload.to = data.to;
  }
  let user = (await admin.database().ref(`/users/${uid}/info`).once('value')).val();
  payload.customer = {
    id: uid,
    name: user.displayName.split(' ')[0],
    image: user.photo
  }
  payload.orderType = "taxi";
  payload.status = "lookingForTaxi";
  payload.orderTime = (new Date()).toUTCString();
  let orderRef = await admin.database().ref(`/orders/taxi`).push(payload);
  admin.database().ref(`/users/${uid}/orders/${orderRef.key}`).set({
    orderType: "taxi", status: "lookingForTaxi", orderTime: payload.orderTime
  });
  admin.database().ref(`/openOrders/taxi/${orderRef.key}`).set({from:payload.from, to:payload.to});
  admin.database().ref(`/chat/${orderRef.key}/participants/${uid}`).set({
    name: user.displayName.split(' ')[0],
    image: user.photo
  });
  admin.database().ref(`/chat/${orderRef.key}/orderType`).set("taxi");
  return { status:"Success", orderId: orderRef.key}
}

async function accept(admin, data, uid) {
  // TODO: dont let user accept second taxi order
  if(!data.orderId) {
    return { status:"Error", errorMessage: "Required orderId"}
  }
  let authorizedDriver = (await admin.database().ref(`/taxiDrivers/${uid}/authorized`).once('value')).val();
  if(!authorizedDriver) {
    return { status:"Error", errorMessage: "User is not an authorized"}
  }

  let driver = (await admin.database().ref(`/users/${uid}/info`).once('value')).val();
  let response = await admin.database().ref(`/orders/taxi/${data.orderId}`).transaction(function(order) {
    console.log(order)
    if (order != null) {
      console.log(order.status)
			if (order.status == "lookingForTaxi"){ 
				console.log(`${data.orderId} lookingForTaxi`)        
        order.status = 'onTheWay';
        order.driver = {
          id: uid,
          name: driver.displayName.split(' ')[0],
          image: driver.photo
        }
        return order
			} else {
				console.log(`${data.orderId} status is not lookingForTaxi but ${order.status}`)
				return;
			}
		}
		return order;
  })
  
  if (!response.committed) {
		console.log(`${data.orderId} taxi request failure`)
		return { status:"Error", reason:"Ride is not available, please try accepting another ride" };  
	} else {
    console.log(`${data.orderId} taxi request success`)
    admin.database().ref(`/taxiDrivers/${uid}/orders/${data.orderId}`).set(true);
    admin.database().ref(`/openOrders/taxi/${data.orderId}`).remove();
    await admin.database().ref(`/chat/${data.orderId}/participants/${uid}`).set({
      name: driver.displayName.split(' ')[0],
      image: driver.photo
    });
		return { status:"Success" }; 
	}
}
