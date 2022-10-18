// import * as functions from "firebase-functions";

import * as firebase from "firebase-admin";

if (process.env.FUNCTIONS_EMULATOR === "true") {
  firebase.initializeApp({
    databaseURL: "https://mezcalmos-31f1c-default-rtdb.firebaseio.com"
  });
} else {
  firebase.initializeApp()
}

import * as userChanges from './utilities/userChanges'
export const user = {
  processSignUp: userChanges.processSignUp,
  changeName: userChanges.onNameUpdate,
  changePhoto: userChanges.onPhotoUpdate,
  deleteUserAccount : userChanges.deleteAccount
 }

import * as otpAuth from './utilities/otpAuth'
export const otp = {
  sendOTPForLogin: otpAuth.sendOTPForLogin,
  getAuthUsingOTP: otpAuth.getAuthUsingOTP
}

import * as stripePaymentFunctions from './utilities/stripe/payment'
import * as stripeServiceProvderFunctions from './utilities/stripe/serviceProvider'
import * as stripeCardFunctions from './utilities/stripe/card'
export const stripe = {
  getPaymentIntent: stripePaymentFunctions.getPaymentIntent,
  addCard: stripeCardFunctions.addCard,
  chargeCard: stripeCardFunctions.chargeCard,
  removeCard: stripeCardFunctions.removeCard,
  setupServiceProvider: stripeServiceProvderFunctions.setupServiceProvider,
  updateServiceProvider: stripeServiceProvderFunctions.updateServiceProvider
}

import * as restaurantStatusChange from './restaurant/adminStatusChanges'
export const restaurant = {
  createRestaurant: require("./restaurant/createNewRestaurant"),
  addOperator: require("./restaurant/addOperator"),
  removeOperator: require("./restaurant/removeOperator"),
  checkoutCart: require("./restaurant/checkoutCart"),
  addReview: require("./restaurant/addReview"),
  prepareOrder: restaurantStatusChange.prepareOrder,
  readyForOrderPickup: restaurantStatusChange.readyForPickupOrder,
  cancelOrderFromAdmin: restaurantStatusChange.cancelOrder,
  cancelOrderFromCustomer: require("./restaurant/cancelOrderFromCustomer"),
  setEstimatedFoodReadyTime: restaurantStatusChange.setEstimatedFoodReadyTime,
  markOrderItemUnavailable: restaurantStatusChange.markOrderItemUnavailable,
  refundCustomerCustomAmount: restaurantStatusChange.refundCustomerCustomAmount
}

// Taxi
export const taxi = {
  requestRide: require("./taxi/request"),
  startScheduledRide: require("./taxi/taxiStatusChange").startScheduledRide,
  acceptRide: require("./taxi/accept"),
  startRide: require("./taxi/taxiStatusChange").startRide,
  cancelFromCustomer: require("./taxi/cancelTaxiFromCustomer"),
  cancelFromDriver: require("./taxi/taxiStatusChange").cancelTaxiFromDriver,
  finishRide: require("./taxi/taxiStatusChange").finishRide,
  forwardToLocalCompany: require("./taxi/adminStatusChanges").forwardToLocalCompany,
  submitForwardResult: require("./taxi/adminStatusChanges").submitForwardResult,
}

import * as laundryStatusChange from './laundry/adminStatusChanges'
export const laundry = {
  createLaundry: require("./laundry/createNewLaundry"),
  requestLaundry: require("./laundry/laundryRequest"),
  readyForDeliveryOrder: laundryStatusChange.readyForDeliveryOrder,
  cancelFromCustomer: require("./laundry/cancelLaundryFromCustomer"),
  cancelFromAdmin: laundryStatusChange.cancelOrder,
  setWeight: laundryStatusChange.setWeight,
  setEstimatedLaundryReadyTime: laundryStatusChange.setEstimatedLaundryReadyTime
}

import * as laundryDelivery from './delivery/laundryStatusChange'
import * as restaurantDelivery from './delivery/restaurantStatusChange'

export const delivery = {
  assignDriver: require("./delivery/assignDriver"),
  restaurantStartDelivery: restaurantDelivery.startDelivery,
  restaurantFinishDelivery: restaurantDelivery.finishDelivery,
  laundryStartPickupFromCustomer: laundryDelivery.startPickupFromCustomer,
  laundryPickedUpFromCustomer: laundryDelivery.pickedUpFromCustomer,
  laundryAtFacility: laundryDelivery.atFacility,
  laundryStartPickupFromLaundry: laundryDelivery.startPickupFromLaundry,
  laundryPickedUpFromLaundry: laundryDelivery.pickedUpFromLaundry,
  laundryFinishDropoff: laundryDelivery.finishDropoff,
  setEstimatedTime: require("./delivery/setEstimatedTime")
}