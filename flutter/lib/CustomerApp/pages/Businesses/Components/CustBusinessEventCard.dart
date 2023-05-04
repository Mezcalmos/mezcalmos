import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/CustEventView.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/helpers/TimeUnitHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/widgets/MezServiceOpenHours.dart';
import 'package:sizer/sizer.dart';
import 'package:mezcalmos/Shared/widgets/MezCard.dart';

class CustBusinessEventCard extends StatelessWidget {
  final EdgeInsets margin;
  final EdgeInsetsGeometry contentPadding;
  final Event event;
  final double? elevation;

  const CustBusinessEventCard(
      {super.key,
      this.margin = const EdgeInsets.only(top: 5),
      this.contentPadding = const EdgeInsets.all(8),
      required this.event,
      this.elevation});

  @override
  Widget build(BuildContext context) {
    return MezCard(
      elevation: elevation,
      margin: margin,
      onClick: () {
        CustEventView.navigate(
          eventId: event.details.id.toInt(),
        );
      },
      content: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            CircleAvatar(
              radius: 17.5.sp,
              backgroundImage: (event.details.image != null &&
                      event.details.image!.isNotEmpty)
                  ? CachedNetworkImageProvider(event.details.image![0])
                  : null,
              backgroundColor: backgroundShadeColor,
            ),
            SizedBox(
              width: 5,
            ),
            Flexible(
              flex: 7,
              child: Text(
                event.details.name.getTranslation(userLanguage),
                style: context.textTheme.bodyLarge?.copyWith(fontSize: 11.5.sp),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Spacer(),
            Text(
              '\$${event.details.cost.values.first.toString()}/${event.details.cost.keys.first.toStringDuration()}',
              style: context.textTheme.bodyLarge,
            )
          ]),
          // if (event.scheduleType == ScheduleType.OnDemand)
          // if (event.scheduleType == ScheduleType.OneTime)
          // if (event.scheduleType == ScheduleType.Scheduled)
          if (event.schedule != null) Divider(),
          if (event.schedule != null)
            MezServiceOpenHours(schedule: event.schedule!),
        ],
      ),
    );
  }
}
