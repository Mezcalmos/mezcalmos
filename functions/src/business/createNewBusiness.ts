import { createBusiness } from "../shared/graphql/business/createBusiness";
import { getUser } from "../shared/graphql/user/getUser";
import { getMezAdmins } from "../shared/graphql/user/mezAdmin/getMezAdmin";
import { ParticipantType } from "../shared/models/Generic/Chat";
import { Language, Location } from "../shared/models/Generic/Generic";
import { MezAdmin } from "../shared/models/Generic/User";
import { Notification, NotificationAction, NotificationType } from "../shared/models/Notification";
import { Business, BusinessProfile, NewBusinessNotification } from "../shared/models/Services/Business/Business";
import { businessUrl } from "../utilities/senders/appRoutes";
import { pushNotification } from "../utilities/senders/notifyUser";

export interface BusinessDetails {
    name: string,
    image: string,
    profile: BusinessProfile,
    location: Location,
    businessOperatorNotificationToken?: string,
    language: Record<Language, boolean>
}
  
export async function createNewBusiness(userId: number, businessDetails: BusinessDetails) {
  
    let userPromise = getUser(userId);
    let mezAdminsPromise = getMezAdmins();
    let promiseResponse = await Promise.all([userPromise, mezAdminsPromise]);
    let mezAdmins: MezAdmin[] = promiseResponse[1];
  
    let business: Business = await createBusiness(businessDetails, userId);
  
    notifyAdmins(business, mezAdmins);
  
};

function notifyAdmins(business: Business, mezAdmins: MezAdmin[]) {
    let notification: Notification = {
      foreground: <NewBusinessNotification>{
        time: (new Date()).toISOString(),
        notificationType: NotificationType.NewBusiness,
        notificationAction: NotificationAction.ShowSnackBarAlways,
        name: business.name,
        image: business.image,
        id: business.id
      },
      background: {
        [Language.ES]: {
          title: "Nuevo negocio",
          body: `Hay un nuevo negocio`
        },
        [Language.EN]: {
          title: "New Business",
          body: `Thers is a new business`
        }
      },
      linkUrl: businessUrl(business.id)
    };
    mezAdmins.forEach((m) => {
      pushNotification(m.firebaseId!, notification, m.notificationInfo, ParticipantType.MezAdmin);
    });
  }