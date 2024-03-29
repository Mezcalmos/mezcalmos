import 'package:badges/badges.dart' as badge;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/pages/AuthScreens/SignInScreen.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/routes/sharedRoutes.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class MezSliverAppBar extends StatelessWidget {
  const MezSliverAppBar({
    Key? key,
    required this.title,
    required this.image,
    this.ordersRoute,
  }) : super(key: key);

  final String title;
  final String? image;
  final String? ordersRoute;

  static final Language userLanguage =
      Get.find<LanguageController>().userLanguageKey;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).primaryColorLight,
      elevation: 0.4,
      expandedHeight: (image != null) ? 220 : 0,
      automaticallyImplyLeading: false,
      titleSpacing: 12,
      leadingWidth: 35,
      leading: _BackButtonAppBar(),
      actions: <Widget>[
        getAppbarIconsButton(),
      ],
      pinned: true,
      floating: false,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        centerTitle: true,
        title: Container(
          width: 55.w,
          padding: const EdgeInsets.only(bottom: 4),
          child: Text(
            title.inCaps,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context)
                .textTheme
                .displaySmall!
                .copyWith(fontSize: 13.sp, color: Colors.white),
          ),
        ),
        background: (image != null)
            ? CachedNetworkImage(
                imageUrl: image!,
                fit: BoxFit.cover,
                imageBuilder:
                    (BuildContext context, ImageProvider<Object> image) =>
                        Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  foregroundDecoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[
                        Colors.black.withOpacity(0.7),
                        const Color(0x00000000).withOpacity(0.1),
                        Colors.black.withOpacity(0.7),
                      ],
                    ),
                  ),
                ),
                placeholder: (_, __) {
                  return Shimmer.fromColors(
                    child: Container(
                      color: Colors.grey,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                    highlightColor: Colors.grey[400]!,
                    enabled: true,
                    //   period: Duration(milliseconds: 100),
                    baseColor: Colors.grey[300]!,
                    direction: ShimmerDirection.ltr,
                  );
                },
              )
            : null,
      ),
    );
  }

  Widget _BackButtonAppBar() {
    return Container(
      margin: EdgeInsets.only(left: 5),
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: InkWell(
          onTap: () {
            MezRouter.back();
          },
          child: Ink(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: Colors.white),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Icon(
                Icons.arrow_back_ios_new,
                color: primaryBlueColor,
                size: 15,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _ordersAppBarIcon() {
    if (ordersRoute != null) {
      return Padding(
        padding: const EdgeInsets.only(left: 3, right: 12),
        child: InkWell(
          customBorder: CircleBorder(),
          onTap: () {
            MezRouter.toNamed(ordersRoute!);
          },
          child: Ink(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Icon(
              Icons.watch_later,
              size: 20,
              color: primaryBlueColor,
            ),
          ),
        ),
      );
    } else {
      return SizedBox();
    }
  }

  Widget _noUserButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 3, right: 16),
      child: InkWell(
        customBorder: CircleBorder(),
        onTap: () {
          SignInView.navigateAtOrderTime();
        },
        child: Ink(
          padding: const EdgeInsets.all(7),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: Icon(
            Icons.person,
            size: 20,
            color: primaryBlueColor,
          ),
        ),
      ),
    );
  }

  Widget _notificationAppBarIcon() {
    return Obx(() {
      if (Get.find<ForegroundNotificationsController>().notifications.length >
          0) {
        return Padding(
          padding: const EdgeInsets.only(left: 3, right: 7),
          child: InkWell(
            customBorder: CircleBorder(),
            onTap: () {
              MezRouter.toNamed(SharedRoutes.kNotificationsRoute);
            },
            child: badge.Badge(
              badgeColor: Colors.red,
              showBadge: true,
              position: badge.BadgePosition.topEnd(top: 0, end: 0),
              child: Ink(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Icon(
                  Icons.notifications,
                  color: primaryBlueColor,
                  size: 20,
                ),
              ),
            ),
          ),
        );
      } else {
        return Container();
      }
    });
  }

  Widget getAppbarIconsButton() {
    return Row(
      children: [
        if (!Get.find<AuthController>().isUserSignedIn) _noUserButton(),
        if (Get.find<AuthController>().isUserSignedIn)
          _notificationAppBarIcon(),
        if (Get.find<AuthController>().isUserSignedIn) _ordersAppBarIcon(),
      ],
    );
  }
}
