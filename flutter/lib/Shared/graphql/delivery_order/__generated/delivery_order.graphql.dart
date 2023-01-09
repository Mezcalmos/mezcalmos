import '../../__generated/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';

class Variables$Query$get_driver_order {
  factory Variables$Query$get_driver_order({required int orderId}) =>
      Variables$Query$get_driver_order._({
        r'orderId': orderId,
      });

  Variables$Query$get_driver_order._(this._$data);

  factory Variables$Query$get_driver_order.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$orderId = data['orderId'];
    result$data['orderId'] = (l$orderId as int);
    return Variables$Query$get_driver_order._(result$data);
  }

  Map<String, dynamic> _$data;

  int get orderId => (_$data['orderId'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$orderId = orderId;
    result$data['orderId'] = l$orderId;
    return result$data;
  }

  CopyWith$Variables$Query$get_driver_order<Variables$Query$get_driver_order>
      get copyWith => CopyWith$Variables$Query$get_driver_order(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$get_driver_order) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$orderId = orderId;
    final lOther$orderId = other.orderId;
    if (l$orderId != lOther$orderId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$orderId = orderId;
    return Object.hashAll([l$orderId]);
  }
}

abstract class CopyWith$Variables$Query$get_driver_order<TRes> {
  factory CopyWith$Variables$Query$get_driver_order(
    Variables$Query$get_driver_order instance,
    TRes Function(Variables$Query$get_driver_order) then,
  ) = _CopyWithImpl$Variables$Query$get_driver_order;

  factory CopyWith$Variables$Query$get_driver_order.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$get_driver_order;

  TRes call({int? orderId});
}

