import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/widgets/MGoogleMap.dart';
import 'package:mezcalmos/Shared/widgets/OrderMap/controllers/OrderMapWidgetController.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["Shared"]["widgets"]
    ["OrderMapWidget"];

class OrderMapWidget extends StatefulWidget {
  const OrderMapWidget(
      {super.key,
      required this.deliveryOrderId,
      required this.updateDriver,
      required this.polyline,
      required this.from,
      required this.to});
  final int deliveryOrderId;
  final bool updateDriver;
  final String? polyline;
  final MezLocation? from;
  final MezLocation to;

  @override
  State<OrderMapWidget> createState() => _OrderMapWidgetState();
}

class _OrderMapWidgetState extends State<OrderMapWidget> {
  OrderMapWidgetController viewController = OrderMapWidgetController();
  @override
  void initState() {
    viewController.initMap(
        deliveryOrderId: widget.deliveryOrderId,
        updateDriver: widget.updateDriver,
        polyline: widget.polyline,
        from: widget.from,
        to: widget.to);
    super.initState();
  }

  @override
  void dispose() {
    viewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: (kIsWeb)
          ? Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                "${_i18n()['mapWebText']}",
                style: context.txt.bodyLarge,
              ))
          : MGoogleMap(
              padding: EdgeInsets.zero,
              mGoogleMapController: viewController.mGoogleMapController,
              recenterBtnBottomPadding: 20,
            ),
    );
  }
}
