import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mezcalmos/CustomerApp/components/appbar.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Notification.dart' as notifs;
import 'package:mezcalmos/Shared/widgets/DateTitleComponent.dart';
import 'package:mezcalmos/Shared/widgets/MezDialogs.dart';

import '../widgets/MezClearButton.dart';

class ViewNotifications extends StatefulWidget {
  ViewNotifications({Key? key}) : super(key: key);

  @override
  _ViewNotificationsState createState() => _ViewNotificationsState();
}

class _ViewNotificationsState extends State<ViewNotifications> {
  // RxList<notifs.Notification> currentNotifs = RxList.empty();
  ForegroundNotificationsController controller =
      Get.find<ForegroundNotificationsController>();
  LanguageController lang = Get.find<LanguageController>();
  AuthController authController = Get.find<AuthController>();

  @override
  void initState() {
    mezDbgPrint("ListOfNotifs : onInit");
    super.initState();
  }

// TODO remove static list and use the one comming from thee controller
// TODO add obx
  List<notifs.Notification> myNotifs = [
    notifs.Notification(
        id: '55',
        timestamp: DateTime.now(),
        title: 'The restaurant is preparing the order',
        body: 'Restaurant name start preparing your order',
        imgUrl:
            'assets/images/customer/assets/images/shared/notifications/onTheWayOrderNotificationIcon.png',
        linkUrl: 'linkUrl',
        notificationType: notifs.NotificationType.OrderStatusChange,
        notificationAction: notifs.NotificationAction.ShowPopUp),
    notifs.Notification(
        id: '55',
        timestamp: DateTime.now(),
        title: 'Your order is ready for pickup',
        body: 'Restaurant name start preparing your order',
        imgUrl:
            'assets/images/customer/assets/images/shared/notifications/droppedOrderNotificationIcon.png',
        linkUrl: 'linkUrl',
        notificationType: notifs.NotificationType.OrderStatusChange,
        notificationAction: notifs.NotificationAction.ShowPopUp),
    notifs.Notification(
        id: '55',
        timestamp: DateTime(2021, 12, 13),
        title: 'Your order is ready for pickup',
        body: 'Restaurant name start preparing your order',
        imgUrl:
            'assets/images/customer/assets/images/shared/notifications/prepareOrderNotificationIcon.png',
        linkUrl: 'linkUrl',
        notificationType: notifs.NotificationType.OrderStatusChange,
        notificationAction: notifs.NotificationAction.ShowPopUp),
  ];

  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    return Scaffold(
      appBar: CustomerAppBar(
        title: lang.strings['shared']['notification']['title'],
        autoBack: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              // TODO is the clear button needed ??
              ClearNotifButton(),
              SizedBox(
                height: 5,
              ),
              // TODO change the notif list to obx
              _buildNotification(myNotifs)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNotification(List<notifs.Notification> notifications) {
    var dd = DateTime.now();
    List<Widget> myWidgets = [];
    return Column(
      children: notifications.fold<List<Widget>>(<Widget>[],
          (children, notification) {
        if (dd.isSameDate(notification.timestamp)) {
          myWidgets.addAll([
            NotifCard(
              notification: notification,
            ),
            SizedBox(
              height: 5,
            )
          ]);
        } else {
          dd = notification.timestamp;
          myWidgets.add(DateTitleComponent(
            date: "${ff.format(dd.toLocal())}",
            dateIcon: FaIcon(
              FontAwesomeIcons.calendarAlt,
              size: 13.sp,
            ),
          ));
          if (dd.isSameDate(notification.timestamp)) {
            myWidgets.addAll([
              NotifCard(
                notification: notification,
              ),
              SizedBox(
                height: 5,
              )
            ]);
          }
        }

        children = myWidgets;
        return children;
      }),
    );
  }
}

class ClearNotifButton extends StatelessWidget {
  ClearNotifButton({
    Key? key,
  }) : super(key: key);

  ForegroundNotificationsController controller =
      Get.find<ForegroundNotificationsController>();
  LanguageController lang = Get.find<LanguageController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => (controller.notifications.value.length <= 0)
          ? Container()
          : Container(
              alignment: Alignment.centerRight,
              child: MezClearButton(
                onTapFunction: () async {
                  YesNoDialogButton yesNoRes = await cancelAlertDialog(
                      title:
                          "${lang.strings["shared"]["notification"]["alertClearNotification"]["title"]}",
                      body:
                          "${lang.strings["shared"]["notification"]["alertClearNotification"]["title"]}",
                      icon: Container(
                        child: Icon(
                          Icons.highlight_off,
                          size: 65,
                          color: Color(0xffdb2846),
                        ),
                      ));

                  if (yesNoRes == YesNoDialogButton.Yes) {
                    controller.clearAllNotification();
                    Get.back();
                  }
                },
              ),
            ),
    );
  }
}

class NotifCard extends StatelessWidget {
  const NotifCard({
    Key? key,
    required this.notification,
  }) : super(key: key);

  final notifs.Notification notification;

  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          Get.toNamed(notification.linkUrl);
        },
        child: Ink(
          padding: const EdgeInsets.all(8),
          width: double.infinity,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 25,

                    backgroundColor: Colors.transparent,
                    // TODO implement the real image
                    backgroundImage: AssetImage(notification.imgUrl),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          notification.title,
                          style: txt.bodyText1,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          notification.body,
                          style: txt.bodyText2,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Divider(
                thickness: 0.2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Ionicons.time_outline,
                    size: 14.sp,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "${f.format(notification.timestamp.toLocal())}",
                    style: txt.subtitle1,
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 14.sp,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

extension DateOnlyCompare on DateTime {
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}

final f = new DateFormat('hh:mm a');
final ff = new DateFormat('MM.dd.yyyy');
