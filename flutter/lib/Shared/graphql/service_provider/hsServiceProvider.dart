import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/CustomerApp/customerDeepLinkHandler.dart';
import 'package:mezcalmos/CustomerApp/router/courierRoutes.dart';
import 'package:mezcalmos/CustomerApp/router/customerRoutes.dart';
import 'package:mezcalmos/CustomerApp/router/laundaryRoutes.dart';
import 'package:mezcalmos/CustomerApp/router/restaurantRoutes.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart' as cModels;
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/__generated/schema.graphql.dart';
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';
import 'package:mezcalmos/Shared/graphql/service_provider/__generated/service_provider.graphql.dart';
import 'package:mezcalmos/Shared/graphql/translation/hsTranslation.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Service.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/models/Utilities/PaymentInfo.dart';
import 'package:mezcalmos/Shared/models/Utilities/Schedule.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceLink.dart';

HasuraDb _db = Get.find<HasuraDb>();

// querries //
Future<ServiceLink?> get_service_link_by_id(
    {required int serviceLinkId, bool withCache = true}) async {
  final QueryResult<Query$getServiceProviderLinks> response =
      await _db.graphQLClient.query$getServiceProviderLinks(
    Options$Query$getServiceProviderLinks(
      fetchPolicy:
          withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.noCache,
      variables:
          Variables$Query$getServiceProviderLinks(serviceLinkId: serviceLinkId),
    ),
  );
  Map<cModels.Language, String> convertCustomerFlyerLinks(
      Map<String, dynamic> map) {
    final Map<cModels.Language, String> list = {};
    map.forEach((String key, value) {
      list.addAll({
        key.toLanguage(): value,
      });
    });
    return list;
  }

  mezDbgPrint("👋 called get service link ===========>${response.data}");
  if (response.parsedData == null) {
    mezDbgPrint(
        "🚨🚨🚨 hasura query service links faild \n  Data from response \n ${response.data} \n Exceptions from hasura \n ${response.exception}");
  } else if (response.parsedData!.service_provider_service_link_by_pk != null) {
    final Query$getServiceProviderLinks$service_provider_service_link_by_pk
        data = response.parsedData!.service_provider_service_link_by_pk!;
    mezDbgPrint("✅ Getting service links done ✅ \n ${data.toJson()}");
    return ServiceLink(
      id: data.id,
      driverDeepLink: data.driver_deep_link,
      driverQrImageLink: data.driver_qr_image_link,
      customerDeepLink: data.customer_deep_link,
      customerQrImageLink: data.customer_qr_image_link,
      operatorDeepLink: data.operator_deep_link,
      operatorQrImageLink: data.operator_qr_image_link,
      customerFlyerLinks: convertCustomerFlyerLinks(data.customer_flyer_links),
    );
  }

  return null;
}

Future<ServicProviderInfo?> get_service_link({required String uniqueId}) async {
  final QueryResult<Query$getServiceProviderType> response = await _db
      .graphQLClient
      .query$getServiceProviderType(Options$Query$getServiceProviderType(
          variables:
              Variables$Query$getServiceProviderType(unique_id: uniqueId)));
  if (response.parsedData == null) {
    mezDbgPrint(
        "🚨🚨🚨 hasura query service type faild \n  Data from response \n ${response.data} \n Exceptions from hasura \n ${response.exception}");
    return null;
  }
  if (response.parsedData!.service_provider_details.length == 0) return null;
  switch (response
      .parsedData?.service_provider_details.first.service_provider_type) {
    case "restaurant":
      return ServicProviderInfo(cModels.ServiceProviderType.Restaurant,
          response.parsedData!.service_provider_details.first.restaurant!.id);
    case "laundry":
      return ServicProviderInfo(
          cModels.ServiceProviderType.Laundry,
          response
              .parsedData!.service_provider_details.first.laundry_store!.id);
    case "business":
      return ServicProviderInfo(cModels.ServiceProviderType.Business,
          response.parsedData!.service_provider_details.first.business!.id);
    default:
      return null;
  }
}

