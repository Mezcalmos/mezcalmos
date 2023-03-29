import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/messageController.dart';
import 'package:mezcalmos/Shared/helpers/ImageHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Chat.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/routes/sharedRoutes.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';
import 'package:mezcalmos/Shared/widgets/ThreeDotsLoading.dart';
import 'package:url_launcher/url_launcher.dart';

DateTime now = DateTime.now().toLocal();
String formattedDate = intl.DateFormat('dd-MM-yyyy').format(now);

dynamic _i18n() => Get.find<LanguageController>().strings["Shared"]["pages"]
    ["MessagingScreen"];

class BaseMessagingScreen extends StatefulWidget {
  @override
  BaseMessagingScreenState createState() => BaseMessagingScreenState();

  static Future<void> navigate({required int chatId}) {
    return MezRouter.toPath(
        SharedRoutes.kMessagesRoute.replaceAll(":chatId", chatId.toString()));
  }
}

class BaseMessagingScreenState extends State<BaseMessagingScreen> {
  late final int chatId;
  ParticipantType recipientType = ParticipantType.Customer;
  String? recipientId;
  MessageController controller =
      Get.put<MessageController>(MessageController());
  bool isChatLoaded = false;
  AuthController _authController = Get.find<AuthController>();

  TextEditingController _textEditingController = new TextEditingController();
  ScrollController _listViewScrollController = new ScrollController();
  RxList<Widget> chatLines = <Widget>[].obs;

  @override
  void initState() {
    if (MezRouter.urlArguments['chatId'] == null) {
      customSnackBar(
        title: 'Error',
        subTitle: 'Does not have a valid chatId!',
      );
      MezRouter.back();
    }

    chatId = int.parse(MezRouter.urlArguments['chatId'].toString());
  
     if (MezRouter.urlArguments['recipientType'] != null) {
      recipientType = MezRouter.urlArguments['recipientType']!
          .toString()
          .toParticipantType(); }
    controller.clearMessageNotifications(chatId: chatId); 
    // mezDbgPrint("@AYROUT ===> ${Get.parameters} | orderLink ==> $orderLink");
    controller.loadChat(chatId: chatId, onValueCallBack: _fillCallBack);
    setState(() {
      isChatLoaded = true;
    });

    super.initState();
  }
  

  @override
  void dispose() {
    // safe dispose of the engine, only when it was instanciated.
    super.dispose();
  }

  RxString _typedMsg = "".obs;

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

  void _fillCallBack() {
    chatLines.assignAll(controller.chat.value!.messages.map(
      (Message message) {
        return singleChatComponent(
          message: message.message,
          time: intl.DateFormat('hh:mm a').format(message.timestamp.toLocal()),
          isMe: message.userId == _authController.user!.hasuraId,
          userImage: getchatImg(message),
        );
      },
    ));
    scrollDown();
  }

  String? getchatImg(Message message) {
    final Participant? messageSender = controller.chat.value?.participant
        .firstWhereOrNull(
            (Participant element) => element.id == message.userId);
    if (messageSender?.participantType == recipientType) {
      return controller.chat.value!.chatInfo.chatImg;
    } else
      return messageSender?.image;
  }

