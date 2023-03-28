import 'package:get/get.dart'; // getX
import 'package:mezcalmos/DeliveryApp/pages/DeliveryWrapper.dart';
import 'package:mezcalmos/DeliveryApp/pages/OrderDetails/OrderDetailsScreen.dart';
import 'package:mezcalmos/DeliveryApp/pages/OrdersList/CurrentOrdersListScreen.dart';
import 'package:mezcalmos/DeliveryApp/pages/OrdersList/PastOrdersView.dart';
import 'package:mezcalmos/DeliveryApp/pages/SingleOrder/DvOrderView.dart';
import 'package:mezcalmos/DeliveryApp/pages/Unauthorized/UnAuthrizedDriverView.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';

const String kCurrentOrdersListRoute = '/currentOrders';
const String kDriverOrderView = '/orders/:orderId';
const String kOrderDetailsView = "/orderDetails/:orderId";
const String kPastOrdersView = "/pastOrders";
const String kDriverUnAuth = "/driverUnauth";

String getDriverOrderRoute(int orderId) {
  return kDriverOrderView.replaceFirst(":orderId", orderId.toString());
}

String getOrderDetailsRoute(int orderId) {
  return kOrderDetailsView.replaceFirst(":orderId", "$orderId");
}

// GetX based Router (For navigating)
class XRouter {
  static dynamic mainRoutes = [
        GetPage(
            name: kCurrentOrdersListRoute,
            page: () => CurrentOrdersListScreen()),
        GetPage(name: kHomeRoute, page: () => DeliveryWrapper()),
        //  GetPage(name: kLaundryOrderView, page: () => LaundryOrderView()),
        GetPage(name: kDriverOrderView, page: () => DvOrderView()),
        GetPage(name: kOrderDetailsView, page: () => OrderDetailsScreen()),
        GetPage(name: kPastOrdersView, page: () => DriverPastOrdersView()),
        GetPage(name: kDriverUnAuth, page: () => UnAuthorizedDriverView()),
      ] +
      SharedRouter.sharedRoutes;
}
