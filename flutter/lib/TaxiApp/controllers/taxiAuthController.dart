import 'dart:async';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/notificationsController.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/utilities/Extensions.dart';
// import 'package:mezcalmos/Shared/controllers/settingsController.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/utilities/SharedEnums.dart';
import 'package:mezcalmos/TaxiApp/constants/databaseNodes.dart';
import 'package:mezcalmos/TaxiApp/controllers/incomingOrdersController.dart';
import 'package:mezcalmos/Shared/helpers/DatabaseHelper.dart';
import 'package:mezcalmos/TaxiApp/models/TaxiDriver.dart';
// import 'package:mezcalmos/Shared/pages/AuthScreens/UnauthorizedScreen.dart';
// import 'package:mezcalmos/TaxiApp/pages/Orders/CurrentOrderScreen.dart';
// import 'package:mezcalmos/TaxiApp/pages/Orders/IncomingOrders/IncomingListScreen.dart';
import 'package:location/location.dart';

class TaxiAuthController extends GetxController with MezDisposable {
  Rx<TaxiDriver> _model = TaxiDriver.empty().obs;
  DatabaseHelper _databaseHelper = Get.find<DatabaseHelper>();
  AuthController _authController = Get.find<AuthController>();
  // Rx<Widget> _dynamicScreen =
  //     (Center(child: CircularProgressIndicator()) as Widget).obs;
  Rx<LocationData> _currentLocation = LocationData.fromMap(
      <String, dynamic>{"latitude": 15.851385, "longitude": -97.046429}).obs;
  RxBool _locationEnabled = false.obs;
  DeviceNotificationsController _messagingController =
      Get.put<DeviceNotificationsController>(DeviceNotificationsController());

  Rx<AgentDataEvent> taxiDriverDataEventRx = AgentDataEvent.Null.obs;

  dynamic get currentOrderId => _model.value.currentOrder ?? null;
  dynamic get authorizedTaxi => _model.value.isAuthorized;
  bool get isLooking => _model.value.isLooking ?? false;
  // Widget get dynamicScreen => _dynamicScreen.value;
  LocationData get currentLocation => _currentLocation.value;
  bool get locationEnabled => _locationEnabled.value;
  Rx<LocationData> get currentLocationRx => _currentLocation;

  StreamSubscription<LocationData>? _locationListener;
  StreamSubscription<LocationData>? get currentLocationStream =>
      _locationListener;

  bool _checkedAppVersion = false;
  DateTime lastLocationUpdatedTime = DateTime.now();
  /*
    GetScreen function basically will return on of the 3 right Screens :
      - AnauthorizedScreen
      - IncommingOrders
      - CurrentOrder
  */

  void testFunc(String? s) {
    mezDbgPrint("test func !");
  }

