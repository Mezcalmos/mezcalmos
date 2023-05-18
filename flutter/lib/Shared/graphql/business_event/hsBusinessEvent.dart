import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/__generated/schema.graphql.dart';
import 'package:mezcalmos/Shared/graphql/business_event/__generated/business_event.graphql.dart';
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';
import 'package:mezcalmos/Shared/models/Utilities/PaymentInfo.dart';
import 'package:mezcalmos/Shared/models/Utilities/Schedule.dart';

HasuraDb _db = Get.find<HasuraDb>();

Future<List<EventCard>> get_event_by_category(
    {required List<EventCategory1> categories1,
    required double distance,
    required Location fromLocation,
    required List<ScheduleType> scheduleType,
    List<EventCategory2>? categories2,
    List<String>? tags,
    int? offset,
    int? limit,
    required bool withCache}) async {
  final List<EventCard> _events = <EventCard>[];

  final QueryResult<Query$get_event_by_category> response = await _db
      .graphQLClient
      .query$get_event_by_category(Options$Query$get_event_by_category(
          fetchPolicy:
              withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.networkOnly,
          variables: Variables$Query$get_event_by_category(
              categories1: categories1
                  .map((EventCategory1 e) => e.toFirebaseFormatString())
                  .toList(),
              // distance: distance,
              // from: Geography(
              //     fromLocation.lat.toDouble(), fromLocation.lng.toDouble()),
              categories2: categories2
                      ?.map((EventCategory2 e) => e.toFirebaseFormatString())
                      .toList() ??
                  ["uncategorized"],
              schedule_type: scheduleType
                  .map((ScheduleType e) => e.toFirebaseFormatString())
                  .toList(),
              tags: tags ?? [],
              offset: offset,
              limit: limit)));
  mezDbgPrint("Event response ======>${response.parsedData?.toJson()}");
  if (response.parsedData?.business_event != null) {
    response.parsedData?.business_event
        .forEach((Query$get_event_by_category$business_event data) async {
      _events.add(EventCard(
          businessName: data.business.details.name,
          currency: data.business.details.currency.toCurrency(),
          event: Event(
            category1: data.details.category1.toEventCategory1(),
            gpsLocation: data.gps_location != null && data.address != null
                ? Location(
                    lat: data.gps_location!.latitude,
                    lng: data.gps_location!.longitude,
                    address: data.address!)
                : null,
            //  time: data.time,
            tags: data.details.tags
                    ?.map<EventTag>((e) => e.toString().toEventTag())
                    .toList() ??
                [],
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
            scheduleType: data.schedule_type.toScheduleType(),
            schedule: (data.schedule != null)
                ? scheduleFromData(data.schedule)
                : null,
          )));
    });
    return _events;
  } else {
    throw Exception("🚨🚨🚨🚨 Hasura querry error : ${response.exception}");
  }
}

