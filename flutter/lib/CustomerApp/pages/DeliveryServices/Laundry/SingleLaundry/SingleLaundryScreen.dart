import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessNoOrderBanner.dart';
import 'package:mezcalmos/CustomerApp/pages/DeliveryServices/Laundry/LaundryRequestView/LaundryOrderRequestView.dart';
import 'package:mezcalmos/CustomerApp/pages/DeliveryServices/components/CustDeliveryMessageCard.dart';
import 'package:mezcalmos/CustomerApp/router/laundaryRoutes.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/graphql/laundry/hsLaundry.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezServiceOpenHours.dart';
import 'package:mezcalmos/Shared/widgets/ServiceLocationCard.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["Laundry"]["SingleLaundryScreen"];

class SingleLaundryScreen extends StatefulWidget {
  const SingleLaundryScreen({Key? key}) : super(key: key);

  static Future<void> navigate({required int laundryId}) {
    return MezRouter.toPath(LaundryRoutes.singleLaundryRoute
        .replaceAll(":laundryId", laundryId.toString()));
  }

  @override
  State<SingleLaundryScreen> createState() => _SingleLaundryScreenState();
}

class _SingleLaundryScreenState extends State<SingleLaundryScreen> {
  int? laundryId;
  Rxn<Laundry> laundry = Rxn();
  final Language userLanguage = Get.find<LanguageController>().userLanguageKey;

  @override
  void initState() {
    laundryId = int.tryParse(MezRouter.urlArguments["laundryId"].toString());
    if (laundryId != null) {
      get_laundry_store_by_id(id: laundryId!)
          .then((Laundry? value) => laundry.value = value);
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
            appBar: MezcalmosAppBar(
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
                  Text(
                    laundry.value!.info.name,
                    style: context.txt.headlineSmall,
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  _laundryInfoHeader(),
                  if (laundry.value?.info.description != null &&
                      laundry.value!.info.description!.isNotEmpty)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "${_i18n()["description"]}",
                          style: context.txt.bodyLarge,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          "${laundry.value!.info.description!.getTranslation(userLanguage)}",
                          style: context.txt.titleSmall,
                        ),
                      ],
                    ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "${_i18n()["categories"]}",
                    style: context.txt.bodyLarge,
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
                  MezServiceOpenHours(
                    schedule: laundry.value!.schedule!,
                    textStyle: context.txt.titleSmall,
                  ),
                  // SizedBox(
                  //   height: 15,
                  // ),
                  ServiceLocationCard(
                      textStyle: context.txt.titleSmall,
                      location: laundry.value!.info.location),

                  if (!laundry.value!.onlineOrdering)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustDeliveryMessageCard(
                          serviceProviderType: ServiceProviderType.Laundry,
                          info: laundry.value!.info,
                          lastActive: laundry.value!.lastActive,
                          rating:
                              laundry.value!.averageRating?.toDouble() ?? 0.0,
                          reviewCount: laundry.value!.reviewCount ?? 0,
                          serviceId: laundryId!,
                        ),
                        CustBusinessNoOrderBanner(),
                      ],
                    ),
                ],
              ),
            ),
            bottomNavigationBar:
                laundry.value!.onlineOrdering ? _sendMyLaundryButton() : null,
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
              item.name.getTranslation(userLanguage).toString().inCaps,
              style: context.txt.titleSmall,
              maxLines: 1,
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Text(
            "${item.cost.toPriceString()}/kg",
            style: context.txt.titleSmall?.copyWith(
                color: primaryBlueColor, fontWeight: FontWeight.w600),
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
        child: Text(
          '${_i18n()['sendMyLaundry']}',
          textAlign: TextAlign.center,
          style: context.txt.bodyLarge?.copyWith(color: Colors.white),
        ),
        onPressed: () {
          CustLaundryOrderRequestView.navigate(laundryId: laundryId!);
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
    return Wrap(
      spacing: 4.0,
      runSpacing: 2.0,
      children: [
        Text(
            "${_i18n()["minimumCost"].toString().inCaps} ${laundry.value!.laundryCosts.minimumCost.toPriceString()} ",
            //maxLines: 1,
            textAlign: TextAlign.start,
            style: context.txt.titleSmall?.copyWith(
                color: primaryBlueColor, fontWeight: FontWeight.w600)),
        Container(
            margin: EdgeInsets.only(top: 8),
            child: Icon(
              Icons.circle,
              size: 6,
              color: primaryBlueColor,
            )),
        Text(
            "${laundry.value!.averageNumberOfDays} ${_i18n()["day"].toString().toPlural(isPlural: laundry.value!.averageNumberOfDays != 1).inCaps} ${_i18n()["return"].toString()}",
            maxLines: 1,
            textAlign: TextAlign.center,
            style: context.txt.titleSmall?.copyWith(
                color: primaryBlueColor, fontWeight: FontWeight.w600)),
        Container(
            margin: EdgeInsets.only(top: 8),
            child: Icon(
              Icons.circle,
              size: 6,
              color: primaryBlueColor,
            )),
        Text(
            "${_i18n()["startingFrom"]} ${laundry.value!.getCheapestCategory?.toPriceString()}/kg",
            //maxLines: 2,
            textAlign: TextAlign.center,
            style: context.txt.titleSmall?.copyWith(
                color: primaryBlueColor, fontWeight: FontWeight.w600))
      ],
    );
  }
}
