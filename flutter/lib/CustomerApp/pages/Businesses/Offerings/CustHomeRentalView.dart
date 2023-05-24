import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessItemAppbar.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessMessageCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/controllers/OfferingViewController.dart';
import 'package:mezcalmos/CustomerApp/router/businessRoutes.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustCircularLoader.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessNoOrderBanner.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessRentalCost.dart';
import 'package:mezcalmos/Shared/widgets/ServiceLocationCard.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() =>
    Get.find<LanguageController>().strings['CustomerApp']['pages']['Offerings'];

class CustHomeRentalView extends StatefulWidget {
  const CustHomeRentalView({super.key});
  static Future<void> navigate({required int rentalId}) async {
    final String route =
        CustBusinessRoutes.custHomeRentalRoute.replaceFirst(":id", "$rentalId");
    return MezRouter.toPath(route);
  }

  @override
  State<CustHomeRentalView> createState() => _CustHomeRentalViewState();
}

class _CustHomeRentalViewState extends State<CustHomeRentalView> {
  CustHomeRentalViewController viewController = CustHomeRentalViewController();
  int? rentalId;
  @override
  void initState() {
    rentalId = int.tryParse(MezRouter.urlArguments["id"].toString());
    mezDbgPrint("✅ init home rental view with id => $rentalId");
    if (rentalId != null) {
      viewController.fetchData(rentalId: rentalId!);
    } else {
      showErrorSnackBar(errorText: "Error: Home Rental ID $rentalId not found");
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (viewController.homeRental != null) {
          return CustomScrollView(
            slivers: [
              CustBusinessItemAppbar(
                  itemDetails: viewController.homeRental!.details),
              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        viewController.homeRental!.details.name
                            .getTranslation(userLanguage)!
                            .inCaps,
                        style: context.textTheme.displayMedium,
                      ),
                      _CustBusinessAdditionalData(
                        homeRental: viewController.homeRental!,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        _i18n()['price'],
                        style: context.textTheme.bodyLarge,
                      ),
                      CustBusinessRentalCost(
                        cost: viewController.homeRental!.details.cost,
                      ),
                      _description(context),
                      if (viewController.homeRental?.gpsLocation != null)
                        ServiceLocationCard(
                          height: 20.h,
                          location: MezLocation(
                            viewController.homeRental!.gpsLocation?.address ??
                                "",
                            MezLocation.buildLocationData(
                              viewController.homeRental!.gpsLocation!.lat
                                  .toDouble(),
                              viewController.homeRental!.gpsLocation!.lng
                                  .toDouble(),
                            ),
                          ),
                        ),
                      CustBusinessMessageCard(
                        margin: EdgeInsets.only(top: 15),
                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                        business: viewController.homeRental!.business,
                        offeringName: viewController.homeRental!.details.name,
                      ),
                      CustBusinessNoOrderBanner(),
                    ],
                  ),
                ),
              )
            ],
          );
        } else {
          return CustCircularLoader();
        }
      }),
    );
  }

  Column _description(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 15,
        ),
        Text(
          _i18n()['description'],
          style: context.textTheme.bodyLarge,
        ),
        Text(
          viewController.homeRental!.details.description
                  ?.getTranslation(userLanguage)
                  ?.trim() ??
              _i18n()['noDescription'],
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}

class _CustBusinessAdditionalData extends StatelessWidget {
  const _CustBusinessAdditionalData({
    required this.homeRental,
  });

  final RentalWithBusinessCard? homeRental;

  @override
  Widget build(BuildContext context) {
    String wholeAdditionalParamString() {
      final String circle = "•";
      final Map<String, String> additionalValues = {
        'bedRooms': '${homeRental?.bedrooms ?? 0} ${_i18n()['bedrooms']}',
        'bathRooms': '${homeRental?.bathrooms ?? 0} ${_i18n()['bathrooms']}',
        'houseType':
            '${_i18n()[homeRental?.homeType?.name.toLowerCase()] ?? ''}',
      };
      final Map<String, String> moreAdditionalValues = homeRental
              ?.details.additionalParameters
              ?.map((key, value) => MapEntry(key, value.toString())) ??
          {};

      additionalValues.addAll(
        moreAdditionalValues,
      );
      final StringBuffer wholeString = StringBuffer();
      additionalValues.map(
        (key, value) {
          if (additionalValues.keys.toList().indexOf(key) == 0) {
            wholeString.write("$value ");
          } else {
            wholeString.write("$circle $value ");
          }
          return MapEntry(key, value);
        },
      );
      return wholeString.toString();
    }

    return Text(
      wholeAdditionalParamString(),
      style: context.textTheme.bodyLarge!.copyWith(
        color: primaryBlueColor,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
