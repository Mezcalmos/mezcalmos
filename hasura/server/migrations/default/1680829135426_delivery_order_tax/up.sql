CREATE OR REPLACE FUNCTION delivery.tax(delivery_row delivery."order")
 RETURNS money
 LANGUAGE sql
 STABLE
AS $function$
    SELECT 
        CASE 
            WHEN delivery_row.order_type = 'restaurant'
            THEN (SELECT r.tax FROM restaurant."order" r WHERE r.delivery_id = delivery_row.id)
            WHEN delivery_row.order_type = 'laundry'
            THEN  (SELECT l.tax FROM laundry."order" l WHERE (l.from_customer_delivery_id = delivery_row.id OR l.to_customer_delivery_id = delivery_row.id))
            WHEN delivery_row.order_type = 'courier'
            THEN  (SELECT c.tax FROM delivery."courier_order" c WHERE c.delivery_order_id = delivery_row.id)
        END
    
$function$;
