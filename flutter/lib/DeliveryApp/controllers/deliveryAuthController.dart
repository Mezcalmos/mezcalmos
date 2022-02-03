import 'dart:async';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mezcalmos/Shared/models/Drivers/DeliveryDriver.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/backgroundNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/firebaseNodes/deliveryNodes.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:location/location.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';

class DeliveryAuthController extends GetxController {
  Rxn<DeliveryDriverState> _state = Rxn();
  FirebaseDb _databaseHelper = Get.find<FirebaseDb>();
  AuthController _authController = Get.find<AuthController>();
  BackgroundNotificationsController _notificationsController =
      Get.find<BackgroundNotificationsController>();

  DeliveryDriverState? get deliveryDriverState => _state.value;
  Stream<DeliveryDriverState?> get stateStream => _state.stream;

  Rx<LocationData> _currentLocation = LocationData.fromMap(
      <String, dynamic>{"latitude": 15.851385, "longitude": -97.046429}).obs;

  LocationData get currentLocation => _currentLocation.value;
  Rx<LocationData> get currentLocationRx => _currentLocation;

  StreamSubscription<LocationData>? _locationListener;
  StreamSubscription? _DeliveryDriverStateNodeListener;

  bool _checkedAppVersion = false;
  String? _previousStateValue = "init";

  @override
  void onInit() {
    // ------------------------------------------------------------------------
    mezDbgPrint("DeliveryAuthController: init ${this.hashCode}");
    mezDbgPrint(
        "DeliveryAuthController: calling handle state change first time");
    setupDeliveryDriver(Get.find<AuthController>().fireAuthUser!);
    super.onInit();
  }

  void setupDeliveryDriver(User user) async {
    mezDbgPrint("DeliveryAuthController: handle state change user value");
    mezDbgPrint(user);
    // mezDbgPrint(_authController.fireAuthUser);

    mezDbgPrint(
        "DeliveryAuthController: _DeliveryDriverStateNodeListener init ${deliveryDriverStateNode(user.uid)}");
    _DeliveryDriverStateNodeListener?.cancel();
    _DeliveryDriverStateNodeListener = null;
    _DeliveryDriverStateNodeListener = _databaseHelper.firebaseDatabase
        .reference()
        .child(deliveryDriverStateNode(user.uid))
        .onValue
        .listen((event) async {
      mezDbgPrint(
          "[++++++ = === ==] DeliveryAuthController${this.hashCode}: _DeliveryDriverStateNodeListener event => ${event.snapshot.value}");
      if (event.snapshot.value.toString() == _previousStateValue) {
        mezDbgPrint(
            'DeliveryAuthController:: same state event fired again, skipping it');
        return;
      }
      _previousStateValue = event.snapshot.value.toString();
      if (event.snapshot.value != null) {
        mezDbgPrint(event.snapshot.value);
        _state.value = DeliveryDriverState.fromSnapshot(event.snapshot.value);
      } else {
        _state.value =
            DeliveryDriverState(isAuthorized: false, isOnline: false);
      }
      mezDbgPrint(
          "/////////////////////////////////////////////${_state.value?.toJson()}////////////////////////////////////////////////////");
      if (_state.value?.isAuthorized ?? false) {
        saveAppVersionIfNecessary();
        saveNotificationToken();
      }

      if (_state.value!.isOnline == false) {
        await Location().enableBackgroundMode(enable: false);
        _locationListener?.pause();
      } else {
        await Location().enableBackgroundMode(enable: true);
        _locationListener?.resume();
      }
    });
    await _locationListener?.cancel();
    _locationListener = await _listenForLocation();
  }

  void saveNotificationToken() async {
    mezDbgPrint(
        "DeliveryAuthController  Messaging Token>> ${await _notificationsController.getToken()}");
    String? deviceNotificationToken = await _notificationsController.getToken();
    if (deviceNotificationToken != null)
      _databaseHelper.firebaseDatabase
          .reference()
          .child(
              '${deliveryDriverAuthNode(_authController.fireAuthUser?.uid ?? '')}/notificationInfo/')
          .set(<String, String>{
        'deviceNotificationToken': deviceNotificationToken
      });
  }

