import 'package:mezcalmos/CustomerApp/pages/Common/CustReviewsListView.dart'
    deferred as customerReviewListView;
import 'package:mezcalmos/CustomerApp/pages/CustBusinessView/custBusinessView.dart'
    deferred as businessRoute;
import 'package:mezcalmos/CustomerApp/pages/CustCardsListView/CustCardsListView.dart'
    deferred as savedCard;
import 'package:mezcalmos/CustomerApp/pages/CustOrdersListView/CustomerOrdersListView.dart'
    deferred as customerOrders;
import 'package:mezcalmos/CustomerApp/pages/CustSavedLocations/CustSavedLocationsView.dart'
    deferred as savedLocation;
import 'package:mezcalmos/CustomerApp/pages/JoinUs/JoinUsView.dart'
    deferred as custJoinUs;
import 'package:mezcalmos/CustomerApp/router/deferred_loader.dart';
import 'package:qlevar_router/qlevar_router.dart';

// import 'package:mezcalmos/CustomerApp/pages/Feed/SinglePostView/CustSinglePostView.dart'
//     deferred as custSinglePost;
class CustomerRoutes {
  static const String customerReviewRoute = '/reviews/:serviceId';
  static const String customerOrdersRoute = '/orders';
  static const String savedCards = '/savedCards';
  static const String savedLocations = '/savedLocations';
  static const String custBusinessRoute = '/custBusiness/:businessId';
  static const String custJoinUsRoute = '/custJoinUs';
  // static String kSinglePostRoute = "/post/:id";

  final List<QRoute> routes = [
    // QRoute(
    //       name: kSinglePostRoute,
    //       path: kSinglePostRoute,
    //       builder: () => custSinglePost.CustSinglePostView(),
    //       middleware: <QMiddleware>[
    //         DefferedLoader(custSinglePost.loadLibrary)
    //       ]),
    QRoute(
      path: customerReviewRoute,
      name: customerReviewRoute,
      middleware: <QMiddleware>[
        DefferedLoader(customerReviewListView.loadLibrary)
      ],
      builder: () => customerReviewListView.CustReviewsListView(),
    ),
    QRoute(
        path: custBusinessRoute,
        name: custBusinessRoute,
        middleware: <QMiddleware>[DefferedLoader(businessRoute.loadLibrary)],
        builder: () => businessRoute.CustBusinessView()),
    QRoute(
        path: customerOrdersRoute,
        name: customerOrdersRoute,
        middleware: <QMiddleware>[DefferedLoader(customerOrders.loadLibrary)],
        builder: () => customerOrders.CustomerOrdersListView()),
    QRoute(
        path: savedCards,
        name: savedCards,
        middleware: <QMiddleware>[DefferedLoader(savedCard.loadLibrary)],
        builder: () => savedCard.CustCardsListView()),
    QRoute(
        path: savedLocations,
        name: savedLocations,
        middleware: <QMiddleware>[DefferedLoader(savedLocation.loadLibrary)],
        builder: () => savedLocation.SavedLocationView()),
    QRoute(
        path: custJoinUsRoute,
        name: custJoinUsRoute,
        middleware: <QMiddleware>[DefferedLoader(custJoinUs.loadLibrary)],
        builder: () => custJoinUs.JoinUsView()),
  ];
}

//card and location
