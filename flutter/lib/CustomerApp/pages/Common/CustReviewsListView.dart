import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/graphql/review/hsReview.dart';
import 'package:mezcalmos/Shared/models/Utilities/Review.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/Order/ReviewCard.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['RestaurantApp']
    ['pages']['ROpReviewsView'];

class CustReviewsListView extends StatefulWidget {
  const CustReviewsListView({super.key});

  @override
  State<CustReviewsListView> createState() => _CustReviewsListViewState();
}

class _CustReviewsListViewState extends State<CustReviewsListView> {
  RxnNum rating = RxnNum();
  Rxn<List<Review>> reviews = Rxn();
  int? detailsId;
  bool get hasData => rating.value != null && reviews.value != null;
  @override
  void initState() {
    detailsId = int.tryParse(Get.parameters["detailsId"] ?? "");
    if (detailsId != null) {
      fetchReviews();
    } else
      MezRouter.back();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Future<void> fetchReviews() async {
    reviews.value = await get_service_reviews(
            serviceDetailsId: detailsId!, withCache: false) ??
        [];
    rating.value = await get_service_review_average(
            detailsId: detailsId!, withCache: false) ??
        0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mezcalmosAppBar(AppBarLeftButtonType.Back,
          onClick: MezRouter.back, title: "Reviews"),
      body: Obx(
        () {
          if (hasData) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _reviewsHeader(),
                  SizedBox(
                    height: 15,
                  ),
                  ListView.builder(
                      padding: EdgeInsets.zero,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: reviews.value!.length,
                      itemBuilder: (BuildContext ctx, int index) {
                        return ReviewCard(
                          review: reviews.value![index],
                        );
                      }),
                ],
              ),
            );
          } else {
            return Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(16),
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
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
            rating.value!.toStringAsFixed(1),
            style: Get.textTheme.bodyLarge
                ?.copyWith(fontSize: 25.sp, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 15,
          ),
          RatingBarIndicator(
            rating: rating.value!.toDouble(),
            itemBuilder: (BuildContext context, int index) => Icon(
              Icons.star_rate_rounded,
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
              "${_i18n()["base"]} ${reviews.value?.length} ${_i18n()["reviews"].toString().toLowerCase()}")
        ],
      ),
    );
  }
}