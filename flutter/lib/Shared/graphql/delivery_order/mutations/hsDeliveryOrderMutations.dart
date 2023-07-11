import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart' as cModels;
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/__generated/schema.graphql.dart';
import 'package:mezcalmos/Shared/graphql/delivery_order/__generated/delivery_order.graphql.dart';

HasuraDb _hasuraDb = Get.find<HasuraDb>();

// Mutations
Future<DateTime?> dv_update_est_pickup_time(
    {required int orderId, required DateTime time}) async {
  final QueryResult<Mutation$updateDeliveryOrder> res = await _hasuraDb
      .graphQLClient
      .mutate$updateDeliveryOrder(Options$Mutation$updateDeliveryOrder(
          variables: Variables$Mutation$updateDeliveryOrder(
              orderId: orderId,
              data: Input$delivery_order_set_input(
                estimated_arrival_at_pickup_time: time.toUtc().toString(),
              ))));
  if (res.parsedData?.update_delivery_order_by_pk
          ?.estimated_arrival_at_pickup_time ==
      null) {
    throw Exception(
        " 🛑🛑🛑 Update delivery order exceptions ${res.exception}");
  }
  return DateTime.parse(res.parsedData!.update_delivery_order_by_pk!
      .estimated_arrival_at_pickup_time!);
}

Future<int?> dv_update_review_id(
    {required int orderId,
    required int reviewId,
    required cModels.ServiceProviderType serviceProviderType}) async {
  final QueryResult<Mutation$updateDeliveryOrder> res = await _hasuraDb
      .graphQLClient
      .mutate$updateDeliveryOrder(Options$Mutation$updateDeliveryOrder(
          variables: Variables$Mutation$updateDeliveryOrder(
              orderId: orderId,
              data: serviceProviderType == cModels.ServiceProviderType.Customer
                  ? Input$delivery_order_set_input(
                      customer_review_by_driver_id: reviewId,
                    )
                  : Input$delivery_order_set_input(
                      service_provider_review_by_driver_id: reviewId,
                    ))));
  if (res.parsedData?.update_delivery_order_by_pk == null) {
    throw Exception(
        " 🛑🛑🛑 Update review id order exceptions ${res.exception}");
  }
  return serviceProviderType == cModels.ServiceProviderType.Customer
      ? res
          .parsedData!.update_delivery_order_by_pk!.customer_review_by_driver_id
      : res.parsedData!.update_delivery_order_by_pk!
          .service_provider_review_by_driver_id;
}

Future<DateTime?> dv_update_est_dropoff_time(
    {required int orderId, required DateTime time}) async {
  final QueryResult<Mutation$updateDeliveryOrder> res = await _hasuraDb
      .graphQLClient
      .mutate$updateDeliveryOrder(Options$Mutation$updateDeliveryOrder(
          variables: Variables$Mutation$updateDeliveryOrder(
              orderId: orderId,
              data: Input$delivery_order_set_input(
                estimated_arrival_at_dropoff_time: time.toUtc().toString(),
              ))));
  if (res.parsedData?.update_delivery_order_by_pk
          ?.estimated_arrival_at_dropoff_time ==
      null) {
    throw Exception(
        " 🛑🛑🛑 Update delivery order exceptions ${res.exception}");
  }
  return DateTime.parse(res.parsedData!.update_delivery_order_by_pk!
      .estimated_arrival_at_dropoff_time!);
}

Future<bool> update_delivery_order_offers(
    {required int orderId,
    required Map<int, cModels.CounterOffer>? offers}) async {
  final QueryResult<Mutation$updateDeliveryOrder> res = await _hasuraDb
      .graphQLClient
      .mutate$updateDeliveryOrder(Options$Mutation$updateDeliveryOrder(
          variables: Variables$Mutation$updateDeliveryOrder(
              orderId: orderId,
              data: Input$delivery_order_set_input(
                counter_offers: offers,
              ))));
  if (res.parsedData?.update_delivery_order_by_pk
          ?.estimated_arrival_at_dropoff_time ==
      null) {
    throw Exception(
        " 🛑🛑🛑 Update delivery order exceptions ${res.exception}");
  }
  return res.parsedData?.update_delivery_order_by_pk != null;
}
// company //


