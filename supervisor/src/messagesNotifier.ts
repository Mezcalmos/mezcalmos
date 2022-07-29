import { ChatData, MessageNotificationForQueue, nonNotifiableParticipants, Participant, Participants, ParticipantType } from "../../functions/src/shared/models/Generic/Chat";
import { getChat, setChatMessageNotifiedAsTrue } from "../../functions/src/shared/controllers/chatController";
import * as notifyUser from "../../functions/src/utilities/senders/notifyUser";
import { chatUrl, orderUrl } from "../../functions/src/utilities/senders/appRoutes";
import * as rootNodes from "../../functions/src/shared/databaseNodes/root";
import { NewMessageNotification, Notification, NotificationAction, NotificationType, NotificationForQueue } from "../../functions/src/shared/models/Notification";
import { CounterOfferNotification, CounterOfferNotificationForQueue } from "../../functions/src/shared/models/Services/Taxi/TaxiOrder";
import { OrderType } from "../../functions/src/shared/models/Generic/Order";

export function startWatchingMessageNotificationQueue() {
  rootNodes.notificationsQueueNode().on('child_added', function (snap) {
    let notification: NotificationForQueue = snap.val();
    console.log(`Notification type ${notification.notificationType}`)
    switch (notification.notificationType) {
      case NotificationType.NewMessage:
        notifyOtherMessageParticipants(notification as MessageNotificationForQueue);
        break;
      case NotificationType.NewCounterOffer:
        notifyCustomerAboutCounterOffer(notification as CounterOfferNotificationForQueue)
        break;
    }
    rootNodes.notificationsQueueNode(snap.key!).remove();
  });
}

async function notifyOtherMessageParticipants(notificationForQueue: MessageNotificationForQueue) {
  // TO BE REMOVED, added for backwards compatibility in cases where message does not have chatId field
  notificationForQueue.chatId = notificationForQueue.chatId ?? notificationForQueue.orderId;
  // TILL HERE
  let chatData: ChatData = (await getChat(notificationForQueue.chatId)).chatData;

  if (chatData.messages && chatData.messages![notificationForQueue.messageId].notified) {
    return
  }
  let senderInfo: Participant = chatData.participants[notificationForQueue.participantType]![notificationForQueue.userId]
  delete chatData.participants[notificationForQueue.participantType];
  for (let participantType in chatData.participants) {
    if (participantType in nonNotifiableParticipants)
      continue
    for (let participantId in chatData.participants[participantType as ParticipantType]) {
      let participant = chatData.participants[participantType as ParticipantType]![participantId]
      let transformedSenderInfo: Participant = transformSender(senderInfo, chatData.participants, chatData.orderType!, notificationForQueue.participantType, participant.particpantType); //TODO: change this to restaurant or laundry
      let notification: Notification = {
        foreground: <NewMessageNotification>{
          chatId: notificationForQueue.chatId,
          sender: transformedSenderInfo,
          message: notificationForQueue.message,
          orderId: notificationForQueue.orderId ?? null,
          time: notificationForQueue.timestamp,
          notificationType: NotificationType.NewMessage,
          notificationAction: NotificationAction.ShowSnackbarOnlyIfNotOnPage,
          orderType: chatData.orderType
        },
        background: {
          en: {
            title: `New message from ${transformedSenderInfo.name}`,
            body: notificationForQueue.message
          },
          es: {
            title: `Nueva mensaje de ${transformedSenderInfo.name}`,
            body: notificationForQueue.message
          }
        },
        linkUrl: chatUrl(notificationForQueue.chatId, notificationForQueue.orderId, chatData.orderType, notificationForQueue.participantType, participant.particpantType)
      }
      notifyUser.pushNotification(participantId, notification, participant.particpantType);
    }
  }
  setChatMessageNotifiedAsTrue(notificationForQueue.chatId, notificationForQueue.messageId);
}

async function notifyCustomerAboutCounterOffer(notificationForQueue: CounterOfferNotificationForQueue) {
  // TODO: check to see if customer has an order and counter offer has been notified
  let notification: Notification = {
    foreground: <CounterOfferNotification>{
      driver: notificationForQueue.driver,
      orderId: notificationForQueue.orderId,
      customerId: notificationForQueue.customerId,
      price: notificationForQueue.price,
      time: notificationForQueue.timestamp,
      notificationType: NotificationType.NewCounterOffer,
      notificationAction: NotificationAction.ShowSnackbarOnlyIfNotOnPage,
    },
    background: {
      en: {
        title: 'New counter offer',
        body: `New offer from ${notificationForQueue.driver.name} for ${notificationForQueue.price}`
      },
      es: {
        title: `Nueva contraoferta`,
        body: `Nueva oferta de ${notificationForQueue.driver.name} para ${notificationForQueue.price}`
      }
    },
    linkUrl: orderUrl(ParticipantType.Customer, OrderType.Taxi, notificationForQueue.orderId)
  }
  notifyUser.pushNotification(notificationForQueue.customerId, notification, ParticipantType.Customer);
}

function transformSender(
  defaultParticipant: Participant,
  participants: Participants,
  orderType: OrderType,
  recipientType: ParticipantType,
  senderType: ParticipantType,
): Participant {
  let returnParticipant: Participant = defaultParticipant;
  switch (recipientType) {
    case null:
      break;
    case ParticipantType.LaundryOperator: // when receiving message from laundry operator
      returnParticipant = getServiceProviderFromParticipants(participants, ParticipantType.Laundry)
      break;
    case ParticipantType.RestaurantOperator: // when receiving message from restaurant operator
      returnParticipant = getServiceProviderFromParticipants(participants, ParticipantType.Restaurant)
      break;
    case ParticipantType.DeliveryAdmin: // when receiving message from delivery admin operator
      if (senderType == ParticipantType.Customer) {
        switch (orderType) {
          case OrderType.Laundry:
            returnParticipant = getServiceProviderFromParticipants(participants, ParticipantType.Laundry)
            break;
          case OrderType.Restaurant:
            returnParticipant = getServiceProviderFromParticipants(participants, ParticipantType.Restaurant)
            break;
        }
      }
      break;
  }
  return returnParticipant
}

function getServiceProviderFromParticipants(
  participants: Participants,
  participantType: ParticipantType) {
  return participants[participantType]![Object.keys(participants[participantType]!)[0]]
}