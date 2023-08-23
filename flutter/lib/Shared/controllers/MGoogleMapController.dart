import 'package:firebase_auth/firebase_auth.dart' as fireAuth;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import "package:http/http.dart" as http;
import 'package:location/location.dart' as GeoLoc;
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/locationController.dart';
import 'package:mezcalmos/Shared/helpers/ImageHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/thirdParty/MapHelper.dart'
    as MapHelper;
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/models/Utilities/MezMarker.dart';
import 'package:sizer/sizer.dart';

class MGoogleMapController {
  RxSet<Polyline> polylines = <Polyline>{}.obs;
  RxList<MezMarker> markers = <MezMarker>[].obs;
  Rxn<MezLocation> location = Rxn<MezLocation>();
  RxBool animateMarkersPolyLinesBounds = false.obs;
  Rxn<GoogleMapController> controller = Rxn();
  late bool enableMezSmartPointer;
  LatLngBounds? bounds;
  Function? onMapTap;

  double initialZoomLevel = 11;
  bool get isMapReady => controller.value != null;

  // this is used when we don't want to re-render the map periodically.
  RxBool periodicRerendering = false.obs;
  RxBool recenterButtonEnabled = false.obs;
  late RxBool myLocationButtonEnabled;

  MGoogleMapController({
    bool myLocationButtonEnabled = false,
    bool enableMezSmartPointer = true,
  }) {
    this.myLocationButtonEnabled = RxBool(myLocationButtonEnabled);
    this.enableMezSmartPointer = enableMezSmartPointer;
  }

  /// Instead of going over the cropping rounded process everytime we update Taxi Markers,
  ///
  /// We save it in _taxiDriverImgDescruptorCopy.
  List<int>? _taxiDriverImgDescruptorCopy;
  RxDouble markersDefaultSize = 60.0.obs;

  MinMaxZoomPreference? minMaxZoomPrefs;

  void setOnMapTap({required Function onTap}) {
    onMapTap = onTap;
  }

  void _addOrUpdateMarker(MezMarker marker) {
    markers.removeWhere(
      (Marker _marker) => _marker.markerId.value == marker.markerId.value,
    );
    markers.add(marker);
    markers.refresh();
  }
  //[menu] - [info]

  /// this takes snapshot
  Future<Image?> takeMapSnapshot() async {
    // 1 - init the map without showing
    // 2 - call take snapshot
    // 3 - dispose map a
    final Uint8List? _tmp = await controller.value?.takeSnapshot();
    if (_tmp != null) {
      return Image.memory(_tmp);
    }
    return null;
  }

  /// In Case we needed it
  void updateMarkersIconOnZoomChange({required double zoom}) {}

  /// gets Called whenever a zoom Change happens in [MGoogleMap]
  void onZoomChange(double newZoomValue) {}

  Future<void> addOrUpdateCircleMarker(LatLng? latLng,
      {String markerId = "default", bool fitWithinBounds = true}) async {
    if (latLng != null) {
      markers
          .removeWhere((Marker _marker) => _marker.markerId.value == markerId);
      markers.add(
        MezMarker(
          fitWithinBounds: fitWithinBounds,
          markerId: MarkerId(markerId),
          icon: await BitmapDescriptor.fromAssetImage(
            ImageConfiguration(),
            aPurpleLocationCircle,
          ),
          flat: true,
          position: latLng,
        ),
      );
    } else
      mezDbgPrint(
          "addOrUpdatePurpleDestinationMarker skipppping ==> $markerId");
  }

  void removeCircleMarker({String markerId = "default"}) {
    markers.removeWhere((Marker _marker) => _marker.markerId.value == markerId);
  }

  double _calculateMarkersSize() {
    final double _res = markersDefaultSize.value;

    if (SizerUtil.height <= 868) {
      return 60;
    } else {
      return _res;
    }
  }

