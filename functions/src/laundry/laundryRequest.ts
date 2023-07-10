import { setLaundryOrderChatInfo } from "../shared/graphql/chat/setChatInfo";
import { getLaundryStore } from "../shared/graphql/laundry/getLaundry";
import { createLaundryOrder } from "../shared/graphql/laundry/order/createLaundryOrder";
import { getCustomer } from "../shared/graphql/user/customer/getCustomer";
import { getMezAdmins } from "../shared/graphql/user/mezAdmin/getMezAdmin";
import { notifyDeliveryDrivers } from "../shared/helper";
import { ParticipantType } from "../shared/models/Generic/Chat";
import { CustomerAppType, Language, Location, MezError } from "../shared/models/Generic/Generic";
import { DeliveryType, OrderType, PaymentType } from "../shared/models/Generic/Order";
import { CustomerInfo, MezAdmin } from "../shared/models/Generic/User";
import { Notification, NotificationAction, NotificationType } from "../shared/models/Notification";
import { LaundryOrder, NewLaundryOrderNotification } from "../shared/models/Services/Laundry/LaundryOrder";
import { ServiceProvider } from "../shared/models/Services/Service";
import { orderUrl } from "../utilities/senders/appRoutes";
import { pushNotification } from "../utilities/senders/notifyUser";
import { PaymentDetails, updateOrderIdAndFetchPaymentInfo } from "../utilities/stripe/payment";

export interface LaundryRequestDetails {
    storeId: number,
    paymentType: PaymentType,  
    deliveryType: DeliveryType,
    customerLocation: Location,
    fromCustomerDeliveryOffer?: number;
    chosenCompanies?: Array<number>,
    customerAppType: CustomerAppType,
    notes?: string,
    tax?: number,
    scheduledTime?: string,
    stripeFees?: number,
    stripePaymentId?: string,
    discountValue?: number,
    tripDistance: number,
    tripDuration: number,
    tripPolyline: string
    distanceFromBase?: number
}
export interface ReqLaundryResponse {
    success: boolean,
    error?: ReqLaundryError
    unhandledError?: string,
    orderId?: number
}
export enum ReqLaundryError {
    UnhandledError = "unhandledError",
    LaundryStoreNotfound = "laundryStoreNotfound",
    CustomerNotFound = "customerNotFound",
    LaundryStoreNotApproved = "laundryStoreNotApproved",
    StoreClosed = "storeClosed",
    DeliveryNotAvailable = "deliveryNotAvailable",
    OrderCreationError = "orderCreationError",
    NoChatId = "noChatId",
    DeliveryCompanyOperatorsNotFound = "deliveryCompanyOperatorsNotFound",
    ServiceProviderDetailsNotFound = "serviceProviderDetailsNotFound",
    InvalidOrderType = "invalidOrderType",
    NoStripeAccountOfServiceProvider = "noStripeAccountOfServiceProvider",
    UpdateOrderStripeError = "updateOrderStripeError",
}

export async function requestLaundry(customerId: number, laundryRequestDetails: LaundryRequestDetails): Promise<ReqLaundryResponse> {
    try {
        let response = await Promise.all([
            getLaundryStore(laundryRequestDetails.storeId), 
            getCustomer(customerId),
            getMezAdmins()
        ])
        let laundryStore: ServiceProvider = response[0];
        let customer: CustomerInfo = response[1];
        let mezAdmins: MezAdmin[] = response[2];

        errorChecks(laundryStore, laundryRequestDetails);
        
        let orderResponse = await createLaundryOrder(customerId, laundryRequestDetails, laundryStore, mezAdmins);

        setLaundryOrderChatInfo(orderResponse.laundryOrder, laundryStore, orderResponse.fromCustomerDeliveryOrder, customer);

        // assign delivery company 
        if(orderResponse.laundryOrder.deliveryType == DeliveryType.Delivery && laundryStore.deliveryDetails.selfDelivery == false) {

            notifyDeliveryDrivers(orderResponse.fromCustomerDeliveryOrder);
        }

        notify(orderResponse.laundryOrder, laundryStore, mezAdmins);

        // payment
        if(laundryRequestDetails.paymentType == PaymentType.Card) {
            let paymentDetails: PaymentDetails = {
                orderId: orderResponse.laundryOrder.orderId!,
                serviceProviderDetailsId: laundryStore.serviceProviderDetailsId
            }
            await updateOrderIdAndFetchPaymentInfo(paymentDetails, laundryRequestDetails.stripePaymentId!, laundryRequestDetails.stripeFees ?? 0)
        }
        
        return {
            success: true,
            orderId: orderResponse.laundryOrder.orderId
        }
    } catch(e: any) {
        if (e instanceof MezError) {
            if (Object.values(ReqLaundryError).includes(e.message as any)) {
                return {
                    success: false,
                    error: e.message as any
                }
            } else {
                return {
                    success: false,
                    error: ReqLaundryError.UnhandledError,
                    unhandledError: e.message as any
                }
            }
        } else {
            throw e
        }
    }
}

function errorChecks(laundryStore: ServiceProvider, laundryRequestDetails: LaundryRequestDetails) {

    if(laundryStore.approved == false) {
        throw new MezError(ReqLaundryError.LaundryStoreNotApproved);
    }
    if(laundryStore.openStatus != "open") {
        throw new MezError(ReqLaundryError.StoreClosed);
    }
    if(laundryRequestDetails.deliveryType == DeliveryType.Delivery && laundryStore.deliveryDetails.deliveryAvailable == false) {
        throw new MezError(ReqLaundryError.DeliveryNotAvailable);
    }
}
async function notify(laundryOrder: LaundryOrder, laundryStore: ServiceProvider, mezAdmins: MezAdmin[]) {

    let notification: Notification = {
        foreground: <NewLaundryOrderNotification>{
            time: (new Date()).toISOString(),
            notificationType: NotificationType.NewOrder,
            orderType: OrderType.Laundry,
            orderId: laundryOrder.orderId,
            notificationAction: NotificationAction.ShowSnackBarAlways,
            laundryStore: {
                name: laundryStore.name,
                image: laundryStore.image,
                id: laundryStore.id
            }
        },
        background: {
            [Language.ES]: {
                title: "Nueva Pedido",
                body: `Hay un nuevo pedido de lavandería.`
            },
            [Language.EN]: {
                title: "New Order",
                body: `There is a new laundry order`
            }
        },
        linkUrl: orderUrl(OrderType.Laundry, laundryOrder.orderId!)
    }
    mezAdmins.forEach((m) => {
        pushNotification(m.firebaseId!, notification, m.notificationInfo, ParticipantType.MezAdmin, m.language);
    });
    if(laundryStore.operators != undefined) {
        laundryStore.operators.forEach((l) => {
          if(l.user && l.notificationInfo?.turnOffNotifications == false) {
            pushNotification(l.user.firebaseId, notification, l.notificationInfo, ParticipantType.LaundryOperator, l.user.language);
          }
        });
    }
}
  