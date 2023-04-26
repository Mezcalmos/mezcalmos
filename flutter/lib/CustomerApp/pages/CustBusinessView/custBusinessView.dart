import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Components/CustBusinessEventCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Components/CustBusinessProductCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Components/CustBusinessRentalCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Components/CustBusinessServiceCard.dart';
import 'package:mezcalmos/CustomerApp/pages/CustBusinessView/components/CustBusinessAppbar.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Components/CustBusinessPaymentMethods.dart';
import 'package:mezcalmos/CustomerApp/pages/CustBusinessView/controllers/cusBusinessViewController.dart';
import 'package:mezcalmos/CustomerApp/router/customerRoutes.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/models/Utilities/Schedule.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezServiceOpenHours.dart';
import 'package:mezcalmos/Shared/widgets/Order/ReviewCard.dart';
import 'package:mezcalmos/Shared/widgets/ServiceLocationCard.dart';
import 'package:mezcalmos/Shared/models/Utilities/Review.dart' as review;

class CustBusinessView extends StatefulWidget {
  const CustBusinessView({Key? key}) : super(key: key);
  static Future<void> navigate({
    required int businessId,
  }) async {
    String route = CustomerRoutes.custBusinessRoute
        .replaceFirst(':businessId', businessId.toString());
    return MezRouter.toPath(
      route,
    );
  }

  @override
  _CustBusinessViewState createState() => _CustBusinessViewState();
}

