
alter table "laundry"."store" add column "minimum_cost" money
 not null default '0';

CREATE OR REPLACE FUNCTION laundry.totalcost(order_row laundry."order")
 RETURNS money
 LANGUAGE sql
 STABLE
AS $function$
    SELECT
        CASE 
            WHEN (
                SELECT order_row.delivery_cost 
                    + laundry.itemsCost(order_row) 
                    - order_row.refund_amount 
                    + order_row.stripe_fees 
                    - order_row.discount_value
            ) > (SELECT minimum_cost FROM laundry.store s WHERE s.id = order_row.store_id) 
            THEN (SELECT order_row.delivery_cost 
                + laundry.itemsCost(order_row) 
                - order_row.refund_amount 
                + order_row.stripe_fees 
                - order_row.discount_value)
        ELSE (SELECT minimum_cost FROM laundry.store s WHERE s.id = order_row.store_id)
        END
    
$function$;

CREATE OR REPLACE FUNCTION laundry.totalcost(order_row laundry."order")
 RETURNS money
 LANGUAGE sql
 STABLE
AS $function$
    -- SELECT
    --     CASE 
    --         WHEN (
                SELECT order_row.delivery_cost 
                    + laundry.itemsCost(order_row) 
                    - order_row.refund_amount 
                    + order_row.stripe_fees 
                    - order_row.discount_value
        --     ) > (SELECT minimum_cost FROM laundry.store s WHERE s.id = order_row.store_id) 
        --     THEN (SELECT order_row.delivery_cost 
        --         + laundry.itemsCost(order_row) 
        --         - order_row.refund_amount 
        --         + order_row.stripe_fees 
        --         - order_row.discount_value)
        -- ELSE (SELECT minimum_cost FROM laundry.store s WHERE s.id = order_row.store_id)
        -- END
    
$function$;

CREATE OR REPLACE FUNCTION laundry.itemscost(order_row laundry."order")
 RETURNS money
 LANGUAGE sql
 STABLE
AS $function$
    SELECT
        CASE 
            WHEN (
                SELECT SUM(oc.weight_in_kilo * c.cost_by_kilo)
                    FROM laundry.order_category oc
                    INNER JOIN laundry.category c
                    ON oc.category_id = c.id
                    WHERE order_id = order_row.id
            ) > (SELECT minimum_cost FROM laundry.store s WHERE s.id = order_row.store_id) 
            THEN (SELECT SUM(oc.weight_in_kilo * c.cost_by_kilo)
                FROM laundry.order_category oc
                INNER JOIN laundry.category c
                ON oc.category_id = c.id
                WHERE order_id = order_row.id)
        ELSE (SELECT minimum_cost FROM laundry.store s WHERE s.id = order_row.store_id)
        END
$function$;

CREATE OR REPLACE FUNCTION laundry.totalcost(order_row laundry."order")
 RETURNS money
 LANGUAGE sql
 STABLE
AS $function$
    SELECT order_row.delivery_cost + laundry.itemsCost(order_row) - order_row.refund_amount + order_row.stripe_fees - order_row.discount_value
$function$;
