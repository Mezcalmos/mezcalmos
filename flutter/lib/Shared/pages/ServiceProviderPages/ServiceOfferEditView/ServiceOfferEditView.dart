import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/BsEventView/components/BsOpDateTimePicker.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/BusinessHelpers/ServiceOfferHelpers.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/OfferingsListView/OffersOfferingListView.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServiceOfferEditView/controllers/ServiceOfferEditViewController.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/routes/sharedSPRoutes.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezEssentials/MezButton.dart';
import 'package:mezcalmos/Shared/widgets/MezEssentials/MezCard.dart';
import 'package:mezcalmos/Shared/widgets/MezStringDropDown.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['Shared']['pages']
    ['ServiceOfferView'];

class ServiceOfferEditView extends StatefulWidget {
  const ServiceOfferEditView({
    super.key,
  });
  @override
  State<ServiceOfferEditView> createState() => _ServiceOfferEditViewState();

  static Future<bool?> navigate({
    required int? offerId,
    required int serviceProviderId,
    required ServiceProviderType serviceProviderType,
  }) async {
    final String route = SharedServiceProviderRoutes.kServiceEditOffersRoute
        .replaceFirst(":offerId", offerId.toString());
    await MezRouter.toPath(route, arguments: <String, dynamic>{
      "offerId": offerId,
      "serviceProviderId": serviceProviderId,
      "serviceProviderType": serviceProviderType,
    });
    return MezRouter.backResult;
  }
}

class _ServiceOfferEditViewState extends State<ServiceOfferEditView> {
  ServiceOfferEditViewController viewController =
      ServiceOfferEditViewController();
  int? offerId;
  int? serviceProviderId;
  late ServiceProviderType serviceProviderType;

  @override
  void initState() {
    super.initState();
    offerId = int.tryParse(MezRouter.bodyArguments!["offerId"].toString());
    serviceProviderId =
        int.tryParse(MezRouter.bodyArguments!["serviceProviderId"].toString());
    serviceProviderType =
        MezRouter.bodyArguments!["serviceProviderType"] as ServiceProviderType;

    mezDbgPrint(
        "Body args ::::::========>$serviceProviderId $offerId $serviceProviderType");
    viewController.init(
      offerId: offerId,
      serviceProviderId: serviceProviderId!,
      serviceProviderType: serviceProviderType,
    );
  }

