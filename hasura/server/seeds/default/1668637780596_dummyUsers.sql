SET check_function_bodies = false;
INSERT INTO public."user" (id, firebase_id, name, image, language_id, deleted) VALUES (3, '2Jqme9BsPUkEqH8DjOoBPJpbP5qn', 'customer', '', 'en', false);
INSERT INTO public."user" (id, firebase_id, name, image, language_id, deleted) VALUES (4, 'PUkEqH82Jqme9BsDjOoBPJpbP5qn', 'restaurantop', NULL, 'en', false);
INSERT INTO public."user" (id, firebase_id, name, image, language_id, deleted) VALUES (5, 'QJpbP5qn2Jqme9BsPUkEqH8DjOoB', 'mezAdmin', NULL, 'en', false);
INSERT INTO public."user" (id, firebase_id, name, image, language_id, deleted) VALUES (6, 'jOoBP2Jqme9BsPUkEqH8DJpbP5qn', 'deliverydriver', NULL, 'en', false);
SELECT pg_catalog.setval('public.user_id_seq', 6, true);
