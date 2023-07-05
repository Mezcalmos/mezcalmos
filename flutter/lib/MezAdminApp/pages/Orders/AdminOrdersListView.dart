import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/CustOrderView/CustOrderView.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/OrderView/DvCompanyOrderView.dart';
import 'package:mezcalmos/MezAdminApp/pages/AdminTabsView/controllers/AdminTabsViewController.dart';
import 'package:mezcalmos/MezAdminApp/pages/Orders/controllers/AdmiOrdersListViewController.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/pages/Orders/LaundryOrderView/LaundryOrderView.dart';
import 'package:mezcalmos/Shared/pages/Orders/RestaurantOrderView/RestaurantOrderView.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/NoOrdersComponent.dart';
import 'package:mezcalmos/Shared/widgets/Order/MinimalOrderCard.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["MezAdmin"]["pages"]
    ["AdmiOrdersListView"];

class AdmiOrdersListView extends StatefulWidget {
  const AdmiOrdersListView({super.key, required this.adminTabsViewController});

  final AdminTabsViewController adminTabsViewController;

  @override
  State<AdmiOrdersListView> createState() => _AdmiOrdersListViewState();
}

class _AdmiOrdersListViewState extends State<AdmiOrdersListView> {
  AdmiOrdersListViewController viewController = AdmiOrdersListViewController();

  @override
  void initState() {
    viewController.init(
        adminTabsViewController: widget.adminTabsViewController);

    super.initState();
  }

  @override
  void dispose() {
    viewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          if (viewController.isFetching.isTrue)
            LinearProgressIndicator(
              color: primaryBlueColor,
            ),
          Expanded(
            child: ListView(
              controller: viewController.scrollController,
              physics: AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(15),
              children: [
                if (viewController.currentService ==
                    ServiceProviderType.Restaurant)
                  _buildRestuarntOrders(),
                if (viewController.currentService ==
                    ServiceProviderType.DeliveryCompany)
                  _buildDeliveryOrders(),
                if (viewController.currentService ==
                    ServiceProviderType.Laundry)
                  _buildLaundryOrders(),
                if (viewController.currentService ==
                    ServiceProviderType.Business)
                  _buildBusinessOrders(),
                _buildPastOrders(),
                if (viewController.enableShowMoreButton)
                  MezButton(
                    label: '${_i18n()["showMore"]}',
                    onClick: viewController.fetchServicePastOrders,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPastOrders() {
    return ListView.builder(
        itemCount: viewController.pastOrders.length,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) => Container(
              child: MinimalOrderCard(
                  order: viewController.pastOrders[index],
                  onTap: () {
                    // todo @m66are add routing
                    switch (viewController.currentService) {
                      case ServiceProviderType.Restaurant:
                        RestaurantOrderView.navigate(
                            orderId: viewController.pastOrders[index].id);
                        break;
                      case ServiceProviderType.Laundry:
                        LaundryOrderView.navigate(
                            orderId: viewController.pastOrders[index].id);
                        break;
                      case ServiceProviderType.DeliveryCompany:
                        DvCompanyOrderView.navigate(
                            orderId: viewController.pastOrders[index].id);
                        break;
                      case ServiceProviderType.Business:
                        CustOrderView.navigate(
                            orderId: viewController.pastOrders[index].id);
                        break;
                      default:
                    }
                  }),
            ));
  }

  Widget _buildRestuarntOrders() {
    return Container(
      child: (viewController.restaurantOrders.value?.isNotEmpty == true)
          ? Column(
              children: List.generate(
                  viewController.restaurantOrders.value!.length,
                  (int index) => MinimalOrderCard(
                      order: viewController.restaurantOrders.value![index],
                      onTap: () {
                        mezDbgPrint(
                            "ID ====>${viewController.restaurantOrders.value![index].id}");
                        RestaurantOrderView.navigate(
                            orderId: viewController
                                .restaurantOrders.value![index].id);
                      })),
            )
          : (viewController.restaurantPastOrders.value.isEmpty == true)
              ? Container(
                  margin: EdgeInsets.only(top: 10.h),
                  alignment: Alignment.center,
                  child: Center(child: NoOrdersComponent()))
              : SizedBox(),
    );
  }

  Widget _buildDeliveryOrders() {
    return Container(
      child: (viewController.deliveryOrders.value?.isNotEmpty == true)
          ? Column(
              children: List.generate(
                  viewController.deliveryOrders.value!.length,
                  (int index) => MinimalOrderCard(
                      order: viewController.deliveryOrders.value![index],
                      onTap: () {
                        DvCompanyOrderView.navigate(
                            orderId:
                                viewController.deliveryOrders.value![index].id);
                      })),
            )
          : (viewController.dvPastOrders.value.isEmpty == true)
              ? Container(
                  margin: EdgeInsets.only(top: 10.h),
                  alignment: Alignment.center,
                  child: Center(child: NoOrdersComponent()))
              : SizedBox(),
    );
  }

  Widget _buildLaundryOrders() {
    return Container(
      child: (viewController.laundryOrders.value?.isNotEmpty == true)
          ? Column(
              children: List.generate(
                  viewController.laundryOrders.value!.length,
                  (int index) => MinimalOrderCard(
                      order: viewController.laundryOrders.value![index],
                      onTap: () {
                        LaundryOrderView.navigate(
                            orderId:
                                viewController.laundryOrders.value![index].id);
                      })),
            )
          : (viewController.laundryPastOrders.value.isEmpty == true)
              ? Container(
                  margin: EdgeInsets.only(top: 10.h),
                  alignment: Alignment.center,
                  child: Center(child: NoOrdersComponent()))
              : Container(),
    );
  }

  Widget _buildBusinessOrders() {
    return Container(
      child: (viewController.businessOrders.value?.isNotEmpty == true)
          ? Column(
              children: List.generate(
                  viewController.businessOrders.value!.length,
                  (int index) => MinimalOrderCard(
                      order: viewController.businessOrders.value![index],
                      onTap: () {
                        CustOrderView.navigate(
                            entityType: EntityType.Admin,
                            orderId:
                                viewController.businessOrders.value![index].id);
                      })),
            )
          : (viewController.businessPastOrders.value.isEmpty == true)
              ? Container(
                  margin: EdgeInsets.only(top: 10.h),
                  alignment: Alignment.center,
                  child: Center(child: NoOrdersComponent()))
              : Container(),
    );
  }
}
