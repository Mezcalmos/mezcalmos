import { LaundryOrder, LaundryOrderStatus } from "../shared/models/Services/Laundry/LaundryOrder";
import * as customerNodes from "../shared/databaseNodes/customer";
import *  as rootDbNodes from "../shared/databaseNodes/root";
import * as laundryNodes from "../shared/databaseNodes/services/laundry";
import { OrderType } from "../shared/models/Generic/Order";
import * as deliveryDriverNodes from "../shared/databaseNodes/deliveryDriver";
import { ServerResponse, ServerResponseStatus, ValidationPass } from "../shared/models/Generic/Generic";
import { checkDeliveryAdmin, isSignedIn } from "../shared/helper/authorizer";
import { AuthData } from "firebase-functions/lib/common/providers/https";

export async function finishOrder(
  order: LaundryOrder,
  orderId: string) {
  // moving the order node from /customers/inProcessOrders => /customers/pastOrders/
  await customerNodes.pastOrders(order.customer.id!, orderId).set(order)
  await customerNodes.inProcessOrders(order.customer.id!, orderId).remove();


  // and finally remove from root /inProcessOrders   
  await rootDbNodes.pastOrders(OrderType.Laundry, orderId).set(order)
  await rootDbNodes.inProcessOrders(OrderType.Laundry, orderId).remove();


  if (order.laundry) {
    laundryNodes.pastOrders(order.laundry.id, orderId).set(order);
    laundryNodes.inProcessOrders(order.laundry.id, orderId).remove();
  }

  if (order.dropoffDriver) {
    await deliveryDriverNodes.pastOrders(order.dropoffDriver.id!, orderId).update(order)
    await deliveryDriverNodes.inProcessOrders(order.dropoffDriver.id!, orderId).remove();
  }
  if (order.pickupDriver) {
    await deliveryDriverNodes.pastOrders(order.pickupDriver.id!, orderId).update(order)
    await deliveryDriverNodes.inProcessOrders(order.pickupDriver.id!, orderId).remove();
  }
}

let statusArrayInSeq: Array<LaundryOrderStatus> =
  [LaundryOrderStatus.OrderReceieved,
  LaundryOrderStatus.OtwPickupFromCustomer,
  LaundryOrderStatus.PickedUpFromCustomer,
  LaundryOrderStatus.AtLaundry,
  LaundryOrderStatus.ReadyForDelivery,
  LaundryOrderStatus.OtwPickupFromLaundry,
  LaundryOrderStatus.PickedUpFromLaundry,
  LaundryOrderStatus.Delivered
  ]

export function expectedPreviousStatus(status: LaundryOrderStatus): LaundryOrderStatus {
  return statusArrayInSeq[statusArrayInSeq.findIndex((element) => element == status) - 1];
}

async function checkLaundryOperator(laundryId: string, operatorId: string): Promise<ServerResponse | undefined> {
  let operator = (await laundryNodes.laundryOperators(laundryId, operatorId).once('value')).val();
  let isOperator = operator != null && operator == true
  if (!isOperator) {
    return {
      status: ServerResponseStatus.Error,
      errorMessage: "Only authorized laundry operators can run this operation"
    }
  }
  return undefined;
}

export async function passChecksForLaundry(data: any, auth?: AuthData): Promise<ValidationPass> {
  let response = await isSignedIn(auth)
  if (response != undefined) {
    return {
      ok: false,
      error: response
    }
  }
  if (data.orderId == null) {
    return {
      ok: false,
      error: {
        status: ServerResponseStatus.Error,
        errorMessage: `Expected order id`,
        errorCode: "orderIdNotGiven"
      }
    }
  }

  let orderId: string = data.orderId;
  let order: LaundryOrder = (await rootDbNodes.inProcessOrders(OrderType.Laundry, orderId).once('value')).val();
  if (order == null) {
    return {
      ok: false,
      error: {
        status: ServerResponseStatus.Error,
        errorMessage: `Order does not exist`,
        errorCode: "orderDontExist"
      }
    }
  }

  if (data.fromLaundryOperator) {
    response = await checkLaundryOperator(order.laundry.id, auth!.uid)
    if (response != undefined) {
      return {
        ok: false,
        error: response
      };
    }
  } else {
    response = await checkDeliveryAdmin(auth!.uid)
    if (response != undefined) {
      return {
        ok: false,
        error: response
      };
    }
  }

  return {
    ok: true,
    order: order
  }
}