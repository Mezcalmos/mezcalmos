import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/CategoryView/CategoryView.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/ItemView/ROpItemView.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/MenuItemsView/components/ROpCategoryItems.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/MenuItemsView/components/ROpItemCard.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/MenuItemsView/components/ROpSpecialsComponent.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/MenuItemsView/controllers/ROpMenuViewController.dart';
import 'package:mezcalmos/RestaurantApp/router/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezEssentials/MezAddButton.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';

//
dynamic _i18n() => Get.find<LanguageController>().strings["RestaurantApp"]
    ["pages"]["ROpMenuView"];
//

class ROpMenuView extends StatefulWidget {
  const ROpMenuView({Key? key, this.restID, this.canGoBack = true})
      : super(key: key);

  static Future<void> navigate({required int restaurantId}) {
    return MezRouter.toPath(constructPath(restaurantId: restaurantId));
  }

  static String constructPath({required int restaurantId}) {
    return RestaurantAppRoutes.menuViewRoute
        .replaceAll(":restaurantId", restaurantId.toString());
  }

  final int? restID;
  final bool canGoBack;

  @override
  _ROpMenuViewState createState() => _ROpMenuViewState();
}

class _ROpMenuViewState extends State<ROpMenuView>
    with TickerProviderStateMixin {
  late TabController _tabController;
  ROpMenuViewController viewController = ROpMenuViewController();
  int? restaurantID;

  @override
  void initState() {
    restaurantID = widget.restID ??
        int.parse(MezRouter.urlArguments['restaurantId'].toString());

    if (restaurantID != null) {
      _tabController = TabController(length: 2, vsync: this);
      Future.microtask(() async {
        await viewController.init(restId: restaurantID!);
      });
    }

    super.initState();
  }

  @override
  void dispose() {
    viewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return widget.canGoBack;
      },
      child: Obx(
        () => Scaffold(
          appBar: MezcalmosAppBar(
            tabbarHeight: (!viewController.reOrderMode.isFalse)
                ? kToolbarHeight * 2
                : kToolbarHeight,
            !widget.canGoBack && viewController.reOrderMode.isFalse
                ? AppBarLeftButtonType.Menu
                : AppBarLeftButtonType.Back,
            onClick: !widget.canGoBack && viewController.reOrderMode.isFalse
                ? null
                : handleBack,
            // showLeftBtn: viewController.reOrderMode.isTrue ||
            //     widget.canGoBack == false,
            title: '${_i18n()["menu"]}',
            showNotifications: true,
            tabBar: (viewController.reOrderMode.isFalse) ? _tabBar() : null,
          ),
          key: Get.find<SideMenuDrawerController>().getNewKey(),
          drawer: MezSideMenu(),
          body: Container(
              child: (viewController.pageLoaded.value)
                  ? _buildMenu()
                  : Container(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(),
                    )),
        ),
      ),
    );
  }

  TabBarView _buildMenu() {
    return TabBarView(
      physics: NeverScrollableScrollPhysics(),
      controller: _tabController,
      children: [
        // Items view //
        SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5,
              ),
              if (viewController.reOrderMode.isTrue)
                MezAddButton(
                  onClick: () async {
                    mezDbgPrint("Tapped");

                    final bool res = await viewController.saveReorder();
                    if (res) {
                      viewController.cancelReoderMode();
                    }
                  },
                  title: '${_i18n()["saveOrder"]}',
                  btnColor: primaryBlueColor,
                  icon: Icons.check,
                  primaryColor: Colors.white,
                ),
              if (viewController.reOrderMode.isFalse)
                MezAddButton(
                  onClick: () async {
                    mezDbgPrint("Tapped");

                    final bool? newCategoryAdded =
                        await ROpCategoryView.navigate(
                            restaurantId: restaurantID!,
                            detailsId: viewController.detailsId!,
                            saveToDb: true) as bool?;
                    if (newCategoryAdded == true) {
                      await viewController.fetchCategories();
                    }
                  },
                  title: '${_i18n()["addCategory"]}',
                  btnColor: primaryBlueColor,
                  primaryColor: Colors.white,
                ),
              if (viewController.reOrderMode.isFalse)
                MezAddButton(
                  onClick: () async {
                    final bool? newItemAdded = await ROpItemView.navigate(
                        restaurantId: restaurantID!,
                        detailsId: viewController.detailsId!,
                        itemId: null,
                        arguments: <String, dynamic>{"specials": false});
                    if (newItemAdded == true) {
                      await viewController.fetchCategories();
                    }
                  },
                  title: '${_i18n()["addItem"]}',
                ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${_i18n()["categories"]}',
                    style: context.txt.bodyLarge,
                  ),
                  (viewController.reOrderMode.isTrue)
                      ? SizedBox()
                      : _reorderBtn()
                ],
              ),
              Divider(
                thickness: 0.3,
              ),
              _categoriesItemsList(),
              _noCategoryItemsList()
            ],
          ),
        ),
        // specials view //
        ROpSpecialsComponent(
          restaurantID: restaurantID!,
          viewController: viewController,
        ),
      ],
    );
  }

  PreferredSizeWidget _tabBar() {
    return PreferredSize(
      preferredSize: Size(double.infinity, kToolbarHeight),
      child: Obx(
        () => Column(
          children: [
            TabBar(
                controller: _tabController,
                indicatorColor: (viewController.fetching.isTrue)
                    ? Colors.transparent
                    : null,
                labelColor: primaryBlueColor,
                unselectedLabelColor: Colors.grey.shade800,
                labelStyle: context.txt.bodyLarge,
                unselectedLabelStyle: context.txt.bodyMedium,
                tabs: [
                  Tab(
                    text: '${_i18n()["myItems"]}',
                  ),
                  Tab(
                    text: '${_i18n()["specials"]}',
                  ),
                ]),
            if (viewController.fetching.isTrue) LinearProgressIndicator()
          ],
        ),
      ),
    );
  }

  InkWell _reorderBtn() {
    return InkWell(
      onTap: () {
        viewController.startReoderMode();
      },
      child: Ink(
        padding: const EdgeInsets.all(5),
        child: Row(
          children: [
            Ink(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: secondaryLightBlueColor),
              child: Icon(
                Icons.low_priority_rounded,
                color: primaryBlueColor,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              '${_i18n()["reorder"]}',
              style: context.txt.bodyLarge?.copyWith(color: primaryBlueColor),
            ),
          ],
        ),
      ),
    );
  }

  Widget _categoriesItemsList() {
    return Obx(
      () => Container(
        alignment: Alignment.centerLeft,
        child: (viewController.reOrderMode.isTrue)
            ? ReorderableListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: <Widget>[
                  for (int index = 0;
                      index < viewController.rOcategories.length;
                      index += 1)
                    ROpCategoryItems(
                        key: Key('$index'),
                        category: viewController.rOcategories[index],
                        detailsId: viewController.detailsId!,
                        restaurantId: restaurantID!,
                        viewController: viewController)
                ],
                onReorder: (int oldIndex, int newIndex) {
                  // to avoid last element missbehavior
                  if (oldIndex < newIndex) {
                    newIndex -= 1;
                  }
                  viewController.rorderSingleCategory(
                      oldIndex: oldIndex, newIndex: newIndex);
                })
            : Column(
                children: List.generate(
                    viewController.mainCategories.length,
                    (int index) => ROpCategoryItems(
                        viewController: viewController,
                        detailsId: viewController.detailsId!,
                        restaurantId: restaurantID!,
                        category: viewController.mainCategories[index])),
              ),
      ),
    );
  }

  Widget _noCategoryItemsList() {
    if (viewController.noCategory.value.items.isNotEmpty) {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 12,
            ),
            Text(
              '${_i18n()["noCategory"]}',
              style: context.txt.bodyLarge,
            ),
            SizedBox(
              height: 5,
            ),
            Divider(
              thickness: 0.3,
            ),
            SizedBox(
              height: 5,
            ),
            Obx(
              () => Column(
                children: List.generate(
                    viewController.noCategory.value.items.length,
                    (int index) => ROpItemCard(
                        viewController: viewController,
                        item: viewController.noCategory.value.items[index])),
              ),
            ),
          ],
        ),
      );
    } else {
      return Container();
    }
  }

  void handleBack() {
    mezDbgPrint(viewController.reOrderMode.value);
    if (viewController.reOrderMode.isTrue) {
      showConfirmationDialog(context,
          title: '${_i18n()["cancelTitle"]}',
          primaryButtonText: '${_i18n()["prCancelBtn"]}',
          helperText: '${_i18n()["cancelHelperText"]}', onYesClick: () async {
        viewController.cancelReoderMode();
        await MezRouter.back();
      });
    } else {
      if (widget.canGoBack) {
        MezRouter.back();
      }
    }
  }
}
