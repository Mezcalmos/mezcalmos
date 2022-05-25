import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/laundryOrderController.dart';
// import 'package:mezcalmos/LaundryApp/controllers/orderController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';

class SetOrderEstTimeComponent extends StatefulWidget {
  const SetOrderEstTimeComponent({Key? key, required this.order})
      : super(key: key);
  final LaundryOrder order;

  @override
  State<SetOrderEstTimeComponent> createState() =>
      _SetOrderEstTimeComponentState();
}

class _SetOrderEstTimeComponentState extends State<SetOrderEstTimeComponent> {
  LaundryOrderController orderController = Get.find<LaundryOrderController>();
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Order Estimated Time "),
          SizedBox(
            height: 5,
          ),
          Card(
            color: (widget.order.isAtLaundry() ||
                    widget.order.estimatedLaundryReadyTime != null)
                ? Colors.white
                : Colors.grey.shade500,
            child: (isClicked)
                ? Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(5),
                    child: CircularProgressIndicator())
                : InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: (widget.order.isAtLaundry())
                        ? () async {
                            final DateTime? selectedDate =
                                widget.order.estimatedLaundryReadyTime;

                            await showDatePicker(
                              context: context,
                              initialDate: selectedDate ?? DateTime.now(),
                              firstDate: widget.order.orderTime,
                              lastDate: DateTime(2050),
                            ).then((DateTime? date) {
                              if (date != null) {
                                showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay(
                                            hour: widget.order.orderTime.hour,
                                            minute:
                                                widget.order.orderTime.minute))
                                    .then((TimeOfDay? time) {
                                  if (time != null) {
                                    _setOrderEstTime(DateTime(
                                        date.year,
                                        date.month,
                                        date.day,
                                        time.hour,
                                        time.minute));
                                  }
                                });
                              }
                            });
                          }
                        : null,
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Icon(
                            Icons.event,
                            size: 40,
                            color: purpleColor,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            (widget.order.estimatedLaundryReadyTime != null)
                                ? "${DateFormat("dd MMMM yyyy, hh:mm a ").format(widget.order.estimatedLaundryReadyTime!.toLocal())}"
                                : "Set Delivery esitmated time",
                            style: Get.theme.textTheme.bodyText1,
                          )
                        ],
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  void _setOrderEstTime(DateTime value) {
    setState(() {
      isClicked = true;
    });
    orderController
        .setEstimatedLaundryReadyTime(widget.order.orderId, value)
        .whenComplete(() {
      setState(() {
        isClicked = false;
      });
    });
  }
}
