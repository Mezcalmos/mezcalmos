import { $ } from "../../../../../hasura/library/src/generated/graphql-zeus";
import { LaundryDetails, LaundryError } from "../../../laundry/createNewLaundry";
import { getHasura } from "../../../utilities/hasura";
import { DeepLinkType, IDeepLink, generateDeepLinks } from "../../../utilities/links/deeplink";
import { AppType, AuthorizationStatus, MezError } from "../../models/Generic/Generic";
import { PaymentType } from "../../models/Generic/Order";
import { ServiceProvider, ServiceProviderType } from "../../models/Services/Service";

export async function createLaundryStore(
    laundryDetails: LaundryDetails, 
    laundryOperatorUserId: number
): Promise<ServiceProvider>  {
    let chain = getHasura();

    let uniqueId: string = laundryDetails.uniqueId ?? generateString();

    let linksResponse: Record<DeepLinkType, IDeepLink> = await generateDeepLinks(uniqueId, AppType.Laundry)


    let response = await chain.mutation({
        insert_laundry_store_one: [{
            object: {
                delivery_details: { data:  {
                    self_delivery: laundryDetails.deliveryDetails.selfDelivery,
                    delivery_available: laundryDetails.deliveryDetails.deliveryAvailable,
                    customer_pickup: laundryDetails.deliveryDetails.customerPickup,
                    minimum_cost: laundryDetails.deliveryDetails.minimumCost,
                    cost_per_km: laundryDetails.deliveryDetails.costPerKm,
                    radius: laundryDetails.deliveryDetails.radius,
                    free_delivery_minimum_cost: laundryDetails.deliveryDetails.freeDeliveryMinimumCost,
                    free_delivery_km_range: laundryDetails.deliveryDetails.freeDeliveryKmRange
                }},
                delivery_partners: (laundryDetails.deliveryPartnerId) ? {
                    data: [{
                        delivery_company_id: laundryDetails.deliveryPartnerId
                    }]
                }: undefined,
                details: {
                    data: {
                        name: laundryDetails.name,
                        image: laundryDetails.image,
                        schedule: $`schedule`,
                        firebase_id: laundryDetails.firebaseId ?? undefined,
                        language: $`language`,
                        service_provider_type: ServiceProviderType.Laundry,
                        unique_id: uniqueId,
                        accepted_payments: $`accepted_payments`,
                        location: {
                            data: {
                                gps: $`gps`,
                                address: laundryDetails.location.address
                            }
                        },
                        service_link: {
                            data: {
                              customer_deep_link: linksResponse[DeepLinkType.Customer].url,
                              customer_qr_image_link: linksResponse[DeepLinkType.Customer].urlQrImage,
                              operator_deep_link: linksResponse[DeepLinkType.AddOperator].url,
                              operator_qr_image_link: linksResponse[DeepLinkType.AddOperator].urlQrImage,
                              driver_deep_link: linksResponse[DeepLinkType.AddDriver].url,
                              driver_qr_image_link: linksResponse[DeepLinkType.AddDriver].urlQrImage,
                            }
                          }
                    }
                },
                operators: {
                    data: [{
                        user_id: laundryOperatorUserId,
                        operator_details: {
                            data: {
                                user_id: laundryOperatorUserId,
                                status: AuthorizationStatus.Authorized,
                                owner: true,
                                app_type_id: AppType.Laundry,
                                // notification_info: (laundryDetails.laundryOperatorNotificationToken)? {
                                //     data: {
                                //       user_id: laundryOperatorUserId,
                                //       app_type_id: AppType.RestaurantApp,
                                //       token: laundryDetails.laundryOperatorNotificationToken
                                //     }
                                //   }: undefined
                            }
                        }
                        
                    }]
                },
                
            }
        }, {
            service_provider_type : true,
            id: true,
            details_id: true
        }],
    }, {
        "schedule": laundryDetails.schedule,
        "language": laundryDetails.language,
        "accepted_payments": <Record<PaymentType, boolean>>{
            [PaymentType.Cash]: true,
            [PaymentType.Card]: false,
            [PaymentType.BankTransfer]: false,
        },
        "gps": {
            "type": "Point",
            "coordinates": [laundryDetails.location.lng, laundryDetails.location.lat]
        }
    });
    
    console.log("response: ", response);
    
    if(response.insert_laundry_store_one == null) {
        throw new MezError(LaundryError.LaundryCreationError);
    }
    let laundryStore: ServiceProvider = {
        id: response.insert_laundry_store_one.id,
        serviceProviderDetailsId: response.insert_laundry_store_one.details_id,
        name: laundryDetails.name,
        image: laundryDetails.image,
        location: laundryDetails.location,
        schedule: laundryDetails.schedule,
        deliveryPartnerId: laundryDetails.deliveryPartnerId,
        deliveryDetails: laundryDetails.deliveryDetails,
        language: laundryDetails.language,
        firebaseId: laundryDetails.firebaseId,
        serviceProviderType: ServiceProviderType.Laundry,
        uniqueId
    }
    // if(laundryDetails.deliveryPartnerId) {
    //     await chain.mutation({
    //         insert_service_provider_delivery_partner_one: [{
    //             object: {
    //                 delivery_company_id: laundryDetails.deliveryPartnerId,
    //                 service_provider_id: response.insert_laundry_store_one.id,
    //                 service_provider_type: ServiceProviderType.Laundry
    //             }
    //         }, {
    //             id: true,
    //         }]
    //     });
    // }
    if(laundryDetails.laundryOperatorNotificationToken) {
        chain.mutation({
            insert_notification_info_one: [{
                object: {
                    user_id: laundryOperatorUserId,
                    app_type_id: AppType.Laundry,
                    token: laundryDetails.laundryOperatorNotificationToken
                }
            }, {
                id: true
            }]
        });
    }
    return laundryStore
}

function generateString(): string {
    let result = '';
    const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    const charactersLength = characters.length;
    let counter = 0;
    while (counter < 8) {
        result += characters.charAt(Math.floor(Math.random() * charactersLength));
        counter += 1;
    }
    return result;
}