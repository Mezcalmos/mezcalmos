import 'package:cloud_functions/cloud_functions.dart';
import 'dart:convert';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';
class CloudFunctions {
  static Future<dynamic> callCloudFunction(
      {required String functionName, Map<String, dynamic>? parameters}) async {
    final Map<String, dynamic> finalParams = <String, dynamic>{
      'versionNumber': '0.0.0'
    };
    finalParams.addAll(parameters ?? <String, dynamic>{});
    final HttpsCallableResult<dynamic> response = await FirebaseFunctions.instance
        .httpsCallable(functionName)
        .call(finalParams);
    return response.data;
  }

  static Future<void> user2_addHasuraClaim(
  ) async {
    return await callCloudFunction(
      functionName: "user2-addHasuraClaim",
      parameters: <String, dynamic>{});
  }

  static Future<SendOtpResponse> otp2_sendOTPForLogin(
      {required String language,
      required String phoneNumber}  ) async {
    return SendOtpResponse.fromFirebaseFormattedJson(await callCloudFunction(
      functionName: "otp2-sendOTPForLogin",
      parameters: <String, dynamic>{
        "language": language,
        "phoneNumber": phoneNumber,
      }));
  }

  static Future<AuthResponse> otp2_getAuthUsingOTP(
      {required String phoneNumber,
      required String OTPCode}  ) async {
    return AuthResponse.fromFirebaseFormattedJson(await callCloudFunction(
      functionName: "otp2-getAuthUsingOTP",
      parameters: <String, dynamic>{
        "phoneNumber": phoneNumber,
        "OTPCode": OTPCode,
      }));
  }

  static Future<PaymentIntentResponse> stripe2_getPaymentIntent(
      {required num serviceProviderDetailsId,
      required num paymentAmount}  ) async {
    return PaymentIntentResponse.fromFirebaseFormattedJson(await callCloudFunction(
      functionName: "stripe2-getPaymentIntent",
      parameters: <String, dynamic>{
        "serviceProviderDetailsId": serviceProviderDetailsId,
        "paymentAmount": paymentAmount,
      }));
  }

  static Future<AddCardResponse> stripe2_addCard(
      {required String paymentMethod}  ) async {
    return AddCardResponse.fromFirebaseFormattedJson(await callCloudFunction(
      functionName: "stripe2-addCard",
      parameters: <String, dynamic>{
        "paymentMethod": paymentMethod,
      }));
  }

  static Future<ChargeCardResponse> stripe2_chargeCard(
      {required num serviceProviderDetailsId,
      required String cardId,
      required num paymentAmount}  ) async {
    return ChargeCardResponse.fromFirebaseFormattedJson(await callCloudFunction(
      functionName: "stripe2-chargeCard",
      parameters: <String, dynamic>{
        "serviceProviderDetailsId": serviceProviderDetailsId,
        "cardId": cardId,
        "paymentAmount": paymentAmount,
      }));
  }

  static Future<RemoveCardResponse> stripe2_removeCard(
      {required String cardId}  ) async {
    return RemoveCardResponse.fromFirebaseFormattedJson(await callCloudFunction(
      functionName: "stripe2-removeCard",
      parameters: <String, dynamic>{
        "cardId": cardId,
      }));
  }

  static Future<SetupStripeResponse> stripe2_setupServiceProvider(
      {required num serviceProviderDetailsId}  ) async {
    return SetupStripeResponse.fromFirebaseFormattedJson(await callCloudFunction(
      functionName: "stripe2-setupServiceProvider",
      parameters: <String, dynamic>{
        "serviceProviderDetailsId": serviceProviderDetailsId,
      }));
  }

  static Future<UpdateStripeResponse> stripe2_updateServiceProvider(
      {required num serviceProviderDetailsId}  ) async {
    return UpdateStripeResponse.fromFirebaseFormattedJson(await callCloudFunction(
      functionName: "stripe2-updateServiceProvider",
      parameters: <String, dynamic>{
        "serviceProviderDetailsId": serviceProviderDetailsId,
      }));
  }

