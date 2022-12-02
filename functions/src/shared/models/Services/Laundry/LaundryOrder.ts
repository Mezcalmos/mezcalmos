
import { OrderType, PaymentType, TwoWayDeliverableOrder } from '../../Generic/Order';
import { UserInfo } from '../../Generic/User';
import { OrderNotification } from '../../Notification';
import { Location } from "../../Generic/Generic";
import { RouteInformation } from '../../Generic/RouteInformation';

export interface LaundryOrder extends TwoWayDeliverableOrder {
  laundry: UserInfo;
  notes?: string;
  status: LaundryOrderStatus;
  shippingCost: number;
  costPerKilo: number;
  routeInformation?: RouteInformation;
  costsByType?: CostsByType;
  estimatedLaundryReadyTime?: string
}
export interface CostsByType {
  byType: any;
  weighedCost: number;
}

export enum LaundryOrderStatus {
  OrderReceieved = "orderReceieved",
  OtwPickupFromCustomer = "otwPickupFromCustomer",
  PickedUpFromCustomer = "pickedUpFromCustomer",
  AtLaundry = "atLaundry",
  ReadyForDelivery = "readyForDelivery",
  OtwPickupFromLaundry = "otwPickupFromLaundry",
  PickedUpFromLaundry = "pickedUpFromLaundry",
  Delivered = "delivered",
  CancelledByAdmin = "cancelledByAdmin",
  CancelledByCustomer = "cancelledByCustomer"
}

export interface ConstructLaundryOrderParameters {
  routeInformation?: RouteInformation,
  notes?: string,
  paymentType: PaymentType,
  to: Location,
  shippingCost : number
}

export function constructLaundryOrder(
  params: ConstructLaundryOrderParameters, customer: UserInfo, laundry: UserInfo): LaundryOrder {
  return <LaundryOrder><unknown>{
    customer: customer,
    orderType: OrderType.Laundry,
    status: LaundryOrderStatus.OrderReceieved,
    orderTime: (new Date()).toISOString(),
    notes: params.notes,
    laundry: laundry,
    serviceProviderId: laundry.id,
    cost: 0,
    paymentType: params.paymentType,
    to: params.to,
    shippingCost: params.shippingCost || 0,
    costPerKilo: 20,
    routeInformation: params.routeInformation
  }
}

export function orderInProcess(status: LaundryOrderStatus): boolean {
  return !(status == LaundryOrderStatus.CancelledByAdmin ||
    status == LaundryOrderStatus.CancelledByCustomer ||
    status == LaundryOrderStatus.Delivered)
}

export interface NewLaundryOrderNotification extends OrderNotification {
}

export interface LaundryOrderStatusChangeNotification extends OrderNotification {
  status: LaundryOrderStatus
}