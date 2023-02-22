import { createDeliveryDriver } from "../shared/graphql/delivery/driver/createDeliveryDriver";
import { getDeliveryOperators } from "../shared/graphql/delivery/operator/getDeliveryOperator";
import { getRestaurantOperators } from "../shared/graphql/restaurant/operators/getRestaurantOperators";
import { ParticipantType } from "../shared/models/Generic/Chat";
import { NotificationInfo } from "../shared/models/Generic/Generic";
import { Notification, NotificationAction, NotificationType } from "../shared/models/Notification";
import { AuthorizeDriverNotification, DeliveryDriver, DeliveryOperator, DeliveryServiceProviderType } from "../shared/models/Generic/Delivery";
import { pushNotification } from "../utilities/senders/notifyUser";
import { Operator } from "../shared/models/Services/Service";
import { getLaundryOperators } from "../shared/graphql/laundry/operator/getLaundryOperator";

export interface AddDriverDetails {
    deliveryCompanyId: number,
    notificationInfo?: NotificationInfo,
    deliveryServiceProviderType: DeliveryServiceProviderType
}

export async function addDriver(userId: number, addDriverDetails: AddDriverDetails) {
    //first mutation
    //second notify operators of the company
    
    let deliveryDriver: DeliveryDriver = await createDeliveryDriver(userId, addDriverDetails, addDriverDetails.deliveryServiceProviderType);

    notify(deliveryDriver, addDriverDetails.deliveryServiceProviderType, addDriverDetails);
}

async function notify(deliveryDriver: DeliveryDriver, deliveryCompanyType: DeliveryServiceProviderType, addDriverDetails: AddDriverDetails) {
    let notification: Notification = {
        foreground: <AuthorizeDriverNotification>{
            newDriverName: deliveryDriver.user?.name,
            newDriverImage: deliveryDriver.user?.image,
            time: (new Date()).toISOString(),
            notificationType: NotificationType.NewDriver,
            notificationAction: NotificationAction.ShowSnackbarOnlyIfNotOnPage,
        },
        background: {
            en: {
                title: `Authorize driver`,
                body: `Driver ${deliveryDriver.user?.name} is requesting to join`
            },
            es: {
                title: `Autorizar conductor`,
                body: `Conductor ${deliveryDriver.user?.name} está solicitando unirse`
            }
        },
        linkUrl: `/`
    };
    switch (deliveryCompanyType) {
        case DeliveryServiceProviderType.DeliveryCompany:
            let deliveryOperators: DeliveryOperator[] = await getDeliveryOperators(addDriverDetails.deliveryCompanyId);
            deliveryOperators.forEach((d) => {
                if (d.user) {
                    pushNotification(
                        d.user.firebaseId,
                        notification,
                        d.notificationInfo,
                        ParticipantType.DeliveryOperator
                    );
                }
            });
            break;
        case DeliveryServiceProviderType.Restaurant:
            let restaurantOperators: Operator[] = await getRestaurantOperators(addDriverDetails.deliveryCompanyId);
            restaurantOperators.forEach((o) => {
                if (o.owner && o.user) {
                    pushNotification(
                        o.user.firebaseId,
                        notification,
                        o.notificationInfo,
                        ParticipantType.RestaurantOperator,
                        o.user.language
                    );
                }
            });
            break;
            case DeliveryServiceProviderType.Laundry:
            let laundryOperators: Operator[] = await getLaundryOperators(addDriverDetails.deliveryCompanyId);
            laundryOperators.forEach((o) => {
                if (o.owner && o.user) {
                    pushNotification(
                        o.user.firebaseId,
                        notification,
                        o.notificationInfo,
                        ParticipantType.LaundryOperator,
                        o.user.language
                    );
                }
            });
            break;
        default:
            break;
    }
}
