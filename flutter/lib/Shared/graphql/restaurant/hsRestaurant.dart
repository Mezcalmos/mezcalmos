import 'package:get/get.dart';
import 'package:graphql/src/core/query_result.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/__generated/schema.graphql.dart';
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';
import 'package:mezcalmos/Shared/graphql/restaurant/__generated/restaurant.graphql.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:mezcalmos/Shared/models/Services/Service.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/models/Utilities/PaymentInfo.dart';
import 'package:mezcalmos/Shared/models/Utilities/Schedule.dart';

HasuraDb _db = Get.find<HasuraDb>();

// Get single restuarant //
// ignore: non_constant_identifier_names
Future<Restaurant?> get_restaurant_by_id({required int id}) async {
  final QueryResult<Query$getOneRestaurant> response = await _db.graphQLClient
      .query$getOneRestaurant(Options$Query$getOneRestaurant(
          variables: Variables$Query$getOneRestaurant(id: id)));

  if (response.hasException) {
    mezDbgPrint("🚨🚨🚨🚨 Hasura querry error : ${response.exception}");
    return null;
  } else if (response.parsedData != null) {
    mezDbgPrint("✅✅✅✅ Hasura querry success, data : ${response.data} ");
    final Query$getOneRestaurant$restaurant_by_pk data =
        response.parsedData!.restaurant_by_pk!;
    return Restaurant(
        userInfo: ServiceInfo(
            id: data.id.toString(),
            image: data.image,
            firebaseId: data.firebase_id,
            name: data.name,
            descriptionId: data.description_id,
            //   descriptionId: data.d,
            location:
                Location.fromHasura(data.location_gps, data.location_text)),
        description: {
          data.description!.translations.first.language_id.toLanguageType():
              data.description!.translations.first.value,
          data.description!.translations[1].language_id.toLanguageType():
              data.description!.translations[1].value,
        },
        schedule: Schedule(openHours: {}),
        paymentInfo: PaymentInfo(),
        restaurantState:
            ServiceState(data.open_status.toServiceStatus(), data.approved),
        primaryLanguage: data.language_id.toString().toLanguageType(),
        secondaryLanguage:
            data.language_id.toString().toLanguageType().toOpLang());
  } else
    return null;
}

Future<Restaurant> editRestaurant(
    {required int id, required Restaurant restaurant}) async {
  final QueryResult<Mutation$updateRestaurantInfo> response = await _db
      .graphQLClient
      .mutate$updateRestaurantInfo(Options$Mutation$updateRestaurantInfo(
          variables: Variables$Mutation$updateRestaurantInfo(
              id: id,
              data: Input$restaurant_set_input(
                  name: restaurant.info.name,
                  image: restaurant.info.image,
                  language_id:
                      restaurant.primaryLanguage.toFirebaseFormatString(),
                  location_gps: Geography(
                    restaurant.info.location.position.latitude!,
                    restaurant.info.location.position.longitude!,
                  ),
                  location_text: restaurant.info.location.address,
                  open_status:
                      restaurant.state.status.toFirebaseFormatString()))));
  if (response.hasException) {
    mezDbgPrint("🚨🚨🚨 Hasura mutation exception =>${response.exception}");
  } else {
    mezDbgPrint("✅✅✅ Hasura mutation success => ${response.data}");
  }
  final Mutation$updateRestaurantInfo$update_restaurant_by_pk data =
      response.parsedData!.update_restaurant_by_pk!;
  return Restaurant(
      userInfo: ServiceInfo(
          id: data.id.toString(),
          image: data.image,
          firebaseId: data.firebase_id,
          name: data.name,
          location: Location.fromHasura(data.location_gps, data.location_text)),
      description: {
        data.description!.translations.first.language_id.toLanguageType():
            data.description!.translations.first.value,
        data.description!.translations[1].language_id.toLanguageType():
            data.description!.translations[1].value,
      },
      schedule: Schedule(openHours: {}),
      paymentInfo: PaymentInfo(),
      restaurantState:
          ServiceState(data.open_status.toServiceStatus(), data.approved),
      primaryLanguage: data.language_id.toString().toLanguageType(),
      secondaryLanguage:
          data.language_id.toString().toLanguageType().toOpLang());
}
