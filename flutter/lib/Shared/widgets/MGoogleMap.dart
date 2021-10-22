import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:mezcalmos/Shared/constants/mapConstants.dart';
import 'package:mezcalmos/Shared/controllers/appLifeCycleController.dart';
import 'package:mezcalmos/Shared/helpers/MapHelper.dart';
import 'package:mezcalmos/Shared/utilities/Extensions.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MGoogleMap extends StatefulWidget with MezDisposable {
  // List<CustomMarker> customMarkers;
  LatLng initialLocation;
  Set<Polyline> polylines;
  List<Marker> markers;
  Map<String, Stream<LocationData>> idWithSubscription;
  Duration rerenderDuration;
  String debugString;
  MGoogleMap({
    required this.markers,
    required this.initialLocation,
    this.rerenderDuration = const Duration(seconds: 2),
    this.debugString = "",
    this.polylines = const <Polyline>{},
    this.idWithSubscription = const {},
  }) {
    mezDbgPrint("MGoogleMap cosntructor ${this.hashCode} ${this.debugString}");
  }
  @override
  State<MGoogleMap> createState() => _MGoogleMapState();
}

class _MGoogleMapState extends State<MGoogleMap> with MezDisposable {
  late Timer _reRendringTimer;
  GoogleMapController? _controller;
  Completer<GoogleMapController> _completer = Completer();
  List<LatLng> _polylinesLatLngBounds = [];
  // to make sure each marker gets fully handled when the new data comes on it's corresponding stream!
  List<String> _markersCurrentlyBeingUpdated = <String>[];

// Cheker -> Animate first and Double check if the bounds fit well the MapScreen
  Future<void> _boundsReChecker(CameraUpdate u) async {
    _controller?.animateCamera(u);
    _controller?.animateCamera(u);
    LatLngBounds? l1 = await _controller?.getVisibleRegion();
    LatLngBounds? l2 = await _controller?.getVisibleRegion();
    if (l1 != null && l2 != null) {
      if (l1.southwest.latitude == -90 || l2.southwest.latitude == -90)
        await _boundsReChecker(u);
    }
  }

  // Animate the camera using widget.bounds
  Future<void> _animateCameraWithNewBounds(LatLngBounds? _bounds) async {
    if (_controller != null && _bounds != null) {
      CameraUpdate _camUpdate = CameraUpdate.newLatLngBounds(_bounds, 100.sp);
      await _controller!.animateCamera(_camUpdate);
      await _boundsReChecker(_camUpdate);
    }
  }

  // Calculate bounds from the polyline's List of LatLng
  // we're using this onInit (one time calculation since we have the polyline always the same)
  List<LatLng> _getLatLngBoundsFromPolyline(Set<Polyline> p) {
    double minLat = p.first.points.first.latitude;
    double minLong = p.first.points.first.longitude;
    double maxLat = p.first.points.first.latitude;
    double maxLong = p.first.points.first.longitude;
    p.forEach((poly) {
      poly.points.forEach((point) {
        if (point.latitude < minLat) minLat = point.latitude;
        if (point.latitude > maxLat) maxLat = point.latitude;
        if (point.longitude < minLong) minLong = point.longitude;
        if (point.longitude > maxLong) maxLong = point.longitude;
      });
    });

    return [LatLng(minLat, minLong), LatLng(maxLat, maxLong)];
  }

  // adds up the markers the new markers latLn ot polyline's and calculate out of them all the latLngbounds
  LatLngBounds? _getMarkersAndPolylinesBounds() {
    List<LatLng> _bnds = [..._polylinesLatLngBounds];
    widget.markers.forEach((cmarker) {
      _bnds.add(cmarker.position);
    });
    return _bnds.isEmpty ? null : createMapBounds(_bnds);
  }

  // main function for updating the bounds and start the animation
  Future<void> animateAndUpdateBounds() async {
    LatLngBounds? _polyMarkersBounds = _getMarkersAndPolylinesBounds();
    if (_polyMarkersBounds != null) {
      // widget.bounds = _polyMarkersBounds;
      await _animateCameraWithNewBounds(_polyMarkersBounds);
    }
  }

