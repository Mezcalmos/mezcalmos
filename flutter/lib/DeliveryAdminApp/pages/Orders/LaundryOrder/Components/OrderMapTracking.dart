import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/DeliveryAdminApp/models/Driver.dart';
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/widgets/MGoogleMap.dart';

class OrderMapTracking extends StatefulWidget {
  final MGoogleMapController mapController = MGoogleMapController();
  Driver? driver;
  final Order order;
  OrderMapTracking({Key? key, required this.driver, required this.order})
      : super(key: key);

  @override
  _OrderMapTrackingState createState() => _OrderMapTrackingState();
}

class _OrderMapTrackingState extends State<OrderMapTracking> {
  @override
  void initState() {
    widget.mapController.minMaxZoomPrefs = MinMaxZoomPreference.unbounded;
    widget.mapController.setAnimateMarkersPolyLinesBounds(true);
    widget.mapController.setLocation(widget.order.to);

    if (widget.driver != null) {
      widget.mapController
          .addOrUpdateUserMarker(latLng: widget.driver!.location);
    }
    widget.mapController.addOrUpdatePurpleDestinationMarker(
        latLng: LatLng(widget.order.to.latitude, widget.order.to.longitude));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 300,
        child: MGoogleMap(
          mGoogleMapController: widget.mapController,
        ),
      ),
    );
  }
}
