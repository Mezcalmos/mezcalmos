import 'dart:async';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/CustomerApp/controllers/taxi/TaxiController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/CounterOffer.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/TaxiOrder.dart';
import 'package:mezcalmos/Shared/widgets/AnimatedSlider/AnimatedSliderController.dart';

class ViewTaxiOrderController {
  final AnimatedSliderController animatedSliderController;
  ViewTaxiOrderController({required this.animatedSliderController});

  final OrderController controller = Get.find<OrderController>();
  final TaxiController taxiController =
      Get.put<TaxiController>(TaxiController());
  final MGoogleMapController mGoogleMapController = MGoogleMapController();
  final Rxn<TaxiOrder> order = Rxn<TaxiOrder>();
  StreamSubscription<Order?>? orderListener;
  final String toMarkerId = "to";
  RxDouble bottomPadding =
      ((GetStorage().read(getxGmapBottomPaddingKey) as double) + 15.0).obs;
  RxList<CounterOffer> counterOffers = <CounterOffer>[].obs;
  Timer? countOfferTimerValidator;
  RxBool clickedAccept = false.obs;
  RxBool offersBtnClicked = false.obs;

  void init(String orderId, {Function? orderCancelledCallback}) {
    controller.clearOrderNotifications(orderId);
    order.value = controller.getOrder(orderId) as TaxiOrder?;
    if (order.value != null) {
      // set initial location
      initializeMap().then((_) => mezDbgPrint("Initialized Map!"));
      if (order.value!.isOpenOrder()) {
        // TODO @x544D HANDLE ORDER FROM OPEN ORDER NODE
      }

      if (order.value!.inProcess()) {
        inProcessOrderStatusHandler(order.value!.status);

        /// Only start if the status is `TaxiOrdersStatus.LookingForTaxi`
        if (order.value!.status == TaxiOrdersStatus.LookingForTaxi) {
          startCountOffersValidityCheckPeriodically();
        }
        orderListener = controller
            .getCurrentOrderStream(orderId)
            .listen((Order? currentOrder) async {
          if (currentOrder != null) {
            order.value = currentOrder as TaxiOrder;
            inProcessOrderStatusHandler(order.value!.status);
            // setState(() {});
          } else {
            await orderListener?.cancel();
            orderListener = null;
            // this is in case customer created the order and got expired :
            _cancelPeriodicCounterOffersTimer();

            TaxiOrder? _order = controller.getOrder(orderId) as TaxiOrder?;
            // this else clause gets executed when the order becomes /pastOrders.
            if (_order == null) {
              if (order.value!.status == TaxiOrdersStatus.CancelledByCustomer) {
                orderCancelledCallback?.call(_order);
              }
              _order = (await controller.getPastOrderStream(orderId).first)
                  as TaxiOrder?;
            }

            order.value = _order;
            // one time execution :
            mGoogleMapController.setAnimateMarkersPolyLinesBounds(true);
            pastOrderStatusHandler(order.value!.status);
          }
          order.refresh();
        });
      } else {
        // it's in past orders!
        pastOrderStatusHandler(order.value!.status);
      }
    } else {
      mezDbgPrint("Error :Unfound Order !");
    }
  }

  Future<void> initializeMap() async {
    mGoogleMapController.periodicRerendering.value = true;
    mGoogleMapController.setLocation(order.value!.from);
    // add the polylines!
    mGoogleMapController.decodeAndAddPolyline(
        encodedPolylineString: order.value!.routeInformation!.polyline);
    mGoogleMapController.setAnimateMarkersPolyLinesBounds(true);
    await mGoogleMapController.animateAndUpdateBounds();
  }

