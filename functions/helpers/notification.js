const functions = require('firebase-functions');
const sender = require("./sender")
const keys = require("./keys")
module.exports = {
  push,
  notifyDriversNewRequest,
  sendTest,
  notifyPromoterOfCustomerConversion,
  notifyPromoterOfDriverConversion,
  notifyPromoterOfCustomerReferral,
  notifyPromoterOfDriverReferral,
  notifyPromoterOfSignup
}

const webpush = require('web-push')
const vapidKeys = keys.keys().vapidkeys
webpush.setVapidDetails(
  'http://www.mezcalmos.com',
  vapidKeys.public,
  vapidKeys.private
)

async function push(firebase, userId, message, particpantType = "customer") {
  firebase.database().ref(`/notifications/${particpantType}/${userId}`).push(message)
  let subscription
  if(particpantType == "customer") {
    subscription = (await firebase.database().ref(`/users/${userId}/notificationInfo`).once('value')).val();
  } else if(particpantType == "taxi") {
    subscription = (await firebase.database().ref(`/taxiDrivers/${userId}/notificationInfo`).once('value')).val();
  }
  if(subscription){
    webpush.sendNotification(subscription, JSON.stringify(message))
    .catch((e) => {
      functions.logger.error(`web push error, ${particpantType} ${userId}`, e);
    })
  }
}

async function notifyDriversNewRequest(firebase, address) {
  drivers = (await firebase.database().ref(`/taxiDrivers`).once('value')).val();
  for (let driverId in drivers){
    let driver = drivers[driverId]
    if(driver.state && driver.state.isLooking && !driver.state.currentOrder) {
      if(driver.notificationInfo) {   
        webpush.sendNotification(driver.notificationInfo, JSON.stringify({
          notificationType: "newOrder",
          message: `Hay una nueva orden de taxi de ${address}, vea si puede aceptarla.`
        })).catch((e) => {
          functions.logger.error(`notify drivers web push error, ${driverId}`, e);
        })
      }
    }
  }

  users = (await firebase.database().ref(`/users`).once('value')).val();
  for (let driverId in drivers){
    let driver = drivers[driverId]
    let user = users[driverId]
    
    if(driver.state && driver.state.isLooking && !driver.state.currentOrder) {
      if(user.info.iphone && user.info.phoneNumber){     
        sender.sendSMS({
          message: `Hay una nueva orden de ${address}`,
          phoneNumber: user.info.phoneNumber
        }).catch(function(e){
          functions.logger.error(`send sms error ${user.info.disp}`, e)
        })
      }
    }
  }
}

async function notifyPromoterOfCustomerConversion(customerName, promoter) {
  sender.sendSMS({
    message: `Hola, ${promoter.name}, tu referido cliente ${customerName} ya ha hecho tres viajes, por lo tanto has ganado 50 pesos más. Ahora tienes un total de ${promoter.totalCustomerInvites} referidos de clientes, ${promoter.totalCustomerConversions} conversiones y ${promoter.totalPesosEarned} pesos ganados. Recógelo cuando quieras contactando a Alejandro @ 954-118-4711`,
    phoneNumber: promoter.phoneNumber
  }).catch(function(e){
    functions.logger.error("notifyPromoterOfCustomerConversion error", e)
  })
}

async function notifyPromoterOfDriverConversion(driverName, promoter) {
  sender.sendSMS({
    message: `Hola, ${promoter.name}, tu referido chofer ${driverName} ya ha hecho seis viajes, por lo tanto has ganado 200 pesos más. Ahora tienes un total de ${promoter.totalDriverInvites} referidos de chofers, ${promoter.totalDriverConversions} conversiones y ${promoter.totalPesosEarned} pesos ganados. Recógelo cuando quieras contactando a Alejandro @ 954-118-4711`,
    phoneNumber: promoter.phoneNumber
  }).catch(function(e){
    functions.logger.error("notifyPromoterOfDriverConversion error", e)
  })
}

