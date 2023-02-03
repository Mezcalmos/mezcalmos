// import * as functions from "firebase-functions";
// import { constructLaundryOrder, ConstructLaundryOrderParameters, LaundryOrder } from '../shared/models/Services/Laundry/LaundryOrder';
// import { buildChatForOrder, ChatObject, ParticipantType } from "../shared/models/Generic/Chat";
// import { OrderType } from "../shared/models/Generic/Order";
// import { UserInfo } from "../shared/models/Generic/User";
// import { ServerResponseStatus } from "../shared/models/Generic/Generic";
// import * as deliveryAdminNodes from "../shared/databaseNodes/deliveryAdmin";
// import * as customerNodes from "../shared/databaseNodes/customer";
// import *  as rootNodes from "../shared/databaseNodes/root";
// import * as laundryNodes from "../shared/databaseNodes/services/laundry";
// import { DeliveryAdmin } from "../shared/models/DeliveryAdmin";
// import * as chatController from "../shared/controllers/chatController";
// import { getUserInfo } from "../shared/controllers/rootController";
// // import { Notification, NotificationAction, NotificationType } from "../shared/models/Notification";
// // import { pushNotification } from "../utilities/senders/notifyUser";
// // import { orderUrl } from "../utilities/senders/appRoutes";
// import { Laundry } from "../shared/models/Services/Laundry/Laundry";
// import { getLaundry } from "./laundryController";
// // import { updateOrderIdAndFetchPaymentInfo } from "../utilities/stripe/payment";

import { HttpsError } from "firebase-functions/v1/auth";
import { getLaundryStore } from "../shared/graphql/laundry/getLaundry";
import { createLaundryOrder } from "../shared/graphql/laundry/order/createLaundryOrder";
import { getMezAdmins } from "../shared/graphql/user/mezAdmin/getMezAdmin";
import { CustomerAppType, Location } from "../shared/models/Generic/Generic";
import { DeliveryType, PaymentType } from "../shared/models/Generic/Order";
import { MezAdmin } from "../shared/models/Generic/User";
import { Laundry } from "../shared/models/Services/Laundry/Laundry";
import { LaundryOrder, LaundryOrderStatus, OrderCategory } from "../shared/models/Services/Laundry/LaundryOrder";

// export async function requestLaundry(userId: string, data: any) {

//   // let response = isSignedIn(userId)
//   // if (response != undefined)
//   //   return response;

//   let customerId: string = userId;
//   if (!data.laundryId)
//     return {
//       status: "Error",
//       errorMessage: "laundry id is not present",
//       errorCode: "laundryIdNotPresent"
//     }
//   let laundry: Laundry = await getLaundry(data.laundryId);
//   let orderParams: ConstructLaundryOrderParameters = <ConstructLaundryOrderParameters>data;
//   // TODO limit number of active orders
//   // let customerCurrentOrders = (await customerNodes.inProcessOrders(customerId).once('value')).val();
//   // if (customerCurrentOrders && customerCurrentOrders.length >= 3) {
//   //   return {
//   //     status: "Error",
//   //     errorMessage: "Customer is already in laundry orders",
//   //     errorCode: "alreadyInLaundryOrder"
//   //   }
//   // }

//   let transactionResponse = await customerNodes.lock(customerId).transaction(function (lock) {
//     if (lock == true) {
//       return
//     } else {
//       return true
//     }
//   })

//   if (!transactionResponse.committed) {
//     return {
//       status: ServerResponseStatus.Error,
//       errorMessage: 'Customer lock not available'
//     }
//   }

//   try {
//     let customerInfo: UserInfo = await getUserInfo(customerId);
//     const order: LaundryOrder = constructLaundryOrder(orderParams, customerInfo, laundry.info);


//     let orderId: string = (await customerNodes.inProcessOrders(customerId).push(null)).key!;

//     if (data.stripePaymentId)
//       // await updateOrderIdAndFetchPaymentInfo(orderId, order, data.stripePaymentId, data.stripeFees)

//     customerNodes.inProcessOrders(customerId, orderId).set(order);

//     rootNodes.inProcessOrders(OrderType.Laundry, orderId).set(order);
//     laundryNodes.inProcessOrders(laundry.info.firebaseId, orderId).set(order);


//     let chat: ChatObject = buildChatForOrder(orderId, OrderType.Laundry);
//     chat.addParticipant({
//       ...customerInfo,
//       participantType: ParticipantType.Customer,
//       notificationInfo: null
//     });

//     chat.addParticipant({
//       ...laundry.info,
//       participantType: ParticipantType.Laundry,
//       notificationInfo: null
//     });

//     await chatController.setChat(orderId, chat.chatData);


//     deliveryAdminNodes.deliveryAdmins().once('value').then((snapshot) => {
//       let deliveryAdmins: Record<string, DeliveryAdmin> = snapshot.val();
//       chatController.addParticipantsToChat(Object.keys(deliveryAdmins), chat, orderId, ParticipantType.DeliveryOperator)
//       notifyParticipants(Object.keys(deliveryAdmins), orderId, ParticipantType.DeliveryOperator)
//     })