  void showAvailability() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Obx(
          () => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BsOpDateTimePicker(
                fillColor: Colors.white,
                onNewPeriodSelected: (DateTime v) {
                  viewController.selectedStartDate.value = v;
                },
                label: "choostTime",
                validator: (DateTime? p0) {
                  if (p0 == null) {
                    BotToast.showText(
                        text: "Please select a time",
                        duration: Duration(seconds: 5));
                    return "Please select a time";
                  }
                  return null;
                },
                time: viewController.selectedStartDate.value,
              ),
              BsOpDateTimePicker(
                fillColor: Colors.white,
                onNewPeriodSelected: (DateTime v) {
                  viewController.selectedEndDate.value = v;
                },
                label: "choostTime",
                validator: (DateTime? p0) {
                  if (p0 == null) {
                    BotToast.showText(
                        text: "Please select a time",
                        duration: Duration(seconds: 5));
                    return "Please select a time";
                  }
                  return null;
                },
                time: viewController.selectedEndDate.value,
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: MezcalmosAppBar(AppBarLeftButtonType.Back, onClick: () {
          MezRouter.back(backResult: viewController.shouldRefetch);
        },
            title: viewController.currentOffer.value != null
                ? viewController.currentOffer.value!.name!.getTranslation(
                    Get.find<LanguageController>().userLanguageKey)
                : "Add Offer"),
        bottomNavigationBar: MezButton(
          borderRadius: 0,
          label: viewController.isEditMode.value ? "Update" : "Add",
          withGradient: true,
          onClick: () async {
            await viewController.save();
          },
        ),
        body: viewController.currentOffer.value == null &&
                viewController.isEditMode.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Form(
                key: viewController.formKey,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Select your offer",
                        style: context.textTheme.bodyLarge,
                      ),
                      smallSepartor,
                      Builder(builder: (BuildContext context) {
                        return MezStringDropDown(
                          labelText: "Select your offer",
                          langPath: _i18n(),
                          value: viewController.selectedOfferType.value
                              ?.toFirebaseFormatString(),
                          items: [
                            OfferType.Coupon,
                            OfferType.Promotion,
                            OfferType.MonthlySubscription
                          ]
                              .map((OfferType e) => e.toFirebaseFormatString())
                              .toList(),
                          icons: [
                            Icons.discount_rounded,
                            Icons.attach_money,
                            Icons.workspace_premium_rounded
                          ],
                          validator: (String? value) {
                            if (value == null ||
                                viewController.selectedOfferType.value ==
                                    null) {
                              return "Please select your offer";
                            }
                            return null;
                          },
                          onChanged: (String? value) {
                            if (value == null) return;
                            viewController.selectedOfferType.value =
                                value.toOfferType();
                          },
                        );
                      }),
                      Text(
                        "Coupon Code",
                        style: context.textTheme.bodyLarge,
                      ),
                      smallSepartor,
                      TextFormField(
                        controller: viewController.offerNameController,
                        decoration: InputDecoration(
                          hintText: "Enter your Coupon Code",
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your Coupon Code";
                          }
                          return null;
                        },
                      ),
                      smallSepartor,
                      Text(
                        "Select type of order",
                        style: context.textTheme.bodyLarge,
                      ),
                      smallSepartor,
                      MezStringDropDown(
                        labelText: "Select your offer",
                        langPath: Get.find<LanguageController>()
                            .strings['Shared']['pages']['ServiceOfferView'],
                        value: viewController.selectedOfferOrderType.value
                            ?.toFirebaseFormatString(),
                        items: OfferOrderType.values
                            .map((OfferOrderType e) =>
                                e.toFirebaseFormatString())
                            .toList(),
                        onChanged: (String? value) async {
                          viewController.selectedOfferOrderType.value =
                              value!.toOfferOrderType();
                          if (viewController.selectedOfferOrderType.value ==
                              OfferOrderType.ParticularService) {
                            final List<OfferingData> data =
                                await OffersOfferingListView.navigate(
                              selectedOfferingData: viewController.allOfferings,
                            );
                            final List<OfferingData> newOfferingsList = [
                              ...data
                            ];
                            viewController.allOfferings.value =
                                newOfferingsList;
                          }
                        },
                      ),
                      Column(
                        children: List.generate(
                          viewController.allOfferings.length,
                          (int index) {
                            return !viewController.allOfferings[index].value
                                ? SizedBox.shrink()
                                : MezCard(
                                    content: ListTile(
                                      title: Text(
                                        viewController.allOfferings[index].name
                                                .getTranslation(Get.find<
                                                        LanguageController>()
                                                    .userLanguageKey) ??
                                            "",
                                      ),
                                      trailing: IconButton(
                                        icon: Icon(Icons.delete),
                                        onPressed: () {
                                          viewController.allOfferings[index]
                                              .value = false;
                                          viewController.allOfferings.refresh();
                                        },
                                      ),
                                    ),
                                  );
                          },
                        ),
                      ),
                      Text(
                        "Discount type",
                        style: context.textTheme.bodyLarge,
                      ),
                      smallSepartor,
                      Row(
                        children: [
                          Expanded(
                            child: MezStringDropDown(
                              labelText: "Select discount type",
                              value: viewController.selectedDiscountType.value
                                  .toFirebaseFormatString(),
                              langPath: _i18n(),
                              items: [
                                DiscountType.FlatAmount,
                                DiscountType.Percentage,
                                DiscountType.AnotherSameFlat
                              ]
                                  .map((DiscountType e) =>
                                      e.toFirebaseFormatString())
                                  .toList(),
                              onChanged: (String? value) {
                                if (value == null) return;
                                viewController.selectedDiscountType.value =
                                    value.toDiscountType();
                              },
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: TextFormField(
                              controller: viewController.discountController,
                              decoration: InputDecoration(
                                hintText: "0",
                                suffixIcon:
                                    viewController.selectedDiscountType.value ==
                                            DiscountType.Percentage
                                        ? Text("%")
                                        : Text("\$"),
                              ),
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter your Coupon Code";
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      smallSepartor,
                      Text(
                        "Select your availability",
                        style: context.textTheme.bodyLarge,
                      ),
                      smallSepartor,
                      FormField(
                        validator: (Object? value) {
                          if (viewController.selectedStartDate.value == null ||
                              viewController.selectedEndDate.value == null) {
                            return "Please select your availability";
                          }
                          if (viewController.selectedStartDate.value!
                              .isAfter(viewController.selectedEndDate.value!)) {
                            return "Start date must be before end date";
                          }
                          return null;
                        },
                        builder: (FormFieldState<Object?> state) {
                          return Obx(
                            () => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    showAvailability();
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 20),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color: Colors.grey.shade200,
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(Icons.access_time_filled),
                                        viewController.selectedStartDate
                                                        .value !=
                                                    null &&
                                                viewController.selectedEndDate
                                                        .value !=
                                                    null
                                            ? Text(
                                                "${viewController.selectedStartDate.value!.getOrderTime()} - ${viewController.selectedEndDate.value!.getOrderTime()}")
                                            : Text(
                                                "Select your time",
                                              ),
                                      ],
                                    ),
                                  ),
                                ),
                                if (state.hasError)
                                  Text(
                                    state.errorText!,
                                    style:
                                        context.textTheme.bodyMedium!.copyWith(
                                      color: Colors.red,
                                    ),
                                  ),
                              ],
                            ),
                          );
                        },
                      ),
                      smallSepartor,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Repeat this offer every week",
                            style: context.textTheme.bodyLarge,
                          ),
                          Switch(
                            value: viewController.repeatOffer.value,
                            onChanged: (bool value) {
                              viewController.repeatOffer.value = value;
                            },
                          )
                        ],
                      ),
                      if (viewController.selectedOfferType.value ==
                          OfferType.Coupon)
                        Column(),
                      if (viewController.selectedOfferType.value ==
                          OfferType.Promotion)
                        Column(),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
