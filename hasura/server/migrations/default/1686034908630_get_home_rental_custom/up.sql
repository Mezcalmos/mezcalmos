
CREATE OR REPLACE FUNCTION business.get_home_rentals(location geography) 
RETURNS SETOF business.home_rental 
LANGUAGE sql
STABLE
AS $$
    SELECT 
        *
    FROM 
        business.home_rental h
    ORDER BY 
        (SELECT referral_points 
            FROM service_provider.details s 
            WHERE s.id = (
                SELECT details_id
                FROM business.business b
                WHERE b.id = (
                    SELECT business_id
                    FROM business.rental r
                    WHERE r.id = h.rental_id
                )
            )
        ) DESC,
        ST_Distance(location, gps_location);
$$;

CREATE OR REPLACE FUNCTION business.get_home_rentals(location geography) 
RETURNS SETOF business.home_rental 
LANGUAGE sql
STABLE
AS $$
    SELECT 
        *
    FROM 
        business.home_rental h
    ORDER BY 
        (SELECT referral_points 
            FROM service_provider.details s 
            WHERE s.id = (
                SELECT details_id
                FROM business.business b
                WHERE b.id = (
                    SELECT business_id
                    FROM business.rental r
                    WHERE r.id = h.rental_id
                )
            )
        ) DESC,
        ST_Distance(location, gps_location);
$$;
