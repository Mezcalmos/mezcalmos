import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessAdditionalData.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessItemAppbar.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessMessageCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/controllers/OfferingViewController.dart';
import 'package:mezcalmos/CustomerApp/router/businessRoutes.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustCircularLoader.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessNoOrderBanner.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessScheduleBuilder.dart';
import 'package:mezcalmos/Shared/widgets/ServiceLocationCard.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() =>
    Get.find<LanguageController>().strings['CustomerApp']['pages']['Offerings'];

class CustEventView extends StatefulWidget {
  const CustEventView({super.key});
  static Future<void> navigate({required int eventId}) async {
    final String route =
        CustBusinessRoutes.custEventRoute.replaceFirst(":id", "$eventId");
    return MezRouter.toPath(route);
  }

  @override
  State<CustEventView> createState() => _CustEventViewState();
}

class _CustEventViewState extends State<CustEventView> {
  CustEventViewController viewController = CustEventViewController();
  int? eventId;
  @override
  void initState() {
    eventId = int.tryParse(MezRouter.urlArguments["id"].toString());
    mezDbgPrint("✅ init event view with id => $eventId");
    if (eventId != null) {
      viewController.fetchData(eventId: eventId!);
    } else {
      showErrorSnackBar(errorText: "Error: Event ID $eventId not found");
    }
    super.initState();
  }

  String generateCost() {
    String removePerFromTime(TimeUnit timeUnit) {
      if (timeUnit == TimeUnit.PerPerson) {
        return '/${_i18n()['person']}';
      }
      if (timeUnit == TimeUnit.Unit) {
        return "";
      }
      return '/${_i18n()[timeUnit.name.toString().toLowerCase().replaceFirst('per', '')]}';
    }

    final Map<TimeUnit, num> singleCost = viewController.event!.details.cost;
    switch (viewController.event!.scheduleType) {
      case ScheduleType.Scheduled:
        return "${singleCost.entries.first.value.toPriceString()}${removePerFromTime(singleCost.entries.first.key)}";

      case ScheduleType.OnDemand:
        return "${singleCost.entries.first.value.toPriceString()}${removePerFromTime(singleCost.entries.first.key)}";

      case ScheduleType.OneTime:
        return "${singleCost.entries.first.value.toPriceString()}${removePerFromTime(singleCost.entries.first.key)}";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (viewController.event != null) {
          mezDbgPrint(
              "EVENT ${viewController.event?.toFirebaseFormattedJson()}");
          return CustomScrollView(
            slivers: [
              CustBusinessItemAppbar(
                  itemDetails: viewController.event!.details),
              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        viewController.event!.details.name
                            .getTranslation(userLanguage)!
                            .inCaps,
                        style: context.textTheme.displayMedium,
                      ),
                      CustBusinessAdditionalData(
                        additionalValues: viewController
                                .event!.details.additionalParameters ??
                            {},
                      ),
                      // Price
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        generateCost(),
                        style: context.textTheme.bodyLarge!.copyWith(
                          color: primaryBlueColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      _description(context),
                      if (viewController.event?.schedule != null) _schedule(),

                      if (viewController.event?.gpsLocation != null)
                        ServiceLocationCard(
                          height: 20.h,
                          location: MezLocation(
                            viewController.event!.gpsLocation?.address ?? "",
                            MezLocation.buildLocationData(
                              viewController.event!.gpsLocation!.lat.toDouble(),
                              viewController.event!.gpsLocation!.lng.toDouble(),
                            ),
                          ),
                        ),
                      CustBusinessMessageCard(
                        margin: EdgeInsets.only(top: 15),
                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                        business: viewController.event!.business,
                        offeringName: viewController.event!.details.name,
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

  Column _schedule() {
    return Column(
      children: [
        SizedBox(
          height: 15,
        ),
        CustBusinessScheduleBuilder(
          schedule: viewController.event!.schedule,
          scheduleType: viewController.event!.scheduleType,
        )
      ],
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
          viewController.event!.details.description
                  ?.getTranslation(userLanguage)
                  ?.trim() ??
              _i18n()['noDescription'],
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
