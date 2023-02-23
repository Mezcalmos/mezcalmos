import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/graphql/laundry/hsLaundry.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezServiceOpenHours.dart';
import 'package:mezcalmos/Shared/widgets/ServiceLocationCard.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["Laundry"]["SingleLaundryScreen"];

class SingleLaundryScreen extends StatefulWidget {
  const SingleLaundryScreen({Key? key}) : super(key: key);

  @override
  State<SingleLaundryScreen> createState() => _SingleLaundryScreenState();
}

class _SingleLaundryScreenState extends State<SingleLaundryScreen> {
  int? laundryId;
  Rxn<Laundry> laundry = Rxn();
  final LanguageType userLanguage =
      Get.find<LanguageController>().userLanguageKey;
  @override
  void initState() {
    laundryId = int.tryParse(Get.parameters["laundryId"] ?? "");
    if (laundryId != null) {
      Future(() async =>
          laundry.value = await get_laundry_store_by_id(id: laundryId!));
    } else {
      MezRouter.back();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (laundry.value != null) {
          return Scaffold(
            appBar: mezcalmosAppBar(
              AppBarLeftButtonType.Back,
              onClick: MezRouter.back,
              title: laundry.value?.info.name,
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _laundryImage(),
                  SizedBox(
                    height: 20,
                  ),
                  _laundryInfoHeader(),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "${_i18n()["description"]}",
                    style: Get.textTheme.bodyLarge,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "${laundry.value!.info.description!.values.first}",
                    style: Get.textTheme.subtitle2,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "${_i18n()["categories"]}",
                    style: Get.textTheme.bodyLarge,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Column(
                    children: List.generate(
                        laundry.value!.laundryCosts.lineItems.length,
                        (int index) => _laundryCostCard(
                            item:
                                laundry.value!.laundryCosts.lineItems[index])),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  MezServiceOpenHours(schedule: laundry.value!.schedule!),
                  // SizedBox(
                  //   height: 15,
                  // ),
                  ServiceLocationCard(location: laundry.value!.info.location),
                ],
              ),
            ),
            bottomNavigationBar: _sendMyLaundryButton(),
          );
        } else
          return Container();
      },
    );
  }

  Widget _laundryCostCard({required LaundryCostLineItem item}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 1,
            child: Text(
              item.name[userLanguage]?.toString().inCaps ?? "",
              style: Get.textTheme.subtitle2,
              maxLines: 1,
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Text(
            "${item.cost.toPriceString()}/kg",
            style: Get.textTheme.bodyLarge?.copyWith(color: primaryBlueColor),
          )
        ],
      ),
    );
  }

  Widget _sendMyLaundryButton() {
    return Container(
      height: 60,
      decoration: BoxDecoration(color: primaryBlueColor),
      child: TextButton(
        style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(),
            backgroundColor: Colors.transparent),
        child: Text("${_i18n()["sendMyLaundry"]}"),
        onPressed: () {
          MezRouter.toNamed(kLaundryOrderRequest, arguments: laundry.value);
        },
      ),
    );
  }

  Widget _laundryImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: CachedNetworkImage(
        width: double.infinity,
        height: 20.h,
        fit: BoxFit.cover,
        imageUrl: laundry.value!.info.image,
      ),
    );
  }

  Widget _laundryInfoHeader() {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            fit: FlexFit.tight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  laundry.value!.info.name,
                  style: Get.textTheme.headline5,
                ),
                SizedBox(
                  height: 9,
                ),
                Wrap(
                  spacing: 5,
                  runSpacing: 5,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                        left: 6,
                        top: 2,
                        bottom: 6,
                        right: 6,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35),
                          color: secondaryLightBlueColor),
                      child: Text(
                        "${_i18n()["minimumCost"]} ${laundry.value!.laundryCosts.minimumCost.toPriceString()} ",
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        style: Get.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: primaryBlueColor),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                        left: 8,
                        top: 2,
                        bottom: 6,
                        right: 6,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35),
                          color: secondaryLightBlueColor),
                      child: Text(
                        "${laundry.value!.averageNumberOfDays} ${_i18n()["daysReturn"]}",
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        style: Get.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: primaryBlueColor),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Flexible(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "${_i18n()["startingFrom"]}",
                    style: Get.textTheme.subtitle2,
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      "${laundry.value!.getCheapestCategory.toPriceString()}/kg",
                      style: Get.textTheme.bodyLarge
                          ?.copyWith(color: Get.theme.primaryColorLight),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
