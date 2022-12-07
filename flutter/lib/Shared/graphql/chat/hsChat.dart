import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/chat/__generated/hsChat.graphql.dart';
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Chat.dart';

HasuraDb _hasuraDb = Get.find<HasuraDb>();

Future<HasuraChat?> get_chat_info({required int chat_id}) async {
  mezDbgPrint("[log] Called :: get_chat_info :: chat_id :: $chat_id");
  List<Message> _get_messages(List<String>? msgs) {
    List<Message> _ret_msgs = [];

    if (msgs != null) {
      msgs.forEach((String jsonString) {
        // I use the timestamp as key
        Map<String, dynamic> msg = mapFromJson(jsonString);
        _ret_msgs.add(
          Message(
            message: msg['message'],
            timestamp: DateTime.parse(msg['timestamp']).toLocal(),
            userId: msg['userId'],
          ),
        );
      });
    }

    return _ret_msgs;
  }

  List<Participant> _get_participants(
      List<Query$get_chat_info$chat_by_pk$chat_participants> participants) {
    List<Participant> _ret_participants = [];

    if (participants.isNotEmpty) {
      participants.forEach((_participant) {
        _ret_participants.add(
          Participant(
            image: _participant.user.image!,
            name: _participant.user.name!,
            participantType:
                _participant.app_type_id.toParticipantTypeFromHasuraAppTypeId(),
            id: _participant.user.id,
          ),
        );
      });
    }

    return _ret_participants;
  }

  QueryResult<Query$get_chat_info> _chat =
      await _hasuraDb.graphQLClient.query$get_chat_info(
    Options$Query$get_chat_info(
      variables: Variables$Query$get_chat_info(chat_id: chat_id),
    ),
  );

  mezDbgPrint("[666] ${_chat.parsedData?.chat_by_pk}");
  mezDbgPrint("[666] ${_chat.data}");
  if (_chat.hasException || _chat.parsedData?.chat_by_pk == null) {
    mezDbgPrint("[+] called get_chat_info :: Exception :: ${_chat.exception}");
  } else {
    mezDbgPrint("[+] called get_chat_info :: SUCCESS.");
    mezDbgPrint("Messages ===> ${_chat.parsedData!.chat_by_pk!.messages}");
    final HasuraChat _ret_chat = HasuraChat(
      chatInfo: HasuraChatInfo(
        chatTite: _chat.parsedData!.chat_by_pk!.chat_info!['CustomerApp']
            ['chatTitle'],
        chatImg: _chat.parsedData!.chat_by_pk!.chat_info!['CustomerApp']
            ['chatImage'],
        parentlink: _chat.parsedData!.chat_by_pk!.chat_info!['CustomerApp']
            ['parentLink'],
      ),
      creationTime:
          DateTime.parse(_chat.parsedData!.chat_by_pk!.creation_time).toLocal(),
      id: chat_id,
      messages: [],
      // _get_messages(_chat.parsedData!.chat_by_pk!.messages as List<String>),
      participants: _get_participants(
        _chat.parsedData!.chat_by_pk!.chat_participants,
      ),
    );
    return _ret_chat;
  }
  return null;
}

Future<void> send_message(
    {required int chat_id, required Map<String, dynamic> msg}) async {
  QueryResult<Mutation$add_message> _resp =
      await _hasuraDb.graphQLClient.mutate$add_message(
    Options$Mutation$add_message(
      variables: Variables$Mutation$add_message(chat_id: chat_id, msg: msg),
    ),
  );

  mezDbgPrint(msg);
  if (_resp.hasException ||
      _resp.parsedData?.update_chat?.affected_rows == null) {
    mezDbgPrint("[+] called send_message :: Exception :: ${_resp.exception}");
  } else {
    mezDbgPrint("[+] called send_message :: SUCCESS");
  }
}
