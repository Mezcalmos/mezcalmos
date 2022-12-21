import { chatMessageNotifiedNode, chatNode, participantAgoraNode } from "../databaseNodes/chat";
import { ParticipantAgoraDetails, ChatData, ChatObject, ParticipantType } from "../models/Generic/Chat";
import { UserInfo } from "../models/Generic/User";
import { getUserInfo } from "./rootController";

export async function pushChat(chat?: ChatData): Promise<string> {
  let chatId: string = (await chatNode().push(chat)).key!;
  return chatId;
}

export async function getChat(chatId: string): Promise<ChatObject> {
  let chatData: ChatData = (await chatNode(chatId).once('value')).val();
  return new ChatObject(chatData);
}

export async function setChat(chatId: string, chat: ChatData) {
  return (await chatNode(chatId).set(chat))
}

export async function setUserAgoraInfo(chatId: string, participantType: ParticipantType, userId: string, agora: ParticipantAgoraDetails) {
  return (await participantAgoraNode(chatId, participantType, userId).set(agora))
}

export async function updateChat(chatId: string, chat: ChatData) {
  return (await chatNode(chatId).update(chat))
}

export async function deleteChat(chatId: string) {
  return (await chatNode(chatId).remove())
}

export async function setChatMessageNotifiedAsTrue(chatId: string, messageId: string) {
  return chatMessageNotifiedNode(chatId, messageId).set(true);
}

export async function addParticipantsToChat(
  users: Array<string>,
  chat: ChatObject,
  chatId: string,
  participantType: ParticipantType) {
  for (var index in users) {
    let userId: string = users[index]
    var userInfo: UserInfo = await getUserInfo(userId);
    chat.addParticipant({
      ...userInfo,
      participantType,
      notificationInfo: null
    });
  }

  await updateChat(chatId, chat.chatData);
}

export async function addParticipantToChat(
  userInfo: UserInfo,
  chat: ChatObject,
  chatId: string,
  participantType: ParticipantType) {

  chat.addParticipant({
    ...userInfo,
    participantType,
    notificationInfo: null
  });

  await updateChat(chatId, chat.chatData);
}