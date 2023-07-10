import { getCourierOrder } from "../shared/graphql/delivery/courier/getCourierOrder"
import { getDeliveryOperators } from "../shared/graphql/delivery/operator/getDeliveryOperator";
import { updateDeliveryOrderStatus } from "../shared/graphql/delivery/updateDelivery";
import { getMezAdmins } from "../shared/graphql/user/mezAdmin/getMezAdmin";
import { ParticipantType } from "../shared/models/Generic/Chat";
import { DeliveryOrderStatus } from "../shared/models/Generic/Delivery";
import { MezError } from "../shared/models/Generic/Generic";
import { OrderType } from "../shared/models/Generic/Order";
import { MezAdmin } from "../shared/models/Generic/User";
import { Notification, NotificationAction, NotificationType } from "../shared/models/Notification";
import { CourierOrder, CourierOrderStatusChangeNotification, orderInProcess } from "../shared/models/Services/Courier/Courier"
import { Operator } from "../shared/models/Services/Service";
import { pushNotification } from "../utilities/senders/notifyUser";
import { deliveryOrderStatusChangeMessages } from "./bgNotificationMessages";

interface CancelOrderDetails {
    orderId: number
}
export interface CancelCourierResponse {
    success: boolean,
    error?: CancelCourierError
    unhandledError?: string,
}
enum CancelCourierError {
    UnhandledError = "unhandledError",
    OrderNotFound = " orderNotFound",
    IncorrectOrderId = "incorrectOrderId",
    OrderNotInProcess = "orderNotInProcess",
}

export async function cancelCourierFromCustomer(userId: number, cancelOrderDetails: CancelOrderDetails): Promise<CancelCourierResponse> {
    try {
        let courierOrder: CourierOrder = await getCourierOrder(cancelOrderDetails.orderId);
        
        if (courierOrder.customerId != userId) {
            throw new MezError(CancelCourierError.IncorrectOrderId);
        }
        if (!orderInProcess(courierOrder.deliveryOrder.status)) {
            throw new MezError(CancelCourierError.OrderNotInProcess);
        }

        courierOrder.deliveryOrder.status = DeliveryOrderStatus.CancelledByCustomer;
        updateDeliveryOrderStatus(courierOrder.deliveryOrder);

        notify(courierOrder, cancelOrderDetails, courierOrder.deliveryOrder.deliveryId);
        return {
            success: true,
        }
    } catch(e: any) {
        if (e instanceof MezError) {
            if (Object.values(CancelCourierError).includes(e.message as any)) {
                return {
                    success: false,
                    error: e.message as any
                }
            } else {
                return {
                    success: false,
                    error: CancelCourierError.UnhandledError,
                    unhandledError: e.message as any
                }
            }
        } else {
        throw e
        }
    }
}

async function notify(courierOrder: CourierOrder, cancelOrderDetails: CancelOrderDetails, deliveryId: number) {
    let mezAdmins: MezAdmin[] = await getMezAdmins();

    let adminNotification: Notification = {
        foreground: <CourierOrderStatusChangeNotification>{
            status: DeliveryOrderStatus.CancelledByCustomer,
            time: (new Date()).toISOString(),
            notificationType: NotificationType.OrderStatusChange,
            orderType: OrderType.Courier,
            notificationAction: NotificationAction.ShowPopUp,
            orderId: cancelOrderDetails.orderId
        },
        background: deliveryOrderStatusChangeMessages[courierOrder.deliveryOrder.status],
        linkUrl: `/deliveryOrders/${deliveryId}`
    };
    mezAdmins.forEach((m) => {
        pushNotification(m.firebaseId!, adminNotification, m.notificationInfo, ParticipantType.MezAdmin, m.language);
    });
    if(courierOrder.deliveryOrder.serviceProviderId) {
        let deliveryOperators: Operator[] = await getDeliveryOperators(courierOrder.deliveryOrder.serviceProviderId);
        deliveryOperators.forEach((d) => {
            pushNotification(d.user?.firebaseId!,
                adminNotification,
                d.notificationInfo,
                ParticipantType.DeliveryOperator,
                d.user?.language
            );
        });
    }

    let driverNotification: Notification = {
        foreground: <CourierOrderStatusChangeNotification>{
            status: DeliveryOrderStatus.CancelledByCustomer,
            time: (new Date()).toISOString(),
            notificationType: NotificationType.OrderStatusChange,
            orderType: OrderType.Courier,
            notificationAction: NotificationAction.ShowPopUp,
            orderId: deliveryId
        },
        background: deliveryOrderStatusChangeMessages[courierOrder.deliveryOrder.status],
        linkUrl: `/orders/${deliveryId}`
    };
    if (courierOrder.deliveryOrder.deliveryDriver) {
        pushNotification(courierOrder.deliveryOrder.deliveryDriver.user?.firebaseId!,
            driverNotification,
            courierOrder.deliveryOrder.deliveryDriver.notificationInfo,
            ParticipantType.DeliveryDriver,
            courierOrder.deliveryOrder.deliveryDriver.user?.language
        );
    }
}
