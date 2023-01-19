import Stripe from 'stripe';
import { ServerResponseStatus } from '../../shared/models/Generic/Generic';
import { getKeys } from '../../shared/keys';
import { Keys } from '../../shared/models/Generic/Keys';
import { CustomerCard, emptyIdsWithServiceProvider, StripeStatus } from './model';
import { OrderType, PaymentType } from '../../shared/models/Generic/Order';
import { getCustomer } from '../../shared/graphql/user/customer/getCustomer';
import { updateCustomerStripe } from '../../shared/graphql/user/customer/updateCustomer';
import { HttpsError } from 'firebase-functions/v1/auth';
import { getRestaurant } from '../../shared/graphql/restaurant/getRestaurant';
import { getCustomerAllRestaurantOrders } from '../../shared/graphql/restaurant/order/getRestaurantOrder';
import { RestaurantOrderStatus } from '../../shared/models/Services/Restaurant/RestaurantOrder';
import { CustomerInfo } from '../../shared/models/Generic/User';
import { verifyCustomerIdForServiceAccount } from './serviceProvider';
let keys: Keys = getKeys();

export interface CardDetails {
  paymentMethod: string,
}
export async function addCard(userId: number, cardDetails: CardDetails) {

  let stripeOptions = { apiVersion: <any>'2020-08-27' };
  const stripe = new Stripe(keys.stripe.secretkey, stripeOptions);
  let customer = await getCustomer(userId);
  customer = await verifyCustomerStripeInfo(customer, stripe)

  const paymentMethod: Stripe.PaymentMethod = await stripe.paymentMethods.attach(
    cardDetails.paymentMethod,
    { customer: customer.stripeInfo!.id },
    stripeOptions
  );
  customer.stripeInfo!.cards = customer.stripeInfo!.cards ?? {}
  customer.stripeInfo!.cards[paymentMethod.id] = {
    id: paymentMethod.id,
    last4: paymentMethod.card?.last4,
    brand: paymentMethod.card?.brand,
    expMonth: paymentMethod.card?.exp_month,
    expYear: paymentMethod.card?.exp_year,
    idsWithServiceProvider: emptyIdsWithServiceProvider
  };
  updateCustomerStripe(customer);

  return {
    status: ServerResponseStatus.Success,
    cardId: paymentMethod.id
  }
};