  static Future<CallUserResponse> agora_callChatUser(
      {required num chatId,
      required ParticipantType callerParticipantType}  ) async {
    return CallUserResponse.fromFirebaseFormattedJson(await callCloudFunction(
      functionName: "agora-callChatUser",
      parameters: <String, dynamic>{
        "chatId": chatId,
        "callerParticipantType":callerParticipantType.toFirebaseFormatString(),
      }));
  }

  static Future<AddOperatorResponse> serviceProvider_addOperator(
      {required String uniqueId,
      String? notificationToken,
      String? appVersion}  ) async {
    return AddOperatorResponse.fromFirebaseFormattedJson(await callCloudFunction(
      functionName: "serviceProvider-addOperator",
      parameters: <String, dynamic>{
        "uniqueId": uniqueId,
        "notificationToken": notificationToken,
        "appVersion": appVersion,
      }));
  }

  static Future<AuthOperatorResponse> serviceProvider_authorizeOperator(
      {required num newOperatorId,
      required bool approved,
      required ParticipantType participantType}  ) async {
    return AuthOperatorResponse.fromFirebaseFormattedJson(await callCloudFunction(
      functionName: "serviceProvider-authorizeOperator",
      parameters: <String, dynamic>{
        "newOperatorId": newOperatorId,
        "approved": approved,
        "participantType":participantType.toFirebaseFormatString(),
      }));
  }

  static Future<AddDriverResponse> serviceProvider_addDriver(
      {required String uniqueId,
      String? notificationToken}  ) async {
    return AddDriverResponse.fromFirebaseFormattedJson(await callCloudFunction(
      functionName: "serviceProvider-addDriver",
      parameters: <String, dynamic>{
        "uniqueId": uniqueId,
        "notificationToken": notificationToken,
      }));
  }

  static Future<AuthorizeDriverResponse> serviceProvider_authorizeDriver(
      {required num deliveryDriverId,
      required bool approved,
      required DeliveryServiceProviderType deliveryServiceProviderType}  ) async {
    return AuthorizeDriverResponse.fromFirebaseFormattedJson(await callCloudFunction(
      functionName: "serviceProvider-authorizeDriver",
      parameters: <String, dynamic>{
        "deliveryDriverId": deliveryDriverId,
        "approved": approved,
        "deliveryServiceProviderType":deliveryServiceProviderType.toFirebaseFormatString(),
      }));
  }

  static Future<ServiceProviderChatResponse> serviceProvider_createServiceProviderChat(
      {required num serviceProviderId,
      required ServiceProviderType serviceProviderType}  ) async {
    return ServiceProviderChatResponse.fromFirebaseFormattedJson(await callCloudFunction(
      functionName: "serviceProvider-createServiceProviderChat",
      parameters: <String, dynamic>{
        "serviceProviderId": serviceProviderId,
        "serviceProviderType":serviceProviderType.toFirebaseFormatString(),
      }));
  }

  static Future<RestaurantResponse> restaurant2_createRestaurant(
      {required String name,
      required String image,
      required Location location,
      required Map<String, dynamic> schedule,
      String? restaurantOperatorNotificationToken,
      String? firebaseId,
      num? deliveryPartnerId,
      required DeliveryDetails deliveryDetails,
      required Map<String,bool> language,
      String? uniqueId}  ) async {
    return RestaurantResponse.fromFirebaseFormattedJson(await callCloudFunction(
      functionName: "restaurant2-createRestaurant",
      parameters: <String, dynamic>{
        "name": name,
        "image": image,
        "location":location.toFirebaseFormattedJson(),
        "schedule": schedule,
        "restaurantOperatorNotificationToken": restaurantOperatorNotificationToken,
        "firebaseId": firebaseId,
        "deliveryPartnerId": deliveryPartnerId,
        "deliveryDetails":deliveryDetails.toFirebaseFormattedJson(),
        "language": language,
        "uniqueId": uniqueId,
      }));
  }

