import { HttpsError } from "firebase-functions/v1/auth";
import { AssignDriverDetails } from "../../../../delivery/assignDriver";
import { getHasura } from "../../../../utilities/hasura";

export async function assignDeliveryDriver(assignDriverDetails: AssignDriverDetails) {
  let chain = getHasura();
  
  let response = await chain.mutation({
    update_delivery_order_by_pk: [{
      pk_columns: {
        id: assignDriverDetails.deliveryOrderId
      },
      _set: {
        delivery_driver_type: assignDriverDetails.deliveryDriverType,
        delivery_driver_id: assignDriverDetails.deliveryDriverId,
      }
    }, {
      id: true
    }]
  });
  if(response.update_delivery_order_by_pk == null) {
    throw new HttpsError(
      "internal",
      "No delivery with that id found"
    );
  }
}