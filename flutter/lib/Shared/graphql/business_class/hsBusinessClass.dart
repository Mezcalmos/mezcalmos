import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/business_class/__generated/business_class.graphql.dart';
import 'package:mezcalmos/Shared/graphql/business_class/__generated/business_class.graphql.dart';
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';

HasuraDb _db = Get.find<HasuraDb>();

Future<List<ClassWithBusiness>> get_class_by_category(
    {required List<ClassCategory1> categories1,
    required double distance,
    required Location fromLocation,
    required List<ScheduleType> scheduleType,
    List<String>? categories2,
    int? offset,
    int? limit,
    required bool withCache}) async {
  final List<ClassWithBusiness> _classes = <ClassWithBusiness>[];
  final QueryResult<Query$get_class_by_category> response = await _db
      .graphQLClient
      .query$get_class_by_category(Options$Query$get_class_by_category(
          fetchPolicy:
              withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.networkOnly,
          variables: Variables$Query$get_class_by_category(
              categories1:
                  categories1.map((e) => e.toFirebaseFormatString()).toList(),
              distance: distance,
              from: Geography(
                  fromLocation.lat.toDouble(), fromLocation.lng.toDouble()),
              categories2: categories2,
              schedule_type:
                  scheduleType.map((e) => e.toFirebaseFormatString()).toList(),
              offset: offset,
              limit: limit)));

  if (response.parsedData?.business_class != null) {
    response.parsedData?.business_class
        .forEach((Query$get_class_by_category$business_class data) async {
      _classes.add(ClassWithBusiness(
          businessName: data.business.details.name,
          class_: Class(
            category1: data.service.category1.toClassCategory1(),
            gpsLocation: data.gps_location != null
                ? Location(
                    lat: data.gps_location!.latitude,
                    lng: data.gps_location!.longitude)
                : null,
            time: data.time,
            details: BusinessService(
              id: data.id,
              name: toLanguageMap(translations: data.service.name.translations),
              position: data.service.position,
              businessId: data.business.id,
              available: data.service.available,
              image: data.service.image?.entries.map((e) => e.value).toList() ??
                  [],
              cost: constructBusinessServiceCost(data.service.cost),
              additionalParameters: data.service.additional_parameters,
            ),
            scheduleType: data.schedule_type.toScheduleType(),
            schedule: data.schedule,
          )));
    });
    return _classes;
  } else {
    return [];
  }
}

Future<ClassWithBusiness?> get_class_by_id(
    {required int id, required bool withCache}) async {
  final QueryResult<Query$get_class_by_id> response = await _db.graphQLClient
      .query$get_class_by_id(Options$Query$get_class_by_id(
          fetchPolicy:
              withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.networkOnly,
          variables: Variables$Query$get_class_by_id(id: id)));

  mezDbgPrint("[+] -> id : $id");
  if (response.parsedData?.business_class_by_pk == null) {
    throw Exception("🚨🚨🚨🚨 Hasura querry error : ${response.exception}");
  } else if (response.parsedData != null) {
    mezDbgPrint("✅✅✅✅ Hasura query success ");
    final Query$get_class_by_id$business_class_by_pk? data =
        response.parsedData?.business_class_by_pk!;

    if (data != null) {
      return ClassWithBusiness(
          businessName: data.business.details.name,
          class_: Class(
              category1: data.service.category1.toClassCategory1(),
              gpsLocation: data.gps_location != null
                  ? Location(
                      lat: data.gps_location!.latitude,
                      lng: data.gps_location!.longitude)
                  : null,
              time: data.time,
              details: BusinessService(
                id: id,
                name:
                    toLanguageMap(translations: data.service.name.translations),
                position: data.service.position,
                businessId: data.business.id,
                available: data.service.available,
                cost: constructBusinessServiceCost(data.service.cost),
                description: toLanguageMap(
                    translations: data.service.description?.translations ?? []),
                additionalParameters: data.service.additional_parameters,
                image:
                    data.service.image?.entries.map((e) => e.value).toList() ??
                        [],
              ),
              scheduleType: data.schedule_type.toScheduleType(),
              schedule: data.schedule));
    }
  } else
    return null;
  return null;
}

class ClassWithBusiness extends Class {
  final String businessName;
  ClassWithBusiness({
    required Class class_,
    required this.businessName,
  }) : super(
          scheduleType: class_.scheduleType,
          category1: class_.category1,
          details: class_.details,
        );
}