  @override
  void didUpdateWidget(MGoogleMap oldWidget) {
    super.didUpdateWidget(oldWidget);
    mezDbgPrint(
        "MGoogleMap didUpdateWidget ${this.hashCode} ${widget.debugString}");
    animateAndUpdateBounds();
  }

  @override
  void initState() {
    super.initState();
    mezDbgPrint("MGoogleMap initstate ${this.hashCode} ${widget.debugString}");
    // one time polylines LatLng points extraction.
    _polylinesLatLngBounds = _getLatLngBoundsFromPolyline(widget.polylines);
    animateAndUpdateBounds();
    // attach Callback onResume to avoid Map going black in some devices after going back from background to foreGround.
    Get.find<AppLifeCycleController>().attachCallback(AppLifecycleState.resumed,
        () {
      _controller?.setMapStyle(mezMapStyle);
    });
    // control our re-rendring Separately;
    _reRendringTimer = Timer.periodic(widget.rerenderDuration, (_) {
      animateAndUpdateBounds();
    });

    widget.idWithSubscription.forEach((markerId, stream) {
      stream.listen((newLoc) {
        if (!_markersCurrentlyBeingUpdated.contains(markerId)) {
          mezDbgPrint("N E W    L O C A T I O N");
          _markersCurrentlyBeingUpdated.add(markerId);
          int i = widget.markers
              .indexWhere((element) => element.markerId.value == markerId);
          mezDbgPrint(
              "Inside MgoogleMap::widget.idWithSubscription::listener :: marker id -> ${widget.markers[i].markerId.value}");
          this.setState(() {
            widget.markers[i] = Marker(
                markerId: MarkerId(markerId),
                icon: widget.markers[i].icon,
                position: LatLng(newLoc.latitude!, newLoc.longitude!));
          });
          _markersCurrentlyBeingUpdated.remove(markerId);
          // animateAndUpdateBounds();
          mezDbgPrint(" E N D  -  L O C A T I O N");
        }
        // we skip if that markerId is already being handled .
      }).canceledBy(this);
    });
  }

  @override
  void dispose() {
    mezDbgPrint("MGoogleMap disposed ${this.hashCode} ${widget.debugString}");
    _reRendringTimer.cancel();
    // favoid keeping listeners in memory.
    cancelSubscriptions();
    // gmapControlelr disposing.
    _controller?.dispose();
    _controller = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    mezDbgPrint(
        "Inside MGoogleMap build ${this.hashCode} ${widget.debugString}");
    responsiveSize(context);
    return widget.markers.isNotEmpty
        ? GoogleMap(
            padding: EdgeInsets.all(20),
            mapToolbarEnabled: false,
            myLocationButtonEnabled: false,
            // minMaxZoomPreference: MinMaxZoomPreference(10, 30),
            buildingsEnabled: false,
            markers: widget.markers.toSet(),
            polylines: widget.polylines,
            zoomControlsEnabled: false,
            compassEnabled: false,
            mapType: MapType.normal,
            tiltGesturesEnabled: true,

            initialCameraPosition: CameraPosition(
                target: widget.initialLocation,
                tilt: 9.440717697143555,
                zoom: 5.151926040649414),

            onMapCreated: (GoogleMapController _gController) async {
              mezDbgPrint(
                  "\n\n\n\n\n o n   m a p   c r e a t e d !\n\n\n\n\n\n");
              _controller = _gController;
              await _gController.setMapStyle(mezMapStyle);
              // await _controller!.setMapStyle(mezMapStyle);
              // LatLngBounds? _bounds = _getMarkersAndPolylinesBounds();
              // if (_bounds != null) {
              //   await _animateCameraWithNewBounds(_bounds);
              // }
              await animateAndUpdateBounds();
              _completer.complete(_gController);
            },
          )
        : Center(
            child: Container(
                height: 200,
                width: 200,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                child: Transform.scale(scale: .8, child: MezLogoAnimation())),
          );
  }
}
