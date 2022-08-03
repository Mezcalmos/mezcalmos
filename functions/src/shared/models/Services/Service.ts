import { ServiceProviderStripeInfo } from "../../../utilities/stripe/model";
import { AuthorizationStatus, Language } from "../Generic/Generic";
import { PaymentType } from "../Generic/Order";
import { UserInfo } from "../Generic/User";

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