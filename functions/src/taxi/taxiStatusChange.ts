import * as functions from "firebase-functions";
import * as rootNodes from "../shared/databaseNodes/root";
import * as taxiNodes from "../shared/databaseNodes/taxi";
import { currentOrderIdNode } from "../shared/databaseNodes/taxi";
import { ServerResponse, ServerResponseStatus } from "../shared/models/Generic/Generic";
import { OrderType } from "../shared/models/Generic/Order";
import { orderInProcess, TaxiOrder, TaxiOrderStatus, } from "../shared/models/Services/Taxi/TaxiOrder";
// import { ParticipantType } from "../shared/models/Generic/Chat";

let statusArrayInSeq: Array<TaxiOrderStatus> =
  [
    TaxiOrderStatus.Scheduled,
    TaxiOrderStatus.OnTheWay,
    TaxiOrderStatus.InTransit,
    TaxiOrderStatus.DroppedOff
  ]

export async function startScheduledRide(userId: string, data: any) {
  let response: ServerResponse = await changeStatus(data, TaxiOrderStatus.OnTheWay, userId)
  return response;
};

export async function startRide(userId: string, data: any) {
  let response: ServerResponse = await changeStatus(data, TaxiOrderStatus.InTransit, userId)
  return response;
};

export async function finishRide(userId: string, data: any) {
  let response: ServerResponse = await changeStatus(data, TaxiOrderStatus.DroppedOff, userId)
  return response;
};

export async function cancelTaxiFromDriver(userId: string, data: any) {
  let response: ServerResponse = await changeStatus(data, TaxiOrderStatus.CancelledByTaxi, userId)
  return response
};

function expectedPreviousStatus(status: TaxiOrderStatus): TaxiOrderStatus {
  return statusArrayInSeq[statusArrayInSeq.findIndex((element) => element == status) - 1];
}

async function changeStatus(data: any, newStatus: TaxiOrderStatus, userId: string): Promise<ServerResponse> {
  // let response = isSignedIn(userId)
  // if (response != undefined)
  //   return response;
  // user signed in
  let taxiId: string = userId;
  let orderId = (await currentOrderIdNode(taxiId).once('value')).val();
  // orderId => OrderId
  if (orderId == null) {
    return {
      status: ServerResponseStatus.Error,
      errorMessage: "Driver has not accepted any ride"
    }
  }


  let transactionResponse = await rootNodes.inProcessOrders(OrderType.Taxi, orderId).transaction(function (order) {
    if (order != null) {
      // if (order.lock == true) {
      //   return 
      // } else {
        order.lock = true
        return order
      // }
    }
    return order
  })

  

  if (!transactionResponse.committed) {
    return {
      status: ServerResponseStatus.Error,
      errorMessage: 'attempt to start but locked'
    }
  }

 
  try {
    let order: TaxiOrder = transactionResponse.snapshot.val()  

    if (newStatus == TaxiOrderStatus.CancelledByTaxi) { 
      if (!orderInProcess(order.status))
        return {
          status: ServerResponseStatus.Error,
          errorMessage: `Order cannot be cancelled because it is not in process`,
          errorCode: "orderNotInProcess"
        }
    } else if (expectedPreviousStatus(newStatus) != order.status) {
      return {
        status: ServerResponseStatus.Error,
        errorMessage: `Status is not ${expectedPreviousStatus(newStatus)} but ${order.status}`,
        errorCode: "invalidOrderStatus"
      }
    }


    order.status = newStatus;  
    order.startRideTime = (new Date()).toISOString(); 


    if (newStatus == TaxiOrderStatus.InTransit || newStatus == TaxiOrderStatus.OnTheWay ) {
      rootNodes.inProcessOrders(OrderType.Taxi, orderId).update(order);
      // customerNodes.inProcessOrders(order.customer.firebaseId!, orderId).update(order);
      taxiNodes.inProcessOrders(taxiId, orderId).update(order);
    } else {
      //TaxiOrderStatus.OnTheWay -> executes this
      rootNodes.inProcessOrders(OrderType.Taxi, orderId).remove();
      rootNodes.pastOrders(OrderType.Taxi, orderId).set(order);
      // await customerNodes.pastOrders(order.customer.firebaseId!, orderId).set(order);
      // customerNodes.inProcessOrders(order.customer.firebaseId!, orderId).remove();
      taxiNodes.inProcessOrders(taxiId, orderId).remove();
      taxiNodes.pastOrders(taxiId, orderId).set(order);
      currentOrderIdNode(taxiId).remove()
    }
    
    // let notification: Notification = {
    //   foreground: <TaxiOrderStatusChangeNotification>{
    //     status: newStatus,
    //     time: (new Date()).toISOString(),
    //     notificationType: NotificationType.OrderStatusChange,
    //     orderType: OrderType.Taxi,
    //     orderId: orderId,
    //     notificationAction: newStatus != TaxiOrderStatus.CancelledByTaxi
    //       ? NotificationAction.ShowSnackBarAlways : NotificationAction.ShowPopUp,
    //   },
    //   background: taxiOrderStatusChangeMessages[newStatus],
    //   linkUrl: orderUrl(OrderType.Taxi, parseInt(orderId))
    // }

    // pushNotification(order.customer.firebaseId!, notification);

    return {
      status: ServerResponseStatus.Success,
      message: newStatus.toString()+' Successfully !'
    };
  } catch (e) {
    functions.logger.error(`Order start error ${orderId}`);
    return {
      status: ServerResponseStatus.Error,
      orderId: "Order start error"
    }
  } finally {
    rootNodes.inProcessOrders(OrderType.Taxi, orderId).child("lock").remove();
  }
}