  static Future<CheckoutResponse> restaurant2_checkoutCart(
      {required CustomerAppType customerAppType,
      required Location customerLocation,
      required num deliveryCost,
      required PaymentType paymentType,
      String? notes,
      required num restaurantId,
      DeliveryType? deliveryType,
      required num tripDistance,
      required num tripDuration,
      required String tripPolyline,
      String? scheduledTime,
      String? stripePaymentId,
      num? stripeFees,
      num? distanceFromBase,
      num? tax,
      num? discountValue}  ) async {
    return CheckoutResponse.fromFirebaseFormattedJson(await callCloudFunction(
      functionName: "restaurant2-checkoutCart",
      parameters: <String, dynamic>{
        "customerAppType":customerAppType.toFirebaseFormatString(),
        "customerLocation":customerLocation.toFirebaseFormattedJson(),
        "deliveryCost": deliveryCost,
        "paymentType":paymentType.toFirebaseFormatString(),
        "notes": notes,
        "restaurantId": restaurantId,
        "deliveryType":deliveryType?.toFirebaseFormatString(),
        "tripDistance": tripDistance,
        "tripDuration": tripDuration,
        "tripPolyline": tripPolyline,
        "scheduledTime": scheduledTime,
        "stripePaymentId": stripePaymentId,
        "stripeFees": stripeFees,
        "distanceFromBase": distanceFromBase,
        "tax": tax,
        "discountValue": discountValue,
      }));
  }

  static Future<ChangeRestaurantStatusResponse> restaurant2_prepareOrder(
      {required num orderId}  ) async {
    return ChangeRestaurantStatusResponse.fromFirebaseFormattedJson(await callCloudFunction(
      functionName: "restaurant2-prepareOrder",
      parameters: <String, dynamic>{
        "orderId": orderId,
      }));
  }

  static Future<ChangeRestaurantStatusResponse> restaurant2_readyForOrderPickup(
      {required num orderId}  ) async {
    return ChangeRestaurantStatusResponse.fromFirebaseFormattedJson(await callCloudFunction(
      functionName: "restaurant2-readyForOrderPickup",
      parameters: <String, dynamic>{
        "orderId": orderId,
      }));
  }

  static Future<ChangeRestaurantStatusResponse> restaurant2_orderPickedUpByCustomer(
      {required num orderId}  ) async {
    return ChangeRestaurantStatusResponse.fromFirebaseFormattedJson(await callCloudFunction(
      functionName: "restaurant2-orderPickedUpByCustomer",
      parameters: <String, dynamic>{
        "orderId": orderId,
      }));
  }

  static Future<ChangeRestaurantStatusResponse> restaurant2_cancelOrderFromAdmin(
      {required num orderId}  ) async {
    return ChangeRestaurantStatusResponse.fromFirebaseFormattedJson(await callCloudFunction(
      functionName: "restaurant2-cancelOrderFromAdmin",
      parameters: <String, dynamic>{
        "orderId": orderId,
      }));
  }

  static Future<CancelRestaurantOrderResponse> restaurant2_cancelOrderFromCustomer(
      {required num orderId}  ) async {
    return CancelRestaurantOrderResponse.fromFirebaseFormattedJson(await callCloudFunction(
      functionName: "restaurant2-cancelOrderFromCustomer",
      parameters: <String, dynamic>{
        "orderId": orderId,
      }));
  }

  static Future<BusinessResponse> business_createBusiness(
      {required String name,
      required String image,
      required BusinessProfile profile,
      required Location location,
      String? businessOperatorNotificationToken,
      required Map<String,bool> language}  ) async {
    return BusinessResponse.fromFirebaseFormattedJson(await callCloudFunction(
      functionName: "business-createBusiness",
      parameters: <String, dynamic>{
        "name": name,
        "image": image,
        "profile":profile.toFirebaseFormatString(),
        "location":location.toFirebaseFormattedJson(),
        "businessOperatorNotificationToken": businessOperatorNotificationToken,
        "language": language,
      }));
  }

  static Future<OrderReqResponse> business_requestOrder(
      {required num businessId,
      required CustomerAppType customerAppType,
      String? notes}  ) async {
    return OrderReqResponse.fromFirebaseFormattedJson(await callCloudFunction(
      functionName: "business-requestOrder",
      parameters: <String, dynamic>{
        "businessId": businessId,
        "customerAppType":customerAppType.toFirebaseFormatString(),
        "notes": notes,
      }));
  }