  Future<void> addOrUpdateUserMarker(
      {String? markerId,
      bool fitWithinBounds = true,
      required LatLng? latLng,
      String? customImgHttpUrl}) async {
    if (latLng != null) {
      BitmapDescriptor icon;

      final String? uImg = Get.find<AuthController>().user?.image ??
          Get.find<AuthController>().user?.image;

      if (uImg == null) {
        icon = await bitmapDescriptorLoader(
            (await cropRonded(
                (await rootBundle.load(aDefaultAvatar)).buffer.asUint8List())),
            _calculateMarkersSize(),
            _calculateMarkersSize(),
            isBytes: true);
      } else {
        icon = await bitmapDescriptorLoader(
            (await cropRonded(
                (await http.get(Uri.parse(customImgHttpUrl ?? uImg)))
                    .bodyBytes) as Uint8List),
            _calculateMarkersSize(),
            _calculateMarkersSize(),
            isBytes: true);
      }

      final String mId = (markerId ??
          Get.find<AuthController>().user?.hasuraId.toString() ??
          'ANONYMOUS');

      // default userId is authenticated's
      _addOrUpdateMarker(
        MezMarker(
          fitWithinBounds: fitWithinBounds,
          markerId: MarkerId(mId),
          icon: icon,
          position: latLng,
        ),
      );
    } else
      mezDbgPrint(
          "addOrUpdatePurpleDestinationMarker skipppping ==> $markerId");
    // Inside function to get ImgBytes
    // Future<Uint8List?> _fetchImgBytes(String uImg) async {
    //   Uint8List? _imgBytes;

    //   final String? uImg = Get.find<AuthController>().user?.image;

    //   // Inside function to get Bitmapdescriptor

    //   return null;
    // }

    // Future<BitmapDescriptor?> _buildBitmap(String? uImg) async {
    //   BitmapDescriptor? bitMap;
    //   if (uImg == null) {
    //     mezDbgPrint("uiImage null =========");
    //     bitMap = await bitmapDescriptorLoader(
    //         (await cropRonded(
    //             (await rootBundle.load(aDefaultAvatar)).buffer.asUint8List())),
    //         _calculateMarkersSize(),
    //         _calculateMarkersSize(),
    //         isBytes: true);
    //   } else {
    //     mezDbgPrint("uImage not null ======>$uImg");
    //     await _fetchImgBytes(uImg).then((Uint8List? _imgBytes) async {
    //       mezDbgPrint("Image bytes check =======>$_imgBytes");
    //       if (_imgBytes != null) {
    //         bitMap = await bitmapDescriptorLoader(
    //           (await cropRonded(_imgBytes)),
    //           _calculateMarkersSize(),
    //           _calculateMarkersSize(),
    //           isBytes: true,
    //         );
    //       }
    //     });
    //   }

    //   return bitMap;
    // }

    // if (latLng != null) {
    //   mezDbgPrint("Called add or update user marker 🤣 $latLng");
    //   final String mId = (markerId ??
    //       fireAuth.FirebaseAuth.instance.currentUser?.uid ??
    //       'ANONYMOUS');

    //   await _buildBitmap(customImgHttpUrl).then((BitmapDescriptor? icon) {
    //     mezDbgPrint("Print icon ::::::===>$icon");
    //     if (icon != null) {
    //       // default userId is authenticated's
    //       _addOrUpdateMarker(
    //         MezMarker(
    //           fitWithinBounds: fitWithinBounds,
    //           markerId: MarkerId(mId),
    //           icon: icon,
    //           position: latLng,
    //         ),
    //       );
    //     }
    //   });
    // } else {
    //   mezDbgPrint("Else print 😍");
    // }
  }

  Future<void> addOrUpdateTaxiDriverMarker(String? markerId, LatLng? latLng,
      {String? markerTitle, bool fitWithinBounds = true}) async {
    if (latLng != null && markerId != null) {
      // this check so we keep one single copy of the asset Bytes instead of re-croping again n again
      if (_taxiDriverImgDescruptorCopy == null) {
        _taxiDriverImgDescruptorCopy = await cropRonded(
            (await rootBundle.load(taxi_driver_marker_asset))
                .buffer
                .asUint8List());
      }

      _addOrUpdateMarker(
        MezMarker(
          fitWithinBounds: fitWithinBounds,
          infoWindow: markerTitle == null
              ? InfoWindow.noText
              : InfoWindow(title: markerTitle),
          markerId: MarkerId(markerId),
          icon: await bitmapDescriptorLoader(
            (await cropRonded(
              (await rootBundle.load(taxi_driver_marker_asset))
                  .buffer
                  .asUint8List(),
            )),
            _calculateMarkersSize(),
            _calculateMarkersSize(),
            isBytes: true,
          ),
          flat: true,
          position: latLng,
        ),
      );
    } else
      mezDbgPrint(
          "addOrUpdatePurpleDestinationMarker skipppping ==> $markerId");
  }

