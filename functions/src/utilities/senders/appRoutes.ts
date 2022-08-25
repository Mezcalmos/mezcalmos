import { ParticipantType } from "../../shared/models/Generic/Chat";
import { OrderType } from "../../shared/models/Generic/Order";

export function orderUrl(
  participantType: ParticipantType,
  orderType: OrderType,
  orderId: string): string {
  return `/${orderType}Orders/${orderId}`
}

export function chatUrl(
  chatId: string,
  orderId?: string,
  orderType?: OrderType,
  recipientType?: ParticipantType,
  senderType?: ParticipantType): string {
  let str = `/messages/${chatId}`;
  if (orderId != null)
    str += `?orderId=${orderId}`
  if (orderType != null && recipientType != null) 
    str += `&orderLink=${orderUrl(recipientType, orderType, orderId!)}`

  switch (recipientType) {
    case null:
      break;
    case ParticipantType.LaundryOperator:
      str += `&recipientType=${ParticipantType.Laundry}`;
      break;
    case ParticipantType.RestaurantOperator:
      str += `&recipientType=${ParticipantType.Restaurant}`;
      break;
    case ParticipantType.DeliveryAdmin:
      if (senderType == ParticipantType.Customer) {
        switch (orderType) {
          case OrderType.Laundry:
            str += `&recipientType=${ParticipantType.Laundry}`;
            break;
          case OrderType.Restaurant:
            str += `&recipientType=${ParticipantType.Restaurant}`;
            break;
          default:
            str += `&recipientType=${ParticipantType.DeliveryAdmin}`;
            break;
        }
      } else
        str += `&recipientType=${ParticipantType.DeliveryAdmin}`;
      break;
    default:
      if (recipientType)
        str += `&recipientType=${recipientType}`;
      break;
  }


  return str
}

export function taxiIncomingOrderUrl(
  orderId: string): string {
  return `/incomingOrders/${orderId}`
}