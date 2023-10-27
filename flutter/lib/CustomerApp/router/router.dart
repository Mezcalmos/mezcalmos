// import 'package:mezcalmos/CustomerApp/pages/DeliveryServices/DeliveryServiceView.dart'
//     deferred as deliveryServices;
import 'package:mezcalmos/CustomerApp/pages/CustomerWrapper.dart'
    deferred as customerWrapper;
import 'package:mezcalmos/CustomerApp/router/deferred_loader.dart';
import 'package:mezcalmos/Shared/routes/sharedRoutes.dart';
import 'package:qlevar_router/qlevar_router.dart';

class XRouter {
  static String deliveryServicesRoute = "/deliveryServices";
  static String tabsViewRoute = "/home";

  static List<QRoute> mainRoutes = <QRoute>[
    QRoute(
        name: SharedRoutes.kHomeRoute,
        path: SharedRoutes.kHomeRoute,
        builder: () => customerWrapper.CustomerWrapper(),
        middleware: <QMiddleware>[DefferedLoader(customerWrapper.loadLibrary)]),
    // QRoute(
    //     name: deliveryServicesRoute,
    //     path: deliveryServicesRoute,
    //     builder: () => deliveryServices.DeliveryServiceView(),
    //     middleware: <QMiddleware>[
    //       DefferedLoader(deliveryServices.loadLibrary)
    //     ]),
  ];
  //   CartRoute().routes +
  // CustBusinessRoutes().routes +
  // LaundryRoutes().routes +
  // RestaurantRoutes().routes +
  // CustDeliveryRoutes().routes +
  // CustomerRoutes().routes;
  // CourierRoutes().routes;
}
