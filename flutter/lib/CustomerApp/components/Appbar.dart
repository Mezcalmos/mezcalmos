import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/widgets/UsefulWidgets.dart';

class CustomerAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool? autoBack;

  CustomerAppBar({Key? key, this.title, this.autoBack = false})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);
  @override
  final Size preferredSize;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: (title != null)
          ? Text(
              title!,
              style: Theme.of(context).textTheme.headline2,
            )
          : Container(
              alignment: Alignment.center,
              width: 180,
              child: FittedBox(
                child: MezcalmosSharedWidgets.fillTitle(1),
              ),
            ),
      automaticallyImplyLeading: autoBack ?? false,
      leading: _BackButtonAppBar(),
      actions: [
        Obx(
          () => (Get.find<ForegroundNotificationsController>()
                  .notifications
                  .isNotEmpty)
              ? _notificationAppBarIcon()
              : Container(),
        ),
        _ordersAppBarIcon(),
      ],
    );
  }

  Widget _BackButtonAppBar() {
    return Transform.scale(
      scale: 0.6,
      child: InkWell(
        onTap: () {
          Get.back();
        },
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 216, 225, 249),
                spreadRadius: 0,
                blurRadius: 7,
                offset: Offset(0, 7), // changes position of shadow
              ),
            ],
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 97, 127, 255),
              Color.fromARGB(255, 198, 90, 252),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _ordersAppBarIcon() {
    return Padding(
      padding: const EdgeInsets.only(left: 3, right: 12),
      child: InkWell(
        customBorder: CircleBorder(),
        onTap: () {
          Get.toNamed(kOrdersRoute);
        },
        child: Ink(
          padding: const EdgeInsets.all(7),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: lightCustomerAppColor,
          ),
          child: Icon(
            Icons.watch_later,
            size: 20,
            color: customerAppColor,
          ),
        ),
      ),
    );
  }

  Widget _notificationAppBarIcon() {
    return Padding(
      padding: const EdgeInsets.only(left: 3, right: 3),
      child: InkWell(
        customBorder: CircleBorder(),
        onTap: () {
          Get.toNamed(kNotificationsRoute);
        },
        child: Badge(
          badgeColor: Colors.red,
          showBadge: true,
          position: BadgePosition.topEnd(top: 10, end: 0),
          child: Ink(
            padding: const EdgeInsets.all(7),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: lightCustomerAppColor,
            ),
            child: Icon(
              Icons.notifications,
              size: 20,
              color: customerAppColor,
            ),
          ),
        ),
      ),
    );
  }
}
