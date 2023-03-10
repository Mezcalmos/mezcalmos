import { HttpsError } from "firebase-functions/v1/auth";
import { getHasura } from "../../../../utilities/hasura";
import { OrderStripeInfo } from "../../../../utilities/stripe/model";
import { RestaurantOrder } from "../../../models/Services/Restaurant/RestaurantOrder";

export async function updateRestaurantOrderStatus(order: RestaurantOrder) {
  let chain = getHasura();
  if(order.orderId == null) {
    throw new HttpsError(
      "internal",
      "order id not provided"
    );
  }
  console.log("updateRestaurantOrderStatus")
  console.log(order.refundAmount)
  await chain.mutation({
    update_restaurant_order_by_pk: [{
      pk_columns: {
        id: order.orderId
      }, 
      _set: {
        status: order.status,
        refund_amount: order.refundAmount
      }
    }, { 
      status: true
    }]
  });
}

export async function setEstFoodReadyTime(orderId: number, estimatedFoodReadyTime: string) {
  let chain = getHasura();
  if(orderId == null) {
    throw new HttpsError(
      "internal",
      "order id not provided"
    );
  }
  await chain.mutation({
    update_restaurant_order_by_pk: [{
      pk_columns: {
        id: orderId
      }, 
      _set: {
        estimated_food_ready_time: estimatedFoodReadyTime
      }
    }, { }]
  });
}
export async function updateRestaurantOrderStripe(orderId: number, orderStripePaymentInfo: OrderStripeInfo) {
  let chain = getHasura();
  
  let response = await chain.mutation({
    update_restaurant_order_by_pk: [{
      pk_columns: {
        id: orderId
      }, 
      _set: {
        stripe_info: JSON.stringify(orderStripePaymentInfo),
        stripe_fees: orderStripePaymentInfo.stripeFees
      }
    }, { 
      stripe_info: [{}, true]
    }]
  });
  if(!(response.update_restaurant_order_by_pk)) {
    throw new HttpsError(
      "internal",
      "error in updating order"
    );
  }
}

export async function updateRestaurantOrderDeliveryCost(orderId: number, newDeliveryCost: number) {
  let chain = getHasura();
  
  let response = await chain.mutation({
    update_restaurant_order_by_pk: [{
      pk_columns: {
        id: orderId
      }, 
      _set: {
        delivery_cost: newDeliveryCost
      }
    }, { 
      delivery_id: true
    }]
  });
  if(!(response.update_restaurant_order_by_pk)) {
    throw new HttpsError(
      "internal",
      "error in updating restaurant order"
    );
  }
}