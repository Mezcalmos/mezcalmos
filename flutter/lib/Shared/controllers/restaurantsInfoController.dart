// import 'dart:async';

// import 'package:firebase_database/firebase_database.dart';
// import 'package:get/get.dart';
// import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
// import 'package:mezcalmos/Shared/firebaseNodes/rootNodes.dart';
// import 'package:mezcalmos/Shared/graphql/restaurant/hsRestaurant.dart';
// import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
// import 'package:mezcalmos/Shared/models/Services/Restaurant/Restaurant.dart';

// class RestaurantsInfoController extends GetxController {
//   FirebaseDb _databaseHelper = Get.find<FirebaseDb>();

//   RxBool showOnlyOpen = RxBool(true);
//   String querry = "";
//   @override
//   void onInit() {
//     super.onInit();
//     mezDbgPrint(
//         "--------------------> RestaurantsInfoController Initialized !");
//   }

//   // Future<List<Restaurant>> getRestaurants() async => fetch_restaurants(w);
//   // final DataSnapshot snapshot = (await _databaseHelper.firebaseDatabase
//   //         .ref()
//   //         .child(serviceProviderInfos(orderType: OrderType.Restaurant))
//   //         .once())
//   //     .snapshot;
//   // final List<Restaurant> restaurants = <Restaurant>[];
//   // if (snapshot.value == null) return restaurants;
//   // // ignore: avoid_annotating_with_dynamic
//   // (snapshot.value as dynamic)
//   //     ?.forEach((dynamic restaurantId, dynamic restaurantData) {
//   //   if (restaurantData["state"]["available"] == true) {
//   //     try {
//   //       restaurants.add(Restaurant.fromRestaurantData(
//   //           restaurantId: restaurantId, restaurantData: restaurantData));
//   //     } catch (e, stc) {
//   //       mezDbgPrint("Restaurant add error");
//   //       mezDbgPrint("Restaurant add error $stc");
//   //     }
//   //   }
//   // });
//   // restaurants.where((Restaurant a) => a.state.isAuthorized);

//   // return restaurants.reversed.toList();
//   // }

//   Future<int> getShippingPrice() async {
//     final DataSnapshot snapshot = (await _databaseHelper.firebaseDatabase
//             .ref()
//             .child(baseShippingPriceNode())
//             .once())
//         .snapshot;
//     mezDbgPrint(
//         "Gettting shipping cost ==================================>>>>>> ${snapshot.value}");
//     return snapshot.value as dynamic;
//   }

//   // Future<Restaurant?> getRestaurant(int restaurantId) async {
//   //   return get_restaurant_by_id(id: restaurantId);

//   //   // return _databaseHelper.firebaseDatabase
//   //   //     .ref()
//   //   //     .child(serviceProviderInfos(
//   //   //         orderType: OrderType.Restaurant, providerId: restaurantId))
//   //   //     .once()
//   //   //     .then<Restaurant?>((DatabaseEvent event) {
//   //   //   if (event.snapshot.value != null) {
//   //   //     return Restaurant.fromRestaurantData(
//   //   //         restaurantId: restaurantId, restaurantData: event.snapshot.value);
//   //   //   }
//   //   //   return null;
//   //   // });
//   // }
// }
