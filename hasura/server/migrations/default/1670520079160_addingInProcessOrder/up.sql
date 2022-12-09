CREATE OR REPLACE FUNCTION public.in_process(order_row restaurant_order)
 RETURNS boolean
 LANGUAGE sql
 STABLE
AS $function$
    SELECT order_row.status = 'orderReceived' OR order_row.status = 'preparing' OR order_row.status = 'ready' OR order_row.status = 'onTheWay'
$function$;
