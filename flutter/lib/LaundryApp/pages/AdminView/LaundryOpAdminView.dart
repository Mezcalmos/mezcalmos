import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/LaundryApp/pages/AdminView/components/CategoryGridCard.dart';
import 'package:mezcalmos/LaundryApp/pages/AdminView/components/LaundryOpNormalDeliveryTime.dart';
import 'package:mezcalmos/LaundryApp/pages/AdminView/controllers/LaundryOpAdminViewController.dart';
import 'package:mezcalmos/LaundryApp/pages/LaundryCategoryView/LaundrOpCategoryView.dart';
import 'package:mezcalmos/LaundryApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["LaundryApp"]["pages"]
    ["AdminView"]["LaundryOpAdminView"];

class LaundryOpAdminView extends StatefulWidget {
  const LaundryOpAdminView({Key? key, this.laundryId}) : super(key: key);
  final int? laundryId;

  static Future<void> navigate({required int laundryId}) {
    return MezRouter.toPath(LaundryAppRoutes.kAdminViewRoute
        .replaceAll(":laundryId", laundryId.toString()));
  }

  @override
  State<LaundryOpAdminView> createState() => _LaundryOpAdminViewState();
}

class _LaundryOpAdminViewState extends State<LaundryOpAdminView> {
  LaundryOpAdminViewController viewController = LaundryOpAdminViewController();
  int? laundryId;

  @override
  void initState() {
    laundryId = widget.laundryId ??
        int.tryParse(MezRouter.urlArguments["laundryId"].toString());
    if (laundryId != null) {
      viewController.init(laundryId: laundryId!);
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  bool get asTab => widget.laundryId != null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MezcalmosAppBar(
        (asTab) ? AppBarLeftButtonType.Menu : AppBarLeftButtonType.Back,
        onClick: (asTab) ? null : MezRouter.back,
      ),
      key: Get.find<SideMenuDrawerController>().getNewKey(),
      drawer: MezSideMenu(),
      body: Obx(
        () {
          if (viewController.laundry != null) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: CircleAvatar(
                            radius: 50,
                            backgroundImage: CachedNetworkImageProvider(
                                viewController.laundry!.info.image)),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          viewController.laundry!.info.name,
                          style: context.txt.displaySmall
                              ?.copyWith(fontWeight: FontWeight.w700),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        child: Text(
                          "${_i18n()["categories"]}",
                          style: context.txt.bodyLarge,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      if (viewController.categories != null)
                        _categoriesGridList(),
                      SizedBox(
                        height: 30,
                      ),
                      LaundryOpNormalDeliveryTime(
                        data: viewController.days,
                        enabled: viewController.daysClicked.isFalse,
                        onTapMinus: () async {
                          await viewController.decrementDays();
                        },
                        onTapPlus: () async {
                          await viewController.incrementDays();
                        },
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      // LaundryOpMinimumCost(
                      //   viewController: viewController,
                      // )
                    ],
                  )
                ],
              ),
            );
          } else {
            return MezLogoAnimation(
              centered: true,
            );
          }
        },
      ),
    );
  }

  Widget _categoriesGridList() {
    return GridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 5,
      crossAxisSpacing: 5,
      childAspectRatio: MediaQuery.of(context).size.width /
          (MediaQuery.of(context).size.height / 1.45),
      padding: EdgeInsets.zero,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children:
          List<Widget>.generate(viewController.categories!.length, (int index) {
                return CategoryGridCard(
                  item: viewController.categories![index],
                  laundry: viewController.laundry!,
                  viewController: viewController,
                );
              }) +
              [
                Card(
                  color: Colors.grey.shade200,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () async {
                      bool? shouldRefetch = await LaundrOpCategoryView.navigate(
                          laundryId: laundryId!, categoryId: null);
                      if (shouldRefetch == true) {
                        await viewController.fetchCategories();
                      }
                    },
                    child: Container(
                      child: Icon(
                        Icons.add_circle_outline,
                        size: 25,
                        color: primaryBlueColor,
                      ),
                    ),
                  ),
                )
              ],
    );
  }

  Widget _categoryCard(LaundryCostLineItem item) {
    return Card(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              item.name.getTranslation(userLanguage)!,
              style: context.txt.displaySmall?.copyWith(fontSize: 12.sp),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
            Text("\$${item.cost}/Kg"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  customBorder: CircleBorder(),
                  onTap: () async {
                    // bool? refetch = await LaundrOpCategoryView.navigate(
                    //     laundryId: widget.laundry.info.hasuraId,
                    //     categoryId: widget.item.id);

                    // mezDbgPrint("RESULT ======>$refetch");
                    // if (refetch == true) {
                    //   await widget.viewController.fetchCategories();
                    // }
                  },
                  child: Ink(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade100, shape: BoxShape.circle),
                    child: Center(
                      child: Icon(
                        Icons.edit_outlined,
                        size: 22,
                        color: Color(0xFF5B5A5A),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  customBorder: CircleBorder(),
                  onTap: () {
                    // showConfirmationDialog(context,
                    //     title: "${_i18n()["deleteTitle"]}",
                    //     helperText: "${_i18n()["deleteHelperText"]}",
                    //     primaryButtonText: "${_i18n()["yesDelete"]}",
                    //     onYesClick: () async {
                    //   await deleteCategory(item: widget.item)
                    //       .then((value) => MezRouter.back());
                    // });
                  },
                  child: Ink(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.red.shade100, shape: BoxShape.circle),
                    child: Center(
                      child: Icon(
                        Icons.delete_outline,
                        size: 22,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
