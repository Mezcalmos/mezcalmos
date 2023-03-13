import { HttpsError } from "firebase-functions/v1/auth";
import { getHasura } from "../../../utilities/hasura";
import { ChangePriceStatus, DeliveryOrder, DeliveryServiceProviderType } from "../../models/Generic/Delivery";

export async function updateDeliveryOrderStatus(deliveryOrder: DeliveryOrder) {
  let chain = getHasura();

  await chain.mutation({
    update_delivery_order_by_pk: [{
      pk_columns: {
        id: deliveryOrder.deliveryId
      }, 
      _set: {
        status: deliveryOrder.status,
        package_ready: deliveryOrder.packageReady ,
      }
    }, { 
      status: true
    }]
  });
}

export async function updateDeliveryOrderCompany(deliveryOrderId: number, deliveryCompanyId: number) {
  let chain = getHasura();

  await chain.mutation({
    update_delivery_order_by_pk: [{ 
      pk_columns: {
        id: deliveryOrderId
      },
      _set: {
        service_provider_type: DeliveryServiceProviderType.DeliveryCompany,
        service_provider_id: deliveryCompanyId
      }
    }, {
      delivery_company: {
        id: true
      }
    }]
  })
}

export async function updateDeliveryPackageCost(deliveryOrder: DeliveryOrder) {
  let chain = getHasura();

  await chain.mutation({
    update_delivery_order_by_pk: [{
      pk_columns: {
        id: deliveryOrder.deliveryId
      }, 
      _set: {
        package_cost: deliveryOrder.packageCost
      }
    }, { 
      package_cost: true
    }]
  });
}

export async function updateDeliveryChangePriceRequest(deliveryOrder: DeliveryOrder) {
  let chain = getHasura();

  if(deliveryOrder.changePriceRequest == null) {
    throw new HttpsError(
      "internal",
      "Change Price Request not set"
    );
  }
  switch (deliveryOrder.changePriceRequest.status) {
    case ChangePriceStatus.Requested:
      await chain.mutation({
        update_delivery_order_by_pk: [{
          pk_columns: {
            id: deliveryOrder.deliveryId
          },
          _set: {
            change_price_request: JSON.stringify(deliveryOrder.changePriceRequest)
          }
        }, {
          delivery_cost: true
        }]
      })
      break;
    case ChangePriceStatus.Accepted:
      await chain.mutation({
        update_delivery_order_by_pk: [{
          pk_columns: {
            id: deliveryOrder.deliveryId
          },
          _set: {
            change_price_request: JSON.stringify(deliveryOrder.changePriceRequest),
            delivery_cost: deliveryOrder.deliveryCost
          }
        }, {
          delivery_cost: true
        }]
      })
      break;
    default:
      await chain.mutation({
        update_delivery_order_by_pk: [{
          pk_columns: {
            id: deliveryOrder.deliveryId
          },
          _set: {
            change_price_request: JSON.stringify(deliveryOrder.changePriceRequest),
            delivery_driver_id: null!,
          }
        }, {
          delivery_cost: true
        }]
      })
      break;
  }
  
}

export async function setLockTime(deliveryOrderId: number) {
  let chain = getHasura();

  let response = await chain.mutation({
    update_delivery_order: [{
      where: {
        _and: [{
          id: {
            _eq: deliveryOrderId
          }
        }, {
          _or: [{
            lock_time: {
              _is_null: true
            }
          }, {
            lock_time: {
              _lt: new Date(Date.now() - 5 * 60 * 1000)
            }
          }]
        }, {
          delivery_driver_id: {
            _is_null: true
          }
        }]
      },
      _set: {
        lock_time: new Date()
      }
    }, { 
      affected_rows: true
    }]
  });
  console.log("affected rows: ", response.update_delivery_order?.affected_rows)
  if(response.update_delivery_order == null || response.update_delivery_order.affected_rows == 0) {
    throw new HttpsError(
      "internal",
      "delivery driver already assigned"
    );
  }

}

export async function clearLock(deliveryOrderId: number) {
  let chain = getHasura();

  await chain.mutation({
    update_delivery_order_by_pk: [{
      pk_columns: {
        id: deliveryOrderId
      }, 
      _set: {
        lock_time: null!
      }
    }, { 
      lock_time: true
    }]
  });
}