Future<Service?> get_service_details_by_id(
    {required int serviceDetailsId,
    required int serviceId,
    bool withCache = true}) async {
  QueryResult<Query$getServiceDetails> res =
      await _db.graphQLClient.query$getServiceDetails(
    Options$Query$getServiceDetails(
      fetchPolicy:
          withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.noCache,
      variables: Variables$Query$getServiceDetails(id: serviceDetailsId),
    ),
  );
  mezDbgPrint("👋 called get service details ===========>${res.data}");
  if (res.parsedData?.service_provider_details_by_pk == null) {
    throwError(res.exception);
  }

  final Query$getServiceDetails$service_provider_details_by_pk data =
      res.parsedData!.service_provider_details_by_pk!;
  final PaymentInfo paymentInfo = PaymentInfo.fromData(
      acceptedPayments: data.accepted_payments, stripeInfo: data.stripe_info);

  return MainService(
      uniqueId: data.unique_id,
      onlineOrdering: data.online_ordering,
      isOpen: data.is_open ?? false,
      deliveryCost: null,
      info: ServiceInfo(
          descriptionId: data.description_id,
          description: (data.description?.translations != null)
              ? toLanguageMap(translations: data.description!.translations)
              : null,
          location:
              MezLocation.fromHasura(data.location.gps, data.location.address),
          hasuraId: serviceId,
          image: data.image,
          name: data.name),
      serviceDetailsId: data.id,
      state: ServiceState(data.open_status.toServiceStatus(), data.approved),
      languages: convertToLanguages(data.language),
      paymentInfo: paymentInfo,
      schedule: scheduleFromData(data.schedule),
      phoneNumber: data.phone_number,
      serviceLinkId: data.service_link_id,
      serviceProviderType: data.service_provider_type.toServiceProviderType());
}

Future<ServiceInfo?> get_service_info(
    {required int serviceDetailsId,
    required int serviceId,
    bool withCache = true}) async {
  QueryResult<Query$getServiceInfo> res =
      await _db.graphQLClient.query$getServiceInfo(
    Options$Query$getServiceInfo(
      fetchPolicy:
          withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.noCache,
      variables:
          Variables$Query$getServiceInfo(serviceDetailsId: serviceDetailsId),
    ),
  );
  if (res.parsedData?.service_provider_details_by_pk == null) {
    throwError(res.exception);
  }
  final Query$getServiceInfo$service_provider_details_by_pk data =
      res.parsedData!.service_provider_details_by_pk!;

  return ServiceInfo(
      descriptionId: data.description_id,
      phoneNumber: data.phone_number,
      description: (data.description?.translations != null)
          ? toLanguageMap(translations: data.description!.translations)
          : null,
      location:
          MezLocation.fromHasura(data.location.gps, data.location.address),
      locationId: data.location.id,
      hasuraId: serviceId,
      image: data.image,
      name: data.name,
      languages: convertToLanguages(data.language));
}

Future<PaymentInfo?> get_service_payment_info(
    {required int serviceDetailsId, bool withCache = true}) async {
  QueryResult<Query$getServicePaymentInfo> res =
      await _db.graphQLClient.query$getServicePaymentInfo(
    Options$Query$getServicePaymentInfo(
      fetchPolicy:
          withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.noCache,
      variables: Variables$Query$getServicePaymentInfo(
          serviceDetailsId: serviceDetailsId),
    ),
  );
  if (res.parsedData?.service_provider_details_by_pk == null) {
    throwError(res.exception);
  }
  final Query$getServicePaymentInfo$service_provider_details_by_pk data =
      res.parsedData!.service_provider_details_by_pk!;

  final PaymentInfo paymentInfo = PaymentInfo.fromData(
      acceptedPayments: data.accepted_payments, stripeInfo: data.stripe_info);

  return paymentInfo;
}

