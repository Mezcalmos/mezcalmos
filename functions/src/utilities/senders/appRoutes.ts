import { OrderType } from "../../shared/models/Generic/Order";

export function orderUrl(orderType: OrderType, orderId: number): string {
  return `/${orderType}Orders/${orderId}`
}
export function deliveryOrderUrl(orderId: number): string {
  return `/deliveryOrders/${orderId}`
}

export function restaurantUrl(restaurantId: number) {
  return `/Restaurants/${restaurantId}`
}

export function laundryUrl(laundryStoreId: number) {
  return `/Laundry/${laundryStoreId}`
}
export function businessUrl(businessId: number) {
  return `/Business/${businessId}`
}
export function taxiCompanyUrl(taxiCompanyId: number) {
  return `/taxiCompany/${taxiCompanyId}`
}

export function chatUrl(chatId: number): string {
  let str = `/messages/${chatId}`;
  // if (orderId != null)
  //   str += `?orderId=${orderId}`
  // if (orderType != null && recipientType != null) 
  //   str += `&orderLink=${orderUrl(orderType, orderId!)}`

  // switch (recipientType) {
  //   case null:
  //     break;
  //   case ParticipantType.LaundryOperator:
  //     str += `&recipientType=${ParticipantType.Laundry}`;
  //     break;
  //   case ParticipantType.RestaurantOperator:
  //     str += `&recipientType=${ParticipantType.Restaurant}`;
  //     break;
  //   case ParticipantType.DeliveryAdmin:
  //     if (senderType == ParticipantType.Customer) {
  //       switch (orderType) {
  //         case OrderType.Laundry:
  //           str += `&recipientType=${ParticipantType.Laundry}`;
  //           break;
  //         case OrderType.Restaurant:
  //           str += `&recipientType=${ParticipantType.Restaurant}`;
  //           break;
  //         default:
  //           str += `&recipientType=${ParticipantType.DeliveryAdmin}`;
  //           break;
  //       }
  //     } else
  //       str += `&recipientType=${ParticipantType.DeliveryAdmin}`;
  //     break;
  //   default:
  //     if (recipientType)
  //       str += `&recipientType=${recipientType}`;
  //     break;
  // }


  return str
}

export function taxiIncomingOrderUrl(
  orderId: string): string {
  return `/incomingOrders/${orderId}`
}