import 'package:mezcalmos/DeliveryAdminApp/DeliveryAdminWrapper.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/DvOpTabsView.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/DvOpUnauthView.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/OrderView/DvCompanyOrderView.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/OrdersListViews/DvOpPastOrdersList.dart';
import 'package:mezcalmos/Shared/routes/SharedDeliveryRoutes.dart';
import 'package:mezcalmos/Shared/routes/nativeOnlyRoutes.dart';
import 'package:mezcalmos/Shared/routes/sharedRoutes.dart';
import 'package:mezcalmos/Shared/routes/sharedSPRoutes.dart';
import 'package:qlevar_router/qlevar_router.dart';

class DeliveryAdminRoutes {
  static const String kDeliveryOpTabsView = '/tabsView';
  static const String kDeliveryOpPastOrdersRoute = '/pastOrders';

  static const String kNotAuthorizedOperatorRoute = "/deliveryOp/unauthorized";
  static const String kOrderViewRoute = "/deliveryOrders/:orderId";

  static String getDvCompanyOrderRoute(int orderId) {
    return kOrderViewRoute.replaceFirst(":orderId", "$orderId");
  }

  static final List<QRoute> mainRoutes = <QRoute>[
        QRoute(
          path: SharedRoutes.kHomeRoute,
          name: SharedRoutes.kHomeRoute,
          builder: () => DeliveryAdminWrapper(),
        ),
        QRoute(
          path: kDeliveryOpTabsView,
          name: kDeliveryOpTabsView,
          builder: () => DvOpTabsView(),
        ),
        QRoute(
          path: kDeliveryOpPastOrdersRoute,
          name: kDeliveryOpPastOrdersRoute,
          builder: () => DvOpPastOrdersView(),
        ),
        QRoute(
          path: kNotAuthorizedOperatorRoute,
          name: kNotAuthorizedOperatorRoute,
          builder: () => DvOpUnauthView(),
        ),
      ] +
      sharedWitAdminRoutes +
      SharedDvRoutes.mainRoutes +
      SharedRoutes.qRoutes +
      SharedServiceProviderRoutes.routes +
      NativeOnlyRoutes.routes;
  static final List<QRoute> sharedWitAdminRoutes = <QRoute>[
    QRoute(
      path: kOrderViewRoute,
      name: kOrderViewRoute,
      builder: () => DvCompanyOrderView(),
    ),
  ];
}
