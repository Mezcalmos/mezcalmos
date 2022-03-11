import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/TaxiOrder/components/TaxiOpenOrderControllButtons.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder.dart';
import 'package:sizer/sizer.dart';

class TaxiOpenOrderBottomCard extends StatelessWidget {
  /// Bottom card of the open taxi order :  shows order info and buttons to handle the order
  TaxiOpenOrderBottomCard({Key? key, required this.order}) : super(key: key);
  final TaxiOrder order;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Container(
        margin: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _orderStausAndTimer(context),
            Divider(),
            _orderCustomerInfo(context),
            Divider(),
            _driversStatsComponent(),
            Divider(),
            _orderFromToAdresses(context),
            TaxiOpenOrderControllButtons(
              order: order,
            )
          ],
        ),
      ),
    );
  }

// return the order from and to adresses( in a colmn to prevent overflow )
  Widget _orderFromToAdresses(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'From :' + order.from.address,
          style: Theme.of(context).textTheme.bodyText2,
        ),
        SizedBox(
          height: 8,
        ),
        Text('To :' + order.to.address,
            style: Theme.of(context).textTheme.bodyText2),
        SizedBox(
          height: 8,
        ),
      ],
    );
  }

// return the customer image and name and order distance
  Widget _orderCustomerInfo(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundImage: CachedNetworkImageProvider(order.customer.image),
        ),
        SizedBox(
          width: 8,
        ),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                order.customer.name,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Container(
                padding: EdgeInsets.only(left: 5),
                child: Row(
                  children: [
                    Icon(
                      Icons.directions_outlined,
                      size: 16,
                      color: Theme.of(context).primaryColorLight,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      order.routeInformation!.distance.distanceStringInKm,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

// return the order statu and timer of order to expire 10 min
  Container _orderStausAndTimer(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: (order.status != TaxiOrdersStatus.LookingForTaxi)
          ? Container(
              alignment: Alignment.center, child: Text(_getOrderStatus()))
          : Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(_getOrderStatus()),
                Spacer(),
                Icon(
                  Icons.timer,
                  size: 20,
                  color: Theme.of(context).primaryColorLight,
                ),
                SizedBox(
                  width: 5,
                ),
                CountdownTimer(
                  endTime: order.orderTime.millisecondsSinceEpoch + 1000 * 600,
                  widgetBuilder: (_, CurrentRemainingTime? time) {
                    if (time == null) {
                      return Text('Order expired');
                    }
                    return Text(
                      '${time.min ?? '00'}:${time.sec}',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: Theme.of(context).primaryColorLight),
                    );
                  },
                ),
              ],
            ),
    );
  }

// return how many drivers have recieved the order notif and how many have read it
  Widget _driversStatsComponent() {
    return Container(
      margin: const EdgeInsets.only(top: 5, left: 5, right: 5),
      child: Row(
        children: [
          Icon(
            Icons.taxi_alert,
            size: 14.sp,
            color: Colors.black,
          ),
          SizedBox(
            width: 5,
          ),
          Flexible(
            flex: 3,
            fit: FlexFit.tight,
            child: Text(
                'Sent to : ${order.numberOfTaxiSentNotificationTo().toString()} drivers'),
          ),
          Spacer(),
          Icon(
            Icons.check_box,
            size: 14.sp,
            color: Colors.green,
          ),
          SizedBox(
            width: 5,
          ),
          Flexible(
            flex: 3,
            fit: FlexFit.tight,
            child: Text(
                'Read by : ${order.numberOfTaxiReadNotification().toString()} drivers'),
          ),
        ],
      ),
    );
  }

// function with a string return to the current open order status
  String _getOrderStatus() {
    switch (order.status) {
      case TaxiOrdersStatus.LookingForTaxi:
        return 'Looking for taxi';
      case TaxiOrdersStatus.ForwardingToLocalCompany:
        return 'Forwarding to local company';
      case TaxiOrdersStatus.ForwardingSuccessful:
        return 'Forwarding Successful';
      case TaxiOrdersStatus.ForwardingUnsuccessful:
        return 'Forwarding unsuccessful';

      default:
        return 'unknown';
    }
  }
}
