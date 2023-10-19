import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/OrdersListViews/controllers/DvOpPastOrdersViewController.dart';
import 'package:mezcalmos/DeliveryAdminApp/router.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/DvConvoCard.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['RestaurantApp']
    ['pages']['ROpPastOrdersList'];

class DvOpPastOrdersView extends StatefulWidget {
  static Future<void> navigate() {
    return MezRouter.toPath(DeliveryAdminRoutes.kDeliveryOpPastOrdersRoute);
  }

  const DvOpPastOrdersView({
    Key? key,
  }) : super(key: key);

  @override
  State<DvOpPastOrdersView> createState() => _DvOpPastOrdersViewState();
}

class _DvOpPastOrdersViewState extends State<DvOpPastOrdersView> {
  DvOpPastOrdersController _viewController = DvOpPastOrdersController();

  @override
  void initState() {
    _viewController.init();

    super.initState();
  }

  @override
  void dispose() {
    _viewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          MezcalmosAppBar(AppBarLeftButtonType.Back, onClick: MezRouter.back),
      body: Obx(
        () => Scrollbar(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // padding: const EdgeInsets.all(10),
              children: <Widget>[
                Text(
                  "${_i18n()["pastOrders"]}",
                  style: context.textTheme.bodyLarge,
                ),
                const SizedBox(height: 5),
                ListView.builder(
                  controller: _viewController.scrollController,
                  shrinkWrap: true,
                  reverse: true,
                  itemCount: _viewController.pastOrders.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (_, int index) {
                    return DvConvoCard(
                      message: _viewController.pastOrders[index],
                      onClick: () {
                        // DvCompanyOrderView.navigate(
                        //     orderId: _viewController.pastOrders[index].id);
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
