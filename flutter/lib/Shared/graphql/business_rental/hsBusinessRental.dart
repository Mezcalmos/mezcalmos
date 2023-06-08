import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/__generated/schema.graphql.dart';
import 'package:mezcalmos/Shared/graphql/business_rental/__generated/business_rental.graphql.dart';
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';
import 'package:mezcalmos/Shared/helpers/BusinessHelpers/BusinessItemHelpers.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';
import 'package:mezcalmos/Shared/models/Utilities/PaymentInfo.dart';

HasuraDb _db = Get.find<HasuraDb>();

Future<List<RentalCard>> get_rental_by_category(
    {required RentalCategory1 category1,
    required double distance,
    required Location fromLocation,
    List<RentalCategory2>? categories2,
    List<String>? tags,
    int? offset,
    int? limit,
    required bool withCache}) async {
  final List<RentalCard> _rentals = <RentalCard>[];

  final QueryResult<Query$get_rental_by_category> response = await _db
      .graphQLClient
      .query$get_rental_by_category(Options$Query$get_rental_by_category(
          fetchPolicy:
              withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.networkOnly,
          variables: Variables$Query$get_rental_by_category(
              category1: category1.toFirebaseFormatString(),
              categories2: categories2
                      ?.map((RentalCategory2 e) => e.toFirebaseFormatString())
                      .toList() ??
                  ["uncategorized"],
              tags: tags ?? [],
              distance: distance,
              from: Geography(
                  fromLocation.lat.toDouble(), fromLocation.lng.toDouble()),
              offset: offset,
              limit: limit)));

  if (response.parsedData?.business_rental != null) {
    response.parsedData?.business_rental
        .forEach((Query$get_rental_by_category$business_rental data) async {
      _rentals.add(RentalCard(
        businessName: data.business.details.name,
        currency: data.business.details.currency.toCurrency(),
        rental: Rental(
            category1: data.details.category1.toRentalCategory1(),
            category2: data.details.category2.toRentalCategory2(),
            category3: data.category3.toRentalCategory3(),
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
            bathrooms: data.home_rental?.bathrooms,
            bedrooms: data.home_rental?.bedrooms,
            homeType: data.home_rental?.home_type.toHomeType(),
            gpsLocation: (data.home_rental != null)
                ? Location(
                    lat: data.home_rental!.gps_location.latitude,
                    lng: data.home_rental!.gps_location.longitude,
                    address: data.home_rental!.address)
                : null),
      ));
    });
    return _rentals;
  } else if (response.hasException) {
    throw Exception("🚨🚨🚨🚨 Hasura querry error : ${response.exception}");
  } else {
    return [];
  }
}

