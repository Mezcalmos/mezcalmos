import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/CustOrdersListView/components/CustomerInprocessOrdersList.dart';
import 'package:mezcalmos/CustomerApp/pages/CustOrdersListView/components/CustomerPastOrdersList.dart';
import 'package:mezcalmos/CustomerApp/pages/CustOrdersListView/controllers/CustomerOrdersListViewController.dart';
import 'package:mezcalmos/CustomerApp/router/customerRoutes.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['ListOrdersScreen']['ListOrdersScreen'];

class CustomerOrdersListView extends StatefulWidget {
  final bool asTab;
  const CustomerOrdersListView({Key? key, this.asTab = false})
      : super(key: key);
  static Future<void> navigate() {
    return MezRouter.toPath(CustomerRoutes.customerOrdersRoute);
  }

  @override
  _CustomerOrdersListView createState() => _CustomerOrdersListView();
}

class _CustomerOrdersListView extends State<CustomerOrdersListView> {
  CustomerOrdersListViewController viewController =
      CustomerOrdersListViewController();
  @override
  void initState() {
    viewController.init();
    super.initState();
  }

  @override
  void dispose() {
    viewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme txt = Theme.of(context).textTheme;
    return Scaffold(
      key: Get.find<SideMenuDrawerController>().getNewKey(),
      drawer: MezSideMenu(),
      appBar: MezcalmosAppBar(
        widget.asTab ? AppBarLeftButtonType.Menu : AppBarLeftButtonType.Back,
        onClick: widget.asTab ? null : MezRouter.back,
        title: '${_i18n()["title"]}',
      ),
      body: Obx(
        () => viewController.hasOrders
            ? SingleChildScrollView(
                controller: viewController.scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    if (viewController.currentOrders.isNotEmpty)
                      CustomerInprocessOrdersList(
                          txt: txt, viewController: viewController),
                    if (viewController.pastOrders.isNotEmpty)
                      CustomerPastOrdersList(
                          txt: txt, viewController: viewController),
                  ],
                ),
              )
            : _noOrdersWidget(),
      ),
    );
  }

  Widget _noOrdersWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          alignment: Alignment.center,
          height: 40.h,
          width: double.infinity,
          child: Image.asset(
            "assets/images/customer/customerNoOrders.png",
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          "${_i18n()["orders"]["noOrders"]}",
          style: context.txt.displaySmall,
        ),
        SizedBox(
          height: 8,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            "${_i18n()["orders"]["noOrdersBody"]}",
            style: context.txt.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 50,
        ),
      ],
    );
  }
}
