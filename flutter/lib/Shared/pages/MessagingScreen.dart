// input: chatId
// chat between chatId = orderId  customer<->deliveryAdmin
//              chatId != orderId deliveryAdmin<->dropOffDeliveryDriver
//              chatId != orderId deliveryAdmin<->pickupDeliveryDriver

// chat: {deliveryAdminDropOffDriver: 'dsfdsf', deliveryAdminPickupDriver: 'dsfs'}
import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
// Extends GetView<MessagingController> after Nathik implements the controller
import 'package:intl/intl.dart' as intl;
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/Agora/agoraController.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/messageController.dart';
import 'package:mezcalmos/Shared/helpers/ImageHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Utilities/Chat.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';

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
  late final OrderType? orderType;
  late final String? orderId;
  late final String chatId;
  Rxn<Sagora> sagora = Rxn();
  ParticipantType recipientType = ParticipantType.Customer;
  // ParticipantType? senderType;
  String? recipientId;
  MessageController controller =
      Get.put<MessageController>(MessageController());
  bool isChatLoaded = false;
  @override
  void initState() {
    // Instanciating the Agaora controller in case the user is able to call:
    if (controller.isUserAuthorizedToCall()) {
      sagora.value = Get.find<Sagora>();
    }

    if (Get.parameters['chatId'] == null) {
      Get.snackbar("Error", "Does not have a valid chatId!");
      MezRouter.back<void>();
    }

    chatId = Get.parameters['chatId']!;
    orderLink = Get.parameters['orderLink'];
    orderId = Get.parameters['orderId'];
    orderType = Get.parameters['orderType']?.toString().toOrderType();
    if (Get.parameters['recipientId'] != null)
      recipientId = Get.parameters['recipientId'];
    else if (Get.parameters['recipientType'] != null) {
      recipientType =
          Get.parameters['recipientType']!.toString().toParticipantType();
    }
    controller.clearMessageNotifications(chatId: chatId);
    mezDbgPrint("@AYROUT ===> ${Get.parameters} | orderLink ==> $orderLink");
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

  AuthController _authController = Get.find<AuthController>();

  TextEditingController _textEditingController = new TextEditingController();
  ScrollController _listViewScrollController = new ScrollController();
  RxList<Widget> chatLines = <Widget>[].obs;

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
          isMe: message.userId == _authController.user!.id,
          userImage: controller.chat.value!
              .getParticipant(message.participantType, message.userId)
              ?.image,
        );
      },
    ));
    scrollDown();
  }

  /// Using this for now, to limit the calls only between deliveryDrivers<->Customers
  bool isReciepientAuthorizedToCall() {
    final ParticipantType? _pType =
        controller.recipient(recipientType: recipientType)?.participantType;
    return [ParticipantType.Customer, ParticipantType.DeliveryDriver]
        .contains(_pType);
  }

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
            onTap: () => MezRouter.back<void>(closeOverlays: true),
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
            return (controller
                        .recipient(recipientType: recipientType)
                        ?.participantType ==
                    ParticipantType.DeliveryAdmin)
                ? Text(
                    "Administrador",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  )
                : Text(
                    controller
                            .recipient(
                                recipientType: recipientType,
                                recipientId: recipientId)
                            ?.name ??
                        "User",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  );
          },
        ),
        actions: <Widget>[
          if (orderLink != null)
            InkWell(
              child: Container(
                width: 60,
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.symmetric(horizontal: 7, vertical: 12),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(225, 228, 255, 1),
                  borderRadius: BorderRadius.circular(14.9),
                ),
                child: Center(
                  child: Text(
                    "order",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(103, 121, 254, 1),
                    ),
                  ),
                ),
              ),
              onTap: () => MezRouter.toNamed<void>(orderLink!),
            ),
          Obx(
            () => Container(
              child: controller.isUserAuthorizedToCall() &&
                      isReciepientAuthorizedToCall() &&
                      sagora.value != null
                  ? InkWell(
                      onTap: () async => _onCallPress(),
                      child: Container(
                        width: 30,
                        height: 30,
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.only(right: 7),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(103, 121, 254, 1),
                        ),
                        child: Center(
                          child: FittedBox(
                            child: Icon(
                              Icons.call,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    )
                  : SizedBox(),
            ),
          )
        ],
      ),
      body: isChatLoaded
          ? Container(
              child: Stack(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.1),
                        child: Center(
                          child: Text(formattedDate),
                        ),
                      ),
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
                        orderId: orderId,
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

  Future<void> _onCallPress() async {
    // all the none-null forcing used down below, are garanteed to work 100%
    // and will never throw a null check error/exception.
    if (await sagora.value!.checkAgoraPermissions()) {
      mezDbgPrint("#############----1-----######");
      ParticipantType _calleeType = ParticipantType.DeliveryDriver;
      switch (controller.appType) {
        case AppType.DeliveryApp:
          _calleeType = ParticipantType.Customer;
          break;
        default:
      }
      mezDbgPrint("#############----2-----######");
      mezDbgPrint(_calleeType);
      // we get the one We're trying to call first.
      final Participant? _recipient = controller.recipient(
        recipientType: _calleeType,
      );
      mezDbgPrint("1 [RECIPIENT::calleeType ] $_calleeType");

      if (_recipient != null) {
        await controller.callUser(
          chatId: chatId,
          callee: _recipient,
          orderId: orderId,
        );
        mezDbgPrint("3 - sender id ${controller.sender()?.id}");
        mezDbgPrint("3 - sender name ${controller.sender()?.participantType}");

        // Request Agora auth

        final dynamic _agoraAuth = (await sagora.value!.getAgoraToken(
          chatId,
          controller.sender()!.id,
          controller.sender()!.participantType,
        ))
            .snapshot
            .value;

        mezDbgPrint("4 - A_agoraAuth $_agoraAuth");

        // then we join if it's not null && it's not expired
        if (_agoraAuth != null) {
          mezDbgPrint("AgoraAuth  :: passed validation test !");
          // await FlutterCallkitIncoming.startCall(chatId);
          // then join channel
          // ignore: unawaited_futures
          await sagora.value!.handleIfInChannelAlready();

          // ignore: unawaited_futures
          sagora.value!
              .joinChannel(
            token: _agoraAuth['token'],
            channelId: chatId,
            uid: _agoraAuth['uid'],
          )
              .then((value) {
            mezDbgPrint(
                "[][][] MessageScreen :: sagora.joinChannel :: done ! ==> pushing to AgoraCall Screen !!!!");

            sagora.value!.callStatus.value = CallStatus.calling;
            MezRouter.toNamed<void>(kAgoraCallScreen, arguments: {
              "chatId": chatId,
              "talkingTo": _recipient,
            });
          }).onError((Object? error, StackTrace stackTrace) {
            mezDbgPrint("Error ===> $error | $stackTrace");
            sagora.value!.callStatus.value = CallStatus.none;
          });
        } else {
          sagora.value!.callStatus.value = CallStatus.none;
        }
      }
    } else {
      mezDbgPrint("AGORA :: PERMISSIONS :: NOT :: DONE ");
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
  const SendMessageBox(
      {Key? key,
      required RxString typedMsg,
      required TextEditingController textEditingController,
      required this.controller,
      required this.chatId,
      this.orderType,
      this.orderId})
      : _typedMsg = typedMsg,
        _textEditingController = textEditingController,
        super(key: key);

  final RxString _typedMsg;

  final TextEditingController _textEditingController;
  final MessageController controller;
  final String chatId;
  final String? orderId;
  final OrderType? orderType;
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
                      orderId: orderId,
                      orderType: orderType);
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
                child: Transform.rotate(
                  angle: -math.pi / 5.0,
                  child: Center(
                    child: Icon(
                      Icons.send,
                      size: 28,
                      color: Color.fromRGBO(103, 121, 254, 1),
                    ),
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