class _CopyWithImpl$Variables$Query$get_driver_order<TRes>
    implements CopyWith$Variables$Query$get_driver_order<TRes> {
  _CopyWithImpl$Variables$Query$get_driver_order(
    this._instance,
    this._then,
  );

  final Variables$Query$get_driver_order _instance;

  final TRes Function(Variables$Query$get_driver_order) _then;

  static const _undefined = {};

  TRes call({Object? orderId = _undefined}) =>
      _then(Variables$Query$get_driver_order._({
        ..._instance._$data,
        if (orderId != _undefined && orderId != null)
          'orderId': (orderId as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$get_driver_order<TRes>
    implements CopyWith$Variables$Query$get_driver_order<TRes> {
  _CopyWithStubImpl$Variables$Query$get_driver_order(this._res);

  TRes _res;

  call({int? orderId}) => _res;
}

class Query$get_driver_order {
  Query$get_driver_order({
    this.delivery_order_by_pk,
    required this.$__typename,
  });

  factory Query$get_driver_order.fromJson(Map<String, dynamic> json) {
    final l$delivery_order_by_pk = json['delivery_order_by_pk'];
    final l$$__typename = json['__typename'];
    return Query$get_driver_order(
      delivery_order_by_pk: l$delivery_order_by_pk == null
          ? null
          : Query$get_driver_order$delivery_order_by_pk.fromJson(
              (l$delivery_order_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$get_driver_order$delivery_order_by_pk? delivery_order_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$delivery_order_by_pk = delivery_order_by_pk;
    _resultData['delivery_order_by_pk'] = l$delivery_order_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$delivery_order_by_pk = delivery_order_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$delivery_order_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_driver_order) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$delivery_order_by_pk = delivery_order_by_pk;
    final lOther$delivery_order_by_pk = other.delivery_order_by_pk;
    if (l$delivery_order_by_pk != lOther$delivery_order_by_pk) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$get_driver_order on Query$get_driver_order {
  CopyWith$Query$get_driver_order<Query$get_driver_order> get copyWith =>
      CopyWith$Query$get_driver_order(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$get_driver_order<TRes> {
  factory CopyWith$Query$get_driver_order(
    Query$get_driver_order instance,
    TRes Function(Query$get_driver_order) then,
  ) = _CopyWithImpl$Query$get_driver_order;

  factory CopyWith$Query$get_driver_order.stub(TRes res) =
      _CopyWithStubImpl$Query$get_driver_order;

  TRes call({
    Query$get_driver_order$delivery_order_by_pk? delivery_order_by_pk,
    String? $__typename,
  });
  CopyWith$Query$get_driver_order$delivery_order_by_pk<TRes>
      get delivery_order_by_pk;
}

class _CopyWithImpl$Query$get_driver_order<TRes>
    implements CopyWith$Query$get_driver_order<TRes> {
  _CopyWithImpl$Query$get_driver_order(
    this._instance,
    this._then,
  );

  final Query$get_driver_order _instance;

  final TRes Function(Query$get_driver_order) _then;

  static const _undefined = {};

  TRes call({
    Object? delivery_order_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_driver_order(
        delivery_order_by_pk: delivery_order_by_pk == _undefined
            ? _instance.delivery_order_by_pk
            : (delivery_order_by_pk
                as Query$get_driver_order$delivery_order_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_driver_order$delivery_order_by_pk<TRes>
      get delivery_order_by_pk {
    final local$delivery_order_by_pk = _instance.delivery_order_by_pk;
    return local$delivery_order_by_pk == null
        ? CopyWith$Query$get_driver_order$delivery_order_by_pk.stub(
            _then(_instance))
        : CopyWith$Query$get_driver_order$delivery_order_by_pk(
            local$delivery_order_by_pk, (e) => call(delivery_order_by_pk: e));
  }
}

class _CopyWithStubImpl$Query$get_driver_order<TRes>
    implements CopyWith$Query$get_driver_order<TRes> {
  _CopyWithStubImpl$Query$get_driver_order(this._res);

  TRes _res;

  call({
    Query$get_driver_order$delivery_order_by_pk? delivery_order_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_driver_order$delivery_order_by_pk<TRes>
      get delivery_order_by_pk =>
          CopyWith$Query$get_driver_order$delivery_order_by_pk.stub(_res);
}

const documentNodeQueryget_driver_order = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'get_driver_order'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'orderId')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'delivery_order_by_pk'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'orderId')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'actual_arrival_at_dropoff_time'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'actual_arrival_at_pickup_time'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'actual_delivered_time'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'actual_package_ready_time'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'cancellation_time'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'chat_with_customer_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'chat_with_service_provider_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'current_gps'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'customer_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'customer_review_by_driver_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'delivery_cost'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'dropoff_address'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'dropoff_gps'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'estimated_arrival_at_dropoff_time'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'estimated_arrival_at_pickup_time'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'estimated_package_ready_time'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'restaurant_order'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'order_time'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'package_cost'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'payment_type'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'pickup_address'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'pickup_gps'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'restaurant'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'firebase_id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'image'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'name'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'location_gps'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'location_text'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'language_id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'open_status'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'service_provider_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'delivery_driver'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'current_location'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'service_provider_review_by_driver_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'service_provider_type'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'status'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'stripe_payment_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'trip_distance'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'trip_duration'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'trip_polyline'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'customer'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'user'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'image'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'name'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'language_id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: '__typename'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                ]),
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      
    ]),
  ),
]);
Query$get_driver_order _parserFn$Query$get_driver_order(
        Map<String, dynamic> data) =>
    Query$get_driver_order.fromJson(data);

class Options$Query$get_driver_order
    extends graphql.QueryOptions<Query$get_driver_order> {
  Options$Query$get_driver_order({
    String? operationName,
    required Variables$Query$get_driver_order variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          pollInterval: pollInterval,
          context: context,
          document: documentNodeQueryget_driver_order,
          parserFn: _parserFn$Query$get_driver_order,
        );
}

class WatchOptions$Query$get_driver_order
    extends graphql.WatchQueryOptions<Query$get_driver_order> {
  WatchOptions$Query$get_driver_order({
    String? operationName,
    required Variables$Query$get_driver_order variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          context: context,
          document: documentNodeQueryget_driver_order,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$get_driver_order,
        );
}

class FetchMoreOptions$Query$get_driver_order extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$get_driver_order({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$get_driver_order variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryget_driver_order,
        );
}

extension ClientExtension$Query$get_driver_order on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$get_driver_order>> query$get_driver_order(
          Options$Query$get_driver_order options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$get_driver_order> watchQuery$get_driver_order(
          WatchOptions$Query$get_driver_order options) =>
      this.watchQuery(options);
  void writeQuery$get_driver_order({
    required Query$get_driver_order data,
    required Variables$Query$get_driver_order variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryget_driver_order),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$get_driver_order? readQuery$get_driver_order({
    required Variables$Query$get_driver_order variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQueryget_driver_order),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$get_driver_order.fromJson(result);
  }
}

class Query$get_driver_order$delivery_order_by_pk {
  Query$get_driver_order$delivery_order_by_pk({
    this.actual_arrival_at_dropoff_time,
    this.actual_arrival_at_pickup_time,
    this.actual_delivered_time,
    this.actual_package_ready_time,
    this.cancellation_time,
    required this.chat_with_customer_id,
    this.chat_with_service_provider_id,
    this.current_gps,
    required this.customer_id,
    this.customer_review_by_driver_id,
    required this.delivery_cost,
    required this.dropoff_address,
    required this.dropoff_gps,
    this.estimated_arrival_at_dropoff_time,
    this.estimated_arrival_at_pickup_time,
    this.estimated_package_ready_time,
    required this.id,
    this.restaurant_order,
    required this.order_time,
    required this.package_cost,
    required this.payment_type,
    required this.pickup_address,
    required this.pickup_gps,
    this.restaurant,
    this.service_provider_id,
    this.delivery_driver,
    this.service_provider_review_by_driver_id,
    this.service_provider_type,
    required this.status,
    this.stripe_payment_id,
    this.trip_distance,
    this.trip_duration,
    this.trip_polyline,
    required this.customer,
    required this.$__typename,
  });

  factory Query$get_driver_order$delivery_order_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$actual_arrival_at_dropoff_time =
        json['actual_arrival_at_dropoff_time'];
    final l$actual_arrival_at_pickup_time =
        json['actual_arrival_at_pickup_time'];
    final l$actual_delivered_time = json['actual_delivered_time'];
    final l$actual_package_ready_time = json['actual_package_ready_time'];
    final l$cancellation_time = json['cancellation_time'];
    final l$chat_with_customer_id = json['chat_with_customer_id'];
    final l$chat_with_service_provider_id =
        json['chat_with_service_provider_id'];
    final l$current_gps = json['current_gps'];
    final l$customer_id = json['customer_id'];
    final l$customer_review_by_driver_id = json['customer_review_by_driver_id'];
    final l$delivery_cost = json['delivery_cost'];
    final l$dropoff_address = json['dropoff_address'];
    final l$dropoff_gps = json['dropoff_gps'];
    final l$estimated_arrival_at_dropoff_time =
        json['estimated_arrival_at_dropoff_time'];
    final l$estimated_arrival_at_pickup_time =
        json['estimated_arrival_at_pickup_time'];
    final l$estimated_package_ready_time = json['estimated_package_ready_time'];
    final l$id = json['id'];
    final l$restaurant_order = json['restaurant_order'];
    final l$order_time = json['order_time'];
    final l$package_cost = json['package_cost'];
    final l$payment_type = json['payment_type'];
    final l$pickup_address = json['pickup_address'];
    final l$pickup_gps = json['pickup_gps'];
    final l$restaurant = json['restaurant'];
    final l$service_provider_id = json['service_provider_id'];
    final l$delivery_driver = json['delivery_driver'];
    final l$service_provider_review_by_driver_id =
        json['service_provider_review_by_driver_id'];
    final l$service_provider_type = json['service_provider_type'];
    final l$status = json['status'];
    final l$stripe_payment_id = json['stripe_payment_id'];
    final l$trip_distance = json['trip_distance'];
    final l$trip_duration = json['trip_duration'];
    final l$trip_polyline = json['trip_polyline'];
    final l$customer = json['customer'];
    final l$$__typename = json['__typename'];
    return Query$get_driver_order$delivery_order_by_pk(
      actual_arrival_at_dropoff_time:
          (l$actual_arrival_at_dropoff_time as String?),
      actual_arrival_at_pickup_time:
          (l$actual_arrival_at_pickup_time as String?),
      actual_delivered_time: (l$actual_delivered_time as String?),
      actual_package_ready_time: (l$actual_package_ready_time as String?),
      cancellation_time: (l$cancellation_time as String?),
      chat_with_customer_id: (l$chat_with_customer_id as int),
      chat_with_service_provider_id: (l$chat_with_service_provider_id as int?),
      current_gps:
          l$current_gps == null ? null : geographyFromJson(l$current_gps),
      customer_id: (l$customer_id as int),
      customer_review_by_driver_id: (l$customer_review_by_driver_id as int?),
      delivery_cost: moneyFromJson(l$delivery_cost),
      dropoff_address: (l$dropoff_address as String),
      dropoff_gps: geographyFromJson(l$dropoff_gps),
      estimated_arrival_at_dropoff_time:
          (l$estimated_arrival_at_dropoff_time as String?),
      estimated_arrival_at_pickup_time:
          (l$estimated_arrival_at_pickup_time as String?),
      estimated_package_ready_time: (l$estimated_package_ready_time as String?),
      id: (l$id as int),
      restaurant_order: l$restaurant_order == null
          ? null
          : Query$get_driver_order$delivery_order_by_pk$restaurant_order
              .fromJson((l$restaurant_order as Map<String, dynamic>)),
      order_time: (l$order_time as String),
      package_cost: moneyFromJson(l$package_cost),
      payment_type: (l$payment_type as String),
      pickup_address: (l$pickup_address as String),
      pickup_gps: geographyFromJson(l$pickup_gps),
      restaurant: l$restaurant == null
          ? null
          : Query$get_driver_order$delivery_order_by_pk$restaurant.fromJson(
              (l$restaurant as Map<String, dynamic>)),
      service_provider_id: (l$service_provider_id as int?),
      delivery_driver: l$delivery_driver == null
          ? null
          : Query$get_driver_order$delivery_order_by_pk$delivery_driver
              .fromJson((l$delivery_driver as Map<String, dynamic>)),
      service_provider_review_by_driver_id:
          (l$service_provider_review_by_driver_id as int?),
      service_provider_type: (l$service_provider_type as String?),
      status: (l$status as String),
      stripe_payment_id: (l$stripe_payment_id as int?),
      trip_distance: (l$trip_distance as int?),
      trip_duration: (l$trip_duration as int?),
      trip_polyline: (l$trip_polyline as String?),
      customer: Query$get_driver_order$delivery_order_by_pk$customer.fromJson(
          (l$customer as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String? actual_arrival_at_dropoff_time;

  final String? actual_arrival_at_pickup_time;

  final String? actual_delivered_time;

  final String? actual_package_ready_time;

  final String? cancellation_time;

  final int chat_with_customer_id;

  final int? chat_with_service_provider_id;

  final Geography? current_gps;

  final int customer_id;

  final int? customer_review_by_driver_id;

  final double delivery_cost;

  final String dropoff_address;

  final Geography dropoff_gps;

  final String? estimated_arrival_at_dropoff_time;

  final String? estimated_arrival_at_pickup_time;

  final String? estimated_package_ready_time;

  final int id;

  final Query$get_driver_order$delivery_order_by_pk$restaurant_order?
      restaurant_order;

  final String order_time;

  final double package_cost;

  final String payment_type;

  final String pickup_address;

  final Geography pickup_gps;

  final Query$get_driver_order$delivery_order_by_pk$restaurant? restaurant;

  final int? service_provider_id;

  final Query$get_driver_order$delivery_order_by_pk$delivery_driver?
      delivery_driver;

  final int? service_provider_review_by_driver_id;

  final String? service_provider_type;

  final String status;

  final int? stripe_payment_id;

  final int? trip_distance;

  final int? trip_duration;

  final String? trip_polyline;

  final Query$get_driver_order$delivery_order_by_pk$customer customer;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$actual_arrival_at_dropoff_time = actual_arrival_at_dropoff_time;
    _resultData['actual_arrival_at_dropoff_time'] =
        l$actual_arrival_at_dropoff_time;
    final l$actual_arrival_at_pickup_time = actual_arrival_at_pickup_time;
    _resultData['actual_arrival_at_pickup_time'] =
        l$actual_arrival_at_pickup_time;
    final l$actual_delivered_time = actual_delivered_time;
    _resultData['actual_delivered_time'] = l$actual_delivered_time;
    final l$actual_package_ready_time = actual_package_ready_time;
    _resultData['actual_package_ready_time'] = l$actual_package_ready_time;
    final l$cancellation_time = cancellation_time;
    _resultData['cancellation_time'] = l$cancellation_time;
    final l$chat_with_customer_id = chat_with_customer_id;
    _resultData['chat_with_customer_id'] = l$chat_with_customer_id;
    final l$chat_with_service_provider_id = chat_with_service_provider_id;
    _resultData['chat_with_service_provider_id'] =
        l$chat_with_service_provider_id;
    final l$current_gps = current_gps;
    _resultData['current_gps'] =
        l$current_gps == null ? null : geographyToJson(l$current_gps);
    final l$customer_id = customer_id;
    _resultData['customer_id'] = l$customer_id;
    final l$customer_review_by_driver_id = customer_review_by_driver_id;
    _resultData['customer_review_by_driver_id'] =
        l$customer_review_by_driver_id;
    final l$delivery_cost = delivery_cost;
    _resultData['delivery_cost'] = moneyToJson(l$delivery_cost);
    final l$dropoff_address = dropoff_address;
    _resultData['dropoff_address'] = l$dropoff_address;
    final l$dropoff_gps = dropoff_gps;
    _resultData['dropoff_gps'] = geographyToJson(l$dropoff_gps);
    final l$estimated_arrival_at_dropoff_time =
        estimated_arrival_at_dropoff_time;
    _resultData['estimated_arrival_at_dropoff_time'] =
        l$estimated_arrival_at_dropoff_time;
    final l$estimated_arrival_at_pickup_time = estimated_arrival_at_pickup_time;
    _resultData['estimated_arrival_at_pickup_time'] =
        l$estimated_arrival_at_pickup_time;
    final l$estimated_package_ready_time = estimated_package_ready_time;
    _resultData['estimated_package_ready_time'] =
        l$estimated_package_ready_time;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$restaurant_order = restaurant_order;
    _resultData['restaurant_order'] = l$restaurant_order?.toJson();
    final l$order_time = order_time;
    _resultData['order_time'] = l$order_time;
    final l$package_cost = package_cost;
    _resultData['package_cost'] = moneyToJson(l$package_cost);
    final l$payment_type = payment_type;
    _resultData['payment_type'] = l$payment_type;
    final l$pickup_address = pickup_address;
    _resultData['pickup_address'] = l$pickup_address;
    final l$pickup_gps = pickup_gps;
    _resultData['pickup_gps'] = geographyToJson(l$pickup_gps);
    final l$restaurant = restaurant;
    _resultData['restaurant'] = l$restaurant?.toJson();
    final l$service_provider_id = service_provider_id;
    _resultData['service_provider_id'] = l$service_provider_id;
    final l$delivery_driver = delivery_driver;
    _resultData['delivery_driver'] = l$delivery_driver?.toJson();
    final l$service_provider_review_by_driver_id =
        service_provider_review_by_driver_id;
    _resultData['service_provider_review_by_driver_id'] =
        l$service_provider_review_by_driver_id;
    final l$service_provider_type = service_provider_type;
    _resultData['service_provider_type'] = l$service_provider_type;
    final l$status = status;
    _resultData['status'] = l$status;
    final l$stripe_payment_id = stripe_payment_id;
    _resultData['stripe_payment_id'] = l$stripe_payment_id;
    final l$trip_distance = trip_distance;
    _resultData['trip_distance'] = l$trip_distance;
    final l$trip_duration = trip_duration;
    _resultData['trip_duration'] = l$trip_duration;
    final l$trip_polyline = trip_polyline;
    _resultData['trip_polyline'] = l$trip_polyline;
    final l$customer = customer;
    _resultData['customer'] = l$customer.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$actual_arrival_at_dropoff_time = actual_arrival_at_dropoff_time;
    final l$actual_arrival_at_pickup_time = actual_arrival_at_pickup_time;
    final l$actual_delivered_time = actual_delivered_time;
    final l$actual_package_ready_time = actual_package_ready_time;
    final l$cancellation_time = cancellation_time;
    final l$chat_with_customer_id = chat_with_customer_id;
    final l$chat_with_service_provider_id = chat_with_service_provider_id;
    final l$current_gps = current_gps;
    final l$customer_id = customer_id;
    final l$customer_review_by_driver_id = customer_review_by_driver_id;
    final l$delivery_cost = delivery_cost;
    final l$dropoff_address = dropoff_address;
    final l$dropoff_gps = dropoff_gps;
    final l$estimated_arrival_at_dropoff_time =
        estimated_arrival_at_dropoff_time;
    final l$estimated_arrival_at_pickup_time = estimated_arrival_at_pickup_time;
    final l$estimated_package_ready_time = estimated_package_ready_time;
    final l$id = id;
    final l$restaurant_order = restaurant_order;
    final l$order_time = order_time;
    final l$package_cost = package_cost;
    final l$payment_type = payment_type;
    final l$pickup_address = pickup_address;
    final l$pickup_gps = pickup_gps;
    final l$restaurant = restaurant;
    final l$service_provider_id = service_provider_id;
    final l$delivery_driver = delivery_driver;
    final l$service_provider_review_by_driver_id =
        service_provider_review_by_driver_id;
    final l$service_provider_type = service_provider_type;
    final l$status = status;
    final l$stripe_payment_id = stripe_payment_id;
    final l$trip_distance = trip_distance;
    final l$trip_duration = trip_duration;
    final l$trip_polyline = trip_polyline;
    final l$customer = customer;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$actual_arrival_at_dropoff_time,
      l$actual_arrival_at_pickup_time,
      l$actual_delivered_time,
      l$actual_package_ready_time,
      l$cancellation_time,
      l$chat_with_customer_id,
      l$chat_with_service_provider_id,
      l$current_gps,
      l$customer_id,
      l$customer_review_by_driver_id,
      l$delivery_cost,
      l$dropoff_address,
      l$dropoff_gps,
      l$estimated_arrival_at_dropoff_time,
      l$estimated_arrival_at_pickup_time,
      l$estimated_package_ready_time,
      l$id,
      l$restaurant_order,
      l$order_time,
      l$package_cost,
      l$payment_type,
      l$pickup_address,
      l$pickup_gps,
      l$restaurant,
      l$service_provider_id,
      l$delivery_driver,
      l$service_provider_review_by_driver_id,
      l$service_provider_type,
      l$status,
      l$stripe_payment_id,
      l$trip_distance,
      l$trip_duration,
      l$trip_polyline,
      l$customer,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_driver_order$delivery_order_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$actual_arrival_at_dropoff_time = actual_arrival_at_dropoff_time;
    final lOther$actual_arrival_at_dropoff_time =
        other.actual_arrival_at_dropoff_time;
    if (l$actual_arrival_at_dropoff_time !=
        lOther$actual_arrival_at_dropoff_time) {
      return false;
    }
    final l$actual_arrival_at_pickup_time = actual_arrival_at_pickup_time;
    final lOther$actual_arrival_at_pickup_time =
        other.actual_arrival_at_pickup_time;
    if (l$actual_arrival_at_pickup_time !=
        lOther$actual_arrival_at_pickup_time) {
      return false;
    }
    final l$actual_delivered_time = actual_delivered_time;
    final lOther$actual_delivered_time = other.actual_delivered_time;
    if (l$actual_delivered_time != lOther$actual_delivered_time) {
      return false;
    }
    final l$actual_package_ready_time = actual_package_ready_time;
    final lOther$actual_package_ready_time = other.actual_package_ready_time;
    if (l$actual_package_ready_time != lOther$actual_package_ready_time) {
      return false;
    }
    final l$cancellation_time = cancellation_time;
    final lOther$cancellation_time = other.cancellation_time;
    if (l$cancellation_time != lOther$cancellation_time) {
      return false;
    }
    final l$chat_with_customer_id = chat_with_customer_id;
    final lOther$chat_with_customer_id = other.chat_with_customer_id;
    if (l$chat_with_customer_id != lOther$chat_with_customer_id) {
      return false;
    }
    final l$chat_with_service_provider_id = chat_with_service_provider_id;
    final lOther$chat_with_service_provider_id =
        other.chat_with_service_provider_id;
    if (l$chat_with_service_provider_id !=
        lOther$chat_with_service_provider_id) {
      return false;
    }
    final l$current_gps = current_gps;
    final lOther$current_gps = other.current_gps;
    if (l$current_gps != lOther$current_gps) {
      return false;
    }
    final l$customer_id = customer_id;
    final lOther$customer_id = other.customer_id;
    if (l$customer_id != lOther$customer_id) {
      return false;
    }
    final l$customer_review_by_driver_id = customer_review_by_driver_id;
    final lOther$customer_review_by_driver_id =
        other.customer_review_by_driver_id;
    if (l$customer_review_by_driver_id != lOther$customer_review_by_driver_id) {
      return false;
    }
    final l$delivery_cost = delivery_cost;
    final lOther$delivery_cost = other.delivery_cost;
    if (l$delivery_cost != lOther$delivery_cost) {
      return false;
    }
    final l$dropoff_address = dropoff_address;
    final lOther$dropoff_address = other.dropoff_address;
    if (l$dropoff_address != lOther$dropoff_address) {
      return false;
    }
    final l$dropoff_gps = dropoff_gps;
    final lOther$dropoff_gps = other.dropoff_gps;
    if (l$dropoff_gps != lOther$dropoff_gps) {
      return false;
    }
    final l$estimated_arrival_at_dropoff_time =
        estimated_arrival_at_dropoff_time;
    final lOther$estimated_arrival_at_dropoff_time =
        other.estimated_arrival_at_dropoff_time;
    if (l$estimated_arrival_at_dropoff_time !=
        lOther$estimated_arrival_at_dropoff_time) {
      return false;
    }
    final l$estimated_arrival_at_pickup_time = estimated_arrival_at_pickup_time;
    final lOther$estimated_arrival_at_pickup_time =
        other.estimated_arrival_at_pickup_time;
    if (l$estimated_arrival_at_pickup_time !=
        lOther$estimated_arrival_at_pickup_time) {
      return false;
    }
    final l$estimated_package_ready_time = estimated_package_ready_time;
    final lOther$estimated_package_ready_time =
        other.estimated_package_ready_time;
    if (l$estimated_package_ready_time != lOther$estimated_package_ready_time) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$restaurant_order = restaurant_order;
    final lOther$restaurant_order = other.restaurant_order;
    if (l$restaurant_order != lOther$restaurant_order) {
      return false;
    }
    final l$order_time = order_time;
    final lOther$order_time = other.order_time;
    if (l$order_time != lOther$order_time) {
      return false;
    }
    final l$package_cost = package_cost;
    final lOther$package_cost = other.package_cost;
    if (l$package_cost != lOther$package_cost) {
      return false;
    }
    final l$payment_type = payment_type;
    final lOther$payment_type = other.payment_type;
    if (l$payment_type != lOther$payment_type) {
      return false;
    }
    final l$pickup_address = pickup_address;
    final lOther$pickup_address = other.pickup_address;
    if (l$pickup_address != lOther$pickup_address) {
      return false;
    }
    final l$pickup_gps = pickup_gps;
    final lOther$pickup_gps = other.pickup_gps;
    if (l$pickup_gps != lOther$pickup_gps) {
      return false;
    }
    final l$restaurant = restaurant;
    final lOther$restaurant = other.restaurant;
    if (l$restaurant != lOther$restaurant) {
      return false;
    }
    final l$service_provider_id = service_provider_id;
    final lOther$service_provider_id = other.service_provider_id;
    if (l$service_provider_id != lOther$service_provider_id) {
      return false;
    }
    final l$delivery_driver = delivery_driver;
    final lOther$delivery_driver = other.delivery_driver;
    if (l$delivery_driver != lOther$delivery_driver) {
      return false;
    }
    final l$service_provider_review_by_driver_id =
        service_provider_review_by_driver_id;
    final lOther$service_provider_review_by_driver_id =
        other.service_provider_review_by_driver_id;
    if (l$service_provider_review_by_driver_id !=
        lOther$service_provider_review_by_driver_id) {
      return false;
    }
    final l$service_provider_type = service_provider_type;
    final lOther$service_provider_type = other.service_provider_type;
    if (l$service_provider_type != lOther$service_provider_type) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$stripe_payment_id = stripe_payment_id;
    final lOther$stripe_payment_id = other.stripe_payment_id;
    if (l$stripe_payment_id != lOther$stripe_payment_id) {
      return false;
    }
    final l$trip_distance = trip_distance;
    final lOther$trip_distance = other.trip_distance;
    if (l$trip_distance != lOther$trip_distance) {
      return false;
    }
    final l$trip_duration = trip_duration;
    final lOther$trip_duration = other.trip_duration;
    if (l$trip_duration != lOther$trip_duration) {
      return false;
    }
    final l$trip_polyline = trip_polyline;
    final lOther$trip_polyline = other.trip_polyline;
    if (l$trip_polyline != lOther$trip_polyline) {
      return false;
    }
    final l$customer = customer;
    final lOther$customer = other.customer;
    if (l$customer != lOther$customer) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$get_driver_order$delivery_order_by_pk
    on Query$get_driver_order$delivery_order_by_pk {
  CopyWith$Query$get_driver_order$delivery_order_by_pk<
          Query$get_driver_order$delivery_order_by_pk>
      get copyWith => CopyWith$Query$get_driver_order$delivery_order_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_driver_order$delivery_order_by_pk<TRes> {
  factory CopyWith$Query$get_driver_order$delivery_order_by_pk(
    Query$get_driver_order$delivery_order_by_pk instance,
    TRes Function(Query$get_driver_order$delivery_order_by_pk) then,
  ) = _CopyWithImpl$Query$get_driver_order$delivery_order_by_pk;

  factory CopyWith$Query$get_driver_order$delivery_order_by_pk.stub(TRes res) =
      _CopyWithStubImpl$Query$get_driver_order$delivery_order_by_pk;

  TRes call({
    String? actual_arrival_at_dropoff_time,
    String? actual_arrival_at_pickup_time,
    String? actual_delivered_time,
    String? actual_package_ready_time,
    String? cancellation_time,
    int? chat_with_customer_id,
    int? chat_with_service_provider_id,
    Geography? current_gps,
    int? customer_id,
    int? customer_review_by_driver_id,
    double? delivery_cost,
    String? dropoff_address,
    Geography? dropoff_gps,
    String? estimated_arrival_at_dropoff_time,
    String? estimated_arrival_at_pickup_time,
    String? estimated_package_ready_time,
    int? id,
    Query$get_driver_order$delivery_order_by_pk$restaurant_order?
        restaurant_order,
    String? order_time,
    double? package_cost,
    String? payment_type,
    String? pickup_address,
    Geography? pickup_gps,
    Query$get_driver_order$delivery_order_by_pk$restaurant? restaurant,
    int? service_provider_id,
    Query$get_driver_order$delivery_order_by_pk$delivery_driver?
        delivery_driver,
    int? service_provider_review_by_driver_id,
    String? service_provider_type,
    String? status,
    int? stripe_payment_id,
    int? trip_distance,
    int? trip_duration,
    String? trip_polyline,
    Query$get_driver_order$delivery_order_by_pk$customer? customer,
    String? $__typename,
  });
  CopyWith$Query$get_driver_order$delivery_order_by_pk$restaurant_order<TRes>
      get restaurant_order;
  CopyWith$Query$get_driver_order$delivery_order_by_pk$restaurant<TRes>
      get restaurant;
  CopyWith$Query$get_driver_order$delivery_order_by_pk$delivery_driver<TRes>
      get delivery_driver;
  CopyWith$Query$get_driver_order$delivery_order_by_pk$customer<TRes>
      get customer;
}

class _CopyWithImpl$Query$get_driver_order$delivery_order_by_pk<TRes>
    implements CopyWith$Query$get_driver_order$delivery_order_by_pk<TRes> {
  _CopyWithImpl$Query$get_driver_order$delivery_order_by_pk(
    this._instance,
    this._then,
  );

  final Query$get_driver_order$delivery_order_by_pk _instance;

  final TRes Function(Query$get_driver_order$delivery_order_by_pk) _then;

  static const _undefined = {};

  TRes call({
    Object? actual_arrival_at_dropoff_time = _undefined,
    Object? actual_arrival_at_pickup_time = _undefined,
    Object? actual_delivered_time = _undefined,
    Object? actual_package_ready_time = _undefined,
    Object? cancellation_time = _undefined,
    Object? chat_with_customer_id = _undefined,
    Object? chat_with_service_provider_id = _undefined,
    Object? current_gps = _undefined,
    Object? customer_id = _undefined,
    Object? customer_review_by_driver_id = _undefined,
    Object? delivery_cost = _undefined,
    Object? dropoff_address = _undefined,
    Object? dropoff_gps = _undefined,
    Object? estimated_arrival_at_dropoff_time = _undefined,
    Object? estimated_arrival_at_pickup_time = _undefined,
    Object? estimated_package_ready_time = _undefined,
    Object? id = _undefined,
    Object? restaurant_order = _undefined,
    Object? order_time = _undefined,
    Object? package_cost = _undefined,
    Object? payment_type = _undefined,
    Object? pickup_address = _undefined,
    Object? pickup_gps = _undefined,
    Object? restaurant = _undefined,
    Object? service_provider_id = _undefined,
    Object? delivery_driver = _undefined,
    Object? service_provider_review_by_driver_id = _undefined,
    Object? service_provider_type = _undefined,
    Object? status = _undefined,
    Object? stripe_payment_id = _undefined,
    Object? trip_distance = _undefined,
    Object? trip_duration = _undefined,
    Object? trip_polyline = _undefined,
    Object? customer = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_driver_order$delivery_order_by_pk(
        actual_arrival_at_dropoff_time:
            actual_arrival_at_dropoff_time == _undefined
                ? _instance.actual_arrival_at_dropoff_time
                : (actual_arrival_at_dropoff_time as String?),
        actual_arrival_at_pickup_time:
            actual_arrival_at_pickup_time == _undefined
                ? _instance.actual_arrival_at_pickup_time
                : (actual_arrival_at_pickup_time as String?),
        actual_delivered_time: actual_delivered_time == _undefined
            ? _instance.actual_delivered_time
            : (actual_delivered_time as String?),
        actual_package_ready_time: actual_package_ready_time == _undefined
            ? _instance.actual_package_ready_time
            : (actual_package_ready_time as String?),
        cancellation_time: cancellation_time == _undefined
            ? _instance.cancellation_time
            : (cancellation_time as String?),
        chat_with_customer_id:
            chat_with_customer_id == _undefined || chat_with_customer_id == null
                ? _instance.chat_with_customer_id
                : (chat_with_customer_id as int),
        chat_with_service_provider_id:
            chat_with_service_provider_id == _undefined
                ? _instance.chat_with_service_provider_id
                : (chat_with_service_provider_id as int?),
        current_gps: current_gps == _undefined
            ? _instance.current_gps
            : (current_gps as Geography?),
        customer_id: customer_id == _undefined || customer_id == null
            ? _instance.customer_id
            : (customer_id as int),
        customer_review_by_driver_id: customer_review_by_driver_id == _undefined
            ? _instance.customer_review_by_driver_id
            : (customer_review_by_driver_id as int?),
        delivery_cost: delivery_cost == _undefined || delivery_cost == null
            ? _instance.delivery_cost
            : (delivery_cost as double),
        dropoff_address:
            dropoff_address == _undefined || dropoff_address == null
                ? _instance.dropoff_address
                : (dropoff_address as String),
        dropoff_gps: dropoff_gps == _undefined || dropoff_gps == null
            ? _instance.dropoff_gps
            : (dropoff_gps as Geography),
        estimated_arrival_at_dropoff_time:
            estimated_arrival_at_dropoff_time == _undefined
                ? _instance.estimated_arrival_at_dropoff_time
                : (estimated_arrival_at_dropoff_time as String?),
        estimated_arrival_at_pickup_time:
            estimated_arrival_at_pickup_time == _undefined
                ? _instance.estimated_arrival_at_pickup_time
                : (estimated_arrival_at_pickup_time as String?),
        estimated_package_ready_time: estimated_package_ready_time == _undefined
            ? _instance.estimated_package_ready_time
            : (estimated_package_ready_time as String?),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        restaurant_order: restaurant_order == _undefined
            ? _instance.restaurant_order
            : (restaurant_order
                as Query$get_driver_order$delivery_order_by_pk$restaurant_order?),
        order_time: order_time == _undefined || order_time == null
            ? _instance.order_time
            : (order_time as String),
        package_cost: package_cost == _undefined || package_cost == null
            ? _instance.package_cost
            : (package_cost as double),
        payment_type: payment_type == _undefined || payment_type == null
            ? _instance.payment_type
            : (payment_type as String),
        pickup_address: pickup_address == _undefined || pickup_address == null
            ? _instance.pickup_address
            : (pickup_address as String),
        pickup_gps: pickup_gps == _undefined || pickup_gps == null
            ? _instance.pickup_gps
            : (pickup_gps as Geography),
        restaurant: restaurant == _undefined
            ? _instance.restaurant
            : (restaurant
                as Query$get_driver_order$delivery_order_by_pk$restaurant?),
        service_provider_id: service_provider_id == _undefined
            ? _instance.service_provider_id
            : (service_provider_id as int?),
        delivery_driver: delivery_driver == _undefined
            ? _instance.delivery_driver
            : (delivery_driver
                as Query$get_driver_order$delivery_order_by_pk$delivery_driver?),
        service_provider_review_by_driver_id:
            service_provider_review_by_driver_id == _undefined
                ? _instance.service_provider_review_by_driver_id
                : (service_provider_review_by_driver_id as int?),
        service_provider_type: service_provider_type == _undefined
            ? _instance.service_provider_type
            : (service_provider_type as String?),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as String),
        stripe_payment_id: stripe_payment_id == _undefined
            ? _instance.stripe_payment_id
            : (stripe_payment_id as int?),
        trip_distance: trip_distance == _undefined
            ? _instance.trip_distance
            : (trip_distance as int?),
        trip_duration: trip_duration == _undefined
            ? _instance.trip_duration
            : (trip_duration as int?),
        trip_polyline: trip_polyline == _undefined
            ? _instance.trip_polyline
            : (trip_polyline as String?),
        customer: customer == _undefined || customer == null
            ? _instance.customer
            : (customer
                as Query$get_driver_order$delivery_order_by_pk$customer),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_driver_order$delivery_order_by_pk$restaurant_order<TRes>
      get restaurant_order {
    final local$restaurant_order = _instance.restaurant_order;
    return local$restaurant_order == null
        ? CopyWith$Query$get_driver_order$delivery_order_by_pk$restaurant_order
            .stub(_then(_instance))
        : CopyWith$Query$get_driver_order$delivery_order_by_pk$restaurant_order(
            local$restaurant_order, (e) => call(restaurant_order: e));
  }

  CopyWith$Query$get_driver_order$delivery_order_by_pk$restaurant<TRes>
      get restaurant {
    final local$restaurant = _instance.restaurant;
    return local$restaurant == null
        ? CopyWith$Query$get_driver_order$delivery_order_by_pk$restaurant.stub(
            _then(_instance))
        : CopyWith$Query$get_driver_order$delivery_order_by_pk$restaurant(
            local$restaurant, (e) => call(restaurant: e));
  }

  CopyWith$Query$get_driver_order$delivery_order_by_pk$delivery_driver<TRes>
      get delivery_driver {
    final local$delivery_driver = _instance.delivery_driver;
    return local$delivery_driver == null
        ? CopyWith$Query$get_driver_order$delivery_order_by_pk$delivery_driver
            .stub(_then(_instance))
        : CopyWith$Query$get_driver_order$delivery_order_by_pk$delivery_driver(
            local$delivery_driver, (e) => call(delivery_driver: e));
  }

  CopyWith$Query$get_driver_order$delivery_order_by_pk$customer<TRes>
      get customer {
    final local$customer = _instance.customer;
    return CopyWith$Query$get_driver_order$delivery_order_by_pk$customer(
        local$customer, (e) => call(customer: e));
  }
}

class _CopyWithStubImpl$Query$get_driver_order$delivery_order_by_pk<TRes>
    implements CopyWith$Query$get_driver_order$delivery_order_by_pk<TRes> {
  _CopyWithStubImpl$Query$get_driver_order$delivery_order_by_pk(this._res);

  TRes _res;

  call({
    String? actual_arrival_at_dropoff_time,
    String? actual_arrival_at_pickup_time,
    String? actual_delivered_time,
    String? actual_package_ready_time,
    String? cancellation_time,
    int? chat_with_customer_id,
    int? chat_with_service_provider_id,
    Geography? current_gps,
    int? customer_id,
    int? customer_review_by_driver_id,
    double? delivery_cost,
    String? dropoff_address,
    Geography? dropoff_gps,
    String? estimated_arrival_at_dropoff_time,
    String? estimated_arrival_at_pickup_time,
    String? estimated_package_ready_time,
    int? id,
    Query$get_driver_order$delivery_order_by_pk$restaurant_order?
        restaurant_order,
    String? order_time,
    double? package_cost,
    String? payment_type,
    String? pickup_address,
    Geography? pickup_gps,
    Query$get_driver_order$delivery_order_by_pk$restaurant? restaurant,
    int? service_provider_id,
    Query$get_driver_order$delivery_order_by_pk$delivery_driver?
        delivery_driver,
    int? service_provider_review_by_driver_id,
    String? service_provider_type,
    String? status,
    int? stripe_payment_id,
    int? trip_distance,
    int? trip_duration,
    String? trip_polyline,
    Query$get_driver_order$delivery_order_by_pk$customer? customer,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_driver_order$delivery_order_by_pk$restaurant_order<TRes>
      get restaurant_order =>
          CopyWith$Query$get_driver_order$delivery_order_by_pk$restaurant_order
              .stub(_res);
  CopyWith$Query$get_driver_order$delivery_order_by_pk$restaurant<TRes>
      get restaurant =>
          CopyWith$Query$get_driver_order$delivery_order_by_pk$restaurant.stub(
              _res);
  CopyWith$Query$get_driver_order$delivery_order_by_pk$delivery_driver<TRes>
      get delivery_driver =>
          CopyWith$Query$get_driver_order$delivery_order_by_pk$delivery_driver
              .stub(_res);
  CopyWith$Query$get_driver_order$delivery_order_by_pk$customer<TRes>
      get customer =>
          CopyWith$Query$get_driver_order$delivery_order_by_pk$customer.stub(
              _res);
}

class Query$get_driver_order$delivery_order_by_pk$restaurant_order {
  Query$get_driver_order$delivery_order_by_pk$restaurant_order({
    required this.id,
    required this.$__typename,
  });

  factory Query$get_driver_order$delivery_order_by_pk$restaurant_order.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Query$get_driver_order$delivery_order_by_pk$restaurant_order(
      id: (l$id as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$get_driver_order$delivery_order_by_pk$restaurant_order) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$get_driver_order$delivery_order_by_pk$restaurant_order
    on Query$get_driver_order$delivery_order_by_pk$restaurant_order {
  CopyWith$Query$get_driver_order$delivery_order_by_pk$restaurant_order<
          Query$get_driver_order$delivery_order_by_pk$restaurant_order>
      get copyWith =>
          CopyWith$Query$get_driver_order$delivery_order_by_pk$restaurant_order(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_driver_order$delivery_order_by_pk$restaurant_order<
    TRes> {
  factory CopyWith$Query$get_driver_order$delivery_order_by_pk$restaurant_order(
    Query$get_driver_order$delivery_order_by_pk$restaurant_order instance,
    TRes Function(Query$get_driver_order$delivery_order_by_pk$restaurant_order)
        then,
  ) = _CopyWithImpl$Query$get_driver_order$delivery_order_by_pk$restaurant_order;

  factory CopyWith$Query$get_driver_order$delivery_order_by_pk$restaurant_order.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_driver_order$delivery_order_by_pk$restaurant_order;

  TRes call({
    int? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_driver_order$delivery_order_by_pk$restaurant_order<
        TRes>
    implements
        CopyWith$Query$get_driver_order$delivery_order_by_pk$restaurant_order<
            TRes> {
  _CopyWithImpl$Query$get_driver_order$delivery_order_by_pk$restaurant_order(
    this._instance,
    this._then,
  );

  final Query$get_driver_order$delivery_order_by_pk$restaurant_order _instance;

  final TRes Function(
      Query$get_driver_order$delivery_order_by_pk$restaurant_order) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_driver_order$delivery_order_by_pk$restaurant_order(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$get_driver_order$delivery_order_by_pk$restaurant_order<
        TRes>
    implements
        CopyWith$Query$get_driver_order$delivery_order_by_pk$restaurant_order<
            TRes> {
  _CopyWithStubImpl$Query$get_driver_order$delivery_order_by_pk$restaurant_order(
      this._res);

  TRes _res;

  call({
    int? id,
    String? $__typename,
  }) =>
      _res;
}

class Query$get_driver_order$delivery_order_by_pk$restaurant {
  Query$get_driver_order$delivery_order_by_pk$restaurant({
    required this.id,
    this.firebase_id,
    required this.image,
    required this.name,
    required this.location_gps,
    required this.location_text,
    required this.language_id,
    required this.open_status,
    required this.$__typename,
  });

  factory Query$get_driver_order$delivery_order_by_pk$restaurant.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$firebase_id = json['firebase_id'];
    final l$image = json['image'];
    final l$name = json['name'];
    final l$location_gps = json['location_gps'];
    final l$location_text = json['location_text'];
    final l$language_id = json['language_id'];
    final l$open_status = json['open_status'];
    final l$$__typename = json['__typename'];
    return Query$get_driver_order$delivery_order_by_pk$restaurant(
      id: (l$id as int),
      firebase_id: (l$firebase_id as String?),
      image: (l$image as String),
      name: (l$name as String),
      location_gps: geographyFromJson(l$location_gps),
      location_text: (l$location_text as String),
      language_id: (l$language_id as String),
      open_status: (l$open_status as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String? firebase_id;

  final String image;

  final String name;

  final Geography location_gps;

  final String location_text;

  final String language_id;

  final String open_status;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$firebase_id = firebase_id;
    _resultData['firebase_id'] = l$firebase_id;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$location_gps = location_gps;
    _resultData['location_gps'] = geographyToJson(l$location_gps);
    final l$location_text = location_text;
    _resultData['location_text'] = l$location_text;
    final l$language_id = language_id;
    _resultData['language_id'] = l$language_id;
    final l$open_status = open_status;
    _resultData['open_status'] = l$open_status;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$firebase_id = firebase_id;
    final l$image = image;
    final l$name = name;
    final l$location_gps = location_gps;
    final l$location_text = location_text;
    final l$language_id = language_id;
    final l$open_status = open_status;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$firebase_id,
      l$image,
      l$name,
      l$location_gps,
      l$location_text,
      l$language_id,
      l$open_status,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_driver_order$delivery_order_by_pk$restaurant) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$firebase_id = firebase_id;
    final lOther$firebase_id = other.firebase_id;
    if (l$firebase_id != lOther$firebase_id) {
      return false;
    }
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$location_gps = location_gps;
    final lOther$location_gps = other.location_gps;
    if (l$location_gps != lOther$location_gps) {
      return false;
    }
    final l$location_text = location_text;
    final lOther$location_text = other.location_text;
    if (l$location_text != lOther$location_text) {
      return false;
    }
    final l$language_id = language_id;
    final lOther$language_id = other.language_id;
    if (l$language_id != lOther$language_id) {
      return false;
    }
    final l$open_status = open_status;
    final lOther$open_status = other.open_status;
    if (l$open_status != lOther$open_status) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$get_driver_order$delivery_order_by_pk$restaurant
    on Query$get_driver_order$delivery_order_by_pk$restaurant {
  CopyWith$Query$get_driver_order$delivery_order_by_pk$restaurant<
          Query$get_driver_order$delivery_order_by_pk$restaurant>
      get copyWith =>
          CopyWith$Query$get_driver_order$delivery_order_by_pk$restaurant(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_driver_order$delivery_order_by_pk$restaurant<
    TRes> {
  factory CopyWith$Query$get_driver_order$delivery_order_by_pk$restaurant(
    Query$get_driver_order$delivery_order_by_pk$restaurant instance,
    TRes Function(Query$get_driver_order$delivery_order_by_pk$restaurant) then,
  ) = _CopyWithImpl$Query$get_driver_order$delivery_order_by_pk$restaurant;

  factory CopyWith$Query$get_driver_order$delivery_order_by_pk$restaurant.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_driver_order$delivery_order_by_pk$restaurant;

  TRes call({
    int? id,
    String? firebase_id,
    String? image,
    String? name,
    Geography? location_gps,
    String? location_text,
    String? language_id,
    String? open_status,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_driver_order$delivery_order_by_pk$restaurant<TRes>
    implements
        CopyWith$Query$get_driver_order$delivery_order_by_pk$restaurant<TRes> {
  _CopyWithImpl$Query$get_driver_order$delivery_order_by_pk$restaurant(
    this._instance,
    this._then,
  );

  final Query$get_driver_order$delivery_order_by_pk$restaurant _instance;

  final TRes Function(Query$get_driver_order$delivery_order_by_pk$restaurant)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? firebase_id = _undefined,
    Object? image = _undefined,
    Object? name = _undefined,
    Object? location_gps = _undefined,
    Object? location_text = _undefined,
    Object? language_id = _undefined,
    Object? open_status = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_driver_order$delivery_order_by_pk$restaurant(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        firebase_id: firebase_id == _undefined
            ? _instance.firebase_id
            : (firebase_id as String?),
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        location_gps: location_gps == _undefined || location_gps == null
            ? _instance.location_gps
            : (location_gps as Geography),
        location_text: location_text == _undefined || location_text == null
            ? _instance.location_text
            : (location_text as String),
        language_id: language_id == _undefined || language_id == null
            ? _instance.language_id
            : (language_id as String),
        open_status: open_status == _undefined || open_status == null
            ? _instance.open_status
            : (open_status as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$get_driver_order$delivery_order_by_pk$restaurant<
        TRes>
    implements
        CopyWith$Query$get_driver_order$delivery_order_by_pk$restaurant<TRes> {
  _CopyWithStubImpl$Query$get_driver_order$delivery_order_by_pk$restaurant(
      this._res);

  TRes _res;

  call({
    int? id,
    String? firebase_id,
    String? image,
    String? name,
    Geography? location_gps,
    String? location_text,
    String? language_id,
    String? open_status,
    String? $__typename,
  }) =>
      _res;
}

class Query$get_driver_order$delivery_order_by_pk$delivery_driver {
  Query$get_driver_order$delivery_order_by_pk$delivery_driver({
    this.current_location,
    required this.$__typename,
  });

  factory Query$get_driver_order$delivery_order_by_pk$delivery_driver.fromJson(
      Map<String, dynamic> json) {
    final l$current_location = json['current_location'];
    final l$$__typename = json['__typename'];
    return Query$get_driver_order$delivery_order_by_pk$delivery_driver(
      current_location: l$current_location == null
          ? null
          : geographyFromJson(l$current_location),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Geography? current_location;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$current_location = current_location;
    _resultData['current_location'] =
        l$current_location == null ? null : geographyToJson(l$current_location);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$current_location = current_location;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$current_location,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$get_driver_order$delivery_order_by_pk$delivery_driver) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$current_location = current_location;
    final lOther$current_location = other.current_location;
    if (l$current_location != lOther$current_location) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$get_driver_order$delivery_order_by_pk$delivery_driver
    on Query$get_driver_order$delivery_order_by_pk$delivery_driver {
  CopyWith$Query$get_driver_order$delivery_order_by_pk$delivery_driver<
          Query$get_driver_order$delivery_order_by_pk$delivery_driver>
      get copyWith =>
          CopyWith$Query$get_driver_order$delivery_order_by_pk$delivery_driver(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_driver_order$delivery_order_by_pk$delivery_driver<
    TRes> {
  factory CopyWith$Query$get_driver_order$delivery_order_by_pk$delivery_driver(
    Query$get_driver_order$delivery_order_by_pk$delivery_driver instance,
    TRes Function(Query$get_driver_order$delivery_order_by_pk$delivery_driver)
        then,
  ) = _CopyWithImpl$Query$get_driver_order$delivery_order_by_pk$delivery_driver;

  factory CopyWith$Query$get_driver_order$delivery_order_by_pk$delivery_driver.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_driver_order$delivery_order_by_pk$delivery_driver;

  TRes call({
    Geography? current_location,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_driver_order$delivery_order_by_pk$delivery_driver<
        TRes>
    implements
        CopyWith$Query$get_driver_order$delivery_order_by_pk$delivery_driver<
            TRes> {
  _CopyWithImpl$Query$get_driver_order$delivery_order_by_pk$delivery_driver(
    this._instance,
    this._then,
  );

  final Query$get_driver_order$delivery_order_by_pk$delivery_driver _instance;

  final TRes Function(
      Query$get_driver_order$delivery_order_by_pk$delivery_driver) _then;

  static const _undefined = {};

  TRes call({
    Object? current_location = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_driver_order$delivery_order_by_pk$delivery_driver(
        current_location: current_location == _undefined
            ? _instance.current_location
            : (current_location as Geography?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$get_driver_order$delivery_order_by_pk$delivery_driver<
        TRes>
    implements
        CopyWith$Query$get_driver_order$delivery_order_by_pk$delivery_driver<
            TRes> {
  _CopyWithStubImpl$Query$get_driver_order$delivery_order_by_pk$delivery_driver(
      this._res);

  TRes _res;

  call({
    Geography? current_location,
    String? $__typename,
  }) =>
      _res;
}

class Query$get_driver_order$delivery_order_by_pk$customer {
  Query$get_driver_order$delivery_order_by_pk$customer({
    required this.user,
    required this.$__typename,
  });

  factory Query$get_driver_order$delivery_order_by_pk$customer.fromJson(
      Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Query$get_driver_order$delivery_order_by_pk$customer(
      user: Query$get_driver_order$delivery_order_by_pk$customer$user.fromJson(
          (l$user as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$get_driver_order$delivery_order_by_pk$customer$user user;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$user = user;
    _resultData['user'] = l$user.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$user = user;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$user,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_driver_order$delivery_order_by_pk$customer) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$user = user;
    final lOther$user = other.user;
    if (l$user != lOther$user) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$get_driver_order$delivery_order_by_pk$customer
    on Query$get_driver_order$delivery_order_by_pk$customer {
  CopyWith$Query$get_driver_order$delivery_order_by_pk$customer<
          Query$get_driver_order$delivery_order_by_pk$customer>
      get copyWith =>
          CopyWith$Query$get_driver_order$delivery_order_by_pk$customer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_driver_order$delivery_order_by_pk$customer<
    TRes> {
  factory CopyWith$Query$get_driver_order$delivery_order_by_pk$customer(
    Query$get_driver_order$delivery_order_by_pk$customer instance,
    TRes Function(Query$get_driver_order$delivery_order_by_pk$customer) then,
  ) = _CopyWithImpl$Query$get_driver_order$delivery_order_by_pk$customer;

  factory CopyWith$Query$get_driver_order$delivery_order_by_pk$customer.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_driver_order$delivery_order_by_pk$customer;

  TRes call({
    Query$get_driver_order$delivery_order_by_pk$customer$user? user,
    String? $__typename,
  });
  CopyWith$Query$get_driver_order$delivery_order_by_pk$customer$user<TRes>
      get user;
}

class _CopyWithImpl$Query$get_driver_order$delivery_order_by_pk$customer<TRes>
    implements
        CopyWith$Query$get_driver_order$delivery_order_by_pk$customer<TRes> {
  _CopyWithImpl$Query$get_driver_order$delivery_order_by_pk$customer(
    this._instance,
    this._then,
  );

  final Query$get_driver_order$delivery_order_by_pk$customer _instance;

  final TRes Function(Query$get_driver_order$delivery_order_by_pk$customer)
      _then;

  static const _undefined = {};

  TRes call({
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_driver_order$delivery_order_by_pk$customer(
        user: user == _undefined || user == null
            ? _instance.user
            : (user
                as Query$get_driver_order$delivery_order_by_pk$customer$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_driver_order$delivery_order_by_pk$customer$user<TRes>
      get user {
    final local$user = _instance.user;
    return CopyWith$Query$get_driver_order$delivery_order_by_pk$customer$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Query$get_driver_order$delivery_order_by_pk$customer<
        TRes>
    implements
        CopyWith$Query$get_driver_order$delivery_order_by_pk$customer<TRes> {
  _CopyWithStubImpl$Query$get_driver_order$delivery_order_by_pk$customer(
      this._res);

  TRes _res;

  call({
    Query$get_driver_order$delivery_order_by_pk$customer$user? user,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_driver_order$delivery_order_by_pk$customer$user<TRes>
      get user =>
          CopyWith$Query$get_driver_order$delivery_order_by_pk$customer$user
              .stub(_res);
}

class Query$get_driver_order$delivery_order_by_pk$customer$user {
  Query$get_driver_order$delivery_order_by_pk$customer$user({
    required this.id,
    this.image,
    this.name,
    required this.language_id,
    required this.$__typename,
  });

  factory Query$get_driver_order$delivery_order_by_pk$customer$user.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$image = json['image'];
    final l$name = json['name'];
    final l$language_id = json['language_id'];
    final l$$__typename = json['__typename'];
    return Query$get_driver_order$delivery_order_by_pk$customer$user(
      id: (l$id as int),
      image: (l$image as String?),
      name: (l$name as String?),
      language_id: (l$language_id as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String? image;

  final String? name;

  final String language_id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$language_id = language_id;
    _resultData['language_id'] = l$language_id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$image = image;
    final l$name = name;
    final l$language_id = language_id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$image,
      l$name,
      l$language_id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_driver_order$delivery_order_by_pk$customer$user) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$language_id = language_id;
    final lOther$language_id = other.language_id;
    if (l$language_id != lOther$language_id) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$get_driver_order$delivery_order_by_pk$customer$user
    on Query$get_driver_order$delivery_order_by_pk$customer$user {
  CopyWith$Query$get_driver_order$delivery_order_by_pk$customer$user<
          Query$get_driver_order$delivery_order_by_pk$customer$user>
      get copyWith =>
          CopyWith$Query$get_driver_order$delivery_order_by_pk$customer$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_driver_order$delivery_order_by_pk$customer$user<
    TRes> {
  factory CopyWith$Query$get_driver_order$delivery_order_by_pk$customer$user(
    Query$get_driver_order$delivery_order_by_pk$customer$user instance,
    TRes Function(Query$get_driver_order$delivery_order_by_pk$customer$user)
        then,
  ) = _CopyWithImpl$Query$get_driver_order$delivery_order_by_pk$customer$user;

  factory CopyWith$Query$get_driver_order$delivery_order_by_pk$customer$user.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_driver_order$delivery_order_by_pk$customer$user;

  TRes call({
    int? id,
    String? image,
    String? name,
    String? language_id,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_driver_order$delivery_order_by_pk$customer$user<
        TRes>
    implements
        CopyWith$Query$get_driver_order$delivery_order_by_pk$customer$user<
            TRes> {
  _CopyWithImpl$Query$get_driver_order$delivery_order_by_pk$customer$user(
    this._instance,
    this._then,
  );

  final Query$get_driver_order$delivery_order_by_pk$customer$user _instance;

  final TRes Function(Query$get_driver_order$delivery_order_by_pk$customer$user)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? image = _undefined,
    Object? name = _undefined,
    Object? language_id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_driver_order$delivery_order_by_pk$customer$user(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        image: image == _undefined ? _instance.image : (image as String?),
        name: name == _undefined ? _instance.name : (name as String?),
        language_id: language_id == _undefined || language_id == null
            ? _instance.language_id
            : (language_id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$get_driver_order$delivery_order_by_pk$customer$user<
        TRes>
    implements
        CopyWith$Query$get_driver_order$delivery_order_by_pk$customer$user<
            TRes> {
  _CopyWithStubImpl$Query$get_driver_order$delivery_order_by_pk$customer$user(
      this._res);

  TRes _res;

  call({
    int? id,
    String? image,
    String? name,
    String? language_id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Subscription$listen_on_driver_order {
  factory Variables$Subscription$listen_on_driver_order(
          {required int orderId}) =>
      Variables$Subscription$listen_on_driver_order._({
        r'orderId': orderId,
      });

  Variables$Subscription$listen_on_driver_order._(this._$data);

  factory Variables$Subscription$listen_on_driver_order.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$orderId = data['orderId'];
    result$data['orderId'] = (l$orderId as int);
    return Variables$Subscription$listen_on_driver_order._(result$data);
  }

  Map<String, dynamic> _$data;

  int get orderId => (_$data['orderId'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$orderId = orderId;
    result$data['orderId'] = l$orderId;
    return result$data;
  }

  CopyWith$Variables$Subscription$listen_on_driver_order<
          Variables$Subscription$listen_on_driver_order>
      get copyWith => CopyWith$Variables$Subscription$listen_on_driver_order(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Subscription$listen_on_driver_order) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$orderId = orderId;
    final lOther$orderId = other.orderId;
    if (l$orderId != lOther$orderId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$orderId = orderId;
    return Object.hashAll([l$orderId]);
  }
}

abstract class CopyWith$Variables$Subscription$listen_on_driver_order<TRes> {
  factory CopyWith$Variables$Subscription$listen_on_driver_order(
    Variables$Subscription$listen_on_driver_order instance,
    TRes Function(Variables$Subscription$listen_on_driver_order) then,
  ) = _CopyWithImpl$Variables$Subscription$listen_on_driver_order;

  factory CopyWith$Variables$Subscription$listen_on_driver_order.stub(
          TRes res) =
      _CopyWithStubImpl$Variables$Subscription$listen_on_driver_order;

  TRes call({int? orderId});
}

class _CopyWithImpl$Variables$Subscription$listen_on_driver_order<TRes>
    implements CopyWith$Variables$Subscription$listen_on_driver_order<TRes> {
  _CopyWithImpl$Variables$Subscription$listen_on_driver_order(
    this._instance,
    this._then,
  );

  final Variables$Subscription$listen_on_driver_order _instance;

  final TRes Function(Variables$Subscription$listen_on_driver_order) _then;

  static const _undefined = {};

  TRes call({Object? orderId = _undefined}) =>
      _then(Variables$Subscription$listen_on_driver_order._({
        ..._instance._$data,
        if (orderId != _undefined && orderId != null)
          'orderId': (orderId as int),
      }));
}

class _CopyWithStubImpl$Variables$Subscription$listen_on_driver_order<TRes>
    implements CopyWith$Variables$Subscription$listen_on_driver_order<TRes> {
  _CopyWithStubImpl$Variables$Subscription$listen_on_driver_order(this._res);

  TRes _res;

  call({int? orderId}) => _res;
}

class Subscription$listen_on_driver_order {
  Subscription$listen_on_driver_order({
    this.delivery_order_by_pk,
    required this.$__typename,
  });

  factory Subscription$listen_on_driver_order.fromJson(
      Map<String, dynamic> json) {
    final l$delivery_order_by_pk = json['delivery_order_by_pk'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_driver_order(
      delivery_order_by_pk: l$delivery_order_by_pk == null
          ? null
          : Subscription$listen_on_driver_order$delivery_order_by_pk.fromJson(
              (l$delivery_order_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Subscription$listen_on_driver_order$delivery_order_by_pk?
      delivery_order_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$delivery_order_by_pk = delivery_order_by_pk;
    _resultData['delivery_order_by_pk'] = l$delivery_order_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$delivery_order_by_pk = delivery_order_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$delivery_order_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Subscription$listen_on_driver_order) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$delivery_order_by_pk = delivery_order_by_pk;
    final lOther$delivery_order_by_pk = other.delivery_order_by_pk;
    if (l$delivery_order_by_pk != lOther$delivery_order_by_pk) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Subscription$listen_on_driver_order
    on Subscription$listen_on_driver_order {
  CopyWith$Subscription$listen_on_driver_order<
          Subscription$listen_on_driver_order>
      get copyWith => CopyWith$Subscription$listen_on_driver_order(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_driver_order<TRes> {
  factory CopyWith$Subscription$listen_on_driver_order(
    Subscription$listen_on_driver_order instance,
    TRes Function(Subscription$listen_on_driver_order) then,
  ) = _CopyWithImpl$Subscription$listen_on_driver_order;

  factory CopyWith$Subscription$listen_on_driver_order.stub(TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_driver_order;

  TRes call({
    Subscription$listen_on_driver_order$delivery_order_by_pk?
        delivery_order_by_pk,
    String? $__typename,
  });
  CopyWith$Subscription$listen_on_driver_order$delivery_order_by_pk<TRes>
      get delivery_order_by_pk;
}

class _CopyWithImpl$Subscription$listen_on_driver_order<TRes>
    implements CopyWith$Subscription$listen_on_driver_order<TRes> {
  _CopyWithImpl$Subscription$listen_on_driver_order(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_driver_order _instance;

  final TRes Function(Subscription$listen_on_driver_order) _then;

  static const _undefined = {};

  TRes call({
    Object? delivery_order_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$listen_on_driver_order(
        delivery_order_by_pk: delivery_order_by_pk == _undefined
            ? _instance.delivery_order_by_pk
            : (delivery_order_by_pk
                as Subscription$listen_on_driver_order$delivery_order_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$listen_on_driver_order$delivery_order_by_pk<TRes>
      get delivery_order_by_pk {
    final local$delivery_order_by_pk = _instance.delivery_order_by_pk;
    return local$delivery_order_by_pk == null
        ? CopyWith$Subscription$listen_on_driver_order$delivery_order_by_pk
            .stub(_then(_instance))
        : CopyWith$Subscription$listen_on_driver_order$delivery_order_by_pk(
            local$delivery_order_by_pk, (e) => call(delivery_order_by_pk: e));
  }
}

class _CopyWithStubImpl$Subscription$listen_on_driver_order<TRes>
    implements CopyWith$Subscription$listen_on_driver_order<TRes> {
  _CopyWithStubImpl$Subscription$listen_on_driver_order(this._res);

  TRes _res;

  call({
    Subscription$listen_on_driver_order$delivery_order_by_pk?
        delivery_order_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listen_on_driver_order$delivery_order_by_pk<TRes>
      get delivery_order_by_pk =>
          CopyWith$Subscription$listen_on_driver_order$delivery_order_by_pk
              .stub(_res);
}

const documentNodeSubscriptionlisten_on_driver_order =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.subscription,
    name: NameNode(value: 'listen_on_driver_order'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'orderId')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'delivery_order_by_pk'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'orderId')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'actual_arrival_at_dropoff_time'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'actual_arrival_at_pickup_time'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'actual_delivered_time'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'actual_package_ready_time'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'cancellation_time'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'chat_with_customer_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'chat_with_service_provider_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'delivery_driver'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'current_location'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'restaurant_order'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'current_gps'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'customer_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'customer_review_by_driver_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'delivery_cost'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'dropoff_address'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'dropoff_gps'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'estimated_arrival_at_dropoff_time'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'estimated_arrival_at_pickup_time'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'estimated_package_ready_time'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'order_time'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'package_cost'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'payment_type'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'pickup_address'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'pickup_gps'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'restaurant'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'firebase_id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'image'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'name'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'location_gps'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'location_text'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'language_id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'open_status'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'service_provider_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'service_provider_review_by_driver_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'service_provider_type'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'status'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'stripe_payment_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'trip_distance'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'trip_duration'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'trip_polyline'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'customer'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'user'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'image'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'name'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'language_id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: '__typename'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                ]),
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      
    ]),
  ),
]);
Subscription$listen_on_driver_order
    _parserFn$Subscription$listen_on_driver_order(Map<String, dynamic> data) =>
        Subscription$listen_on_driver_order.fromJson(data);

class Options$Subscription$listen_on_driver_order
    extends graphql.SubscriptionOptions<Subscription$listen_on_driver_order> {
  Options$Subscription$listen_on_driver_order({
    String? operationName,
    required Variables$Subscription$listen_on_driver_order variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          context: context,
          document: documentNodeSubscriptionlisten_on_driver_order,
          parserFn: _parserFn$Subscription$listen_on_driver_order,
        );
}

class WatchOptions$Subscription$listen_on_driver_order
    extends graphql.WatchQueryOptions<Subscription$listen_on_driver_order> {
  WatchOptions$Subscription$listen_on_driver_order({
    String? operationName,
    required Variables$Subscription$listen_on_driver_order variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          context: context,
          document: documentNodeSubscriptionlisten_on_driver_order,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Subscription$listen_on_driver_order,
        );
}

class FetchMoreOptions$Subscription$listen_on_driver_order
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Subscription$listen_on_driver_order({
    required graphql.UpdateQuery updateQuery,
    required Variables$Subscription$listen_on_driver_order variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeSubscriptionlisten_on_driver_order,
        );
}

extension ClientExtension$Subscription$listen_on_driver_order
    on graphql.GraphQLClient {
  Stream<graphql.QueryResult<Subscription$listen_on_driver_order>>
      subscribe$listen_on_driver_order(
              Options$Subscription$listen_on_driver_order options) =>
          this.subscribe(options);
  graphql.ObservableQuery<Subscription$listen_on_driver_order>
      watchSubscription$listen_on_driver_order(
              WatchOptions$Subscription$listen_on_driver_order options) =>
          this.watchQuery(options);
}

class Subscription$listen_on_driver_order$delivery_order_by_pk {
  Subscription$listen_on_driver_order$delivery_order_by_pk({
    this.actual_arrival_at_dropoff_time,
    this.actual_arrival_at_pickup_time,
    this.actual_delivered_time,
    this.actual_package_ready_time,
    this.cancellation_time,
    required this.chat_with_customer_id,
    this.chat_with_service_provider_id,
    this.delivery_driver,
    this.restaurant_order,
    this.current_gps,
    required this.customer_id,
    this.customer_review_by_driver_id,
    required this.delivery_cost,
    required this.dropoff_address,
    required this.dropoff_gps,
    this.estimated_arrival_at_dropoff_time,
    this.estimated_arrival_at_pickup_time,
    this.estimated_package_ready_time,
    required this.id,
    required this.order_time,
    required this.package_cost,
    required this.payment_type,
    required this.pickup_address,
    required this.pickup_gps,
    this.restaurant,
    this.service_provider_id,
    this.service_provider_review_by_driver_id,
    this.service_provider_type,
    required this.status,
    this.stripe_payment_id,
    this.trip_distance,
    this.trip_duration,
    this.trip_polyline,
    required this.customer,
    required this.$__typename,
  });

  factory Subscription$listen_on_driver_order$delivery_order_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$actual_arrival_at_dropoff_time =
        json['actual_arrival_at_dropoff_time'];
    final l$actual_arrival_at_pickup_time =
        json['actual_arrival_at_pickup_time'];
    final l$actual_delivered_time = json['actual_delivered_time'];
    final l$actual_package_ready_time = json['actual_package_ready_time'];
    final l$cancellation_time = json['cancellation_time'];
    final l$chat_with_customer_id = json['chat_with_customer_id'];
    final l$chat_with_service_provider_id =
        json['chat_with_service_provider_id'];
    final l$delivery_driver = json['delivery_driver'];
    final l$restaurant_order = json['restaurant_order'];
    final l$current_gps = json['current_gps'];
    final l$customer_id = json['customer_id'];
    final l$customer_review_by_driver_id = json['customer_review_by_driver_id'];
    final l$delivery_cost = json['delivery_cost'];
    final l$dropoff_address = json['dropoff_address'];
    final l$dropoff_gps = json['dropoff_gps'];
    final l$estimated_arrival_at_dropoff_time =
        json['estimated_arrival_at_dropoff_time'];
    final l$estimated_arrival_at_pickup_time =
        json['estimated_arrival_at_pickup_time'];
    final l$estimated_package_ready_time = json['estimated_package_ready_time'];
    final l$id = json['id'];
    final l$order_time = json['order_time'];
    final l$package_cost = json['package_cost'];
    final l$payment_type = json['payment_type'];
    final l$pickup_address = json['pickup_address'];
    final l$pickup_gps = json['pickup_gps'];
    final l$restaurant = json['restaurant'];
    final l$service_provider_id = json['service_provider_id'];
    final l$service_provider_review_by_driver_id =
        json['service_provider_review_by_driver_id'];
    final l$service_provider_type = json['service_provider_type'];
    final l$status = json['status'];
    final l$stripe_payment_id = json['stripe_payment_id'];
    final l$trip_distance = json['trip_distance'];
    final l$trip_duration = json['trip_duration'];
    final l$trip_polyline = json['trip_polyline'];
    final l$customer = json['customer'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_driver_order$delivery_order_by_pk(
      actual_arrival_at_dropoff_time:
          (l$actual_arrival_at_dropoff_time as String?),
      actual_arrival_at_pickup_time:
          (l$actual_arrival_at_pickup_time as String?),
      actual_delivered_time: (l$actual_delivered_time as String?),
      actual_package_ready_time: (l$actual_package_ready_time as String?),
      cancellation_time: (l$cancellation_time as String?),
      chat_with_customer_id: (l$chat_with_customer_id as int),
      chat_with_service_provider_id: (l$chat_with_service_provider_id as int?),
      delivery_driver: l$delivery_driver == null
          ? null
          : Subscription$listen_on_driver_order$delivery_order_by_pk$delivery_driver
              .fromJson((l$delivery_driver as Map<String, dynamic>)),
      restaurant_order: l$restaurant_order == null
          ? null
          : Subscription$listen_on_driver_order$delivery_order_by_pk$restaurant_order
              .fromJson((l$restaurant_order as Map<String, dynamic>)),
      current_gps:
          l$current_gps == null ? null : geographyFromJson(l$current_gps),
      customer_id: (l$customer_id as int),
      customer_review_by_driver_id: (l$customer_review_by_driver_id as int?),
      delivery_cost: moneyFromJson(l$delivery_cost),
      dropoff_address: (l$dropoff_address as String),
      dropoff_gps: geographyFromJson(l$dropoff_gps),
      estimated_arrival_at_dropoff_time:
          (l$estimated_arrival_at_dropoff_time as String?),
      estimated_arrival_at_pickup_time:
          (l$estimated_arrival_at_pickup_time as String?),
      estimated_package_ready_time: (l$estimated_package_ready_time as String?),
      id: (l$id as int),
      order_time: (l$order_time as String),
      package_cost: moneyFromJson(l$package_cost),
      payment_type: (l$payment_type as String),
      pickup_address: (l$pickup_address as String),
      pickup_gps: geographyFromJson(l$pickup_gps),
      restaurant: l$restaurant == null
          ? null
          : Subscription$listen_on_driver_order$delivery_order_by_pk$restaurant
              .fromJson((l$restaurant as Map<String, dynamic>)),
      service_provider_id: (l$service_provider_id as int?),
      service_provider_review_by_driver_id:
          (l$service_provider_review_by_driver_id as int?),
      service_provider_type: (l$service_provider_type as String?),
      status: (l$status as String),
      stripe_payment_id: (l$stripe_payment_id as int?),
      trip_distance: (l$trip_distance as int?),
      trip_duration: (l$trip_duration as int?),
      trip_polyline: (l$trip_polyline as String?),
      customer:
          Subscription$listen_on_driver_order$delivery_order_by_pk$customer
              .fromJson((l$customer as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String? actual_arrival_at_dropoff_time;

  final String? actual_arrival_at_pickup_time;

  final String? actual_delivered_time;

  final String? actual_package_ready_time;

  final String? cancellation_time;

  final int chat_with_customer_id;

  final int? chat_with_service_provider_id;

  final Subscription$listen_on_driver_order$delivery_order_by_pk$delivery_driver?
      delivery_driver;

  final Subscription$listen_on_driver_order$delivery_order_by_pk$restaurant_order?
      restaurant_order;

  final Geography? current_gps;

  final int customer_id;

  final int? customer_review_by_driver_id;

  final double delivery_cost;

  final String dropoff_address;

  final Geography dropoff_gps;

  final String? estimated_arrival_at_dropoff_time;

  final String? estimated_arrival_at_pickup_time;

  final String? estimated_package_ready_time;

  final int id;

  final String order_time;

  final double package_cost;

  final String payment_type;

  final String pickup_address;

  final Geography pickup_gps;

  final Subscription$listen_on_driver_order$delivery_order_by_pk$restaurant?
      restaurant;

  final int? service_provider_id;

  final int? service_provider_review_by_driver_id;

  final String? service_provider_type;

  final String status;

  final int? stripe_payment_id;

  final int? trip_distance;

  final int? trip_duration;

  final String? trip_polyline;

  final Subscription$listen_on_driver_order$delivery_order_by_pk$customer
      customer;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$actual_arrival_at_dropoff_time = actual_arrival_at_dropoff_time;
    _resultData['actual_arrival_at_dropoff_time'] =
        l$actual_arrival_at_dropoff_time;
    final l$actual_arrival_at_pickup_time = actual_arrival_at_pickup_time;
    _resultData['actual_arrival_at_pickup_time'] =
        l$actual_arrival_at_pickup_time;
    final l$actual_delivered_time = actual_delivered_time;
    _resultData['actual_delivered_time'] = l$actual_delivered_time;
    final l$actual_package_ready_time = actual_package_ready_time;
    _resultData['actual_package_ready_time'] = l$actual_package_ready_time;
    final l$cancellation_time = cancellation_time;
    _resultData['cancellation_time'] = l$cancellation_time;
    final l$chat_with_customer_id = chat_with_customer_id;
    _resultData['chat_with_customer_id'] = l$chat_with_customer_id;
    final l$chat_with_service_provider_id = chat_with_service_provider_id;
    _resultData['chat_with_service_provider_id'] =
        l$chat_with_service_provider_id;
    final l$delivery_driver = delivery_driver;
    _resultData['delivery_driver'] = l$delivery_driver?.toJson();
    final l$restaurant_order = restaurant_order;
    _resultData['restaurant_order'] = l$restaurant_order?.toJson();
    final l$current_gps = current_gps;
    _resultData['current_gps'] =
        l$current_gps == null ? null : geographyToJson(l$current_gps);
    final l$customer_id = customer_id;
    _resultData['customer_id'] = l$customer_id;
    final l$customer_review_by_driver_id = customer_review_by_driver_id;
    _resultData['customer_review_by_driver_id'] =
        l$customer_review_by_driver_id;
    final l$delivery_cost = delivery_cost;
    _resultData['delivery_cost'] = moneyToJson(l$delivery_cost);
    final l$dropoff_address = dropoff_address;
    _resultData['dropoff_address'] = l$dropoff_address;
    final l$dropoff_gps = dropoff_gps;
    _resultData['dropoff_gps'] = geographyToJson(l$dropoff_gps);
    final l$estimated_arrival_at_dropoff_time =
        estimated_arrival_at_dropoff_time;
    _resultData['estimated_arrival_at_dropoff_time'] =
        l$estimated_arrival_at_dropoff_time;
    final l$estimated_arrival_at_pickup_time = estimated_arrival_at_pickup_time;
    _resultData['estimated_arrival_at_pickup_time'] =
        l$estimated_arrival_at_pickup_time;
    final l$estimated_package_ready_time = estimated_package_ready_time;
    _resultData['estimated_package_ready_time'] =
        l$estimated_package_ready_time;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$order_time = order_time;
    _resultData['order_time'] = l$order_time;
    final l$package_cost = package_cost;
    _resultData['package_cost'] = moneyToJson(l$package_cost);
    final l$payment_type = payment_type;
    _resultData['payment_type'] = l$payment_type;
    final l$pickup_address = pickup_address;
    _resultData['pickup_address'] = l$pickup_address;
    final l$pickup_gps = pickup_gps;
    _resultData['pickup_gps'] = geographyToJson(l$pickup_gps);
    final l$restaurant = restaurant;
    _resultData['restaurant'] = l$restaurant?.toJson();
    final l$service_provider_id = service_provider_id;
    _resultData['service_provider_id'] = l$service_provider_id;
    final l$service_provider_review_by_driver_id =
        service_provider_review_by_driver_id;
    _resultData['service_provider_review_by_driver_id'] =
        l$service_provider_review_by_driver_id;
    final l$service_provider_type = service_provider_type;
    _resultData['service_provider_type'] = l$service_provider_type;
    final l$status = status;
    _resultData['status'] = l$status;
    final l$stripe_payment_id = stripe_payment_id;
    _resultData['stripe_payment_id'] = l$stripe_payment_id;
    final l$trip_distance = trip_distance;
    _resultData['trip_distance'] = l$trip_distance;
    final l$trip_duration = trip_duration;
    _resultData['trip_duration'] = l$trip_duration;
    final l$trip_polyline = trip_polyline;
    _resultData['trip_polyline'] = l$trip_polyline;
    final l$customer = customer;
    _resultData['customer'] = l$customer.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$actual_arrival_at_dropoff_time = actual_arrival_at_dropoff_time;
    final l$actual_arrival_at_pickup_time = actual_arrival_at_pickup_time;
    final l$actual_delivered_time = actual_delivered_time;
    final l$actual_package_ready_time = actual_package_ready_time;
    final l$cancellation_time = cancellation_time;
    final l$chat_with_customer_id = chat_with_customer_id;
    final l$chat_with_service_provider_id = chat_with_service_provider_id;
    final l$delivery_driver = delivery_driver;
    final l$restaurant_order = restaurant_order;
    final l$current_gps = current_gps;
    final l$customer_id = customer_id;
    final l$customer_review_by_driver_id = customer_review_by_driver_id;
    final l$delivery_cost = delivery_cost;
    final l$dropoff_address = dropoff_address;
    final l$dropoff_gps = dropoff_gps;
    final l$estimated_arrival_at_dropoff_time =
        estimated_arrival_at_dropoff_time;
    final l$estimated_arrival_at_pickup_time = estimated_arrival_at_pickup_time;
    final l$estimated_package_ready_time = estimated_package_ready_time;
    final l$id = id;
    final l$order_time = order_time;
    final l$package_cost = package_cost;
    final l$payment_type = payment_type;
    final l$pickup_address = pickup_address;
    final l$pickup_gps = pickup_gps;
    final l$restaurant = restaurant;
    final l$service_provider_id = service_provider_id;
    final l$service_provider_review_by_driver_id =
        service_provider_review_by_driver_id;
    final l$service_provider_type = service_provider_type;
    final l$status = status;
    final l$stripe_payment_id = stripe_payment_id;
    final l$trip_distance = trip_distance;
    final l$trip_duration = trip_duration;
    final l$trip_polyline = trip_polyline;
    final l$customer = customer;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$actual_arrival_at_dropoff_time,
      l$actual_arrival_at_pickup_time,
      l$actual_delivered_time,
      l$actual_package_ready_time,
      l$cancellation_time,
      l$chat_with_customer_id,
      l$chat_with_service_provider_id,
      l$delivery_driver,
      l$restaurant_order,
      l$current_gps,
      l$customer_id,
      l$customer_review_by_driver_id,
      l$delivery_cost,
      l$dropoff_address,
      l$dropoff_gps,
      l$estimated_arrival_at_dropoff_time,
      l$estimated_arrival_at_pickup_time,
      l$estimated_package_ready_time,
      l$id,
      l$order_time,
      l$package_cost,
      l$payment_type,
      l$pickup_address,
      l$pickup_gps,
      l$restaurant,
      l$service_provider_id,
      l$service_provider_review_by_driver_id,
      l$service_provider_type,
      l$status,
      l$stripe_payment_id,
      l$trip_distance,
      l$trip_duration,
      l$trip_polyline,
      l$customer,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Subscription$listen_on_driver_order$delivery_order_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$actual_arrival_at_dropoff_time = actual_arrival_at_dropoff_time;
    final lOther$actual_arrival_at_dropoff_time =
        other.actual_arrival_at_dropoff_time;
    if (l$actual_arrival_at_dropoff_time !=
        lOther$actual_arrival_at_dropoff_time) {
      return false;
    }
    final l$actual_arrival_at_pickup_time = actual_arrival_at_pickup_time;
    final lOther$actual_arrival_at_pickup_time =
        other.actual_arrival_at_pickup_time;
    if (l$actual_arrival_at_pickup_time !=
        lOther$actual_arrival_at_pickup_time) {
      return false;
    }
    final l$actual_delivered_time = actual_delivered_time;
    final lOther$actual_delivered_time = other.actual_delivered_time;
    if (l$actual_delivered_time != lOther$actual_delivered_time) {
      return false;
    }
    final l$actual_package_ready_time = actual_package_ready_time;
    final lOther$actual_package_ready_time = other.actual_package_ready_time;
    if (l$actual_package_ready_time != lOther$actual_package_ready_time) {
      return false;
    }
    final l$cancellation_time = cancellation_time;
    final lOther$cancellation_time = other.cancellation_time;
    if (l$cancellation_time != lOther$cancellation_time) {
      return false;
    }
    final l$chat_with_customer_id = chat_with_customer_id;
    final lOther$chat_with_customer_id = other.chat_with_customer_id;
    if (l$chat_with_customer_id != lOther$chat_with_customer_id) {
      return false;
    }
    final l$chat_with_service_provider_id = chat_with_service_provider_id;
    final lOther$chat_with_service_provider_id =
        other.chat_with_service_provider_id;
    if (l$chat_with_service_provider_id !=
        lOther$chat_with_service_provider_id) {
      return false;
    }
    final l$delivery_driver = delivery_driver;
    final lOther$delivery_driver = other.delivery_driver;
    if (l$delivery_driver != lOther$delivery_driver) {
      return false;
    }
    final l$restaurant_order = restaurant_order;
    final lOther$restaurant_order = other.restaurant_order;
    if (l$restaurant_order != lOther$restaurant_order) {
      return false;
    }
    final l$current_gps = current_gps;
    final lOther$current_gps = other.current_gps;
    if (l$current_gps != lOther$current_gps) {
      return false;
    }
    final l$customer_id = customer_id;
    final lOther$customer_id = other.customer_id;
    if (l$customer_id != lOther$customer_id) {
      return false;
    }
    final l$customer_review_by_driver_id = customer_review_by_driver_id;
    final lOther$customer_review_by_driver_id =
        other.customer_review_by_driver_id;
    if (l$customer_review_by_driver_id != lOther$customer_review_by_driver_id) {
      return false;
    }
    final l$delivery_cost = delivery_cost;
    final lOther$delivery_cost = other.delivery_cost;
    if (l$delivery_cost != lOther$delivery_cost) {
      return false;
    }
    final l$dropoff_address = dropoff_address;
    final lOther$dropoff_address = other.dropoff_address;
    if (l$dropoff_address != lOther$dropoff_address) {
      return false;
    }
    final l$dropoff_gps = dropoff_gps;
    final lOther$dropoff_gps = other.dropoff_gps;
    if (l$dropoff_gps != lOther$dropoff_gps) {
      return false;
    }
    final l$estimated_arrival_at_dropoff_time =
        estimated_arrival_at_dropoff_time;
    final lOther$estimated_arrival_at_dropoff_time =
        other.estimated_arrival_at_dropoff_time;
    if (l$estimated_arrival_at_dropoff_time !=
        lOther$estimated_arrival_at_dropoff_time) {
      return false;
    }
    final l$estimated_arrival_at_pickup_time = estimated_arrival_at_pickup_time;
    final lOther$estimated_arrival_at_pickup_time =
        other.estimated_arrival_at_pickup_time;
    if (l$estimated_arrival_at_pickup_time !=
        lOther$estimated_arrival_at_pickup_time) {
      return false;
    }
    final l$estimated_package_ready_time = estimated_package_ready_time;
    final lOther$estimated_package_ready_time =
        other.estimated_package_ready_time;
    if (l$estimated_package_ready_time != lOther$estimated_package_ready_time) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$order_time = order_time;
    final lOther$order_time = other.order_time;
    if (l$order_time != lOther$order_time) {
      return false;
    }
    final l$package_cost = package_cost;
    final lOther$package_cost = other.package_cost;
    if (l$package_cost != lOther$package_cost) {
      return false;
    }
    final l$payment_type = payment_type;
    final lOther$payment_type = other.payment_type;
    if (l$payment_type != lOther$payment_type) {
      return false;
    }
    final l$pickup_address = pickup_address;
    final lOther$pickup_address = other.pickup_address;
    if (l$pickup_address != lOther$pickup_address) {
      return false;
    }
    final l$pickup_gps = pickup_gps;
    final lOther$pickup_gps = other.pickup_gps;
    if (l$pickup_gps != lOther$pickup_gps) {
      return false;
    }
    final l$restaurant = restaurant;
    final lOther$restaurant = other.restaurant;
    if (l$restaurant != lOther$restaurant) {
      return false;
    }
    final l$service_provider_id = service_provider_id;
    final lOther$service_provider_id = other.service_provider_id;
    if (l$service_provider_id != lOther$service_provider_id) {
      return false;
    }
    final l$service_provider_review_by_driver_id =
        service_provider_review_by_driver_id;
    final lOther$service_provider_review_by_driver_id =
        other.service_provider_review_by_driver_id;
    if (l$service_provider_review_by_driver_id !=
        lOther$service_provider_review_by_driver_id) {
      return false;
    }
    final l$service_provider_type = service_provider_type;
    final lOther$service_provider_type = other.service_provider_type;
    if (l$service_provider_type != lOther$service_provider_type) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$stripe_payment_id = stripe_payment_id;
    final lOther$stripe_payment_id = other.stripe_payment_id;
    if (l$stripe_payment_id != lOther$stripe_payment_id) {
      return false;
    }
    final l$trip_distance = trip_distance;
    final lOther$trip_distance = other.trip_distance;
    if (l$trip_distance != lOther$trip_distance) {
      return false;
    }
    final l$trip_duration = trip_duration;
    final lOther$trip_duration = other.trip_duration;
    if (l$trip_duration != lOther$trip_duration) {
      return false;
    }
    final l$trip_polyline = trip_polyline;
    final lOther$trip_polyline = other.trip_polyline;
    if (l$trip_polyline != lOther$trip_polyline) {
      return false;
    }
    final l$customer = customer;
    final lOther$customer = other.customer;
    if (l$customer != lOther$customer) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Subscription$listen_on_driver_order$delivery_order_by_pk
    on Subscription$listen_on_driver_order$delivery_order_by_pk {
  CopyWith$Subscription$listen_on_driver_order$delivery_order_by_pk<
          Subscription$listen_on_driver_order$delivery_order_by_pk>
      get copyWith =>
          CopyWith$Subscription$listen_on_driver_order$delivery_order_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_driver_order$delivery_order_by_pk<
    TRes> {
  factory CopyWith$Subscription$listen_on_driver_order$delivery_order_by_pk(
    Subscription$listen_on_driver_order$delivery_order_by_pk instance,
    TRes Function(Subscription$listen_on_driver_order$delivery_order_by_pk)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_driver_order$delivery_order_by_pk;

  factory CopyWith$Subscription$listen_on_driver_order$delivery_order_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_driver_order$delivery_order_by_pk;

  TRes call({
    String? actual_arrival_at_dropoff_time,
    String? actual_arrival_at_pickup_time,
    String? actual_delivered_time,
    String? actual_package_ready_time,
    String? cancellation_time,
    int? chat_with_customer_id,
    int? chat_with_service_provider_id,
    Subscription$listen_on_driver_order$delivery_order_by_pk$delivery_driver?
        delivery_driver,
    Subscription$listen_on_driver_order$delivery_order_by_pk$restaurant_order?
        restaurant_order,
    Geography? current_gps,
    int? customer_id,
    int? customer_review_by_driver_id,
    double? delivery_cost,
    String? dropoff_address,
    Geography? dropoff_gps,
    String? estimated_arrival_at_dropoff_time,
    String? estimated_arrival_at_pickup_time,
    String? estimated_package_ready_time,
    int? id,
    String? order_time,
    double? package_cost,
    String? payment_type,
    String? pickup_address,
    Geography? pickup_gps,
    Subscription$listen_on_driver_order$delivery_order_by_pk$restaurant?
        restaurant,
    int? service_provider_id,
    int? service_provider_review_by_driver_id,
    String? service_provider_type,
    String? status,
    int? stripe_payment_id,
    int? trip_distance,
    int? trip_duration,
    String? trip_polyline,
    Subscription$listen_on_driver_order$delivery_order_by_pk$customer? customer,
    String? $__typename,
  });
  CopyWith$Subscription$listen_on_driver_order$delivery_order_by_pk$delivery_driver<
      TRes> get delivery_driver;
  CopyWith$Subscription$listen_on_driver_order$delivery_order_by_pk$restaurant_order<
      TRes> get restaurant_order;
  CopyWith$Subscription$listen_on_driver_order$delivery_order_by_pk$restaurant<
      TRes> get restaurant;
  CopyWith$Subscription$listen_on_driver_order$delivery_order_by_pk$customer<
      TRes> get customer;
}

class _CopyWithImpl$Subscription$listen_on_driver_order$delivery_order_by_pk<
        TRes>
    implements
        CopyWith$Subscription$listen_on_driver_order$delivery_order_by_pk<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_driver_order$delivery_order_by_pk(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_driver_order$delivery_order_by_pk _instance;

  final TRes Function(Subscription$listen_on_driver_order$delivery_order_by_pk)
      _then;

  static const _undefined = {};

  TRes call({
    Object? actual_arrival_at_dropoff_time = _undefined,
    Object? actual_arrival_at_pickup_time = _undefined,
    Object? actual_delivered_time = _undefined,
    Object? actual_package_ready_time = _undefined,
    Object? cancellation_time = _undefined,
    Object? chat_with_customer_id = _undefined,
    Object? chat_with_service_provider_id = _undefined,
    Object? delivery_driver = _undefined,
    Object? restaurant_order = _undefined,
    Object? current_gps = _undefined,
    Object? customer_id = _undefined,
    Object? customer_review_by_driver_id = _undefined,
    Object? delivery_cost = _undefined,
    Object? dropoff_address = _undefined,
    Object? dropoff_gps = _undefined,
    Object? estimated_arrival_at_dropoff_time = _undefined,
    Object? estimated_arrival_at_pickup_time = _undefined,
    Object? estimated_package_ready_time = _undefined,
    Object? id = _undefined,
    Object? order_time = _undefined,
    Object? package_cost = _undefined,
    Object? payment_type = _undefined,
    Object? pickup_address = _undefined,
    Object? pickup_gps = _undefined,
    Object? restaurant = _undefined,
    Object? service_provider_id = _undefined,
    Object? service_provider_review_by_driver_id = _undefined,
    Object? service_provider_type = _undefined,
    Object? status = _undefined,
    Object? stripe_payment_id = _undefined,
    Object? trip_distance = _undefined,
    Object? trip_duration = _undefined,
    Object? trip_polyline = _undefined,
    Object? customer = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$listen_on_driver_order$delivery_order_by_pk(
        actual_arrival_at_dropoff_time:
            actual_arrival_at_dropoff_time == _undefined
                ? _instance.actual_arrival_at_dropoff_time
                : (actual_arrival_at_dropoff_time as String?),
        actual_arrival_at_pickup_time:
            actual_arrival_at_pickup_time == _undefined
                ? _instance.actual_arrival_at_pickup_time
                : (actual_arrival_at_pickup_time as String?),
        actual_delivered_time: actual_delivered_time == _undefined
            ? _instance.actual_delivered_time
            : (actual_delivered_time as String?),
        actual_package_ready_time: actual_package_ready_time == _undefined
            ? _instance.actual_package_ready_time
            : (actual_package_ready_time as String?),
        cancellation_time: cancellation_time == _undefined
            ? _instance.cancellation_time
            : (cancellation_time as String?),
        chat_with_customer_id:
            chat_with_customer_id == _undefined || chat_with_customer_id == null
                ? _instance.chat_with_customer_id
                : (chat_with_customer_id as int),
        chat_with_service_provider_id:
            chat_with_service_provider_id == _undefined
                ? _instance.chat_with_service_provider_id
                : (chat_with_service_provider_id as int?),
        delivery_driver: delivery_driver == _undefined
            ? _instance.delivery_driver
            : (delivery_driver
                as Subscription$listen_on_driver_order$delivery_order_by_pk$delivery_driver?),
        restaurant_order: restaurant_order == _undefined
            ? _instance.restaurant_order
            : (restaurant_order
                as Subscription$listen_on_driver_order$delivery_order_by_pk$restaurant_order?),
        current_gps: current_gps == _undefined
            ? _instance.current_gps
            : (current_gps as Geography?),
        customer_id: customer_id == _undefined || customer_id == null
            ? _instance.customer_id
            : (customer_id as int),
        customer_review_by_driver_id: customer_review_by_driver_id == _undefined
            ? _instance.customer_review_by_driver_id
            : (customer_review_by_driver_id as int?),
        delivery_cost: delivery_cost == _undefined || delivery_cost == null
            ? _instance.delivery_cost
            : (delivery_cost as double),
        dropoff_address:
            dropoff_address == _undefined || dropoff_address == null
                ? _instance.dropoff_address
                : (dropoff_address as String),
        dropoff_gps: dropoff_gps == _undefined || dropoff_gps == null
            ? _instance.dropoff_gps
            : (dropoff_gps as Geography),
        estimated_arrival_at_dropoff_time:
            estimated_arrival_at_dropoff_time == _undefined
                ? _instance.estimated_arrival_at_dropoff_time
                : (estimated_arrival_at_dropoff_time as String?),
        estimated_arrival_at_pickup_time:
            estimated_arrival_at_pickup_time == _undefined
                ? _instance.estimated_arrival_at_pickup_time
                : (estimated_arrival_at_pickup_time as String?),
        estimated_package_ready_time: estimated_package_ready_time == _undefined
            ? _instance.estimated_package_ready_time
            : (estimated_package_ready_time as String?),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        order_time: order_time == _undefined || order_time == null
            ? _instance.order_time
            : (order_time as String),
        package_cost: package_cost == _undefined || package_cost == null
            ? _instance.package_cost
            : (package_cost as double),
        payment_type: payment_type == _undefined || payment_type == null
            ? _instance.payment_type
            : (payment_type as String),
        pickup_address: pickup_address == _undefined || pickup_address == null
            ? _instance.pickup_address
            : (pickup_address as String),
        pickup_gps: pickup_gps == _undefined || pickup_gps == null
            ? _instance.pickup_gps
            : (pickup_gps as Geography),
        restaurant: restaurant == _undefined
            ? _instance.restaurant
            : (restaurant
                as Subscription$listen_on_driver_order$delivery_order_by_pk$restaurant?),
        service_provider_id: service_provider_id == _undefined
            ? _instance.service_provider_id
            : (service_provider_id as int?),
        service_provider_review_by_driver_id:
            service_provider_review_by_driver_id == _undefined
                ? _instance.service_provider_review_by_driver_id
                : (service_provider_review_by_driver_id as int?),
        service_provider_type: service_provider_type == _undefined
            ? _instance.service_provider_type
            : (service_provider_type as String?),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as String),
        stripe_payment_id: stripe_payment_id == _undefined
            ? _instance.stripe_payment_id
            : (stripe_payment_id as int?),
        trip_distance: trip_distance == _undefined
            ? _instance.trip_distance
            : (trip_distance as int?),
        trip_duration: trip_duration == _undefined
            ? _instance.trip_duration
            : (trip_duration as int?),
        trip_polyline: trip_polyline == _undefined
            ? _instance.trip_polyline
            : (trip_polyline as String?),
        customer: customer == _undefined || customer == null
            ? _instance.customer
            : (customer
                as Subscription$listen_on_driver_order$delivery_order_by_pk$customer),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$listen_on_driver_order$delivery_order_by_pk$delivery_driver<
      TRes> get delivery_driver {
    final local$delivery_driver = _instance.delivery_driver;
    return local$delivery_driver == null
        ? CopyWith$Subscription$listen_on_driver_order$delivery_order_by_pk$delivery_driver
            .stub(_then(_instance))
        : CopyWith$Subscription$listen_on_driver_order$delivery_order_by_pk$delivery_driver(
            local$delivery_driver, (e) => call(delivery_driver: e));
  }

  CopyWith$Subscription$listen_on_driver_order$delivery_order_by_pk$restaurant_order<
      TRes> get restaurant_order {
    final local$restaurant_order = _instance.restaurant_order;
    return local$restaurant_order == null
        ? CopyWith$Subscription$listen_on_driver_order$delivery_order_by_pk$restaurant_order
            .stub(_then(_instance))
        : CopyWith$Subscription$listen_on_driver_order$delivery_order_by_pk$restaurant_order(
            local$restaurant_order, (e) => call(restaurant_order: e));
  }

  CopyWith$Subscription$listen_on_driver_order$delivery_order_by_pk$restaurant<
      TRes> get restaurant {
    final local$restaurant = _instance.restaurant;
    return local$restaurant == null
        ? CopyWith$Subscription$listen_on_driver_order$delivery_order_by_pk$restaurant
            .stub(_then(_instance))
        : CopyWith$Subscription$listen_on_driver_order$delivery_order_by_pk$restaurant(
            local$restaurant, (e) => call(restaurant: e));
  }

  CopyWith$Subscription$listen_on_driver_order$delivery_order_by_pk$customer<
      TRes> get customer {
    final local$customer = _instance.customer;
    return CopyWith$Subscription$listen_on_driver_order$delivery_order_by_pk$customer(
        local$customer, (e) => call(customer: e));
  }
}

class _CopyWithStubImpl$Subscription$listen_on_driver_order$delivery_order_by_pk<
        TRes>
    implements
        CopyWith$Subscription$listen_on_driver_order$delivery_order_by_pk<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_driver_order$delivery_order_by_pk(
      this._res);

  TRes _res;

  call({
    String? actual_arrival_at_dropoff_time,
    String? actual_arrival_at_pickup_time,
    String? actual_delivered_time,
    String? actual_package_ready_time,
    String? cancellation_time,
    int? chat_with_customer_id,
    int? chat_with_service_provider_id,
    Subscription$listen_on_driver_order$delivery_order_by_pk$delivery_driver?
        delivery_driver,
    Subscription$listen_on_driver_order$delivery_order_by_pk$restaurant_order?
        restaurant_order,
    Geography? current_gps,
    int? customer_id,
    int? customer_review_by_driver_id,
    double? delivery_cost,
    String? dropoff_address,
    Geography? dropoff_gps,
    String? estimated_arrival_at_dropoff_time,
    String? estimated_arrival_at_pickup_time,
    String? estimated_package_ready_time,
    int? id,
    String? order_time,
    double? package_cost,
    String? payment_type,
    String? pickup_address,
    Geography? pickup_gps,
    Subscription$listen_on_driver_order$delivery_order_by_pk$restaurant?
        restaurant,
    int? service_provider_id,
    int? service_provider_review_by_driver_id,
    String? service_provider_type,
    String? status,
    int? stripe_payment_id,
    int? trip_distance,
    int? trip_duration,
    String? trip_polyline,
    Subscription$listen_on_driver_order$delivery_order_by_pk$customer? customer,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listen_on_driver_order$delivery_order_by_pk$delivery_driver<
          TRes>
      get delivery_driver =>
          CopyWith$Subscription$listen_on_driver_order$delivery_order_by_pk$delivery_driver
              .stub(_res);
  CopyWith$Subscription$listen_on_driver_order$delivery_order_by_pk$restaurant_order<
          TRes>
      get restaurant_order =>
          CopyWith$Subscription$listen_on_driver_order$delivery_order_by_pk$restaurant_order
              .stub(_res);
  CopyWith$Subscription$listen_on_driver_order$delivery_order_by_pk$restaurant<
          TRes>
      get restaurant =>
          CopyWith$Subscription$listen_on_driver_order$delivery_order_by_pk$restaurant
              .stub(_res);
  CopyWith$Subscription$listen_on_driver_order$delivery_order_by_pk$customer<
          TRes>
      get customer =>
          CopyWith$Subscription$listen_on_driver_order$delivery_order_by_pk$customer
              .stub(_res);
}

class Subscription$listen_on_driver_order$delivery_order_by_pk$delivery_driver {
  Subscription$listen_on_driver_order$delivery_order_by_pk$delivery_driver({
    this.current_location,
    required this.$__typename,
  });

  factory Subscription$listen_on_driver_order$delivery_order_by_pk$delivery_driver.fromJson(
      Map<String, dynamic> json) {
    final l$current_location = json['current_location'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_driver_order$delivery_order_by_pk$delivery_driver(
      current_location: l$current_location == null
          ? null
          : geographyFromJson(l$current_location),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Geography? current_location;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$current_location = current_location;
    _resultData['current_location'] =
        l$current_location == null ? null : geographyToJson(l$current_location);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$current_location = current_location;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$current_location,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Subscription$listen_on_driver_order$delivery_order_by_pk$delivery_driver) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$current_location = current_location;
    final lOther$current_location = other.current_location;
    if (l$current_location != lOther$current_location) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Subscription$listen_on_driver_order$delivery_order_by_pk$delivery_driver
    on Subscription$listen_on_driver_order$delivery_order_by_pk$delivery_driver {
  CopyWith$Subscription$listen_on_driver_order$delivery_order_by_pk$delivery_driver<
          Subscription$listen_on_driver_order$delivery_order_by_pk$delivery_driver>
      get copyWith =>
          CopyWith$Subscription$listen_on_driver_order$delivery_order_by_pk$delivery_driver(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_driver_order$delivery_order_by_pk$delivery_driver<
    TRes> {
  factory CopyWith$Subscription$listen_on_driver_order$delivery_order_by_pk$delivery_driver(
    Subscription$listen_on_driver_order$delivery_order_by_pk$delivery_driver
        instance,
    TRes Function(
            Subscription$listen_on_driver_order$delivery_order_by_pk$delivery_driver)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_driver_order$delivery_order_by_pk$delivery_driver;

  factory CopyWith$Subscription$listen_on_driver_order$delivery_order_by_pk$delivery_driver.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_driver_order$delivery_order_by_pk$delivery_driver;

  TRes call({
    Geography? current_location,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$listen_on_driver_order$delivery_order_by_pk$delivery_driver<
        TRes>
    implements
        CopyWith$Subscription$listen_on_driver_order$delivery_order_by_pk$delivery_driver<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_driver_order$delivery_order_by_pk$delivery_driver(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_driver_order$delivery_order_by_pk$delivery_driver
      _instance;

  final TRes Function(
          Subscription$listen_on_driver_order$delivery_order_by_pk$delivery_driver)
      _then;

  static const _undefined = {};

  TRes call({
    Object? current_location = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_driver_order$delivery_order_by_pk$delivery_driver(
        current_location: current_location == _undefined
            ? _instance.current_location
            : (current_location as Geography?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Subscription$listen_on_driver_order$delivery_order_by_pk$delivery_driver<
        TRes>
    implements
        CopyWith$Subscription$listen_on_driver_order$delivery_order_by_pk$delivery_driver<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_driver_order$delivery_order_by_pk$delivery_driver(
      this._res);

  TRes _res;

  call({
    Geography? current_location,
    String? $__typename,
  }) =>
      _res;
}

class Subscription$listen_on_driver_order$delivery_order_by_pk$restaurant_order {
  Subscription$listen_on_driver_order$delivery_order_by_pk$restaurant_order({
    required this.id,
    required this.$__typename,
  });

  factory Subscription$listen_on_driver_order$delivery_order_by_pk$restaurant_order.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_driver_order$delivery_order_by_pk$restaurant_order(
      id: (l$id as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Subscription$listen_on_driver_order$delivery_order_by_pk$restaurant_order) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Subscription$listen_on_driver_order$delivery_order_by_pk$restaurant_order
    on Subscription$listen_on_driver_order$delivery_order_by_pk$restaurant_order {
  CopyWith$Subscription$listen_on_driver_order$delivery_order_by_pk$restaurant_order<
          Subscription$listen_on_driver_order$delivery_order_by_pk$restaurant_order>
      get copyWith =>
          CopyWith$Subscription$listen_on_driver_order$delivery_order_by_pk$restaurant_order(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_driver_order$delivery_order_by_pk$restaurant_order<
    TRes> {
  factory CopyWith$Subscription$listen_on_driver_order$delivery_order_by_pk$restaurant_order(
    Subscription$listen_on_driver_order$delivery_order_by_pk$restaurant_order
        instance,
    TRes Function(
            Subscription$listen_on_driver_order$delivery_order_by_pk$restaurant_order)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_driver_order$delivery_order_by_pk$restaurant_order;

  factory CopyWith$Subscription$listen_on_driver_order$delivery_order_by_pk$restaurant_order.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_driver_order$delivery_order_by_pk$restaurant_order;

  TRes call({
    int? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$listen_on_driver_order$delivery_order_by_pk$restaurant_order<
        TRes>
    implements
        CopyWith$Subscription$listen_on_driver_order$delivery_order_by_pk$restaurant_order<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_driver_order$delivery_order_by_pk$restaurant_order(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_driver_order$delivery_order_by_pk$restaurant_order
      _instance;

  final TRes Function(
          Subscription$listen_on_driver_order$delivery_order_by_pk$restaurant_order)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_driver_order$delivery_order_by_pk$restaurant_order(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Subscription$listen_on_driver_order$delivery_order_by_pk$restaurant_order<
        TRes>
    implements
        CopyWith$Subscription$listen_on_driver_order$delivery_order_by_pk$restaurant_order<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_driver_order$delivery_order_by_pk$restaurant_order(
      this._res);

  TRes _res;

  call({
    int? id,
    String? $__typename,
  }) =>
      _res;
}

class Subscription$listen_on_driver_order$delivery_order_by_pk$restaurant {
  Subscription$listen_on_driver_order$delivery_order_by_pk$restaurant({
    required this.id,
    this.firebase_id,
    required this.image,
    required this.name,
    required this.location_gps,
    required this.location_text,
    required this.language_id,
    required this.open_status,
    required this.$__typename,
  });

  factory Subscription$listen_on_driver_order$delivery_order_by_pk$restaurant.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$firebase_id = json['firebase_id'];
    final l$image = json['image'];
    final l$name = json['name'];
    final l$location_gps = json['location_gps'];
    final l$location_text = json['location_text'];
    final l$language_id = json['language_id'];
    final l$open_status = json['open_status'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_driver_order$delivery_order_by_pk$restaurant(
      id: (l$id as int),
      firebase_id: (l$firebase_id as String?),
      image: (l$image as String),
      name: (l$name as String),
      location_gps: geographyFromJson(l$location_gps),
      location_text: (l$location_text as String),
      language_id: (l$language_id as String),
      open_status: (l$open_status as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String? firebase_id;

  final String image;

  final String name;

  final Geography location_gps;

  final String location_text;

  final String language_id;

  final String open_status;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$firebase_id = firebase_id;
    _resultData['firebase_id'] = l$firebase_id;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$location_gps = location_gps;
    _resultData['location_gps'] = geographyToJson(l$location_gps);
    final l$location_text = location_text;
    _resultData['location_text'] = l$location_text;
    final l$language_id = language_id;
    _resultData['language_id'] = l$language_id;
    final l$open_status = open_status;
    _resultData['open_status'] = l$open_status;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$firebase_id = firebase_id;
    final l$image = image;
    final l$name = name;
    final l$location_gps = location_gps;
    final l$location_text = location_text;
    final l$language_id = language_id;
    final l$open_status = open_status;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$firebase_id,
      l$image,
      l$name,
      l$location_gps,
      l$location_text,
      l$language_id,
      l$open_status,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Subscription$listen_on_driver_order$delivery_order_by_pk$restaurant) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$firebase_id = firebase_id;
    final lOther$firebase_id = other.firebase_id;
    if (l$firebase_id != lOther$firebase_id) {
      return false;
    }
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$location_gps = location_gps;
    final lOther$location_gps = other.location_gps;
    if (l$location_gps != lOther$location_gps) {
      return false;
    }
    final l$location_text = location_text;
    final lOther$location_text = other.location_text;
    if (l$location_text != lOther$location_text) {
      return false;
    }
    final l$language_id = language_id;
    final lOther$language_id = other.language_id;
    if (l$language_id != lOther$language_id) {
      return false;
    }
    final l$open_status = open_status;
    final lOther$open_status = other.open_status;
    if (l$open_status != lOther$open_status) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Subscription$listen_on_driver_order$delivery_order_by_pk$restaurant
    on Subscription$listen_on_driver_order$delivery_order_by_pk$restaurant {
  CopyWith$Subscription$listen_on_driver_order$delivery_order_by_pk$restaurant<
          Subscription$listen_on_driver_order$delivery_order_by_pk$restaurant>
      get copyWith =>
          CopyWith$Subscription$listen_on_driver_order$delivery_order_by_pk$restaurant(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_driver_order$delivery_order_by_pk$restaurant<
    TRes> {
  factory CopyWith$Subscription$listen_on_driver_order$delivery_order_by_pk$restaurant(
    Subscription$listen_on_driver_order$delivery_order_by_pk$restaurant
        instance,
    TRes Function(
            Subscription$listen_on_driver_order$delivery_order_by_pk$restaurant)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_driver_order$delivery_order_by_pk$restaurant;

  factory CopyWith$Subscription$listen_on_driver_order$delivery_order_by_pk$restaurant.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_driver_order$delivery_order_by_pk$restaurant;

  TRes call({
    int? id,
    String? firebase_id,
    String? image,
    String? name,
    Geography? location_gps,
    String? location_text,
    String? language_id,
    String? open_status,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$listen_on_driver_order$delivery_order_by_pk$restaurant<
        TRes>
    implements
        CopyWith$Subscription$listen_on_driver_order$delivery_order_by_pk$restaurant<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_driver_order$delivery_order_by_pk$restaurant(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_driver_order$delivery_order_by_pk$restaurant
      _instance;

  final TRes Function(
          Subscription$listen_on_driver_order$delivery_order_by_pk$restaurant)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? firebase_id = _undefined,
    Object? image = _undefined,
    Object? name = _undefined,
    Object? location_gps = _undefined,
    Object? location_text = _undefined,
    Object? language_id = _undefined,
    Object? open_status = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$listen_on_driver_order$delivery_order_by_pk$restaurant(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        firebase_id: firebase_id == _undefined
            ? _instance.firebase_id
            : (firebase_id as String?),
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        location_gps: location_gps == _undefined || location_gps == null
            ? _instance.location_gps
            : (location_gps as Geography),
        location_text: location_text == _undefined || location_text == null
            ? _instance.location_text
            : (location_text as String),
        language_id: language_id == _undefined || language_id == null
            ? _instance.language_id
            : (language_id as String),
        open_status: open_status == _undefined || open_status == null
            ? _instance.open_status
            : (open_status as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Subscription$listen_on_driver_order$delivery_order_by_pk$restaurant<
        TRes>
    implements
        CopyWith$Subscription$listen_on_driver_order$delivery_order_by_pk$restaurant<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_driver_order$delivery_order_by_pk$restaurant(
      this._res);

  TRes _res;

  call({
    int? id,
    String? firebase_id,
    String? image,
    String? name,
    Geography? location_gps,
    String? location_text,
    String? language_id,
    String? open_status,
    String? $__typename,
  }) =>
      _res;
}

class Subscription$listen_on_driver_order$delivery_order_by_pk$customer {
  Subscription$listen_on_driver_order$delivery_order_by_pk$customer({
    required this.user,
    required this.$__typename,
  });

  factory Subscription$listen_on_driver_order$delivery_order_by_pk$customer.fromJson(
      Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_driver_order$delivery_order_by_pk$customer(
      user:
          Subscription$listen_on_driver_order$delivery_order_by_pk$customer$user
              .fromJson((l$user as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Subscription$listen_on_driver_order$delivery_order_by_pk$customer$user
      user;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$user = user;
    _resultData['user'] = l$user.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$user = user;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$user,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Subscription$listen_on_driver_order$delivery_order_by_pk$customer) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$user = user;
    final lOther$user = other.user;
    if (l$user != lOther$user) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Subscription$listen_on_driver_order$delivery_order_by_pk$customer
    on Subscription$listen_on_driver_order$delivery_order_by_pk$customer {
  CopyWith$Subscription$listen_on_driver_order$delivery_order_by_pk$customer<
          Subscription$listen_on_driver_order$delivery_order_by_pk$customer>
      get copyWith =>
          CopyWith$Subscription$listen_on_driver_order$delivery_order_by_pk$customer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_driver_order$delivery_order_by_pk$customer<
    TRes> {
  factory CopyWith$Subscription$listen_on_driver_order$delivery_order_by_pk$customer(
    Subscription$listen_on_driver_order$delivery_order_by_pk$customer instance,
    TRes Function(
            Subscription$listen_on_driver_order$delivery_order_by_pk$customer)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_driver_order$delivery_order_by_pk$customer;

  factory CopyWith$Subscription$listen_on_driver_order$delivery_order_by_pk$customer.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_driver_order$delivery_order_by_pk$customer;

  TRes call({
    Subscription$listen_on_driver_order$delivery_order_by_pk$customer$user?
        user,
    String? $__typename,
  });
  CopyWith$Subscription$listen_on_driver_order$delivery_order_by_pk$customer$user<
      TRes> get user;
}

class _CopyWithImpl$Subscription$listen_on_driver_order$delivery_order_by_pk$customer<
        TRes>
    implements
        CopyWith$Subscription$listen_on_driver_order$delivery_order_by_pk$customer<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_driver_order$delivery_order_by_pk$customer(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_driver_order$delivery_order_by_pk$customer
      _instance;

  final TRes Function(
      Subscription$listen_on_driver_order$delivery_order_by_pk$customer) _then;

  static const _undefined = {};

  TRes call({
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$listen_on_driver_order$delivery_order_by_pk$customer(
        user: user == _undefined || user == null
            ? _instance.user
            : (user
                as Subscription$listen_on_driver_order$delivery_order_by_pk$customer$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$listen_on_driver_order$delivery_order_by_pk$customer$user<
      TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Subscription$listen_on_driver_order$delivery_order_by_pk$customer$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Subscription$listen_on_driver_order$delivery_order_by_pk$customer<
        TRes>
    implements
        CopyWith$Subscription$listen_on_driver_order$delivery_order_by_pk$customer<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_driver_order$delivery_order_by_pk$customer(
      this._res);

  TRes _res;

  call({
    Subscription$listen_on_driver_order$delivery_order_by_pk$customer$user?
        user,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listen_on_driver_order$delivery_order_by_pk$customer$user<
          TRes>
      get user =>
          CopyWith$Subscription$listen_on_driver_order$delivery_order_by_pk$customer$user
              .stub(_res);
}

class Subscription$listen_on_driver_order$delivery_order_by_pk$customer$user {
  Subscription$listen_on_driver_order$delivery_order_by_pk$customer$user({
    required this.id,
    this.image,
    this.name,
    required this.language_id,
    required this.$__typename,
  });

  factory Subscription$listen_on_driver_order$delivery_order_by_pk$customer$user.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$image = json['image'];
    final l$name = json['name'];
    final l$language_id = json['language_id'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_driver_order$delivery_order_by_pk$customer$user(
      id: (l$id as int),
      image: (l$image as String?),
      name: (l$name as String?),
      language_id: (l$language_id as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String? image;

  final String? name;

  final String language_id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$language_id = language_id;
    _resultData['language_id'] = l$language_id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$image = image;
    final l$name = name;
    final l$language_id = language_id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$image,
      l$name,
      l$language_id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Subscription$listen_on_driver_order$delivery_order_by_pk$customer$user) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$language_id = language_id;
    final lOther$language_id = other.language_id;
    if (l$language_id != lOther$language_id) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Subscription$listen_on_driver_order$delivery_order_by_pk$customer$user
    on Subscription$listen_on_driver_order$delivery_order_by_pk$customer$user {
  CopyWith$Subscription$listen_on_driver_order$delivery_order_by_pk$customer$user<
          Subscription$listen_on_driver_order$delivery_order_by_pk$customer$user>
      get copyWith =>
          CopyWith$Subscription$listen_on_driver_order$delivery_order_by_pk$customer$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_driver_order$delivery_order_by_pk$customer$user<
    TRes> {
  factory CopyWith$Subscription$listen_on_driver_order$delivery_order_by_pk$customer$user(
    Subscription$listen_on_driver_order$delivery_order_by_pk$customer$user
        instance,
    TRes Function(
            Subscription$listen_on_driver_order$delivery_order_by_pk$customer$user)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_driver_order$delivery_order_by_pk$customer$user;

  factory CopyWith$Subscription$listen_on_driver_order$delivery_order_by_pk$customer$user.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_driver_order$delivery_order_by_pk$customer$user;

  TRes call({
    int? id,
    String? image,
    String? name,
    String? language_id,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$listen_on_driver_order$delivery_order_by_pk$customer$user<
        TRes>
    implements
        CopyWith$Subscription$listen_on_driver_order$delivery_order_by_pk$customer$user<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_driver_order$delivery_order_by_pk$customer$user(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_driver_order$delivery_order_by_pk$customer$user
      _instance;

  final TRes Function(
          Subscription$listen_on_driver_order$delivery_order_by_pk$customer$user)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? image = _undefined,
    Object? name = _undefined,
    Object? language_id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_driver_order$delivery_order_by_pk$customer$user(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        image: image == _undefined ? _instance.image : (image as String?),
        name: name == _undefined ? _instance.name : (name as String?),
        language_id: language_id == _undefined || language_id == null
            ? _instance.language_id
            : (language_id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Subscription$listen_on_driver_order$delivery_order_by_pk$customer$user<
        TRes>
    implements
        CopyWith$Subscription$listen_on_driver_order$delivery_order_by_pk$customer$user<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_driver_order$delivery_order_by_pk$customer$user(
      this._res);

  TRes _res;

  call({
    int? id,
    String? image,
    String? name,
    String? language_id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Subscription$listen_on_inprocess_driver_orders {
  factory Variables$Subscription$listen_on_inprocess_driver_orders(
          {required int driverId}) =>
      Variables$Subscription$listen_on_inprocess_driver_orders._({
        r'driverId': driverId,
      });

  Variables$Subscription$listen_on_inprocess_driver_orders._(this._$data);

  factory Variables$Subscription$listen_on_inprocess_driver_orders.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$driverId = data['driverId'];
    result$data['driverId'] = (l$driverId as int);
    return Variables$Subscription$listen_on_inprocess_driver_orders._(
        result$data);
  }

  Map<String, dynamic> _$data;

  int get driverId => (_$data['driverId'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$driverId = driverId;
    result$data['driverId'] = l$driverId;
    return result$data;
  }

  CopyWith$Variables$Subscription$listen_on_inprocess_driver_orders<
          Variables$Subscription$listen_on_inprocess_driver_orders>
      get copyWith =>
          CopyWith$Variables$Subscription$listen_on_inprocess_driver_orders(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Subscription$listen_on_inprocess_driver_orders) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$driverId = driverId;
    final lOther$driverId = other.driverId;
    if (l$driverId != lOther$driverId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$driverId = driverId;
    return Object.hashAll([l$driverId]);
  }
}

abstract class CopyWith$Variables$Subscription$listen_on_inprocess_driver_orders<
    TRes> {
  factory CopyWith$Variables$Subscription$listen_on_inprocess_driver_orders(
    Variables$Subscription$listen_on_inprocess_driver_orders instance,
    TRes Function(Variables$Subscription$listen_on_inprocess_driver_orders)
        then,
  ) = _CopyWithImpl$Variables$Subscription$listen_on_inprocess_driver_orders;

  factory CopyWith$Variables$Subscription$listen_on_inprocess_driver_orders.stub(
          TRes res) =
      _CopyWithStubImpl$Variables$Subscription$listen_on_inprocess_driver_orders;

  TRes call({int? driverId});
}

class _CopyWithImpl$Variables$Subscription$listen_on_inprocess_driver_orders<
        TRes>
    implements
        CopyWith$Variables$Subscription$listen_on_inprocess_driver_orders<
            TRes> {
  _CopyWithImpl$Variables$Subscription$listen_on_inprocess_driver_orders(
    this._instance,
    this._then,
  );

  final Variables$Subscription$listen_on_inprocess_driver_orders _instance;

  final TRes Function(Variables$Subscription$listen_on_inprocess_driver_orders)
      _then;

  static const _undefined = {};

  TRes call({Object? driverId = _undefined}) =>
      _then(Variables$Subscription$listen_on_inprocess_driver_orders._({
        ..._instance._$data,
        if (driverId != _undefined && driverId != null)
          'driverId': (driverId as int),
      }));
}

class _CopyWithStubImpl$Variables$Subscription$listen_on_inprocess_driver_orders<
        TRes>
    implements
        CopyWith$Variables$Subscription$listen_on_inprocess_driver_orders<
            TRes> {
  _CopyWithStubImpl$Variables$Subscription$listen_on_inprocess_driver_orders(
      this._res);

  TRes _res;

  call({int? driverId}) => _res;
}

class Subscription$listen_on_inprocess_driver_orders {
  Subscription$listen_on_inprocess_driver_orders({
    required this.delivery_order,
    required this.$__typename,
  });

  factory Subscription$listen_on_inprocess_driver_orders.fromJson(
      Map<String, dynamic> json) {
    final l$delivery_order = json['delivery_order'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_inprocess_driver_orders(
      delivery_order: (l$delivery_order as List<dynamic>)
          .map((e) =>
              Subscription$listen_on_inprocess_driver_orders$delivery_order
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Subscription$listen_on_inprocess_driver_orders$delivery_order>
      delivery_order;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$delivery_order = delivery_order;
    _resultData['delivery_order'] =
        l$delivery_order.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$delivery_order = delivery_order;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$delivery_order.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Subscription$listen_on_inprocess_driver_orders) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$delivery_order = delivery_order;
    final lOther$delivery_order = other.delivery_order;
    if (l$delivery_order.length != lOther$delivery_order.length) {
      return false;
    }
    for (int i = 0; i < l$delivery_order.length; i++) {
      final l$delivery_order$entry = l$delivery_order[i];
      final lOther$delivery_order$entry = lOther$delivery_order[i];
      if (l$delivery_order$entry != lOther$delivery_order$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Subscription$listen_on_inprocess_driver_orders
    on Subscription$listen_on_inprocess_driver_orders {
  CopyWith$Subscription$listen_on_inprocess_driver_orders<
          Subscription$listen_on_inprocess_driver_orders>
      get copyWith => CopyWith$Subscription$listen_on_inprocess_driver_orders(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_inprocess_driver_orders<TRes> {
  factory CopyWith$Subscription$listen_on_inprocess_driver_orders(
    Subscription$listen_on_inprocess_driver_orders instance,
    TRes Function(Subscription$listen_on_inprocess_driver_orders) then,
  ) = _CopyWithImpl$Subscription$listen_on_inprocess_driver_orders;

  factory CopyWith$Subscription$listen_on_inprocess_driver_orders.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_inprocess_driver_orders;

  TRes call({
    List<Subscription$listen_on_inprocess_driver_orders$delivery_order>?
        delivery_order,
    String? $__typename,
  });
  TRes delivery_order(
      Iterable<Subscription$listen_on_inprocess_driver_orders$delivery_order> Function(
              Iterable<
                  CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order<
                      Subscription$listen_on_inprocess_driver_orders$delivery_order>>)
          _fn);
}

class _CopyWithImpl$Subscription$listen_on_inprocess_driver_orders<TRes>
    implements CopyWith$Subscription$listen_on_inprocess_driver_orders<TRes> {
  _CopyWithImpl$Subscription$listen_on_inprocess_driver_orders(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_inprocess_driver_orders _instance;

  final TRes Function(Subscription$listen_on_inprocess_driver_orders) _then;

  static const _undefined = {};

  TRes call({
    Object? delivery_order = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$listen_on_inprocess_driver_orders(
        delivery_order: delivery_order == _undefined || delivery_order == null
            ? _instance.delivery_order
            : (delivery_order as List<
                Subscription$listen_on_inprocess_driver_orders$delivery_order>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes delivery_order(
          Iterable<Subscription$listen_on_inprocess_driver_orders$delivery_order> Function(
                  Iterable<
                      CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order<
                          Subscription$listen_on_inprocess_driver_orders$delivery_order>>)
              _fn) =>
      call(
          delivery_order: _fn(_instance.delivery_order.map((e) =>
              CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Subscription$listen_on_inprocess_driver_orders<TRes>
    implements CopyWith$Subscription$listen_on_inprocess_driver_orders<TRes> {
  _CopyWithStubImpl$Subscription$listen_on_inprocess_driver_orders(this._res);

  TRes _res;

  call({
    List<Subscription$listen_on_inprocess_driver_orders$delivery_order>?
        delivery_order,
    String? $__typename,
  }) =>
      _res;
  delivery_order(_fn) => _res;
}

const documentNodeSubscriptionlisten_on_inprocess_driver_orders =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.subscription,
    name: NameNode(value: 'listen_on_inprocess_driver_orders'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'driverId')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'delivery_order'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'delivery_driver_id'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'driverId')),
                  )
                ]),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'in_process'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: BooleanValueNode(value: true),
                  )
                ]),
              ),
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'order_time'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'status'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'package_cost'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'dropoff_address'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'dropoff_gps'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'customer'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'user'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'name'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'image'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: '__typename'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                ]),
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'restaurant'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'firebase_id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'image'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'name'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'location_gps'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'location_text'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'language_id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'open_status'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      
    ]),
  ),
]);
Subscription$listen_on_inprocess_driver_orders
    _parserFn$Subscription$listen_on_inprocess_driver_orders(
            Map<String, dynamic> data) =>
        Subscription$listen_on_inprocess_driver_orders.fromJson(data);

class Options$Subscription$listen_on_inprocess_driver_orders extends graphql
    .SubscriptionOptions<Subscription$listen_on_inprocess_driver_orders> {
  Options$Subscription$listen_on_inprocess_driver_orders({
    String? operationName,
    required Variables$Subscription$listen_on_inprocess_driver_orders variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          context: context,
          document: documentNodeSubscriptionlisten_on_inprocess_driver_orders,
          parserFn: _parserFn$Subscription$listen_on_inprocess_driver_orders,
        );
}

class WatchOptions$Subscription$listen_on_inprocess_driver_orders
    extends graphql
        .WatchQueryOptions<Subscription$listen_on_inprocess_driver_orders> {
  WatchOptions$Subscription$listen_on_inprocess_driver_orders({
    String? operationName,
    required Variables$Subscription$listen_on_inprocess_driver_orders variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          context: context,
          document: documentNodeSubscriptionlisten_on_inprocess_driver_orders,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Subscription$listen_on_inprocess_driver_orders,
        );
}

class FetchMoreOptions$Subscription$listen_on_inprocess_driver_orders
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Subscription$listen_on_inprocess_driver_orders({
    required graphql.UpdateQuery updateQuery,
    required Variables$Subscription$listen_on_inprocess_driver_orders variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeSubscriptionlisten_on_inprocess_driver_orders,
        );
}

extension ClientExtension$Subscription$listen_on_inprocess_driver_orders
    on graphql.GraphQLClient {
  Stream<graphql.QueryResult<Subscription$listen_on_inprocess_driver_orders>>
      subscribe$listen_on_inprocess_driver_orders(
              Options$Subscription$listen_on_inprocess_driver_orders options) =>
          this.subscribe(options);
  graphql.ObservableQuery<Subscription$listen_on_inprocess_driver_orders>
      watchSubscription$listen_on_inprocess_driver_orders(
              WatchOptions$Subscription$listen_on_inprocess_driver_orders
                  options) =>
          this.watchQuery(options);
}

class Subscription$listen_on_inprocess_driver_orders$delivery_order {
  Subscription$listen_on_inprocess_driver_orders$delivery_order({
    required this.id,
    required this.order_time,
    required this.status,
    required this.package_cost,
    required this.dropoff_address,
    required this.dropoff_gps,
    required this.customer,
    this.restaurant,
    required this.$__typename,
  });

  factory Subscription$listen_on_inprocess_driver_orders$delivery_order.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$order_time = json['order_time'];
    final l$status = json['status'];
    final l$package_cost = json['package_cost'];
    final l$dropoff_address = json['dropoff_address'];
    final l$dropoff_gps = json['dropoff_gps'];
    final l$customer = json['customer'];
    final l$restaurant = json['restaurant'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_inprocess_driver_orders$delivery_order(
      id: (l$id as int),
      order_time: (l$order_time as String),
      status: (l$status as String),
      package_cost: moneyFromJson(l$package_cost),
      dropoff_address: (l$dropoff_address as String),
      dropoff_gps: geographyFromJson(l$dropoff_gps),
      customer:
          Subscription$listen_on_inprocess_driver_orders$delivery_order$customer
              .fromJson((l$customer as Map<String, dynamic>)),
      restaurant: l$restaurant == null
          ? null
          : Subscription$listen_on_inprocess_driver_orders$delivery_order$restaurant
              .fromJson((l$restaurant as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String order_time;

  final String status;

  final double package_cost;

  final String dropoff_address;

  final Geography dropoff_gps;

  final Subscription$listen_on_inprocess_driver_orders$delivery_order$customer
      customer;

  final Subscription$listen_on_inprocess_driver_orders$delivery_order$restaurant?
      restaurant;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$order_time = order_time;
    _resultData['order_time'] = l$order_time;
    final l$status = status;
    _resultData['status'] = l$status;
    final l$package_cost = package_cost;
    _resultData['package_cost'] = moneyToJson(l$package_cost);
    final l$dropoff_address = dropoff_address;
    _resultData['dropoff_address'] = l$dropoff_address;
    final l$dropoff_gps = dropoff_gps;
    _resultData['dropoff_gps'] = geographyToJson(l$dropoff_gps);
    final l$customer = customer;
    _resultData['customer'] = l$customer.toJson();
    final l$restaurant = restaurant;
    _resultData['restaurant'] = l$restaurant?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$order_time = order_time;
    final l$status = status;
    final l$package_cost = package_cost;
    final l$dropoff_address = dropoff_address;
    final l$dropoff_gps = dropoff_gps;
    final l$customer = customer;
    final l$restaurant = restaurant;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$order_time,
      l$status,
      l$package_cost,
      l$dropoff_address,
      l$dropoff_gps,
      l$customer,
      l$restaurant,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Subscription$listen_on_inprocess_driver_orders$delivery_order) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$order_time = order_time;
    final lOther$order_time = other.order_time;
    if (l$order_time != lOther$order_time) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$package_cost = package_cost;
    final lOther$package_cost = other.package_cost;
    if (l$package_cost != lOther$package_cost) {
      return false;
    }
    final l$dropoff_address = dropoff_address;
    final lOther$dropoff_address = other.dropoff_address;
    if (l$dropoff_address != lOther$dropoff_address) {
      return false;
    }
    final l$dropoff_gps = dropoff_gps;
    final lOther$dropoff_gps = other.dropoff_gps;
    if (l$dropoff_gps != lOther$dropoff_gps) {
      return false;
    }
    final l$customer = customer;
    final lOther$customer = other.customer;
    if (l$customer != lOther$customer) {
      return false;
    }
    final l$restaurant = restaurant;
    final lOther$restaurant = other.restaurant;
    if (l$restaurant != lOther$restaurant) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Subscription$listen_on_inprocess_driver_orders$delivery_order
    on Subscription$listen_on_inprocess_driver_orders$delivery_order {
  CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order<
          Subscription$listen_on_inprocess_driver_orders$delivery_order>
      get copyWith =>
          CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order<
    TRes> {
  factory CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order(
    Subscription$listen_on_inprocess_driver_orders$delivery_order instance,
    TRes Function(Subscription$listen_on_inprocess_driver_orders$delivery_order)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_inprocess_driver_orders$delivery_order;

  factory CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_inprocess_driver_orders$delivery_order;

  TRes call({
    int? id,
    String? order_time,
    String? status,
    double? package_cost,
    String? dropoff_address,
    Geography? dropoff_gps,
    Subscription$listen_on_inprocess_driver_orders$delivery_order$customer?
        customer,
    Subscription$listen_on_inprocess_driver_orders$delivery_order$restaurant?
        restaurant,
    String? $__typename,
  });
  CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order$customer<
      TRes> get customer;
  CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order$restaurant<
      TRes> get restaurant;
}

class _CopyWithImpl$Subscription$listen_on_inprocess_driver_orders$delivery_order<
        TRes>
    implements
        CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_inprocess_driver_orders$delivery_order(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_inprocess_driver_orders$delivery_order _instance;

  final TRes Function(
      Subscription$listen_on_inprocess_driver_orders$delivery_order) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? order_time = _undefined,
    Object? status = _undefined,
    Object? package_cost = _undefined,
    Object? dropoff_address = _undefined,
    Object? dropoff_gps = _undefined,
    Object? customer = _undefined,
    Object? restaurant = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$listen_on_inprocess_driver_orders$delivery_order(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        order_time: order_time == _undefined || order_time == null
            ? _instance.order_time
            : (order_time as String),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as String),
        package_cost: package_cost == _undefined || package_cost == null
            ? _instance.package_cost
            : (package_cost as double),
        dropoff_address:
            dropoff_address == _undefined || dropoff_address == null
                ? _instance.dropoff_address
                : (dropoff_address as String),
        dropoff_gps: dropoff_gps == _undefined || dropoff_gps == null
            ? _instance.dropoff_gps
            : (dropoff_gps as Geography),
        customer: customer == _undefined || customer == null
            ? _instance.customer
            : (customer
                as Subscription$listen_on_inprocess_driver_orders$delivery_order$customer),
        restaurant: restaurant == _undefined
            ? _instance.restaurant
            : (restaurant
                as Subscription$listen_on_inprocess_driver_orders$delivery_order$restaurant?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order$customer<
      TRes> get customer {
    final local$customer = _instance.customer;
    return CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order$customer(
        local$customer, (e) => call(customer: e));
  }

  CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order$restaurant<
      TRes> get restaurant {
    final local$restaurant = _instance.restaurant;
    return local$restaurant == null
        ? CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order$restaurant
            .stub(_then(_instance))
        : CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order$restaurant(
            local$restaurant, (e) => call(restaurant: e));
  }
}

class _CopyWithStubImpl$Subscription$listen_on_inprocess_driver_orders$delivery_order<
        TRes>
    implements
        CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_inprocess_driver_orders$delivery_order(
      this._res);

  TRes _res;

  call({
    int? id,
    String? order_time,
    String? status,
    double? package_cost,
    String? dropoff_address,
    Geography? dropoff_gps,
    Subscription$listen_on_inprocess_driver_orders$delivery_order$customer?
        customer,
    Subscription$listen_on_inprocess_driver_orders$delivery_order$restaurant?
        restaurant,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order$customer<
          TRes>
      get customer =>
          CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order$customer
              .stub(_res);
  CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order$restaurant<
          TRes>
      get restaurant =>
          CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order$restaurant
              .stub(_res);
}

class Subscription$listen_on_inprocess_driver_orders$delivery_order$customer {
  Subscription$listen_on_inprocess_driver_orders$delivery_order$customer({
    required this.user,
    required this.$__typename,
  });

  factory Subscription$listen_on_inprocess_driver_orders$delivery_order$customer.fromJson(
      Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_inprocess_driver_orders$delivery_order$customer(
      user:
          Subscription$listen_on_inprocess_driver_orders$delivery_order$customer$user
              .fromJson((l$user as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Subscription$listen_on_inprocess_driver_orders$delivery_order$customer$user
      user;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$user = user;
    _resultData['user'] = l$user.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$user = user;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$user,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Subscription$listen_on_inprocess_driver_orders$delivery_order$customer) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$user = user;
    final lOther$user = other.user;
    if (l$user != lOther$user) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Subscription$listen_on_inprocess_driver_orders$delivery_order$customer
    on Subscription$listen_on_inprocess_driver_orders$delivery_order$customer {
  CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order$customer<
          Subscription$listen_on_inprocess_driver_orders$delivery_order$customer>
      get copyWith =>
          CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order$customer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order$customer<
    TRes> {
  factory CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order$customer(
    Subscription$listen_on_inprocess_driver_orders$delivery_order$customer
        instance,
    TRes Function(
            Subscription$listen_on_inprocess_driver_orders$delivery_order$customer)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_inprocess_driver_orders$delivery_order$customer;

  factory CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order$customer.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_inprocess_driver_orders$delivery_order$customer;

  TRes call({
    Subscription$listen_on_inprocess_driver_orders$delivery_order$customer$user?
        user,
    String? $__typename,
  });
  CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order$customer$user<
      TRes> get user;
}

class _CopyWithImpl$Subscription$listen_on_inprocess_driver_orders$delivery_order$customer<
        TRes>
    implements
        CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order$customer<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_inprocess_driver_orders$delivery_order$customer(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_inprocess_driver_orders$delivery_order$customer
      _instance;

  final TRes Function(
          Subscription$listen_on_inprocess_driver_orders$delivery_order$customer)
      _then;

  static const _undefined = {};

  TRes call({
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_inprocess_driver_orders$delivery_order$customer(
        user: user == _undefined || user == null
            ? _instance.user
            : (user
                as Subscription$listen_on_inprocess_driver_orders$delivery_order$customer$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order$customer$user<
      TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order$customer$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Subscription$listen_on_inprocess_driver_orders$delivery_order$customer<
        TRes>
    implements
        CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order$customer<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_inprocess_driver_orders$delivery_order$customer(
      this._res);

  TRes _res;

  call({
    Subscription$listen_on_inprocess_driver_orders$delivery_order$customer$user?
        user,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order$customer$user<
          TRes>
      get user =>
          CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order$customer$user
              .stub(_res);
}

class Subscription$listen_on_inprocess_driver_orders$delivery_order$customer$user {
  Subscription$listen_on_inprocess_driver_orders$delivery_order$customer$user({
    this.name,
    this.image,
    required this.$__typename,
  });

  factory Subscription$listen_on_inprocess_driver_orders$delivery_order$customer$user.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_inprocess_driver_orders$delivery_order$customer$user(
      name: (l$name as String?),
      image: (l$image as String?),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String? name;

  final String? image;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name = name;
    _resultData['name'] = l$name;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$image = image;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$name,
      l$image,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Subscription$listen_on_inprocess_driver_orders$delivery_order$customer$user) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Subscription$listen_on_inprocess_driver_orders$delivery_order$customer$user
    on Subscription$listen_on_inprocess_driver_orders$delivery_order$customer$user {
  CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order$customer$user<
          Subscription$listen_on_inprocess_driver_orders$delivery_order$customer$user>
      get copyWith =>
          CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order$customer$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order$customer$user<
    TRes> {
  factory CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order$customer$user(
    Subscription$listen_on_inprocess_driver_orders$delivery_order$customer$user
        instance,
    TRes Function(
            Subscription$listen_on_inprocess_driver_orders$delivery_order$customer$user)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_inprocess_driver_orders$delivery_order$customer$user;

  factory CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order$customer$user.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_inprocess_driver_orders$delivery_order$customer$user;

  TRes call({
    String? name,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$listen_on_inprocess_driver_orders$delivery_order$customer$user<
        TRes>
    implements
        CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order$customer$user<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_inprocess_driver_orders$delivery_order$customer$user(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_inprocess_driver_orders$delivery_order$customer$user
      _instance;

  final TRes Function(
          Subscription$listen_on_inprocess_driver_orders$delivery_order$customer$user)
      _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_inprocess_driver_orders$delivery_order$customer$user(
        name: name == _undefined ? _instance.name : (name as String?),
        image: image == _undefined ? _instance.image : (image as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Subscription$listen_on_inprocess_driver_orders$delivery_order$customer$user<
        TRes>
    implements
        CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order$customer$user<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_inprocess_driver_orders$delivery_order$customer$user(
      this._res);

  TRes _res;

  call({
    String? name,
    String? image,
    String? $__typename,
  }) =>
      _res;
}

class Subscription$listen_on_inprocess_driver_orders$delivery_order$restaurant {
  Subscription$listen_on_inprocess_driver_orders$delivery_order$restaurant({
    required this.id,
    this.firebase_id,
    required this.image,
    required this.name,
    required this.location_gps,
    required this.location_text,
    required this.language_id,
    required this.open_status,
    required this.$__typename,
  });

  factory Subscription$listen_on_inprocess_driver_orders$delivery_order$restaurant.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$firebase_id = json['firebase_id'];
    final l$image = json['image'];
    final l$name = json['name'];
    final l$location_gps = json['location_gps'];
    final l$location_text = json['location_text'];
    final l$language_id = json['language_id'];
    final l$open_status = json['open_status'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_inprocess_driver_orders$delivery_order$restaurant(
      id: (l$id as int),
      firebase_id: (l$firebase_id as String?),
      image: (l$image as String),
      name: (l$name as String),
      location_gps: geographyFromJson(l$location_gps),
      location_text: (l$location_text as String),
      language_id: (l$language_id as String),
      open_status: (l$open_status as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String? firebase_id;

  final String image;

  final String name;

  final Geography location_gps;

  final String location_text;

  final String language_id;

  final String open_status;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$firebase_id = firebase_id;
    _resultData['firebase_id'] = l$firebase_id;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$location_gps = location_gps;
    _resultData['location_gps'] = geographyToJson(l$location_gps);
    final l$location_text = location_text;
    _resultData['location_text'] = l$location_text;
    final l$language_id = language_id;
    _resultData['language_id'] = l$language_id;
    final l$open_status = open_status;
    _resultData['open_status'] = l$open_status;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$firebase_id = firebase_id;
    final l$image = image;
    final l$name = name;
    final l$location_gps = location_gps;
    final l$location_text = location_text;
    final l$language_id = language_id;
    final l$open_status = open_status;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$firebase_id,
      l$image,
      l$name,
      l$location_gps,
      l$location_text,
      l$language_id,
      l$open_status,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Subscription$listen_on_inprocess_driver_orders$delivery_order$restaurant) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$firebase_id = firebase_id;
    final lOther$firebase_id = other.firebase_id;
    if (l$firebase_id != lOther$firebase_id) {
      return false;
    }
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$location_gps = location_gps;
    final lOther$location_gps = other.location_gps;
    if (l$location_gps != lOther$location_gps) {
      return false;
    }
    final l$location_text = location_text;
    final lOther$location_text = other.location_text;
    if (l$location_text != lOther$location_text) {
      return false;
    }
    final l$language_id = language_id;
    final lOther$language_id = other.language_id;
    if (l$language_id != lOther$language_id) {
      return false;
    }
    final l$open_status = open_status;
    final lOther$open_status = other.open_status;
    if (l$open_status != lOther$open_status) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Subscription$listen_on_inprocess_driver_orders$delivery_order$restaurant
    on Subscription$listen_on_inprocess_driver_orders$delivery_order$restaurant {
  CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order$restaurant<
          Subscription$listen_on_inprocess_driver_orders$delivery_order$restaurant>
      get copyWith =>
          CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order$restaurant(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order$restaurant<
    TRes> {
  factory CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order$restaurant(
    Subscription$listen_on_inprocess_driver_orders$delivery_order$restaurant
        instance,
    TRes Function(
            Subscription$listen_on_inprocess_driver_orders$delivery_order$restaurant)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_inprocess_driver_orders$delivery_order$restaurant;

  factory CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order$restaurant.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_inprocess_driver_orders$delivery_order$restaurant;

  TRes call({
    int? id,
    String? firebase_id,
    String? image,
    String? name,
    Geography? location_gps,
    String? location_text,
    String? language_id,
    String? open_status,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$listen_on_inprocess_driver_orders$delivery_order$restaurant<
        TRes>
    implements
        CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order$restaurant<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_inprocess_driver_orders$delivery_order$restaurant(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_inprocess_driver_orders$delivery_order$restaurant
      _instance;

  final TRes Function(
          Subscription$listen_on_inprocess_driver_orders$delivery_order$restaurant)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? firebase_id = _undefined,
    Object? image = _undefined,
    Object? name = _undefined,
    Object? location_gps = _undefined,
    Object? location_text = _undefined,
    Object? language_id = _undefined,
    Object? open_status = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listen_on_inprocess_driver_orders$delivery_order$restaurant(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        firebase_id: firebase_id == _undefined
            ? _instance.firebase_id
            : (firebase_id as String?),
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        location_gps: location_gps == _undefined || location_gps == null
            ? _instance.location_gps
            : (location_gps as Geography),
        location_text: location_text == _undefined || location_text == null
            ? _instance.location_text
            : (location_text as String),
        language_id: language_id == _undefined || language_id == null
            ? _instance.language_id
            : (language_id as String),
        open_status: open_status == _undefined || open_status == null
            ? _instance.open_status
            : (open_status as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Subscription$listen_on_inprocess_driver_orders$delivery_order$restaurant<
        TRes>
    implements
        CopyWith$Subscription$listen_on_inprocess_driver_orders$delivery_order$restaurant<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_inprocess_driver_orders$delivery_order$restaurant(
      this._res);

  TRes _res;

  call({
    int? id,
    String? firebase_id,
    String? image,
    String? name,
    Geography? location_gps,
    String? location_text,
    String? language_id,
    String? open_status,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$get_past_driver_orders {
  factory Variables$Query$get_past_driver_orders({required int driverId}) =>
      Variables$Query$get_past_driver_orders._({
        r'driverId': driverId,
      });

  Variables$Query$get_past_driver_orders._(this._$data);

  factory Variables$Query$get_past_driver_orders.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$driverId = data['driverId'];
    result$data['driverId'] = (l$driverId as int);
    return Variables$Query$get_past_driver_orders._(result$data);
  }

  Map<String, dynamic> _$data;

  int get driverId => (_$data['driverId'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$driverId = driverId;
    result$data['driverId'] = l$driverId;
    return result$data;
  }

  CopyWith$Variables$Query$get_past_driver_orders<
          Variables$Query$get_past_driver_orders>
      get copyWith => CopyWith$Variables$Query$get_past_driver_orders(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$get_past_driver_orders) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$driverId = driverId;
    final lOther$driverId = other.driverId;
    if (l$driverId != lOther$driverId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$driverId = driverId;
    return Object.hashAll([l$driverId]);
  }
}

abstract class CopyWith$Variables$Query$get_past_driver_orders<TRes> {
  factory CopyWith$Variables$Query$get_past_driver_orders(
    Variables$Query$get_past_driver_orders instance,
    TRes Function(Variables$Query$get_past_driver_orders) then,
  ) = _CopyWithImpl$Variables$Query$get_past_driver_orders;

  factory CopyWith$Variables$Query$get_past_driver_orders.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$get_past_driver_orders;

  TRes call({int? driverId});
}

class _CopyWithImpl$Variables$Query$get_past_driver_orders<TRes>
    implements CopyWith$Variables$Query$get_past_driver_orders<TRes> {
  _CopyWithImpl$Variables$Query$get_past_driver_orders(
    this._instance,
    this._then,
  );

  final Variables$Query$get_past_driver_orders _instance;

  final TRes Function(Variables$Query$get_past_driver_orders) _then;

  static const _undefined = {};

  TRes call({Object? driverId = _undefined}) =>
      _then(Variables$Query$get_past_driver_orders._({
        ..._instance._$data,
        if (driverId != _undefined && driverId != null)
          'driverId': (driverId as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$get_past_driver_orders<TRes>
    implements CopyWith$Variables$Query$get_past_driver_orders<TRes> {
  _CopyWithStubImpl$Variables$Query$get_past_driver_orders(this._res);

  TRes _res;

  call({int? driverId}) => _res;
}

class Query$get_past_driver_orders {
  Query$get_past_driver_orders({
    required this.delivery_order,
    required this.$__typename,
  });

  factory Query$get_past_driver_orders.fromJson(Map<String, dynamic> json) {
    final l$delivery_order = json['delivery_order'];
    final l$$__typename = json['__typename'];
    return Query$get_past_driver_orders(
      delivery_order: (l$delivery_order as List<dynamic>)
          .map((e) => Query$get_past_driver_orders$delivery_order.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$get_past_driver_orders$delivery_order> delivery_order;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$delivery_order = delivery_order;
    _resultData['delivery_order'] =
        l$delivery_order.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$delivery_order = delivery_order;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$delivery_order.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_past_driver_orders) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$delivery_order = delivery_order;
    final lOther$delivery_order = other.delivery_order;
    if (l$delivery_order.length != lOther$delivery_order.length) {
      return false;
    }
    for (int i = 0; i < l$delivery_order.length; i++) {
      final l$delivery_order$entry = l$delivery_order[i];
      final lOther$delivery_order$entry = lOther$delivery_order[i];
      if (l$delivery_order$entry != lOther$delivery_order$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$get_past_driver_orders
    on Query$get_past_driver_orders {
  CopyWith$Query$get_past_driver_orders<Query$get_past_driver_orders>
      get copyWith => CopyWith$Query$get_past_driver_orders(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_past_driver_orders<TRes> {
  factory CopyWith$Query$get_past_driver_orders(
    Query$get_past_driver_orders instance,
    TRes Function(Query$get_past_driver_orders) then,
  ) = _CopyWithImpl$Query$get_past_driver_orders;

  factory CopyWith$Query$get_past_driver_orders.stub(TRes res) =
      _CopyWithStubImpl$Query$get_past_driver_orders;

  TRes call({
    List<Query$get_past_driver_orders$delivery_order>? delivery_order,
    String? $__typename,
  });
  TRes delivery_order(
      Iterable<Query$get_past_driver_orders$delivery_order> Function(
              Iterable<
                  CopyWith$Query$get_past_driver_orders$delivery_order<
                      Query$get_past_driver_orders$delivery_order>>)
          _fn);
}

class _CopyWithImpl$Query$get_past_driver_orders<TRes>
    implements CopyWith$Query$get_past_driver_orders<TRes> {
  _CopyWithImpl$Query$get_past_driver_orders(
    this._instance,
    this._then,
  );

  final Query$get_past_driver_orders _instance;

  final TRes Function(Query$get_past_driver_orders) _then;

  static const _undefined = {};

  TRes call({
    Object? delivery_order = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_past_driver_orders(
        delivery_order: delivery_order == _undefined || delivery_order == null
            ? _instance.delivery_order
            : (delivery_order
                as List<Query$get_past_driver_orders$delivery_order>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes delivery_order(
          Iterable<Query$get_past_driver_orders$delivery_order> Function(
                  Iterable<
                      CopyWith$Query$get_past_driver_orders$delivery_order<
                          Query$get_past_driver_orders$delivery_order>>)
              _fn) =>
      call(
          delivery_order: _fn(_instance.delivery_order
              .map((e) => CopyWith$Query$get_past_driver_orders$delivery_order(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$get_past_driver_orders<TRes>
    implements CopyWith$Query$get_past_driver_orders<TRes> {
  _CopyWithStubImpl$Query$get_past_driver_orders(this._res);

  TRes _res;

  call({
    List<Query$get_past_driver_orders$delivery_order>? delivery_order,
    String? $__typename,
  }) =>
      _res;
  delivery_order(_fn) => _res;
}

const documentNodeQueryget_past_driver_orders = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'get_past_driver_orders'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'driverId')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'delivery_order'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'delivery_driver_id'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'driverId')),
                  )
                ]),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'in_process'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: BooleanValueNode(value: false),
                  )
                ]),
              ),
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'order_time'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'status'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'package_cost'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'dropoff_address'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'dropoff_gps'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'customer'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'user'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'name'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'image'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: '__typename'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                ]),
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'restaurant'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'firebase_id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'image'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'name'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'location_gps'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'location_text'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'language_id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'open_status'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      
    ]),
  ),
]);
Query$get_past_driver_orders _parserFn$Query$get_past_driver_orders(
        Map<String, dynamic> data) =>
    Query$get_past_driver_orders.fromJson(data);

class Options$Query$get_past_driver_orders
    extends graphql.QueryOptions<Query$get_past_driver_orders> {
  Options$Query$get_past_driver_orders({
    String? operationName,
    required Variables$Query$get_past_driver_orders variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          pollInterval: pollInterval,
          context: context,
          document: documentNodeQueryget_past_driver_orders,
          parserFn: _parserFn$Query$get_past_driver_orders,
        );
}

class WatchOptions$Query$get_past_driver_orders
    extends graphql.WatchQueryOptions<Query$get_past_driver_orders> {
  WatchOptions$Query$get_past_driver_orders({
    String? operationName,
    required Variables$Query$get_past_driver_orders variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          context: context,
          document: documentNodeQueryget_past_driver_orders,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$get_past_driver_orders,
        );
}

class FetchMoreOptions$Query$get_past_driver_orders
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$get_past_driver_orders({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$get_past_driver_orders variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryget_past_driver_orders,
        );
}

extension ClientExtension$Query$get_past_driver_orders
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$get_past_driver_orders>>
      query$get_past_driver_orders(
              Options$Query$get_past_driver_orders options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$get_past_driver_orders>
      watchQuery$get_past_driver_orders(
              WatchOptions$Query$get_past_driver_orders options) =>
          this.watchQuery(options);
  void writeQuery$get_past_driver_orders({
    required Query$get_past_driver_orders data,
    required Variables$Query$get_past_driver_orders variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryget_past_driver_orders),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$get_past_driver_orders? readQuery$get_past_driver_orders({
    required Variables$Query$get_past_driver_orders variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQueryget_past_driver_orders),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$get_past_driver_orders.fromJson(result);
  }
}

class Query$get_past_driver_orders$delivery_order {
  Query$get_past_driver_orders$delivery_order({
    required this.id,
    required this.order_time,
    required this.status,
    required this.package_cost,
    required this.dropoff_address,
    required this.dropoff_gps,
    required this.customer,
    this.restaurant,
    required this.$__typename,
  });

  factory Query$get_past_driver_orders$delivery_order.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$order_time = json['order_time'];
    final l$status = json['status'];
    final l$package_cost = json['package_cost'];
    final l$dropoff_address = json['dropoff_address'];
    final l$dropoff_gps = json['dropoff_gps'];
    final l$customer = json['customer'];
    final l$restaurant = json['restaurant'];
    final l$$__typename = json['__typename'];
    return Query$get_past_driver_orders$delivery_order(
      id: (l$id as int),
      order_time: (l$order_time as String),
      status: (l$status as String),
      package_cost: moneyFromJson(l$package_cost),
      dropoff_address: (l$dropoff_address as String),
      dropoff_gps: geographyFromJson(l$dropoff_gps),
      customer: Query$get_past_driver_orders$delivery_order$customer.fromJson(
          (l$customer as Map<String, dynamic>)),
      restaurant: l$restaurant == null
          ? null
          : Query$get_past_driver_orders$delivery_order$restaurant.fromJson(
              (l$restaurant as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String order_time;

  final String status;

  final double package_cost;

  final String dropoff_address;

  final Geography dropoff_gps;

  final Query$get_past_driver_orders$delivery_order$customer customer;

  final Query$get_past_driver_orders$delivery_order$restaurant? restaurant;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$order_time = order_time;
    _resultData['order_time'] = l$order_time;
    final l$status = status;
    _resultData['status'] = l$status;
    final l$package_cost = package_cost;
    _resultData['package_cost'] = moneyToJson(l$package_cost);
    final l$dropoff_address = dropoff_address;
    _resultData['dropoff_address'] = l$dropoff_address;
    final l$dropoff_gps = dropoff_gps;
    _resultData['dropoff_gps'] = geographyToJson(l$dropoff_gps);
    final l$customer = customer;
    _resultData['customer'] = l$customer.toJson();
    final l$restaurant = restaurant;
    _resultData['restaurant'] = l$restaurant?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$order_time = order_time;
    final l$status = status;
    final l$package_cost = package_cost;
    final l$dropoff_address = dropoff_address;
    final l$dropoff_gps = dropoff_gps;
    final l$customer = customer;
    final l$restaurant = restaurant;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$order_time,
      l$status,
      l$package_cost,
      l$dropoff_address,
      l$dropoff_gps,
      l$customer,
      l$restaurant,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_past_driver_orders$delivery_order) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$order_time = order_time;
    final lOther$order_time = other.order_time;
    if (l$order_time != lOther$order_time) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$package_cost = package_cost;
    final lOther$package_cost = other.package_cost;
    if (l$package_cost != lOther$package_cost) {
      return false;
    }
    final l$dropoff_address = dropoff_address;
    final lOther$dropoff_address = other.dropoff_address;
    if (l$dropoff_address != lOther$dropoff_address) {
      return false;
    }
    final l$dropoff_gps = dropoff_gps;
    final lOther$dropoff_gps = other.dropoff_gps;
    if (l$dropoff_gps != lOther$dropoff_gps) {
      return false;
    }
    final l$customer = customer;
    final lOther$customer = other.customer;
    if (l$customer != lOther$customer) {
      return false;
    }
    final l$restaurant = restaurant;
    final lOther$restaurant = other.restaurant;
    if (l$restaurant != lOther$restaurant) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$get_past_driver_orders$delivery_order
    on Query$get_past_driver_orders$delivery_order {
  CopyWith$Query$get_past_driver_orders$delivery_order<
          Query$get_past_driver_orders$delivery_order>
      get copyWith => CopyWith$Query$get_past_driver_orders$delivery_order(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_past_driver_orders$delivery_order<TRes> {
  factory CopyWith$Query$get_past_driver_orders$delivery_order(
    Query$get_past_driver_orders$delivery_order instance,
    TRes Function(Query$get_past_driver_orders$delivery_order) then,
  ) = _CopyWithImpl$Query$get_past_driver_orders$delivery_order;

  factory CopyWith$Query$get_past_driver_orders$delivery_order.stub(TRes res) =
      _CopyWithStubImpl$Query$get_past_driver_orders$delivery_order;

  TRes call({
    int? id,
    String? order_time,
    String? status,
    double? package_cost,
    String? dropoff_address,
    Geography? dropoff_gps,
    Query$get_past_driver_orders$delivery_order$customer? customer,
    Query$get_past_driver_orders$delivery_order$restaurant? restaurant,
    String? $__typename,
  });
  CopyWith$Query$get_past_driver_orders$delivery_order$customer<TRes>
      get customer;
  CopyWith$Query$get_past_driver_orders$delivery_order$restaurant<TRes>
      get restaurant;
}

class _CopyWithImpl$Query$get_past_driver_orders$delivery_order<TRes>
    implements CopyWith$Query$get_past_driver_orders$delivery_order<TRes> {
  _CopyWithImpl$Query$get_past_driver_orders$delivery_order(
    this._instance,
    this._then,
  );

  final Query$get_past_driver_orders$delivery_order _instance;

  final TRes Function(Query$get_past_driver_orders$delivery_order) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? order_time = _undefined,
    Object? status = _undefined,
    Object? package_cost = _undefined,
    Object? dropoff_address = _undefined,
    Object? dropoff_gps = _undefined,
    Object? customer = _undefined,
    Object? restaurant = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_past_driver_orders$delivery_order(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        order_time: order_time == _undefined || order_time == null
            ? _instance.order_time
            : (order_time as String),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as String),
        package_cost: package_cost == _undefined || package_cost == null
            ? _instance.package_cost
            : (package_cost as double),
        dropoff_address:
            dropoff_address == _undefined || dropoff_address == null
                ? _instance.dropoff_address
                : (dropoff_address as String),
        dropoff_gps: dropoff_gps == _undefined || dropoff_gps == null
            ? _instance.dropoff_gps
            : (dropoff_gps as Geography),
        customer: customer == _undefined || customer == null
            ? _instance.customer
            : (customer
                as Query$get_past_driver_orders$delivery_order$customer),
        restaurant: restaurant == _undefined
            ? _instance.restaurant
            : (restaurant
                as Query$get_past_driver_orders$delivery_order$restaurant?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_past_driver_orders$delivery_order$customer<TRes>
      get customer {
    final local$customer = _instance.customer;
    return CopyWith$Query$get_past_driver_orders$delivery_order$customer(
        local$customer, (e) => call(customer: e));
  }

  CopyWith$Query$get_past_driver_orders$delivery_order$restaurant<TRes>
      get restaurant {
    final local$restaurant = _instance.restaurant;
    return local$restaurant == null
        ? CopyWith$Query$get_past_driver_orders$delivery_order$restaurant.stub(
            _then(_instance))
        : CopyWith$Query$get_past_driver_orders$delivery_order$restaurant(
            local$restaurant, (e) => call(restaurant: e));
  }
}

class _CopyWithStubImpl$Query$get_past_driver_orders$delivery_order<TRes>
    implements CopyWith$Query$get_past_driver_orders$delivery_order<TRes> {
  _CopyWithStubImpl$Query$get_past_driver_orders$delivery_order(this._res);

  TRes _res;

  call({
    int? id,
    String? order_time,
    String? status,
    double? package_cost,
    String? dropoff_address,
    Geography? dropoff_gps,
    Query$get_past_driver_orders$delivery_order$customer? customer,
    Query$get_past_driver_orders$delivery_order$restaurant? restaurant,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_past_driver_orders$delivery_order$customer<TRes>
      get customer =>
          CopyWith$Query$get_past_driver_orders$delivery_order$customer.stub(
              _res);
  CopyWith$Query$get_past_driver_orders$delivery_order$restaurant<TRes>
      get restaurant =>
          CopyWith$Query$get_past_driver_orders$delivery_order$restaurant.stub(
              _res);
}

class Query$get_past_driver_orders$delivery_order$customer {
  Query$get_past_driver_orders$delivery_order$customer({
    required this.user,
    required this.$__typename,
  });

  factory Query$get_past_driver_orders$delivery_order$customer.fromJson(
      Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Query$get_past_driver_orders$delivery_order$customer(
      user: Query$get_past_driver_orders$delivery_order$customer$user.fromJson(
          (l$user as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$get_past_driver_orders$delivery_order$customer$user user;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$user = user;
    _resultData['user'] = l$user.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$user = user;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$user,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_past_driver_orders$delivery_order$customer) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$user = user;
    final lOther$user = other.user;
    if (l$user != lOther$user) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$get_past_driver_orders$delivery_order$customer
    on Query$get_past_driver_orders$delivery_order$customer {
  CopyWith$Query$get_past_driver_orders$delivery_order$customer<
          Query$get_past_driver_orders$delivery_order$customer>
      get copyWith =>
          CopyWith$Query$get_past_driver_orders$delivery_order$customer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_past_driver_orders$delivery_order$customer<
    TRes> {
  factory CopyWith$Query$get_past_driver_orders$delivery_order$customer(
    Query$get_past_driver_orders$delivery_order$customer instance,
    TRes Function(Query$get_past_driver_orders$delivery_order$customer) then,
  ) = _CopyWithImpl$Query$get_past_driver_orders$delivery_order$customer;

  factory CopyWith$Query$get_past_driver_orders$delivery_order$customer.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_past_driver_orders$delivery_order$customer;

  TRes call({
    Query$get_past_driver_orders$delivery_order$customer$user? user,
    String? $__typename,
  });
  CopyWith$Query$get_past_driver_orders$delivery_order$customer$user<TRes>
      get user;
}

class _CopyWithImpl$Query$get_past_driver_orders$delivery_order$customer<TRes>
    implements
        CopyWith$Query$get_past_driver_orders$delivery_order$customer<TRes> {
  _CopyWithImpl$Query$get_past_driver_orders$delivery_order$customer(
    this._instance,
    this._then,
  );

  final Query$get_past_driver_orders$delivery_order$customer _instance;

  final TRes Function(Query$get_past_driver_orders$delivery_order$customer)
      _then;

  static const _undefined = {};

  TRes call({
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_past_driver_orders$delivery_order$customer(
        user: user == _undefined || user == null
            ? _instance.user
            : (user
                as Query$get_past_driver_orders$delivery_order$customer$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_past_driver_orders$delivery_order$customer$user<TRes>
      get user {
    final local$user = _instance.user;
    return CopyWith$Query$get_past_driver_orders$delivery_order$customer$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Query$get_past_driver_orders$delivery_order$customer<
        TRes>
    implements
        CopyWith$Query$get_past_driver_orders$delivery_order$customer<TRes> {
  _CopyWithStubImpl$Query$get_past_driver_orders$delivery_order$customer(
      this._res);

  TRes _res;

  call({
    Query$get_past_driver_orders$delivery_order$customer$user? user,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_past_driver_orders$delivery_order$customer$user<TRes>
      get user =>
          CopyWith$Query$get_past_driver_orders$delivery_order$customer$user
              .stub(_res);
}

class Query$get_past_driver_orders$delivery_order$customer$user {
  Query$get_past_driver_orders$delivery_order$customer$user({
    this.name,
    this.image,
    required this.$__typename,
  });

  factory Query$get_past_driver_orders$delivery_order$customer$user.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Query$get_past_driver_orders$delivery_order$customer$user(
      name: (l$name as String?),
      image: (l$image as String?),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String? name;

  final String? image;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name = name;
    _resultData['name'] = l$name;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$image = image;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$name,
      l$image,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_past_driver_orders$delivery_order$customer$user) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$get_past_driver_orders$delivery_order$customer$user
    on Query$get_past_driver_orders$delivery_order$customer$user {
  CopyWith$Query$get_past_driver_orders$delivery_order$customer$user<
          Query$get_past_driver_orders$delivery_order$customer$user>
      get copyWith =>
          CopyWith$Query$get_past_driver_orders$delivery_order$customer$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_past_driver_orders$delivery_order$customer$user<
    TRes> {
  factory CopyWith$Query$get_past_driver_orders$delivery_order$customer$user(
    Query$get_past_driver_orders$delivery_order$customer$user instance,
    TRes Function(Query$get_past_driver_orders$delivery_order$customer$user)
        then,
  ) = _CopyWithImpl$Query$get_past_driver_orders$delivery_order$customer$user;

  factory CopyWith$Query$get_past_driver_orders$delivery_order$customer$user.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_past_driver_orders$delivery_order$customer$user;

  TRes call({
    String? name,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_past_driver_orders$delivery_order$customer$user<
        TRes>
    implements
        CopyWith$Query$get_past_driver_orders$delivery_order$customer$user<
            TRes> {
  _CopyWithImpl$Query$get_past_driver_orders$delivery_order$customer$user(
    this._instance,
    this._then,
  );

  final Query$get_past_driver_orders$delivery_order$customer$user _instance;

  final TRes Function(Query$get_past_driver_orders$delivery_order$customer$user)
      _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_past_driver_orders$delivery_order$customer$user(
        name: name == _undefined ? _instance.name : (name as String?),
        image: image == _undefined ? _instance.image : (image as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$get_past_driver_orders$delivery_order$customer$user<
        TRes>
    implements
        CopyWith$Query$get_past_driver_orders$delivery_order$customer$user<
            TRes> {
  _CopyWithStubImpl$Query$get_past_driver_orders$delivery_order$customer$user(
      this._res);

  TRes _res;

  call({
    String? name,
    String? image,
    String? $__typename,
  }) =>
      _res;
}

class Query$get_past_driver_orders$delivery_order$restaurant {
  Query$get_past_driver_orders$delivery_order$restaurant({
    required this.id,
    this.firebase_id,
    required this.image,
    required this.name,
    required this.location_gps,
    required this.location_text,
    required this.language_id,
    required this.open_status,
    required this.$__typename,
  });

  factory Query$get_past_driver_orders$delivery_order$restaurant.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$firebase_id = json['firebase_id'];
    final l$image = json['image'];
    final l$name = json['name'];
    final l$location_gps = json['location_gps'];
    final l$location_text = json['location_text'];
    final l$language_id = json['language_id'];
    final l$open_status = json['open_status'];
    final l$$__typename = json['__typename'];
    return Query$get_past_driver_orders$delivery_order$restaurant(
      id: (l$id as int),
      firebase_id: (l$firebase_id as String?),
      image: (l$image as String),
      name: (l$name as String),
      location_gps: geographyFromJson(l$location_gps),
      location_text: (l$location_text as String),
      language_id: (l$language_id as String),
      open_status: (l$open_status as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String? firebase_id;

  final String image;

  final String name;

  final Geography location_gps;

  final String location_text;

  final String language_id;

  final String open_status;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$firebase_id = firebase_id;
    _resultData['firebase_id'] = l$firebase_id;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$location_gps = location_gps;
    _resultData['location_gps'] = geographyToJson(l$location_gps);
    final l$location_text = location_text;
    _resultData['location_text'] = l$location_text;
    final l$language_id = language_id;
    _resultData['language_id'] = l$language_id;
    final l$open_status = open_status;
    _resultData['open_status'] = l$open_status;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$firebase_id = firebase_id;
    final l$image = image;
    final l$name = name;
    final l$location_gps = location_gps;
    final l$location_text = location_text;
    final l$language_id = language_id;
    final l$open_status = open_status;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$firebase_id,
      l$image,
      l$name,
      l$location_gps,
      l$location_text,
      l$language_id,
      l$open_status,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_past_driver_orders$delivery_order$restaurant) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$firebase_id = firebase_id;
    final lOther$firebase_id = other.firebase_id;
    if (l$firebase_id != lOther$firebase_id) {
      return false;
    }
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$location_gps = location_gps;
    final lOther$location_gps = other.location_gps;
    if (l$location_gps != lOther$location_gps) {
      return false;
    }
    final l$location_text = location_text;
    final lOther$location_text = other.location_text;
    if (l$location_text != lOther$location_text) {
      return false;
    }
    final l$language_id = language_id;
    final lOther$language_id = other.language_id;
    if (l$language_id != lOther$language_id) {
      return false;
    }
    final l$open_status = open_status;
    final lOther$open_status = other.open_status;
    if (l$open_status != lOther$open_status) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$get_past_driver_orders$delivery_order$restaurant
    on Query$get_past_driver_orders$delivery_order$restaurant {
  CopyWith$Query$get_past_driver_orders$delivery_order$restaurant<
          Query$get_past_driver_orders$delivery_order$restaurant>
      get copyWith =>
          CopyWith$Query$get_past_driver_orders$delivery_order$restaurant(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_past_driver_orders$delivery_order$restaurant<
    TRes> {
  factory CopyWith$Query$get_past_driver_orders$delivery_order$restaurant(
    Query$get_past_driver_orders$delivery_order$restaurant instance,
    TRes Function(Query$get_past_driver_orders$delivery_order$restaurant) then,
  ) = _CopyWithImpl$Query$get_past_driver_orders$delivery_order$restaurant;

  factory CopyWith$Query$get_past_driver_orders$delivery_order$restaurant.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_past_driver_orders$delivery_order$restaurant;

  TRes call({
    int? id,
    String? firebase_id,
    String? image,
    String? name,
    Geography? location_gps,
    String? location_text,
    String? language_id,
    String? open_status,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_past_driver_orders$delivery_order$restaurant<TRes>
    implements
        CopyWith$Query$get_past_driver_orders$delivery_order$restaurant<TRes> {
  _CopyWithImpl$Query$get_past_driver_orders$delivery_order$restaurant(
    this._instance,
    this._then,
  );

  final Query$get_past_driver_orders$delivery_order$restaurant _instance;

  final TRes Function(Query$get_past_driver_orders$delivery_order$restaurant)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? firebase_id = _undefined,
    Object? image = _undefined,
    Object? name = _undefined,
    Object? location_gps = _undefined,
    Object? location_text = _undefined,
    Object? language_id = _undefined,
    Object? open_status = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_past_driver_orders$delivery_order$restaurant(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        firebase_id: firebase_id == _undefined
            ? _instance.firebase_id
            : (firebase_id as String?),
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        location_gps: location_gps == _undefined || location_gps == null
            ? _instance.location_gps
            : (location_gps as Geography),
        location_text: location_text == _undefined || location_text == null
            ? _instance.location_text
            : (location_text as String),
        language_id: language_id == _undefined || language_id == null
            ? _instance.language_id
            : (language_id as String),
        open_status: open_status == _undefined || open_status == null
            ? _instance.open_status
            : (open_status as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$get_past_driver_orders$delivery_order$restaurant<
        TRes>
    implements
        CopyWith$Query$get_past_driver_orders$delivery_order$restaurant<TRes> {
  _CopyWithStubImpl$Query$get_past_driver_orders$delivery_order$restaurant(
      this._res);

  TRes _res;

  call({
    int? id,
    String? firebase_id,
    String? image,
    String? name,
    Geography? location_gps,
    String? location_text,
    String? language_id,
    String? open_status,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$get_inprocess_driver_orders {
  factory Variables$Query$get_inprocess_driver_orders(
          {required int driverId}) =>
      Variables$Query$get_inprocess_driver_orders._({
        r'driverId': driverId,
      });

  Variables$Query$get_inprocess_driver_orders._(this._$data);

  factory Variables$Query$get_inprocess_driver_orders.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$driverId = data['driverId'];
    result$data['driverId'] = (l$driverId as int);
    return Variables$Query$get_inprocess_driver_orders._(result$data);
  }

  Map<String, dynamic> _$data;

  int get driverId => (_$data['driverId'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$driverId = driverId;
    result$data['driverId'] = l$driverId;
    return result$data;
  }

  CopyWith$Variables$Query$get_inprocess_driver_orders<
          Variables$Query$get_inprocess_driver_orders>
      get copyWith => CopyWith$Variables$Query$get_inprocess_driver_orders(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$get_inprocess_driver_orders) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$driverId = driverId;
    final lOther$driverId = other.driverId;
    if (l$driverId != lOther$driverId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$driverId = driverId;
    return Object.hashAll([l$driverId]);
  }
}

abstract class CopyWith$Variables$Query$get_inprocess_driver_orders<TRes> {
  factory CopyWith$Variables$Query$get_inprocess_driver_orders(
    Variables$Query$get_inprocess_driver_orders instance,
    TRes Function(Variables$Query$get_inprocess_driver_orders) then,
  ) = _CopyWithImpl$Variables$Query$get_inprocess_driver_orders;

  factory CopyWith$Variables$Query$get_inprocess_driver_orders.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$get_inprocess_driver_orders;

  TRes call({int? driverId});
}

class _CopyWithImpl$Variables$Query$get_inprocess_driver_orders<TRes>
    implements CopyWith$Variables$Query$get_inprocess_driver_orders<TRes> {
  _CopyWithImpl$Variables$Query$get_inprocess_driver_orders(
    this._instance,
    this._then,
  );

  final Variables$Query$get_inprocess_driver_orders _instance;

  final TRes Function(Variables$Query$get_inprocess_driver_orders) _then;

  static const _undefined = {};

  TRes call({Object? driverId = _undefined}) =>
      _then(Variables$Query$get_inprocess_driver_orders._({
        ..._instance._$data,
        if (driverId != _undefined && driverId != null)
          'driverId': (driverId as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$get_inprocess_driver_orders<TRes>
    implements CopyWith$Variables$Query$get_inprocess_driver_orders<TRes> {
  _CopyWithStubImpl$Variables$Query$get_inprocess_driver_orders(this._res);

  TRes _res;

  call({int? driverId}) => _res;
}

class Query$get_inprocess_driver_orders {
  Query$get_inprocess_driver_orders({
    required this.delivery_order,
    required this.$__typename,
  });

  factory Query$get_inprocess_driver_orders.fromJson(
      Map<String, dynamic> json) {
    final l$delivery_order = json['delivery_order'];
    final l$$__typename = json['__typename'];
    return Query$get_inprocess_driver_orders(
      delivery_order: (l$delivery_order as List<dynamic>)
          .map((e) => Query$get_inprocess_driver_orders$delivery_order.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$get_inprocess_driver_orders$delivery_order> delivery_order;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$delivery_order = delivery_order;
    _resultData['delivery_order'] =
        l$delivery_order.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$delivery_order = delivery_order;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$delivery_order.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_inprocess_driver_orders) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$delivery_order = delivery_order;
    final lOther$delivery_order = other.delivery_order;
    if (l$delivery_order.length != lOther$delivery_order.length) {
      return false;
    }
    for (int i = 0; i < l$delivery_order.length; i++) {
      final l$delivery_order$entry = l$delivery_order[i];
      final lOther$delivery_order$entry = lOther$delivery_order[i];
      if (l$delivery_order$entry != lOther$delivery_order$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$get_inprocess_driver_orders
    on Query$get_inprocess_driver_orders {
  CopyWith$Query$get_inprocess_driver_orders<Query$get_inprocess_driver_orders>
      get copyWith => CopyWith$Query$get_inprocess_driver_orders(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_inprocess_driver_orders<TRes> {
  factory CopyWith$Query$get_inprocess_driver_orders(
    Query$get_inprocess_driver_orders instance,
    TRes Function(Query$get_inprocess_driver_orders) then,
  ) = _CopyWithImpl$Query$get_inprocess_driver_orders;

  factory CopyWith$Query$get_inprocess_driver_orders.stub(TRes res) =
      _CopyWithStubImpl$Query$get_inprocess_driver_orders;

  TRes call({
    List<Query$get_inprocess_driver_orders$delivery_order>? delivery_order,
    String? $__typename,
  });
  TRes delivery_order(
      Iterable<Query$get_inprocess_driver_orders$delivery_order> Function(
              Iterable<
                  CopyWith$Query$get_inprocess_driver_orders$delivery_order<
                      Query$get_inprocess_driver_orders$delivery_order>>)
          _fn);
}

class _CopyWithImpl$Query$get_inprocess_driver_orders<TRes>
    implements CopyWith$Query$get_inprocess_driver_orders<TRes> {
  _CopyWithImpl$Query$get_inprocess_driver_orders(
    this._instance,
    this._then,
  );

  final Query$get_inprocess_driver_orders _instance;

  final TRes Function(Query$get_inprocess_driver_orders) _then;

  static const _undefined = {};

  TRes call({
    Object? delivery_order = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_inprocess_driver_orders(
        delivery_order: delivery_order == _undefined || delivery_order == null
            ? _instance.delivery_order
            : (delivery_order
                as List<Query$get_inprocess_driver_orders$delivery_order>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes delivery_order(
          Iterable<Query$get_inprocess_driver_orders$delivery_order> Function(
                  Iterable<
                      CopyWith$Query$get_inprocess_driver_orders$delivery_order<
                          Query$get_inprocess_driver_orders$delivery_order>>)
              _fn) =>
      call(
          delivery_order: _fn(_instance.delivery_order.map(
              (e) => CopyWith$Query$get_inprocess_driver_orders$delivery_order(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$get_inprocess_driver_orders<TRes>
    implements CopyWith$Query$get_inprocess_driver_orders<TRes> {
  _CopyWithStubImpl$Query$get_inprocess_driver_orders(this._res);

  TRes _res;

  call({
    List<Query$get_inprocess_driver_orders$delivery_order>? delivery_order,
    String? $__typename,
  }) =>
      _res;
  delivery_order(_fn) => _res;
}

const documentNodeQueryget_inprocess_driver_orders = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'get_inprocess_driver_orders'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'driverId')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'delivery_order'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'delivery_driver_id'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'driverId')),
                  )
                ]),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'in_process'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: BooleanValueNode(value: false),
                  )
                ]),
              ),
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'order_time'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'status'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'package_cost'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'dropoff_address'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'dropoff_gps'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'customer'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'user'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'name'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'image'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: '__typename'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                ]),
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'restaurant'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'firebase_id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'image'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'name'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'location_gps'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'location_text'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'language_id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'open_status'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      
    ]),
  ),
]);
Query$get_inprocess_driver_orders _parserFn$Query$get_inprocess_driver_orders(
        Map<String, dynamic> data) =>
    Query$get_inprocess_driver_orders.fromJson(data);

class Options$Query$get_inprocess_driver_orders
    extends graphql.QueryOptions<Query$get_inprocess_driver_orders> {
  Options$Query$get_inprocess_driver_orders({
    String? operationName,
    required Variables$Query$get_inprocess_driver_orders variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          pollInterval: pollInterval,
          context: context,
          document: documentNodeQueryget_inprocess_driver_orders,
          parserFn: _parserFn$Query$get_inprocess_driver_orders,
        );
}

class WatchOptions$Query$get_inprocess_driver_orders
    extends graphql.WatchQueryOptions<Query$get_inprocess_driver_orders> {
  WatchOptions$Query$get_inprocess_driver_orders({
    String? operationName,
    required Variables$Query$get_inprocess_driver_orders variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          context: context,
          document: documentNodeQueryget_inprocess_driver_orders,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$get_inprocess_driver_orders,
        );
}

class FetchMoreOptions$Query$get_inprocess_driver_orders
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$get_inprocess_driver_orders({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$get_inprocess_driver_orders variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryget_inprocess_driver_orders,
        );
}

extension ClientExtension$Query$get_inprocess_driver_orders
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$get_inprocess_driver_orders>>
      query$get_inprocess_driver_orders(
              Options$Query$get_inprocess_driver_orders options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$get_inprocess_driver_orders>
      watchQuery$get_inprocess_driver_orders(
              WatchOptions$Query$get_inprocess_driver_orders options) =>
          this.watchQuery(options);
  void writeQuery$get_inprocess_driver_orders({
    required Query$get_inprocess_driver_orders data,
    required Variables$Query$get_inprocess_driver_orders variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryget_inprocess_driver_orders),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$get_inprocess_driver_orders? readQuery$get_inprocess_driver_orders({
    required Variables$Query$get_inprocess_driver_orders variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQueryget_inprocess_driver_orders),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$get_inprocess_driver_orders.fromJson(result);
  }
}

class Query$get_inprocess_driver_orders$delivery_order {
  Query$get_inprocess_driver_orders$delivery_order({
    required this.id,
    required this.order_time,
    required this.status,
    required this.package_cost,
    required this.dropoff_address,
    required this.dropoff_gps,
    required this.customer,
    this.restaurant,
    required this.$__typename,
  });

  factory Query$get_inprocess_driver_orders$delivery_order.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$order_time = json['order_time'];
    final l$status = json['status'];
    final l$package_cost = json['package_cost'];
    final l$dropoff_address = json['dropoff_address'];
    final l$dropoff_gps = json['dropoff_gps'];
    final l$customer = json['customer'];
    final l$restaurant = json['restaurant'];
    final l$$__typename = json['__typename'];
    return Query$get_inprocess_driver_orders$delivery_order(
      id: (l$id as int),
      order_time: (l$order_time as String),
      status: (l$status as String),
      package_cost: moneyFromJson(l$package_cost),
      dropoff_address: (l$dropoff_address as String),
      dropoff_gps: geographyFromJson(l$dropoff_gps),
      customer:
          Query$get_inprocess_driver_orders$delivery_order$customer.fromJson(
              (l$customer as Map<String, dynamic>)),
      restaurant: l$restaurant == null
          ? null
          : Query$get_inprocess_driver_orders$delivery_order$restaurant
              .fromJson((l$restaurant as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String order_time;

  final String status;

  final double package_cost;

  final String dropoff_address;

  final Geography dropoff_gps;

  final Query$get_inprocess_driver_orders$delivery_order$customer customer;

  final Query$get_inprocess_driver_orders$delivery_order$restaurant? restaurant;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$order_time = order_time;
    _resultData['order_time'] = l$order_time;
    final l$status = status;
    _resultData['status'] = l$status;
    final l$package_cost = package_cost;
    _resultData['package_cost'] = moneyToJson(l$package_cost);
    final l$dropoff_address = dropoff_address;
    _resultData['dropoff_address'] = l$dropoff_address;
    final l$dropoff_gps = dropoff_gps;
    _resultData['dropoff_gps'] = geographyToJson(l$dropoff_gps);
    final l$customer = customer;
    _resultData['customer'] = l$customer.toJson();
    final l$restaurant = restaurant;
    _resultData['restaurant'] = l$restaurant?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$order_time = order_time;
    final l$status = status;
    final l$package_cost = package_cost;
    final l$dropoff_address = dropoff_address;
    final l$dropoff_gps = dropoff_gps;
    final l$customer = customer;
    final l$restaurant = restaurant;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$order_time,
      l$status,
      l$package_cost,
      l$dropoff_address,
      l$dropoff_gps,
      l$customer,
      l$restaurant,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_inprocess_driver_orders$delivery_order) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$order_time = order_time;
    final lOther$order_time = other.order_time;
    if (l$order_time != lOther$order_time) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$package_cost = package_cost;
    final lOther$package_cost = other.package_cost;
    if (l$package_cost != lOther$package_cost) {
      return false;
    }
    final l$dropoff_address = dropoff_address;
    final lOther$dropoff_address = other.dropoff_address;
    if (l$dropoff_address != lOther$dropoff_address) {
      return false;
    }
    final l$dropoff_gps = dropoff_gps;
    final lOther$dropoff_gps = other.dropoff_gps;
    if (l$dropoff_gps != lOther$dropoff_gps) {
      return false;
    }
    final l$customer = customer;
    final lOther$customer = other.customer;
    if (l$customer != lOther$customer) {
      return false;
    }
    final l$restaurant = restaurant;
    final lOther$restaurant = other.restaurant;
    if (l$restaurant != lOther$restaurant) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$get_inprocess_driver_orders$delivery_order
    on Query$get_inprocess_driver_orders$delivery_order {
  CopyWith$Query$get_inprocess_driver_orders$delivery_order<
          Query$get_inprocess_driver_orders$delivery_order>
      get copyWith => CopyWith$Query$get_inprocess_driver_orders$delivery_order(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_inprocess_driver_orders$delivery_order<TRes> {
  factory CopyWith$Query$get_inprocess_driver_orders$delivery_order(
    Query$get_inprocess_driver_orders$delivery_order instance,
    TRes Function(Query$get_inprocess_driver_orders$delivery_order) then,
  ) = _CopyWithImpl$Query$get_inprocess_driver_orders$delivery_order;

  factory CopyWith$Query$get_inprocess_driver_orders$delivery_order.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_inprocess_driver_orders$delivery_order;

  TRes call({
    int? id,
    String? order_time,
    String? status,
    double? package_cost,
    String? dropoff_address,
    Geography? dropoff_gps,
    Query$get_inprocess_driver_orders$delivery_order$customer? customer,
    Query$get_inprocess_driver_orders$delivery_order$restaurant? restaurant,
    String? $__typename,
  });
  CopyWith$Query$get_inprocess_driver_orders$delivery_order$customer<TRes>
      get customer;
  CopyWith$Query$get_inprocess_driver_orders$delivery_order$restaurant<TRes>
      get restaurant;
}

class _CopyWithImpl$Query$get_inprocess_driver_orders$delivery_order<TRes>
    implements CopyWith$Query$get_inprocess_driver_orders$delivery_order<TRes> {
  _CopyWithImpl$Query$get_inprocess_driver_orders$delivery_order(
    this._instance,
    this._then,
  );

  final Query$get_inprocess_driver_orders$delivery_order _instance;

  final TRes Function(Query$get_inprocess_driver_orders$delivery_order) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? order_time = _undefined,
    Object? status = _undefined,
    Object? package_cost = _undefined,
    Object? dropoff_address = _undefined,
    Object? dropoff_gps = _undefined,
    Object? customer = _undefined,
    Object? restaurant = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_inprocess_driver_orders$delivery_order(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        order_time: order_time == _undefined || order_time == null
            ? _instance.order_time
            : (order_time as String),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as String),
        package_cost: package_cost == _undefined || package_cost == null
            ? _instance.package_cost
            : (package_cost as double),
        dropoff_address:
            dropoff_address == _undefined || dropoff_address == null
                ? _instance.dropoff_address
                : (dropoff_address as String),
        dropoff_gps: dropoff_gps == _undefined || dropoff_gps == null
            ? _instance.dropoff_gps
            : (dropoff_gps as Geography),
        customer: customer == _undefined || customer == null
            ? _instance.customer
            : (customer
                as Query$get_inprocess_driver_orders$delivery_order$customer),
        restaurant: restaurant == _undefined
            ? _instance.restaurant
            : (restaurant
                as Query$get_inprocess_driver_orders$delivery_order$restaurant?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_inprocess_driver_orders$delivery_order$customer<TRes>
      get customer {
    final local$customer = _instance.customer;
    return CopyWith$Query$get_inprocess_driver_orders$delivery_order$customer(
        local$customer, (e) => call(customer: e));
  }

  CopyWith$Query$get_inprocess_driver_orders$delivery_order$restaurant<TRes>
      get restaurant {
    final local$restaurant = _instance.restaurant;
    return local$restaurant == null
        ? CopyWith$Query$get_inprocess_driver_orders$delivery_order$restaurant
            .stub(_then(_instance))
        : CopyWith$Query$get_inprocess_driver_orders$delivery_order$restaurant(
            local$restaurant, (e) => call(restaurant: e));
  }
}

class _CopyWithStubImpl$Query$get_inprocess_driver_orders$delivery_order<TRes>
    implements CopyWith$Query$get_inprocess_driver_orders$delivery_order<TRes> {
  _CopyWithStubImpl$Query$get_inprocess_driver_orders$delivery_order(this._res);

  TRes _res;

  call({
    int? id,
    String? order_time,
    String? status,
    double? package_cost,
    String? dropoff_address,
    Geography? dropoff_gps,
    Query$get_inprocess_driver_orders$delivery_order$customer? customer,
    Query$get_inprocess_driver_orders$delivery_order$restaurant? restaurant,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_inprocess_driver_orders$delivery_order$customer<TRes>
      get customer =>
          CopyWith$Query$get_inprocess_driver_orders$delivery_order$customer
              .stub(_res);
  CopyWith$Query$get_inprocess_driver_orders$delivery_order$restaurant<TRes>
      get restaurant =>
          CopyWith$Query$get_inprocess_driver_orders$delivery_order$restaurant
              .stub(_res);
}

class Query$get_inprocess_driver_orders$delivery_order$customer {
  Query$get_inprocess_driver_orders$delivery_order$customer({
    required this.user,
    required this.$__typename,
  });

  factory Query$get_inprocess_driver_orders$delivery_order$customer.fromJson(
      Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Query$get_inprocess_driver_orders$delivery_order$customer(
      user: Query$get_inprocess_driver_orders$delivery_order$customer$user
          .fromJson((l$user as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$get_inprocess_driver_orders$delivery_order$customer$user user;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$user = user;
    _resultData['user'] = l$user.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$user = user;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$user,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_inprocess_driver_orders$delivery_order$customer) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$user = user;
    final lOther$user = other.user;
    if (l$user != lOther$user) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$get_inprocess_driver_orders$delivery_order$customer
    on Query$get_inprocess_driver_orders$delivery_order$customer {
  CopyWith$Query$get_inprocess_driver_orders$delivery_order$customer<
          Query$get_inprocess_driver_orders$delivery_order$customer>
      get copyWith =>
          CopyWith$Query$get_inprocess_driver_orders$delivery_order$customer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_inprocess_driver_orders$delivery_order$customer<
    TRes> {
  factory CopyWith$Query$get_inprocess_driver_orders$delivery_order$customer(
    Query$get_inprocess_driver_orders$delivery_order$customer instance,
    TRes Function(Query$get_inprocess_driver_orders$delivery_order$customer)
        then,
  ) = _CopyWithImpl$Query$get_inprocess_driver_orders$delivery_order$customer;

  factory CopyWith$Query$get_inprocess_driver_orders$delivery_order$customer.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_inprocess_driver_orders$delivery_order$customer;

  TRes call({
    Query$get_inprocess_driver_orders$delivery_order$customer$user? user,
    String? $__typename,
  });
  CopyWith$Query$get_inprocess_driver_orders$delivery_order$customer$user<TRes>
      get user;
}

class _CopyWithImpl$Query$get_inprocess_driver_orders$delivery_order$customer<
        TRes>
    implements
        CopyWith$Query$get_inprocess_driver_orders$delivery_order$customer<
            TRes> {
  _CopyWithImpl$Query$get_inprocess_driver_orders$delivery_order$customer(
    this._instance,
    this._then,
  );

  final Query$get_inprocess_driver_orders$delivery_order$customer _instance;

  final TRes Function(Query$get_inprocess_driver_orders$delivery_order$customer)
      _then;

  static const _undefined = {};

  TRes call({
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_inprocess_driver_orders$delivery_order$customer(
        user: user == _undefined || user == null
            ? _instance.user
            : (user
                as Query$get_inprocess_driver_orders$delivery_order$customer$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_inprocess_driver_orders$delivery_order$customer$user<TRes>
      get user {
    final local$user = _instance.user;
    return CopyWith$Query$get_inprocess_driver_orders$delivery_order$customer$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Query$get_inprocess_driver_orders$delivery_order$customer<
        TRes>
    implements
        CopyWith$Query$get_inprocess_driver_orders$delivery_order$customer<
            TRes> {
  _CopyWithStubImpl$Query$get_inprocess_driver_orders$delivery_order$customer(
      this._res);

  TRes _res;

  call({
    Query$get_inprocess_driver_orders$delivery_order$customer$user? user,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_inprocess_driver_orders$delivery_order$customer$user<TRes>
      get user =>
          CopyWith$Query$get_inprocess_driver_orders$delivery_order$customer$user
              .stub(_res);
}

class Query$get_inprocess_driver_orders$delivery_order$customer$user {
  Query$get_inprocess_driver_orders$delivery_order$customer$user({
    this.name,
    this.image,
    required this.$__typename,
  });

  factory Query$get_inprocess_driver_orders$delivery_order$customer$user.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Query$get_inprocess_driver_orders$delivery_order$customer$user(
      name: (l$name as String?),
      image: (l$image as String?),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String? name;

  final String? image;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name = name;
    _resultData['name'] = l$name;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$image = image;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$name,
      l$image,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$get_inprocess_driver_orders$delivery_order$customer$user) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$get_inprocess_driver_orders$delivery_order$customer$user
    on Query$get_inprocess_driver_orders$delivery_order$customer$user {
  CopyWith$Query$get_inprocess_driver_orders$delivery_order$customer$user<
          Query$get_inprocess_driver_orders$delivery_order$customer$user>
      get copyWith =>
          CopyWith$Query$get_inprocess_driver_orders$delivery_order$customer$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_inprocess_driver_orders$delivery_order$customer$user<
    TRes> {
  factory CopyWith$Query$get_inprocess_driver_orders$delivery_order$customer$user(
    Query$get_inprocess_driver_orders$delivery_order$customer$user instance,
    TRes Function(
            Query$get_inprocess_driver_orders$delivery_order$customer$user)
        then,
  ) = _CopyWithImpl$Query$get_inprocess_driver_orders$delivery_order$customer$user;

  factory CopyWith$Query$get_inprocess_driver_orders$delivery_order$customer$user.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_inprocess_driver_orders$delivery_order$customer$user;

  TRes call({
    String? name,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_inprocess_driver_orders$delivery_order$customer$user<
        TRes>
    implements
        CopyWith$Query$get_inprocess_driver_orders$delivery_order$customer$user<
            TRes> {
  _CopyWithImpl$Query$get_inprocess_driver_orders$delivery_order$customer$user(
    this._instance,
    this._then,
  );

  final Query$get_inprocess_driver_orders$delivery_order$customer$user
      _instance;

  final TRes Function(
      Query$get_inprocess_driver_orders$delivery_order$customer$user) _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_inprocess_driver_orders$delivery_order$customer$user(
        name: name == _undefined ? _instance.name : (name as String?),
        image: image == _undefined ? _instance.image : (image as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$get_inprocess_driver_orders$delivery_order$customer$user<
        TRes>
    implements
        CopyWith$Query$get_inprocess_driver_orders$delivery_order$customer$user<
            TRes> {
  _CopyWithStubImpl$Query$get_inprocess_driver_orders$delivery_order$customer$user(
      this._res);

  TRes _res;

  call({
    String? name,
    String? image,
    String? $__typename,
  }) =>
      _res;
}

class Query$get_inprocess_driver_orders$delivery_order$restaurant {
  Query$get_inprocess_driver_orders$delivery_order$restaurant({
    required this.id,
    this.firebase_id,
    required this.image,
    required this.name,
    required this.location_gps,
    required this.location_text,
    required this.language_id,
    required this.open_status,
    required this.$__typename,
  });

  factory Query$get_inprocess_driver_orders$delivery_order$restaurant.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$firebase_id = json['firebase_id'];
    final l$image = json['image'];
    final l$name = json['name'];
    final l$location_gps = json['location_gps'];
    final l$location_text = json['location_text'];
    final l$language_id = json['language_id'];
    final l$open_status = json['open_status'];
    final l$$__typename = json['__typename'];
    return Query$get_inprocess_driver_orders$delivery_order$restaurant(
      id: (l$id as int),
      firebase_id: (l$firebase_id as String?),
      image: (l$image as String),
      name: (l$name as String),
      location_gps: geographyFromJson(l$location_gps),
      location_text: (l$location_text as String),
      language_id: (l$language_id as String),
      open_status: (l$open_status as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String? firebase_id;

  final String image;

  final String name;

  final Geography location_gps;

  final String location_text;

  final String language_id;

  final String open_status;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$firebase_id = firebase_id;
    _resultData['firebase_id'] = l$firebase_id;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$location_gps = location_gps;
    _resultData['location_gps'] = geographyToJson(l$location_gps);
    final l$location_text = location_text;
    _resultData['location_text'] = l$location_text;
    final l$language_id = language_id;
    _resultData['language_id'] = l$language_id;
    final l$open_status = open_status;
    _resultData['open_status'] = l$open_status;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$firebase_id = firebase_id;
    final l$image = image;
    final l$name = name;
    final l$location_gps = location_gps;
    final l$location_text = location_text;
    final l$language_id = language_id;
    final l$open_status = open_status;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$firebase_id,
      l$image,
      l$name,
      l$location_gps,
      l$location_text,
      l$language_id,
      l$open_status,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$get_inprocess_driver_orders$delivery_order$restaurant) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$firebase_id = firebase_id;
    final lOther$firebase_id = other.firebase_id;
    if (l$firebase_id != lOther$firebase_id) {
      return false;
    }
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$location_gps = location_gps;
    final lOther$location_gps = other.location_gps;
    if (l$location_gps != lOther$location_gps) {
      return false;
    }
    final l$location_text = location_text;
    final lOther$location_text = other.location_text;
    if (l$location_text != lOther$location_text) {
      return false;
    }
    final l$language_id = language_id;
    final lOther$language_id = other.language_id;
    if (l$language_id != lOther$language_id) {
      return false;
    }
    final l$open_status = open_status;
    final lOther$open_status = other.open_status;
    if (l$open_status != lOther$open_status) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$get_inprocess_driver_orders$delivery_order$restaurant
    on Query$get_inprocess_driver_orders$delivery_order$restaurant {
  CopyWith$Query$get_inprocess_driver_orders$delivery_order$restaurant<
          Query$get_inprocess_driver_orders$delivery_order$restaurant>
      get copyWith =>
          CopyWith$Query$get_inprocess_driver_orders$delivery_order$restaurant(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_inprocess_driver_orders$delivery_order$restaurant<
    TRes> {
  factory CopyWith$Query$get_inprocess_driver_orders$delivery_order$restaurant(
    Query$get_inprocess_driver_orders$delivery_order$restaurant instance,
    TRes Function(Query$get_inprocess_driver_orders$delivery_order$restaurant)
        then,
  ) = _CopyWithImpl$Query$get_inprocess_driver_orders$delivery_order$restaurant;

  factory CopyWith$Query$get_inprocess_driver_orders$delivery_order$restaurant.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_inprocess_driver_orders$delivery_order$restaurant;

  TRes call({
    int? id,
    String? firebase_id,
    String? image,
    String? name,
    Geography? location_gps,
    String? location_text,
    String? language_id,
    String? open_status,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_inprocess_driver_orders$delivery_order$restaurant<
        TRes>
    implements
        CopyWith$Query$get_inprocess_driver_orders$delivery_order$restaurant<
            TRes> {
  _CopyWithImpl$Query$get_inprocess_driver_orders$delivery_order$restaurant(
    this._instance,
    this._then,
  );

  final Query$get_inprocess_driver_orders$delivery_order$restaurant _instance;

  final TRes Function(
      Query$get_inprocess_driver_orders$delivery_order$restaurant) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? firebase_id = _undefined,
    Object? image = _undefined,
    Object? name = _undefined,
    Object? location_gps = _undefined,
    Object? location_text = _undefined,
    Object? language_id = _undefined,
    Object? open_status = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_inprocess_driver_orders$delivery_order$restaurant(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        firebase_id: firebase_id == _undefined
            ? _instance.firebase_id
            : (firebase_id as String?),
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        location_gps: location_gps == _undefined || location_gps == null
            ? _instance.location_gps
            : (location_gps as Geography),
        location_text: location_text == _undefined || location_text == null
            ? _instance.location_text
            : (location_text as String),
        language_id: language_id == _undefined || language_id == null
            ? _instance.language_id
            : (language_id as String),
        open_status: open_status == _undefined || open_status == null
            ? _instance.open_status
            : (open_status as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$get_inprocess_driver_orders$delivery_order$restaurant<
        TRes>
    implements
        CopyWith$Query$get_inprocess_driver_orders$delivery_order$restaurant<
            TRes> {
  _CopyWithStubImpl$Query$get_inprocess_driver_orders$delivery_order$restaurant(
      this._res);

  TRes _res;

  call({
    int? id,
    String? firebase_id,
    String? image,
    String? name,
    Geography? location_gps,
    String? location_text,
    String? language_id,
    String? open_status,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$updateDeliveryOrder {
  factory Variables$Mutation$updateDeliveryOrder({
    required int orderId,
    required Input$delivery_order_set_input data,
  }) =>
      Variables$Mutation$updateDeliveryOrder._({
        r'orderId': orderId,
        r'data': data,
      });

  Variables$Mutation$updateDeliveryOrder._(this._$data);

  factory Variables$Mutation$updateDeliveryOrder.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$orderId = data['orderId'];
    result$data['orderId'] = (l$orderId as int);
    final l$data = data['data'];
    result$data['data'] = Input$delivery_order_set_input.fromJson(
        (l$data as Map<String, dynamic>));
    return Variables$Mutation$updateDeliveryOrder._(result$data);
  }

  Map<String, dynamic> _$data;

  int get orderId => (_$data['orderId'] as int);
  Input$delivery_order_set_input get data =>
      (_$data['data'] as Input$delivery_order_set_input);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$orderId = orderId;
    result$data['orderId'] = l$orderId;
    final l$data = data;
    result$data['data'] = l$data.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$updateDeliveryOrder<
          Variables$Mutation$updateDeliveryOrder>
      get copyWith => CopyWith$Variables$Mutation$updateDeliveryOrder(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$updateDeliveryOrder) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$orderId = orderId;
    final lOther$orderId = other.orderId;
    if (l$orderId != lOther$orderId) {
      return false;
    }
    final l$data = data;
    final lOther$data = other.data;
    if (l$data != lOther$data) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$orderId = orderId;
    final l$data = data;
    return Object.hashAll([
      l$orderId,
      l$data,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$updateDeliveryOrder<TRes> {
  factory CopyWith$Variables$Mutation$updateDeliveryOrder(
    Variables$Mutation$updateDeliveryOrder instance,
    TRes Function(Variables$Mutation$updateDeliveryOrder) then,
  ) = _CopyWithImpl$Variables$Mutation$updateDeliveryOrder;

  factory CopyWith$Variables$Mutation$updateDeliveryOrder.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$updateDeliveryOrder;

  TRes call({
    int? orderId,
    Input$delivery_order_set_input? data,
  });
}

class _CopyWithImpl$Variables$Mutation$updateDeliveryOrder<TRes>
    implements CopyWith$Variables$Mutation$updateDeliveryOrder<TRes> {
  _CopyWithImpl$Variables$Mutation$updateDeliveryOrder(
    this._instance,
    this._then,
  );

  final Variables$Mutation$updateDeliveryOrder _instance;

  final TRes Function(Variables$Mutation$updateDeliveryOrder) _then;

  static const _undefined = {};

  TRes call({
    Object? orderId = _undefined,
    Object? data = _undefined,
  }) =>
      _then(Variables$Mutation$updateDeliveryOrder._({
        ..._instance._$data,
        if (orderId != _undefined && orderId != null)
          'orderId': (orderId as int),
        if (data != _undefined && data != null)
          'data': (data as Input$delivery_order_set_input),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$updateDeliveryOrder<TRes>
    implements CopyWith$Variables$Mutation$updateDeliveryOrder<TRes> {
  _CopyWithStubImpl$Variables$Mutation$updateDeliveryOrder(this._res);

  TRes _res;

  call({
    int? orderId,
    Input$delivery_order_set_input? data,
  }) =>
      _res;
}

class Mutation$updateDeliveryOrder {
  Mutation$updateDeliveryOrder({
    this.update_delivery_order_by_pk,
    required this.$__typename,
  });

  factory Mutation$updateDeliveryOrder.fromJson(Map<String, dynamic> json) {
    final l$update_delivery_order_by_pk = json['update_delivery_order_by_pk'];
    final l$$__typename = json['__typename'];
    return Mutation$updateDeliveryOrder(
      update_delivery_order_by_pk: l$update_delivery_order_by_pk == null
          ? null
          : Mutation$updateDeliveryOrder$update_delivery_order_by_pk.fromJson(
              (l$update_delivery_order_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$updateDeliveryOrder$update_delivery_order_by_pk?
      update_delivery_order_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$update_delivery_order_by_pk = update_delivery_order_by_pk;
    _resultData['update_delivery_order_by_pk'] =
        l$update_delivery_order_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$update_delivery_order_by_pk = update_delivery_order_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$update_delivery_order_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$updateDeliveryOrder) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$update_delivery_order_by_pk = update_delivery_order_by_pk;
    final lOther$update_delivery_order_by_pk =
        other.update_delivery_order_by_pk;
    if (l$update_delivery_order_by_pk != lOther$update_delivery_order_by_pk) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$updateDeliveryOrder
    on Mutation$updateDeliveryOrder {
  CopyWith$Mutation$updateDeliveryOrder<Mutation$updateDeliveryOrder>
      get copyWith => CopyWith$Mutation$updateDeliveryOrder(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateDeliveryOrder<TRes> {
  factory CopyWith$Mutation$updateDeliveryOrder(
    Mutation$updateDeliveryOrder instance,
    TRes Function(Mutation$updateDeliveryOrder) then,
  ) = _CopyWithImpl$Mutation$updateDeliveryOrder;

  factory CopyWith$Mutation$updateDeliveryOrder.stub(TRes res) =
      _CopyWithStubImpl$Mutation$updateDeliveryOrder;

  TRes call({
    Mutation$updateDeliveryOrder$update_delivery_order_by_pk?
        update_delivery_order_by_pk,
    String? $__typename,
  });
  CopyWith$Mutation$updateDeliveryOrder$update_delivery_order_by_pk<TRes>
      get update_delivery_order_by_pk;
}

class _CopyWithImpl$Mutation$updateDeliveryOrder<TRes>
    implements CopyWith$Mutation$updateDeliveryOrder<TRes> {
  _CopyWithImpl$Mutation$updateDeliveryOrder(
    this._instance,
    this._then,
  );

  final Mutation$updateDeliveryOrder _instance;

  final TRes Function(Mutation$updateDeliveryOrder) _then;

  static const _undefined = {};

  TRes call({
    Object? update_delivery_order_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$updateDeliveryOrder(
        update_delivery_order_by_pk: update_delivery_order_by_pk == _undefined
            ? _instance.update_delivery_order_by_pk
            : (update_delivery_order_by_pk
                as Mutation$updateDeliveryOrder$update_delivery_order_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$updateDeliveryOrder$update_delivery_order_by_pk<TRes>
      get update_delivery_order_by_pk {
    final local$update_delivery_order_by_pk =
        _instance.update_delivery_order_by_pk;
    return local$update_delivery_order_by_pk == null
        ? CopyWith$Mutation$updateDeliveryOrder$update_delivery_order_by_pk
            .stub(_then(_instance))
        : CopyWith$Mutation$updateDeliveryOrder$update_delivery_order_by_pk(
            local$update_delivery_order_by_pk,
            (e) => call(update_delivery_order_by_pk: e));
  }
}

class _CopyWithStubImpl$Mutation$updateDeliveryOrder<TRes>
    implements CopyWith$Mutation$updateDeliveryOrder<TRes> {
  _CopyWithStubImpl$Mutation$updateDeliveryOrder(this._res);

  TRes _res;

  call({
    Mutation$updateDeliveryOrder$update_delivery_order_by_pk?
        update_delivery_order_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$updateDeliveryOrder$update_delivery_order_by_pk<TRes>
      get update_delivery_order_by_pk =>
          CopyWith$Mutation$updateDeliveryOrder$update_delivery_order_by_pk
              .stub(_res);
}

const documentNodeMutationupdateDeliveryOrder = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'updateDeliveryOrder'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'orderId')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'data')),
        type: NamedTypeNode(
          name: NameNode(value: 'delivery_order_set_input'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'update_delivery_order_by_pk'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'pk_columns'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'orderId')),
              )
            ]),
          ),
          ArgumentNode(
            name: NameNode(value: '_set'),
            value: VariableNode(name: NameNode(value: 'data')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'estimated_arrival_at_dropoff_time'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'estimated_arrival_at_pickup_time'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      
    ]),
  ),
]);
Mutation$updateDeliveryOrder _parserFn$Mutation$updateDeliveryOrder(
        Map<String, dynamic> data) =>
    Mutation$updateDeliveryOrder.fromJson(data);
typedef OnMutationCompleted$Mutation$updateDeliveryOrder = FutureOr<void>
    Function(
  dynamic,
  Mutation$updateDeliveryOrder?,
);

class Options$Mutation$updateDeliveryOrder
    extends graphql.MutationOptions<Mutation$updateDeliveryOrder> {
  Options$Mutation$updateDeliveryOrder({
    String? operationName,
    required Variables$Mutation$updateDeliveryOrder variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$updateDeliveryOrder? onCompleted,
    graphql.OnMutationUpdate<Mutation$updateDeliveryOrder>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$updateDeliveryOrder(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationupdateDeliveryOrder,
          parserFn: _parserFn$Mutation$updateDeliveryOrder,
        );

  final OnMutationCompleted$Mutation$updateDeliveryOrder? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$updateDeliveryOrder
    extends graphql.WatchQueryOptions<Mutation$updateDeliveryOrder> {
  WatchOptions$Mutation$updateDeliveryOrder({
    String? operationName,
    required Variables$Mutation$updateDeliveryOrder variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          context: context,
          document: documentNodeMutationupdateDeliveryOrder,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$updateDeliveryOrder,
        );
}

extension ClientExtension$Mutation$updateDeliveryOrder
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$updateDeliveryOrder>>
      mutate$updateDeliveryOrder(
              Options$Mutation$updateDeliveryOrder options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$updateDeliveryOrder>
      watchMutation$updateDeliveryOrder(
              WatchOptions$Mutation$updateDeliveryOrder options) =>
          this.watchMutation(options);
}

class Mutation$updateDeliveryOrder$update_delivery_order_by_pk {
  Mutation$updateDeliveryOrder$update_delivery_order_by_pk({
    this.estimated_arrival_at_dropoff_time,
    this.estimated_arrival_at_pickup_time,
    required this.$__typename,
  });

  factory Mutation$updateDeliveryOrder$update_delivery_order_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$estimated_arrival_at_dropoff_time =
        json['estimated_arrival_at_dropoff_time'];
    final l$estimated_arrival_at_pickup_time =
        json['estimated_arrival_at_pickup_time'];
    final l$$__typename = json['__typename'];
    return Mutation$updateDeliveryOrder$update_delivery_order_by_pk(
      estimated_arrival_at_dropoff_time:
          (l$estimated_arrival_at_dropoff_time as String?),
      estimated_arrival_at_pickup_time:
          (l$estimated_arrival_at_pickup_time as String?),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String? estimated_arrival_at_dropoff_time;

  final String? estimated_arrival_at_pickup_time;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$estimated_arrival_at_dropoff_time =
        estimated_arrival_at_dropoff_time;
    _resultData['estimated_arrival_at_dropoff_time'] =
        l$estimated_arrival_at_dropoff_time;
    final l$estimated_arrival_at_pickup_time = estimated_arrival_at_pickup_time;
    _resultData['estimated_arrival_at_pickup_time'] =
        l$estimated_arrival_at_pickup_time;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$estimated_arrival_at_dropoff_time =
        estimated_arrival_at_dropoff_time;
    final l$estimated_arrival_at_pickup_time = estimated_arrival_at_pickup_time;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$estimated_arrival_at_dropoff_time,
      l$estimated_arrival_at_pickup_time,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$updateDeliveryOrder$update_delivery_order_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$estimated_arrival_at_dropoff_time =
        estimated_arrival_at_dropoff_time;
    final lOther$estimated_arrival_at_dropoff_time =
        other.estimated_arrival_at_dropoff_time;
    if (l$estimated_arrival_at_dropoff_time !=
        lOther$estimated_arrival_at_dropoff_time) {
      return false;
    }
    final l$estimated_arrival_at_pickup_time = estimated_arrival_at_pickup_time;
    final lOther$estimated_arrival_at_pickup_time =
        other.estimated_arrival_at_pickup_time;
    if (l$estimated_arrival_at_pickup_time !=
        lOther$estimated_arrival_at_pickup_time) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$updateDeliveryOrder$update_delivery_order_by_pk
    on Mutation$updateDeliveryOrder$update_delivery_order_by_pk {
  CopyWith$Mutation$updateDeliveryOrder$update_delivery_order_by_pk<
          Mutation$updateDeliveryOrder$update_delivery_order_by_pk>
      get copyWith =>
          CopyWith$Mutation$updateDeliveryOrder$update_delivery_order_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateDeliveryOrder$update_delivery_order_by_pk<
    TRes> {
  factory CopyWith$Mutation$updateDeliveryOrder$update_delivery_order_by_pk(
    Mutation$updateDeliveryOrder$update_delivery_order_by_pk instance,
    TRes Function(Mutation$updateDeliveryOrder$update_delivery_order_by_pk)
        then,
  ) = _CopyWithImpl$Mutation$updateDeliveryOrder$update_delivery_order_by_pk;

  factory CopyWith$Mutation$updateDeliveryOrder$update_delivery_order_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$updateDeliveryOrder$update_delivery_order_by_pk;

  TRes call({
    String? estimated_arrival_at_dropoff_time,
    String? estimated_arrival_at_pickup_time,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$updateDeliveryOrder$update_delivery_order_by_pk<
        TRes>
    implements
        CopyWith$Mutation$updateDeliveryOrder$update_delivery_order_by_pk<
            TRes> {
  _CopyWithImpl$Mutation$updateDeliveryOrder$update_delivery_order_by_pk(
    this._instance,
    this._then,
  );

  final Mutation$updateDeliveryOrder$update_delivery_order_by_pk _instance;

  final TRes Function(Mutation$updateDeliveryOrder$update_delivery_order_by_pk)
      _then;

  static const _undefined = {};

  TRes call({
    Object? estimated_arrival_at_dropoff_time = _undefined,
    Object? estimated_arrival_at_pickup_time = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$updateDeliveryOrder$update_delivery_order_by_pk(
        estimated_arrival_at_dropoff_time:
            estimated_arrival_at_dropoff_time == _undefined
                ? _instance.estimated_arrival_at_dropoff_time
                : (estimated_arrival_at_dropoff_time as String?),
        estimated_arrival_at_pickup_time:
            estimated_arrival_at_pickup_time == _undefined
                ? _instance.estimated_arrival_at_pickup_time
                : (estimated_arrival_at_pickup_time as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$updateDeliveryOrder$update_delivery_order_by_pk<
        TRes>
    implements
        CopyWith$Mutation$updateDeliveryOrder$update_delivery_order_by_pk<
            TRes> {
  _CopyWithStubImpl$Mutation$updateDeliveryOrder$update_delivery_order_by_pk(
      this._res);

  TRes _res;

  call({
    String? estimated_arrival_at_dropoff_time,
    String? estimated_arrival_at_pickup_time,
    String? $__typename,
  }) =>
      _res;
}