Future<MezLocation?> get_service_location(
    {required int serviceDetailsId, bool withCache = true}) async {
  QueryResult<Query$getServiceInfo> res =
      await _db.graphQLClient.query$getServiceInfo(
    Options$Query$getServiceInfo(
      fetchPolicy:
          withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.noCache,
      variables:
          Variables$Query$getServiceInfo(serviceDetailsId: serviceDetailsId),
    ),
  );
  if (res.parsedData?.service_provider_details_by_pk == null) {
    throwError(res.exception);
  }
  mezDbgPrint("👋 called get location ===========>${res.data}");
  final Query$getServiceInfo$service_provider_details_by_pk data =
      res.parsedData!.service_provider_details_by_pk!;

  final MezLocation mezLocation =
      MezLocation.fromHasura(data.location.gps, data.location.address);

  return mezLocation;
}

Future<cModels.Schedule?> get_service_schedule(
    {required int serviceDetailsId, bool withCache = true}) async {
  QueryResult<Query$getServiceSchedule> res =
      await _db.graphQLClient.query$getServiceSchedule(
    Options$Query$getServiceSchedule(
      fetchPolicy:
          withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.noCache,
      variables: Variables$Query$getServiceSchedule(
          serviceDetailsId: serviceDetailsId),
    ),
  );
  mezDbgPrint(
      "👋 called get schedule of $serviceDetailsId ===========>${res.data}");
  if (res.parsedData?.service_provider_details_by_pk == null) {
    throwError(res.exception);
  }
  final Query$getServiceSchedule$service_provider_details_by_pk data =
      res.parsedData!.service_provider_details_by_pk!;

  if (data.schedule != null) {
    return scheduleFromData(data.schedule!);
  }
  return null;
}

Future<String?> get_service_provider_route(
    {required String uniqueId, bool withCache = true}) async {
  QueryResult<Query$getServiceProviderId> res =
      await _db.graphQLClient.query$getServiceProviderId(
    Options$Query$getServiceProviderId(
      fetchPolicy:
          withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.noCache,
      variables: Variables$Query$getServiceProviderId(uniqueId: uniqueId),
    ),
  );
  if (res.parsedData == null ||
      res.parsedData!.service_provider_details.isEmpty) {
    throwError(res.exception);
  }
  final cModels.ServiceProviderType serviceProviderType = res
      .parsedData!.service_provider_details[0].service_provider_type
      .toServiceProviderType();
  mezDbgPrint("🈚️🈚️🈚️🈚️🈚️ $serviceProviderType");
  String? route;
  switch (serviceProviderType) {
    case cModels.ServiceProviderType.Restaurant:
      route = RestaurantRoutes.restaurantViewRoute.replaceAll(
          ":restaurantId",
          res.parsedData!.service_provider_details[0].restaurant!.id
              .toString());
      break;
    case cModels.ServiceProviderType.Laundry:
      route = LaundryRoutes.singleLaundryRoute.replaceAll(
          ":laundryId",
          res.parsedData!.service_provider_details[0].laundry_store!.id
              .toString());
      break;
    case cModels.ServiceProviderType.DeliveryCompany:
      route = CourierRoutes.kCourierServiceRoute.replaceAll(
          ":deliveryCompanyId",
          res.parsedData!.service_provider_details[0].delivery_company!.id
              .toString());
      break;
    case cModels.ServiceProviderType.Business:
      route = CustomerRoutes.custBusinessRoute.replaceFirst(
          ':businessId',
          res.parsedData!.service_provider_details[0].delivery_company!.id
              .toString());
      break;
    case cModels.ServiceProviderType.DeliveryDriver:
    case cModels.ServiceProviderType.Customer:
      break;
  }
  return route;
}

