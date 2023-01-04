import { Order, OrderType } from "../models/Generic/Order";
import { LaundryOrder } from "../models/Services/Laundry/LaundryOrder";
import * as restaurantNodes from "../databaseNodes/services/restaurant";
import * as laundryNodes from "../databaseNodes/services/laundry";
import { ChatObject, ParticipantType } from "../models/Generic/Chat";
import { addParticipantsToChat, addParticipantToChat } from "./chatController";

export function updateServiceProviderOrder(orderId: string, order: Order) {
  // if (order.orderType == OrderType.Restaurant) {
  //   let rOrder: RestaurantOrder = <RestaurantOrder>{ ...order }
  //   restaurantNodes.inProcessOrders(rOrder.restaurant.id!, orderId).update(order);
  // } else if (order.orderType == OrderType.Laundry) {
  //   let lOrder: LaundryOrder = <LaundryOrder>{ ...order }
  //   laundryNodes.inProcessOrders(lOrder.laundry.firebaseId!, orderId).update(order);
  // }
}

export function addServiceProviderAndOperatorsToChat(orderId: string, order: Order, serviceProviderchat: ChatObject,
  serviceProviderDriverChatId: number) {
  switch (order.orderType) {
    case OrderType.Laundry:
      addParticipantToChat((order as LaundryOrder).laundry, serviceProviderchat, serviceProviderDriverChatId, ParticipantType.Laundry);
      laundryNodes.laundryOperators(order.serviceProviderId!.toString()).once('value').then((snapshot) => {
        let laundryOperators: Record<string, boolean> = snapshot.val() || {};
        addParticipantsToChat(Object.keys(laundryOperators), serviceProviderchat, serviceProviderDriverChatId, ParticipantType.LaundryOperator)
      })
      break;
    case OrderType.Restaurant:
      restaurantNodes.restaurantOperators(order.serviceProviderId!.toString()).once('value').then((snapshot) => {
        let restaurantOperators: Record<string, boolean> = snapshot.val() || {};
        addParticipantsToChat(Object.keys(restaurantOperators), serviceProviderchat, serviceProviderDriverChatId, ParticipantType.RestaurantOperator)
      })
      break;

    default:
      break;
  }
}