  Future<void> addOrUpdatePurpleDestinationMarker(
      {String markerId = "dest",
      required LatLng? latLng,
      bool fitWithinBounds = true}) async {
    if (latLng != null) {
      final BitmapDescriptor icon = await bitmapDescriptorLoader(
          (await cropRonded((await rootBundle.load(mezDestinationMarker))
              .buffer
              .asUint8List())),
          _calculateMarkersSize(),
          _calculateMarkersSize(),
          isBytes: true);
      // markerId = markerId;

      _addOrUpdateMarker(
        MezMarker(
          fitWithinBounds: fitWithinBounds,
          markerId: MarkerId(markerId),
          icon: icon,
          position: latLng,
        ),
      );
    } else
      mezDbgPrint(
          "addOrUpdatePurpleDestinationMarker skipppping ==> $markerId");
  }

  Future<void> addOrUpdatePackageMarkerMarker(
      {String markerId = "package",
      required LatLng? latLng,
      bool fitWithinBounds = true}) async {
    if (latLng != null) {
      final BitmapDescriptor icon = await bitmapDescriptorLoader(
          (await cropRonded(
              (await rootBundle.load(mezPackageMarker)).buffer.asUint8List())),
          _calculateMarkersSize(),
          _calculateMarkersSize(),
          isBytes: true);
      // markerId = markerId;

      _addOrUpdateMarker(
        MezMarker(
          fitWithinBounds: fitWithinBounds,
          markerId: MarkerId(markerId),
          icon: icon,
          position: latLng,
        ),
      );
    } else
      mezDbgPrint(
          "addOrUpdatePurpleDestinationMarker skipppping ==> $markerId");
  }

  void removeDestinationMarker({String id = "dest"}) {
    removeMarkerById(id);
  }

  void decodeAndAddPolyline({required String encodedPolylineString}) {
    List<PointLatLng> pts = MapHelper.loadUpPolyline(encodedPolylineString)
        .map<PointLatLng>((LatLng e) => PointLatLng(e.latitude, e.longitude))
        .toList();
    mezDbgPrint("[AAA] First cords of polyline => ${pts.first}");
    mezDbgPrint("[AAA] Last cords of polyline => ${pts.last}");
    addPolyline(pts);
  }

  void removeMarkerById(String? markerId) {
    if (markerId != null)
      markers
          .removeWhere((Marker _marker) => _marker.markerId.value == markerId);
  }

  void removerAuthenticatedUserMarker() {
    final String _mId =
        (fireAuth.FirebaseAuth.instance.currentUser?.uid ?? 'ANONYMOUS');
    markers.removeWhere((Marker _marker) => _marker.markerId.value == _mId);
  }

  void addPolyline(List<PointLatLng> latLngPoints) {
    final Polyline _poly = Polyline(
        color: primaryBlueColor,
        jointType: JointType.round,
        width: 2,
        startCap: Cap.buttCap,
        endCap: Cap.roundCap,
        polylineId: PolylineId('_poly_'),
        visible: true,
        points: latLngPoints
            .map<LatLng>((PointLatLng e) => LatLng(e.latitude, e.longitude))
            .toList());
    polylines.assign(_poly);
    animateMarkersPolyLinesBounds.value = true;
  }

  void clearPolyline() {
    polylines.clear();
  }

  void setAnimateMarkersPolyLinesBounds(bool value) {
    animateMarkersPolyLinesBounds.value = value;
  }

  Future<void> moveToNewLatLng(double lat, double lng) async {
    mezDbgPrint("controller ====> $controller");
    await controller.value
        ?.animateCamera(CameraUpdate.newLatLng(LatLng(lat, lng)));
  }

  Future<LatLng?> getMapCenter() async {
    final LatLngBounds? visibleRegion =
        await controller.value?.getVisibleRegion();
    LatLng? centerLatLng;
    if (visibleRegion != null) {
      centerLatLng = LatLng(
        (visibleRegion.northeast.latitude + visibleRegion.southwest.latitude) /
            2,
        (visibleRegion.northeast.longitude +
                visibleRegion.southwest.longitude) /
            2,
      );
    }

    return centerLatLng;
  }

  void setLocation(MezLocation newLocation) {
    location.value = newLocation;
  }

  void setBounds(LatLngBounds? bounds) {
    this.bounds = bounds;
  }

  // Animate the camera using widget.bounds
  Future<void> animateCameraWithNewBounds() async {
    if (controller.value != null && bounds != null) {
      final CameraUpdate _camUpdate =
          CameraUpdate.newLatLngBounds(bounds!, 100);
      await controller.value!.animateCamera(_camUpdate);
      await _boundsReChecker(_camUpdate);
    }
  }

