import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/__generated/schema.graphql.dart';
import 'package:mezcalmos/Shared/graphql/business_service/__generated/business_service.graphql.dart';
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';
import 'package:mezcalmos/Shared/models/Utilities/PaymentInfo.dart';
import 'package:mezcalmos/Shared/models/Utilities/Schedule.dart';

HasuraDb _db = Get.find<HasuraDb>();

Future<List<ServiceCard>> get_service_by_category(
    {required List<ServiceCategory1> categories1,
    required double distance,
    required Location fromLocation,
    List<String>? categories2,
    List<String>? tags,
    int? offset,
    int? limit,
    required bool withCache}) async {
  final List<ServiceCard> _services = <ServiceCard>[];

  final QueryResult<Query$get_service_by_category> response = await _db
      .graphQLClient
      .query$get_service_by_category(Options$Query$get_service_by_category(
          fetchPolicy:
              withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.networkOnly,
          variables: Variables$Query$get_service_by_category(
              categories1: categories1
                  .map((ServiceCategory1 e) => e.toFirebaseFormatString())
                  .toList(),
              distance: distance,
              from: Geography(
                  fromLocation.lat.toDouble(), fromLocation.lng.toDouble()),
              categories2: categories2 ?? ["uncategorized"],
              tags: tags ?? [],
              offset: offset,
              limit: limit)));

  if (response.parsedData?.business_service != null) {
    response.parsedData?.business_service
        .forEach((Query$get_service_by_category$business_service data) async {
      _services.add(ServiceCard(
          businessName: data.business.details.name,
          currency: data.business.details.currency.toCurrency(),
          service: Service(
            category1: data.details.category1.toServiceCategory1(),
            details: BusinessItemDetails(
              id: data.id,
              name: toLanguageMap(translations: data.details.name.translations),
              position: data.details.position,
              businessId: data.business.id,
              available: data.details.available,
              image: data.details.image
                      ?.map<String>((e) => e.toString())
                      .toList() ??
                  [],
              cost: constructBusinessServiceCost(data.details.cost),
              additionalParameters: data.details.additional_parameters,
            ),
          )));
    });
    return _services;
  } else {
    throw Exception("🚨🚨🚨🚨 Hasura querry error : ${response.exception}");
  }
}

Future<ServiceWithBusinessCard?> get_service_by_id(
    {required int id, required bool withCache}) async {
  final QueryResult<Query$get_service_by_id> response = await _db.graphQLClient
      .query$get_service_by_id(Options$Query$get_service_by_id(
          fetchPolicy:
              withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.networkOnly,
          variables: Variables$Query$get_service_by_id(id: id)));

  mezDbgPrint("[+] -> id : $id");
  if (response.parsedData?.business_service_by_pk == null) {
    throw Exception("🚨🚨🚨🚨 Hasura querry error : ${response.exception}");
  } else if (response.parsedData != null) {
    mezDbgPrint("✅✅✅✅ Hasura query success ");

    final Query$get_service_by_id$business_service_by_pk data =
        response.parsedData!.business_service_by_pk!;
    // Map<PaymentType, bool> _acceptedPayments = {};
    // data.business.details.accepted_payments.forEach((k, v) {
    //   _acceptedPayments[k.toString().toPaymentType()] = v;
    // });
    List<String> images =
        data.details.image.map<String>((e) => e.toString()).toList();
    return ServiceWithBusinessCard(
        service: Service(
            category1: data.details.category1.toServiceCategory1(),
            schedule: (data.schedule != null)
                ? scheduleFromData(data.schedule)
                : null,
            details: BusinessItemDetails(
              id: data.details.id,
              nameId: data.details.name_id,
              descriptionId: data.details.description_id,
              name: toLanguageMap(translations: data.details.name.translations),
              businessId: data.business.id,
              available: data.details.available,
              cost: constructBusinessServiceCost(data.details.cost),
              description: toLanguageMap(
                  translations: data.details.description?.translations ?? []),
              additionalParameters: data.details.additional_parameters,
              image:
                  data.details.image?.map<String>((e) => e.toString()).toList(),

              // data.details.image?.entries.map((e) => e.value).toList() ??
              //     [],
            )),
        business: BusinessCard(
          id: data.business.id,
          detailsId: data.business.details.id,
          name: data.business.details.name,
          image: data.business.details.image,
          currency: data.business.details.currency.toCurrency(),
          acceptedPayments: PaymentInfo.fromData(
                  stripeInfo: {},
                  acceptedPayments: data.business.details.accepted_payments)
              .acceptedPayments,
          avgRating: double.tryParse(
              data.business.reviews_aggregate.aggregate?.avg.toString() ??
                  '0.0'),
          reviewCount: data.business.reviews_aggregate.aggregate?.count,
        ));
  } else
    return null;
  return null;
}

Future<int?> get_number_of_services(
    {required double distance,
    required Location fromLocation,
    required bool withCache}) async {
  final QueryResult<Query$number_of_services> response = await _db.graphQLClient
      .query$number_of_services(Options$Query$number_of_services(
          fetchPolicy:
              withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.networkOnly,
          variables: Variables$Query$number_of_services(
              distance: distance,
              from: Geography(
                  fromLocation.lat.toDouble(), fromLocation.lng.toDouble()))));

  if (response.parsedData?.business_service_aggregate.aggregate != null) {
    return response.parsedData!.business_service_aggregate.aggregate!.count;
  } else if (response.hasException) {
    throw Exception("🚨🚨🚨🚨 Hasura querry error : ${response.exception}");
  } else {
    return null;
  }
}

