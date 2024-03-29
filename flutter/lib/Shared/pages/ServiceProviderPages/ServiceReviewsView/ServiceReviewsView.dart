import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServiceReviewsView/components/ServiceNoReviews.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServiceReviewsView/components/ServiceReviewCard.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServiceReviewsView/components/ServiceReviewsFilters.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServiceReviewsView/controllers/ServiceReviewsViewController.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/routes/sharedSPRoutes.dart';
import 'package:mezcalmos/Shared/widgets/MezAppBar.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['RestaurantApp']
    ['pages']['ROpReviewsView'];

class ServiceReviewsView extends StatefulWidget {
  const ServiceReviewsView({
    Key? key,
  }) : super(key: key);
  static Future<void> navigate() {
    return MezRouter.toPath(SharedServiceProviderRoutes.kServiceReviews);
  }

  @override
  State<ServiceReviewsView> createState() => _ServiceReviewsViewState();
}

class _ServiceReviewsViewState extends State<ServiceReviewsView> {
  ServiceReviewsViewController viewController = ServiceReviewsViewController();

  int? serviceProviderId;
  @override
  void initState() {
    viewController.fetchReviewsAndRating();
    super.initState();
  }

  @override
  void dispose() {
    //viewController.dspose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MezcalmosAppBar(AppBarLeftButtonType.Back,
          title: "${_i18n()['reviews']}", onClick: MezRouter.back),
      body: Obx(() {
        if (viewController.hasReviews && viewController.hasRating) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // top component //
                _reviewsHeader(),
                // performance text //
                _performanceComponent(),
                const SizedBox(
                  height: 25,
                ),

                // reviews chips //
                ServiceReviewsFilters(viewController: viewController),
                SizedBox(
                  height: 8,
                ),

                // reviews list //
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: viewController.reviews.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ServiceReviewCard(
                        review: viewController.reviews[index]);
                  },
                )
              ],
            ),
          );
        } else {
          return ServiceNoReviewsComponent();
        }
      }),
    );
  }

  Container _reviewsHeader() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            viewController.rating.toStringAsFixed(1),
            style: context.txt.bodyLarge
                ?.copyWith(fontSize: 25.sp, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 15,
          ),
          RatingBarIndicator(
            rating: viewController.rating.toDouble(),
            itemBuilder: (BuildContext context, int index) => Icon(
              Icons.star_rate,
              color: primaryBlueColor,
            ),
            itemCount: 5,
            itemSize: 35.0,
            direction: Axis.horizontal,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
              "${_i18n()["base"]} ${viewController.reviews.length} ${_i18n()["review"].toString().toPlural(isPlural: viewController.reviews.length == 1).toLowerCase()}")
        ],
      ),
    );
  }

  Container _performanceComponent() {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
      decoration: BoxDecoration(
          color: viewController.performColor(),
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "${_i18n()["perfomTitle"]}",
            style: context.txt.bodyLarge,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            " ${_i18n()[viewController.performanceString()]} !",
            style: context.txt.bodyLarge
                ?.copyWith(color: viewController.performTextColor()),
          ),
        ],
      ),
    );
  }
}
