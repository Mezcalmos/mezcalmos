import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';
import 'package:mezcalmos/CustomerApp/components/CustShowOnlyOpenService.dart';
import 'package:mezcalmos/CustomerApp/components/MezServicesMapView.dart';
import 'package:mezcalmos/CustomerApp/pages/CustHomeView/components/CustRestaurantCard.dart';
import 'package:mezcalmos/CustomerApp/pages/CustHomeView/components/CustRestaurantItemCard.dart';
import 'package:mezcalmos/CustomerApp/pages/CustHomeView/controllers/CustHomeViewController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/pages/AuthScreens/SMS/PhoneNumberScreen.dart';
import 'package:mezcalmos/Shared/widgets/Buttons/MezInkwell.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezIconButton.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';
import 'package:mezcalmos/Shared/widgets/UsefulWidgets.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['CustomerWrapper'];

class CustHomeView extends StatefulWidget {
  const CustHomeView({super.key});

  @override
  State<CustHomeView> createState() => _CustHomeViewState();
}

class _CustHomeViewState extends State<CustHomeView>
    with TickerProviderStateMixin {
  CustHomeViewController viewController = CustHomeViewController();

  @override
  void initState() {
    viewController.init(vsync: this, context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Get.find<SideMenuDrawerController>().getNewKey(),
      drawer: MezSideMenu(),
      backgroundColor: Colors.white,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 65),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Obx(
            () => MezInkwell(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              onClick: () async {
                viewController.switchView();
              },
              icon: viewController.isMapView ? Icons.list : Icons.map_rounded,
              label: viewController.isMapView
                  ? '${_i18n()['viewAsList']}'
                  : '${_i18n()['viewOnMap']}',
              borderRadius: 50,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Obx(() {
        if (viewController.isMapView)
          return _mapView();
        else
          return listScrollView();
      }),
    );
  }

  NestedScrollView listScrollView() {
    return NestedScrollView(
      controller: viewController.restaurantsScrollController,
      physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      headerSliverBuilder: (BuildContext context, _) {
        return [
          _appBar(context),
          _searchAndFilter(context),
        ];
      },
      body: tabsView(),
    );
  }

  TabBarView tabsView() {
    return TabBarView(
      controller: viewController.tabController,
      children: [
        Obx(
          () {
            if (viewController.showRestaurantShimmer) {
              return SingleChildScrollView(
                child: Column(
                  children: List.generate(
                      10, (int index) => CustRestaurantCard.shimmer()),
                ),
              );
            } else if (viewController.restaurants.isNotEmpty) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AnimatedList(
                      key: viewController.animatedListKey,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      initialItemCount: viewController.restaurants.length,
                      itemBuilder: (BuildContext context, int index,
                          Animation<double> animation) {
                        return SlideTransition(
                          position: Tween<Offset>(
                            begin: const Offset(1, 0),
                            end: Offset.zero,
                          ).animate(animation),
                          child: CustRestaurantCard(
                            restaurant: viewController.restaurants[index],
                          ),
                        );
                      },
                    ),
                    if (viewController.hasReachedEndData.isFalse) ...[
                      smallSepartor,
                      Container(
                        margin: const EdgeInsets.all(15),
                        child: MezButton(
                          width: double.infinity,
                          backgroundColor: secondaryLightBlueColor,
                          textColor: primaryBlueColor,
                          borderRadius: 20,
                          height: 45,
                          label: "Fetch more ...",
                          onClick: () async {
                            await viewController.fetchMore();
                          },
                        ),
                      )
                    ]
                  ],
                ),
              );
            } else {
              return Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.all(15),
                child: Text("${_i18n()['noRest']}"),
              );
            }
          },
        ),
        Scrollbar(
          child: SingleChildScrollView(
            child: Obx(
              () {
                if (viewController.showIemsShimmer) {
                  return Column(
                    children: List.generate(
                        10, (int index) => CustRestaurantItemCard.shimmer()),
                  );
                } else if (viewController.filteredItems.isNotEmpty)
                  return Column(
                    children: List.generate(
                        viewController.items.length,
                        (int index) => CustRestaurantItemCard(
                              item: viewController.items[index],
                            )),
                  );
                else
                  return Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(15),
                    child: Text("${_i18n()['noItems']}"),
                  );
              },
            ),
          ),
        ),
      ],
    );
  }

  SliverAppBar _appBar(BuildContext context) {
    return SliverAppBar(
        pinned: true,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: _menuBtn(),
        actions: [
          Obx(() {
            if (Get.find<AuthController>().user == null) {
              return MezIconButton(
                  onTap: () {
                    PhoneNumberScreen.navigateAtOrderTime();
                  },
                  icon: Icons.person);
            }
            return SizedBox();
          }),
          SizedBox(
            width: 8,
          ),
        ],
        // expandedHeight: 150,
        title: FittedBox(
          fit: BoxFit.fitWidth,
          child: MezcalmosSharedWidgets.fillTitle(
              actionLength: 2, showLogo: (context.width > 320) ? true : false),
        ));
  }

  SliverPersistentHeader _searchAndFilter(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: MezDelegate(
        max: kToolbarHeight * 2,
        min: kToolbarHeight * 2,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                hSmallSepartor,
                Expanded(
                  child: TextField(
                    onChanged: (String value) {
                      viewController.search(value);
                    },
                    decoration: InputDecoration(
                      hintText: "${_i18n()['search']}",
                      hintStyle: context.textTheme.bodyMedium?.copyWith(
                        color: Colors.grey.shade600,
                      ),
                      prefixIcon: Icon(Icons.search),
                      prefixIconColor: Colors.grey.shade600,
                      isDense: true,
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              BorderSide(color: primaryBlueColor, width: 1.5)),
                    ),
                  ),
                ),
                hSmallSepartor,
                Obx(
                  () => Badge(
                    label: Text("1"),
                    backgroundColor: primaryBlueColor,
                    isLabelVisible: viewController.showOnlyOpen.value,
                    child: MezIconButton(
                      onTap: () async {
                        showMezSheet(
                            title: "${_i18n()['filters']}",
                            content: Container(
                              margin: const EdgeInsets.all(8),
                              child: Column(
                                children: [
                                  Obx(
                                    () => SwitchListTile.adaptive(
                                        title:
                                            Text("${_i18n()['showOnlyOpen']}"),
                                        value:
                                            viewController.showOnlyOpen.value,
                                        onChanged: (bool v) {
                                          viewController.switchOnlyOpen(
                                              value: v);
                                        }),
                                  ),
                                  smallSepartor,
                                  MezButton(
                                    width: double.infinity,
                                    label: "${_i18n()['filter']}",
                                    onClick: () async {
                                      await viewController.filter();

                                      Navigator.pop(context);
                                    },
                                  )
                                ],
                              ),
                            ),
                            context: context);
                      },
                      padding: const EdgeInsets.all(8),
                      iconSize: 25,
                      icon: Icons.filter_list,
                      backgroundColor: Colors.white,
                    ),
                  ),
                ),
                hSmallSepartor,
              ],
            ),
            TabBar(
                controller: viewController.tabController,
                labelColor: primaryBlueColor,
                unselectedLabelColor: Colors.grey.shade400,
                indicatorSize: TabBarIndicatorSize.label,
                automaticIndicatorColorAdjustment: true,
                padding: EdgeInsets.zero,
                tabs: [
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.food_bank_rounded),
                        hTinySepartor,
                        Text("${_i18n()['restaurants']['title']}"),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.fastfood_rounded),
                        hTinySepartor,
                        Text("${_i18n()['items']}"),
                      ],
                    ),
                  ),
                ])
          ],
        ),
      ),
    );
  }

  Widget mezWelcomeContainer(TextStyle textStyle) {
    return Container(
      margin: const EdgeInsets.all(5),
      alignment: Alignment.centerLeft,
      child: Obx(
        () => Text(
          "${_i18n()['welcomeText']}",
          style: textStyle,
          textAlign: TextAlign.left,
        ),
      ),
    );
  }

  Widget mezDescription(TextStyle textStyle) {
    return Container(
      margin: EdgeInsets.all(5),
      child: Obx(
        () => Text("${_i18n()['appDescription']}", style: textStyle),
      ),
    );
  }

  Widget _menuBtn() {
    return Transform.scale(
      scale: 0.6,
      child: InkWell(
        onTap: () {
          Get.find<SideMenuDrawerController>().openMenu();
        },
        child: Ink(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 216, 225, 249),
                  spreadRadius: 0,
                  blurRadius: 7,
                  offset: Offset(0, 7),
                ),
              ],
              color: primaryBlueColor),
          child: Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _mapView() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      MezcalmosAppBar(AppBarLeftButtonType.Menu),
      Obx(() => CustSwitchOpenService(
            label: '${_i18n()["showOnlyOpen"]}',
            showOnlyOpen: viewController.showOnlyOpen.value,
            onChange: (bool value) {
              viewController.switchOnlyOpen(value: value);
            },
          )),
      Obx(
        () => Expanded(
          child: MezServicesMapView(
            mGoogleMapController: viewController.mapController,
            fetchNewData: (LatLng? mapCenter, double? distance) async {
              await viewController.fetchMapViewRentals(
                  fromLoc: mapCenter, distance: distance);
              return viewController.restaurantsMarkers.toList();
            },
            markers: viewController.restaurantsMarkers.value,
          ),
        ),
      ),
    ]);
  }
}
