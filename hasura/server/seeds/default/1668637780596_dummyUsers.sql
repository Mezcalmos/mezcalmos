SET check_function_bodies = false;
INSERT INTO topology."language" (id) VALUES ('en');
INSERT INTO topology."language" (id) VALUES ('es');
INSERT INTO topology."app_type" (id) VALUES ('customer_mobile');
INSERT INTO topology."app_type" (id) VALUES ('customer_web');

INSERT INTO public."user" (id, firebase_id, name, image, language_id, deleted) VALUES (3, '2Jqme9BsPUkEqH8DjOoBPJpbP5qn', 'customer', 'https://firebasestorage.googleapis.com/v0/b/mezcalmos-31f1c.appspot.com/o/logo%402x.png?alt=media&token=4a18a710-e267-40fd-8da7-8c12423cc56d', 'en', false);
INSERT INTO public."user" (id, firebase_id, name, image, language_id, deleted) VALUES (4, 'PUkEqH82Jqme9BsDjOoBPJpbP5qn', 'restaurantop', 'https://firebasestorage.googleapis.com/v0/b/mezcalmos-31f1c.appspot.com/o/logo%402x.png?alt=media&token=4a18a710-e267-40fd-8da7-8c12423cc56d', 'en', false);
INSERT INTO public."user" (id, firebase_id, name, image, language_id, deleted) VALUES (5, 'QJpbP5qn2Jqme9BsPUkEqH8DjOoB', 'mezAdmin', NULL, 'en', false);
INSERT INTO public."user" (id, firebase_id, name, image, language_id, deleted) VALUES (6, 'jOoBP2Jqme9BsPUkEqH8DJpbP5qn', 'deliverydriver', NULL, 'en', false);
INSERT INTO public."saved_location" (customer_id, location_gps, location_text, name, 'default') VALUES (1, {"type":"Point","crs":{"type":"name","properties":{"name":"urn:ogc:def:crs:EPSG::4326"}},"coordinates":[-97.07583672047568,15.87195721894434]}, 'Puerto Escondido, Oaxaca', 'My Puerto Casa <3', true);
SELECT pg_catalog.setval('public.user_id_seq', 6, true);
