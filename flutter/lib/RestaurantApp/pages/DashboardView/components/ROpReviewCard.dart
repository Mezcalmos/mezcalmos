import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Review.dart';

class ROpReviewCard extends StatefulWidget {
  const ROpReviewCard({super.key, required this.review});
  final Review review;

  @override
  State<ROpReviewCard> createState() => _ROpReviewCardState();
}

class _ROpReviewCardState extends State<ROpReviewCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 8),
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
                fit: FlexFit.tight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.review.customer?.name ?? "",
                      style: Get.textTheme.bodyText1,
                    ),
                    Text(
                      widget.review.reviewTime.timeAgo().toLowerCase(),
                      style: Get.textTheme.subtitle1,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      widget.review.comment ?? "",
                      style: Get.textTheme.bodyText2,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                )),
            RatingBarIndicator(
              rating: widget.review.rating.toDouble(),
              itemBuilder: (BuildContext context, int index) => Icon(
                Icons.star,
                color: primaryBlueColor,
              ),
              itemCount: 5,
              itemSize: 18.0,
              direction: Axis.horizontal,
            ),
          ],
        ),
      ),
    );
  }
}