export interface ChargeCardDetails {
  serviceProviderId: number,
  cardId: string,
  orderType: OrderType,
  paymentAmount: number
}
export async function chargeCard(userId: number, chargeCardDetails: ChargeCardDetails) {

  let serviceProvider;
  if(chargeCardDetails.orderType == OrderType.Restaurant) {
    serviceProvider = await getRestaurant(chargeCardDetails.serviceProviderId);
  } else {
    throw new HttpsError(
      "internal",
      "invalid order type"
    );
  }
  if (!(serviceProvider.stripeInfo)
    || !(serviceProvider.acceptedPayments)
    || serviceProvider.acceptedPayments[PaymentType.Card] == false
    || serviceProvider.stripeInfo.status != StripeStatus.IsWorking
  ) {
    throw new HttpsError(
      "internal",
      "This service provider does not accept cards"
    );
  }
  let stripeOptionsDefault = { apiVersion: <any>'2020-08-27' };
  let stripe = new Stripe(keys.stripe.secretkey, stripeOptionsDefault);
  let customer: CustomerInfo = await getCustomer(userId);
  customer = await verifyCustomerStripeInfo(customer, stripe);
  if (!(customer.stripeInfo!.cards[chargeCardDetails.cardId])) {
    throw new HttpsError(
      "internal",
      "There is no card with this key"
    );
  }
  let stripeOptions = { apiVersion: <any>'2020-08-27', stripeAccount: serviceProvider.stripeInfo.id };
  stripe = new Stripe(keys.stripe.secretkey, stripeOptions);

  customer = await verifyCustomerIdForServiceAccount(
    customer, 
    chargeCardDetails.serviceProviderId, 
    chargeCardDetails.orderType, 
    stripe, 
    stripeOptions
  );
  let stripeCustomerId: string = customer.stripeInfo!.idsWithServiceProvider[chargeCardDetails.orderType][chargeCardDetails.serviceProviderId];
  let card: CustomerCard = await verifyCardForServiceAccount(customer, chargeCardDetails.cardId, chargeCardDetails.serviceProviderId, chargeCardDetails.orderType, stripeCustomerId, stripe, stripeOptions);
  let stripeCardId: string = card.idsWithServiceProvider[chargeCardDetails.orderType][chargeCardDetails.serviceProviderId];

  const paymentIntent = await stripe.paymentIntents.create(
    {
      amount: chargeCardDetails.paymentAmount * 100,
      currency: 'mxn',
      payment_method_types: ['card'],
      customer: stripeCustomerId,
      capture_method: 'manual',
      payment_method: stripeCardId,
    },
    stripeOptions
  );

  if (paymentIntent.status == 'requires_confirmation') {
    await stripe.paymentIntents.confirm(paymentIntent.id, stripeOptions);
  }
  return {
    status: ServerResponseStatus.Success,
    paymentIntent: paymentIntent.client_secret,
    customer: stripeCustomerId,
    publishableKey: keys.stripe.publickey,
    stripeAccountId: serviceProvider.stripeInfo.id
  }
};
export interface RemoveCardDetails {
  cardId: string,

}
export async function removeCard(userId: number, removeCardDetails: RemoveCardDetails) {

  //Restaurant order
  let restaurantOrders = await getCustomerAllRestaurantOrders(userId);
  restaurantOrders.filter((o) => ((o.status != RestaurantOrderStatus.Delivered) 
    && (o.status != RestaurantOrderStatus.CancelledByAdmin)
    && (o.status != RestaurantOrderStatus.CancelledByCustomer)
  ))
  if(restaurantOrders.length) {
    throw new HttpsError(
      "internal",
      "Can't remove cards with in process orders, please wait till you finish your order"
    );
  }
  let customer = await getCustomer(userId);
  if (!(customer.stripeInfo)
    || !(customer.stripeInfo.cards) 
    || !(customer.stripeInfo.cards[removeCardDetails.cardId])
  ) {
    throw new HttpsError(
      "internal",
      "There is no card with this key"
    );
  }
  const card: CustomerCard = customer.stripeInfo.cards[removeCardDetails.cardId]

  const stripe = new Stripe(keys.stripe.secretkey, { apiVersion: <any>'2020-08-27' });
  await stripe.paymentMethods.detach(
    card.id,
    { apiVersion: <any>'2020-08-27' }
  );

  for (let orderTypeId in card.idsWithServiceProvider) {
    let orderType: OrderType = orderTypeId as OrderType;
    for (let serviceProviderId in card.idsWithServiceProvider[orderType]) {
      let clonedCardId = card.idsWithServiceProvider[orderType][serviceProviderId];
      let serviceProvider;
      if(orderType == OrderType.Restaurant)
        serviceProvider = await getRestaurant(parseInt(serviceProviderId));
      else 
        throw new HttpsError(
          "internal",
          "invalid order type"
        );
      
      if (!clonedCardId || !(serviceProvider.stripeInfo))
        continue
      let stripeOptions = { apiVersion: <any>'2020-08-27', stripeAccount: serviceProvider.stripeInfo.id };
      const stripe = new Stripe(keys.stripe.secretkey, stripeOptions);
      await stripe.paymentMethods.detach(
        clonedCardId,
        stripeOptions
      );
    }
  }
  delete customer.stripeInfo.cards[removeCardDetails.cardId];
  await updateCustomerStripe(customer);

  return {
    status: ServerResponseStatus.Success,
  }
};

export async function verifyCustomerStripeInfo(customerInfo: CustomerInfo, stripe: Stripe): Promise<CustomerInfo> {

  if(!(customerInfo.stripeInfo)) {
    const customer: Stripe.Customer = await stripe.customers.create({
      name: customerInfo.name,
      metadata: { customerId: customerInfo.id },
    })
    customerInfo.stripeInfo = {
      id: customer.id,
      cards: {},
      idsWithServiceProvider: emptyIdsWithServiceProvider
    }
    updateCustomerStripe(customerInfo);
  }
  return customerInfo;
}

export async function verifyCardForServiceAccount(customer: CustomerInfo, cardId: string, serviceProviderId: number, orderType: OrderType, stripeCustomerServiceAccountId: string, stripe: Stripe, stripeOptions: any): Promise<CustomerCard> {

  if(!(customer.stripeInfo)) {
    throw new HttpsError(
      "internal",
      "Customer does not have stripe account"
    );
  }
  if(!(customer.stripeInfo.cards[cardId])) {
    throw new HttpsError(
      "internal",
      "There is no card with this key"
    );
  }
  let card: CustomerCard = customer.stripeInfo.cards[cardId];

  if(card.idsWithServiceProvider[orderType][serviceProviderId] == null) {
    const clonedPaymentMethod = await stripe.paymentMethods.create({
      customer: customer.stripeInfo.id,
      payment_method: card.id,
    }, stripeOptions);
  
    const paymentMethod = await stripe.paymentMethods.attach(
      clonedPaymentMethod.id,
      { customer: stripeCustomerServiceAccountId },
      stripeOptions
    );
    card.idsWithServiceProvider[orderType][serviceProviderId] = paymentMethod.id;
    customer.stripeInfo.cards[cardId] = card;
    updateCustomerStripe(customer);
  }
  return card;
}