Future<ServiceInfo> update_service_info(
    {required ServiceInfo serviceInfo, required int detailsId}) async {
  QueryResult<Mutation$updateServiceDetails> res =
      await _db.graphQLClient.mutate$updateServiceDetails(
    Options$Mutation$updateServiceDetails(
      fetchPolicy: FetchPolicy.noCache,
      variables: Variables$Mutation$updateServiceDetails(
        detailsId: detailsId,
        data: Input$service_provider_details_set_input(
            name: serviceInfo.name,
            image: serviceInfo.image,
            phone_number: serviceInfo.phoneNumber,
            language: serviceInfo.languages?.toFirebaseFormattedString(),
            description_id: serviceInfo.descriptionId,
            currency: serviceInfo.currency?.toFirebaseFormatString()),
      ),
    ),
  );
  mezDbgPrint("error $detailsId ==========>${res.data}");
  if (res.parsedData?.update_service_provider_details_by_pk == null) {
    throwError(res.exception);
  }
  final Mutation$updateServiceDetails$update_service_provider_details_by_pk
      data = res.parsedData!.update_service_provider_details_by_pk!;
  return ServiceInfo(
      descriptionId: data.description_id,
      description: (data.description?.translations != null)
          ? toLanguageMap(translations: data.description!.translations)
          : null,
      location:
          MezLocation.fromHasura(data.location.gps, data.location.address),
      hasuraId: 1,
      image: data.image,
      name: data.name);
}

Future<cModels.Schedule?> update_service_schedule(
    {required cModels.Schedule schedule, required int detailsId}) async {
  QueryResult<Mutation$updateServiceDetails> res =
      await _db.graphQLClient.mutate$updateServiceDetails(
    Options$Mutation$updateServiceDetails(
      variables: Variables$Mutation$updateServiceDetails(
        detailsId: detailsId,
        data: Input$service_provider_details_set_input(
            schedule: schedule.toFirebaseFormattedJson()),
      ),
    ),
  );
  if (res.parsedData?.update_service_provider_details_by_pk == null) {
    throwError(res.exception);
  }
  Mutation$updateServiceDetails$update_service_provider_details_by_pk? data =
      res.parsedData!.update_service_provider_details_by_pk;
  return scheduleFromData(data!.schedule);
}

Future<bool> update_service_state({
  required ServiceStatus? status,
  required bool? approved,
  required int detailsId,
}) async {
  QueryResult<Mutation$updateServiceDetails> res =
      await _db.graphQLClient.mutate$updateServiceDetails(
    Options$Mutation$updateServiceDetails(
      variables: Variables$Mutation$updateServiceDetails(
        detailsId: detailsId,
        data: Input$service_provider_details_set_input(
            approved: approved, open_status: status?.toFirebaseFormatString()),
      ),
    ),
  );
  if (res.parsedData?.update_service_provider_details_by_pk == null) {
    mezDbgPrint("Error =======>${res.data}");
    throwError(res.exception);
  }
  Mutation$updateServiceDetails$update_service_provider_details_by_pk? data =
      res.parsedData!.update_service_provider_details_by_pk;
  return data != null;
}

Future<bool> update_service_accepted_payments(
    {required Map<cModels.PaymentType, bool> payments,
    required int detailsId}) async {
  QueryResult<Mutation$updateServiceDetails> res =
      await _db.graphQLClient.mutate$updateServiceDetails(
    Options$Mutation$updateServiceDetails(
      variables: Variables$Mutation$updateServiceDetails(
        detailsId: detailsId,
        data: Input$service_provider_details_set_input(accepted_payments:
            payments.map<String, bool>((cModels.PaymentType key, bool value) {
          return MapEntry(key.toFirebaseFormatString(), value);
        })),
      ),
    ),
  );
  if (res.parsedData?.update_service_provider_details_by_pk == null) {
    throwError(res.exception);
  }
  Mutation$updateServiceDetails$update_service_provider_details_by_pk? data =
      res.parsedData!.update_service_provider_details_by_pk;
  return data != null;
}

