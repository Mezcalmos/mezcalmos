import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/ServerResponse.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';

dynamic _i18n() =>
    Get.find<LanguageController>().strings["CustomerApp"]["pages"]
        ["Restaurants"]["ViewOrderScreen"]["components"]["OrderFooterCard"];

class OrderFooterCard extends StatefulWidget {
  const OrderFooterCard({Key? key, required this.order}) : super(key: key);

  final RestaurantOrder order;

  @override
  State<OrderFooterCard> createState() => _OrderFooterCardState();
}

class _OrderFooterCardState extends State<OrderFooterCard> {
  OrderController controller = Get.find<OrderController>();
  RestaurantController restaurantController = Get.find<RestaurantController>();
  RxBool _clickedCancel = false.obs;

  @override
  Widget build(BuildContext context) {
    final TextTheme txt = Theme.of(context).textTheme;
    return Container(
      child: (widget.order.inProcess())
          ? Container(
              margin: EdgeInsets.all(8),
              child: TextButton(
                onPressed: () {
                  showDialog<void>(
                      context: context,
                      builder: (_) {
                        return Obx(
                          () => AlertDialog(
                            contentPadding: EdgeInsets.all(20),

                            title: Text(
                              !_clickedCancel.value
                                  ? '${_i18n()["cancelOrder"]}'
                                  : '${_i18n()["orderCanceled"]}',
                              textAlign: TextAlign.center,
                            ),

                            content: !_clickedCancel.value
                                ? Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        '${_i18n()["cancelOrderConfirm"]}',
                                      ),
                                      const SizedBox(height: 10),
                                      TextButton(
                                        onPressed: () async {
                                          _clickedCancel.value = true;
                                          // to get back to the main view.
                                          final ServerResponse resp =
                                              await restaurantController
                                                  .cancelOrder(
                                            Get.parameters['orderId']!,
                                          );
                                          mezDbgPrint(resp.data.toString());
                                          if (resp.success) {
                                            Get.until(
                                              (Route<dynamic> route) =>
                                                  route.settings.name ==
                                                  kHomeRoute,
                                            );
                                            MezSnackbar(
                                              _i18n()["titleSuccess"],
                                              _i18n()["orderCancelSuccess"],
                                              position: SnackPosition.TOP,
                                            );
                                          } else {
                                            _clickedCancel.value = false;
                                            MezSnackbar(
                                              _i18n()["titleFailed"],
                                              _i18n()["orderCancelFailed"],
                                              position: SnackPosition.TOP,
                                            );
                                          }
                                        },
                                        style: TextButton.styleFrom(
                                          backgroundColor: Colors.redAccent,
                                          padding: EdgeInsets.all(12),
                                        ),
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Text(_i18n()["yes"]),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      TextButton(
                                        onPressed: () {
                                          Get.back<void>();
                                        },
                                        style: TextButton.styleFrom(
                                          backgroundColor: Colors.black,
                                          padding: EdgeInsets.all(12),
                                        ),
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Text(_i18n()["no"]),
                                        ),
                                      ),
                                    ],
                                  )
                                : Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Center(
                                        child: CircularProgressIndicator(
                                          strokeWidth: 1.2,
                                          color: Colors.purpleAccent.shade700,
                                        ),
                                      ),
                                    ],
                                  ),

                            // actions: [
                            //   TextButton(
                            //       onPressed: () {},
                            //       child: Text('Cancel order')),
                            //   TextButton(
                            //       onPressed: () {}, child: Text('Cancel')),
                            // ],
                          ),
                        );
                      });
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red.shade600,
                ),
                child: Container(
                  alignment: Alignment.center,
                  child: Text('${_i18n()["cancelOrder"]}'),
                ),
              ),
            )
          : (widget.order.status == RestaurantOrderStatus.Delivered)
              ? Card(
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.check_circle,
                          color: Colors.green,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          '${_i18n()["orderDelivered"]}',
                          style: txt.headline3,
                        )
                      ],
                    ),
                  ),
                )
              : (widget.order.status ==
                          RestaurantOrderStatus.CancelledByCustomer ||
                      widget.order.status ==
                          RestaurantOrderStatus.CancelledByAdmin)
                  ? Card(
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.cancel,
                              color: Colors.red,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              '${_i18n()["orderCancelled"]}',
                              style: txt.headline3,
                            ),
                          ],
                        ),
                      ),
                    )
                  : TextButton(
                      onPressed: null,
                      style: TextButton.styleFrom(backgroundColor: Colors.grey),
                      child: Container(
                        alignment: Alignment.center,
                        child: Text('${_i18n()["cancelOrder"]}'),
                      ),
                    ),
    );
  }
}
