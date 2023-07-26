import * as functions from "firebase-functions";
import * as firebase from "firebase-admin";
import * as stripePaymentFunctions from './utilities/stripe/payment'
import * as stripeServiceProvderFunctions from './utilities/stripe/serviceProvider'
import * as stripeCardFunctions from './utilities/stripe/card'
import * as restaurantStatusChange from './restaurant/adminStatusChanges'
 import { createNewRestaurant } from "./restaurant/createNewRestaurant";
import { checkout } from "./restaurant/checkoutCart";
 import { cancelOrderFromCustomer } from "./restaurant/cancelOrderFromCustomer";
import * as laundryStatusChange from './laundry/adminStatusChanges'
import { HttpsError } from "firebase-functions/v1/auth";

import { getAuthUsingOTP, sendOTPForLogin } from "./utilities/otpAuth";
import * as userChanges from './utilities/userChanges'
import { assignDriver } from "./delivery/assignDriver";
import { addDriver } from "./serviceProvider/addDriver";
import { callUser } from "./utilities/agora";
import { requestLaundry } from "./laundry/laundryRequest";
import { createLaundry } from "./laundry/createNewLaundry";
import { cancelLaundryFromCustomer } from "./laundry/cancelLaundryFromCustomer";
import { changeDeliveryStatus } from "./delivery/statusChange";
import { addOperator } from "./serviceProvider/addOperator";
import { authorizeOperator } from "./serviceProvider/authorizeOperator";
import { createCourierOrder } from "./delivery/createCourierOrder";
import { cancelCourierFromCustomer } from "./delivery/cancelCourierFromCustomer";
import { requestCounterOffer } from "./delivery/counterOffer";
import { createNewBusiness } from "./business/createNewBusiness";
import { createNewMezAdminChat, createServiceProviderChat } from "./shared/chat/createChat";
import { authorizeDriver } from "./serviceProvider/authorizeDriver";
import { removeDriver } from "./delivery/removeDriver";
import { deleteServiceProvider } from "./serviceProvider/deleteServiceProvider";
import { handleOrderRequestByAdmin } from "./business/adminHandleRequest";
import { handleOrderRequestFromCustomer } from "./business/customerHandleRequest";
import { requestOrder } from "./business/orderRequest";
import { incrementReferralCount, saveIpReferral } from "./utilities/referrals";
import { changeUniqueId } from "./serviceProvider/changeUniqueId";
import { requestLaundryDelivery } from "./laundry/deliveryRequest";
import { RuntimeOptions } from "firebase-functions";

if (process.env.FUNCTIONS_EMULATOR === "true") {
  firebase.initializeApp({
    databaseURL: "https://mezcalmos-31f1c-default-rtdb.firebaseio.com"
  });
} else {
  firebase.initializeApp()
}


export const user2 = {
  processSignUp: userChanges.processSignUp,
  deleteUserAccount: authenticatedCall((userId, data) => userChanges.deleteAccount(userId, data)),
  addHasuraClaim: functions.https.onCall((_, context) => userChanges.addHasuraClaim(context.auth!.uid, null))
}

export const referral = {
  incrementReferralCount: functions.https.onRequest(async (request, response) => incrementReferralCount(request, response)),
  saveIpReferral: functions.https.onRequest(async (request, response) => saveIpReferral(request, response))
}

export const otp3 = {
  sendOTPForLogin: functions.https.onCall((data) => sendOTPForLogin(null, data)),
  getAuthUsingOTP: functions.https.onCall((data) => getAuthUsingOTP(null, data)),
}

export const stripe3 = {
  getPaymentIntent: authenticatedCall((userId, data) => stripePaymentFunctions.getPaymentIntent(userId, data)),
  addCard: authenticatedCall((userId, data) => stripeCardFunctions.addCard(userId, data)),
  chargeCard: authenticatedCall((userId, data) => stripeCardFunctions.chargeCard(userId, data)),
  removeCard: authenticatedCall((userId, data) => stripeCardFunctions.removeCard(userId, data)),
  setupServiceProvider: authenticatedCall((userId, data) => stripeServiceProvderFunctions.setupServiceProvider(userId, data)),
  updateServiceProvider: authenticatedCall((userId, data) => stripeServiceProvderFunctions.updateServiceProvider(userId, data)),
}

