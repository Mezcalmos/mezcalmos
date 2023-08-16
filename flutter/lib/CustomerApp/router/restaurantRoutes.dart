import 'package:mezcalmos/CustomerApp/pages/DeliveryServices/Restaurants/CustCartView/CustRestaurantCartView.dart'
    deferred as viewCart;
import 'package:mezcalmos/CustomerApp/pages/DeliveryServices/Restaurants/CustItemView/CustItemView.dart'
    deferred as restoItemView;
import 'package:mezcalmos/CustomerApp/pages/DeliveryServices/Restaurants/CustRestaurantOrderView/CustRestaurantOrderView.dart'
    deferred as restaurantOrder;
import 'package:mezcalmos/CustomerApp/pages/DeliveryServices/Restaurants/CustRestaurantView/CustomerRestaurantView.dart'
    deferred as restoView;
import 'package:mezcalmos/CustomerApp/pages/DeliveryServices/Restaurants/CustRestaurantsListView/CustRestaurantListView.dart'
    deferred as restoList;
import 'package:mezcalmos/CustomerApp/router/deferred_loader.dart';
import 'package:qlevar_router/qlevar_router.dart';

class RestaurantRoutes {
  static const String restaurantsListRoute = "/restaurantsList";
  static const String restaurantViewRoute = "/restaurantView/:restaurantId";
  static const String restaurantItemViewRoute =
      "/restaurantItemView/:restaurantId/:itemId";
  static const String cartRoute = "/cart";
  static const String cartItemViewRoute = "/cartItem/:cartItemId";
  static const String restaurantOrdersRoute = "/restaurantOrders/:orderId";
  final List<QRoute> routes = [
    QRoute(
        path: restaurantsListRoute,
        name: restaurantsListRoute,
        builder: () => restoList.CustRestaurantListView(),
        middleware: <QMiddleware>[DefferedLoader(restoList.loadLibrary)]),
    QRoute(
        path: restaurantViewRoute,
        name: restaurantViewRoute,
        builder: () => restoView.CustRestaurantView(),
        middleware: <QMiddleware>[DefferedLoader(restoView.loadLibrary)]),
    QRoute(
      path: restaurantItemViewRoute,
      name: restaurantItemViewRoute,
      middleware: <QMiddleware>[DefferedLoader(restoItemView.loadLibrary)],
      builder: () => restoItemView.CustItemView(),
    ),
    QRoute(
        path: restaurantOrdersRoute,
        name: restaurantOrdersRoute,
        builder: () => restaurantOrder.ViewRestaurantOrderScreen(),
        middleware: <QMiddleware>[DefferedLoader(restaurantOrder.loadLibrary)]),
    QRoute(
        path: cartRoute,
        name: cartRoute,
        builder: () => viewCart.CustRestaurantCartView(),
        middleware: <QMiddleware>[DefferedLoader(viewCart.loadLibrary)]),
    QRoute(
      path: cartItemViewRoute,
      name: cartItemViewRoute,
      middleware: <QMiddleware>[DefferedLoader(restoItemView.loadLibrary)],
      builder: () => restoItemView.CustItemView(),
    ),
  ];
}