Future<bool> update_service_charge_fees_fro_customer(
    {required bool value, required int detailsId}) async {
  QueryResult<Mutation$updateServiceDetails> res =
      await _db.graphQLClient.mutate$updateServiceDetails(
    Options$Mutation$updateServiceDetails(
      variables: Variables$Mutation$updateServiceDetails(
          detailsId: detailsId,
          data: Input$service_provider_details_set_input()),
    ),
  );
  if (res.parsedData?.update_service_provider_details_by_pk == null) {
    throwError(res.exception);
  }
  Mutation$updateServiceDetails$update_service_provider_details_by_pk? data =
      res.parsedData!.update_service_provider_details_by_pk;
  return data != null;
}

Future<cModels.ServiceProviderLanguage?> get_service_lang(
    {required int detailsId}) async {
  final QueryResult<Query$getServiceLanguage> response = await _db.graphQLClient
      .query$getServiceLanguage(Options$Query$getServiceLanguage(
          fetchPolicy: FetchPolicy.networkOnly,
          variables:
              Variables$Query$getServiceLanguage(serviceDetailsId: detailsId)));
  if (response.hasException) {
    mezDbgPrint("🚨🚨🚨 service lang query errors : ${response.exception}");
  } else if (response.parsedData?.service_provider_details_by_pk != null) {
    mezDbgPrint("✅✅✅ restuarnt primay lang query success");

    return convertToLanguages(
        response.parsedData?.service_provider_details_by_pk!.language);
  }
  return null;
}

Future<void> set_last_active_time({required int detailsId}) async {
  QueryResult<Mutation$setLastActiveTime> res =
      await _db.graphQLClient.mutate$setLastActiveTime(
    Options$Mutation$setLastActiveTime(
      variables: Variables$Mutation$setLastActiveTime(id: detailsId),
    ),
  );
  if (res.parsedData?.update_service_provider_details_by_pk == null) {
    throwError(res.exception);
  }
  // Mutation$setLastActiveTime$update_service_provider_details_by_pk? data =
  //     res.parsedData!.update_service_provider_details_by_pk;
}

Future<bool?> get_service_is_open({required int detailsId}) async {
  final QueryResult<Query$getServiceIsOpen> res = await _db.graphQLClient
      .query$getServiceIsOpen(Options$Query$getServiceIsOpen(
          fetchPolicy: FetchPolicy.networkOnly,
          variables:
              Variables$Query$getServiceIsOpen(serviceDetailsId: detailsId)));
  if (res.hasException) {
    throw res.exception!;
  }
  return res.parsedData?.service_provider_details_by_pk?.is_open;
}

Future<bool> update_business_online_ordering({
  required int detailsId,
  required bool onlineOrdering,
}) async {
  QueryResult<Mutation$update_business_online_ordering> res =
      await _db.graphQLClient.mutate$update_business_online_ordering(
    Options$Mutation$update_business_online_ordering(
      variables: Variables$Mutation$update_business_online_ordering(
        id: detailsId,
        online_ordering: onlineOrdering,
      ),
    ),
  );
  mezDbgPrint("update_business_online_ordering: ${res.data}");
  if (res.parsedData?.update_service_provider_details_by_pk == null) {
    throwError(res.exception);
  }
  return res.parsedData!.update_service_provider_details_by_pk!.online_ordering;
}

