import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/__generated/schema.graphql.dart';
import 'package:mezcalmos/Shared/graphql/buisness_order/__generated/business_order.graphql.dart';
import 'package:mezcalmos/Shared/graphql/buisness_order/models/MinimumBsOrder.dart';
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';
import 'package:mezcalmos/Shared/helpers/BusinessHelpers/BusinessItemHelpers.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

HasuraDb _db = Get.find<HasuraDb>();
Future<List<MinimumBsOrder>?> get_bs_orders(
    {required int businessId,
    required BusinessOrderRequestStatus status,
    bool withCache = true}) async {
  QueryResult<Query$getBsOrders> res = await _db.graphQLClient
      .query$getBsOrders(Options$Query$getBsOrders(
          fetchPolicy:
              withCache ? FetchPolicy.cacheFirst : FetchPolicy.networkOnly,
          variables: Variables$Query$getBsOrders(
              busnessId: businessId, status: status.toFirebaseFormatString())));
  if (res.hasException || res.parsedData?.business_order_request == null) {
    throw res.exception!;
  }
  mezDbgPrint(res.data);
  return res.parsedData!.business_order_request
      .map<MinimumBsOrder>((Query$getBsOrders$business_order_request data) {
    return MinimumBsOrder(
      id: data.id,
      customerImage: data.customer.user.image!,
      customerName: data.customer.user.name!,
      time: DateTime.parse(data.order_time),
      cost: data.cost?.toDouble() ?? 0,
      numberOfItems: data.items.length,
    );
  }).toList();
}

Future<List<MinimumBusinessItem>> get_rental_orders_items(
    {required int businessId, required int offset, required int limit}) async {
  QueryResult<Query$getBsRentalOrdersItems> res = await _db.graphQLClient
      .query$getBsRentalOrdersItems(Options$Query$getBsRentalOrdersItems(
          variables: Variables$Query$getBsRentalOrdersItems(
              rentalBusinessId: businessId, offset: offset, limit: limit)));
  if (res.hasException || res.parsedData?.business_order_request_item == null) {
    throw res.exception!;
  }
  mezDbgPrint(res.data);
  return res.parsedData!.business_order_request_item.map<MinimumBusinessItem>(
      (Query$getBsRentalOrdersItems$business_order_request_item data) {
    return MinimumBusinessItem(
      orderId: data.order_request_id,
      time: DateTime.parse(data.time!),
      parameters: businessItemParamsFromData(data.parameters),
      cost: data.cost.toDouble(), customerName: '',
      image: data.rental!.details.image!.first.toString(),
      name: toLanguageMap(translations: data.rental!.details.name.translations),
      // available: data.available,
      // itemId: data.item_id,
      // item: BusinessItemDetails(
      //   id: data.rental!.details.id,
      //   image: data.rental!.details.image
      //           ?.map<String>((e) => e.toString())
      //           .toList() ??
      //       [],
      //   name:
      //       toLanguageMap(translations: data.rental!.details.name.translations),
      //   businessId: businessId,
      //   available: data.rental!.details.available,
      //   cost: constructBusinessServiceCost(data.rental!.details.cost),
      // ),
    );
  }).toList();
}

Future<void> update_bs_order_item(
    {required int id, required BusinessOrderItem item}) async {
  QueryResult<Mutation$updateBsOrderItem> res =
      await _db.graphQLClient.mutate$updateBsOrderItem(
    Options$Mutation$updateBsOrderItem(
      variables: Variables$Mutation$updateBsOrderItem(
        id: id,
        data: Input$business_order_request_item_set_input(
            time: item.time,
            parameters: item.parameters.toFirebaseFormattedJson(),
            cost: item.cost.toDouble(),
            available: item.available),
      ),
    ),
  );
  if (res.hasException) {
    throw res.exception!;
  }
  mezDbgPrint(res.data);
}