Future<List<EventCard>> get_class_by_category(
    {required List<EventCategory1> categories1,
    required double distance,
    required Location fromLocation,
    required List<ScheduleType> scheduleType,
    List<EventCategory2>? categories2,
    List<String>? tags,
    int? offset,
    int? limit,
    required bool withCache}) async {
  final List<EventCard> _classes = <EventCard>[];

  final QueryResult<Query$get_class_by_category> response = await _db
      .graphQLClient
      .query$get_class_by_category(Options$Query$get_class_by_category(
          fetchPolicy:
              withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.networkOnly,
          variables: Variables$Query$get_class_by_category(
              categories1: categories1
                  .map((EventCategory1 e) => e.toFirebaseFormatString())
                  .toList(),
              distance: distance,
              from: Geography(
                  fromLocation.lat.toDouble(), fromLocation.lng.toDouble()),
              categories2: categories2
                      ?.map((EventCategory2 e) => e.toFirebaseFormatString())
                      .toList() ??
                  ["uncategorized"],
              schedule_type: scheduleType
                  .map((ScheduleType e) => e.toFirebaseFormatString())
                  .toList(),
              tags: tags ?? [],
              offset: offset,
              limit: limit)));
  mezDbgPrint("Event response ======>${response.data}");
  if (response.parsedData?.business_event != null) {
    response.parsedData?.business_event
        .forEach((Query$get_class_by_category$business_event data) async {
      _classes.add(EventCard(
          businessName: data.business.details.name,
          currency: data.business.details.currency.toCurrency(),
          event: Event(
            category1: data.details.category1.toEventCategory1(),
            gpsLocation: data.gps_location != null && data.address != null
                ? Location(
                    lat: data.gps_location!.latitude,
                    lng: data.gps_location!.longitude,
                    address: data.address!)
                : null,
            // time: data.time,
            tags: data.details.tags
                    ?.map<EventTag>((e) => e.toString().toEventTag())
                    .toList() ??
                [],
            details: BusinessItemDetails(
              id: data.id,
              name: toLanguageMap(translations: data.details.name.translations),
              position: data.details.position,
              businessId: data.business.id,
              available: data.details.available,
              image: data.details.image
                      ?.map((e) => e.toString())
                      .toList()
                      .cast<String>() ??
                  [],
              cost: constructBusinessServiceCost(data.details.cost),
              additionalParameters: data.details.additional_parameters,
            ),
            scheduleType: data.schedule_type.toScheduleType(),
            schedule: (data.schedule != null)
                ? scheduleFromData(data.schedule)
                : null,
          )));
    });
    return _classes;
  } else {
    throw Exception("🚨🚨🚨🚨 Hasura querry error : ${response.exception}");
  }
}

