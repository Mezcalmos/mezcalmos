import { $, customer_stripe_cards_constraint, customer_stripe_sp_id_constraint } from "../../../../../../hasura/library/src/generated/graphql-zeus";
import { getHasura } from "../../../../utilities/hasura";
import { MezError } from "../../../models/Generic/Generic";
import { CustomerInfo } from "../../../models/Generic/User";

export async function updateCustomerStripe(customer: CustomerInfo) {
    let chain = getHasura();
    if(customer.stripeInfo == null) {
        throw new MezError("noCustomerStripeInfo");
    }
    let stripeCardsArray = [];
    for(let cardId in customer.stripeInfo.cards) {
        let card = customer.stripeInfo.cards[cardId];
        stripeCardsArray.push({
            brand: card.brand,
            card_id: card.cardId,
            customer_id: customer.id,
            exp_month: card.expMonth,
            exp_year: card.expYear,
            last_4: card.last4,
            sp_card_ids: card.idsWithServiceProvider
        })
    }
    let stripeSPIdsArray = []
    for(let stripeSPId in customer.stripeInfo.idsWithServiceProvider) {
        stripeSPIdsArray.push({
            customer_id: customer.id,
            sp_id: parseInt(stripeSPId),
            stripe_id: customer.stripeInfo.idsWithServiceProvider[stripeSPId]
        })
    }
    
    let response = await chain.mutation({
        update_customer_customer_by_pk: [{
            pk_columns: {
                user_id: customer.id
            },
            _set: {
                stripe_id: customer.stripeInfo.id,
                // stripe_info: JSON.stringify(customer.stripeInfo),
            }
        }, {
            stripe_id: true,
            // stripe_info:[{}, true]
        }],
        insert_customer_stripe_cards: [{
            objects: $`objects`,
            on_conflict: {
                constraint: customer_stripe_cards_constraint.stripe_cards_card_id_key,
                update_columns: []
            }
        }, {
            affected_rows: true
        }],
        insert_customer_stripe_sp_id: [{
            objects: stripeSPIdsArray,
            on_conflict: {
                constraint: customer_stripe_sp_id_constraint.stripe_info_customer_id_sp_id_key,
                update_columns: []
            }
        }, {
            affected_rows: true
        }],
    }, {
        "objects": stripeCardsArray
    });
    if(!(response.update_customer_customer_by_pk)) {
        throw new MezError("customerUpdateError");
    }
}