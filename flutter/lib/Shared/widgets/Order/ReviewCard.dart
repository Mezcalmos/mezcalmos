import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Review.dart';
import 'package:sizer/sizer.dart';

class ReviewCard extends StatefulWidget {
  const ReviewCard(
      {super.key, required this.review, this.showUserImage = true});
  final Review review;
  final bool showUserImage;

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
      elevation: 0.5,
      margin: const EdgeInsets.only(bottom: 15),
      child: Container(
        //  color: Get.theme.scaffoldBackgroundColor,
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (widget.showUserImage)
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: CircleAvatar(
                      radius: 23,
                      backgroundImage: CachedNetworkImageProvider(
                          widget.review.customer?.image ?? ""),
                    ),
                  ),
                Flexible(
                    fit: FlexFit.tight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.review.customer?.name ?? "",
                            style: context.txt.bodyLarge),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          widget.review.reviewTime.timeAgo().capitalizeFirst!,
                          style: context.txt.titleMedium?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: Color(0XFF494949)),
                        ),
                      ],
                    )),
                RatingBarIndicator(
                  unratedColor: Color(0XFFF2F2F2),
                  rating: widget.review.rating.toDouble(),
                  itemBuilder: (BuildContext context, int index) => Icon(
                    Icons.star,
                    color: primaryBlueColor,
                  ),
                  itemCount: 5,
                  itemSize: 22.0,
                  direction: Axis.horizontal,
                ),
              ],
            ),
            SizedBox(
              height: 1.h,
            ),
            Text(
              widget.review.comment?.inCaps ?? "",
              style: context.txt.bodyMedium,
            ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
