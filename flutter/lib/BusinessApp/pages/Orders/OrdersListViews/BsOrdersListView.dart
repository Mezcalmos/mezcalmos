import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:mezcalmos/BusinessApp/pages/Orders/HomeRentalOrderView/BsHomeRentalOrderView.dart';
import 'package:mezcalmos/BusinessApp/pages/Orders/OrdersListViews/components/BsOfferingOrderCard.dart';
import 'package:mezcalmos/BusinessApp/pages/Orders/OrdersListViews/components/BsOrderCard.dart';
import 'package:mezcalmos/BusinessApp/pages/Orders/OrdersListViews/controllers/BsOrdersListViewController.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/helpers/BusinessHelpers/BusinessOrderHelper.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';

class BsOrdersListView extends StatefulWidget {
  const BsOrdersListView({super.key});

  @override
  State<BsOrdersListView> createState() => _BsOrdersListViewState();
}

class _BsOrdersListViewState extends State<BsOrdersListView>
    with TickerProviderStateMixin {
  BsOrdersListViewController viewController = BsOrdersListViewController();
  @override
  void initState() {
    viewController.init(vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MezSideMenu(),
      key: Get.find<SideMenuDrawerController>().getNewKey(),
      appBar: MezcalmosAppBar(AppBarLeftButtonType.Menu,
          title: 'Orders',
          tabBar: TabBar(
            controller: viewController.tabController,
            tabs: [
              Tab(
                text: 'Pending',
              ),
              Tab(
                text: 'Upcoming',
              ),
              Tab(
                text: 'Past',
              ),
            ],
          )),
      body: TabBarView(
        controller: viewController.tabController,
        children: [
          _pendingTab(context),
          _upcomingTab(context),
          _pastTab(context),
        ],
      ),
    );
  }

  SingleChildScrollView _pendingTab(BuildContext context) {
    return SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // pending orders
              Text(
                "Pending orders (${viewController.pendingOrders.length})",
                style: context.textTheme.bodyLarge,
              ),
              meduimSeperator,
              Column(
                children: List.generate(
                  viewController.pendingOrders.length,
                  (int index) => BsOrderCard(
                    imageUrl: viewController.pendingOrders[index].customerImage,
                    customerName:
                        viewController.pendingOrders[index].customerName,
                    onTap: () {
                      BsHomeRentalOrderView.navigate(
                          orderId:
                              viewController.pendingOrders[index].id.toInt());
                    },
                    time: viewController.pendingOrders[index].time,
                    numItems: viewController.pendingOrders[index].numberOfItems,
                    price: viewController.pendingOrders[index].cost,
                  ),
                ),
              ),
              // upcoming orders
            ],
          ),
        ));
  }

  SingleChildScrollView _upcomingTab(BuildContext context) {
    return SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // pending orders
            Text(
              "Upcoming orders",
              style: context.textTheme.bodyLarge,
            ),
            meduimSeperator,
            GroupedListView<BusinessOrderItem, DateTime>(
              shrinkWrap: true,
              elements: viewController.upcomingItems,
              groupBy: (BusinessOrderItem element) => DateTime(
                  element.dateTime.year,
                  element.dateTime.month,
                  element.dateTime.day),
              groupComparator: (DateTime value1, DateTime value2) =>
                  value2.compareTo(value1),
              itemComparator:
                  (BusinessOrderItem element1, BusinessOrderItem element2) =>
                      element2.dateTime.compareTo(element1.dateTime),
              physics: NeverScrollableScrollPhysics(),
              groupHeaderBuilder: (BusinessOrderItem element) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    element.dateTime
                        .toLocal()
                        .toDayName(withDateNumber: true)
                        .inCaps,
                    style: context.textTheme.bodyLarge,
                  ),
                );
              },
              separator: SizedBox(
                height: 5,
              ),
              itemBuilder: (BuildContext context, BusinessOrderItem item) {
                return BsOfferingOrderCard(item: item);
              },
            ),

            // upcoming orders
          ],
        ));
  }

  SingleChildScrollView _pastTab(BuildContext context) {
    return SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // pending orders
              Text(
                "Past orders",
                style: context.textTheme.bodyLarge,
              ),
              meduimSeperator,

              Column(
                children: List.generate(
                    viewController.pastItems.length,
                    (int index) => BsOfferingOrderCard(
                          item: viewController.pastItems[index],
                        )),
              ),
              // upcoming orders
            ],
          ),
        ));
  }
}