  static Future<HandleRequestResponse> business_handleOrderRequestByAdmin(
      {required num orderRequestId,
      required bool requestConfirmed,
      Map<num,num>? itemIdToFinalCostPerOne}  ) async {
    return HandleRequestResponse.fromFirebaseFormattedJson(await callCloudFunction(
      functionName: "business-handleOrderRequestByAdmin",
      parameters: <String, dynamic>{
        "orderRequestId": orderRequestId,
        "requestConfirmed": requestConfirmed,
        "itemIdToFinalCostPerOne": itemIdToFinalCostPerOne,
      }));
  }

  static Future<CustomerHandleRequestResponse> business_handleOrderRequestFromCustomer(
      {required num orderRequestId,
      required bool requestConfirmed}  ) async {
    return CustomerHandleRequestResponse.fromFirebaseFormattedJson(await callCloudFunction(
      functionName: "business-handleOrderRequestFromCustomer",
      parameters: <String, dynamic>{
        "orderRequestId": orderRequestId,
        "requestConfirmed": requestConfirmed,
      }));
  }

  static Future<LaundryResponse> laundry2_createLaundry(
      {required String name,
      required String image,
      required Location location,
      required Map<String, dynamic> schedule,
      String? laundryOperatorNotificationToken,
      String? firebaseId,
      num? deliveryPartnerId,
      required DeliveryDetails deliveryDetails,
      required Map<String,bool> language,
      String? uniqueId}  ) async {
    return LaundryResponse.fromFirebaseFormattedJson(await callCloudFunction(
      functionName: "laundry2-createLaundry",
      parameters: <String, dynamic>{
        "name": name,
        "image": image,
        "location":location.toFirebaseFormattedJson(),
        "schedule": schedule,
        "laundryOperatorNotificationToken": laundryOperatorNotificationToken,
        "firebaseId": firebaseId,
        "deliveryPartnerId": deliveryPartnerId,
        "deliveryDetails":deliveryDetails.toFirebaseFormattedJson(),
        "language": language,
        "uniqueId": uniqueId,
      }));
  }

  static Future<ReqLaundryResponse> laundry2_requestLaundry(
      {required num storeId,
      required PaymentType paymentType,
      required DeliveryType deliveryType,
      required Location customerLocation,
      required num deliveryCost,
      required CustomerAppType customerAppType,
      String? notes,
      num? tax,
      String? scheduledTime,
      num? stripeFees,
      String? stripePaymentId,
      num? discountValue,
      required num tripDistance,
      required num tripDuration,
      required String tripPolyline,
      num? distanceFromBase}  ) async {
    return ReqLaundryResponse.fromFirebaseFormattedJson(await callCloudFunction(
      functionName: "laundry2-requestLaundry",
      parameters: <String, dynamic>{
        "storeId": storeId,
        "paymentType":paymentType.toFirebaseFormatString(),
        "deliveryType":deliveryType.toFirebaseFormatString(),
        "customerLocation":customerLocation.toFirebaseFormattedJson(),
        "deliveryCost": deliveryCost,
        "customerAppType":customerAppType.toFirebaseFormatString(),
        "notes": notes,
        "tax": tax,
        "scheduledTime": scheduledTime,
        "stripeFees": stripeFees,
        "stripePaymentId": stripePaymentId,
        "discountValue": discountValue,
        "tripDistance": tripDistance,
        "tripDuration": tripDuration,
        "tripPolyline": tripPolyline,
        "distanceFromBase": distanceFromBase,
      }));
  }

  static Future<ChangeLaundryStatusResponse> laundry2_readyForDeliveryOrder(
      {required num orderId}  ) async {
    return ChangeLaundryStatusResponse.fromFirebaseFormattedJson(await callCloudFunction(
      functionName: "laundry2-readyForDeliveryOrder",
      parameters: <String, dynamic>{
        "orderId": orderId,
      }));
  }

  static Future<CancelLaundryResponse> laundry2_cancelFromCustomer(
      {required num orderId}  ) async {
    return CancelLaundryResponse.fromFirebaseFormattedJson(await callCloudFunction(
      functionName: "laundry2-cancelFromCustomer",
      parameters: <String, dynamic>{
        "orderId": orderId,
      }));
  }

