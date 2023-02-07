import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/LaundryApp/components/LaundyOpDrawer.dart';
import 'package:mezcalmos/LaundryApp/pages/OrdersListViews/controllers/LaundryOpCurrentOrdersController.dart';
import 'package:mezcalmos/RestaurantApp/constants/assets.dart';
import 'package:mezcalmos/RestaurantApp/pages/OrdersListViews/components/ROpWaitingForApproval.dart';
import 'package:mezcalmos/RestaurantApp/router.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/IncomingOrders/IncomingOrdersOnOff.dart';
import 'package:mezcalmos/Shared/widgets/IncomingOrders/IncomingOrdersStatus.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:mezcalmos/Shared/widgets/NoOrdersComponent.dart';
import 'package:mezcalmos/Shared/widgets/Order/ROpOrderCard.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['RestaurantApp']
    ['pages']['ROpPastOrdersList'];

class LaundryOpCurrentOrdersListView extends StatefulWidget {
  const LaundryOpCurrentOrdersListView({Key? key, this.canGoBack = true})
      : super(key: key);
  final bool canGoBack;

  @override
  State<LaundryOpCurrentOrdersListView> createState() =>
      _LaundryOpCurrentOrdersListViewState();
}

class _LaundryOpCurrentOrdersListViewState
    extends State<LaundryOpCurrentOrdersListView> {
  LaundryOpCurrentOrdersController viewController =
      LaundryOpCurrentOrdersController();

  @override
  void initState() {
    viewController.init();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return widget.canGoBack;
      },
      child: Scaffold(
        appBar: mezcalmosAppBar(
          AppBarLeftButtonType.Menu,
          showNotifications: true,
        ),
        key: Get.find<SideMenuDrawerController>().getNewKey(),
        drawer: LaundryAppDrawer(),
        body: Obx(() {
          if (viewController.initalized.isFalse) {
            return MezLogoAnimation(
              centered: true,
            );
          } else if (viewController.isAproved == false) {
            return ROpWaitingForApproval();
          } else {
            return Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 8, right: 8, left: 8),
                  child: TitleWithOnOffSwitcher(
                    title: "${_i18n()['incomingOrders']}",
                    onTurnedOn: () {
                      viewController.turnOnOrders();
                    },
                    onTurnedOff: () {
                      viewController.turnOffOrders();
                    },
                    initialSwitcherValue: viewController.isOpen,
                  ),
                ),
                Container(
                    child: (viewController.isOpen)
                        ? _inProcessOrders()
                        : _offlineWidget()),
              ],
            );
          }
        }),
      ),
    );
  }

  Container _offlineWidget() {
    return Container(
      height: 60.h,
      child: IncomingOrdersStatus(
        childData: Padding(
          padding: const EdgeInsets.only(bottom: 17.0),
          child: Image.asset(
            turnOn_asset,
            fit: BoxFit.contain,
            width: 40.w,
            height: 25.h,
          ),
        ),
        errorText: '${_i18n()["offlineTitle"]}',
        secondLine: "${_i18n()["offlineBody"]}",
      ),
    );
  }

  Widget _inProcessOrders() {
    return Expanded(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                    fit: FlexFit.tight,
                    child: Text('${_i18n()["currentOrders"]}'.inCaps,
                        style: Get.textTheme.bodyLarge)),
                Flexible(
                  child: MezButton(
                    backgroundColor: secondaryLightBlueColor,
                    textColor: primaryBlueColor,
                    height: 32,
                    //  width: 35.w,
                    borderRadius: 35,
                    label: '${_i18n()["pastButton"]}'.inCaps,
                    onClick: () async {
                      await MezRouter.toNamed(kPastOrdersListView);
                    },
                  ),
                ),
              ],
            ),
          ),
          viewController.currentOrders.isNotEmpty
              ? Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: List.generate(
                          viewController.currentOrders.length, (int index) {
                        return MinimalOrderCard(
                          order: viewController.currentOrders[index],
                          onTap: () {
                            MezRouter.toNamed(getROpOrderRoute(viewController
                                .currentOrders[index].id
                                .toString()));
                          },
                        );
                      }),
                    ),
                  ),
                )
              : Container(
                  margin: EdgeInsets.only(top: 10.h),
                  alignment: Alignment.center,
                  child: Center(child: NoOrdersComponent())),
        ],
      ),
    );
  }
}