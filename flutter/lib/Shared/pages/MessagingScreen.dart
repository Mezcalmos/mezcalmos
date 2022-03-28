// input: chatId
// chat between chatId = orderId  customer<->deliveryAdmin
//              chatId != orderId deliveryAdmin<->dropOffDeliveryDriver
//              chatId != orderId deliveryAdmin<->pickupDeliveryDriver

// chat: {deliveryAdminDropOffDriver: 'dsfdsf', deliveryAdminPickupDriver: 'dsfs'}
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
// Extends GetView<MessagingController> after Nathik implements the controller
import 'package:intl/intl.dart' as intl;
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/messageController.dart';
import 'package:mezcalmos/Shared/helpers/ImageHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Chat.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:sizer/sizer.dart';

DateTime now = DateTime.now().toLocal();
String formattedDate = intl.DateFormat('dd-MM-yyyy').format(now);
dynamic _i18n() => Get.find<LanguageController>().strings["Shared"]["pages"]
    ["MessagingScreen"];

class MessagingScreen extends StatefulWidget {
  @override
  _MessagingScreenState createState() => _MessagingScreenState();
}

// TODO : REFACTORING !
class _MessagingScreenState extends State<MessagingScreen> {
  late final String? orderId;
  late final bool? showViewOrderBtn;

  late final String chatId;

  ParticipantType recipientType = ParticipantType.Customer;
  String? recipientId;
  MessageController controller =
      Get.put<MessageController>(MessageController());
  @override
  void initState() {
    super.initState();
    print("inside messaginScreen onInitState !");

    if (Get.parameters['chatId'] == null) {
      Get.snackbar("Error", "Does not have a valid chatId!");
      Get.back<void>();
    }
    chatId = Get.parameters['chatId']!;
    orderId = Get.parameters['orderId'];
    showViewOrderBtn = Get.arguments?['showViewOrderBtn'];
    if (Get.parameters['recipientId'] != null)
      recipientId = Get.parameters['recipientId'];
    else if (Get.parameters['recipientType'] != null) {
      recipientType =
          Get.parameters['recipientType']!.toString().toParticipantType();
    }
    controller.clearMessageNotifications(chatId: chatId);
    mezDbgPrint("@AYROUT ===> ${Get.parameters} | ORDERID ==> $orderId");
  }

  AuthController _authController = Get.find<AuthController>();

  TextEditingController _textEditingController = new TextEditingController();
  ScrollController _listViewScrollController = new ScrollController();
  RxList<Widget> chatLines = <Widget>[].obs;

  RxString _typedMsg = "".obs;

  void navigateToOrderPage() {
    final OrderType orderType =
        Get.find<OrderController>().getOrder(orderId!)!.orderType;
    switch (orderType) {
      case OrderType.Taxi:
        // offNamedUntil : to avoid loop of same routes being on stack: (WORKS)
        // TaxiOrderRoute -> Messages -> TaxiOrderRoute -> messages ... (~)

        // this only works when User is comming from Notification and currentRoute != orderViewScreen
        Get.offAndToNamed<void>(getTaxiOrderRoute(orderId!));
        break;
      case OrderType.Restaurant:
        // offNamedUntil : to avoid loop of same routes being on stack:
        // restaurantOrderRoute -> Messages -> restaurantOrderRoute -> messages ...
        Get.offNamedUntil<void>(
            getRestaurantOrderRoute(orderId!),
            (Route<dynamic> route) =>
                route.settings.name == getRestaurantOrderRoute(orderId!));
        break;
      case OrderType.Laundry:
        Get.snackbar("Launcdry order", "Oups not implemented yet!");
        break;
      default:
    }
  }

