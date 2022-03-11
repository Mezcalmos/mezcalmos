import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/router.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/TaxiOrder.dart';
import 'package:sizer/sizer.dart';

class TaxiOpenOrderCard extends StatelessWidget {
  final TaxiOrder order;
  const TaxiOpenOrderCard({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Get.toNamed(getTaxiOrderRoute(order.orderId));
        },
        borderRadius: BorderRadius.circular(10),
        child: Container(
          margin: EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _cardHeader(context),
              Divider(),
              _cardBottom(context),
            ],
          ),
        ),
      ),
    );
  }

// Return the bottom part of the card : adress destination + distance
  Widget _cardBottom(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            'To : ' + order.to.address,
            style: Theme.of(context).textTheme.subtitle1,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 5),
          child: Row(
            children: [
              Icon(
                Icons.directions_outlined,
                size: 16,
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
    );
  }

// Return the header part of the card : Customer info + timer + drivers Stats
  Widget _cardHeader(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: CachedNetworkImageProvider(order.customer.image),
        ),
        SizedBox(
          width: 5,
        ),
        Flexible(
          flex: 5,
          fit: FlexFit.tight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    order.customer.name,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 11.sp),
                  ),
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
                    endTime:
                        order.orderTime.millisecondsSinceEpoch + 1000 * 600,
                    widgetBuilder: (_, CurrentRemainingTime? time) {
                      if (time == null) {
                        return Text('Order expired');
                      }
                      return Text(
                        '${time.min ?? '00'}:${time.sec}',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Theme.of(context).primaryColorLight),
                      );
                    },
                  ),
                ],
              ),
              Text(
                  'Sent to : ${order.numberOfTaxiSentNotificationTo().toString()} drivers'),
              Text(
                  'Read by : ${order.numberOfTaxiReadNotification().toString()} drivers'),
            ],
          ),
        ),
      ],
    );
  }
}
