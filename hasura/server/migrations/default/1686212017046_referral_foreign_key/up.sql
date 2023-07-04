
alter table "service_provider"."referral" drop constraint "referral_customer_id_fkey";

alter table "service_provider"."referral"
  add constraint "referral_customer_id_fkey"
  foreign key ("customer_id")
  references "public"."user"
  ("id") on update restrict on delete restrict;
