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
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/messageController.dart';
import 'package:mezcalmos/Shared/helpers/ImageHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Chat.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
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
  late final String? orderLink;
  late final String? orderId;
  late final String chatId;

  ParticipantType recipientType = ParticipantType.Customer;
  // ParticipantType? senderType;
  String? recipientId;
  MessageController controller =
      Get.put<MessageController>(MessageController());
  @override
  void initState() {
    print("inside messaginScreen onInitState !");

    if (Get.parameters['chatId'] == null) {
      Get.snackbar("Error", "Does not have a valid chatId!");
      Get.back<void>();
    }
    chatId = Get.parameters['chatId']!;
    orderLink = Get.parameters['orderLink'];
    orderId = Get.parameters['orderId'];
    if (Get.parameters['recipientId'] != null)
      recipientId = Get.parameters['recipientId'];
    else if (Get.parameters['recipientType'] != null) {
      recipientType =
          Get.parameters['recipientType']!.toString().toParticipantType();
    }
    controller.clearMessageNotifications(chatId: chatId);
    mezDbgPrint("@AYROUT ===> ${Get.parameters} | orderLink ==> $orderLink");

    super.initState();
  }

  AuthController _authController = Get.find<AuthController>();

  TextEditingController _textEditingController = new TextEditingController();
  ScrollController _listViewScrollController = new ScrollController();
  RxList<Widget> chatLines = <Widget>[].obs;

  RxString _typedMsg = "".obs;

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
                              ? primaryBlueColor
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
    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
      scrollDown(mezChatScrollDuration: timeStamp);
    });
    void _fillCallBack() {
      chatLines.assignAll(controller.chat.value!.messages.map(
        (Message message) {
          // mezDbgPrint(
          //     " \t\t ${controller.value!.participants[e.userId]?.image}");
          return singleChatComponent(
            // parentContext: context,
            message: message.message,
            time:
                intl.DateFormat('hh:mm a').format(message.timestamp.toLocal()),
            isMe: message.userId == _authController.user!.id,
            userImage: controller.chat.value!
                .getParticipant(message.participantType, message.userId)
                ?.image,
          );
        },
      ));

      scrollDown();
    }

    controller.loadChat(chatId: chatId, onValueCallBack: _fillCallBack);
    return Scaffold(
        appBar: mezcalmosAppBar(
          AppBarLeftButtonType.Back,
          onClick: Get.back,
          titleWidget: Obx(
            () {
              return (controller
                          .recipient(recipientType: recipientType)
                          ?.participantType ==
                      ParticipantType.DeliveryAdmin)
                  ? Text("Administrador")
                  : Text(
                      controller
                              .recipient(
                                  recipientType: recipientType,
                                  recipientId: recipientId)
                              ?.name ??
                          "User",
                    );
            },
          ),
          actionIcons: <Widget>[
            if (orderLink != null)
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
                  onTap: () => Get.toNamed<void>(orderLink!))
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
      required this.chatId,
      this.orderId})
      : _typedMsg = typedMsg,
        _textEditingController = textEditingController,
        super(key: key);

  final RxString _typedMsg;

  final TextEditingController _textEditingController;
  final MessageController controller;
  final String chatId;
  final String? orderId;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Flexible(
            child: TextField(
                onChanged: (String value) => _typedMsg.value = value,
                controller: _textEditingController,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    ?.copyWith(fontSize: 14.5.sp),
                cursorColor: primaryBlueColor,
                scrollPadding: EdgeInsets.all(10),
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.all(8),
                  filled: true,
                  fillColor: secondaryBlueColor,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(16)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(16)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(16)),
                  hintText: _i18n()['writeMsgPlaceholder'],
                  hintStyle: Theme.of(context)
                      .textTheme
                      .subtitle1
                      ?.copyWith(fontSize: 14.5.sp),
                )),
          ),
          Transform.rotate(
            angle: 6,
            child: Padding(
              padding: const EdgeInsets.all(5),
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
                      color: _typedMsg.value.length > 0
                          ? primaryBlueColor
                          : Colors.white,
                    ),
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _typedMsg.value.length > 0
                          ? secondaryBlueColor
                          : Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