Future<List<cModels.Offer>> get_service_provider_offers(
    {required int serviceProviderId,
    required cModels.ServiceProviderType serviceProviderType,
    bool withCache = true}) async {
  QueryResult<Query$get_service_provider_offers> res =
      await _db.graphQLClient.query$get_service_provider_offers(
    Options$Query$get_service_provider_offers(
      fetchPolicy: FetchPolicy.networkOnly,
      variables: Variables$Query$get_service_provider_offers(
          service_provider_id: serviceProviderId,
          service_provider_type: serviceProviderType.toFirebaseFormatString()),
    ),
  );
  mezDbgPrint("👋 called get service provider offers ===========>${res.data}");
  // if (res.parsedData?.service_provider_offer == null) {
  //   throwError(res.exception);
  // }
  final List<cModels.Offer> offers = [];
  res.parsedData?.service_provider_offer
      .forEach((Query$get_service_provider_offers$service_provider_offer data) {
    offers.add(cModels.Offer(
        id: data.id,
        name: toLanguageMap(translations: data.name.translations),
        serviceProviderId: serviceProviderId,
        serviceProviderType: serviceProviderType,
        offerType: data.offer_type.toOfferType(),
        details: cModels.OfferDetails(
          offerForOrder: data.details["offerForOrder"],
          discountType:
              data.details["discountType"].toString().toDiscountType(),
          discountValue: data.details["discountValue"],
          weeklyRepeat: data.details["weeklyRepeat"],
          categories: data.details["categories"],
          // couponReusable: data.details["couponReusable"],
          offeringTypes: data.details["offeringTypes"] == null
              ? <cModels.OfferingType>[]
              : data.details["offeringTypes"]
                  .map<cModels.OfferingType>(
                      (e) => e.toString().toOfferingType())
                  .toList(),
          items: data.details["items"] == null
              ? <num>[]
              : data.details["items"]
                  .map<int>((e) => int.parse(e.toString()))
                  .toList(),
          minimumOrderAmount: data.details["minimumOrderAmount"],
          offerForItems: data.details["offerForItems"],
          validityRangeEnd: data.details["validityRangeEnd"],
          validityRangeStart: data.details["validityRangeStart"],
        ),
        status: data.status.toOfferStatus(),
        couponCode: data.coupon_code));
  });
  return offers;
}

Future<cModels.Offer> check_coupon(
    {required String couponCode,
    required int serviceProviderId,
    required cModels.ServiceProviderType serviceProviderType,
    bool withCache = true}) async {
  QueryResult<Query$check_coupon> res =
      await _db.graphQLClient.query$check_coupon(
    Options$Query$check_coupon(
      fetchPolicy:
          withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.noCache,
      variables: Variables$Query$check_coupon(
          coupon_code: couponCode,
          service_provider_id: serviceProviderId,
          service_provider_type: serviceProviderType.toFirebaseFormatString()),
    ),
  );
  mezDbgPrint("👋 called check coupon ===========>${res.data}");
  if (res.parsedData?.service_provider_offer.length == 0) {
    throwError(res.exception);
  }
  final Query$check_coupon$service_provider_offer data =
      res.parsedData!.service_provider_offer[0];
  return cModels.Offer(
      id: data.id,
      // name: toLanguageMap(translations: data.name.translations),
      serviceProviderId: serviceProviderId,
      serviceProviderType: serviceProviderType,
      offerType: cModels.OfferType.Coupon,
      details: data.details,
      status: cModels.OfferStatus.Active,
      couponCode: couponCode);
}

Future<bool> check_offer_applied(
    {required int customerId,
    required int offerId,
    bool withCache = true}) async {
  QueryResult<Query$check_offer_applied> res =
      await _db.graphQLClient.query$check_offer_applied(
    Options$Query$check_offer_applied(
      fetchPolicy:
          withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.noCache,
      variables: Variables$Query$check_offer_applied(
          customer_id: customerId, offer_id: offerId),
    ),
  );
  mezDbgPrint("👋 called check offer applied ===========>${res.data}");
  if (res.parsedData?.service_provider_offer_applied.length == 0) {
    return false;
  }
  return true;
}

