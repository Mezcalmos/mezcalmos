import { getHasura } from "../../../utilities/hasura";
import { DeepLinkType, generateDeepLinks, IDeepLink } from "../../../utilities/links/deeplink";
import { ServiceProviderStripeInfo } from "../../models/stripe";
import { SetupStripeError, UpdateStripeError } from "../../../utilities/stripe/serviceProvider";
import { ChangeUniqueIdError } from "../../changeUniqueId";
import { AppType, MezError } from "../../models/Generic/Generic";
import { ServiceProvider, ServiceProviderType } from "../../models/Services/Service";

export async function createServiceProviderStripe(serviceProvider: ServiceProvider) {
    let chain = getHasura();

    let stripeResponse = await chain.mutation({
        insert_service_provider_stripe_info_one: [{
            object: {
                charge_fees_on_customer: serviceProvider.stripeInfo!.chargeFeesOnCustomer ?? undefined,
                charges_enabled: serviceProvider.stripeInfo!.chargesEnabled,
                details_submitted: serviceProvider.stripeInfo!.detailsSubmitted,
                email: serviceProvider.stripeInfo!.email ?? undefined,
                payouts_enabled: serviceProvider.stripeInfo!.payoutsEnabled,
                requirements: JSON.stringify(serviceProvider.stripeInfo!.requirements),
                stripe_id: serviceProvider.stripeInfo!.id,
                status: serviceProvider.stripeInfo!.status,
            },
            // on_conflict: {
            //     constraint: service_provider_stripe_info_constraint.stripe_info_stripe_id_key,
            //     update_columns: [service_provider_stripe_info_update_column.]
            // }
        }, {
            id: true,
        }]
    })
    if(!(stripeResponse.insert_service_provider_stripe_info_one)) {
        throw new MezError(SetupStripeError.StripeUpdateError);
    }
    // let mutationResponse = 
    chain.mutation({
        update_service_provider_details_by_pk: [{
            pk_columns: {
                id: serviceProvider.serviceProviderDetailsId!
            },
            _set: {
                stripe_id: stripeResponse.insert_service_provider_stripe_info_one.id,
            }
        }, {
            id: true
        }]
    });
}

export async function updateServiceProviderStripe(stripeInfo: ServiceProviderStripeInfo) {
    let chain = getHasura();

    let response = await chain.mutation({
        update_service_provider_stripe_info: [{
            where: {
                stripe_id: {
                    _eq: stripeInfo.id
                }
            },
            _set: {
                charge_fees_on_customer: stripeInfo.chargeFeesOnCustomer ?? undefined,
                charges_enabled: stripeInfo.chargesEnabled,
                details_submitted: stripeInfo.detailsSubmitted,
                email: stripeInfo.email ?? undefined,
                payouts_enabled: stripeInfo.payoutsEnabled,
                requirements: JSON.stringify(stripeInfo.requirements),
                status: stripeInfo.status,
            }
        }, {
            affected_rows: true
        }]
    });
    if(response.update_service_provider_stripe_info == null) {
        throw new MezError(UpdateStripeError.NoStripeAccount);
    }
}
export async function updateServiceProviderPayment(serviceProvider: ServiceProvider) {
    let chain = getHasura();

    chain.mutation({
        update_service_provider_details_by_pk: [{
            pk_columns: {
                id: serviceProvider.serviceProviderDetailsId
            },
            _set: {
                accepted_payments: JSON.stringify(serviceProvider.acceptedPayments)
            }
        }, {
            id: true
        }]
    });
}

export async function updateUniqueIdAndServiceLinks(serviceProvider: ServiceProvider, newUniqueId: string) {
    let chain = getHasura();

    let response = await chain.mutation({
        update_service_provider_details_by_pk: [{
            pk_columns: {
                id: serviceProvider.serviceProviderDetailsId
            },
            _set: {
                unique_id: newUniqueId
            }
        }, {
            service_link_id: true,
        }]
    });
    if(response.update_service_provider_details_by_pk == null || response.update_service_provider_details_by_pk.service_link_id == null) {
        throw new MezError(ChangeUniqueIdError.MutationError);
    }
    let appType: AppType;
    switch (serviceProvider.serviceProviderType) {
        case ServiceProviderType.Restaurant:
            appType = AppType.Restaurant
            break;
        case ServiceProviderType.DeliveryCompany:
            appType = AppType.DeliveryAdmin
            break;
        case ServiceProviderType.Laundry:
            appType = AppType.Laundry
            break;
        default:
            throw new MezError(ChangeUniqueIdError.InvalidServiceProviderType);
    }
    let deepLinks: Record<DeepLinkType, IDeepLink> = await generateDeepLinks(newUniqueId, appType);
    
    await chain.mutation({
        update_service_provider_service_link_by_pk: [{
            pk_columns: {
                id: response.update_service_provider_details_by_pk.service_link_id
            },
            _set: {
                customer_deep_link: deepLinks[DeepLinkType.Customer].url,
                customer_qr_image_link: deepLinks[DeepLinkType.Customer].urlQrImage,
                operator_deep_link: deepLinks[DeepLinkType.AddOperator].url,
                operator_qr_image_link: deepLinks[DeepLinkType.AddOperator].urlQrImage,
                driver_deep_link: deepLinks[DeepLinkType.AddDriver].url,
                driver_qr_image_link: deepLinks[DeepLinkType.AddDriver].urlQrImage,
            }
        }, {
            id: true,
        }]
    });
}