import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/constants/routes.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/notificationsController.dart';
import 'package:mezcalmos/Shared/helpers/MapHelper.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/utilities/MezIcons.dart';
import 'package:mezcalmos/Shared/widgets/MGoogleMap.dart';
import 'package:mezcalmos/Shared/widgets/UsefullWidgets.dart';
import 'package:mezcalmos/TaxiApp/constants/assets.dart';
import 'package:mezcalmos/TaxiApp/controllers/FBTaxiNorificationsController.dart';
import 'package:mezcalmos/TaxiApp/controllers/currentOrderController.dart';
import 'package:mezcalmos/TaxiApp/controllers/taxiAuthController.dart';
import 'package:mezcalmos/TaxiApp/pages/MTaxiGMapWraper.dart';

// import 'package:mezcalmos/TaxiApp/controllers/taxiAuthController.dart';

class CurrentOrderScreen extends GetView<CurrentOrderController> {
  final LanguageController lang = Get.find<LanguageController>();
  final FBNotificationsController fbNotificationsController =
      Get.put<FBNotificationsController>(FBTaxiNotificationsController());

  // TaxiAuthController _taxiAuthController = Get.find<TaxiAuthController>();
  RxBool showLoading = false.obs;
  RxBool clickedLaunchOnMap = false.obs;
  bool clickedYesCancelPopUp = false;
  Rxn<CurrentOrder> currentOrderStream = Rxn();
  TaxiAuthController taxiAuthController = Get.find<TaxiAuthController>();
  // MAP STUFF !
  RxSet<Polyline> polylines = <Polyline>{}.obs;

  Map<String, BitmapDescriptor?> bitmapDescriptors = {
    "customerImg": null,
    "taxiImg": null,
    "destinationImg": null
  };
  Rx<LatLng> initialCameraPosition = LatLng(0, 0).obs;

