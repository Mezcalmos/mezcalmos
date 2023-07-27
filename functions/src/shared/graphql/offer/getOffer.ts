import { getHasura } from "../../../utilities/hasura";
import { Offer, OfferStatus, OfferType } from "../../models/Services/Offer";
import { ServiceProviderType } from "../../models/Services/Service";
import { MezError } from "../../models/Generic/Generic";

export async function getServiceProviderOffers(
    serviceProviderId: number, 
    serviceProviderType: ServiceProviderType
): Promise<Offer[]> {
    let chain = getHasura();

    let response = await chain.query({
        service_provider_offer: [{
            where: {
                _and: [{
                    service_provider_id: {
                        _eq: serviceProviderId
                    },
                }, {
                    service_provider_type: {
                        _eq: serviceProviderType
                    }
                }, {
                    status: {
                        _eq: OfferStatus.Active
                    }
                }],
            }
        }, {
            id: true,
            offer_type: true,
            coupon_code: true,
            details: [{}, true],
            status: true,
            // name: 
        }]
    });
    let offers: Offer[] = response.service_provider_offer.map((o): Offer => {
        return {
            id: o.id,
            offerType: o.offer_type as OfferType,
            serviceProviderType,
            serviceProviderId,
            couponCode: o.coupon_code,
            details: JSON.parse(o.details),
            status: o.status as OfferStatus
        }
    })
    return offers;
}

export async function getCouponDetails(
    serviceProviderId: number, 
    serviceProviderType: ServiceProviderType,
    couponCode: string
): Promise<Offer> {
    let chain = getHasura();

    let response = await chain.query({
        service_provider_offer: [{
            where: {
                _and: [{
                    service_provider_id: {
                        _eq: serviceProviderId
                    }
                },{
                    coupon_code: {
                        _eq: couponCode
                    }
                }, {
                    service_provider_type: {
                        _eq: serviceProviderType
                    }
                }, {
                    status: {
                        _eq: OfferStatus.Active
                    }
                }],
                
            }
        }, {
            id: true,
            offer_type: true,
            coupon_code: true,
            details: [{}, true],
            status: true,
            // name: 
        }]
    });
    if(response.service_provider_offer.length == 0) {
        throw new MezError("invalidCouponCode");
    }
    return {
        id: response.service_provider_offer[0].id,
        offerType: response.service_provider_offer[0].offer_type as OfferType,
        serviceProviderType,
        serviceProviderId,
        couponCode,
        details: JSON.parse(response.service_provider_offer[0].details),
        status: response.service_provider_offer[0].status as OfferStatus
    }
}

export async function getOfferApplied(
    customerId: number,
    offerId: number
): Promise<boolean> {
    let chain = getHasura();

        let response = await chain.query({
            service_provider_offer_applied: [{
                where: {
                    _and: [{
                        offer_id: {
                            _eq: offerId
                        }
                    }, {
                    }, {
                        restaurant_order: {
                            customer_id: {
                                _eq: customerId
                            }
                        }
                    }],
                    
                }
            }, {
                offer_id: true
            }]
        });
        if(response.service_provider_offer_applied && response.service_provider_offer_applied.length) {
            return true;
        }
    return false;
}