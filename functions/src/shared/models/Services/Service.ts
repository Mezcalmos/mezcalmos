import { ServiceProviderStripeInfo } from "../../../utilities/stripe/model";
import { DeliveryDetails } from "../Generic/Delivery";
import { AuthorizationStatus, Language, Location, NotificationInfo } from "../Generic/Generic";
import {  PaymentType } from "../Generic/Order";
import { UserInfo } from "../Generic/User";

export interface ServiceProvider {
  id?: number;
  name: string;
  image: string;
  phoneNumber?: string;
  firebaseId?: string;
  selfDelivery: boolean;
  location: Location;
  description?: Record<Language, string>;
  openStatus?: OpenStatus;
  stripeInfo?: ServiceProviderStripeInfo;
  acceptedPayments?: Record<PaymentType, boolean>;
  approved?: boolean;
  links?: ServiceLink;
  creationTime?: string;
  language: Language;
  schedule?: any;
  deliveryPartnerId?: number;
  delivery: boolean;
  customerPickup: boolean;
  deliveryDetails?: DeliveryDetails;
  operators?: Operator[]
}

export interface Operator {
  id?: number;
  serviceProviderId: number;
  userId: number;
  status: AuthorizationStatus;
  owner?: boolean;
  appVersion?: string;
  currentGps?: Location;
  notificationInfo?: NotificationInfo;
  user?: UserInfo;
}

export enum OpenStatus {
  Open = "open",
  ClosedTemporarily = "closedTemporarily",
  ClosedIndefinitely = "closedIndefinitely",
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
  serviceProviderId: number;
  serviceProviderType: ServiceProviderType;
  operatorDeepLink?: string; 
  operatorQrImageLink?: string;
  driverDeepLink?: string; 
  driverQrImageLink?: string; 
}
export enum ServiceProviderType {
  Restaurant = "restaurant",
  Laundry = "laundry",
  Taxi = "taxi"
}