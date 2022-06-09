import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/helpers/LaundryOrderHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['LaundryApp']['pages']
    ['OrderView']['Components']['LaundryOpOrderStatusCard'];

class LaundryOpOrderStatusCard extends StatelessWidget {
  const LaundryOpOrderStatusCard({
    Key? key,
    required this.order,
  }) : super(key: key);

  final LaundryOrder order;

  @override
  Widget build(BuildContext context) {
    final TextTheme txt = Theme.of(context).textTheme;
    return Card(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                order.getOrderWidget(),
                Spacer(),
                _orderStatusText(context),
                Spacer(
                  flex: 2,
                ),
              ],
            ),
            if (_getEstimatedText() != null) _orderEtaTimeWidget()
          ],
        ),
      ),
    );
  }

  Widget _orderEtaTimeWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Divider(
          height: 7,
          thickness: 0.2,
        ),
        Container(
            child: Text(
          _getEstimatedText()!,
          textAlign: TextAlign.center,
        )),
      ],
    );
  }

  Widget _orderStatusText(BuildContext context) {
    return Flexible(
      flex: 8,
      fit: FlexFit.tight,
      child: Container(
        alignment: Alignment.center,
        child: Text(
          order.orderStatusTitle(),
          style:
              Theme.of(context).textTheme.headline3?.copyWith(fontSize: 14.sp),
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  String? _getEstimatedText() {
    switch (order.status) {
      case LaundryOrderStatus.OrderReceieved:
      case LaundryOrderStatus.OtwPickupFromCustomer:
      case LaundryOrderStatus.PickedUpFromCustomer:
        if (order.estimatedDropoffAtServiceProviderTime != null) {
          return "${_i18n()["estTimes"]["laundryArriving"]} ${order.estimatedDropoffAtServiceProviderTime!.getEstimatedTime()}";
        }
        break;
      case LaundryOrderStatus.AtLaundry:
        if (order.estimatedLaundryReadyTime != null) {
          return "${_i18n()["estTimes"]["laundryFinish"]} ${order.estimatedLaundryReadyTime!.getEstimatedTime()}";
        }
        break;

      case LaundryOrderStatus.ReadyForDelivery:
      case LaundryOrderStatus.OtwPickupFromLaundry:
        if (order.estimatedPickupFromServiceProviderTime != null) {
          return "${_i18n()["estTimes"]["driverArriving"]} ${order.estimatedPickupFromServiceProviderTime!.getEstimatedTime()}";
        }

        break;
      case LaundryOrderStatus.PickedUpFromLaundry:
        if (order.estimatedDropoffAtCustomerTime != null) {
          return "${_i18n()["estTimes"]["willBeDropped"]} ${order.estimatedDropoffAtCustomerTime!.getEstimatedTime()}";
        }

        break;
      default:
        return null;
    }
    return null;
  }
}
