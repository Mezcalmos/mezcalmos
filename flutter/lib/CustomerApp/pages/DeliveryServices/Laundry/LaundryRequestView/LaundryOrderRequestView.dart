import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/CustDeliveryTypePicker.dart';
import 'package:mezcalmos/CustomerApp/components/DropDownLocationList.dart';
import 'package:mezcalmos/CustomerApp/pages/DeliveryServices/Laundry/LaundryRequestView/controllers/CustLaundryOrderRequestViewController.dart';
import 'package:mezcalmos/CustomerApp/router/laundaryRoutes.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/graphql/laundry/hsLaundry.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/pages/AuthScreens/SignInScreen.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezEssentials/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/OrderDeliverySelector/CustOrderDeliverySelector.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['Laundry']['LaundryRequestView']['LaundryOrderRequestView'];

class CustLaundryOrderRequestView extends StatefulWidget {
  const CustLaundryOrderRequestView({Key? key}) : super(key: key);

  static Future<void> navigate({required int laundryId}) {
    return MezRouter.toPath(LaundryRoutes.laundryOrderRequestRoute
        .replaceAll(":laundryId", laundryId.toString()));
  }

  @override
  State<CustLaundryOrderRequestView> createState() =>
      _CustLaundryOrderRequestViewState();
}