  void saveAppVersionIfNecessary() {
    if (_checkedAppVersion == false) {
      String VERSION = GetStorage().read(getxVersion);
      mezDbgPrint("[+] TaxiDriver Currently using App v$VERSION");
      _databaseHelper.firebaseDatabase
          .reference()
          .child(
              deliveryDriverAppVersionNode(_authController.fireAuthUser!.uid))
          .set(VERSION);
      _checkedAppVersion = true;
    }
  }

  Future<StreamSubscription<LocationData>> _listenForLocation() async {
    mezDbgPrint("Listening for location !");
    Location location = Location();
    await location.changeSettings(interval: 1000);
    // location.enableBackgroundMode(enable: true);
    return location.onLocationChanged.listen((LocationData currentLocation) {
      // mezDbgPrint("\t\t [TAXI AUTH CONTROLLER] LOCATION GOT UPDAAAATED !!");
      DateTime currentTime = DateTime.now();
      if (currentLocation.latitude != null &&
          currentLocation.longitude != null) {
        _currentLocation.value = currentLocation;

        Map<String, dynamic> positionUpdate = <String, dynamic>{
          "lastUpdateTime": currentTime.toUtc().toString(),
          "position": <String, dynamic>{
            "lat": currentLocation.latitude,
            "lng": currentLocation.longitude
          }
        };
        try {
          // mezDbgPrint(positionUpdate);
          _databaseHelper.firebaseDatabase
              .reference()
              .child(deliveryDriverAuthNode(_authController.fireAuthUser!.uid))
              .child('location')
              .set(positionUpdate);
          // if ((_state.value?.currentOrders.length ?? 0) > 0) {
          //   _state.value?.currentOrders.forEach((currentOrderId) {
          // updating driver location in taxis/inProcessOrders
          // _databaseHelper.firebaseDatabase
          //     .reference()
          //     .child(deliveryDriverInProcessOrderDriverLocationNode(
          //         orderId: currentOrderId,
          //         deliveryDriverId: _authController.fireAuthUser!.uid))
          //     .set(positionUpdate);

          // // updating driver location in root orders/inProcess/taxi
          // _databaseHelper.firebaseDatabase
          //     .reference()
          //     .child(rootTaxiInProcessOrderDriverLocationNode(
          //         _state.value!.currentOrder!))
          //     .set(positionUpdate);

          // // updating driver location in customers/inProcessOrders
          // String? currentOrderCustomerId = Get.find<OrderController>()
          //     .getOrder(_state.value!.currentOrder!)
          //     ?.customer
          //     .id;
          //   if (currentOrderCustomerId != null)
          //     _databaseHelper.firebaseDatabase
          //         .reference()
          //         .child(customerInProcessOrderDriverLocationNode(
          //             _state.value!.currentOrder!, currentOrderCustomerId))
          //         .set(positionUpdate);
          // });
          // }
          
        } catch (e) {
          mezDbgPrint("Write driver position to db error");
        }
      }
    });
  }

  @override
  void onClose() {
    mezDbgPrint(
        "[+] DeliveryAuthController::dispose ---------> Was invoked ! ${this.hashCode}");

    _DeliveryDriverStateNodeListener?.cancel();
    _DeliveryDriverStateNodeListener = null;

    _locationListener?.cancel();
    _locationListener = null;
    super.onClose();
  }

  void turnOff() {
    _databaseHelper.firebaseDatabase
        .reference()
        .child(deliveryDriverIsOnlineField(_authController.fireAuthUser!.uid))
        .set(false)
        .catchError((err) {
      mezDbgPrint("Error turning [ isLooking = false ] -> $err");
      MezSnackbar("Error ~", "Failed turning it off!");
    });
  }

  void turnOn() {
    _databaseHelper.firebaseDatabase
        .reference()
        .child(deliveryDriverIsOnlineField(_authController.fireAuthUser!.uid))
        .set(true)
        .catchError((err) {
      mezDbgPrint("Error turning [ isLooking = true ] -> $err");
      MezSnackbar("Error ~", "Failed turning_listenForLocation it on!");
    });
  }
}