  // Cheker -> Animate first and Double check if the bounds fit well the MapScreen
  Future<void> _boundsReChecker(CameraUpdate u) async {
    await controller.value?.animateCamera(u);
    final LatLngBounds? l1 = await controller.value?.getVisibleRegion();
    final LatLngBounds? l2 = await controller.value?.getVisibleRegion();
    if (l1 != null && l2 != null) {
      if (l1.southwest.latitude == -90 || l2.southwest.latitude == -90)
        await _boundsReChecker(u);
    }
  }

  // adds up the markers the new markers latLn ot polyline's and calculate out of them all the latLngbounds
  LatLngBounds? _getMarkersAndPolylinesBounds(bool shouldFitPolylineInBound) {
    final List<LatLng> _polyLinesBnds = shouldFitPolylineInBound
        ? _getLatLngBoundsFromPolyline(polylines)
        : <LatLng>[];

    final List<LatLng> _bnds = <LatLng>[..._polyLinesBnds];
    markers.forEach((MezMarker _marker) {
      if (_marker.fitWithinBounds) {
        _bnds.add(_marker.position);
      }
    });

    return _bnds.isEmpty ? null : MapHelper.createMapBounds(_bnds);
  }

  // Calculate bounds from the polyline's List of LatLng
  // we're using this onInit (one time calculation since we have the polyline always the same)
  List<LatLng> _getLatLngBoundsFromPolyline(Set<Polyline> p) {
    if (p.isNotEmpty) {
      double minLat = p.first.points.first.latitude;
      double minLong = p.first.points.first.longitude;
      double maxLat = p.first.points.first.latitude;
      double maxLong = p.first.points.first.longitude;
      p.forEach((Polyline poly) {
        poly.points.forEach((LatLng point) {
          if (point.latitude < minLat) minLat = point.latitude;
          if (point.latitude > maxLat) maxLat = point.latitude;
          if (point.longitude < minLong) minLong = point.longitude;
          if (point.longitude > maxLong) maxLong = point.longitude;
        });
      });

      return <LatLng>[LatLng(minLat, minLong), LatLng(maxLat, maxLong)];
    } else {
      return <LatLng>[];
    }
  }

  /// Main function for updating the bounds and start the animation
  Future<void> animateAndUpdateBounds(
      {bool shouldFitPolylineInBound = true}) async {
    if (periodicRerendering.value) {
      setBounds(animateMarkersPolyLinesBounds.value
          ? _getMarkersAndPolylinesBounds(shouldFitPolylineInBound)
          : null);
      await animateCameraWithNewBounds();
    }
  }

  /// This locks In AutoZoom and AutoAnimate
  void lockInAutoZoomAnimation() {
    if (!periodicRerendering.value) {
      periodicRerendering.value = true;
    }
    recenterButtonEnabled.value = false;
  }

  /// Unlock AutoZoom and AutoAnimation and shows [Recenter Button]
  void unlockAutoZoomAnimation() {
    if (periodicRerendering.value) {
      periodicRerendering.value = false;
      myLocationButtonEnabled.value = false;
      recenterButtonEnabled.value = true;
    }
  }

  MinMaxZoomPreference getMapMinMaxZommPrefs() {
    if (minMaxZoomPrefs == null) {
      return polylines.isNotEmpty
          ? MinMaxZoomPreference.unbounded
          : MinMaxZoomPreference(16, 17);
    } else {
      return minMaxZoomPrefs!;
    }
  }

  /// This basically sets the ZoomLvl of the map manually.
  ///
  /// `periodicRerendering` should be false to do this , because if periodicRendering is true it will keep fitting/animating every `x` second.
  ///
  /// `minMaxZoomPrefs` shoud be unbounded, else You can not controll the zoom since it's already sat with a min/max.
  void setZoomLvl({required double zoomLvl}) {
    assert(periodicRerendering == false);
    assert(minMaxZoomPrefs == MinMaxZoomPreference.unbounded);
    controller.value?.animateCamera(CameraUpdate.zoomTo(zoomLvl));
  }

  Future<void> locateMe() async {
    final GeoLoc.LocationData? _tmpCurrentLoc = await _currentLocation();
    if (_tmpCurrentLoc != null) {
      await controller.value?.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(
              _tmpCurrentLoc.latitude!,
              _tmpCurrentLoc.longitude!,
            ),
          ),
        ),
      );
    }
  }

  Future<GeoLoc.LocationData?> _currentLocation() async {
    GeoLoc.LocationData? currentLocation;
    try {
      currentLocation =
          await Get.find<LocationController>().getCurrentLocation();
    } on Exception catch (e, stk) {
      currentLocation = null;
      mezDbgPrint(e);
      mezDbgPrint(stk);
    }
    return currentLocation;
  }
}
