import { pushNotification } from "../utilities/senders/notifyUser";
import { Notification, NotificationAction, NotificationType } from "../shared/models/Notification";
import { deliveryNewOrderMessage } from "./bgNotificationMessages";
import { getDeliveryDriver } from "../shared/graphql/delivery/driver/getDeliveryDriver";
import {  DeliveryDriver, DeliveryOrder, NewDeliveryOrderNotification, CounterOfferStatus } from "../shared/models/Generic/Delivery";
import { getDeliveryOrder } from "../shared/graphql/delivery/getDelivery";
import { assignDeliveryDriver } from "../shared/graphql/delivery/driver/assignDeliverer";
import { setDeliveryChatInfo } from "../shared/graphql/chat/setChatInfo";
import { deleteDeliveryChatMessagesAndParticipant } from "../shared/graphql/chat/deleteChatMessages";
import { isMezAdmin } from "../shared/helper";
import { AuthorizationStatus, MezError } from "../shared/models/Generic/Generic"
import { ParticipantType } from "../shared/models/Generic/Chat";
import { clearLock, setLockTime } from "../shared/graphql/delivery/updateDelivery";
// import { ParticipantType } from "../shared/models/Generic/Chat";

export interface AssignDriverDetails {
  deliveryOrderId: number,
  deliveryDriverId: number,
  changeDriver?: boolean,
}
export interface AssignDriverResponse {
  success: boolean,
  error?: AssignDriverError
  unhandledError?: string,
}

export enum AssignDriverError {
  UnhandledError = "unhandledError",
  OrderNotFound = "orderNotFound",
  DriverNotFound = "driverNotFound",
  OperatorNotFound = "operatorNotFound",
  InvalidOperator = "invalidOperator",
  UnauthorizedDriver = "unauthorizedDriver",
  ServiceProviderDeliveryChatNotFound = "serviceProviderDeliveryChatNotFound",
  DriverAlreadyAssigned = "driverAlreadyAssigned",
  IncorrectOrderId = "incorrectOrderId",
  NoCustomerOffer = "noCustomerOffer",
}

export async function assignDriver(userId: number, assignDriverDetails: AssignDriverDetails): Promise<AssignDriverResponse> {
  // assignDriverDetails.deliveryDriverType = 'delivery_driver';
  try {
    if(assignDriverDetails.changeDriver == null) {
      await setLockTime(assignDriverDetails.deliveryOrderId)
    }
    let deliveryOrderPromise = getDeliveryOrder(assignDriverDetails.deliveryOrderId);
    let deliveryDriverPromise = getDeliveryDriver(assignDriverDetails.deliveryDriverId)//, assignDriverDetails.deliveryDriverType);
    let promiseResponse = await Promise.all([deliveryOrderPromise, deliveryDriverPromise]);
    let deliveryOrder: DeliveryOrder = promiseResponse[0];
    let deliveryDriver: DeliveryDriver = promiseResponse[1];

    if((await isMezAdmin(userId)) == false  && deliveryDriver.userId != userId) {

      // await checkIfOperatorAuthorized(deliveryOrder, userId);
      if(userId != deliveryOrder.customerId) {
        throw new MezError(AssignDriverError.IncorrectOrderId);
      }
    }
    if(deliveryDriver.status != AuthorizationStatus.Authorized) {
      throw new MezError(AssignDriverError.UnauthorizedDriver);
    }
    if (deliveryOrder.deliveryDriverId != null) {
      if (assignDriverDetails.changeDriver) {
        await deleteDeliveryChatMessagesAndParticipant(deliveryOrder);
      } else {
        throw new MezError(AssignDriverError.DriverAlreadyAssigned);
      }
    }
    if(deliveryOrder.customerOffer == null) {
      throw new MezError(AssignDriverError.NoCustomerOffer);
    }
    deliveryOrder.deliveryCost = deliveryOrder.customerOffer;
    for (let driverId in deliveryOrder.counterOffers) {
      if(parseInt(driverId) != assignDriverDetails.deliveryDriverId) {
        deliveryOrder.counterOffers[parseInt(driverId)].status = CounterOfferStatus.Rejected;
      } else {
        deliveryOrder.counterOffers[parseInt(driverId)].status = CounterOfferStatus.Accepted;
        deliveryOrder.deliveryCost = deliveryOrder.counterOffers[parseInt(driverId)].price;
      }
    }
    await assignDeliveryDriver(deliveryOrder, deliveryDriver);

    setDeliveryChatInfo(deliveryOrder, deliveryDriver, deliveryOrder.orderType);

    
    
    if( deliveryDriver.userId != userId)
      sendNotificationToDriver(deliveryDriver, deliveryOrder);
    return {
      success: true
    }
  } catch (e: any) {
    if (e instanceof MezError) {
      if (Object.values(AssignDriverError).includes(e.message as any)) {
        return {
          success: false,
          error: e.message as any
        }
      } else {
        return {
          success: false,
          error: AssignDriverError.UnhandledError,
          unhandledError: e.message as any
        }
      }
    } else {
      throw e
    }

  } finally {
    clearLock(assignDriverDetails.deliveryOrderId);
  }
};

function sendNotificationToDriver(deliveryDriver: DeliveryDriver, deliveryOrder: DeliveryOrder) {

    let notification: Notification = {
      foreground: <NewDeliveryOrderNotification>{
        time: (new Date()).toISOString(),
        notificationType: NotificationType.NewOrder,
        orderType: deliveryOrder.orderType,
        notificationAction: NotificationAction.ShowPopUp,
        orderId: deliveryOrder.deliveryId,
        // deliveryDriverType: assignDriverDetails.deliveryDriverType
      },
      background: deliveryNewOrderMessage,
      linkUrl: `/orders/${deliveryOrder.deliveryId}`
    };

    pushNotification(
      deliveryDriver.user!.firebaseId!,
      notification,
      deliveryDriver.notificationInfo,
      ParticipantType.DeliveryDriver
    );
}

// async function checkIfOperatorAuthorized(deliveryOrder: DeliveryOrder, userId: number) {
//   switch (deliveryOrder.serviceProviderType) {
//     case DeliveryServiceProviderType.DeliveryCompany:
//       let deliveryOperator: Operator = await getDeliveryOperatorByUserId(userId);
//       if (deliveryOperator.status != AuthorizationStatus.Authorized || deliveryOperator.serviceProviderId != deliveryOrder.serviceProviderId) {
//         throw new MezError(AssignDriverError.InvalidOperator);
//       }
//       break;
//     case DeliveryServiceProviderType.Restaurant:
//       let restaurantOperator: Operator = await getRestaurantOperatorByUserId(userId);
//       if (restaurantOperator.status != AuthorizationStatus.Authorized || restaurantOperator.serviceProviderId != deliveryOrder.serviceProviderId) {
//         throw new MezError(AssignDriverError.InvalidOperator);
//       }
//       break;
//       case DeliveryServiceProviderType.Laundry:
//         let laundryOperator: Operator = await getLaundryOperatorByUserId(userId);
//         if (laundryOperator.status != AuthorizationStatus.Authorized || laundryOperator.serviceProviderId != deliveryOrder.serviceProviderId) {
//           throw new MezError(AssignDriverError.InvalidOperator);
//         }
//         break;
//     default:
//       break;
//   }
// }