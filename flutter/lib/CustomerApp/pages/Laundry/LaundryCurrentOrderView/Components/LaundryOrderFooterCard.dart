import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';

dynamic _i18n() =>
    Get.find<LanguageController>().strings['CustomerApp']['pages']['Laundry']
        ['LaundryCurrentOrderView']['Components']['LaundryOrderFooterCard'];

class LaundryOrderFooterCard extends StatefulWidget {
  const LaundryOrderFooterCard({
    Key? key,
    required this.order,
  }) : super(key: key);

  final LaundryOrder order;

  @override
  State<LaundryOrderFooterCard> createState() => _LaundryOrderFooterCardState();
}

class _LaundryOrderFooterCardState extends State<LaundryOrderFooterCard> {
  RxBool _clickedCancel = false.obs;

  @override
  Widget build(BuildContext context) {
    final TextTheme txt = Theme.of(context).textTheme;
    return Container(
        height: 65,
        margin: const EdgeInsets.only(bottom: 8),
        child: (widget.order.inProcess())
            ? Container(
                margin: EdgeInsets.all(8),
                child: TextButton(
                  onPressed: () async {
                    await showConfirmationDialog(context, onYesClick: () async {
                      // final ServerResponse resp =
                      //     await laundryController.cancelOrder(
                      //   widget.order.orderId,
                      // );

                      // if (resp.success) {
                      //   MezRouter.untill(
                      //     (Route<dynamic> route) =>
                      //         route.settings.name == kHomeRoute,
                      //   );
                      //   MezSnackbar(
                      //     _i18n()["titleSuccess"],
                      //     _i18n()["orderCancelSuccess"],
                      //     position: SnackPosition.TOP,
                      //   );
                      // } else {
                      //   MezSnackbar(
                      //     _i18n()["titleFailed"],
                      //     _i18n()["orderCancelFailed"],
                      //     position: SnackPosition.TOP,
                      //   );
                      // }
                    });
                  },
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.red,
                      backgroundColor: Color(0xFFF9D8D6)),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text('${_i18n()["cancelOrder"]}'),
                  ),
                ),
              )
            : null);
  }
}