  /// Using this for now, to limit the calls only between deliveryDrivers<->Customers
  // bool isReciepientNotAdmin() {
  //   final ParticipantType? _pType =
  //       controller.recipient(recipientType: recipientType)?.participantType;
  //   return [ParticipantType.Customer, ParticipantType.DeliveryDriver]
  //       .contains(_pType);
  // }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
      scrollDown(mezChatScrollDuration: timeStamp);
    });

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 253, 249, 249),
      appBar: AppBar(
        centerTitle: true,
        leading: Center(
          child: GestureDetector(
            onTap: () => MezRouter.back(),
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 97, 127, 255),
                    Color.fromARGB(255, 198, 90, 252),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.white,
                size: 15,
              ),
            ),
          ),
        ),
        title: Obx(
          () {
            return controller.chat.value?.chatInfo.chatTite == null
                ? ThreeDotsLoading()
                : Text(
                    controller.chat.value!.chatInfo.chatTite,
                    style: context.txt.displaySmall,
                  );
          },
        ),
        // actions: <Widget>[
        //   _callButton(context),

        //   // )
        // ],
      ),
      body: isChatLoaded
          ? Container(
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10.1),
                        child: Center(
                          child: Text(formattedDate),
                        ),
                      ),
                      Obx(() {
                        mezDbgPrint("Linkkkkkkkk ⏰");
                        mezDbgPrint(
                            "${controller.chat.value?.chatInfo.parentlink}");
                        if (MezRouter.isRouteInStack(
                            controller.chat.value?.chatInfo.parentlink)) {
                          return SizedBox();
                        } else {
                          return Center(
                            child: InkWell(
                              borderRadius: BorderRadius.circular(10),
                              onTap: () {
                                MezRouter.toNamed(
                                  controller.chat.value!.chatInfo.parentlink,
                                );
                              },
                              child: Ink(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 6),
                                  child: Text(
                                    "${_i18n()['viewOrder']}",
                                    style: context.txt.bodyLarge
                                        ?.copyWith(color: primaryBlueColor),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }
                      }),
                      Expanded(
                        child: Obx(
                          () => ListView(
                            shrinkWrap: true,
                            controller: _listViewScrollController,
                            children: List.from(chatLines),
                          ),
                        ),
                      ),
                      SendMessageBox(
                        typedMsg: _typedMsg,
                        textEditingController: _textEditingController,
                        controller: controller,
                        chatId: chatId,
                        // orderId: orderId,
                      )
                    ],
                  ),
                ],
              ),
            )
          : MezLogoAnimation(
              centered: true,
            ),
    );
  }

  void callAgora() {}

  Container _callButton(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {
          if (controller.chat.value?.chatInfo.phoneNumber != null) {
            _callBottomSheet(context);
          } else {
            callAgora();
          }
        },
        child: Container(
          width: 30,
          height: 30,
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: secondaryLightBlueColor,
          ),
          child: Center(
            child: FittedBox(
              child: Icon(
                Icons.call,
                color: primaryBlueColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> _callBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ), //for giving border to datePickerSheet
      ),
      context: context,
      isDismissible: true,
      builder: (BuildContext context) {
        return Container(
          margin: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () {
                  callAgora();
                  MezRouter.back();
                },
                child: Ink(
                    padding: const EdgeInsets.all(6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.phone_android_sharp,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text("${_i18n()['callApp']}",
                            style: context.txt.bodyLarge)
                      ],
                    )),
              ),
              Divider(),
              InkWell(
                onTap: () async {
                  final Uri launchUri = Uri(
                    scheme: 'tel',
                    path: controller.chat.value?.chatInfo.phoneNumber,
                  );
                  mezDbgPrint(await canLaunchUrl(launchUri));
                  if (await canLaunchUrl(launchUri)) {
                    await launchUrl(launchUri);
                    await MezRouter.back();
                  }
                },
                child: Ink(
                    padding: const EdgeInsets.all(6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.phone,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text("${_i18n()['callPhone']}",
                            style: context.txt.bodyLarge)
                      ],
                    )),
              ),
              Divider(),
              InkWell(
                onTap: () {
                  MezRouter.back();
                },
                child: Ink(
                    padding: const EdgeInsets.all(6),
                    width: double.infinity,
                    child: Text(
                      "${_i18n()['cancel']}",
                      textAlign: TextAlign.center,
                      style: context.txt.bodyLarge?.copyWith(color: Colors.red),
                    )),
              ),
            ],
          ),
        );
      },
    );
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
                          url: !isMe ? userImage : _authController.user?.image,
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
                              ? Color.fromRGBO(225, 228, 255, 1)
                              //? Theme.of(parentContext).primaryColorLight
                              : Color.fromRGBO(103, 121, 254, 1),
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
                      child: InkWell(
                        onLongPress: () {
                          Clipboard.setData(ClipboardData(text: message))
                              .then((_) => MezSnackbar("copied", ""));
                        },
                        child: Text(
                          message,
                          softWrap: true,
                          style: TextStyle(
                            fontFamily: "Nunito",
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: isMe ? Colors.white : Colors.black,
                          ),
                        ),
                      )),
                  time != null
                      ? Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Text(
                            time,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontFamily: "Nunito",
                              fontSize: 12,
                              color: Color.fromRGBO(120, 120, 120, 1),
                            ),
                          ),
                        )
                      : SizedBox(),
                ],
              ),
            ]),
      );
}

class SendMessageBox extends StatelessWidget {
  const SendMessageBox({
    Key? key,
    required RxString typedMsg,
    required TextEditingController textEditingController,
    required this.controller,
    required this.chatId,
    // this.orderType,
    // this.orderId
  })  : _typedMsg = typedMsg,
        _textEditingController = textEditingController,
        super(key: key);

  final RxString _typedMsg;

  final TextEditingController _textEditingController;
  final MessageController controller;
  final int chatId;

  // final String? orderId;
  // final OrderType? orderType;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: EdgeInsets.symmetric(horizontal: 10),
      color: Colors.white,
      width: double.infinity,
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              fit: FlexFit.tight,
              flex: 7,
              child: Container(
                clipBehavior: Clip.hardEdge,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(240, 241, 255, 1),
                  borderRadius: BorderRadius.circular(75),
                ),
                child: TextFormField(
                  maxLines: 1,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(14),
                    alignLabelWithHint: true,
                    hintStyle: TextStyle(
                      color: Color.fromRGBO(120, 120, 120, 1),
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Nunito',
                    ),
                    fillColor: secondaryLightBlueColor,
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    hintText: _i18n()['writeMsgPlaceholder'],
                  ),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Nunito',
                  ),
                  controller: _textEditingController,
                  onChanged: (String value) {
                    _typedMsg.value = value;
                  },
                ),
              ),
            ),
            SizedBox(width: 10),
            InkWell(
              customBorder: CircleBorder(),
              onTap: () {
                final bool msgReady2Send =
                    _textEditingController.text.replaceAll(' ', '').length > 0;
                if (msgReady2Send) {
                  controller.sendMessage(
                    message: _typedMsg.value,
                    chatId: chatId,
                    // orderId: orderId,
                    // orderType: orderType,
                  );
                  _textEditingController.clear();
                  _typedMsg.value = "";
                } else {
                  _textEditingController.clear();
                  _typedMsg.value = "";
                }
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        secondaryLightBlueColor //Color.fromRGBO(240, 241, 255, 1),
                    ),
                child: Center(
                  child: Icon(
                    Icons.near_me,
                    size: 28,
                    color: Color.fromRGBO(103, 121, 254, 1),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}