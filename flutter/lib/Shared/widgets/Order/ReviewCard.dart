import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Review.dart';

class ReviewCard extends StatefulWidget {
  const ReviewCard({super.key, required this.review});
  final Review review;

  @override
  State<ReviewCard> createState() => _ReviewCardState();
}

class _ReviewCardState extends State<ReviewCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.3,
      margin: const EdgeInsets.only(bottom: 8),
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 18,
                  backgroundImage:
                      CachedNetworkImageProvider(widget.review.customer!.image),
                ),
                SizedBox(
                  width: 8,
                ),
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
            Divider(
              color: Colors.grey.shade200,
            ),
            Text(
              widget.review.comment?.inCaps ?? "",
              style: Get.textTheme.bodyText2,
            ),
          ],
        ),
      ),
    );
  }
}