Future<EventWithBusinessCard?> get_event_by_id(
    {required int id, required bool withCache}) async {
  final QueryResult<Query$get_event_by_id> response = await _db.graphQLClient
      .query$get_event_by_id(Options$Query$get_event_by_id(
          fetchPolicy:
              withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.networkOnly,
          variables: Variables$Query$get_event_by_id(id: id)));

  mezDbgPrint("[+] -> id : $id");
  if (response.parsedData?.business_event_by_pk == null) {
    throw Exception("🚨🚨🚨🚨 Hasura querry error : ${response.exception}");
  } else if (response.parsedData != null) {
    mezDbgPrint(
        "✅✅✅✅ Hasura query success starts at =====> ${response.parsedData?.business_event_by_pk?.starts_at} ");
    final Query$get_event_by_id$business_event_by_pk? data =
        response.parsedData?.business_event_by_pk!;

    if (data != null) {
      final EventWithBusinessCard returndedEvent = EventWithBusinessCard(
          event: Event(
              id: data.id,
              category1: data.details.category1.toEventCategory1(),
              category2: data.details.category2.toEventCategory2(),
              startsAt: data.starts_at,
              endsAt: data.ends_at,
              gpsLocation: data.gps_location != null && data.address != null
                  ? Location(
                      lat: data.gps_location!.latitude,
                      lng: data.gps_location!.longitude,
                      address: data.address!)
                  : null,
              tags: data.details.tags
                      ?.map<EventTag>((e) => e.toString().toEventTag())
                      .toList() ??
                  [],
              details: BusinessItemDetails(
                id: data.details.id,
                nameId: data.details.name_id,
                descriptionId: data.details.description_id,
                name:
                    toLanguageMap(translations: data.details.name.translations),
                position: data.details.position,
                businessId: data.business.id,
                available: data.details.available,
                cost: constructBusinessServiceCost(data.details.cost),
                description: toLanguageMap(
                    translations: data.details.description?.translations ?? []),
                additionalParameters: data.details.additional_parameters,
                image: data.details.image
                        ?.map((e) => e.toString())
                        .toList()
                        .cast<String>() ??
                    [],
              ),
              scheduleType: data.schedule_type.toScheduleType(),
              schedule: (data.schedule != null)
                  ? scheduleFromData(data.schedule)
                  : null),
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
      returndedEvent.startsAt = data.starts_at;
      returndedEvent.endsAt = data.ends_at;
      returndedEvent.id = data.id;
      mezDbgPrint(
          "returned value 🇹🇨🇹🇨🇹🇨🇹🇨🇹🇨 ${returndedEvent.startsAt}");
      mezDbgPrint(
          "returned value 🇹🇨🇹🇨🇹🇨🇹🇨🇹🇨 ${returndedEvent.endsAt}");
      return returndedEvent;
    }
  } else
    return null;
  return null;
}

Future<int?> get_number_of_classes(
    {required double distance,
    required Location fromLocation,
    required bool withCache}) async {
  final QueryResult<Query$number_of_classes> response = await _db.graphQLClient
      .query$number_of_classes(Options$Query$number_of_classes(
          fetchPolicy:
              withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.networkOnly,
          variables: Variables$Query$number_of_classes(
              distance: distance,
              from: Geography(
                  fromLocation.lat.toDouble(), fromLocation.lng.toDouble()))));

  if (response.parsedData?.business_event_aggregate.aggregate != null) {
    return response.parsedData!.business_event_aggregate.aggregate!.count;
  } else if (response.hasException) {
    throw Exception("🚨🚨🚨🚨 Hasura querry error : ${response.exception}");
  } else {
    return null;
  }
}

Future<int?> get_number_of_therapy(
    {required double distance,
    required Location fromLocation,
    required bool withCache}) async {
  final QueryResult<Query$number_of_therapy> response = await _db.graphQLClient
      .query$number_of_therapy(Options$Query$number_of_therapy(
          fetchPolicy:
              withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.networkOnly,
          variables: Variables$Query$number_of_therapy(
              distance: distance,
              from: Geography(
                  fromLocation.lat.toDouble(), fromLocation.lng.toDouble()))));

  if (response.parsedData?.business_event_aggregate.aggregate != null) {
    return response.parsedData!.business_event_aggregate.aggregate!.count;
  } else if (response.hasException) {
    throw Exception("🚨🚨🚨🚨 Hasura querry error : ${response.exception}");
  } else {
    return null;
  }
}

Future<int?> get_number_of_events(
    {required double distance,
    required Location fromLocation,
    required bool withCache}) async {
  final QueryResult<Query$number_of_events> response = await _db.graphQLClient
      .query$number_of_events(Options$Query$number_of_events(
          fetchPolicy:
              withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.networkOnly,
          variables: Variables$Query$number_of_events(
              distance: distance,
              from: Geography(
                  fromLocation.lat.toDouble(), fromLocation.lng.toDouble()))));

  if (response.parsedData?.business_event_aggregate.aggregate != null) {
    return response.parsedData!.business_event_aggregate.aggregate!.count;
  } else if (response.hasException) {
    throw Exception("🚨🚨🚨🚨 Hasura querry error : ${response.exception}");
  } else {
    return null;
  }
}

Future<int?> get_number_of_volunteer(
    {required double distance,
    required Location fromLocation,
    required bool withCache}) async {
  final QueryResult<Query$number_of_volunteer> response = await _db
      .graphQLClient
      .query$number_of_volunteer(Options$Query$number_of_volunteer(
          fetchPolicy:
              withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.networkOnly,
          variables: Variables$Query$number_of_volunteer(
              distance: distance,
              from: Geography(
                  fromLocation.lat.toDouble(), fromLocation.lng.toDouble()))));

  if (response.parsedData?.business_event_aggregate.aggregate != null) {
    return response.parsedData!.business_event_aggregate.aggregate!.count;
  } else if (response.hasException) {
    throw Exception("🚨🚨🚨🚨 Hasura querry error : ${response.exception}");
  } else {
    return null;
  }
}

Future<int?> get_number_of_adventure(
    {required double distance,
    required Location fromLocation,
    required bool withCache}) async {
  final QueryResult<Query$number_of_adventure> response = await _db
      .graphQLClient
      .query$number_of_adventure(Options$Query$number_of_adventure(
          fetchPolicy:
              withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.networkOnly,
          variables: Variables$Query$number_of_adventure(
              distance: distance,
              from: Geography(
                  fromLocation.lat.toDouble(), fromLocation.lng.toDouble()))));

  if (response.parsedData?.business_event_aggregate.aggregate != null) {
    return response.parsedData!.business_event_aggregate.aggregate!.count;
  } else if (response.hasException) {
    throw Exception("🚨🚨🚨🚨 Hasura querry error : ${response.exception}");
  } else {
    return null;
  }
}

Future<int?> add_one_event({
  required Event event,
}) async {
  // mezDbgPrint("Adding this rental 🇹🇳 ${rental.toJson()}");
  mezDbgPrint(
      "Event sent to db ::: ==============> ${event.startsAt} \n ${event.endsAt} \n ${event.tags} }");

  final QueryResult<Mutation$add_event> response = await _db.graphQLClient
      .mutate$add_event(Options$Mutation$add_event(
          variables: Variables$Mutation$add_event(
              object: Input$business_event_insert_input(
                  business_id: event.details.businessId.toInt(),
                  gps_location: (event.gpsLocation != null)
                      ? Geography(event.gpsLocation!.lat.toDouble(),
                          event.gpsLocation!.lng.toDouble())
                      : null,
                  address: event.gpsLocation?.address,
                  schedule_type: event.scheduleType.toFirebaseFormatString(),
                  schedule: event.schedule?.toFirebaseFormattedJson(),
                  starts_at: event.startsAt,
                  ends_at: event.endsAt,
                  //    time: event.time,
                  details: Input$business_item_details_obj_rel_insert_input(
                      data: Input$business_item_details_insert_input(
                    available: event.details.available,
                    business_id: event.details.businessId.toInt(),
                    tags: event.tags
                        ?.map((EventTag e) => e.toFirebaseFormatString())
                        .toList(),
                    category1: event.category1.toFirebaseFormatString(),
                    category2: event.category2?.toFirebaseFormatString() ??
                        EventCategory2.Uncategorized.toFirebaseFormatString(),
                    cost: event.details.cost.map((TimeUnit key, num value) =>
                        MapEntry(key.toFirebaseFormatString(), value)),
                    image: event.details.image,
                    name: Input$translation_obj_rel_insert_input(
                        data: Input$translation_insert_input(
                      service_provider_id: event.details.businessId.toInt(),
                      service_provider_type:
                          ServiceProviderType.Business.toFirebaseFormatString(),
                      translations:
                          Input$translation_value_arr_rel_insert_input(
                        data: event.details.name.entries
                            .map((MapEntry<Language, String> e) =>
                                Input$translation_value_insert_input(
                                    language_id: e.key.toFirebaseFormatString(),
                                    value: e.value))
                            .toList(),
                      ),
                    )),
                    position: event.details.position?.toInt(),
                    additional_parameters: event.details.additionalParameters,
                    description: (event.details.description != null)
                        ? Input$translation_obj_rel_insert_input(
                            data: Input$translation_insert_input(
                            service_provider_id:
                                event.details.businessId.toInt(),
                            service_provider_type: ServiceProviderType.Business
                                .toFirebaseFormatString(),
                            translations:
                                Input$translation_value_arr_rel_insert_input(
                              data: event.details.description!.entries
                                  .map((MapEntry<Language, String> e) =>
                                      Input$translation_value_insert_input(
                                          language_id:
                                              e.key.toFirebaseFormatString(),
                                          value: e.value))
                                  .toList(),
                            ),
                          ))
                        : null,
                  ))))));
  if (response.hasException) {
    mezDbgPrint(
        "🚨🚨🚨 Hasura add event mutation exception =>${response.exception}");
  } else {
    mezDbgPrint("✅✅✅ Hasura add event mutation success => ${response.data}");
    return response.parsedData?.insert_business_event_one?.id;
  }
  return null;
}

Future<int?> add_one_class({
  required Event event,
}) async {
  mezDbgPrint(
      "Event sent to db ::: ==============> ${event.startsAt} \n ${event.endsAt} \n ${event.tags} }");

  final QueryResult<Mutation$add_class> response =
      await _db.graphQLClient.mutate$add_class(Options$Mutation$add_class(
          variables: Variables$Mutation$add_class(
    business_id: event.details.businessId.toInt(),
    gps_location: (event.gpsLocation != null)
        ? Geography(event.gpsLocation!.lat.toDouble(),
            event.gpsLocation!.lng.toDouble())
        : null,
    address: event.gpsLocation?.address,
    schedule_type: event.scheduleType.toFirebaseFormatString(),
    schedule: event.schedule?.toFirebaseFormattedJson(),
    starts_at: event.startsAt,
    ends_at: event.endsAt,
    available: event.details.available,
    category1: event.category1.toFirebaseFormatString(),
    category2: event.category2?.toFirebaseFormatString() ??
        EventCategory2.Uncategorized.toFirebaseFormatString(),
    cost: event.details.cost.map((TimeUnit key, num value) =>
        MapEntry(key.toFirebaseFormatString(), value)),
    image: event.details.image,
    name: Input$translation_obj_rel_insert_input(
        data: Input$translation_insert_input(
      service_provider_id: event.details.businessId.toInt(),
      service_provider_type:
          ServiceProviderType.Business.toFirebaseFormatString(),
      translations: Input$translation_value_arr_rel_insert_input(
        data: event.details.name.entries
            .map((MapEntry<Language, String> e) =>
                Input$translation_value_insert_input(
                    language_id: e.key.toFirebaseFormatString(),
                    value: e.value))
            .toList(),
      ),
    )),
    position: event.details.position?.toInt(),
    additional_parameters: event.details.additionalParameters,
    description: (event.details.description != null)
        ? Input$translation_obj_rel_insert_input(
            data: Input$translation_insert_input(
            service_provider_id: event.details.businessId.toInt(),
            service_provider_type:
                ServiceProviderType.Business.toFirebaseFormatString(),
            translations: Input$translation_value_arr_rel_insert_input(
              data: event.details.description!.entries
                  .map((MapEntry<Language, String> e) =>
                      Input$translation_value_insert_input(
                          language_id: e.key.toFirebaseFormatString(),
                          value: e.value))
                  .toList(),
            ),
          ))
        : null,
  )));
  if (response.hasException) {
    mezDbgPrint(
        "🚨🚨🚨 Hasura add class mutation exception =>${response.exception}");
  } else {
    mezDbgPrint("✅✅✅ Hasura add class mutation success => ${response.data}");
    return response.parsedData?.insert_business_event_one?.id;
  }
  return null;
}

Future<List<EventCard>> get_business_events(
    {required int businessId,
    int? offset,
    int? limit,
    required bool withCache}) async {
  final List<EventCard> _events = <EventCard>[];

  final QueryResult<Query$get_business_events> response = await _db
      .graphQLClient
      .query$get_business_events(Options$Query$get_business_events(
          fetchPolicy:
              withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.networkOnly,
          variables: Variables$Query$get_business_events(
              businessId: businessId, offset: offset, limit: limit)));
  mezDbgPrint("Event response ======>${response.data}");
  if (response.parsedData?.business_event != null) {
    response.parsedData?.business_event
        .forEach((Query$get_business_events$business_event data) async {
      _events.add(EventCard(
          businessName: data.business.details.name,
          currency: data.business.details.currency.toCurrency(),
          event: Event(
            startsAt: data.starts_at,
            endsAt: data.ends_at,
            category2: data.details.category2.toEventCategory2(),
            id: data.id,
            category1: data.details.category1.toEventCategory1(),
            gpsLocation: data.gps_location != null && data.address != null
                ? Location(
                    lat: data.gps_location!.latitude,
                    lng: data.gps_location!.longitude,
                    address: data.address!)
                : null,
            //     time: data.time,
            tags: data.details.tags
                    ?.map<EventTag>((e) => e.toString().toEventTag())
                    .toList() ??
                [],
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
            scheduleType: data.schedule_type.toScheduleType(),
            schedule: (data.schedule != null)
                ? scheduleFromData(data.schedule)
                : null,
          )));
    });
    return _events;
  } else {
    throw Exception("🚨🚨🚨🚨 Hasura querry error : ${response.exception}");
  }
}

Future<EventWithBusinessCard?> update_event_by_id(
    {required int eventId, required Event event}) async {
  final QueryResult<Mutation$update_event_by_id> res =
      await _db.graphQLClient.mutate$update_event_by_id(
    Options$Mutation$update_event_by_id(
      variables: Variables$Mutation$update_event_by_id(
        id: eventId,
        object: Input$business_event_set_input(
          schedule: event.schedule?.toFirebaseFormattedJson(),
          schedule_type: event.scheduleType.toFirebaseFormatString(),
          starts_at: event.startsAt,
          ends_at: event.endsAt,
          gps_location: (event.gpsLocation != null)
              ? Geography(event.gpsLocation!.lat.toDouble(),
                  event.gpsLocation!.lng.toDouble())
              : null,
          address: event.gpsLocation?.address,
        ),
      ),
    ),
  );

  if (res.hasException || res.parsedData?.update_business_event_by_pk == null) {
    mezDbgPrint(
        "🚨🚨🚨🚨 Hasura update event by id exception : ${res.exception}");
    throw Exception(
        "🚨🚨🚨🚨 Hasura update event by id exception : ${res.exception}");
  } else {
    Mutation$update_event_by_id$update_business_event_by_pk? data =
        res.parsedData!.update_business_event_by_pk;
    if (data != null) {
      final EventWithBusinessCard returndedEvent = EventWithBusinessCard(
          event: Event(
              id: data.id,
              category1: data.details.category1.toEventCategory1(),
              category2: data.details.category2.toEventCategory2(),
              startsAt: data.starts_at,
              endsAt: data.ends_at,
              gpsLocation: data.gps_location != null && data.address != null
                  ? Location(
                      lat: data.gps_location!.latitude,
                      lng: data.gps_location!.longitude,
                      address: data.address!)
                  : null,
              tags: data.details.tags
                      ?.map<EventTag>((e) => e.toString().toEventTag())
                      .toList() ??
                  [],
              details: BusinessItemDetails(
                id: data.details.id,
                nameId: data.details.name_id,
                descriptionId: data.details.description_id,
                name:
                    toLanguageMap(translations: data.details.name.translations),
                position: data.details.position,
                businessId: data.business.id,
                available: data.details.available,
                cost: constructBusinessServiceCost(data.details.cost),
                description: toLanguageMap(
                    translations: data.details.description?.translations ?? []),
                additionalParameters: data.details.additional_parameters,
                image: data.details.image
                        ?.map((e) => e.toString())
                        .toList()
                        .cast<String>() ??
                    [],
              ),
              scheduleType: data.schedule_type.toScheduleType(),
              schedule: (data.schedule != null)
                  ? scheduleFromData(data.schedule)
                  : null),
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
      returndedEvent.startsAt = data.starts_at;
      returndedEvent.endsAt = data.ends_at;
      mezDbgPrint(
          "returned value 🇹🇨🇹🇨🇹🇨🇹🇨🇹🇨 ${returndedEvent.startsAt}");
      mezDbgPrint(
          "returned value 🇹🇨🇹🇨🇹🇨🇹🇨🇹🇨 ${returndedEvent.endsAt}");
      return returndedEvent;
    }
  }
  return null;
}