  static Future<ChangeLaundryStatusResponse> laundry2_cancelFromAdmin(
      {required num orderId}  ) async {
    return ChangeLaundryStatusResponse.fromFirebaseFormattedJson(await callCloudFunction(
      functionName: "laundry2-cancelFromAdmin",
      parameters: <String, dynamic>{
        "orderId": orderId,
      }));
  }

  static Future<AssignDriverResponse> delivery2_assignDriver(
      {required num deliveryOrderId,
      required num deliveryDriverId,
      bool? changeDriver}  ) async {
    return AssignDriverResponse.fromFirebaseFormattedJson(await callCloudFunction(
      functionName: "delivery2-assignDriver",
      parameters: <String, dynamic>{
        "deliveryOrderId": deliveryOrderId,
        "deliveryDriverId": deliveryDriverId,
        "changeDriver": changeDriver,
      }));
  }

  static Future<ChangeDeliveryStatusResponse> delivery2_changeStatus(
      {required num deliveryId,
      required DeliveryOrderStatus newStatus}  ) async {
    return ChangeDeliveryStatusResponse.fromFirebaseFormattedJson(await callCloudFunction(
      functionName: "delivery2-changeStatus",
      parameters: <String, dynamic>{
        "deliveryId": deliveryId,
        "newStatus":newStatus.toFirebaseFormatString(),
      }));
  }

  static Future<CreateCourierResponse> delivery2_createCourierOrder(
      {required Location toLocation,
      Location? fromLocationGps,
      String? fromLocationText,
      required List<CourierItem> items,
      required num deliveryCompanyId,
      num? deliveryCost,
      required CustomerAppType customerAppType,
      num? tax,
      String? scheduledTime,
      num? stripeFees,
      num? discountValue,
      num? tripDistance,
      num? tripDuration,
      String? tripPolyline,
      num? distanceFromBase,
      num? refundAmount}  ) async {
    return CreateCourierResponse.fromFirebaseFormattedJson(await callCloudFunction(
      functionName: "delivery2-createCourierOrder",
      parameters: <String, dynamic>{
        "toLocation":toLocation.toFirebaseFormattedJson(),
        "fromLocationGps":fromLocationGps?.toFirebaseFormattedJson(),
        "fromLocationText": fromLocationText,
        "items":items.fold<List<dynamic>>([],
              (List<dynamic> value, CourierItem element) {
            value.add(element.toFirebaseFormattedJson());
            return value;
          }),
        "deliveryCompanyId": deliveryCompanyId,
        "deliveryCost": deliveryCost,
        "customerAppType":customerAppType.toFirebaseFormatString(),
        "tax": tax,
        "scheduledTime": scheduledTime,
        "stripeFees": stripeFees,
        "discountValue": discountValue,
        "tripDistance": tripDistance,
        "tripDuration": tripDuration,
        "tripPolyline": tripPolyline,
        "distanceFromBase": distanceFromBase,
        "refundAmount": refundAmount,
      }));
  }

  static Future<ChangePriceReqResponse> delivery2_changeDeliveryPrice(
      {required num deliveryOrderId,
      required num newPrice,
      required String reason}  ) async {
    return ChangePriceReqResponse.fromFirebaseFormattedJson(await callCloudFunction(
      functionName: "delivery2-changeDeliveryPrice",
      parameters: <String, dynamic>{
        "deliveryOrderId": deliveryOrderId,
        "newPrice": newPrice,
        "reason": reason,
      }));
  }

  static Future<ChangePriceResResponse> delivery2_changeDeliveryPriceResponse(
      {required bool accepted,
      required num orderId,
      required OrderType orderType}  ) async {
    return ChangePriceResResponse.fromFirebaseFormattedJson(await callCloudFunction(
      functionName: "delivery2-changeDeliveryPriceResponse",
      parameters: <String, dynamic>{
        "accepted": accepted,
        "orderId": orderId,
        "orderType":orderType.toFirebaseFormatString(),
      }));
  }

  static Future<CancelCourierResponse> delivery2_cancelCourierFromCustomer(
      {required num orderId}  ) async {
    return CancelCourierResponse.fromFirebaseFormattedJson(await callCloudFunction(
      functionName: "delivery2-cancelCourierFromCustomer",
      parameters: <String, dynamic>{
        "orderId": orderId,
      }));
  }

}