//     laundryNodes.laundryOperators(data.laundryId).once('value').then((snapshot) => {
//       if (snapshot.val() != null) {
//         let laundryOperators: Record<string, boolean> = snapshot.val();
//         chatController.addParticipantsToChat(Object.keys(laundryOperators), chat, orderId, ParticipantType.LaundryOperator)
//         notifyParticipants(Object.keys(laundryOperators), orderId, ParticipantType.LaundryOperator)
//       }
//     })

//     return {
//       status: ServerResponseStatus.Success,
//       orderId: orderId
//     }
//   } catch (e) {
//     functions.logger.error(e);
//     functions.logger.error(`Order request error ${customerId}`);
//     return {
//       status: ServerResponseStatus.Error,
//       orderId: "Order request error"
//     }
//   } finally {
//     await customerNodes.lock(customerId).remove();
//   }
// };


// async function notifyParticipants(participants: Array<string>,
//   orderId: string, participantType: ParticipantType) {

//   // let notification: Notification = {
//   //   foreground: <NewLaundryOrderNotification>{
//   //     time: (new Date()).toISOString(),
//   //     notificationType: NotificationType.NewOrder,
//   //     orderType: OrderType.Laundry,
//   //     orderId: parseInt(orderId),
//   //     notificationAction: NotificationAction.ShowSnackBarAlways,
//   //   },
//   //   background: {
//   //     [Language.ES]: {
//   //       title: "Nueva Pedido",
//   //       body: `Hay una nueva orden de lavaderia`
//   //     },
//   //     [Language.EN]: {
//   //       title: "New Order",
//   //       body: `There is a new laundry order`
//   //     }
//   //   },
//   //   linkUrl: orderUrl(OrderType.Laundry, parseInt(orderId))
//   // }

//   // for (let index in participants) {
//   //   let participantId: string = participants[index]
//   //   pushNotification(participantId, notification, participantType);
//   // }
// }
export interface LaundryRequestDetails {
    storeId: number,
    paymentType: PaymentType,  
    deliveryType: DeliveryType,
    customerLocation: Location,
    deliveryCost: number,
    status: LaundryOrderStatus,
    categories: Array<number>,
    customerAppType: CustomerAppType,
    notes?: string,
    tax?: number,
    scheduledTime?: string,
    stripeFees?: number,
    discountValue?: number,
    tripDistance: number,
    tripDuration: number,
    tripPolyline: string
}

export async function requestLaundry(customerId: number, laundryRequestDetails: LaundryRequestDetails)/*: Promise<CheckoutResponse> */{
    let laundryStore: Laundry = await getLaundryStore(laundryRequestDetails.storeId);
    let mezAdmins: MezAdmin[] = await getMezAdmins();

    errorChecks(laundryStore, laundryRequestDetails);
    
    let categories: OrderCategory[] = laundryRequestDetails.categories.map((c) => {
        return {
            categoryId: c,
        }
    })
    let laundryOrder: LaundryOrder = {
        customerId,
        storeId: laundryRequestDetails.storeId,
        paymentType: laundryRequestDetails.paymentType,
        deliveryType: laundryRequestDetails.deliveryType,
        customerAppType: laundryRequestDetails.customerAppType,
        notes: laundryRequestDetails.notes,
        tax: laundryRequestDetails.tax,
        scheduledTime: laundryRequestDetails.scheduledTime,
        stripeFees: laundryRequestDetails.stripeFees,
        discountValue: laundryRequestDetails.discountValue,
        customerLocation: laundryRequestDetails.customerLocation,
        deliveryCost: laundryRequestDetails.deliveryCost,
        status: LaundryOrderStatus.OrderReceived,
        categories
    }
    // let deliveryOrder: DeliveryOrder = 
    await createLaundryOrder(laundryOrder, laundryStore, mezAdmins, laundryRequestDetails);

    
}

function errorChecks(laundryStore: Laundry, laundryRequestDetails: LaundryRequestDetails) {

    if(laundryStore.approved == false) {
      throw new HttpsError(
        "internal",
        "Laundry store is not approved and taking orders right now"
      );
    }
    if(laundryStore.openStatus != "open") {
      throw new HttpsError(
        "internal",
        "Laundry store is closed"
      );
    }
    if((laundryRequestDetails.categories.length ?? 0) == 0) {
      throw new HttpsError(
        "internal",
        "No category selected"
      );
    }
  
    if(laundryRequestDetails.deliveryType == DeliveryType.Delivery) {
        if(laundryStore.delivery) {
            if(!(laundryStore.selfDelivery)) {
                if(laundryStore.deliveryPartnerId == null) {
                    throw new HttpsError(
                        "internal",
                        "No delivery partner"
                    );
                }
            }
        } else {
            throw new HttpsError(
                "internal",
                "Laundry store not accepting delivery orders"
            );
        }
    }
}