export const agora2 = {
  callChatUser: authenticatedCall((userId, data) => callUser(userId, data))
}
export const serviceProvider = {
  addOperator: authenticatedCall((userId, data) => addOperator(userId, data)),
  authorizeOperator: authenticatedCall((userId, data) => authorizeOperator(userId, data)),
  addDriver: authenticatedCall((userId, data) => addDriver(userId, data)),
  authorizeDriver: authenticatedCall((userId, data) => authorizeDriver(userId, data)),
  createServiceProviderChat: authenticatedCall((userId, data) => createServiceProviderChat(userId, data)),
// addReferral: authenticatedCall((userId, data) => addNewReferral(userId, data)),
  removeDriver: authenticatedCall((userId, data) => removeDriver(userId, data)),
  deleteServiceProvider: authenticatedCall((userId, data) => deleteServiceProvider(userId, data)),
  createMezAdminChat: authenticatedCall((userId, data) => createNewMezAdminChat(userId, data)),
  changeUniqueId: authenticatedCall((userId, data) => changeUniqueId(userId, data)),
}

export const restaurant3 = {
  createRestaurant: authenticatedCall((userId, data) => createNewRestaurant(userId, data), {memory: "512MB"}),
  checkoutCart: authenticatedCall((userId, data) => checkout(userId, data)),
  prepareOrder: authenticatedCall((userId, data) => restaurantStatusChange.prepareOrder(userId, data)),
  readyForOrderPickup: authenticatedCall((userId, data) => restaurantStatusChange.readyForPickupOrder(userId, data)),
  orderPickedUpByCustomer: authenticatedCall((userId, data) => restaurantStatusChange.orderPickedUpByCustomer(userId, data)),
  cancelOrderFromAdmin: authenticatedCall((userId, data) => restaurantStatusChange.cancelOrder(userId, data)),
  cancelOrderFromCustomer: authenticatedCall((userId, data) => cancelOrderFromCustomer(userId, data)),
  // refundCustomerCustomAmount: authenticatedCall((userId, data) => restaurantStatusChange.refundCustomerCustomAmount(userId, data)),
}
export const business = {
  createBusiness: authenticatedCall((userId, data) => createNewBusiness(userId, data), {memory: "512MB"}),
  requestOrder: authenticatedCall((userId, data) => requestOrder(userId, data)),
  handleOrderRequestByAdmin: authenticatedCall((userId, data) => handleOrderRequestByAdmin(userId, data)),
  handleOrderRequestFromCustomer: authenticatedCall((userId, data) => handleOrderRequestFromCustomer(userId, data)),
}


export const laundry3 = {
  createLaundry: authenticatedCall((userId, data) => createLaundry(userId, data)),
  requestLaundry: authenticatedCall((userId, data) => requestLaundry(userId, data)),
  readyForDeliveryOrder: authenticatedCall((userId, data) => laundryStatusChange.readyForDeliveryOrder(userId, data)),
  cancelFromCustomer: authenticatedCall((userId, data) => cancelLaundryFromCustomer(userId, data)),
  cancelFromAdmin: authenticatedCall((userId, data) => laundryStatusChange.cancelOrder(userId, data)),
  requestLaundryDelivery: authenticatedCall((userId, data) => requestLaundryDelivery(userId, data)),
}