async function notifyPromoterOfCustomerReferral(firebase, params, code) {
  if(code =="none") {
    return
  }
  let promoter = (await firebase.database().ref(`/promoters/${code}`).once('value')).val();
  let user = (await firebase.database().ref(`/users/${params.userId}/info`).once('value')).val();
  firebase.database().ref(`/promoters/${code}/customers/${params.userId}`).update({invite:true, name:user.displayName});
  firebase.database().ref(`/promoters/${code}/totalCustomerInvites`).once("value", function(snap) {
    let invites = snap.val()
    if(!invites)
      invites = 0
    firebase.database().ref(`/promoters/${code}/totalCustomerInvites`).set(parseInt(invites)+1)
  });
  if(!promoter || !promoter.phoneNumber) {
    return
  }
  if(!promoter.name) {
    promoter.name = ""
  }
  try {
    await sender.sendSMS({
      message: `Hola ${promoter.name}, tu referido cliente ${user.displayName} se ha registrado con su código de referencia, lo mantendremos informado cuando completen tres viajes y ganas 50 pesos. Si tienes perguntas puedes contatar Alejandro @ 954-118-4711`,
      phoneNumber: promoter.phoneNumber
    })
  } catch(e) {
    functions.logger.error("notifyPromoterOfCustomerReferral error", e)
  }
}

async function notifyPromoterOfDriverReferral(firebase, params, code) {
  if(code =="none") {
    return
  }
  let promoter = (await firebase.database().ref(`/promoters/${code}`).once('value')).val();
  let user = (await firebase.database().ref(`/users/${params.userId}/info`).once('value')).val();
  firebase.database().ref(`/promoters/${code}/drivers/${params.userId}`).update({invite:true, name:user.displayName});
  firebase.database().ref(`/promoters/${code}/totalDriverInvites`).once("value", function(snap) {
    let invites = snap.val()
    if(!invites)
      invites = 0
    firebase.database().ref(`/promoters/${code}/totalDriverInvites`).set(parseInt(invites)+1)
  });
  if(!promoter || !promoter.phoneNumber) {
    return
  }
  
  if(!promoter.name) {
    promoter.name = ""
  }
  try {
    await sender.sendSMS({
      message: `Hola ${promoter.name}, tu referido chofer ${user.displayName} se ha registrado con su código de referencia, lo mantendremos informado cuando completen seis viajes y ganas 200 pesos. Si tienes perguntas puedes contatar Alejandro @ 954-118-4711`,
      phoneNumber: promoter.phoneNumber
    })
  } catch(e) {
    functions.logger.error("notifyPromoterOfDriverReferral error", e)
  }
}

async function notifyPromoterOfSignup(firebase, params, promoter) {
  if(!params.inviteCode || params.inviteCode == "none") {
    return
  }
  if(!promoter || !promoter.phoneNumber)
    return
  if(!promoter.name)
    promoter.name = ""
  try {
    await sender.sendSMS({
      message: `Hola ${promoter.name}, gracias por registrarte como promotor. Si los clientes se registran en www.mezc.co con tu código ${params.inviteCode}, cuando terminen 3 viajes, se le recompensará con 50 pesos. Le notificaremos cuando alguien se registre o hace tres viajes usando tu código de promoción. Si tienes perguntas puedes contatar Alejandro @ 954-118-4711`,
      phoneNumber: promoter.phoneNumber
    })
  } catch(e) {
    functions.logger.error("notifyPromoterOfDriverReferral error", e)
  }
}


async function sendTest(firebase, data) {
  if(!data.userId){
    return {
      status: "Error",
      errorMessage: "Need User Id"
    }
  }
  let uid = data.userId
  let driver = (await firebase.database().ref(`/taxiDrivers/${uid}`).once('value')).val();
  if(driver.notificationInfo){     
    webpush.sendNotification(driver.notificationInfo, JSON.stringify({
      notificationType: "newOrder",
      message: "Eso es una prueba, gracias."
    })).catch((e) => {
      functions.logger.error("test notification push error ",uid)
    })
  }
}
