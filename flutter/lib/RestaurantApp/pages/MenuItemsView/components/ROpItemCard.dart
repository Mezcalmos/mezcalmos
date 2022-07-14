import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/controllers/restaurantInfoController.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuItemsView/components/ROpReorderIcon.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuItemsView/controllers/ROpMenuViewController.dart';
import 'package:mezcalmos/RestaurantApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';

class ROpItemCard extends StatefulWidget {
  const ROpItemCard(
      {Key? key,
      required this.item,
      this.category,
      required this.viewController})
      : super(key: key);
  final Item item;
  final Category? category;
  final ROpMenuViewController viewController;

  @override
  State<ROpItemCard> createState() => _ROpItemCardState();
}

class _ROpItemCardState extends State<ROpItemCard> {
  final LanguageType userLanguage =
      Get.find<LanguageController>().userLanguageKey;
  @override
  void initState() {
    super.initState();
  }

  RestaurantInfoController _restaurantInfoController =
      Get.find<RestaurantInfoController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Card(
        margin: const EdgeInsets.only(bottom: 8),
        child: InkWell(
          onTap: (widget.viewController.reOrderMode.isTrue)
              ? null
              : () {
                  Get.toNamed(getEditItemRoute(
                      itemId: widget.item.id!,
                      categoryId: widget.category?.id ?? null));
                },
          child: Container(
            padding: const EdgeInsets.all(5),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: (widget.item.image != null)
                          ? CachedNetworkImageProvider(widget.item.image!)
                          : AssetImage(aNoImage) as ImageProvider,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      widget.item.name[userLanguage] ?? "",
                      style: Get.textTheme.bodyText1,
                    ),
                    Spacer(),
                    (widget.viewController.reOrderMode.isTrue)
                        ? ROpRerorderIcon()
                        : Text(
                            widget.item.cost.toPriceString(),
                            style: Get.textTheme.bodyText1,
                          ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  height: 4,
                ),
                Row(
                  children: [
                    Text("Category: "),
                    Flexible(
                      flex: 6,
                      fit: FlexFit.tight,
                      child: Text(
                        widget.category?.name![userLanguage] ?? "None",
                        style: Get.textTheme.bodyText1,
                      ),
                    ),
                    Spacer(),
                    Text("Item status"),
                    Switch(
                      value: widget.item.available,
                      onChanged: (widget.viewController.reOrderMode.isTrue)
                          ? null
                          : (bool v) {
                              _restaurantInfoController.switchItemAvailable(
                                  itemId: widget.item.id!,
                                  value: v,
                                  caytegoryId: (widget.category != null)
                                      ? widget.category!.id
                                      : null);
                            },
                      activeColor: primaryBlueColor,
                      activeTrackColor: secondaryLightBlueColor,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
