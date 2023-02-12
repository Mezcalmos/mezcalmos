import { ServiceProviderStripeInfo } from "../../../utilities/stripe/model";
import { DeliveryDetails } from "../Generic/Delivery";
import { AuthorizationStatus, Language, Location, NotificationInfo } from "../Generic/Generic";
import {  PaymentType } from "../Generic/Order";
import { UserInfo } from "../Generic/User";

export interface ServiceProvider {
  id: number;
  name: string;
  image: string;
  phoneNumber?: string;
  firebaseId?: string;
  location: Location;
  description?: Record<Language, string>;
  openStatus?: OpenStatus;
  stripeInfo?: ServiceProviderStripeInfo;
  acceptedPayments?: Record<PaymentType, boolean>;
  approved?: boolean;
  links?: ServiceLink;
  creationTime?: string;
  language: Record<Language, boolean>;
  schedule?: any;
  deliveryPartnerId?: number;
  deliveryDetails: DeliveryDetails;
  operators?: Operator[]
}

export interface Operator {
  id: number;
  serviceProviderId: number;
  userId: number;
  status: OperatorStatus;
  owner?: boolean;
  appVersion?: string;
  currentGps?: Location;
  notificationInfo?: NotificationInfo;
  user?: UserInfo;
}

export enum OperatorStatus {
  AwaitingApproval = "awaiting_approval",
  Authorized = "authorized",
  Banned = "banned"
}

export enum OpenStatus {
  Open = "open",
  ClosedTemporarily = "closed_temporarily",
  ClosedIndefinitely = "closed_indefinitely",
}

export interface State {
  authorizationStatus: AuthorizationStatus;
  open: boolean;
}

export interface Details {
  description: Record<Language, string>;
  languages: Language[];
  paymentInfo: PaymentInfo;
}

export interface Service {
  state: State;
  info: UserInfo;
  details: Details
}

export interface PaymentInfo {
  stripe: ServiceProviderStripeInfo;
  acceptedPayments: Record<PaymentType, boolean>;
}
export interface ServiceLink{
  id?: number;
  service_provider_id: number;
  service_provider_type: ServiceProviderType;
  operator_deep_link?: string; 
  operator_qr_image_link?: string;
  driver_deep_link?: string; 
  driver_qr_image_link?: string; 

}
export enum ServiceProviderType {
  Restaurant = "restaurant",
  Laundry = "laundry",
  Taxi = "taxi"
}