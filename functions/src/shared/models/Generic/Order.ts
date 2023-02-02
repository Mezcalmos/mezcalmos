import { OrderStripeInfo } from "../../../utilities/stripe/model";
import { DeliveryType } from "../Services/Restaurant/RestaurantOrder";
import { AppType } from "./Generic";
import { UserInfo } from "./User";

export interface Order {
  orderId?: number;
  customerId: number;
  paymentType: PaymentType;
  refundAmount?: number;
  reviewId?: number;
  deliveryType: DeliveryType;
  orderTime?: string;
  firebaseId?: string;
  customerAppType: AppType;
  notes?: string;
  tax?: number;
  deliveryCost: number;
  chatId?: number;
  scheduledTime?: string;
  stripeInfo?: OrderStripeInfo;
  stripeFees?: number;
  cancellationTime?: string;
  discountValue?: number;
}

export enum DeliveryAction {
  Pickup = "pickup",
  DropOff = "dropoff",
}

export enum OrderType {
  Taxi = "taxi",
  Restaurant = "restaurant",
  Laundry = "laundry",
  Water = "water"
}
//TODO

export const pluralizeOrderType = function (orderType: OrderType): string {
  switch (orderType) {
    case OrderType.Taxi:
      return "taxis";
    case OrderType.Restaurant:
      return "restaurants";
    case OrderType.Laundry:
      return "laundries";
    case OrderType.Water:
      return "waters";

  }
}

export enum PaymentType {
  Cash = "cash",
  Card = "card",
  BankTransfer = "bankTransfer"
}

export enum SecondaryChat {
  ServiceProviderDropOffDriverChat = "serviceProviderDropOffDriver",
  ServiceProviderPickupDriverChat = "serviceProviderPickupDriver",
  CustomerDropOffDriverChat = "customerDropOffDriver",
  CustomerPickupDriverChat = "customerPickupDriver"
}

export interface DeliverableOrder extends Order {
  dropoffDriver?: DeliveryDriverInfo;
  dropOffShippingCost?: number;
}

export interface TwoWayDeliverableOrder extends DeliverableOrder {
  pickupDriver?: DeliveryDriverInfo;
  pickupShippingCost?: number;
}

export interface DeliveryDriverInfo extends UserInfo {
}