  Widget singleChatComponent({
    required String message,
    String? time,
    required bool isMe,
    // required BuildContext parentContext,
    String? userImage,
  }) =>
      Container(
        alignment: !isMe ? Alignment.centerLeft : Alignment.centerRight,
        padding: const EdgeInsets.all(5.0),
        child: Wrap(
            alignment: !isMe ? WrapAlignment.start : WrapAlignment.end,
            runAlignment: !isMe ? WrapAlignment.start : WrapAlignment.end,
            crossAxisAlignment: WrapCrossAlignment.start,
            textDirection: !isMe ? TextDirection.ltr : TextDirection.rtl,
            spacing: 10,
            clipBehavior: Clip.none,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border:
                        Border.all(color: Colors.grey.shade200, width: 0.5)),
                child: CircleAvatar(
                  radius: 23,
                  backgroundColor: Colors.grey.shade200,
                  backgroundImage: mLoadImage(
                          url: !isMe
                              ? userImage
                              : _authController.fireAuthUser?.photoURL,
                          assetInCaseFailed: aDefaultAvatar)
                      .image,
                ),
              ),
              Wrap(
                spacing: 5,
                direction: Axis.vertical,
                runAlignment: !isMe ? WrapAlignment.start : WrapAlignment.end,
                children: <Widget>[
                  Container(
                      constraints: BoxConstraints(
                          maxWidth: Get.width - 100, minWidth: 50),
                      padding: EdgeInsets.only(
                          left: 16, top: 8, bottom: 8, right: 16),
                      decoration: BoxDecoration(
                          color: !isMe
                              ? Color.fromRGBO(172, 89, 252, 1)
                              //? Theme.of(parentContext).primaryColorLight
                              : Colors.white,
                          borderRadius: !isMe
                              ? BorderRadius.only(
                                  topLeft: Radius.zero,
                                  topRight: Radius.circular(30),
                                  bottomRight: Radius.circular(30),
                                  bottomLeft: Radius.circular(20))
                              : BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.zero,
                                  bottomRight: Radius.circular(20),
                                  bottomLeft: Radius.circular(30))),
                      child: Text(
                        message,
                        softWrap: true,
                        style: TextStyle(
                            fontFamily: "Nunito",
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                            color: (isMe) ? Colors.black : Colors.white),
                      )),
                  time != null
                      ? Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Text(
                            time,
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontFamily: "Nunito",
                                fontSize: 10.sp,
                                color: Colors.black.withOpacity(0.8)),
                          ),
                        )
                      : SizedBox(),
                ],
              ),
            ]),
      );

  void scrollDown({Duration? mezChatScrollDuration}) {
    Timer(mezChatScrollDuration ?? Duration(milliseconds: 200), () {
      if (_listViewScrollController.hasClients)
        _listViewScrollController.jumpTo(
          _listViewScrollController.position.maxScrollExtent,
          // duration: Duration(seconds: 1),
          // curve: Curves.fastOutSlowIn
        );
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((Duration timeStamp) {
      scrollDown(mezChatScrollDuration: timeStamp);
    });
    void _fillCallBack() {
      chatLines.assignAll(controller.chat.value!.messages.map(
        (Message e) {
          // mezDbgPrint(
          //     " \t\t ${controller.value!.participants[e.userId]?.image}");
          return singleChatComponent(
            // parentContext: context,
            message: e.message,
            time: intl.DateFormat('hh:mm a').format(e.timeStamp!.toLocal()),
            isMe: e.userId == _authController.user!.id,
            userImage: controller.chat.value!.participants[e.userId]?.image,
          );
        },
      ));

      scrollDown();
    }

    controller.loadChat(chatId: chatId, onValueCallBack: _fillCallBack);

    return Scaffold(
        appBar: AppBar(
          title: (recipientType == ParticipantType.DeliveryAdmin)
              ? Text("Administrador")
              : Obx(
                  () => Text(
                    controller.recipient(recipientType: recipientType)?.name ??
                        "User",
                  ),
                ),
          actions: <Widget>[
            if (orderId != null && showViewOrderBtn == true)
              InkWell(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: Text(
                      "View\nOrder",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                onTap: navigateToOrderPage,
              )
          ],
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.1),
                  child: Center(
                    child: Text(formattedDate),
                  )),
              Expanded(
                child: Obx(
                  () => ListView(
                    shrinkWrap: true,
                    controller: _listViewScrollController,
                    children: List<Widget>.from(chatLines.reversed),
                  ),
                ),
              ),
              SendMessageBox(
                  typedMsg: _typedMsg,
                  textEditingController: _textEditingController,
                  controller: controller,
                  chatId: chatId,
                  orderId: orderId)
            ],
          ),
        ));
  }
}

class SendMessageBox extends StatelessWidget {
  const SendMessageBox(
      {Key? key,
      required RxString typedMsg,
      required TextEditingController textEditingController,
      required this.controller,
      this.orderId,
      required this.chatId})
      : _typedMsg = typedMsg,
        _textEditingController = textEditingController,
        super(key: key);

  final RxString _typedMsg;
  final TextEditingController _textEditingController;
  final MessageController controller;
  final String? orderId;
  final String chatId;
  @override
  Widget build(BuildContext context) {
    return TextField(
        onChanged: (String value) => _typedMsg.value = value,
        controller: _textEditingController,
        style:
            Theme.of(context).textTheme.subtitle1?.copyWith(fontSize: 14.5.sp),
        cursorColor: Colors.purple,
        scrollPadding: EdgeInsets.all(10),
        decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.all(30),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(borderSide: BorderSide.none),
            hintText: _i18n()['writeMsgPlaceholder'],
            hintStyle: Theme.of(context)
                .textTheme
                .subtitle1
                ?.copyWith(fontSize: 14.5.sp),
            suffixIcon: Padding(
              padding: const EdgeInsets.all(16),
              child: GestureDetector(
                onTap: () {
                  final bool msgReady2Send =
                      _textEditingController.text.replaceAll(' ', '').length >
                          0;
                  if (msgReady2Send) {
                    controller.sendMessage(
                        message: _typedMsg.value,
                        chatId: chatId,
                        orderId: orderId);
                    _textEditingController.clear();
                    _typedMsg.value = "";
                  } else {
                    _textEditingController.clear();
                    _typedMsg.value = "";
                  }
                },
                child: Obx(
                  () => Container(
                    child: Icon(
                      Icons.send,
                      size: 18,
                      color: Colors.white,
                    ),
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _typedMsg.value.length > 0
                          ? Color.fromRGBO(172, 89, 252, 1)
                          : Theme.of(context).primaryColorLight,
                    ),
                  ),
                ),
              ),
            )));
  }
}
