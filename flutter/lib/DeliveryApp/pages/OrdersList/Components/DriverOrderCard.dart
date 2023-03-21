import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryApp/pages/SingleOrder/DvOrderView.dart';
import 'package:mezcalmos/DeliveryApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/OrderInfoCard/OrderInfoCard.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["DeliveryApp"]
        ["pages"]["CurrentOrders"]["CurrentOrdersListScreen"]["Components"]
    ["DriverOrderCard"];

class DriverOrderCard extends StatelessWidget {
  /// Order card for delivery driver used to show current or past order ,
  /// showLeftIcon shoud be false when a current order is passed to this component

  const DriverOrderCard({
    Key? key,
    required this.order,
    this.showLeftIcon = true,
    this.isPastOrder = false,
  }) : super(key: key);
  final Order order;
  final bool isPastOrder;
  final bool showLeftIcon;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return OrderInfosCard(
      orderCardSubWidgets: OrderCardSubWidgets(
          onCardTap: () {
            // MezRouter.toNamed(getOrderDetailsRoute(order.orderId));
            if (order.orderType == OrderType.Restaurant) {
              DvOrderView.navigate(orderId: order.orderId);
            } else if (order.orderType == OrderType.Laundry) {
              MezRouter.toNamed(
                  DeliveryAppRoutes.getLaundryOrderRoute(order.orderId));
            }
          },
          cardTitle: _getOrderTitle(),
          primaryBodyContent: Text(order.to.address),
          cardStatus: _getOrderWidget(context),
          cardTime: Text(order.orderTime.getOrderTime().inCaps),
          rightImage: _getOrderIcon()),
      order: order,
    );
  }

  Widget _getOrderIcon() {
    if (order.orderType == OrderType.Restaurant) {
      return Container(
        height: 30.sp,
        width: 30.sp,
        // padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: primaryBlueColor,
        ),
        child: Center(
          child: Icon(
            Icons.flatware,
            size: 20.sp,
            color: Colors.white,
          ),
        ),
      );
    } else {
      return Container(
        // padding: const EdgeInsets.all(5),
        height: 30.sp,
        width: 30.sp,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: primaryBlueColor,
        ),
        child: Center(
          child: Icon(
            Icons.local_laundry_service,
            size: 20.sp,
            color: Colors.white,
          ),
        ),
      );
    }
  }

  Widget _getOrderWidget(BuildContext context) {
    if (order.orderType == OrderType.Restaurant) {
      switch ((order as RestaurantOrder).status) {
        case RestaurantOrderStatus.CancelledByAdmin:
        case RestaurantOrderStatus.CancelledByCustomer:
          return Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.red.shade100,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Center(
              child: Text(
                "${_i18n()["cancelled"]}",
                style: context.txt.bodyLarge?.copyWith(color: Colors.red),
              ),
            ),
          );
        case RestaurantOrderStatus.Delivered:
          return Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.green.shade100,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Center(
              child: Text(
                "${_i18n()["delivered"]}",
                style: context.txt.bodyLarge?.copyWith(color: Colors.green),
              ),
            ),
          );
        case RestaurantOrderStatus.OnTheWay:
          return Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.amber.shade100,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Center(
              child: Text(
                "${_i18n()["inTransit"]}",
                style: context.txt.bodyLarge?.copyWith(color: Colors.amber),
              ),
            ),
          );
        case RestaurantOrderStatus.Ready:
          return Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.green.shade100,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Center(
              child: Text(
                "${_i18n()["ready"]}",
                style: context.txt.bodyLarge?.copyWith(color: Colors.green),
              ),
            ),
          );
        case RestaurantOrderStatus.OrderReceived:
          if ((order as RestaurantOrder).isScheduled()) {
            return Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: secondaryLightBlueColor,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: Text(
                  "${_i18n()["scheduled"]}",
                  style:
                      context.txt.bodyLarge?.copyWith(color: primaryBlueColor),
                ),
              ),
            );
          } else {
            return Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.amber.shade100,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: Text(
                  "${_i18n()["waiting"]}",
                  style: context.txt.bodyLarge?.copyWith(color: Colors.amber),
                ),
              ),
            );
          }
        default:
          return Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.amber.shade100,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Center(
              child: Text(
                "${_i18n()["waiting"]}",
                style: context.txt.bodyLarge?.copyWith(color: Colors.amber),
              ),
            ),
          );
      }
    } else {
      switch ((order as LaundryOrder).status) {
        case LaundryOrderStatus.ReadyForDelivery:
          return Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.green.shade100,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Text(
              "${_i18n()["ready"]}",
              style: context.txt.bodyLarge?.copyWith(color: Colors.green),
            ),
          );
        case LaundryOrderStatus.OtwPickupFromCustomer:
        case LaundryOrderStatus.OtwPickupFromLaundry:
        case LaundryOrderStatus.PickedUpFromCustomer:
        case LaundryOrderStatus.PickedUpFromLaundry:
          return Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.amber.shade100,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Text(
              "${_i18n()["inTransit"]}",
              style: context.txt.bodyLarge?.copyWith(color: Colors.amber),
            ),
          );
        case LaundryOrderStatus.CancelledByAdmin:
        case LaundryOrderStatus.CancelledByCustomer:
          return Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.red.shade100,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Text(
              "${_i18n()["cancelled"]}",
              style: context.txt.bodyLarge?.copyWith(color: Colors.red),
            ),
          );
        case LaundryOrderStatus.AtLaundry:
          if (isPastOrder == true) {
            return Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Text(
                "${_i18n()["delivered"]}",
                style: context.txt.bodyLarge?.copyWith(color: Colors.green),
              ),
            );
          } else {
            return Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.amber.shade100,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Text(
                "${_i18n()["waiting"]}",
                style: context.txt.bodyLarge?.copyWith(color: Colors.amber),
              ),
            );
          }

        case LaundryOrderStatus.Delivered:
          return Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.green.shade100,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Text(
              "${_i18n()["delivered"]}",
              style: context.txt.bodyLarge?.copyWith(color: Colors.green),
            ),
          );

        default:
          return Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.amber.shade100,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Text(
              "${_i18n()["waiting"]}",
              style: context.txt.bodyLarge?.copyWith(color: Colors.amber),
            ),
          );
      }
    }
  }

  String _getOrderTitle() {
    if (order.orderType == OrderType.Restaurant) {
      return "${_i18n()['orderTitle']['restaurantDelivery']}";
    } else if (isPastOrder &&
        (order as LaundryOrder).status == LaundryOrderStatus.AtLaundry) {
      return "${_i18n()['orderTitle']['laundryPickup']}";
    } else if ((order as LaundryOrder).getCurrentPhase() ==
        LaundryOrderPhase.Pickup) {
      return "${_i18n()['orderTitle']['laundryPickup']}";
    } else
      return "${_i18n()['orderTitle']['laundryDelivery']}";
  }
}