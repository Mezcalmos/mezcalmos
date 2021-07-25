import 'dart:collection';
import 'package:intl/intl.dart';
import 'package:firebase_database/firebase_database.dart';

class Participant {
  late String image;
  late String name;
  dynamic participantType;

  Participant(image, name, participantType) {
    this.image = image;
    this.name = name;
    this.participantType = participantType;
  }
}

class Message {
  late String message;
  late DateTime timeStamp;
  late String formatedTime;
  late String userId;
  Message(message, timestamp, userId) {
    this.message = message;
    this.timeStamp = timestamp;
    this.formatedTime = DateFormat('HH:mm').format(timestamp).toString();
    this.userId = userId;
  }
}

class Chat {
  late String chatType;
  late String orderType;
  late Map<String, Participant> participants;
  List<Message> messages = <Message>[];

  Chat(this.chatType, this.orderType, this.participants, this.messages);

  Chat.fromJson(_value) {
    // print("1 >>>$_value");

    Map<String, dynamic> value = new Map<String, dynamic>.from(_value);
    // print("2 >>>$value");

    Map<String, Participant> _participants = {};
    List<Message> _messages = [];

    value['participants']?.forEach((key, p) {
      _participants[key] =
          Participant(p['image'], p['name'], p['participantType']);
    });
    // for (var participantId in value['participants']) {
    //   dynamic p = value['participants'][participantId];
    //   print(p);
    //   print("/n/n ${value['participants']}");
    //   participants[participantId] =
    //       Participant(p.image, p.name, p.participantType);
    // }

    value['messages']?.forEach((key, m) {
      _messages.add(
          Message(m['message'], DateTime.parse(m['timestamp']), m['userId']));
    });

    _messages
        .sort((after, before) => before.timeStamp.compareTo(after.timeStamp));

    // for (var messageId in value['messages']) {
    //   dynamic m = value['messages'][messageId];
    //   messages.add(Message(m.message, DateTime.parse(m.timestamp), m.userId));
    // }

    this.chatType = value['chatType'];
    this.orderType = value['orderType'];
    this.participants = _participants;
    this.messages = _messages;
  }

  // Added for Debugging Perposes - Don't delete for now
  Map<String, dynamic> toJson() => {
        "chatType": chatType,
        "orderType": orderType,
        "participants": participants,
        "messages": messages,
      };
}
