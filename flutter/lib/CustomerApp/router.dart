import 'package:get/get.dart'; // getX
import 'package:mezcalmos/CustomerApp/pages/CustomerWrapper.dart';
import 'package:mezcalmos/CustomerApp/pages/ListOrdersScreen/ListOrdersScreen.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewCartScreen/PickLocationView.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ListRestaurantsScreem/ListRestaurantsScreen.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewItemScreen/ViewItemScreen.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewOrderScreen/ViewRestaurantOrderScreen.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewRestaurantScreen/ViewRestaurantScreen.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewcartScreen/ViewCartScreen.dart';
import 'package:mezcalmos/CustomerApp/pages/SavedLocations/savedLocationView.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/RequestTaxiScreen.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/ViewTaxiOrderScreen.dart';
import 'package:mezcalmos/Shared/models/Chat.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
// import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewRestaurantScreen/ViewRestaurantScreen.dart';

// Routes Keys.
const String kWrapperRoute = '/wrapper';
const String kTaxiRequestRoute = '/taxiRequest';
const String kOrdersRoute = '/orders';
const String kRestaurantsRoute = '/restaurants';
const String kRestaurantRoute = '/restaurants/:restaurantId';
const String kViewRestaurantItemRoute = '/items/:restaurantId/:itemId';
const String kRestaurantOrderRoute = '/restaurantOrders/:orderId';
const String kTaxiOrderRoute = '/taxiOrders/:orderId';
const String kCartRoute = '/cart';
const String kCartItemRoute = '/cart/:cartItemId';
const String kPickLocationRoute = '/pickLocationFromMap/addLocation';
const String kPickLocationEditRoute = '/pickLocationFromMap/editLocation';
const String kSavedLocations = '/savedLocations';

String getRestaurantRoute(String restaurantId) {
  return kRestaurantRoute.replaceFirst(":restaurantId", restaurantId);
}

String getItemRoute(String restaurantId, String itemId) {
  return kViewRestaurantItemRoute
      .replaceFirst(":restaurantId", restaurantId)
      .replaceFirst(":itemId", itemId);
}

String editCartItemRoute(String cartItemId) {
  return kCartItemRoute.replaceFirst(":cartItemId", cartItemId);
}

String getRestaurantOrderRoute(String orderId) {
  return kRestaurantOrderRoute.replaceFirst(":orderId", orderId);
}

String getTaxiOrderRoute(String orderId) {
  return kTaxiOrderRoute.replaceFirst(":orderId", orderId);
}

String getRestaurantMessagesRoute(
  String orderId,
) {
  return kMessagesRoute.replaceFirst(":orderId", orderId) +
      "?recipientType=${ParticipantType.Restaurant.toFirebaseFormattedString()}";
}

// GetX based Router (For navigating)
class XRouter {
  static dynamic mainRoutes = [
        GetPage(name: kHomeRoute, page: () => CustomerWrapper()),
        // restaurant Routes
        GetPage(name: kOrdersRoute, page: () => ListOrdersScreen()),
        GetPage(name: kRestaurantsRoute, page: () => ListRestaurantsScreen()),
        GetPage(
            name: kRestaurantRoute,
            page: () => ViewRestaurantScreen(),
            transitionDuration: Duration(milliseconds: 500),
            transition: Transition.rightToLeft),
        GetPage(
            name: kViewRestaurantItemRoute,
            page: () => ViewItemScreen(
                viewItemScreenMode: ViewItemScreenMode.AddItemMode),
            transitionDuration: Duration(milliseconds: 500),
            transition: Transition.rightToLeft),
        GetPage(
            name: kCartItemRoute,
            page: () => ViewItemScreen(
                viewItemScreenMode: ViewItemScreenMode.EditItemMode),
            transitionDuration: Duration(milliseconds: 500),
            transition: Transition.rightToLeft),
        GetPage(
            name: kCartRoute,
            page: () => ViewCartScreen(),
            transitionDuration: Duration(milliseconds: 500),
            transition: Transition.rightToLeft),
        GetPage(
            name: kRestaurantOrderRoute,
            page: () => ViewRestaurantOrderScreen()),
        GetPage(
            name: kPickLocationRoute,
            page: () => PickLocationView(PickLocationMode.AddNewLocation)),
        GetPage(
            name: kPickLocationEditRoute,
            page: () => PickLocationView(PickLocationMode.EditLocation)),
        // Taxis Routes
        GetPage(
            name: kTaxiRequestRoute,
            page: () => RequestTaxiScreen(),
            transitionDuration: Duration(milliseconds: 500),
            transition: Transition.rightToLeft),
        GetPage(
            name: kTaxiOrderRoute,
            page: () => ViewTaxiOrderScreen(),
            transitionDuration: Duration(milliseconds: 500),
            transition: Transition.rightToLeft),
        GetPage(name: kSavedLocations, page: () => SavedLocationView())
      ] +
      SharedRouter.sharedRoutes;
}
