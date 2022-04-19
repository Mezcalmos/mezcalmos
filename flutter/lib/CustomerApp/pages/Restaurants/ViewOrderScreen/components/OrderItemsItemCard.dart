import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/Components/itemChosenChoices.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:sizer/sizer.dart';

class OrderItemsItemCard extends StatelessWidget {
  const OrderItemsItemCard({
    Key? key,
    required this.item,
  }) : super(key: key);

  final RestaurantOrderItem item;

  @override
  Widget build(BuildContext context) {
    final TextTheme txt = Theme.of(context).textTheme;
    final LanguageType userLanguage =
        Get.find<LanguageController>().userLanguageKey;
    return Card(
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: CachedNetworkImageProvider(item.image),
                ),
                SizedBox(
                  width: 10,
                ),
                if (item.name[userLanguage] != null)
                  Flexible(
                    flex: 2,
                    fit: FlexFit.tight,
                    child: Text(
                      item.name[userLanguage]!,
                      style: txt.bodyText1,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                Spacer(),
                Container(
                  alignment: Alignment.centerRight,
                  decoration: BoxDecoration(
                      color:
                          Theme.of(context).primaryColorLight.withOpacity(0.2),
                      shape: BoxShape.circle),
                  padding: EdgeInsets.all(12),
                  child: Text(
                    item.quantity.toStringAsFixed(0),
                    style: txt.headline2!
                        .copyWith(color: Theme.of(context).primaryColorLight),
                  ),
                ),
              ],
            ),
            Divider(),
            Column(
              children: buildChoices(item.chosenChoices),
            ),
            Container(
              margin: EdgeInsets.all(5),
              alignment: Alignment.bottomRight,
              child: Text('\$' + item.totalCost.toInt().toString(),
                  style: txt.bodyText1!.copyWith(fontSize: 17.sp)),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> buildChoices(Map<String, List<Choice>> choices) {
    final List<Widget> viewWidgets = [];
    choices.forEach((String key, List<Choice> value) {
      viewWidgets.add(ItemChosenChoiceComponent(
        choices: value,
        optionName: key,
      ));
    });
    return viewWidgets;
  }
}
