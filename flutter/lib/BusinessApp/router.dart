import 'package:mezcalmos/BusinessApp/BusinessWrapper.dart';
import 'package:mezcalmos/BusinessApp/pages/BsOpSchedulePickerView/BsOpSchedulePickerView.dart';
import 'package:mezcalmos/BusinessApp/pages/BsOpTabsView.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/BsEventView/BsEventView.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/BsHomeRentalView/BsHomeRentalView.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/BsProductView/BsProductView.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/BsRentalView/BsRentalView.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/BsServiceView/BsServiceView.dart';
import 'package:mezcalmos/BusinessApp/pages/ServicesListView/BsOpServicesListView.dart';
import 'package:mezcalmos/Shared/routes/nativeOnlyRoutes.dart';
import 'package:mezcalmos/Shared/routes/sharedRoutes.dart';
import 'package:mezcalmos/Shared/routes/sharedSPRoutes.dart';
import 'package:qlevar_router/qlevar_router.dart';

class BusinessOpRoutes {
  static const String kBusniessOpTabsView = '/tabsView';
  static const String kBusniessOpServiceList = '/services/:id';
  static const String kBsOpHomeRental = '/homeRental/:id';
  static const String kBsOpRental = '/rental/:id';
  static const String kBsOpEvent = '/event/:id';
  static const String kBsOpService = '/service/:id';
  static const String kBsOpProduct = '/product/:id';
  static const String kBsOpSchedulePick = '/pickSchedule';
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
          builder: () => BusinessWarpper(),
        ),
        QRoute(
          path: kBusniessOpTabsView,
          name: kBusniessOpTabsView,
          builder: () => BsOpTabsView(),
        ),
        QRoute(
          path: kBsOpSchedulePick,
          name: kBsOpSchedulePick,
          builder: () => BsOpSchedulePickerView(),
        ),
        QRoute(
          path: kBsOpHomeRental,
          name: kBsOpHomeRental,
          builder: () => BsOpHomeRentalView(),
        ),
        QRoute(
          path: kBsOpRental,
          name: kBsOpRental,
          builder: () => BsOpRentalView(),
        ),
        QRoute(
          path: kBsOpEvent,
          name: kBsOpEvent,
          builder: () => BsOpEventView(),
        ),
        QRoute(
          path: kBsOpService,
          name: kBsOpService,
          builder: () => BsOpServiceView(),
        ),
        QRoute(
          path: kBsOpProduct,
          name: kBsOpProduct,
          builder: () => BsOpProductView(),
        ),
      ] +
      sharedWitAdminRoutes +
      SharedRoutes.qRoutes +
      SharedServiceProviderRoutes.routes +
      NativeOnlyRoutes.routes;
  static final List<QRoute> sharedWitAdminRoutes = [
    QRoute(
      path: kBusniessOpServiceList,
      name: kBusniessOpServiceList,
      builder: () => BsOpServicesListView(),
    ),
  ];
}
