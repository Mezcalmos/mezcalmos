CREATE TABLE "public"."data_consumption" ("id" serial NOT NULL, "name_of_subscription" text NOT NULL, "date" date NOT NULL DEFAULT now(), "total_size" integer NOT NULL DEFAULT 0, "user_id" integer NOT NULL, PRIMARY KEY ("id") );