Future<cModels.Offer?> get_offer_by_id({
  required int id,
}) async {
  QueryResult<Query$get_offer_by_id> res = await _db.graphQLClient
      .query$get_offer_by_id(Options$Query$get_offer_by_id(
    variables: Variables$Query$get_offer_by_id(id: id),
  ));

  mezDbgPrint("get_offer_by_id ===========>${res.data}");
  if (res.parsedData == null) {
    throwError(res.exception);
  }
  Query$get_offer_by_id$service_provider_offer_by_pk? data =
      res.parsedData!.service_provider_offer_by_pk;
  if (data == null) {
    return null;
  }
  return cModels.Offer(
      id: data.id,
      name: toLanguageMap(translations: data.name.translations),
      
      
      serviceProviderId: data.service_provider_id,
      serviceProviderType: data.service_provider_type.toServiceProviderType(),
      offerType: data.offer_type.toOfferType(),
      nameId: data.name_id,
      details: cModels.OfferDetails(
        offerForOrder: data.details["offerForOrder"],
        discountType: data.details["discountType"].toString().toDiscountType(),
        discountValue: data.details["discountValue"],
        weeklyRepeat: data.details["weeklyRepeat"],
        categories: data.details["categories"],
        // couponReusable: data.details["couponReusable"],
        offeringTypes: data.details["offeringTypes"] == null
            ? <cModels.OfferingType>[]
            : data.details["offeringTypes"]
                .map<cModels.OfferingType>((e) => e.toString().toOfferingType())
                .toList(),
        items: data.details["items"] == null
            ? <int>[]
            : data.details["items"]
                .map<int>((e) => int.parse(e.toString()))
                .toList(),
        minimumOrderAmount: data.details["minimumOrderAmount"],
        offerForItems: data.details["offerForItems"],
        validityRangeEnd: data.details["validityRangeEnd"],
        validityRangeStart: data.details["validityRangeStart"],
      ),
      status: data.status.toOfferStatus(),
      couponCode: data.coupon_code);
}

Future<int?> add_service_offer({
  required cModels.Offer offer,
  required int serviceProviderId,
}) async {
  QueryResult<Mutation$add_new_offer> res =
      await _db.graphQLClient.mutate$add_new_offer(
    Options$Mutation$add_new_offer(
        variables: Variables$Mutation$add_new_offer(
      object: Input$service_provider_offer_insert_input(
        name: Input$translation_obj_rel_insert_input(
          data: Input$translation_insert_input(
            service_provider_id: serviceProviderId,
            service_provider_type:
                offer.serviceProviderType.toFirebaseFormatString(),
            translations: Input$translation_value_arr_rel_insert_input(
                data: offer.name == null
                    ? []
                    : offer.name!.entries
                        .map((MapEntry<cModels.Language, String> e) {
                        return Input$translation_value_insert_input(
                            language_id: e.key.toFirebaseFormatString(),
                            value: e.value);
                      }).toList()),
          ),
        ),
        service_provider_id: serviceProviderId,
        service_provider_type:
            offer.serviceProviderType.toFirebaseFormatString(),
        offer_type: offer.offerType.toFirebaseFormatString(),
        details: offer.details.toFirebaseFormattedJson(),
        status: offer.status.toFirebaseFormatString(),
        coupon_code: offer.couponCode,
      ),
    )),
  );

  mezDbgPrint("new Offer added ===========>${res.data}");
  if (res.parsedData == null) {
    throwError(res.exception);
  }
  return res.parsedData!.insert_service_provider_offer_one?.id;
}

Future<int?> update_service_offer({
  required cModels.Offer offer,
  required int serviceProviderId,
}) async {
  QueryResult<Mutation$update_offer> res =
      await _db.graphQLClient.mutate$update_offer(
    Options$Mutation$update_offer(
        variables: Variables$Mutation$update_offer(
      id: offer.id.toInt(),
      service_provider_id: serviceProviderId,
      offer: Input$service_provider_offer_set_input(
        offer_type: offer.offerType.toFirebaseFormatString(),
        details: offer.details.toFirebaseFormattedJson(),
        status: offer.status.toFirebaseFormatString(),
        coupon_code: offer.couponCode,
      ),
    )),
  );

  offer.name!.forEach((cModels.Language key, String value) async {
    await update_translation(
        langType: key, value: value, translationId: offer.nameId!.toInt());
  });

  mezDbgPrint("update_service_offer ===========>${res.data}");
  if (res.parsedData == null) {
    throwError(res.exception);
  }
  return res.parsedData!.update_service_provider_offer?.returning[0].id;
}