export const delivery3 = {
  assignDriver: authenticatedCall((userId, data) => assignDriver(userId, data)),
  changeStatus: authenticatedCall((userId, data) => changeDeliveryStatus(userId, data)),
  createCourierOrder: authenticatedCall((userId, data) => createCourierOrder(userId, data)),
  // changeDeliveryPrice: authenticatedCall((userId, data) => changeDeliveryPrice(userId, data)),
  // changeDeliveryPriceResponse: authenticatedCall((userId, data) => changeDeliveryPriceResponse(userId, data)),
  cancelCourierFromCustomer: authenticatedCall((userId, data) => cancelCourierFromCustomer(userId, data)),
  requestCounterOffer: authenticatedCall((userId, data) => requestCounterOffer(userId, data)),
  // restaurantStartDelivery: authenticatedCall((userId, data) => restaurantDelivery.startDelivery(userId, data)),
  // restaurantFinishDelivery: authenticatedCall((userId, data) => restaurantDelivery.finishDelivery(userId, data)),
  // laundryStartPickupFromCustomer: authenticatedCall((userId, data) => laundryDelivery.startPickupFromCustomer(userId, data)),
  // laundryPickedUpFromCustomer: authenticatedCall((userId, data) => laundryDelivery.pickedUpFromCustomer(userId, data)),
  // laundryAtFacility: authenticatedCall((userId, data) => laundryDelivery.atFacility(userId, data)),
  // laundryStartPickupFromLaundry: authenticatedCall((userId, data) => laundryDelivery.startPickupFromLaundry(userId, data)),
  // laundryPickedUpFromLaundry: authenticatedCall((userId, data) => laundryDelivery.pickedUpFromLaundry(userId, data)),
  // laundryFinishDropoff: authenticatedCall((userId, data) => laundryDelivery.finishDropoff(userId, data)),
  // setEstimatedTime: authenticatedCall((userId, data) => setEstimatedTime(userId, data)),
}

type AuthenticatedFunction = (userId:number, data:any) => any;
function authenticatedCall(func:AuthenticatedFunction, runtimeOptions:RuntimeOptions= {memory: "256MB"}) {
  return functions.runWith(runtimeOptions).https.onCall(async (data, context) => {
    if (!context.auth?.uid) {
      throw new HttpsError(
        "unauthenticated",
        "Request was not authenticated.",
      );
    }
    let firebaseUser = await firebase.auth().getUser(context.auth!.uid)
    if(firebaseUser.customClaims!["https://hasura.io/jwt/claims"]["x-hasura-user-id"] == null) {
      await userChanges.addHasuraClaim(context.auth?.uid, null);
      firebaseUser = await firebase.auth().getUser(context.auth!.uid)
    }
    data = data || {};
    data.firebaseId = context.auth!.uid;
    console.log("[+] authenticatedCall :: ", parseInt(firebaseUser.customClaims!["https://hasura.io/jwt/claims"]["x-hasura-user-id"]));
    console.log(data)
    return await func(parseInt(firebaseUser.customClaims!["https://hasura.io/jwt/claims"]["x-hasura-user-id"]), data);
  });
}


// export const taxi = {
//   requestRide: authenticatedCall((userId, data) => requestRide(userId, data)),
//   startScheduledRide: authenticatedCall((userId, data) => taxiStatusChange.startScheduledRide(userId, data)),
//   acceptRide: authenticatedCall((userId, data) => acceptRide(userId, data)),
//   startRide: authenticatedCall((userId, data) => taxiStatusChange.startRide(userId, data)),
//   cancelFromCustomer: authenticatedCall((userId, data) => cancelTaxiFromCustomer(userId, data)),
//   cancelFromDriver: authenticatedCall((userId, data) => taxiStatusChange.cancelTaxiFromDriver(userId, data)),
//   finishRide: authenticatedCall((userId, data) => taxiStatusChange.finishRide(userId, data)),
//   forwardToLocalCompany: authenticatedCall((userId, data) => adminStatusChanges.forwardToLocalCompany(userId, data)),
//   submitForwardResult: authenticatedCall((userId, data) => adminStatusChanges.submitForwardResult(userId, data)),
// }

// function adminOnlyCall(func:AuthenticatedFunction) {
//   return functions.https.onCall(async (data, context) => {
//     if (!context.auth?.uid) {
//       throw new HttpsError(
//         "unauthenticated",
//         "Request was not authenticated.",
//       );
//     }
//     let hasPermission = await isUserAdmin(context.auth?.uid);
//     if (!hasPermission) {
//       throw new HttpsError(
//         "permission-denied",
//         "Only admin users can call this function",
//       );
//     }
//     return func(context.auth!.uid, data);
//   });
// }