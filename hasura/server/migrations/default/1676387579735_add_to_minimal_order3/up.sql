
CREATE OR REPLACE FUNCTION customer.minimal_orders(customer_id integer)
 RETURNS SETOF customer.minimal_order
 LANGUAGE sql
 STABLE
AS $function$
    WITH 
    ro AS (
        SELECT 
            id, 
            'restaurant' AS order_type, 
            status, 
            public.in_process(r) as in_process,
            order_time, 
            public.totalcost(r) as total_cost,
            (SELECT name 
                FROM service_provider.details d 
                WHERE d.id = (SELECT details_id FROM restaurant.restaurant WHERE id = r.restaurant_id)
            ),
            (SELECT image 
                FROM service_provider.details d 
                WHERE d.id = (SELECT details_id FROM restaurant.restaurant WHERE id = r.restaurant_id)
            ),
            payment_type,
            to_location_address as to_address,
            delivery_cost,
            customer_id
        FROM restaurant.order r),
    lo AS (
        SELECT 
            id, 
            'laundry' AS order_type, 
            status, 
            laundry.order_in_process(l) as in_process,
            order_time,
            COALESCE(laundry.totalcost(l), '0'::money) as total_cost,
            (SELECT name 
                FROM service_provider.details d 
                WHERE d.id = (SELECT details_id FROM laundry.store WHERE id = l.store_id)
            ),
            (SELECT image 
                FROM service_provider.details d 
                WHERE d.id = (SELECT details_id FROM laundry.store WHERE id = l.store_id)
            ),
            payment_type,
            customer_address as to_address,
            delivery_cost,
            customer_id
        FROM  laundry.order l)
    SELECT * from ro UNION select * from lo
$function$;

CREATE OR REPLACE FUNCTION customer.minimal_orders(customer_id integer)
 RETURNS SETOF customer.minimal_order
 LANGUAGE sql
 STABLE
AS $function$
    WITH 
    ro AS (
        SELECT 
            id, 
            'restaurant' AS order_type, 
            status, 
            public.in_process(r) as in_process,
            order_time, 
            public.totalcost(r) as total_cost,
            (SELECT name 
                FROM service_provider.details d 
                WHERE d.id = (SELECT details_id FROM restaurant.restaurant WHERE id = r.restaurant_id)
            ),
            (SELECT image 
                FROM service_provider.details d 
                WHERE d.id = (SELECT details_id FROM restaurant.restaurant WHERE id = r.restaurant_id)
            ),
            payment_type,
            to_location_address as to_address,
            delivery_cost,
            customer_id
        FROM restaurant.order r
        WHERE r.customer_id = customer_id),
    lo AS (
        SELECT 
            id, 
            'laundry' AS order_type, 
            status, 
            laundry.order_in_process(l) as in_process,
            order_time,
            COALESCE(laundry.totalcost(l), '0'::money) as total_cost,
            (SELECT name 
                FROM service_provider.details d 
                WHERE d.id = (SELECT details_id FROM laundry.store WHERE id = l.store_id)
            ),
            (SELECT image 
                FROM service_provider.details d 
                WHERE d.id = (SELECT details_id FROM laundry.store WHERE id = l.store_id)
            ),
            payment_type,
            customer_address as to_address,
            delivery_cost,
            customer_id
        FROM  laundry.order l
        WHERE l.customer_id = customer_id)
    SELECT * from ro UNION select * from lo
$function$;