Future<int?> add_one_service({required Service service}) async {
  // mezDbgPrint("Adding this service 🇹🇳 ${service.toJson()}");

  final QueryResult<Mutation$add_service> response = await _db.graphQLClient
      .mutate$add_service(Options$Mutation$add_service(
          variables: Variables$Mutation$add_service(
              object: Input$business_service_insert_input(
                  schedule: service.schedule?.toFirebaseFormattedJson(),
                  business_id: service.details.businessId.toInt(),
                  details: Input$business_item_details_obj_rel_insert_input(
                      data: Input$business_item_details_insert_input(
                          available: service.details.available,
                          business_id: service.details.businessId.toInt(),
                          category1: service.category1.toFirebaseFormatString(),
                          // category2: service.category2?.toFirebaseFormatString(),
                          cost: service.details.cost.map(
                              (TimeUnit key, num value) => MapEntry(
                                  key.toFirebaseFormatString(),
                                  value.toDouble())),
                          image: service.details.image,
                          name: Input$translation_obj_rel_insert_input(
                              data: Input$translation_insert_input(
                            service_provider_id:
                                service.details.businessId.toInt(),
                            service_provider_type: ServiceProviderType.Business
                                .toFirebaseFormatString(),
                            translations:
                                Input$translation_value_arr_rel_insert_input(
                              data: service.details.name.entries
                                  .map((MapEntry<Language, String> e) =>
                                      Input$translation_value_insert_input(
                                          language_id:
                                              e.key.toFirebaseFormatString(),
                                          value: e.value))
                                  .toList(),
                            ),
                          )),
                          position: service.details.position?.toInt(),
                          additional_parameters:
                              service.details.additionalParameters,
                          description: (service.details.description != null)
                              ? Input$translation_obj_rel_insert_input(
                                  data: Input$translation_insert_input(
                                  service_provider_id:
                                      service.details.businessId.toInt(),
                                  service_provider_type: ServiceProviderType
                                      .Business.toFirebaseFormatString(),
                                  translations:
                                      Input$translation_value_arr_rel_insert_input(
                                    data: service.details.description!.entries
                                        .map((MapEntry<Language, String> e) =>
                                            Input$translation_value_insert_input(
                                                language_id: e.key
                                                    .toFirebaseFormatString(),
                                                value: e.value))
                                        .toList(),
                                  ),
                                ))
                              : null))))));
  if (response.hasException) {
    mezDbgPrint(
        "🚨🚨🚨 Hasura add service mutation exception =>${response.exception}");
  } else {
    mezDbgPrint("✅✅✅ Hasura add service mutation success => ${response.data}");
    return response.parsedData?.insert_business_service_one?.id;
  }
  return null;
}

Future<int?> update_service_schedule({
  required int id,
  required Schedule schedule,
}) async {
  final QueryResult<Mutation$update_business_service_schedule> response =
      await _db.graphQLClient.mutate$update_business_service_schedule(
          Options$Mutation$update_business_service_schedule(
              variables: Variables$Mutation$update_business_service_schedule(
                  id: id, schedule: schedule.toFirebaseFormattedJson())));
  if (response.hasException) {
    mezDbgPrint(
        "🚨🚨🚨 Hasura add service mutation exception =>${response.exception}");
  } else {
    mezDbgPrint(
        "✅✅✅ Hasura service schedule mutation success => ${response.data}");
    return response.parsedData?.update_business_service?.affected_rows;
  }
  return null;
}

Future<List<ServiceCard>> get_business_services(
    {required int businessId,
    int? offset,
    int? limit,
    required bool withCache}) async {
  final List<ServiceCard> _services = <ServiceCard>[];

  final QueryResult<Query$get_business_services> response = await _db
      .graphQLClient
      .query$get_business_services(Options$Query$get_business_services(
          fetchPolicy:
              withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.networkOnly,
          variables: Variables$Query$get_business_services(
              businessId: businessId, offset: offset, limit: limit)));

  if (response.parsedData?.business_service != null) {
    response.parsedData?.business_service
        .forEach((Query$get_business_services$business_service data) async {
      _services.add(ServiceCard(
          businessName: data.business.details.name,
          currency: data.business.details.currency.toCurrency(),
          service: Service(
            category1: data.details.category1.toServiceCategory1(),
            id: data.id,
            details: BusinessItemDetails(
              id: data.details.id,
              name: toLanguageMap(translations: data.details.name.translations),
              position: data.details.position,
              businessId: data.business.id,
              available: data.details.available,
              image: data.details.image
                      ?.map<String>((e) => e.toString())
                      .toList() ??
                  [],
              cost: constructBusinessServiceCost(data.details.cost),
              additionalParameters: data.details.additional_parameters,
            ),
          )));
    });
    return _services;
  } else {
    throw Exception("🚨🚨🚨🚨 Hasura querry error : ${response.exception}");
  }
}
