// import 'package:mezcalmos/CustomerApp/pages/DeliveryServices/DeliveryServiceView.dart'
//     deferred as deliveryServices;
import 'package:mezcalmos/CustomerApp/pages/CustHomeView/CustHomeView.dart'
    deferred as customerHome;
import 'package:mezcalmos/CustomerApp/router/customerRoutes.dart';
import 'package:mezcalmos/CustomerApp/router/deferred_loader.dart';
import 'package:mezcalmos/CustomerApp/router/restaurantRoutes.dart';
import 'package:mezcalmos/Shared/routes/sharedRoutes.dart';
import 'package:qlevar_router/qlevar_router.dart';

class XRouter {
  static String deliveryServicesRoute = "/deliveryServices";
  static String tabsViewRoute = "/home";

  static List<QRoute> mainRoutes = [
        QRoute(
            name: SharedRoutes.kHomeRoute,
            path: SharedRoutes.kHomeRoute,
            builder: () => customerHome.CustHomeView(),
            middleware: <QMiddleware>[
              DefferedLoader(customerHome.loadLibrary)
            ]),
        // QRoute(
        //     name: deliveryServicesRoute,
        //     path: deliveryServicesRoute,
        //     builder: () => deliveryServices.DeliveryServiceView(),
        //     middleware: <QMiddleware>[
        //       DefferedLoader(deliveryServices.loadLibrary)
        //     ]),
      ] +
      //   CartRoute().routes +
      // CustBusinessRoutes().routes +
      // LaundryRoutes().routes +
      RestaurantRoutes().routes +
      CustomerRoutes().routes;
  // CourierRoutes().routes;
}
