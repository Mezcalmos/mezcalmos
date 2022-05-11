// const keys = require("../keys").keys()
// const hasuraModule = require("../hasura");

// const hasura = new hasuraModule.Hasura(keys.hasura)

import * as functions from "firebase-functions";
import { constructLaundryOrder, ConstructLaundryOrderParameters, LaundryOrder, NewLaundryOrderNotification } from '../shared/models/Services/Laundry/LaundryOrder';
import { buildChatForOrder, ChatObject, ParticipantType } from "../shared/models/Generic/Chat";
import { OrderType } from "../shared/models/Generic/Order";
import { UserInfo } from "../shared/models/Generic/User";
import { Language, ServerResponseStatus } from "../shared/models/Generic/Generic";
import * as deliveryAdminNodes from "../shared/databaseNodes/deliveryAdmin";
import * as customerNodes from "../shared/databaseNodes/customer";
import *  as rootNodes from "../shared/databaseNodes/root";

import { DeliveryAdmin } from "../shared/models/DeliveryAdmin";
import { isSignedIn } from "../shared/helper/authorizer";
import * as chatController from "../shared/controllers/chatController";
import { getUserInfo } from "../shared/controllers/rootController";
import { Notification, NotificationAction, NotificationType } from "../shared/models/Notification";
import { pushNotification } from "../utilities/senders/notifyUser";
import { orderUrl } from "../utilities/senders/appRoutes";
import { addDeliveryAdminsToChat } from "../shared/helper/deliveryAdmin";

export = functions.https.onCall(async (data, context) => {
  let response = isSignedIn(context.auth)
  if (response != undefined)
    return response;

  let customerId: string = context.auth!.uid;
  let orderParams: ConstructLaundryOrderParameters = <ConstructLaundryOrderParameters>data;
  // TODO limit number of active orders
  // let customerCurrentOrders = (await customerNodes.inProcessOrders(customerId).once('value')).val();
  // if (customerCurrentOrders && customerCurrentOrders.length >= 3) {
  //   return {
  //     status: "Error",
  //     errorMessage: "Customer is already in laundry orders",
  //     errorCode: "alreadyInLaundryOrder"
  //   }
  // }

  let transactionResponse = await customerNodes.lock(customerId).transaction(function (lock) {
    if (lock == true) {
      return
    } else {
      return true
    }
  })

  if (!transactionResponse.committed) {
    return {
      status: ServerResponseStatus.Error,
      errorMessage: 'Customer lock not available'
    }
  }

  try {
    let customerInfo: UserInfo = await getUserInfo(customerId);
    const order: LaundryOrder = constructLaundryOrder(orderParams, customerInfo);

    let orderId: string = (await customerNodes.inProcessOrders(customerId).push(order)).key!;
    rootNodes.inProcessOrders(OrderType.Laundry, orderId).set(order);


    let chat: ChatObject = buildChatForOrder(orderId, OrderType.Laundry);
    chat.addParticipant({
      ...customerInfo,
      particpantType: ParticipantType.Customer
    });

    let deliveryAdmins: Record<string, DeliveryAdmin> = (await deliveryAdminNodes.deliveryAdmins().once('value')).val()
    await addDeliveryAdminsToChat(chat, deliveryAdmins)
    notifyDeliveryAdminsNewOrder(deliveryAdmins, orderId)
    await chatController.setChat(orderId, chat.chatData);

    await chatController.setChat(orderId, chat.chatData);

    return {
      status: ServerResponseStatus.Success,
      orderId: orderId
    }
  } catch (e) {
    functions.logger.error(e);
    functions.logger.error(`Order request error ${customerId}`);
    return {
      status: ServerResponseStatus.Error,
      orderId: "Order request error"
    }
  } finally {
    await customerNodes.lock(customerId).remove();
  }
})


async function notifyDeliveryAdminsNewOrder(deliveryAdmins: Record<string, DeliveryAdmin>,
  orderId: string) {

  let notification: Notification = {
    foreground: <NewLaundryOrderNotification>{
      time: (new Date()).toISOString(),
      notificationType: NotificationType.NewOrder,
      orderType: OrderType.Laundry,
      orderId: orderId,
      notificationAction: NotificationAction.ShowSnackBarAlways,
    },
    background: {
      [Language.ES]: {
        title: "Nueva Pedido",
        body: `Hay una nueva orden de lavaderia`
      },
      [Language.EN]: {
        title: "New Order",
        body: `There is a new laundry order`
      }
    },
    linkUrl: orderUrl(ParticipantType.DeliveryAdmin, OrderType.Laundry, orderId)
  }

  for (let adminId in deliveryAdmins) {
    pushNotification(adminId!, notification, ParticipantType.DeliveryAdmin);
  }
}