import 'package:mezcalmos/CustomerApp/pages/CustomerWrapper.dart'
    deferred as customerWrapper;
import 'package:mezcalmos/CustomerApp/router/courierRoutes.dart';
import 'package:mezcalmos/CustomerApp/router/customerRoutes.dart';
import 'package:mezcalmos/CustomerApp/router/deferred_loader.dart';
import 'package:mezcalmos/CustomerApp/router/laundaryRoutes.dart';
import 'package:mezcalmos/CustomerApp/router/restaurantRoutes.dart';
import 'package:mezcalmos/Shared/routes/sharedRoutes.dart';
import 'package:qlevar_router/qlevar_router.dart';

class XRouter {
  static List<QRoute> mainRoutes = [
        QRoute(
            name: SharedRoutes.kHomeRoute,
            path: SharedRoutes.kHomeRoute,
            builder: () => customerWrapper.CustomerWrapper(),
            middleware: <QMiddleware>[
              DefferedLoader(customerWrapper.loadLibrary)
            ]),
      ] +
      LaundryRoutes().routes +
      RestaurantRoutes().routes +
      CustomerRoutes().routes +
      CourierRoutes().routes;
}