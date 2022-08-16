import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/Agora/agoraController.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/messageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Chat.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';

class AgoraCall extends StatefulWidget {
  @override
  State<AgoraCall> createState() => _AgoraCallState();
}

class _AgoraCallState extends State<AgoraCall> {
  final MessageController _msgController = MessageController();
  final Sagora _sagora = Get.find<Sagora>();
  final Participant? talkingTo = Get.arguments?['talkingTo'] as Participant?;
  final String chatId = Get.arguments?['chatId'];
  // used for call timing
  Timer? callTimer;
  RxInt callSeconds = 0.obs;

  @override
  void initState() {
    initCallTimer();
    super.initState();
  }

  @override
  void dispose() {
    _sagora.callAction.value = CallStatus.none;
    resetTimer();
    super.dispose();
  }

  void resetTimer() {
    callTimer?.cancel();
    callSeconds.value = 0;
  }

  String formatTime(int seconds) {
    return '${(Duration(seconds: seconds))}'.split('.')[0].padLeft(8, '0');
  }

  Future<void> initCallTimer() async {
    callTimer = Timer.periodic(Duration(seconds: 1), (Timer _subTimer) {
      callSeconds.value += 1;
      if (callSeconds.value == 60 &&
          _sagora.callAction.value == CallStatus.calling) {
        _sagora.callAction.value = CallStatus.timedOut;
        _subTimer.cancel();
        resetTimer();
        return;
      } else if (callSeconds.value >= 300) {
        // Max of 5mins call
        // endCall
        _subTimer.cancel();
        resetTimer();

        _msgController.endCall(
          chatId: chatId,
          callee: talkingTo!,
        );
        _sagora.engine.leaveChannel();
        _sagora.callAction.value = CallStatus.none;
        // Get.back<void>();
        MezSnackbar("Oops", "You have reached max time for your call!");
      } else if (_sagora.callAction.value == CallStatus.none) {
        _subTimer.cancel();
        resetTimer();
        return;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    mezDbgPrint("TalkingTo : ${talkingTo.toString()}");
    mezDbgPrint("ChatId : $chatId");
    return Obx(
      () => WillPopScope(
        onWillPop: () async =>
            Future<bool>.value(_sagora.callAction.value == CallStatus.none),
        child: Scaffold(
          body: Container(
            height: Get.height,
            width: Get.width,
            color: Colors.black,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 140,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade400,
                          shape: BoxShape.circle,
                          image: talkingTo?.image != null
                              ? DecorationImage(
                                  fit: BoxFit.cover,
                                  image: Image.network(talkingTo!.image).image,
                                )
                              : null,
                        ),
                        child: Center(
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: Icon(
                              Icons.person,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        _getCallStatusText(),
                        style: Get.textTheme.bodyText1?.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      if (_sagora.callAction.value == CallStatus.inCall) ...[
                        SizedBox(
                          height: 10,
                        ),
                        Text(formatTime(callSeconds.value))
                      ],
                      SizedBox(height: 10),
                      Text(
                        talkingTo?.name ?? "_",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Montserrat',
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 100,
                  child: Container(
                    width: Get.width,
                    child: Flex(
                      direction: Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: _getControlButtons(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _getCallStatusText() {
    switch (_sagora.callAction.value) {
      case CallStatus.inCall:
        return 'In call with';
      case CallStatus.calling:
        return 'Calling ...';
      case CallStatus.none:
        return 'Call ended';
      case CallStatus.timedOut:
        return "No answer from";
    }
  }

  List<Widget> _getControlButtons() {
    switch (_sagora.callAction.value) {
      case CallStatus.calling:
        return <Widget>[
          Flexible(
            child: InkWell(
              onTap: () {
                _msgController.endCall(
                  chatId: chatId,
                  callee: talkingTo!,
                );
                _sagora.engine.leaveChannel();
                // get back will dispose the view and reset the call Action back to CallAction.None
                Get.back<void>();
              },
              child: Container(
                padding: EdgeInsets.all(12),
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.red),
                child: Center(
                  child: Icon(
                    Icons.call_end,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ),
          ),
        ];
      case CallStatus.inCall:
        return <Widget>[
          Flexible(
            child: InkWell(
              onTap: _sagora.switchSpeakerphone,
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(.8),
                ),
                child: Center(
                  child: Icon(
                    _sagora.enableSpeakerphone.value
                        ? Icons.stop
                        : Icons.speaker,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            child: InkWell(
              onTap: () {
                _msgController.endCall(
                  chatId: chatId,
                  callee: talkingTo!,
                );
                _sagora.engine.leaveChannel();
                // get back will dispose the view and reset the call Action back to CallAction.None
                Get.back<void>();
              },
              child: Container(
                padding: EdgeInsets.all(12),
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.red),
                child: Center(
                  child: Icon(
                    Icons.call_end,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            child: InkWell(
              onTap: _sagora.switchMicrophone,
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(.8),
                ),
                child: Center(
                  child: Icon(
                    _sagora.openMicrophone.value
                        ? Icons.volume_off_rounded
                        : Icons.volume_up_rounded,
                    size: 30,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          )
        ];
      case CallStatus.timedOut:
      case CallStatus.none:
        return <Widget>[
          Flexible(
            child: InkWell(
              onTap: () async {
                await _msgController.callUser(
                  chatId: chatId,
                  callee: talkingTo!,
                  orderId: chatId,
                );
                mezDbgPrint("3 - sender id ${_msgController.sender()?.id}");
                mezDbgPrint(
                    "3 - sender name ${_msgController.sender()?.participantType}");

                // Request Agora auth
                // @Nathik this part does not work
                final dynamic _agoraAuth = (await _sagora.getAgoraToken(
                  chatId,
                  Get.find<AuthController>().user!.id,
                  talkingTo!.participantType == ParticipantType.Customer
                      ? ParticipantType.DeliveryDriver
                      : ParticipantType.Customer,
                ))
                    .snapshot
                    .value;

                mezDbgPrint("4 - A_agoraAuth $_agoraAuth");

                // then we join if it's not null && it's not expired
                if (_agoraAuth != null) {
                  mezDbgPrint("AgoraAuth  :: passed validation test !");
                  // await FlutterCallkitIncoming.startCall(chatId);
                  // then join channel
                  await _sagora.joinChannel(
                    token: _agoraAuth['token'],
                    channelId: chatId,
                    uid: _agoraAuth['uid'],
                  );
                  await initCallTimer();
                  _sagora.callAction.value = CallStatus.calling;
                } else {
                  _sagora.callAction.value = CallStatus.none;
                }
              },
              child: Container(
                padding: EdgeInsets.all(12),
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.green),
                child: Center(
                  child: Icon(
                    Icons.call,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            child: InkWell(
              onTap: Get.back,
              child: Container(
                padding: EdgeInsets.all(12),
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.red),
                child: Center(
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ),
          ),
        ];
    }
  }
}