  /// Check the counterOffers Validity each 1 second,
  ///
  /// this is needed because just in case TaxiDriver got out of the app while the counter didn't end then the counter
  ///
  /// offer will stay on the databse.
  void startCountOffersValidityCheckPeriodically() {
    countOfferTimerValidator =
        Timer.periodic(Duration(seconds: 1), (Timer _timer) {
      if (countOfferTimerValidator?.isActive != true || order.value == null) {
        _timer.cancel();
        return;
      }
      counterOffers.value = order.value!.getValidCounterOfferts();
      // default is : isLoookingForTaxi
      // this is kind of like an observator, when the user has the Counter offers opened and all offers got expired,
      // basically length == 0, we set it as false to automatically hide the bottom sheet.
      if (counterOffers().isEmpty) {
        offersBtnClicked.value = false;
      }
    });
  }

  /// This gets invoked when the order is moved to /past db node
  void pastOrderStatusHandler(TaxiOrdersStatus status) {
    bottomPadding.value = 10.0;

    if (order.value!.driver != null)
      mGoogleMapController.removeMarkerById(order.value!.driver!.id);
    // adding customer's marker
    mGoogleMapController.addOrUpdateUserMarker(
        markerId: order.value!.customer.id,
        latLng: order.value!.from.toLatLng());
    // updating destination marker.
    mGoogleMapController.addOrUpdatePurpleDestinationMarker(
        latLng: order.value!.to.toLatLng());
  }

  /// This gets invoked when the order is moved to [inProcess] db node
  void inProcessOrderStatusHandler(TaxiOrdersStatus status) {
    switch (status) {
      case TaxiOrdersStatus.OnTheWay:
        _cancelPeriodicCounterOffersTimer();
        bottomPadding.value = 10.0;
        mGoogleMapController.setAnimateMarkersPolyLinesBounds(true);
        mGoogleMapController.animateAndUpdateBounds();

        // update the to dest marker
        // mGoogleMapController.removeDestinationMarker();
        mGoogleMapController.addOrUpdatePurpleDestinationMarker(
            latLng: order.value!.to.toLatLng());
        // taxi driver marker
        if (order.value!.driver?.location != null)
          mGoogleMapController.addOrUpdateTaxiDriverMarker(
              order.value!.driver!.id, order.value!.driver!.location!);
        // customer marker
        mGoogleMapController.addOrUpdateUserMarker(
            markerId: order.value!.customer.id,
            latLng: order.value!.from.toLatLng());
        break;

      case TaxiOrdersStatus.InTransit:
        _cancelPeriodicCounterOffersTimer();
        bottomPadding.value = 10.0;
        mGoogleMapController.setAnimateMarkersPolyLinesBounds(true);

        // from [driver] to [destination]
        // thus we keep updating the driver marker only.
        // + Remove customer Marker
        // + Add destination Marker

        // addOrUpdateUserMarker(
        //     order.value!.driver!.id, order.value!.from.toLatLng());

        // removing customer marker
        mGoogleMapController.removeMarkerById(order.value!.customer.id);
        // updating driver's marker
        mGoogleMapController.addOrUpdateTaxiDriverMarker(
            order.value!.driver!.id,
            LatLng(order.value!.driver!.location!.latitude,
                order.value!.driver!.location!.longitude));
        // updating destination marker.
        mGoogleMapController.addOrUpdatePurpleDestinationMarker(
            latLng: order.value!.to.toLatLng());
        break;

      default:
        // bottomPadding.value = 10.0;
        // so user can move freely
        mGoogleMapController.setAnimateMarkersPolyLinesBounds(true);
        mGoogleMapController.animateAndUpdateBounds();

        // updating destination marker.
        mGoogleMapController.addOrUpdatePurpleDestinationMarker(
            latLng: order.value!.to.toLatLng());
        // customer marker
        mGoogleMapController.addOrUpdateUserMarker(
            markerId: order.value!.customer.id,
            latLng: order.value!.from.toLatLng());
        break;
    }
  }

  /// this is a private function, only called internally.
  void _cancelPeriodicCounterOffersTimer() {
    countOfferTimerValidator?.cancel();
    countOfferTimerValidator = null;
  }

  void dispose() {
    orderListener?.cancel();
    orderListener = null;
    _cancelPeriodicCounterOffersTimer();
  }
}