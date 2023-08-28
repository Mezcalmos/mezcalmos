import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/NewWrapper/components/CustRestaurantCard.dart';
import 'package:mezcalmos/CustomerApp/pages/NewWrapper/components/CustRestaurantItemCard.dart';
import 'package:mezcalmos/CustomerApp/pages/NewWrapper/controllers/CustHomeViewController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/widgets/MezIconButton.dart';
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
    viewController.init(vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: Get.find<SideMenuDrawerController>().getNewKey(),
      // drawer: MezSideMenu(),
      backgroundColor: Colors.white,
      // appBar: MezcalmosAppBar(AppBarLeftButtonType.Menu),
      body: NestedScrollView(
        floatHeaderSlivers: true,
        dragStartBehavior: DragStartBehavior.down,
        headerSliverBuilder: (BuildContext context, _) {
          return [
            SliverAppBar(
                pinned: true,
                elevation: 0,
                automaticallyImplyLeading: false,
                // expandedHeight: 150,
                title: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: MezcalmosSharedWidgets.fillTitle(
                      actionLength: 2,
                      showLogo: (context.width > 320) ? true : false),
                )),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    mezWelcomeContainer(context.textTheme.bodyLarge!),
                    mezDescription(context.textTheme.bodyMedium!),
                  ],
                ),
              ),
            ),
            SliverPersistentHeader(
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
                              viewController.searchQuery.value = value;
                              viewController.filter();
                            },
                            decoration: InputDecoration(
                              hintText: 'Search...',
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
                                  borderSide: BorderSide(
                                      color: primaryBlueColor, width: 1.5)),
                            ),
                          ),
                        ),
                        hSmallSepartor,
                        MezIconButton(
                          onTap: () {},
                          padding: const EdgeInsets.all(8),
                          iconSize: 25,
                          icon: Icons.filter_list,
                          backgroundColor: Colors.white,
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
                        tabs: [
                          Tab(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.food_bank_rounded),
                                hTinySepartor,
                                Text("Restaurants"),
                              ],
                            ),
                          ),
                          Tab(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.fastfood_rounded),
                                hTinySepartor,
                                Text("Items"),
                              ],
                            ),
                          ),
                        ])
                  ],
                ),
              ),
            ),
          ];
        },

        body: TabBarView(
          controller: viewController.tabController,
          children: [
            Scrollbar(
              child: SingleChildScrollView(
                child: Obx(
                  () {
                    if (viewController.showRestaurantShimmer) {
                      return Column(
                        children: List.generate(
                            10, (int index) => CustRestaurantCard.shimmer()),
                      );
                    }
                    return Column(
                      children: List.generate(
                          viewController.restaurants.length,
                          (int index) => CustRestaurantCard(
                              restaurant: viewController.restaurants[index])),
                    );
                  },
                ),
              ),
            ),
            Scrollbar(
              child: SingleChildScrollView(
                child: Obx(
                  () {
                    if (viewController.showIemsShimmer) {
                      return Column(
                        children: List.generate(10,
                            (int index) => CustRestaurantItemCard.shimmer()),
                      );
                    }
                    return Column(
                      children: List.generate(
                          viewController.items.length,
                          (int index) => CustRestaurantItemCard(
                                item: viewController.items[index],
                              )),
                    );
                  },
                ),
              ),
            ),
          ],
        ),

        // SliverList(
        //   delegate: SliverChildBuilderDelegate(
        //     (BuildContext context, int index) {
        //       return ListTile(
        //         title: Text('List Item $index'),
        //       );
        //     },
        //     childCount: 50,
        //   ),
        // ),
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
}