Future<RentalWithBusinessCard?> get_rental_by_id(
    {required int id, required bool withCache}) async {
  final QueryResult<Query$get_rental_by_id> response = await _db.graphQLClient
      .query$get_rental_by_id(Options$Query$get_rental_by_id(
          fetchPolicy:
              withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.networkOnly,
          variables: Variables$Query$get_rental_by_id(id: id)));

  mezDbgPrint("[+] -> id : $id");
  if (response.parsedData?.business_rental_by_pk == null) {
    throw Exception("🚨🚨🚨🚨 Hasura querry error : ${response.exception}");
  } else if (response.parsedData != null) {
    mezDbgPrint("✅✅✅✅ Hasura query success ");
    final Query$get_rental_by_id$business_rental_by_pk? data =
        response.parsedData?.business_rental_by_pk!;

    if (data != null) {
      final RentalWithBusinessCard returnedRental = RentalWithBusinessCard(
          rental: Rental(
              id: data.id,
              category1: data.details.category1.toRentalCategory1(),
              category2: data.details.category2.toRentalCategory2(),
              category3: data.category3.toRentalCategory3(),
              details: BusinessItemDetails(
                nameId: data.details.name_id,
                descriptionId: data.details.description_id,
                id: data.details.id,
                name:
                    toLanguageMap(translations: data.details.name.translations),
                position: data.details.position,
                businessId: data.business.id,
                available: data.details.available,
                cost: constructBusinessServiceCost(data.details.cost),
                image: data.details.image
                        ?.map<String>((e) => e.toString())
                        .toList() ??
                    [],
                additionalParameters: data.details.additional_parameters,
                description: toLanguageMap(
                    translations: data.details.description?.translations ?? []),
              ),
              bathrooms: data.home_rental?.bathrooms,
              bedrooms: data.home_rental?.bedrooms,
              homeType: data.home_rental?.home_type.toHomeType(),
              gpsLocation: (data.home_rental != null)
                  ? Location(
                      lat: data.home_rental!.gps_location.latitude,
                      lng: data.home_rental!.gps_location.longitude,
                      address: data.home_rental!.address)
                  : null),
          business: BusinessCard(
            lastActive: data.business.details.last_active_time != null
                ? DateTime.parse(data.business.details.last_active_time!)
                : null,
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
      returnedRental.id = id;
      return returnedRental;
    }
  } else
    return null;
  return null;
}

Future<int?> get_number_of_rental(
    {required double distance,
    required Location fromLocation,
    required bool withCache}) async {
  final QueryResult<Query$number_of_rentals> response = await _db.graphQLClient
      .query$number_of_rentals(Options$Query$number_of_rentals(
          fetchPolicy:
              withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.networkOnly,
          variables: Variables$Query$number_of_rentals(
              distance: distance,
              from: Geography(
                  fromLocation.lat.toDouble(), fromLocation.lng.toDouble()))));

  if (response.parsedData?.business_rental_aggregate.aggregate != null) {
    return response.parsedData!.business_rental_aggregate.aggregate!.count;
  } else if (response.hasException) {
    throw Exception("🚨🚨🚨🚨 Hasura querry error : ${response.exception}");
  } else {
    return null;
  }
}

Future<List<RentalCard>> get_home_rentals(
    {required double distance,
    required Location fromLocation,
    int? offset,
    int? limit,
    required bool withCache}) async {
  final List<RentalCard> _homes = <RentalCard>[];

  final QueryResult<Query$get_home_rentals> response = await _db.graphQLClient
      .query$get_home_rentals(Options$Query$get_home_rentals(
          fetchPolicy:
              withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.networkOnly,
          variables: Variables$Query$get_home_rentals(
              distance: distance,
              location: Geography(
                  fromLocation.lat.toDouble(), fromLocation.lng.toDouble()),
              offset: offset,
              limit: limit)));

  mezDbgPrint("get_home_rentals $response");

  if (response.parsedData?.business_get_home_rentals != null) {
    response.parsedData?.business_get_home_rentals
        .forEach((Query$get_home_rentals$business_get_home_rentals data) async {
      _homes.add(RentalCard(
          businessName: data.rental.business.details.name,
          currency: data.rental.business.details.currency.toCurrency(),
          rental: Rental(
            category1: data.rental.details.category1.toRentalCategory1(),
            details: BusinessItemDetails(
              id: data.rental.id,
              nameId: data.rental.details.name_id,
              descriptionId: data.rental.details.description_id,
              name: toLanguageMap(
                  translations: data.rental.details.name.translations),
              position: data.rental.details.position,
              businessId: data.rental.business.id,
              available: data.rental.details.available,
              image: data.rental.details.image
                      ?.map<String>((e) => e.toString())
                      .toList() ??
                  [],
              cost: constructBusinessServiceCost(data.rental.details.cost),
              additionalParameters: data.rental.details.additional_parameters,
            ),
            bathrooms: data.bathrooms,
            bedrooms: data.bedrooms,
            gpsLocation: Location(
                lat: data.gps_location.latitude,
                lng: data.gps_location.longitude,
                address: data.address),
            homeType: data.home_type.toHomeType(),
          )));
    });
    return _homes;
  } else {
    return [];
  }
}

Future<List<RentalCard>> get_business_home_rentals(
    {required int busniessId,
    int? offset,
    int? limit,
    required bool withCache}) async {
  final List<RentalCard> _homes = <RentalCard>[];

  final QueryResult<Query$get_business_home_rentals> response = await _db
      .graphQLClient
      .query$get_business_home_rentals(Options$Query$get_business_home_rentals(
          fetchPolicy:
              withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.networkOnly,
          variables: Variables$Query$get_business_home_rentals(
              businessId: busniessId, offset: offset, limit: limit)));

  mezDbgPrint("get_home_rentals $response");

  if (response.parsedData?.business_home_rental != null) {
    response.parsedData?.business_home_rental.forEach(
        (Query$get_business_home_rentals$business_home_rental data) async {
      _homes.add(RentalCard(
          businessName: data.rental.business.details.name,
          currency: data.rental.business.details.currency.toCurrency(),
          rental: Rental(
            id: data.rental.id,
            category1: data.rental.details.category1.toRentalCategory1(),
            details: BusinessItemDetails(
              id: data.rental.details.id,
              name: toLanguageMap(
                  translations: data.rental.details.name.translations),
              position: data.rental.details.position,
              businessId: data.rental.business.id,
              available: data.rental.details.available,
              image: data.rental.details.image
                      ?.map<String>((e) => e.toString())
                      .toList() ??
                  [],
              cost: constructBusinessServiceCost(data.rental.details.cost),
              additionalParameters: data.rental.details.additional_parameters,
            ),
            bathrooms: data.bathrooms,
            bedrooms: data.bedrooms,
            gpsLocation: Location(
                lat: data.gps_location.latitude,
                lng: data.gps_location.longitude,
                address: data.address),
            homeType: data.home_type.toHomeType(),
          )));
    });
    return _homes;
  } else {
    return [];
  }
}

Future<List<RentalCard>> get_business_rentals(
    {required int busniessId,
    int? offset,
    int? limit,
    required bool withCache}) async {
  final List<RentalCard> _homes = <RentalCard>[];

  final QueryResult<Query$get_business_rentals> response = await _db
      .graphQLClient
      .query$get_business_rentals(Options$Query$get_business_rentals(
          fetchPolicy:
              withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.networkOnly,
          variables: Variables$Query$get_business_rentals(
              businessId: busniessId, offset: offset, limit: limit)));

  mezDbgPrint("get_home_rentals $response");

  if (response.parsedData?.business_rental != null) {
    response.parsedData?.business_rental
        .forEach((Query$get_business_rentals$business_rental data) async {
      _homes.add(RentalCard(
          businessName: data.business.details.name,
          currency: data.business.details.currency.toCurrency(),
          rental: Rental(
            id: data.id,
            category1: data.details.category1.toRentalCategory1(),
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
    return _homes;
  } else {
    return [];
  }
}

Future<int?> add_one_rental({required Rental rental}) async {
  // mezDbgPrint("Adding this rental 🇹🇳 ${rental.toJson()}");

  final QueryResult<Mutation$create_rental> response = await _db.graphQLClient
      .mutate$create_rental(Options$Mutation$create_rental(
          variables: Variables$Mutation$create_rental(
              object: Input$business_rental_insert_input(
                  business_id: rental.details.businessId.toInt(),
                  category3: rental.category3?.toFirebaseFormatString(),
                  details: Input$business_item_details_obj_rel_insert_input(
                      data: Input$business_item_details_insert_input(
                          available: rental.details.available,
                          business_id: rental.details.businessId.toInt(),
                          category1: rental.category1.toFirebaseFormatString(),
                          category2:
                              rental.category2?.toFirebaseFormatString() ??
                                  RentalCategory2.Uncategorized
                                      .toFirebaseFormatString(),
                          cost: rental.details.cost.map(
                              (TimeUnit key, num value) => MapEntry(
                                  key.toFirebaseFormatString(),
                                  value.toDouble())),
                          image: rental.details.image,
                          name: Input$translation_obj_rel_insert_input(
                              data: Input$translation_insert_input(
                            service_provider_id:
                                rental.details.businessId.toInt(),
                            service_provider_type: ServiceProviderType.Business
                                .toFirebaseFormatString(),
                            translations:
                                Input$translation_value_arr_rel_insert_input(
                              data: rental.details.name.entries
                                  .map((MapEntry<Language, String> e) =>
                                      Input$translation_value_insert_input(
                                          language_id:
                                              e.key.toFirebaseFormatString(),
                                          value: e.value))
                                  .toList(),
                            ),
                          )),
                          position: rental.details.position?.toInt(),
                          additional_parameters:
                              rental.details.additionalParameters,
                          description: (rental.details.description != null)
                              ? Input$translation_obj_rel_insert_input(
                                  data: Input$translation_insert_input(
                                    service_provider_id:
                                        rental.details.businessId.toInt(),
                                    service_provider_type: ServiceProviderType
                                        .Business.toFirebaseFormatString(),
                                    translations:
                                        Input$translation_value_arr_rel_insert_input(
                                      data: rental.details.description!.entries
                                          .map((MapEntry<Language, String> e) =>
                                              Input$translation_value_insert_input(
                                                  language_id: e.key
                                                      .toFirebaseFormatString(),
                                                  value: e.value))
                                          .toList(),
                                    ),
                                  ),
                                )
                              : null))))));
  if (response.hasException) {
    mezDbgPrint(
        "🚨🚨🚨 Hasura add rental mutation exception =>${response.exception}");
  } else {
    mezDbgPrint("✅✅✅ Hasura add rental mutation success => ${response.data}");
    return response.parsedData?.insert_business_rental_one?.id;
  }
  return null;
}

Future<int?> add_one_home_rental({required Rental rental}) async {
  // mezDbgPrint("Adding this rental 🇹🇳 ${rental.toJson()}");

  final QueryResult<Mutation$add_home_rental> response = await _db.graphQLClient
      .mutate$add_home_rental(Options$Mutation$add_home_rental(
          variables: Variables$Mutation$add_home_rental(
              object: Input$business_home_rental_insert_input(
    bathrooms: rental.bathrooms?.toInt(),
    bedrooms: rental.bedrooms?.toInt(),
    gps_location: (rental.gpsLocation != null)
        ? Geography(rental.gpsLocation!.lat.toDouble(),
            rental.gpsLocation!.lng.toDouble())
        : null,
    home_type: rental.homeType?.toFirebaseFormatString(),
    address: rental.gpsLocation?.address,
    rental: Input$business_rental_obj_rel_insert_input(
        data: Input$business_rental_insert_input(
            business_id: rental.details.businessId.toInt(),
            category3: rental.category3?.toFirebaseFormatString(),
            details: Input$business_item_details_obj_rel_insert_input(
                data: Input$business_item_details_insert_input(
                    available: rental.details.available,
                    business_id: rental.details.businessId.toInt(),
                    category1: rental.category1.toFirebaseFormatString(),
                    category2: rental.category2?.toFirebaseFormatString() ??
                        RentalCategory2.Uncategorized.toFirebaseFormatString(),
                    cost: rental.details.cost.map((TimeUnit key, num value) =>
                        MapEntry(
                            key.toFirebaseFormatString(), value.toDouble())),
                    image: rental.details.image,
                    name: Input$translation_obj_rel_insert_input(
                        data: Input$translation_insert_input(
                      service_provider_id: rental.details.businessId.toInt(),
                      service_provider_type:
                          ServiceProviderType.Business.toFirebaseFormatString(),
                      translations:
                          Input$translation_value_arr_rel_insert_input(
                        data: rental.details.name.entries
                            .map((MapEntry<Language, String> e) =>
                                Input$translation_value_insert_input(
                                    language_id: e.key.toFirebaseFormatString(),
                                    value: e.value))
                            .toList(),
                      ),
                    )),
                    position: rental.details.position?.toInt(),
                    additional_parameters: rental.details.additionalParameters,
                    description: (rental.details.description != null)
                        ? Input$translation_obj_rel_insert_input(
                            data: Input$translation_insert_input(
                            service_provider_id:
                                rental.details.businessId.toInt(),
                            service_provider_type: ServiceProviderType.Business
                                .toFirebaseFormatString(),
                            translations:
                                Input$translation_value_arr_rel_insert_input(
                              data: rental.details.description!.entries
                                  .map((MapEntry<Language, String> e) =>
                                      Input$translation_value_insert_input(
                                          language_id:
                                              e.key.toFirebaseFormatString(),
                                          value: e.value))
                                  .toList(),
                            ),
                          ))
                        : null)))),
  ))));
  if (response.hasException) {
    mezDbgPrint(
        "🚨🚨🚨 Hasura add rental mutation exception =>${response.exception}");
  } else {
    mezDbgPrint("✅✅✅ Hasura add rental mutation success => ${response.data}");
    return response.parsedData?.insert_business_home_rental_one?.rental_id;
  }
  return null;
}

Future<Rental?> update_business_home_rental(
    {required int id, required Rental rental}) async {
  final QueryResult<Mutation$update_home_rental_by_id> res =
      await _db.graphQLClient.mutate$update_home_rental_by_id(
    Options$Mutation$update_home_rental_by_id(
      variables: Variables$Mutation$update_home_rental_by_id(
        id: id,
        object: Input$business_home_rental_set_input(
          bathrooms: rental.bathrooms?.toInt(),
          bedrooms: rental.bedrooms?.toInt(),
          gps_location: (rental.gpsLocation != null)
              ? Geography(rental.gpsLocation!.lat.toDouble(),
                  rental.gpsLocation!.lng.toDouble())
              : null,
          home_type: rental.homeType?.toFirebaseFormatString(),
          address: rental.gpsLocation?.address,
        ),
      ),
    ),
  );
  if (res.hasException) {
    mezDbgPrint(
        "🚨🚨🚨 Hasura update home rental mutation exception =>${res.data}");
    throwError(res.exception);
  } else if (res.parsedData?.update_business_home_rental_by_pk != null) {
    final Mutation$update_home_rental_by_id$update_business_home_rental_by_pk
        data = res.parsedData!.update_business_home_rental_by_pk!;
    return Rental(
        id: id,
        category1: data.rental.details.category1.toRentalCategory1(),
        category2: data.rental.details.category2.toRentalCategory2(),
        category3: data.rental.category3.toRentalCategory3(),
        details: BusinessItemDetails(
          nameId: data.rental.details.name_id,
          descriptionId: data.rental.details.description_id,
          id: data.rental.details.id,
          name: toLanguageMap(
              translations: data.rental.details.name.translations),
          position: data.rental.details.position,
          businessId: data.rental.business.id,
          available: data.rental.details.available,
          cost: constructBusinessServiceCost(data.rental.details.cost),
          image: data.rental.details.image
                  ?.map<String>((e) => e.toString())
                  .toList() ??
              [],
          additionalParameters: data.rental.details.additional_parameters,
          description: toLanguageMap(
              translations:
                  data.rental.details.description?.translations ?? []),
        ),
        bathrooms: data.bathrooms,
        bedrooms: data.bedrooms,
        homeType: data.home_type.toHomeType(),
        gpsLocation: (data.gps_location != null)
            ? Location(
                lat: data.gps_location.latitude,
                lng: data.gps_location.longitude,
                address: data.address)
            : null);
  }

  return null;
}

Future<int?> update_rental_category2({
  required int id,
  required RentalCategory2 category2,
}) async {
  final QueryResult<Mutation$update_rental_category2> response =
      await _db.graphQLClient.mutate$update_rental_category2(
    Options$Mutation$update_rental_category2(
      variables: Variables$Mutation$update_rental_category2(
        id: id,
        category2: category2.toFirebaseFormatString(),
      ),
    ),
  );
  if (response.hasException) {
    mezDbgPrint(
        "🚨🚨🚨 Hasura update rental category2 mutation exception =>${response.exception}");
  } else {
    mezDbgPrint(
        "✅✅✅ Hasura update rental category2 mutation success => ${response.data}");
    return response.parsedData?.update_business_item_details!.affected_rows;
  }
  return null;
}

Future<int?> update_rental_category3({
  required int id,
  required RentalCategory3 category3,
}) async {
  final QueryResult<Mutation$update_rental_category3> response =
      await _db.graphQLClient.mutate$update_rental_category3(
    Options$Mutation$update_rental_category3(
      variables: Variables$Mutation$update_rental_category3(
        id: id,
        category3: category3.toFirebaseFormatString(),
      ),
    ),
  );
  if (response.hasException) {
    mezDbgPrint(
        "🚨🚨🚨 Hasura update rental category3 mutation exception =>${response.exception}");
  } else {
    mezDbgPrint(
        "✅✅✅ Hasura update rental category3 mutation success => ${response.data}");
    return response.parsedData?.update_business_rental!.affected_rows;
  }
  return null;
}

Future<int?> delete_busines_rental({required int rentalId}) async {
  final QueryResult<Mutation$delete_business_rental> response =
      await _db.graphQLClient.mutate$delete_business_rental(
    Options$Mutation$delete_business_rental(
      variables: Variables$Mutation$delete_business_rental(
        id: rentalId,
      ),
    ),
  );
  if (response.hasException) {
    mezDbgPrint(
        "🚨🚨🚨 Hasura delete rental mutation exception =>${response.exception}");
  } else {
    mezDbgPrint(
        "✅✅✅ Hasura delete rental mutation success => ${response.data}");
    return response.parsedData?.delete_business_rental_by_pk?.id;
  }
  return null;
}

Future<BusinessOrder?> get_home_rental_order_req(
    {required int orderId, bool withCache = true}) async {
  QueryResult<Query$getHomeRentalOrderRequest> res = await _db.graphQLClient
      .query$getHomeRentalOrderRequest(Options$Query$getHomeRentalOrderRequest(
          fetchPolicy:
              withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.noCache,
          variables:
              Variables$Query$getHomeRentalOrderRequest(orderId: orderId)));
  if (res.hasException ||
      res.parsedData?.business_order_request_by_pk == null) {
    throw Exception("🚨🚨🚨🚨 Hasura querry error : ${res.exception}");
  }
  mezDbgPrint(
      "✅✅✅✅ Hasura query success $orderId =====>${res.parsedData?.business_order_request_by_pk?.items.length}");
  final Query$getHomeRentalOrderRequest$business_order_request_by_pk data =
      res.parsedData!.business_order_request_by_pk!;
  return BusinessOrder(
      orderId: data.id,
      chatId: data.chat_id,
      customer: UserInfo(
          firebaseId: data.customer.user.firebase_id,
          id: data.customer.user_id,
          language: Language.EN,
          name: data.customer.user.name,
          image: data.customer.user.image),
      customerId: data.customer_id,
      businessId: data.business_id,
      spDetailsId: data.business.details_id,
      status: data.status.toBusinessOrderRequestStatus(),
      items: data.items
          .map(
              (Query$getHomeRentalOrderRequest$business_order_request_by_pk$items
                      item) =>
                  BusinessOrderItem(
                    id: item.id,
                    cost: item.cost,
                    time: item.time,
                    available: item.available,
                    itemId: item.id,
                    offeringType: item.offering_type.toOfferingType(),
                    parameters: businessItemParamsFromData(item.parameters),
                    item: BusinessItemDetails(
                      id: item.id,
                      name: toLanguageMap(
                          translations: item.rental!.details.name.translations),
                      position: item.rental!.details.position,
                      businessId: data.business_id,
                      available: item.available,
                      image: item.rental?.details.image
                              ?.map<String>((e) => e.toString())
                              .toList() ??
                          [],
                      cost: constructBusinessServiceCost(
                          item.rental!.details.cost),
                      additionalParameters:
                          item.rental!.details.additional_parameters,
                    ),
                  ))
          .toList(),
      cost: data.cost?.toDouble() ?? 0,
      customerAppType: CustomerAppType.Native);
}

Stream<BusinessOrder?> listen_home_rental_order_req({required int id}) {
  return _db.graphQLClient
      .subscribe$listenHomeRentalOrderRequest(
          Options$Subscription$listenHomeRentalOrderRequest(
              variables: Variables$Subscription$listenHomeRentalOrderRequest(
                  orderId: id)))
      .map<BusinessOrder?>(
          (QueryResult<Subscription$listenHomeRentalOrderRequest> event) {
    Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk?
        data = event.parsedData?.business_order_request_by_pk;
    if (data != null) {
      return BusinessOrder(
          orderId: data.id,
          chatId: data.chat_id,
          customer: UserInfo(
              id: data.customer.user_id,
              firebaseId: data.customer.user.firebase_id,
              language: Language.EN,
              name: data.customer.user.name,
              image: data.customer.user.image),
          customerId: data.customer_id,
          businessId: data.business_id,
          spDetailsId: data.business.details_id,
          status: data.status.toBusinessOrderRequestStatus(),
          items: data.items
              .map(
                  (Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items
                          item) =>
                      BusinessOrderItem(
                        id: item.id,
                        cost: item.cost,
                        time: item.time,
                        itemId: item.id,
                        available: item.available,
                        offeringType: item.offering_type.toOfferingType(),
                        parameters: businessItemParamsFromData(item.parameters),
                        item: BusinessItemDetails(
                          id: item.id,
                          name: toLanguageMap(
                              translations:
                                  item.rental!.details.name.translations),
                          position: item.rental!.details.position,
                          businessId: data.business_id,
                          available: item.available,
                          image: item.rental?.details.image
                                  ?.map<String>((e) => e.toString())
                                  .toList() ??
                              [],
                          cost: constructBusinessServiceCost(
                              item.rental!.details.cost),
                          additionalParameters:
                              item.rental!.details.additional_parameters,
                        ),
                      ))
              .toList(),
          cost: data.cost?.toDouble() ?? 0,
          customerAppType: CustomerAppType.Native);
    }
    return null;
  });
}