  @override
  void onInit() async {
    super.onInit();
    // Injecting all our c here
    // Get.lazyPut(() => CurrentOrderController());
    Get.lazyPut(() => IncomingOrdersController());
    // ------------------------------------------------------------------------

    mezDbgPrint("User from TaxiAuthController >> ${_authController.user?.uid}");
    mezDbgPrint("authorizedTaxi from TaxiAuthController >> ${authorizedTaxi}");
    mezDbgPrint("currentOrderId from TaxiAuthController >> ${currentOrderId}");
    mezDbgPrint(
        "TaxiAuthController  Messaging Token>> ${await _messagingController.getToken()}");

    if (_authController.user != null) {
      _databaseHelper.firebaseDatabase
          .reference()
          .child(taxiAuthNode(_authController.user!.uid))
          .onValue
          .listen((event) async {
        if (event.snapshot.value != null) {
          _model.value = TaxiDriver.fromSnapshot(event.snapshot);
          if (_model.value.isAuthorized == null) {
            taxiDriverDataEventRx.value = AgentDataEvent.DataNotLoadedYet;
          } else if (_model.value.isAuthorized == false) {
            taxiDriverDataEventRx.value = AgentDataEvent.Unauthorized;
          } else if (_model.value.currentOrder != null) {
            taxiDriverDataEventRx.value = AgentDataEvent.InCurrentOrder;
          } else {
            taxiDriverDataEventRx.value = AgentDataEvent.Free;
          }
          mezDbgPrint(taxiDriverDataEventRx.value.toString());
        } else {
          _model.value =
              TaxiDriver(false, false, null, null, null, isEmpty: false);
          taxiDriverDataEventRx.value = AgentDataEvent.Null;
        }

        if (_checkedAppVersion == false) {
          if (_model.value.isAuthorized == true) {
            String VERSION = GetStorage().read(version);
            mezDbgPrint("[+] TaxiDriver Currently using App v$VERSION");
            _databaseHelper.firebaseDatabase
                .reference()
                .child(taxiDriverAppVersionNode(_authController.user!.uid))
                .set(VERSION);

            _checkedAppVersion = true;
          }
        }

        if (_model.value.isEmpty == true ||
            (_model.value.currentOrder == null &&
                _model.value.isLooking == false)) {
          await Location().enableBackgroundMode(enable: false);
          _locationListener?.pause();
          // mezDbgPrint(
          //     " [=] ---------------------------------> Paused locationListener !");
        } else {
          if (!(await Location().isBackgroundModeEnabled()))
            await Location().enableBackgroundMode(enable: true);

          _locationListener?.resume();
          // mezDbgPrint(
          //     " [=] ---------------------------------> Resumed locationListener !");
        }
      }).canceledBy(this);

      String? deviceNotificationToken = await _messagingController.getToken();
      if (deviceNotificationToken != null)
        _databaseHelper.firebaseDatabase
            .reference()
            .child(
                '${taxiAuthNode(_authController.user?.uid ?? '')}/notificationInfo/')
            .set(<String, String>{
          'deviceNotificationToken': deviceNotificationToken
        });
      mezDbgPrint(
          "/////////////////////////////////////////////${_model.value.toJson()}////////////////////////////////////////////////////");
      _listenForLocation();
    }
  }

  Future<void> _listenForLocation() async {
    if (_authController.user == null) {
      mezDbgPrint("User is not signed in !");
    } else {
      Location location = Location();

      _locationEnabled.value = true;
      // location.enableBackgroundMode(enable: true);
      (_locationListener =
              location.onLocationChanged.listen((LocationData currentLocation) {
        DateTime currentTime = DateTime.now();
        if (currentTime.difference(lastLocationUpdatedTime).inSeconds > 5 &&
            currentLocation.latitude != null &&
            currentLocation.longitude != null) {
          mezDbgPrint("\t\t [TAXI AUTH CONTROLLER] LOCATION GOT UPDAAAATED !!");
          lastLocationUpdatedTime = currentTime;
          _currentLocation.value = currentLocation;

          Map<String, dynamic> positionUpdate = <String, dynamic>{
            "lastUpdateTime": currentTime.toUtc().toString(),
            "position": <String, dynamic>{
              "lat": currentLocation.latitude,
              "lng": currentLocation.longitude
            }
          };
          // mezDbgPrint(positionUpdate);
          _databaseHelper.firebaseDatabase
              .reference()
              .child(taxiAuthNode(_authController.user?.uid ?? ''))
              .child('location')
              .set(positionUpdate);
          if (_model.value.currentOrder != null) {
            _databaseHelper.firebaseDatabase
                .reference()
                .child(orderId(_model.value.currentOrder))
                .child('driver/location')
                .set(positionUpdate);
          }
        }
      }))
          .canceledBy(this);
    }
  }

  @override
  void dispose() async {
    mezDbgPrint("[+] TaxiAuthController::dispose ---------> Was invoked !");
    // await _locationListener?.cancel();
    cancelSubscriptions();
    // Get.find<CurrentOrderController>().dispose();
    // Get.find<IncomingOrdersController>().dispose();
    super.onClose();
  }

  void turnOff() {
    _databaseHelper.firebaseDatabase
        .reference()
        .child(taxiIsLookingField(_authController.user!.uid))
        .set(false)
        .catchError((err) {
      mezDbgPrint("Error turning [ isLooking = false ] -> $err");
      mezcalmosSnackBar("Error ~", "Failed turning it off!");
    });
  }

  void turnOn() {
    _databaseHelper.firebaseDatabase
        .reference()
        .child(taxiIsLookingField(_authController.user!.uid))
        .set(true)
        .catchError((err) {
      mezDbgPrint("Error turning [ isLooking = true ] -> $err");
      mezcalmosSnackBar("Error ~", "Failed turning_listenForLocation it on!");
    });
  }
}