class _CustBusinessViewState extends State<CustBusinessView>
    with TickerProviderStateMixin {
  CustBusinessViewController _viewController = CustBusinessViewController();
  int? businessId;
  @override
  void initState() {
    mezDbgPrint("init state business view");

    businessId = int.tryParse(MezRouter.urlArguments['businessId'].toString());
    if (businessId != null) {
      _viewController.init(businessId: businessId!, vsync: this);
    } else {
      showErrorSnackBar(errorText: "businessId is null");
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      if (_viewController.isBusinessLoaded) {
        return NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool value) {
            return [
              CustBusinessViewAppbar(
                viewController: _viewController,
              ),
            ];
          },
          body: TabBarView(
            controller: _viewController.tabController,
            physics: NeverScrollableScrollPhysics(),
            children: [
              Container(
                  child: ListView(
                padding: EdgeInsets.all(16),
                children: [
                  if (_viewController.business!.rentals != null &&
                      _viewController.business!.rentals!.isNotEmpty)
                    _rentals(context),
                  if (_viewController.business!.events != null &&
                      _viewController.business!.events!.isNotEmpty)
                    _events(context),
                  if (_viewController.business!.products != null &&
                      _viewController.business!.products!.isNotEmpty)
                    _products(context),
                  if (_viewController.business!.services != null &&
                      _viewController.business!.services!.isNotEmpty)
                    _services(context)
                  // Column(
                  //   children: List.generate(
                  //       viewController.business.events.length,
                  //       (index) => BusinessEventCard(event : event)),
                  // )
                  // todo @iyadh implements all the needed services / events / rentals .... lists cards of the business
                ],
              )),
              Container(
                  child: ListView(
                padding: EdgeInsets.all(16),
                children: [
                  // todo @iyadh implements info tab view
                  __headerButtons(),
                  if (_viewController.business!.details.schedule != null)
                    MezServiceOpenHours(
                        schedule: _viewController.business!.details.schedule!),
                  ServiceLocationCard(
                      location: MezLocation(
                          _viewController.business!.details.location.address,
                          MezLocation.buildLocationData(
                              _viewController.business!.details.location.lat
                                  .toDouble(),
                              _viewController.business!.details.location.lat
                                  .toDouble()))),
                  if (_viewController.business!.details.acceptedPayments !=
                      null)
                    CustBusinessPaymentMethods(
                        margin: EdgeInsets.only(top: 10),
                        paymentsMethods: _viewController
                            .business!.details.acceptedPayments!),
                  CustBusinessPaymentMethods(
                      margin: EdgeInsets.only(top: 10),
                      paymentsMethods: {
                        PaymentType.Card: true,
                        PaymentType.Cash: true,
                        PaymentType.BankTransfer: true
                      }),
                  _reviewsList(context),
                ],
              )),
            ],
          ),
        );
        // return CustomScrollView(
        //   slivers: [
        //     CustBusinessViewAppbar(viewController: viewController),

        //     SliverFillRemaining(
        //       //  hasScrollBody: false,
        //       child: TabBarView(
        //         controller: viewController.tabController,
        //         children: <Widget>[
        //           Container(
        //             child: Column(
        //               children: List.generate(
        //                   150,
        //                   (int index) => MezCard(
        //                         content: Text(index.toString()),
        //                       )),
        //             ),
        //           ),
        //           Container(),
        //           Container(),
        //         ],
        //       ),
        //     ),
        //   ],
        // );
      } else {
        return Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 10),
              Text('Loading', style: context.textTheme.bodyMedium
                  //   ?.copyWith(color: pr),
                  ),
            ],
          ),
        );
      }
    }));
  }

  Column _rentals(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Rentals',
            style: context.textTheme.displayMedium?.copyWith(fontSize: 20)),
        for (Rental rental in _viewController.business!.rentals!)
          CustBusinessRentalCard(
            rental: rental,
            elevation: 0,
          )
      ],
    );
  }

  Column _events(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 15,
        ),
        Text('Events',
            style: context.textTheme.displayMedium?.copyWith(fontSize: 20)),
        for (Event event in _viewController.business!.events!)
          CustBusinessEventCard(
            elevation: 0,
            event: event,
          )
      ],
    );
  }

  Column _products(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Products',
            style: context.textTheme.displayMedium?.copyWith(fontSize: 20)),
        for (Product product in _viewController.business!.products!)
          CustBusinessProductCard(elevation: 0, product: product)
      ],
    );
  }

  Column _services(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Services',
            style: context.textTheme.displayMedium?.copyWith(fontSize: 20)),
        for (Service service in _viewController.business!.services!)
          CustBusinessServiceCard(
            service: service,
            elevation: 0,
          )
      ],
    );
  }

  Widget __headerButtons() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RawChip(
          padding: EdgeInsets.symmetric(horizontal: 10),
          backgroundColor: Colors.transparent,
          shape: StadiumBorder(side: BorderSide(color: primaryBlueColor)),
          label: InkWell(
            onTap: () {},
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: Icon(
                          Icons.message_rounded,
                          color: primaryBlueColor,
                        )),
                    TextSpan(
                      text: 'Chat with us', //'${_i18n()["chatWithUs"]}',
                      style: context.txt.bodyLarge
                          ?.copyWith(color: primaryBlueColor),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        RawChip(
          padding: EdgeInsets.symmetric(horizontal: 10),
          backgroundColor: Colors.transparent,
          shape: StadiumBorder(side: BorderSide(color: primaryBlueColor)),
          label: InkWell(
            onTap: () {},
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: Icon(
                          Icons.phone,
                          color: primaryBlueColor,
                        )),
                    TextSpan(
                      text: 'Contact Us', //'${_i18n()["contactUs"]}',
                      style: context.txt.bodyLarge
                          ?.copyWith(color: primaryBlueColor),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _reviewsList(BuildContext context) {
    return Obx(
      () => _viewController.reviews.isEmpty
          ? SizedBox.shrink()
          : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    'Reviews',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.star,
                    color: primaryBlueColor,
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  if (_viewController.ratingAverage.value != null)
                    Text(
                      _viewController.ratingAverage.value!.toStringAsFixed(1),
                      style: context.txt.bodyLarge
                          ?.copyWith(color: primaryBlueColor),
                    ),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 1),
                    child: Text(
                      _viewController.reviews.length.toString(),
                      style: context.txt.titleSmall
                          ?.copyWith(color: offLightShadeGreyColor),
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {},
                    child: Ink(
                      color: Colors.transparent,
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        'View all',
                        style: context.txt.bodyLarge
                            ?.copyWith(color: primaryBlueColor),
                      ),
                    ),
                  )
                ],
              ),
              for (review.Review rev in _viewController.reviews)
                ReviewCard(
                    review: review.Review(
                        rating: rev.rating,
                        fromEntityId: rev.fromEntityId,
                        comment: rev.comment,
                        toEntityId: rev.toEntityId,
                        toEntityType: rev.toEntityType,
                        toImage: rev.toImage,
                        toName: rev.toName,
                        reviewTime: rev.reviewTime,
                        fromEntityType: rev.fromEntityType),
                    showUserImage: false)
            ]),
    );
  }
}