class _CustLaundryOrderRequestViewState
    extends State<CustLaundryOrderRequestView> {
  CustLaundryOrderRequestViewController viewController =
      CustLaundryOrderRequestViewController();

  late final Laundry? _laundry;

  @override
  void initState() {
    final int? laundryId =
        int.tryParse(MezRouter.urlArguments["laundryId"].toString());

    if (laundryId != null) {
      Future(() async {
        _laundry = await get_laundry_store_by_id(id: laundryId);
        await viewController.init(laundry: _laundry!);
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: MezcalmosAppBar(
          AppBarLeftButtonType.Back,
          onClick: MezRouter.back,
          titleWidget: Obx(() => Text(
                viewController.laundry.value?.info.name ?? "",
                style: context.txt.displaySmall,
              )),
        ),
        body: Obx(
          () {
            if (viewController.laundry.value != null) {
              return Column(children: <Widget>[
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: CachedNetworkImage(
                                width: double.infinity,
                                height: 20.h,
                                fit: BoxFit.cover,
                                imageUrl:
                                    viewController.laundry.value!.info.image),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(viewController.laundry.value!.info.name,
                              style: context.txt.headlineSmall),
                          SizedBox(
                            height: 9,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                alignment: Alignment.topCenter,
                                margin: const EdgeInsets.only(top: .5),
                                child: Icon(
                                  Icons.place,
                                  size: 18,
                                  color: primaryBlueColor,
                                ),
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Flexible(
                                child: Text(
                                  viewController
                                      .laundry.value!.info.location.address,
                                  maxLines: 2,
                                  style: context.txt.titleSmall,
                                ),
                              )
                            ],
                          ),
                          CustDeliveryTypeSelector(
                            onDeliveryTypeChanged: (DeliveryType value) {
                              viewController.switchDeliveryType(type: value);
                              mezDbgPrint(
                                  "Changed from parent callback ==>$value");
                            },
                          ),
                          if (viewController.showDelivery) ...[
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              child: Text(
                                '${_i18n()["deliveryLocation"]}',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Obx(
                              () => viewController.authController.user != null
                                  ? Form(
                                      key: viewController.formKey,
                                      child: Container(
                                        decoration: BoxDecoration(boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey.shade300,
                                              blurRadius: 1,
                                              offset: Offset(0, .5))
                                        ]),
                                        child: DropDownLocationList(
                                          ensureVisible: false,
                                          onValueChangeCallback:
                                              (MezLocation location) {
                                            mezDbgPrint(
                                                "Loctaion ::::::::====>$location");
                                            if (viewController
                                                    .formKey.currentState
                                                    ?.validate() ==
                                                true) {
                                              viewController
                                                  .switchLocation(location);

                                              // ignore: unawaited_futures
                                            }
                                          },
                                          bgColor: Colors.white,
                                          checkDistance: true,
                                          serviceProviderLocation:
                                              viewController
                                                  .laundry.value!.info.location,
                                        ),
                                      ),
                                    )
                                  : pickFromMapComponent(context),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            if (!viewController.laundry.value!.selfDelivery)
                              CustOrderDeliverySelector(
                                onSelectionUpdate: (List<int> value) {
                                  viewController.selectedCompanies = value;
                                },
                                distanceInKm: viewController.getOrderDistance,
                                onEstDeliveryPriceChange: (double value) {
                                  viewController.estDeliveryCost.value = value;
                                },
                              ),
                          ],
                          SizedBox(
                            height: 10,
                          ),
                          _summaryCard(context),
                          SizedBox(
                            height: 15,
                          ),
                          _orderNoteComponent()
                        ],
                      ),
                    ),
                  ),
                ),
                bottomButton(context)
              ]);
            } else {
              return Container(
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }

  Card _summaryCard(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              width: Get.width,
              child: Text(
                "${_i18n()["summaryText"]}",
                style: context.txt.bodyLarge,
              ),
            ),
            if (viewController.showDelivery) ...[
              SizedBox(height: 4),
              Container(
                padding: EdgeInsets.only(
                  bottom: 4,
                ),
                width: Get.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: Text("${_i18n()["deliveryCost"]}",
                            style: context.txt.bodyMedium),
                      ),
                    ),
                    Text(
                      "${viewController.estDeliveryCost.value.toPriceString()} x 2",
                      style: context.txt.bodyMedium,
                    )
                  ],
                ),
              ),
            ]
            // SizedBox(
            //   height: 8,
            // ),
          ],
        ),
      ),
    );
  }

  Widget _orderNoteComponent() {
    return Container(
      //margin: const EdgeInsets.symmetric(vertical: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(_i18n()["notes"], style: Theme.of(context).textTheme.bodyLarge),
          SizedBox(
            height: 8,
          ),
          Card(
            child: TextField(
              style: context.txt.titleMedium?.copyWith(
                color: blackColor,
              ),
              controller: viewController.orderNote,
              maxLines: 5,
              minLines: 3,
              decoration: InputDecoration(
                hintText: "${_i18n()["noteHint"]}",
                hintStyle: context.txt.titleMedium?.copyWith(color: blackColor),
                filled: true,
                fillColor: Theme.of(context).primaryColor,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget pickFromMapComponent(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () async {
          // TODO M66ARE NEW LOC
          // final MezLocation? currentLoc =
          //     await MezRouter.toNamed(PickLocationRoutes.pickLocationNotAuth)
          //         as MezLocation?;
          // if (currentLoc != null) {
          //   viewController.switchLocation(currentLoc);
          // }
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.place_rounded,
                color: primaryBlueColor,
                //size: 14,
              ),
              const SizedBox(width: 5),
              Flexible(
                child: Text(
                  viewController.customerLoc.value?.address ??
                      "${_i18n()['pickLocation']}",
                  maxLines: 1,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Obx bottomButton(BuildContext context) {
    return Obx(
      () => MezButton(
        borderRadius: 0,
        height: 50,
        label: viewController.isUserSignedIn
            ? '${_i18n()["orderNow"]}'
            : "${_i18n()["signInToMakeOrder"]}",
        // enabled: viewController.isUserSignedIn ? viewController.canOrder : true,
        onClick: () async {
          if (viewController.isUserSignedIn) {
            mezDbgPrint(viewController.formKey.currentState?.validate());
            if (viewController.showDelivery &&
                viewController.formKey.currentState?.validate() == true) {
              await viewController.createLaundryOrder();
            } else if (!viewController.showDelivery) {
              await viewController.createLaundryOrder();
            }
          } else {
            await SignInView.navigateAtOrderTime();
          }
        },
      ),
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
              item.name.getTranslation(userLanguage)!.inCaps,
              style: context.txt.bodyMedium,
              maxLines: 1,
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Text(
            "${item.cost.toPriceString()}/KG",
            style: context.txt.bodyLarge?.copyWith(color: primaryBlueColor),
          )
        ],
      ),
    );
  }
}
