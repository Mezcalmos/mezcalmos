import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/widgets/MGoogleMap.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
        ["pages"]["Restaurants"]["ViewRestaurantScreen"]["components"]
    ["restaurantInfoTab"];

class ServiceLocationCard extends StatefulWidget {
  const ServiceLocationCard({
    Key? key,
    required this.location,
    this.textStyle,
    this.height = null,
  }) : super(key: key);

  final MezLocation location;
  final TextStyle? textStyle;
  final double? height;

  @override
  State<ServiceLocationCard> createState() => _ServiceLocationCardState();
}

class _ServiceLocationCardState extends State<ServiceLocationCard> {
  MGoogleMapController mapController = MGoogleMapController();

  LatLng? restaurantLatLng;
  @override
  void initState() {
    // TODO: implement initState
    if (getRestaurantLatLng() != null) {
      initRestaurantLocationMapController();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.location != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 16,
          ),
          Container(
            child: Text(
              '${_i18n()["location"]}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          Container(
            child: Text(
              widget.location.address,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          IgnorePointer(
            ignoring: true,
            child: Card(
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                height: widget.height ?? 35.h,
                width: double.infinity,
                child: MGoogleMap(mGoogleMapController: mapController),
              ),
            ),
          ),
          // SizedBox(
          //   height: 10,
          // ),
        ],
      );
    } else {
      return Container();
    }
  }

  void initRestaurantLocationMapController() {
    // mapController.periodicRerendering.value = false;
    mapController.recenterButtonEnabled.value = false;
    mapController.minMaxZoomPrefs = MinMaxZoomPreference(15.1, 15.2);
    // centering the map on the location marker
    mapController.setLocation(widget.location);

    mapController.addOrUpdatePurpleDestinationMarker(
      latLng: getRestaurantLatLng(),
    );
//TODO @m66are disable recentre button  enable mez pointer
    //  mapController.minMaxZoomPrefs = MinMaxZoomPreference.unbounded; // LEZEM
    // mapController.animateMarkersPolyLinesBounds.value = true;
  }

  LatLng? getRestaurantLatLng() {
    if (widget.location.latitude != null && widget.location.longitude != null) {
      return LatLng(widget.location.latitude!, widget.location.longitude!);
    }
    return null;
  }
}