  RxList<CustomMarker> customMarkers = RxList.empty(growable: true);
  // ------------
  Widget build(BuildContext context) {
    // controller.fillMarkersCallback = fillMarkers;
    Get.put<CurrentOrderController>(CurrentOrderController());

    controller.getCurrentOrder().stream.listen((data) async {
      currentOrderStream.value = data;
      _loadPolyline();
      _handleEvent();
    });

    return SafeArea(
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Obx(
            () => MGoogleMap(
              customMarkers,
              initialCameraPosition.value,
              polylines: polylines,
            ),
          ),
          Positioned(
              bottom: GetStorage().read(getxGmapBottomPaddingKey),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                height: getSizeRelativeToScreen(25, Get.height, Get.width),
                // width: getSizeRelativeToScreen(180, Get.height, Get.width),
                width: Get.width / 1.05,

                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Color.fromARGB(255, 216, 225, 249),
                          spreadRadius: 0,
                          blurRadius: 7,
                          offset: Offset(0, 7)),
                    ]),
                child: Flex(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  direction: Axis.horizontal,
                  children: [
                    Flexible(
                      flex: 3,
                      fit: FlexFit.loose,
                      child: Container(
                        child: Obx(() => TextButton(
                              style: ButtonStyle(
                                fixedSize: MaterialStateProperty.all(Size(
                                    getSizeRelativeToScreen(
                                        115, Get.height, Get.width),
                                    getSizeRelativeToScreen(
                                        12, Get.height, Get.width))),
                                backgroundColor:
                                    currentOrderStream.value?.order.status !=
                                            "inTransit"
                                        ? MaterialStateProperty.all(
                                            Color.fromARGB(255, 79, 168, 35))
                                        : MaterialStateProperty.all(
                                            Color.fromARGB(255, 234, 51, 38)),
                              ),
                              onPressed: () async {
                                showLoading.value = true;

                                // print(
                                //     "%%%%%%%%%%%%\n controller.value!.distanceToClient :: ${controller.distanceToClient}\n%%%%%%%%%%%%");
                                // print(
                                //     "%%%%%%%%%%%%\n controller.distanceFromFinish :: ${controller.distanceToFinish}\n%%%%%%%%%%%%");
                                currentOrderStream.value?.order.status ==
                                        "inTransit"
                                    // ignore: unnecessary_statements
                                    ? (MapHelper.calculateDistance(
                                                taxiAuthController
                                                    .currentLocation,
                                                currentOrderStream
                                                    .value?.order.to.position) >
                                            0.5
                                        ? MezcalmosSharedWidgets.yesNoDefaultConfirmationDialog(
                                                () async {
                                            Get.back();
                                            await controller.finishRide();
                                          },
                                                lang.strings['taxi']['taxiView']
                                                    ["tooFarFromfinishRide"])
                                            .then((_) {
                                            //Get.offAllNamed(kTaxiWrapperRoute);
                                            // _mezcalmosCurrentOrderGoogleMapController
                                            //     .googleMapUpdate();
                                            Get.back(closeOverlays: true);
                                          })
                                        : await controller.finishRide())
                                    // ignore: unnecessary_statements
                                    : (MapHelper.calculateDistance(
                                                taxiAuthController
                                                    .currentLocation,
                                                currentOrderStream.value?.order
                                                    .from.position) >
                                            0.5
                                        ? MezcalmosSharedWidgets.yesNoDefaultConfirmationDialog(
                                                () async {
                                            Get.back();
                                            await controller.startRide();
                                          },
                                                lang.strings['taxi']['taxiView']
                                                    ["tooFarFromstartRide"])
                                            .then((_) {
                                            // _mezcalmosCurrentOrderGoogleMapController
                                            //     .googleMapUpdate();
                                            //Get.back(closeOverlays: true);
                                          }).whenComplete(() => showLoading.value = false)
                                        : await controller.startRide().whenComplete(() => showLoading.value = false));
                              },
                              child: Center(
                                child: Text(
                                  currentOrderStream.value?.order.status !=
                                          "inTransit"
                                      ? lang.strings['taxi']['taxiView']
                                          ["startRide"]
                                      : lang.strings['taxi']['taxiView']
                                          ["finishRide"],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white, fontFamily: 'psr'),
                                ),
                              ),
                            )),
                      ),
                    ),
                    Flexible(
                        child: SizedBox(
                      height:
                          getSizeRelativeToScreen(15, Get.height, Get.width),
                      child: VerticalDivider(
                          // width: Get.width / 20,
                          ),
                    )),
                    Flexible(
                        flex: 2,
                        child: Obx(
                          () => Text(
                              '\$' +
                                  (currentOrderStream
                                          .value?.order.estimatedPrice
                                          ?.toString() ??
                                      "00"),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18)),
                        )),
                    Flexible(
                        child: SizedBox(
                      height:
                          getSizeRelativeToScreen(15, Get.height, Get.width),
                      child: VerticalDivider(
                          // width: Get.width / 20,
                          ),
                    )),
                    Flexible(
                        flex: 5,
                        fit: FlexFit.tight,
                        child: Row(
                          // direction: Axis.horizontal,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          // runAlignment: WrapAlignment.end,
                          // alignment: WrapAlignment.end,
                          // spacing: 10,
                          children: [
                            GestureDetector(
                              onTap: clickedLaunchOnMap.value
                                  ? null
                                  : () async {
                                      clickedLaunchOnMap.value = true;
                                      await mapLauncher(
                                          currentOrderStream
                                              .value?.order.to.latitude,
                                          currentOrderStream
                                              .value?.order.to.longitude);
                                      clickedLaunchOnMap.value = false;
                                    },
                              child: Container(
                                height: getSizeRelativeToScreen(
                                    16, Get.height, Get.width),
                                width: getSizeRelativeToScreen(
                                    16, Get.height, Get.width),
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 232, 239, 254),
                                  borderRadius: BorderRadius.circular(4),
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                        color:
                                            Color.fromARGB(255, 216, 225, 249),
                                        spreadRadius: 0,
                                        blurRadius: 4,
                                        offset: Offset(0, 2))
                                  ],
                                ),
                                child: Center(
                                  child: Obx(
                                    () => clickedLaunchOnMap.value
                                        ? SizedBox(
                                            height: 10,
                                            width: 10,
                                            child: CircularProgressIndicator(
                                              color: Colors.purple.shade400,
                                            ))
                                        : Icon(
                                            MezcalmosIcons.location_arrow,
                                            color: Color.fromARGB(
                                                255, 103, 121, 254),
                                            size: 16,
                                          ),
                                  ),
                                ),
                              ),
                            ),
                            // Spacer(),
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5)),
                            GestureDetector(
                              onTap: () async {
                                await fbNotificationsController
                                    .setAllMessagesAsReadInDb();

                                Get.toNamed(kMessagesRoute)?.then((_) =>
                                    fbNotificationsController
                                        .clearAllMessageNotification());
                              },
                              child: Container(
                                height: getSizeRelativeToScreen(
                                    16, Get.height, Get.width),
                                width: getSizeRelativeToScreen(
                                    16, Get.height, Get.width),
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 232, 239, 254),
                                  borderRadius: BorderRadius.circular(4),
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                        color:
                                            Color.fromARGB(255, 216, 225, 249),
                                        spreadRadius: 0,
                                        blurRadius: 4,
                                        offset: Offset(0, 2))
                                  ],
                                ),
                                child: Center(
                                  child: Stack(
                                    children: [
                                      Obx(
                                        () => fbNotificationsController
                                                .hasNewNotification
                                            ? Positioned(
                                                top: 5,
                                                right: 5,
                                                child: Container(
                                                  height: 6,
                                                  width: 6,
                                                  decoration: BoxDecoration(
                                                      color: Colors.red,
                                                      shape: BoxShape.circle),
                                                ))
                                            : SizedBox(),
                                      ),
                                      Center(
                                        child: Icon(
                                          Icons.mail,
                                          color: Color.fromARGB(
                                              255, 103, 121, 254),
                                          size: 16,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            // Spacer(),

                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5)),
                            GestureDetector(
                              onTap: () async => await showDialog(
                                  context: context,
                                  builder: (BuildContext ctx) {
                                    return AlertDialog(
                                      title: Text(lang.strings?['taxi']
                                                  ?['cancelOrder']
                                              ?['confirmation_header'] ??
                                          "Por favor confirmar"),
                                      content: Text(lang.strings?['taxi']
                                                  ?['cancelOrder']
                                              ?['confirmation_text'] ??
                                          "¿Cancelar el viaje actual?"),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              if (!clickedYesCancelPopUp) {
                                                showLoading.value = true;
                                                controller
                                                    .cancelTaxi(null)
                                                    .then((_) => Get.back(
                                                        closeOverlays: true))
                                                    .catchError((onError) {
                                                  clickedYesCancelPopUp = false;
                                                }).whenComplete(() =>
                                                        showLoading.value =
                                                            false);
                                              }
                                            },
                                            // Navigator.of(context)
                                            //     .pop()),
                                            child: Text(lang.strings?['taxi']
                                                    ?['taxiView']?['yes'] ??
                                                'Si')),
                                        TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text(lang.strings?['taxi']
                                                    ?['taxiView']?['no'] ??
                                                'No'))
                                      ],
                                    );
                                  }),
                              child: Container(
                                height: getSizeRelativeToScreen(
                                    16, Get.height, Get.width),
                                width: getSizeRelativeToScreen(
                                    16, Get.height, Get.width),
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 247, 177, 179),
                                  borderRadius: BorderRadius.circular(4),
                                  // boxShadow: <BoxShadow>[BoxShadow(color: Color.fromARGB(255, 216, 225, 249), spreadRadius: 0, blurRadius: 1, offset: Offset(0, 5))],
                                ),
                                child: Center(
                                  child: Icon(
                                    MezcalmosIcons.times_circle,
                                    color: Color.fromARGB(255, 255, 0, 8),
                                    size: 16,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ))
                  ],
                ),
              )),
          Positioned(
            top: 10,
            child: Container(
              // height: 65,
              width: Get.width / 1.05,
              // width: getSizeRelativeToScreen(180, Get.height, Get.width),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Color.fromARGB(255, 216, 225, 249),
                        spreadRadius: 0,
                        blurRadius: 7,
                        offset: Offset(0, 7)),
                  ]),

              child: Flex(
                clipBehavior: Clip.hardEdge,
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    // fit: FlexFit.tight,
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, top: 12, bottom: 12, right: 8.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Obx(() => Text(
                                    lang.strings['shared']['inputLocation']
                                        ["from"],
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                              Obx(
                                () => GestureDetector(
                                  onTap: () => mezcalmosSnackBar(
                                      lang.strings['shared']['inputLocation']
                                          ["from"],
                                      currentOrderStream
                                              .value?.order.from?.address ??
                                          ""),
                                  child: Text(
                                    currentOrderStream
                                                .value?.order.from?.address
                                                ?.toString()
                                                .length ==
                                            null
                                        ? "........."
                                        : currentOrderStream
                                                    .value!.order.from!.address!
                                                    .toString()
                                                    .length >
                                                13
                                            ? (currentOrderStream.value?.order
                                                        .from?.address
                                                        .toString()
                                                        .substring(0, 13) ??
                                                    "..........") +
                                                " .."
                                            : currentOrderStream
                                                .value!.order.from!.address
                                                .toString(),
                                    style: TextStyle(
                                        fontSize: 16, fontFamily: 'psr'),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ]),
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      // fit: FlexFit.tight,
                      child: Stack(
                          alignment: Alignment.center,
                          fit: StackFit.passthrough,
                          children: [
                            VerticalDivider(
                              color: Color.fromARGB(255, 236, 236, 236),
                              thickness: 1,
                            ),
                            Container(
                              padding: EdgeInsets.all(getSizeRelativeToScreen(
                                  2.5, Get.height, Get.width)),
                              height: getSizeRelativeToScreen(
                                  17, Get.height, Get.width),
                              width: getSizeRelativeToScreen(
                                  17, Get.height, Get.width),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      color: Color.fromARGB(255, 216, 225, 249),
                                      spreadRadius: 0,
                                      blurRadius: 5,
                                      offset: Offset(0, 7)),
                                ],
                                gradient: LinearGradient(
                                    colors: [
                                      Color.fromARGB(255, 97, 127, 255),
                                      Color.fromARGB(255, 198, 90, 252),
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight),
                              ),
                              child: Center(
                                child:
                                    Image.asset('assets/images/logoWhite.png'),
                              ),
                            ),
                          ])),
                  Expanded(
                    flex: 2,
                    // fit: FlexFit.tight,
                    child: Padding(
                        padding: const EdgeInsets.only(
                            left: 0, top: 12, bottom: 12, right: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx(
                              () => Text(
                                lang.strings['shared']['inputLocation']["to"],
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Obx(
                              () => GestureDetector(
                                onTap: () => mezcalmosSnackBar(
                                    lang.strings['shared']['inputLocation']
                                        ["to"],
                                    currentOrderStream
                                            .value?.order.to?.address ??
                                        ""),
                                child: Text(
                                  currentOrderStream.value?.order.to?.address
                                              ?.toString()
                                              .length ==
                                          null
                                      ? "........."
                                      : currentOrderStream
                                                  .value!.order.to!.address!
                                                  .toString()
                                                  .length >
                                              13
                                          ? (currentOrderStream
                                                      .value!.order.to?.address
                                                      .toString()
                                                      .substring(0, 13) ??
                                                  "..........") +
                                              " .."
                                          : currentOrderStream
                                              .value?.order.to?.address, //13+..
                                  style: TextStyle(
                                      fontSize: 16, fontFamily: 'psr'),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        )),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Handling Event ------------------------------------------------------------------------------------

  Future<void> _handleEvent() async {
    if (currentOrderStream.value?.event != null) {
      if (currentOrderStream.value!.event!.eventType ==
          CurrentOrderEventTypes.OrderStatusChange) {
        print("\n\n\n\n ${currentOrderStream.value?.event?.toJson()} \n\n\n\n");

        if (currentOrderStream.value?.order.status == "cancelled" &&
            currentOrderStream.value?.order.cancelledBy == "customer") {
          await MezcalmosSharedWidgets.mezcalmosDialogOrderCancelled(
              55, Get.height, Get.width);
          // Get.back(closeOverlays: true);
        } else if (currentOrderStream.value?.order.status == "onTheWay") {
          _loadMarkersForOTW();
        } else if (currentOrderStream.value?.order.status == "inTransit") {
          _loadMarkersForIT();
        }
      }
      controller.clearEvent();
    }
  }

  void _loadPolyline() {
    // check if polyline is empty
    if (polylines.isEmpty) {
      // check if event.order has data
      if (currentOrderStream.value?.event != null) {
        // load the polyline
        print("[LOADED POLYLINES] ================= ");

        polylines.add(new Polyline(
          color: Color.fromARGB(255, 172, 89, 252),
          polylineId: PolylineId("polyline"),
          jointType: JointType.round,
          points: loadUpPolyline(currentOrderStream.value?.order),
          width: 2,
          startCap: Cap.buttCap,
          endCap: Cap.roundCap,
          // geodesic: true,
        ));
      }
    }
  }

  // onTheWay - state
  Future<void> _loadMarkersForOTW() async {
    await _loadBitmapDescriptors();

    // customMarkers.clear(); // just in case.
    print("\n\n\n\n[OnTheWay] ================= \n\n\n\n");

    customMarkers.addAll(<CustomMarker>[
      // Customer's Marker
      new CustomMarker(
          "customer",
          bitmapDescriptors["customerImg"]!,
          new LatLng(currentOrderStream.value?.order.from.latitude,
              currentOrderStream.value?.order.from.longitude)),

      // Destination Marker
      new CustomMarker(
          "destination",
          bitmapDescriptors["destinationImg"]!,
          new LatLng(currentOrderStream.value?.order.to.latitude,
              currentOrderStream.value?.order.to.longitude)),

      // Taxi Marker - with subscription
      new CustomMarker(
          "destination",
          bitmapDescriptors["destinationImg"]!,
          new LatLng(taxiAuthController.currentLocation.latitude!,
              taxiAuthController.currentLocation.longitude!),
          locationStream: taxiAuthController.currentLocationRx),
    ]);
    print("\n\n\n\n[OnTheWay] ================= $customMarkers\n\n\n\n");
  }

  // inTransit - state
  Future<void> _loadMarkersForIT() async {
    await _loadBitmapDescriptors();

    customMarkers.clear(); // just in case.
    customMarkers.addAll(<CustomMarker>[
      // Taxi Marker (Customer in Taxi too ) - with subscription
      new CustomMarker(
          "from",
          bitmapDescriptors["destinationImg"]!,
          new LatLng(taxiAuthController.currentLocation.latitude!,
              taxiAuthController.currentLocation.longitude!),
          locationStream: taxiAuthController.currentLocationRx),

      // Destination Marker
      new CustomMarker("destination", bitmapDescriptors["destinationImg"]!,
          currentOrderStream.value?.order.to),
    ]);
  }

  Future<void> _loadBitmapDescriptors() async {
    print("\n\n\n\n[_loadBitmapDescriptors] =================\n\n\n\n");

    // customer marker's Image
    if (bitmapDescriptors["customerImg"] == null) {
      // Create the BitmapDescriptor Object for the customer marker using the images's bytes.
      bitmapDescriptors["customerImg"] = await BitmapDescriptorLoader(
          (await cropRonded((await http.get(
                  Uri.parse(currentOrderStream.value?.order.customer['image'])))
              .bodyBytes) as Uint8List),
          60,
          60,
          isBytes: true);
    }
    // taxi marker's Image
    if (bitmapDescriptors["taxiImg"] == null) {
      bitmapDescriptors["taxiImg"] = await BitmapDescriptorLoader(
          (await cropRonded((await rootBundle.load(taxi_driver_marker_asset))
              .buffer
              .asUint8List())),
          60,
          60,
          isBytes: true);
    }

    // destination marker's Image
    if (bitmapDescriptors["destinationImg"] == null) {
      bitmapDescriptors["destinationImg"] = await BitmapDescriptorLoader(
          (await cropRonded(
              (await rootBundle.load(purple_destination_marker_asset))
                  .buffer
                  .asUint8List())),
          60,
          60,
          isBytes: true);
    }
  }
}
