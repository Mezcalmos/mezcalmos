import '../../__generated/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';

class Variables$Query$getFavouriteItems {
  factory Variables$Query$getFavouriteItems({int? $_eq}) =>
      Variables$Query$getFavouriteItems._({
        if ($_eq != null) r'_eq': $_eq,
      });

  Variables$Query$getFavouriteItems._(this._$data);

  factory Variables$Query$getFavouriteItems.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('_eq')) {
      final l$$_eq = data['_eq'];
      result$data['_eq'] = (l$$_eq as int?);
    }
    return Variables$Query$getFavouriteItems._(result$data);
  }

  Map<String, dynamic> _$data;

  int? get $_eq => (_$data['_eq'] as int?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('_eq')) {
      final l$$_eq = $_eq;
      result$data['_eq'] = l$$_eq;
    }
    return result$data;
  }

  CopyWith$Variables$Query$getFavouriteItems<Variables$Query$getFavouriteItems>
      get copyWith => CopyWith$Variables$Query$getFavouriteItems(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getFavouriteItems) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$_eq = $_eq;
    final lOther$$_eq = other.$_eq;
    if (_$data.containsKey('_eq') != other._$data.containsKey('_eq')) {
      return false;
    }
    if (l$$_eq != lOther$$_eq) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$$_eq = $_eq;
    return Object.hashAll([_$data.containsKey('_eq') ? l$$_eq : const {}]);
  }
}

abstract class CopyWith$Variables$Query$getFavouriteItems<TRes> {
  factory CopyWith$Variables$Query$getFavouriteItems(
    Variables$Query$getFavouriteItems instance,
    TRes Function(Variables$Query$getFavouriteItems) then,
  ) = _CopyWithImpl$Variables$Query$getFavouriteItems;

  factory CopyWith$Variables$Query$getFavouriteItems.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getFavouriteItems;

  TRes call({int? $_eq});
}

class _CopyWithImpl$Variables$Query$getFavouriteItems<TRes>
    implements CopyWith$Variables$Query$getFavouriteItems<TRes> {
  _CopyWithImpl$Variables$Query$getFavouriteItems(
    this._instance,
    this._then,
  );

  final Variables$Query$getFavouriteItems _instance;

  final TRes Function(Variables$Query$getFavouriteItems) _then;

  static const _undefined = {};

  TRes call({Object? $_eq = _undefined}) =>
      _then(Variables$Query$getFavouriteItems._({
        ..._instance._$data,
        if ($_eq != _undefined) '_eq': ($_eq as int?),
      }));
}

class _CopyWithStubImpl$Variables$Query$getFavouriteItems<TRes>
    implements CopyWith$Variables$Query$getFavouriteItems<TRes> {
  _CopyWithStubImpl$Variables$Query$getFavouriteItems(this._res);

  TRes _res;

  call({int? $_eq}) => _res;
}

class Query$getFavouriteItems {
  Query$getFavouriteItems({
    required this.customer_favourited_item,
    required this.$__typename,
  });

  factory Query$getFavouriteItems.fromJson(Map<String, dynamic> json) {
    final l$customer_favourited_item = json['customer_favourited_item'];
    final l$$__typename = json['__typename'];
    return Query$getFavouriteItems(
      customer_favourited_item: (l$customer_favourited_item as List<dynamic>)
          .map((e) => Query$getFavouriteItems$customer_favourited_item.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$getFavouriteItems$customer_favourited_item>
      customer_favourited_item;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$customer_favourited_item = customer_favourited_item;
    _resultData['customer_favourited_item'] =
        l$customer_favourited_item.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$customer_favourited_item = customer_favourited_item;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$customer_favourited_item.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getFavouriteItems) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$customer_favourited_item = customer_favourited_item;
    final lOther$customer_favourited_item = other.customer_favourited_item;
    if (l$customer_favourited_item.length !=
        lOther$customer_favourited_item.length) {
      return false;
    }
    for (int i = 0; i < l$customer_favourited_item.length; i++) {
      final l$customer_favourited_item$entry = l$customer_favourited_item[i];
      final lOther$customer_favourited_item$entry =
          lOther$customer_favourited_item[i];
      if (l$customer_favourited_item$entry !=
          lOther$customer_favourited_item$entry) {
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

extension UtilityExtension$Query$getFavouriteItems on Query$getFavouriteItems {
  CopyWith$Query$getFavouriteItems<Query$getFavouriteItems> get copyWith =>
      CopyWith$Query$getFavouriteItems(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$getFavouriteItems<TRes> {
  factory CopyWith$Query$getFavouriteItems(
    Query$getFavouriteItems instance,
    TRes Function(Query$getFavouriteItems) then,
  ) = _CopyWithImpl$Query$getFavouriteItems;

  factory CopyWith$Query$getFavouriteItems.stub(TRes res) =
      _CopyWithStubImpl$Query$getFavouriteItems;

  TRes call({
    List<Query$getFavouriteItems$customer_favourited_item>?
        customer_favourited_item,
    String? $__typename,
  });
  TRes customer_favourited_item(
      Iterable<Query$getFavouriteItems$customer_favourited_item> Function(
              Iterable<
                  CopyWith$Query$getFavouriteItems$customer_favourited_item<
                      Query$getFavouriteItems$customer_favourited_item>>)
          _fn);
}

class _CopyWithImpl$Query$getFavouriteItems<TRes>
    implements CopyWith$Query$getFavouriteItems<TRes> {
  _CopyWithImpl$Query$getFavouriteItems(
    this._instance,
    this._then,
  );

  final Query$getFavouriteItems _instance;

  final TRes Function(Query$getFavouriteItems) _then;

  static const _undefined = {};

  TRes call({
    Object? customer_favourited_item = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getFavouriteItems(
        customer_favourited_item: customer_favourited_item == _undefined ||
                customer_favourited_item == null
            ? _instance.customer_favourited_item
            : (customer_favourited_item
                as List<Query$getFavouriteItems$customer_favourited_item>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes customer_favourited_item(
          Iterable<Query$getFavouriteItems$customer_favourited_item> Function(
                  Iterable<
                      CopyWith$Query$getFavouriteItems$customer_favourited_item<
                          Query$getFavouriteItems$customer_favourited_item>>)
              _fn) =>
      call(
          customer_favourited_item: _fn(_instance.customer_favourited_item.map(
              (e) => CopyWith$Query$getFavouriteItems$customer_favourited_item(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$getFavouriteItems<TRes>
    implements CopyWith$Query$getFavouriteItems<TRes> {
  _CopyWithStubImpl$Query$getFavouriteItems(this._res);

  TRes _res;

  call({
    List<Query$getFavouriteItems$customer_favourited_item>?
        customer_favourited_item,
    String? $__typename,
  }) =>
      _res;
  customer_favourited_item(_fn) => _res;
}

const documentNodeQuerygetFavouriteItems = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getFavouriteItems'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: '_eq')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'customer_favourited_item'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'customer_id'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: '_eq')),
                  )
                ]),
              )
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'restaurant_item_id'),
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
Query$getFavouriteItems _parserFn$Query$getFavouriteItems(
        Map<String, dynamic> data) =>
    Query$getFavouriteItems.fromJson(data);

class Options$Query$getFavouriteItems
    extends graphql.QueryOptions<Query$getFavouriteItems> {
  Options$Query$getFavouriteItems({
    String? operationName,
    Variables$Query$getFavouriteItems? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
  }) : super(
          variables: variables?.toJson() ?? {},
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          pollInterval: pollInterval,
          context: context,
          document: documentNodeQuerygetFavouriteItems,
          parserFn: _parserFn$Query$getFavouriteItems,
        );
}

class WatchOptions$Query$getFavouriteItems
    extends graphql.WatchQueryOptions<Query$getFavouriteItems> {
  WatchOptions$Query$getFavouriteItems({
    String? operationName,
    Variables$Query$getFavouriteItems? variables,
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
          variables: variables?.toJson() ?? {},
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          context: context,
          document: documentNodeQuerygetFavouriteItems,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getFavouriteItems,
        );
}

class FetchMoreOptions$Query$getFavouriteItems
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getFavouriteItems({
    required graphql.UpdateQuery updateQuery,
    Variables$Query$getFavouriteItems? variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables?.toJson() ?? {},
          document: documentNodeQuerygetFavouriteItems,
        );
}

extension ClientExtension$Query$getFavouriteItems on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getFavouriteItems>> query$getFavouriteItems(
          [Options$Query$getFavouriteItems? options]) async =>
      await this.query(options ?? Options$Query$getFavouriteItems());
  graphql.ObservableQuery<Query$getFavouriteItems> watchQuery$getFavouriteItems(
          [WatchOptions$Query$getFavouriteItems? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$getFavouriteItems());
  void writeQuery$getFavouriteItems({
    required Query$getFavouriteItems data,
    Variables$Query$getFavouriteItems? variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQuerygetFavouriteItems),
          variables: variables?.toJson() ?? const {},
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getFavouriteItems? readQuery$getFavouriteItems({
    Variables$Query$getFavouriteItems? variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQuerygetFavouriteItems),
        variables: variables?.toJson() ?? const {},
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$getFavouriteItems.fromJson(result);
  }
}

class Query$getFavouriteItems$customer_favourited_item {
  Query$getFavouriteItems$customer_favourited_item({
    required this.restaurant_item_id,
    required this.$__typename,
  });

  factory Query$getFavouriteItems$customer_favourited_item.fromJson(
      Map<String, dynamic> json) {
    final l$restaurant_item_id = json['restaurant_item_id'];
    final l$$__typename = json['__typename'];
    return Query$getFavouriteItems$customer_favourited_item(
      restaurant_item_id: (l$restaurant_item_id as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int restaurant_item_id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$restaurant_item_id = restaurant_item_id;
    _resultData['restaurant_item_id'] = l$restaurant_item_id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$restaurant_item_id = restaurant_item_id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$restaurant_item_id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getFavouriteItems$customer_favourited_item) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$restaurant_item_id = restaurant_item_id;
    final lOther$restaurant_item_id = other.restaurant_item_id;
    if (l$restaurant_item_id != lOther$restaurant_item_id) {
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

extension UtilityExtension$Query$getFavouriteItems$customer_favourited_item
    on Query$getFavouriteItems$customer_favourited_item {
  CopyWith$Query$getFavouriteItems$customer_favourited_item<
          Query$getFavouriteItems$customer_favourited_item>
      get copyWith => CopyWith$Query$getFavouriteItems$customer_favourited_item(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getFavouriteItems$customer_favourited_item<TRes> {
  factory CopyWith$Query$getFavouriteItems$customer_favourited_item(
    Query$getFavouriteItems$customer_favourited_item instance,
    TRes Function(Query$getFavouriteItems$customer_favourited_item) then,
  ) = _CopyWithImpl$Query$getFavouriteItems$customer_favourited_item;

  factory CopyWith$Query$getFavouriteItems$customer_favourited_item.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getFavouriteItems$customer_favourited_item;

  TRes call({
    int? restaurant_item_id,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getFavouriteItems$customer_favourited_item<TRes>
    implements CopyWith$Query$getFavouriteItems$customer_favourited_item<TRes> {
  _CopyWithImpl$Query$getFavouriteItems$customer_favourited_item(
    this._instance,
    this._then,
  );

  final Query$getFavouriteItems$customer_favourited_item _instance;

  final TRes Function(Query$getFavouriteItems$customer_favourited_item) _then;

  static const _undefined = {};

  TRes call({
    Object? restaurant_item_id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getFavouriteItems$customer_favourited_item(
        restaurant_item_id:
            restaurant_item_id == _undefined || restaurant_item_id == null
                ? _instance.restaurant_item_id
                : (restaurant_item_id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getFavouriteItems$customer_favourited_item<TRes>
    implements CopyWith$Query$getFavouriteItems$customer_favourited_item<TRes> {
  _CopyWithStubImpl$Query$getFavouriteItems$customer_favourited_item(this._res);

  TRes _res;

  call({
    int? restaurant_item_id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$fetch_subscribed_posts {
  factory Variables$Query$fetch_subscribed_posts({
    int? customer_id,
    int? limit,
    int? offset,
  }) =>
      Variables$Query$fetch_subscribed_posts._({
        if (customer_id != null) r'customer_id': customer_id,
        if (limit != null) r'limit': limit,
        if (offset != null) r'offset': offset,
      });

  Variables$Query$fetch_subscribed_posts._(this._$data);

  factory Variables$Query$fetch_subscribed_posts.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('customer_id')) {
      final l$customer_id = data['customer_id'];
      result$data['customer_id'] = (l$customer_id as int?);
    }
    if (data.containsKey('limit')) {
      final l$limit = data['limit'];
      result$data['limit'] = (l$limit as int?);
    }
    if (data.containsKey('offset')) {
      final l$offset = data['offset'];
      result$data['offset'] = (l$offset as int?);
    }
    return Variables$Query$fetch_subscribed_posts._(result$data);
  }

  Map<String, dynamic> _$data;

  int? get customer_id => (_$data['customer_id'] as int?);
  int? get limit => (_$data['limit'] as int?);
  int? get offset => (_$data['offset'] as int?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('customer_id')) {
      final l$customer_id = customer_id;
      result$data['customer_id'] = l$customer_id;
    }
    if (_$data.containsKey('limit')) {
      final l$limit = limit;
      result$data['limit'] = l$limit;
    }
    if (_$data.containsKey('offset')) {
      final l$offset = offset;
      result$data['offset'] = l$offset;
    }
    return result$data;
  }

  CopyWith$Variables$Query$fetch_subscribed_posts<
          Variables$Query$fetch_subscribed_posts>
      get copyWith => CopyWith$Variables$Query$fetch_subscribed_posts(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$fetch_subscribed_posts) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$customer_id = customer_id;
    final lOther$customer_id = other.customer_id;
    if (_$data.containsKey('customer_id') !=
        other._$data.containsKey('customer_id')) {
      return false;
    }
    if (l$customer_id != lOther$customer_id) {
      return false;
    }
    final l$limit = limit;
    final lOther$limit = other.limit;
    if (_$data.containsKey('limit') != other._$data.containsKey('limit')) {
      return false;
    }
    if (l$limit != lOther$limit) {
      return false;
    }
    final l$offset = offset;
    final lOther$offset = other.offset;
    if (_$data.containsKey('offset') != other._$data.containsKey('offset')) {
      return false;
    }
    if (l$offset != lOther$offset) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$customer_id = customer_id;
    final l$limit = limit;
    final l$offset = offset;
    return Object.hashAll([
      _$data.containsKey('customer_id') ? l$customer_id : const {},
      _$data.containsKey('limit') ? l$limit : const {},
      _$data.containsKey('offset') ? l$offset : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$fetch_subscribed_posts<TRes> {
  factory CopyWith$Variables$Query$fetch_subscribed_posts(
    Variables$Query$fetch_subscribed_posts instance,
    TRes Function(Variables$Query$fetch_subscribed_posts) then,
  ) = _CopyWithImpl$Variables$Query$fetch_subscribed_posts;

  factory CopyWith$Variables$Query$fetch_subscribed_posts.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$fetch_subscribed_posts;

  TRes call({
    int? customer_id,
    int? limit,
    int? offset,
  });
}

class _CopyWithImpl$Variables$Query$fetch_subscribed_posts<TRes>
    implements CopyWith$Variables$Query$fetch_subscribed_posts<TRes> {
  _CopyWithImpl$Variables$Query$fetch_subscribed_posts(
    this._instance,
    this._then,
  );

  final Variables$Query$fetch_subscribed_posts _instance;

  final TRes Function(Variables$Query$fetch_subscribed_posts) _then;

  static const _undefined = {};

  TRes call({
    Object? customer_id = _undefined,
    Object? limit = _undefined,
    Object? offset = _undefined,
  }) =>
      _then(Variables$Query$fetch_subscribed_posts._({
        ..._instance._$data,
        if (customer_id != _undefined) 'customer_id': (customer_id as int?),
        if (limit != _undefined) 'limit': (limit as int?),
        if (offset != _undefined) 'offset': (offset as int?),
      }));
}

class _CopyWithStubImpl$Variables$Query$fetch_subscribed_posts<TRes>
    implements CopyWith$Variables$Query$fetch_subscribed_posts<TRes> {
  _CopyWithStubImpl$Variables$Query$fetch_subscribed_posts(this._res);

  TRes _res;

  call({
    int? customer_id,
    int? limit,
    int? offset,
  }) =>
      _res;
}

class Query$fetch_subscribed_posts {
  Query$fetch_subscribed_posts({
    required this.service_provider_post,
    required this.$__typename,
  });

  factory Query$fetch_subscribed_posts.fromJson(Map<String, dynamic> json) {
    final l$service_provider_post = json['service_provider_post'];
    final l$$__typename = json['__typename'];
    return Query$fetch_subscribed_posts(
      service_provider_post: (l$service_provider_post as List<dynamic>)
          .map((e) =>
              Query$fetch_subscribed_posts$service_provider_post.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$fetch_subscribed_posts$service_provider_post>
      service_provider_post;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$service_provider_post = service_provider_post;
    _resultData['service_provider_post'] =
        l$service_provider_post.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$service_provider_post = service_provider_post;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$service_provider_post.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$fetch_subscribed_posts) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$service_provider_post = service_provider_post;
    final lOther$service_provider_post = other.service_provider_post;
    if (l$service_provider_post.length != lOther$service_provider_post.length) {
      return false;
    }
    for (int i = 0; i < l$service_provider_post.length; i++) {
      final l$service_provider_post$entry = l$service_provider_post[i];
      final lOther$service_provider_post$entry =
          lOther$service_provider_post[i];
      if (l$service_provider_post$entry != lOther$service_provider_post$entry) {
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

extension UtilityExtension$Query$fetch_subscribed_posts
    on Query$fetch_subscribed_posts {
  CopyWith$Query$fetch_subscribed_posts<Query$fetch_subscribed_posts>
      get copyWith => CopyWith$Query$fetch_subscribed_posts(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$fetch_subscribed_posts<TRes> {
  factory CopyWith$Query$fetch_subscribed_posts(
    Query$fetch_subscribed_posts instance,
    TRes Function(Query$fetch_subscribed_posts) then,
  ) = _CopyWithImpl$Query$fetch_subscribed_posts;

  factory CopyWith$Query$fetch_subscribed_posts.stub(TRes res) =
      _CopyWithStubImpl$Query$fetch_subscribed_posts;

  TRes call({
    List<Query$fetch_subscribed_posts$service_provider_post>?
        service_provider_post,
    String? $__typename,
  });
  TRes service_provider_post(
      Iterable<Query$fetch_subscribed_posts$service_provider_post> Function(
              Iterable<
                  CopyWith$Query$fetch_subscribed_posts$service_provider_post<
                      Query$fetch_subscribed_posts$service_provider_post>>)
          _fn);
}

class _CopyWithImpl$Query$fetch_subscribed_posts<TRes>
    implements CopyWith$Query$fetch_subscribed_posts<TRes> {
  _CopyWithImpl$Query$fetch_subscribed_posts(
    this._instance,
    this._then,
  );

  final Query$fetch_subscribed_posts _instance;

  final TRes Function(Query$fetch_subscribed_posts) _then;

  static const _undefined = {};

  TRes call({
    Object? service_provider_post = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$fetch_subscribed_posts(
        service_provider_post: service_provider_post == _undefined ||
                service_provider_post == null
            ? _instance.service_provider_post
            : (service_provider_post
                as List<Query$fetch_subscribed_posts$service_provider_post>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes service_provider_post(
          Iterable<Query$fetch_subscribed_posts$service_provider_post> Function(
                  Iterable<
                      CopyWith$Query$fetch_subscribed_posts$service_provider_post<
                          Query$fetch_subscribed_posts$service_provider_post>>)
              _fn) =>
      call(
          service_provider_post: _fn(_instance.service_provider_post.map((e) =>
              CopyWith$Query$fetch_subscribed_posts$service_provider_post(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$fetch_subscribed_posts<TRes>
    implements CopyWith$Query$fetch_subscribed_posts<TRes> {
  _CopyWithStubImpl$Query$fetch_subscribed_posts(this._res);

  TRes _res;

  call({
    List<Query$fetch_subscribed_posts$service_provider_post>?
        service_provider_post,
    String? $__typename,
  }) =>
      _res;
  service_provider_post(_fn) => _res;
}

const documentNodeQueryfetch_subscribed_posts = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'fetch_subscribed_posts'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'customer_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'limit')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'offset')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'service_provider_post'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'limit'),
            value: VariableNode(name: NameNode(value: 'limit')),
          ),
          ArgumentNode(
            name: NameNode(value: 'offset'),
            value: VariableNode(name: NameNode(value: 'offset')),
          ),
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: '_or'),
                value: ListValueNode(values: [
                  ObjectValueNode(fields: [
                    ObjectFieldNode(
                      name: NameNode(value: 'business'),
                      value: ObjectValueNode(fields: [
                        ObjectFieldNode(
                          name: NameNode(value: 'subscribers'),
                          value: ObjectValueNode(fields: [
                            ObjectFieldNode(
                              name: NameNode(value: 'customer_id'),
                              value: ObjectValueNode(fields: [
                                ObjectFieldNode(
                                  name: NameNode(value: '_eq'),
                                  value: VariableNode(
                                      name: NameNode(value: 'customer_id')),
                                )
                              ]),
                            )
                          ]),
                        )
                      ]),
                    )
                  ]),
                  ObjectValueNode(fields: [
                    ObjectFieldNode(
                      name: NameNode(value: 'laundry'),
                      value: ObjectValueNode(fields: [
                        ObjectFieldNode(
                          name: NameNode(value: 'subscribers'),
                          value: ObjectValueNode(fields: [
                            ObjectFieldNode(
                              name: NameNode(value: 'customer_id'),
                              value: ObjectValueNode(fields: [
                                ObjectFieldNode(
                                  name: NameNode(value: '_eq'),
                                  value: VariableNode(
                                      name: NameNode(value: 'customer_id')),
                                )
                              ]),
                            )
                          ]),
                        )
                      ]),
                    )
                  ]),
                  ObjectValueNode(fields: [
                    ObjectFieldNode(
                      name: NameNode(value: 'delivery_company'),
                      value: ObjectValueNode(fields: [
                        ObjectFieldNode(
                          name: NameNode(value: 'subscribers'),
                          value: ObjectValueNode(fields: [
                            ObjectFieldNode(
                              name: NameNode(value: 'customer_id'),
                              value: ObjectValueNode(fields: [
                                ObjectFieldNode(
                                  name: NameNode(value: '_eq'),
                                  value: VariableNode(
                                      name: NameNode(value: 'customer_id')),
                                )
                              ]),
                            )
                          ]),
                        )
                      ]),
                    )
                  ]),
                  ObjectValueNode(fields: [
                    ObjectFieldNode(
                      name: NameNode(value: 'restaurant'),
                      value: ObjectValueNode(fields: [
                        ObjectFieldNode(
                          name: NameNode(value: 'subscribers'),
                          value: ObjectValueNode(fields: [
                            ObjectFieldNode(
                              name: NameNode(value: 'customer_id'),
                              value: ObjectValueNode(fields: [
                                ObjectFieldNode(
                                  name: NameNode(value: '_eq'),
                                  value: VariableNode(
                                      name: NameNode(value: 'customer_id')),
                                )
                              ]),
                            )
                          ]),
                        )
                      ]),
                    )
                  ]),
                ]),
              )
            ]),
          ),
          ArgumentNode(
            name: NameNode(value: 'order_by'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'posted_on'),
                value: EnumValueNode(name: NameNode(value: 'desc')),
              )
            ]),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'comments'),
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
                name: NameNode(value: 'message'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'likes'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'commented_on'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
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
            name: NameNode(value: 'likes'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'link'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'message'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'posted_on'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'service_provider_id'),
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
            name: NameNode(value: 'restaurant'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'details'),
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
            name: NameNode(value: 'laundry'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'details'),
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
            name: NameNode(value: 'delivery_company'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'details'),
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
            name: NameNode(value: 'business'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'details'),
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
Query$fetch_subscribed_posts _parserFn$Query$fetch_subscribed_posts(
        Map<String, dynamic> data) =>
    Query$fetch_subscribed_posts.fromJson(data);

class Options$Query$fetch_subscribed_posts
    extends graphql.QueryOptions<Query$fetch_subscribed_posts> {
  Options$Query$fetch_subscribed_posts({
    String? operationName,
    Variables$Query$fetch_subscribed_posts? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
  }) : super(
          variables: variables?.toJson() ?? {},
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          pollInterval: pollInterval,
          context: context,
          document: documentNodeQueryfetch_subscribed_posts,
          parserFn: _parserFn$Query$fetch_subscribed_posts,
        );
}

class WatchOptions$Query$fetch_subscribed_posts
    extends graphql.WatchQueryOptions<Query$fetch_subscribed_posts> {
  WatchOptions$Query$fetch_subscribed_posts({
    String? operationName,
    Variables$Query$fetch_subscribed_posts? variables,
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
          variables: variables?.toJson() ?? {},
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          context: context,
          document: documentNodeQueryfetch_subscribed_posts,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$fetch_subscribed_posts,
        );
}

class FetchMoreOptions$Query$fetch_subscribed_posts
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$fetch_subscribed_posts({
    required graphql.UpdateQuery updateQuery,
    Variables$Query$fetch_subscribed_posts? variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables?.toJson() ?? {},
          document: documentNodeQueryfetch_subscribed_posts,
        );
}

extension ClientExtension$Query$fetch_subscribed_posts
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$fetch_subscribed_posts>>
      query$fetch_subscribed_posts(
              [Options$Query$fetch_subscribed_posts? options]) async =>
          await this.query(options ?? Options$Query$fetch_subscribed_posts());
  graphql.ObservableQuery<
      Query$fetch_subscribed_posts> watchQuery$fetch_subscribed_posts(
          [WatchOptions$Query$fetch_subscribed_posts? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$fetch_subscribed_posts());
  void writeQuery$fetch_subscribed_posts({
    required Query$fetch_subscribed_posts data,
    Variables$Query$fetch_subscribed_posts? variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryfetch_subscribed_posts),
          variables: variables?.toJson() ?? const {},
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$fetch_subscribed_posts? readQuery$fetch_subscribed_posts({
    Variables$Query$fetch_subscribed_posts? variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQueryfetch_subscribed_posts),
        variables: variables?.toJson() ?? const {},
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$fetch_subscribed_posts.fromJson(result);
  }
}

class Query$fetch_subscribed_posts$service_provider_post {
  Query$fetch_subscribed_posts$service_provider_post({
    required this.comments,
    required this.id,
    this.image,
    required this.likes,
    this.link,
    required this.message,
    required this.posted_on,
    required this.service_provider_id,
    required this.service_provider_type,
    this.restaurant,
    this.laundry,
    this.delivery_company,
    this.business,
    required this.$__typename,
  });

  factory Query$fetch_subscribed_posts$service_provider_post.fromJson(
      Map<String, dynamic> json) {
    final l$comments = json['comments'];
    final l$id = json['id'];
    final l$image = json['image'];
    final l$likes = json['likes'];
    final l$link = json['link'];
    final l$message = json['message'];
    final l$posted_on = json['posted_on'];
    final l$service_provider_id = json['service_provider_id'];
    final l$service_provider_type = json['service_provider_type'];
    final l$restaurant = json['restaurant'];
    final l$laundry = json['laundry'];
    final l$delivery_company = json['delivery_company'];
    final l$business = json['business'];
    final l$$__typename = json['__typename'];
    return Query$fetch_subscribed_posts$service_provider_post(
      comments: (l$comments as List<dynamic>)
          .map((e) =>
              Query$fetch_subscribed_posts$service_provider_post$comments
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      id: (l$id as int),
      image: (l$image as String?),
      likes: mapFromJson(l$likes),
      link: (l$link as String?),
      message: (l$message as String),
      posted_on: (l$posted_on as String),
      service_provider_id: (l$service_provider_id as int),
      service_provider_type: (l$service_provider_type as String),
      restaurant: l$restaurant == null
          ? null
          : Query$fetch_subscribed_posts$service_provider_post$restaurant
              .fromJson((l$restaurant as Map<String, dynamic>)),
      laundry: l$laundry == null
          ? null
          : Query$fetch_subscribed_posts$service_provider_post$laundry.fromJson(
              (l$laundry as Map<String, dynamic>)),
      delivery_company: l$delivery_company == null
          ? null
          : Query$fetch_subscribed_posts$service_provider_post$delivery_company
              .fromJson((l$delivery_company as Map<String, dynamic>)),
      business: l$business == null
          ? null
          : Query$fetch_subscribed_posts$service_provider_post$business
              .fromJson((l$business as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$fetch_subscribed_posts$service_provider_post$comments>
      comments;

  final int id;

  final String? image;

  final dynamic likes;

  final String? link;

  final String message;

  final String posted_on;

  final int service_provider_id;

  final String service_provider_type;

  final Query$fetch_subscribed_posts$service_provider_post$restaurant?
      restaurant;

  final Query$fetch_subscribed_posts$service_provider_post$laundry? laundry;

  final Query$fetch_subscribed_posts$service_provider_post$delivery_company?
      delivery_company;

  final Query$fetch_subscribed_posts$service_provider_post$business? business;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$comments = comments;
    _resultData['comments'] = l$comments.map((e) => e.toJson()).toList();
    final l$id = id;
    _resultData['id'] = l$id;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$likes = likes;
    _resultData['likes'] = mapToJson(l$likes);
    final l$link = link;
    _resultData['link'] = l$link;
    final l$message = message;
    _resultData['message'] = l$message;
    final l$posted_on = posted_on;
    _resultData['posted_on'] = l$posted_on;
    final l$service_provider_id = service_provider_id;
    _resultData['service_provider_id'] = l$service_provider_id;
    final l$service_provider_type = service_provider_type;
    _resultData['service_provider_type'] = l$service_provider_type;
    final l$restaurant = restaurant;
    _resultData['restaurant'] = l$restaurant?.toJson();
    final l$laundry = laundry;
    _resultData['laundry'] = l$laundry?.toJson();
    final l$delivery_company = delivery_company;
    _resultData['delivery_company'] = l$delivery_company?.toJson();
    final l$business = business;
    _resultData['business'] = l$business?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$comments = comments;
    final l$id = id;
    final l$image = image;
    final l$likes = likes;
    final l$link = link;
    final l$message = message;
    final l$posted_on = posted_on;
    final l$service_provider_id = service_provider_id;
    final l$service_provider_type = service_provider_type;
    final l$restaurant = restaurant;
    final l$laundry = laundry;
    final l$delivery_company = delivery_company;
    final l$business = business;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$comments.map((v) => v)),
      l$id,
      l$image,
      l$likes,
      l$link,
      l$message,
      l$posted_on,
      l$service_provider_id,
      l$service_provider_type,
      l$restaurant,
      l$laundry,
      l$delivery_company,
      l$business,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$fetch_subscribed_posts$service_provider_post) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$comments = comments;
    final lOther$comments = other.comments;
    if (l$comments.length != lOther$comments.length) {
      return false;
    }
    for (int i = 0; i < l$comments.length; i++) {
      final l$comments$entry = l$comments[i];
      final lOther$comments$entry = lOther$comments[i];
      if (l$comments$entry != lOther$comments$entry) {
        return false;
      }
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
    final l$likes = likes;
    final lOther$likes = other.likes;
    if (l$likes != lOther$likes) {
      return false;
    }
    final l$link = link;
    final lOther$link = other.link;
    if (l$link != lOther$link) {
      return false;
    }
    final l$message = message;
    final lOther$message = other.message;
    if (l$message != lOther$message) {
      return false;
    }
    final l$posted_on = posted_on;
    final lOther$posted_on = other.posted_on;
    if (l$posted_on != lOther$posted_on) {
      return false;
    }
    final l$service_provider_id = service_provider_id;
    final lOther$service_provider_id = other.service_provider_id;
    if (l$service_provider_id != lOther$service_provider_id) {
      return false;
    }
    final l$service_provider_type = service_provider_type;
    final lOther$service_provider_type = other.service_provider_type;
    if (l$service_provider_type != lOther$service_provider_type) {
      return false;
    }
    final l$restaurant = restaurant;
    final lOther$restaurant = other.restaurant;
    if (l$restaurant != lOther$restaurant) {
      return false;
    }
    final l$laundry = laundry;
    final lOther$laundry = other.laundry;
    if (l$laundry != lOther$laundry) {
      return false;
    }
    final l$delivery_company = delivery_company;
    final lOther$delivery_company = other.delivery_company;
    if (l$delivery_company != lOther$delivery_company) {
      return false;
    }
    final l$business = business;
    final lOther$business = other.business;
    if (l$business != lOther$business) {
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

extension UtilityExtension$Query$fetch_subscribed_posts$service_provider_post
    on Query$fetch_subscribed_posts$service_provider_post {
  CopyWith$Query$fetch_subscribed_posts$service_provider_post<
          Query$fetch_subscribed_posts$service_provider_post>
      get copyWith =>
          CopyWith$Query$fetch_subscribed_posts$service_provider_post(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$fetch_subscribed_posts$service_provider_post<
    TRes> {
  factory CopyWith$Query$fetch_subscribed_posts$service_provider_post(
    Query$fetch_subscribed_posts$service_provider_post instance,
    TRes Function(Query$fetch_subscribed_posts$service_provider_post) then,
  ) = _CopyWithImpl$Query$fetch_subscribed_posts$service_provider_post;

  factory CopyWith$Query$fetch_subscribed_posts$service_provider_post.stub(
          TRes res) =
      _CopyWithStubImpl$Query$fetch_subscribed_posts$service_provider_post;

  TRes call({
    List<Query$fetch_subscribed_posts$service_provider_post$comments>? comments,
    int? id,
    String? image,
    dynamic? likes,
    String? link,
    String? message,
    String? posted_on,
    int? service_provider_id,
    String? service_provider_type,
    Query$fetch_subscribed_posts$service_provider_post$restaurant? restaurant,
    Query$fetch_subscribed_posts$service_provider_post$laundry? laundry,
    Query$fetch_subscribed_posts$service_provider_post$delivery_company?
        delivery_company,
    Query$fetch_subscribed_posts$service_provider_post$business? business,
    String? $__typename,
  });
  TRes comments(
      Iterable<Query$fetch_subscribed_posts$service_provider_post$comments> Function(
              Iterable<
                  CopyWith$Query$fetch_subscribed_posts$service_provider_post$comments<
                      Query$fetch_subscribed_posts$service_provider_post$comments>>)
          _fn);
  CopyWith$Query$fetch_subscribed_posts$service_provider_post$restaurant<TRes>
      get restaurant;
  CopyWith$Query$fetch_subscribed_posts$service_provider_post$laundry<TRes>
      get laundry;
  CopyWith$Query$fetch_subscribed_posts$service_provider_post$delivery_company<
      TRes> get delivery_company;
  CopyWith$Query$fetch_subscribed_posts$service_provider_post$business<TRes>
      get business;
}

class _CopyWithImpl$Query$fetch_subscribed_posts$service_provider_post<TRes>
    implements
        CopyWith$Query$fetch_subscribed_posts$service_provider_post<TRes> {
  _CopyWithImpl$Query$fetch_subscribed_posts$service_provider_post(
    this._instance,
    this._then,
  );

  final Query$fetch_subscribed_posts$service_provider_post _instance;

  final TRes Function(Query$fetch_subscribed_posts$service_provider_post) _then;

  static const _undefined = {};

  TRes call({
    Object? comments = _undefined,
    Object? id = _undefined,
    Object? image = _undefined,
    Object? likes = _undefined,
    Object? link = _undefined,
    Object? message = _undefined,
    Object? posted_on = _undefined,
    Object? service_provider_id = _undefined,
    Object? service_provider_type = _undefined,
    Object? restaurant = _undefined,
    Object? laundry = _undefined,
    Object? delivery_company = _undefined,
    Object? business = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$fetch_subscribed_posts$service_provider_post(
        comments: comments == _undefined || comments == null
            ? _instance.comments
            : (comments as List<
                Query$fetch_subscribed_posts$service_provider_post$comments>),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        image: image == _undefined ? _instance.image : (image as String?),
        likes: likes == _undefined || likes == null
            ? _instance.likes
            : (likes as dynamic),
        link: link == _undefined ? _instance.link : (link as String?),
        message: message == _undefined || message == null
            ? _instance.message
            : (message as String),
        posted_on: posted_on == _undefined || posted_on == null
            ? _instance.posted_on
            : (posted_on as String),
        service_provider_id:
            service_provider_id == _undefined || service_provider_id == null
                ? _instance.service_provider_id
                : (service_provider_id as int),
        service_provider_type:
            service_provider_type == _undefined || service_provider_type == null
                ? _instance.service_provider_type
                : (service_provider_type as String),
        restaurant: restaurant == _undefined
            ? _instance.restaurant
            : (restaurant
                as Query$fetch_subscribed_posts$service_provider_post$restaurant?),
        laundry: laundry == _undefined
            ? _instance.laundry
            : (laundry
                as Query$fetch_subscribed_posts$service_provider_post$laundry?),
        delivery_company: delivery_company == _undefined
            ? _instance.delivery_company
            : (delivery_company
                as Query$fetch_subscribed_posts$service_provider_post$delivery_company?),
        business: business == _undefined
            ? _instance.business
            : (business
                as Query$fetch_subscribed_posts$service_provider_post$business?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes comments(
          Iterable<Query$fetch_subscribed_posts$service_provider_post$comments> Function(
                  Iterable<
                      CopyWith$Query$fetch_subscribed_posts$service_provider_post$comments<
                          Query$fetch_subscribed_posts$service_provider_post$comments>>)
              _fn) =>
      call(
          comments: _fn(_instance.comments.map((e) =>
              CopyWith$Query$fetch_subscribed_posts$service_provider_post$comments(
                e,
                (i) => i,
              ))).toList());
  CopyWith$Query$fetch_subscribed_posts$service_provider_post$restaurant<TRes>
      get restaurant {
    final local$restaurant = _instance.restaurant;
    return local$restaurant == null
        ? CopyWith$Query$fetch_subscribed_posts$service_provider_post$restaurant
            .stub(_then(_instance))
        : CopyWith$Query$fetch_subscribed_posts$service_provider_post$restaurant(
            local$restaurant, (e) => call(restaurant: e));
  }

  CopyWith$Query$fetch_subscribed_posts$service_provider_post$laundry<TRes>
      get laundry {
    final local$laundry = _instance.laundry;
    return local$laundry == null
        ? CopyWith$Query$fetch_subscribed_posts$service_provider_post$laundry
            .stub(_then(_instance))
        : CopyWith$Query$fetch_subscribed_posts$service_provider_post$laundry(
            local$laundry, (e) => call(laundry: e));
  }

  CopyWith$Query$fetch_subscribed_posts$service_provider_post$delivery_company<
      TRes> get delivery_company {
    final local$delivery_company = _instance.delivery_company;
    return local$delivery_company == null
        ? CopyWith$Query$fetch_subscribed_posts$service_provider_post$delivery_company
            .stub(_then(_instance))
        : CopyWith$Query$fetch_subscribed_posts$service_provider_post$delivery_company(
            local$delivery_company, (e) => call(delivery_company: e));
  }

  CopyWith$Query$fetch_subscribed_posts$service_provider_post$business<TRes>
      get business {
    final local$business = _instance.business;
    return local$business == null
        ? CopyWith$Query$fetch_subscribed_posts$service_provider_post$business
            .stub(_then(_instance))
        : CopyWith$Query$fetch_subscribed_posts$service_provider_post$business(
            local$business, (e) => call(business: e));
  }
}

class _CopyWithStubImpl$Query$fetch_subscribed_posts$service_provider_post<TRes>
    implements
        CopyWith$Query$fetch_subscribed_posts$service_provider_post<TRes> {
  _CopyWithStubImpl$Query$fetch_subscribed_posts$service_provider_post(
      this._res);

  TRes _res;

  call({
    List<Query$fetch_subscribed_posts$service_provider_post$comments>? comments,
    int? id,
    String? image,
    dynamic? likes,
    String? link,
    String? message,
    String? posted_on,
    int? service_provider_id,
    String? service_provider_type,
    Query$fetch_subscribed_posts$service_provider_post$restaurant? restaurant,
    Query$fetch_subscribed_posts$service_provider_post$laundry? laundry,
    Query$fetch_subscribed_posts$service_provider_post$delivery_company?
        delivery_company,
    Query$fetch_subscribed_posts$service_provider_post$business? business,
    String? $__typename,
  }) =>
      _res;
  comments(_fn) => _res;
  CopyWith$Query$fetch_subscribed_posts$service_provider_post$restaurant<TRes>
      get restaurant =>
          CopyWith$Query$fetch_subscribed_posts$service_provider_post$restaurant
              .stub(_res);
  CopyWith$Query$fetch_subscribed_posts$service_provider_post$laundry<TRes>
      get laundry =>
          CopyWith$Query$fetch_subscribed_posts$service_provider_post$laundry
              .stub(_res);
  CopyWith$Query$fetch_subscribed_posts$service_provider_post$delivery_company<
          TRes>
      get delivery_company =>
          CopyWith$Query$fetch_subscribed_posts$service_provider_post$delivery_company
              .stub(_res);
  CopyWith$Query$fetch_subscribed_posts$service_provider_post$business<TRes>
      get business =>
          CopyWith$Query$fetch_subscribed_posts$service_provider_post$business
              .stub(_res);
}

class Query$fetch_subscribed_posts$service_provider_post$comments {
  Query$fetch_subscribed_posts$service_provider_post$comments({
    required this.id,
    required this.message,
    required this.likes,
    required this.commented_on,
    required this.user,
    required this.$__typename,
  });

  factory Query$fetch_subscribed_posts$service_provider_post$comments.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$message = json['message'];
    final l$likes = json['likes'];
    final l$commented_on = json['commented_on'];
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Query$fetch_subscribed_posts$service_provider_post$comments(
      id: (l$id as int),
      message: (l$message as String),
      likes: mapFromJson(l$likes),
      commented_on: (l$commented_on as String),
      user: Query$fetch_subscribed_posts$service_provider_post$comments$user
          .fromJson((l$user as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String message;

  final dynamic likes;

  final String commented_on;

  final Query$fetch_subscribed_posts$service_provider_post$comments$user user;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$message = message;
    _resultData['message'] = l$message;
    final l$likes = likes;
    _resultData['likes'] = mapToJson(l$likes);
    final l$commented_on = commented_on;
    _resultData['commented_on'] = l$commented_on;
    final l$user = user;
    _resultData['user'] = l$user.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$message = message;
    final l$likes = likes;
    final l$commented_on = commented_on;
    final l$user = user;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$message,
      l$likes,
      l$commented_on,
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
            is Query$fetch_subscribed_posts$service_provider_post$comments) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$message = message;
    final lOther$message = other.message;
    if (l$message != lOther$message) {
      return false;
    }
    final l$likes = likes;
    final lOther$likes = other.likes;
    if (l$likes != lOther$likes) {
      return false;
    }
    final l$commented_on = commented_on;
    final lOther$commented_on = other.commented_on;
    if (l$commented_on != lOther$commented_on) {
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

extension UtilityExtension$Query$fetch_subscribed_posts$service_provider_post$comments
    on Query$fetch_subscribed_posts$service_provider_post$comments {
  CopyWith$Query$fetch_subscribed_posts$service_provider_post$comments<
          Query$fetch_subscribed_posts$service_provider_post$comments>
      get copyWith =>
          CopyWith$Query$fetch_subscribed_posts$service_provider_post$comments(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$fetch_subscribed_posts$service_provider_post$comments<
    TRes> {
  factory CopyWith$Query$fetch_subscribed_posts$service_provider_post$comments(
    Query$fetch_subscribed_posts$service_provider_post$comments instance,
    TRes Function(Query$fetch_subscribed_posts$service_provider_post$comments)
        then,
  ) = _CopyWithImpl$Query$fetch_subscribed_posts$service_provider_post$comments;

  factory CopyWith$Query$fetch_subscribed_posts$service_provider_post$comments.stub(
          TRes res) =
      _CopyWithStubImpl$Query$fetch_subscribed_posts$service_provider_post$comments;

  TRes call({
    int? id,
    String? message,
    dynamic? likes,
    String? commented_on,
    Query$fetch_subscribed_posts$service_provider_post$comments$user? user,
    String? $__typename,
  });
  CopyWith$Query$fetch_subscribed_posts$service_provider_post$comments$user<
      TRes> get user;
}

class _CopyWithImpl$Query$fetch_subscribed_posts$service_provider_post$comments<
        TRes>
    implements
        CopyWith$Query$fetch_subscribed_posts$service_provider_post$comments<
            TRes> {
  _CopyWithImpl$Query$fetch_subscribed_posts$service_provider_post$comments(
    this._instance,
    this._then,
  );

  final Query$fetch_subscribed_posts$service_provider_post$comments _instance;

  final TRes Function(
      Query$fetch_subscribed_posts$service_provider_post$comments) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? message = _undefined,
    Object? likes = _undefined,
    Object? commented_on = _undefined,
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$fetch_subscribed_posts$service_provider_post$comments(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        message: message == _undefined || message == null
            ? _instance.message
            : (message as String),
        likes: likes == _undefined || likes == null
            ? _instance.likes
            : (likes as dynamic),
        commented_on: commented_on == _undefined || commented_on == null
            ? _instance.commented_on
            : (commented_on as String),
        user: user == _undefined || user == null
            ? _instance.user
            : (user
                as Query$fetch_subscribed_posts$service_provider_post$comments$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$fetch_subscribed_posts$service_provider_post$comments$user<
      TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Query$fetch_subscribed_posts$service_provider_post$comments$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Query$fetch_subscribed_posts$service_provider_post$comments<
        TRes>
    implements
        CopyWith$Query$fetch_subscribed_posts$service_provider_post$comments<
            TRes> {
  _CopyWithStubImpl$Query$fetch_subscribed_posts$service_provider_post$comments(
      this._res);

  TRes _res;

  call({
    int? id,
    String? message,
    dynamic? likes,
    String? commented_on,
    Query$fetch_subscribed_posts$service_provider_post$comments$user? user,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$fetch_subscribed_posts$service_provider_post$comments$user<
          TRes>
      get user =>
          CopyWith$Query$fetch_subscribed_posts$service_provider_post$comments$user
              .stub(_res);
}

class Query$fetch_subscribed_posts$service_provider_post$comments$user {
  Query$fetch_subscribed_posts$service_provider_post$comments$user({
    required this.id,
    this.name,
    this.image,
    required this.$__typename,
  });

  factory Query$fetch_subscribed_posts$service_provider_post$comments$user.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Query$fetch_subscribed_posts$service_provider_post$comments$user(
      id: (l$id as int),
      name: (l$name as String?),
      image: (l$image as String?),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String? name;

  final String? image;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
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
    final l$id = id;
    final l$name = name;
    final l$image = image;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
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
            is Query$fetch_subscribed_posts$service_provider_post$comments$user) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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

extension UtilityExtension$Query$fetch_subscribed_posts$service_provider_post$comments$user
    on Query$fetch_subscribed_posts$service_provider_post$comments$user {
  CopyWith$Query$fetch_subscribed_posts$service_provider_post$comments$user<
          Query$fetch_subscribed_posts$service_provider_post$comments$user>
      get copyWith =>
          CopyWith$Query$fetch_subscribed_posts$service_provider_post$comments$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$fetch_subscribed_posts$service_provider_post$comments$user<
    TRes> {
  factory CopyWith$Query$fetch_subscribed_posts$service_provider_post$comments$user(
    Query$fetch_subscribed_posts$service_provider_post$comments$user instance,
    TRes Function(
            Query$fetch_subscribed_posts$service_provider_post$comments$user)
        then,
  ) = _CopyWithImpl$Query$fetch_subscribed_posts$service_provider_post$comments$user;

  factory CopyWith$Query$fetch_subscribed_posts$service_provider_post$comments$user.stub(
          TRes res) =
      _CopyWithStubImpl$Query$fetch_subscribed_posts$service_provider_post$comments$user;

  TRes call({
    int? id,
    String? name,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$fetch_subscribed_posts$service_provider_post$comments$user<
        TRes>
    implements
        CopyWith$Query$fetch_subscribed_posts$service_provider_post$comments$user<
            TRes> {
  _CopyWithImpl$Query$fetch_subscribed_posts$service_provider_post$comments$user(
    this._instance,
    this._then,
  );

  final Query$fetch_subscribed_posts$service_provider_post$comments$user
      _instance;

  final TRes Function(
      Query$fetch_subscribed_posts$service_provider_post$comments$user) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$fetch_subscribed_posts$service_provider_post$comments$user(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined ? _instance.name : (name as String?),
        image: image == _undefined ? _instance.image : (image as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$fetch_subscribed_posts$service_provider_post$comments$user<
        TRes>
    implements
        CopyWith$Query$fetch_subscribed_posts$service_provider_post$comments$user<
            TRes> {
  _CopyWithStubImpl$Query$fetch_subscribed_posts$service_provider_post$comments$user(
      this._res);

  TRes _res;

  call({
    int? id,
    String? name,
    String? image,
    String? $__typename,
  }) =>
      _res;
}

class Query$fetch_subscribed_posts$service_provider_post$restaurant {
  Query$fetch_subscribed_posts$service_provider_post$restaurant({
    this.details,
    required this.$__typename,
  });

  factory Query$fetch_subscribed_posts$service_provider_post$restaurant.fromJson(
      Map<String, dynamic> json) {
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Query$fetch_subscribed_posts$service_provider_post$restaurant(
      details: l$details == null
          ? null
          : Query$fetch_subscribed_posts$service_provider_post$restaurant$details
              .fromJson((l$details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$fetch_subscribed_posts$service_provider_post$restaurant$details?
      details;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$details = details;
    _resultData['details'] = l$details?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$details = details;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$details,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$fetch_subscribed_posts$service_provider_post$restaurant) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$details = details;
    final lOther$details = other.details;
    if (l$details != lOther$details) {
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

extension UtilityExtension$Query$fetch_subscribed_posts$service_provider_post$restaurant
    on Query$fetch_subscribed_posts$service_provider_post$restaurant {
  CopyWith$Query$fetch_subscribed_posts$service_provider_post$restaurant<
          Query$fetch_subscribed_posts$service_provider_post$restaurant>
      get copyWith =>
          CopyWith$Query$fetch_subscribed_posts$service_provider_post$restaurant(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$fetch_subscribed_posts$service_provider_post$restaurant<
    TRes> {
  factory CopyWith$Query$fetch_subscribed_posts$service_provider_post$restaurant(
    Query$fetch_subscribed_posts$service_provider_post$restaurant instance,
    TRes Function(Query$fetch_subscribed_posts$service_provider_post$restaurant)
        then,
  ) = _CopyWithImpl$Query$fetch_subscribed_posts$service_provider_post$restaurant;

  factory CopyWith$Query$fetch_subscribed_posts$service_provider_post$restaurant.stub(
          TRes res) =
      _CopyWithStubImpl$Query$fetch_subscribed_posts$service_provider_post$restaurant;

  TRes call({
    Query$fetch_subscribed_posts$service_provider_post$restaurant$details?
        details,
    String? $__typename,
  });
  CopyWith$Query$fetch_subscribed_posts$service_provider_post$restaurant$details<
      TRes> get details;
}

class _CopyWithImpl$Query$fetch_subscribed_posts$service_provider_post$restaurant<
        TRes>
    implements
        CopyWith$Query$fetch_subscribed_posts$service_provider_post$restaurant<
            TRes> {
  _CopyWithImpl$Query$fetch_subscribed_posts$service_provider_post$restaurant(
    this._instance,
    this._then,
  );

  final Query$fetch_subscribed_posts$service_provider_post$restaurant _instance;

  final TRes Function(
      Query$fetch_subscribed_posts$service_provider_post$restaurant) _then;

  static const _undefined = {};

  TRes call({
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$fetch_subscribed_posts$service_provider_post$restaurant(
        details: details == _undefined
            ? _instance.details
            : (details
                as Query$fetch_subscribed_posts$service_provider_post$restaurant$details?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$fetch_subscribed_posts$service_provider_post$restaurant$details<
      TRes> get details {
    final local$details = _instance.details;
    return local$details == null
        ? CopyWith$Query$fetch_subscribed_posts$service_provider_post$restaurant$details
            .stub(_then(_instance))
        : CopyWith$Query$fetch_subscribed_posts$service_provider_post$restaurant$details(
            local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Query$fetch_subscribed_posts$service_provider_post$restaurant<
        TRes>
    implements
        CopyWith$Query$fetch_subscribed_posts$service_provider_post$restaurant<
            TRes> {
  _CopyWithStubImpl$Query$fetch_subscribed_posts$service_provider_post$restaurant(
      this._res);

  TRes _res;

  call({
    Query$fetch_subscribed_posts$service_provider_post$restaurant$details?
        details,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$fetch_subscribed_posts$service_provider_post$restaurant$details<
          TRes>
      get details =>
          CopyWith$Query$fetch_subscribed_posts$service_provider_post$restaurant$details
              .stub(_res);
}

class Query$fetch_subscribed_posts$service_provider_post$restaurant$details {
  Query$fetch_subscribed_posts$service_provider_post$restaurant$details({
    required this.name,
    required this.image,
    required this.$__typename,
  });

  factory Query$fetch_subscribed_posts$service_provider_post$restaurant$details.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Query$fetch_subscribed_posts$service_provider_post$restaurant$details(
      name: (l$name as String),
      image: (l$image as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String name;

  final String image;

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
            is Query$fetch_subscribed_posts$service_provider_post$restaurant$details) ||
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

extension UtilityExtension$Query$fetch_subscribed_posts$service_provider_post$restaurant$details
    on Query$fetch_subscribed_posts$service_provider_post$restaurant$details {
  CopyWith$Query$fetch_subscribed_posts$service_provider_post$restaurant$details<
          Query$fetch_subscribed_posts$service_provider_post$restaurant$details>
      get copyWith =>
          CopyWith$Query$fetch_subscribed_posts$service_provider_post$restaurant$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$fetch_subscribed_posts$service_provider_post$restaurant$details<
    TRes> {
  factory CopyWith$Query$fetch_subscribed_posts$service_provider_post$restaurant$details(
    Query$fetch_subscribed_posts$service_provider_post$restaurant$details
        instance,
    TRes Function(
            Query$fetch_subscribed_posts$service_provider_post$restaurant$details)
        then,
  ) = _CopyWithImpl$Query$fetch_subscribed_posts$service_provider_post$restaurant$details;

  factory CopyWith$Query$fetch_subscribed_posts$service_provider_post$restaurant$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$fetch_subscribed_posts$service_provider_post$restaurant$details;

  TRes call({
    String? name,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$fetch_subscribed_posts$service_provider_post$restaurant$details<
        TRes>
    implements
        CopyWith$Query$fetch_subscribed_posts$service_provider_post$restaurant$details<
            TRes> {
  _CopyWithImpl$Query$fetch_subscribed_posts$service_provider_post$restaurant$details(
    this._instance,
    this._then,
  );

  final Query$fetch_subscribed_posts$service_provider_post$restaurant$details
      _instance;

  final TRes Function(
          Query$fetch_subscribed_posts$service_provider_post$restaurant$details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$fetch_subscribed_posts$service_provider_post$restaurant$details(
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$fetch_subscribed_posts$service_provider_post$restaurant$details<
        TRes>
    implements
        CopyWith$Query$fetch_subscribed_posts$service_provider_post$restaurant$details<
            TRes> {
  _CopyWithStubImpl$Query$fetch_subscribed_posts$service_provider_post$restaurant$details(
      this._res);

  TRes _res;

  call({
    String? name,
    String? image,
    String? $__typename,
  }) =>
      _res;
}

class Query$fetch_subscribed_posts$service_provider_post$laundry {
  Query$fetch_subscribed_posts$service_provider_post$laundry({
    this.details,
    required this.$__typename,
  });

  factory Query$fetch_subscribed_posts$service_provider_post$laundry.fromJson(
      Map<String, dynamic> json) {
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Query$fetch_subscribed_posts$service_provider_post$laundry(
      details: l$details == null
          ? null
          : Query$fetch_subscribed_posts$service_provider_post$laundry$details
              .fromJson((l$details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$fetch_subscribed_posts$service_provider_post$laundry$details?
      details;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$details = details;
    _resultData['details'] = l$details?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$details = details;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$details,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$fetch_subscribed_posts$service_provider_post$laundry) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$details = details;
    final lOther$details = other.details;
    if (l$details != lOther$details) {
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

extension UtilityExtension$Query$fetch_subscribed_posts$service_provider_post$laundry
    on Query$fetch_subscribed_posts$service_provider_post$laundry {
  CopyWith$Query$fetch_subscribed_posts$service_provider_post$laundry<
          Query$fetch_subscribed_posts$service_provider_post$laundry>
      get copyWith =>
          CopyWith$Query$fetch_subscribed_posts$service_provider_post$laundry(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$fetch_subscribed_posts$service_provider_post$laundry<
    TRes> {
  factory CopyWith$Query$fetch_subscribed_posts$service_provider_post$laundry(
    Query$fetch_subscribed_posts$service_provider_post$laundry instance,
    TRes Function(Query$fetch_subscribed_posts$service_provider_post$laundry)
        then,
  ) = _CopyWithImpl$Query$fetch_subscribed_posts$service_provider_post$laundry;

  factory CopyWith$Query$fetch_subscribed_posts$service_provider_post$laundry.stub(
          TRes res) =
      _CopyWithStubImpl$Query$fetch_subscribed_posts$service_provider_post$laundry;

  TRes call({
    Query$fetch_subscribed_posts$service_provider_post$laundry$details? details,
    String? $__typename,
  });
  CopyWith$Query$fetch_subscribed_posts$service_provider_post$laundry$details<
      TRes> get details;
}

class _CopyWithImpl$Query$fetch_subscribed_posts$service_provider_post$laundry<
        TRes>
    implements
        CopyWith$Query$fetch_subscribed_posts$service_provider_post$laundry<
            TRes> {
  _CopyWithImpl$Query$fetch_subscribed_posts$service_provider_post$laundry(
    this._instance,
    this._then,
  );

  final Query$fetch_subscribed_posts$service_provider_post$laundry _instance;

  final TRes Function(
      Query$fetch_subscribed_posts$service_provider_post$laundry) _then;

  static const _undefined = {};

  TRes call({
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$fetch_subscribed_posts$service_provider_post$laundry(
        details: details == _undefined
            ? _instance.details
            : (details
                as Query$fetch_subscribed_posts$service_provider_post$laundry$details?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$fetch_subscribed_posts$service_provider_post$laundry$details<
      TRes> get details {
    final local$details = _instance.details;
    return local$details == null
        ? CopyWith$Query$fetch_subscribed_posts$service_provider_post$laundry$details
            .stub(_then(_instance))
        : CopyWith$Query$fetch_subscribed_posts$service_provider_post$laundry$details(
            local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Query$fetch_subscribed_posts$service_provider_post$laundry<
        TRes>
    implements
        CopyWith$Query$fetch_subscribed_posts$service_provider_post$laundry<
            TRes> {
  _CopyWithStubImpl$Query$fetch_subscribed_posts$service_provider_post$laundry(
      this._res);

  TRes _res;

  call({
    Query$fetch_subscribed_posts$service_provider_post$laundry$details? details,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$fetch_subscribed_posts$service_provider_post$laundry$details<
          TRes>
      get details =>
          CopyWith$Query$fetch_subscribed_posts$service_provider_post$laundry$details
              .stub(_res);
}

class Query$fetch_subscribed_posts$service_provider_post$laundry$details {
  Query$fetch_subscribed_posts$service_provider_post$laundry$details({
    required this.name,
    required this.image,
    required this.$__typename,
  });

  factory Query$fetch_subscribed_posts$service_provider_post$laundry$details.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Query$fetch_subscribed_posts$service_provider_post$laundry$details(
      name: (l$name as String),
      image: (l$image as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String name;

  final String image;

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
            is Query$fetch_subscribed_posts$service_provider_post$laundry$details) ||
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

extension UtilityExtension$Query$fetch_subscribed_posts$service_provider_post$laundry$details
    on Query$fetch_subscribed_posts$service_provider_post$laundry$details {
  CopyWith$Query$fetch_subscribed_posts$service_provider_post$laundry$details<
          Query$fetch_subscribed_posts$service_provider_post$laundry$details>
      get copyWith =>
          CopyWith$Query$fetch_subscribed_posts$service_provider_post$laundry$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$fetch_subscribed_posts$service_provider_post$laundry$details<
    TRes> {
  factory CopyWith$Query$fetch_subscribed_posts$service_provider_post$laundry$details(
    Query$fetch_subscribed_posts$service_provider_post$laundry$details instance,
    TRes Function(
            Query$fetch_subscribed_posts$service_provider_post$laundry$details)
        then,
  ) = _CopyWithImpl$Query$fetch_subscribed_posts$service_provider_post$laundry$details;

  factory CopyWith$Query$fetch_subscribed_posts$service_provider_post$laundry$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$fetch_subscribed_posts$service_provider_post$laundry$details;

  TRes call({
    String? name,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$fetch_subscribed_posts$service_provider_post$laundry$details<
        TRes>
    implements
        CopyWith$Query$fetch_subscribed_posts$service_provider_post$laundry$details<
            TRes> {
  _CopyWithImpl$Query$fetch_subscribed_posts$service_provider_post$laundry$details(
    this._instance,
    this._then,
  );

  final Query$fetch_subscribed_posts$service_provider_post$laundry$details
      _instance;

  final TRes Function(
      Query$fetch_subscribed_posts$service_provider_post$laundry$details) _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$fetch_subscribed_posts$service_provider_post$laundry$details(
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$fetch_subscribed_posts$service_provider_post$laundry$details<
        TRes>
    implements
        CopyWith$Query$fetch_subscribed_posts$service_provider_post$laundry$details<
            TRes> {
  _CopyWithStubImpl$Query$fetch_subscribed_posts$service_provider_post$laundry$details(
      this._res);

  TRes _res;

  call({
    String? name,
    String? image,
    String? $__typename,
  }) =>
      _res;
}

class Query$fetch_subscribed_posts$service_provider_post$delivery_company {
  Query$fetch_subscribed_posts$service_provider_post$delivery_company({
    this.details,
    required this.$__typename,
  });

  factory Query$fetch_subscribed_posts$service_provider_post$delivery_company.fromJson(
      Map<String, dynamic> json) {
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Query$fetch_subscribed_posts$service_provider_post$delivery_company(
      details: l$details == null
          ? null
          : Query$fetch_subscribed_posts$service_provider_post$delivery_company$details
              .fromJson((l$details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$fetch_subscribed_posts$service_provider_post$delivery_company$details?
      details;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$details = details;
    _resultData['details'] = l$details?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$details = details;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$details,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$fetch_subscribed_posts$service_provider_post$delivery_company) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$details = details;
    final lOther$details = other.details;
    if (l$details != lOther$details) {
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

extension UtilityExtension$Query$fetch_subscribed_posts$service_provider_post$delivery_company
    on Query$fetch_subscribed_posts$service_provider_post$delivery_company {
  CopyWith$Query$fetch_subscribed_posts$service_provider_post$delivery_company<
          Query$fetch_subscribed_posts$service_provider_post$delivery_company>
      get copyWith =>
          CopyWith$Query$fetch_subscribed_posts$service_provider_post$delivery_company(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$fetch_subscribed_posts$service_provider_post$delivery_company<
    TRes> {
  factory CopyWith$Query$fetch_subscribed_posts$service_provider_post$delivery_company(
    Query$fetch_subscribed_posts$service_provider_post$delivery_company
        instance,
    TRes Function(
            Query$fetch_subscribed_posts$service_provider_post$delivery_company)
        then,
  ) = _CopyWithImpl$Query$fetch_subscribed_posts$service_provider_post$delivery_company;

  factory CopyWith$Query$fetch_subscribed_posts$service_provider_post$delivery_company.stub(
          TRes res) =
      _CopyWithStubImpl$Query$fetch_subscribed_posts$service_provider_post$delivery_company;

  TRes call({
    Query$fetch_subscribed_posts$service_provider_post$delivery_company$details?
        details,
    String? $__typename,
  });
  CopyWith$Query$fetch_subscribed_posts$service_provider_post$delivery_company$details<
      TRes> get details;
}

class _CopyWithImpl$Query$fetch_subscribed_posts$service_provider_post$delivery_company<
        TRes>
    implements
        CopyWith$Query$fetch_subscribed_posts$service_provider_post$delivery_company<
            TRes> {
  _CopyWithImpl$Query$fetch_subscribed_posts$service_provider_post$delivery_company(
    this._instance,
    this._then,
  );

  final Query$fetch_subscribed_posts$service_provider_post$delivery_company
      _instance;

  final TRes Function(
          Query$fetch_subscribed_posts$service_provider_post$delivery_company)
      _then;

  static const _undefined = {};

  TRes call({
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$fetch_subscribed_posts$service_provider_post$delivery_company(
        details: details == _undefined
            ? _instance.details
            : (details
                as Query$fetch_subscribed_posts$service_provider_post$delivery_company$details?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$fetch_subscribed_posts$service_provider_post$delivery_company$details<
      TRes> get details {
    final local$details = _instance.details;
    return local$details == null
        ? CopyWith$Query$fetch_subscribed_posts$service_provider_post$delivery_company$details
            .stub(_then(_instance))
        : CopyWith$Query$fetch_subscribed_posts$service_provider_post$delivery_company$details(
            local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Query$fetch_subscribed_posts$service_provider_post$delivery_company<
        TRes>
    implements
        CopyWith$Query$fetch_subscribed_posts$service_provider_post$delivery_company<
            TRes> {
  _CopyWithStubImpl$Query$fetch_subscribed_posts$service_provider_post$delivery_company(
      this._res);

  TRes _res;

  call({
    Query$fetch_subscribed_posts$service_provider_post$delivery_company$details?
        details,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$fetch_subscribed_posts$service_provider_post$delivery_company$details<
          TRes>
      get details =>
          CopyWith$Query$fetch_subscribed_posts$service_provider_post$delivery_company$details
              .stub(_res);
}

class Query$fetch_subscribed_posts$service_provider_post$delivery_company$details {
  Query$fetch_subscribed_posts$service_provider_post$delivery_company$details({
    required this.name,
    required this.image,
    required this.$__typename,
  });

  factory Query$fetch_subscribed_posts$service_provider_post$delivery_company$details.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Query$fetch_subscribed_posts$service_provider_post$delivery_company$details(
      name: (l$name as String),
      image: (l$image as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String name;

  final String image;

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
            is Query$fetch_subscribed_posts$service_provider_post$delivery_company$details) ||
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

extension UtilityExtension$Query$fetch_subscribed_posts$service_provider_post$delivery_company$details
    on Query$fetch_subscribed_posts$service_provider_post$delivery_company$details {
  CopyWith$Query$fetch_subscribed_posts$service_provider_post$delivery_company$details<
          Query$fetch_subscribed_posts$service_provider_post$delivery_company$details>
      get copyWith =>
          CopyWith$Query$fetch_subscribed_posts$service_provider_post$delivery_company$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$fetch_subscribed_posts$service_provider_post$delivery_company$details<
    TRes> {
  factory CopyWith$Query$fetch_subscribed_posts$service_provider_post$delivery_company$details(
    Query$fetch_subscribed_posts$service_provider_post$delivery_company$details
        instance,
    TRes Function(
            Query$fetch_subscribed_posts$service_provider_post$delivery_company$details)
        then,
  ) = _CopyWithImpl$Query$fetch_subscribed_posts$service_provider_post$delivery_company$details;

  factory CopyWith$Query$fetch_subscribed_posts$service_provider_post$delivery_company$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$fetch_subscribed_posts$service_provider_post$delivery_company$details;

  TRes call({
    String? name,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$fetch_subscribed_posts$service_provider_post$delivery_company$details<
        TRes>
    implements
        CopyWith$Query$fetch_subscribed_posts$service_provider_post$delivery_company$details<
            TRes> {
  _CopyWithImpl$Query$fetch_subscribed_posts$service_provider_post$delivery_company$details(
    this._instance,
    this._then,
  );

  final Query$fetch_subscribed_posts$service_provider_post$delivery_company$details
      _instance;

  final TRes Function(
          Query$fetch_subscribed_posts$service_provider_post$delivery_company$details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$fetch_subscribed_posts$service_provider_post$delivery_company$details(
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$fetch_subscribed_posts$service_provider_post$delivery_company$details<
        TRes>
    implements
        CopyWith$Query$fetch_subscribed_posts$service_provider_post$delivery_company$details<
            TRes> {
  _CopyWithStubImpl$Query$fetch_subscribed_posts$service_provider_post$delivery_company$details(
      this._res);

  TRes _res;

  call({
    String? name,
    String? image,
    String? $__typename,
  }) =>
      _res;
}

class Query$fetch_subscribed_posts$service_provider_post$business {
  Query$fetch_subscribed_posts$service_provider_post$business({
    required this.details,
    required this.$__typename,
  });

  factory Query$fetch_subscribed_posts$service_provider_post$business.fromJson(
      Map<String, dynamic> json) {
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Query$fetch_subscribed_posts$service_provider_post$business(
      details:
          Query$fetch_subscribed_posts$service_provider_post$business$details
              .fromJson((l$details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$fetch_subscribed_posts$service_provider_post$business$details
      details;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$details = details;
    _resultData['details'] = l$details.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$details = details;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$details,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$fetch_subscribed_posts$service_provider_post$business) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$details = details;
    final lOther$details = other.details;
    if (l$details != lOther$details) {
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

extension UtilityExtension$Query$fetch_subscribed_posts$service_provider_post$business
    on Query$fetch_subscribed_posts$service_provider_post$business {
  CopyWith$Query$fetch_subscribed_posts$service_provider_post$business<
          Query$fetch_subscribed_posts$service_provider_post$business>
      get copyWith =>
          CopyWith$Query$fetch_subscribed_posts$service_provider_post$business(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$fetch_subscribed_posts$service_provider_post$business<
    TRes> {
  factory CopyWith$Query$fetch_subscribed_posts$service_provider_post$business(
    Query$fetch_subscribed_posts$service_provider_post$business instance,
    TRes Function(Query$fetch_subscribed_posts$service_provider_post$business)
        then,
  ) = _CopyWithImpl$Query$fetch_subscribed_posts$service_provider_post$business;

  factory CopyWith$Query$fetch_subscribed_posts$service_provider_post$business.stub(
          TRes res) =
      _CopyWithStubImpl$Query$fetch_subscribed_posts$service_provider_post$business;

  TRes call({
    Query$fetch_subscribed_posts$service_provider_post$business$details?
        details,
    String? $__typename,
  });
  CopyWith$Query$fetch_subscribed_posts$service_provider_post$business$details<
      TRes> get details;
}

class _CopyWithImpl$Query$fetch_subscribed_posts$service_provider_post$business<
        TRes>
    implements
        CopyWith$Query$fetch_subscribed_posts$service_provider_post$business<
            TRes> {
  _CopyWithImpl$Query$fetch_subscribed_posts$service_provider_post$business(
    this._instance,
    this._then,
  );

  final Query$fetch_subscribed_posts$service_provider_post$business _instance;

  final TRes Function(
      Query$fetch_subscribed_posts$service_provider_post$business) _then;

  static const _undefined = {};

  TRes call({
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$fetch_subscribed_posts$service_provider_post$business(
        details: details == _undefined || details == null
            ? _instance.details
            : (details
                as Query$fetch_subscribed_posts$service_provider_post$business$details),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$fetch_subscribed_posts$service_provider_post$business$details<
      TRes> get details {
    final local$details = _instance.details;
    return CopyWith$Query$fetch_subscribed_posts$service_provider_post$business$details(
        local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Query$fetch_subscribed_posts$service_provider_post$business<
        TRes>
    implements
        CopyWith$Query$fetch_subscribed_posts$service_provider_post$business<
            TRes> {
  _CopyWithStubImpl$Query$fetch_subscribed_posts$service_provider_post$business(
      this._res);

  TRes _res;

  call({
    Query$fetch_subscribed_posts$service_provider_post$business$details?
        details,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$fetch_subscribed_posts$service_provider_post$business$details<
          TRes>
      get details =>
          CopyWith$Query$fetch_subscribed_posts$service_provider_post$business$details
              .stub(_res);
}

class Query$fetch_subscribed_posts$service_provider_post$business$details {
  Query$fetch_subscribed_posts$service_provider_post$business$details({
    required this.name,
    required this.image,
    required this.$__typename,
  });

  factory Query$fetch_subscribed_posts$service_provider_post$business$details.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Query$fetch_subscribed_posts$service_provider_post$business$details(
      name: (l$name as String),
      image: (l$image as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String name;

  final String image;

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
            is Query$fetch_subscribed_posts$service_provider_post$business$details) ||
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

extension UtilityExtension$Query$fetch_subscribed_posts$service_provider_post$business$details
    on Query$fetch_subscribed_posts$service_provider_post$business$details {
  CopyWith$Query$fetch_subscribed_posts$service_provider_post$business$details<
          Query$fetch_subscribed_posts$service_provider_post$business$details>
      get copyWith =>
          CopyWith$Query$fetch_subscribed_posts$service_provider_post$business$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$fetch_subscribed_posts$service_provider_post$business$details<
    TRes> {
  factory CopyWith$Query$fetch_subscribed_posts$service_provider_post$business$details(
    Query$fetch_subscribed_posts$service_provider_post$business$details
        instance,
    TRes Function(
            Query$fetch_subscribed_posts$service_provider_post$business$details)
        then,
  ) = _CopyWithImpl$Query$fetch_subscribed_posts$service_provider_post$business$details;

  factory CopyWith$Query$fetch_subscribed_posts$service_provider_post$business$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$fetch_subscribed_posts$service_provider_post$business$details;

  TRes call({
    String? name,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$fetch_subscribed_posts$service_provider_post$business$details<
        TRes>
    implements
        CopyWith$Query$fetch_subscribed_posts$service_provider_post$business$details<
            TRes> {
  _CopyWithImpl$Query$fetch_subscribed_posts$service_provider_post$business$details(
    this._instance,
    this._then,
  );

  final Query$fetch_subscribed_posts$service_provider_post$business$details
      _instance;

  final TRes Function(
          Query$fetch_subscribed_posts$service_provider_post$business$details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$fetch_subscribed_posts$service_provider_post$business$details(
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$fetch_subscribed_posts$service_provider_post$business$details<
        TRes>
    implements
        CopyWith$Query$fetch_subscribed_posts$service_provider_post$business$details<
            TRes> {
  _CopyWithStubImpl$Query$fetch_subscribed_posts$service_provider_post$business$details(
      this._res);

  TRes _res;

  call({
    String? name,
    String? image,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$fetch_service_provider_posts {
  factory Variables$Query$fetch_service_provider_posts({
    int? service_provider_id,
    String? service_provider_type,
    int? limit,
    int? offset,
    Input$String_comparison_exp? image,
  }) =>
      Variables$Query$fetch_service_provider_posts._({
        if (service_provider_id != null)
          r'service_provider_id': service_provider_id,
        if (service_provider_type != null)
          r'service_provider_type': service_provider_type,
        if (limit != null) r'limit': limit,
        if (offset != null) r'offset': offset,
        if (image != null) r'image': image,
      });

  Variables$Query$fetch_service_provider_posts._(this._$data);

  factory Variables$Query$fetch_service_provider_posts.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('service_provider_id')) {
      final l$service_provider_id = data['service_provider_id'];
      result$data['service_provider_id'] = (l$service_provider_id as int?);
    }
    if (data.containsKey('service_provider_type')) {
      final l$service_provider_type = data['service_provider_type'];
      result$data['service_provider_type'] =
          (l$service_provider_type as String?);
    }
    if (data.containsKey('limit')) {
      final l$limit = data['limit'];
      result$data['limit'] = (l$limit as int?);
    }
    if (data.containsKey('offset')) {
      final l$offset = data['offset'];
      result$data['offset'] = (l$offset as int?);
    }
    if (data.containsKey('image')) {
      final l$image = data['image'];
      result$data['image'] = l$image == null
          ? null
          : Input$String_comparison_exp.fromJson(
              (l$image as Map<String, dynamic>));
    }
    return Variables$Query$fetch_service_provider_posts._(result$data);
  }

  Map<String, dynamic> _$data;

  int? get service_provider_id => (_$data['service_provider_id'] as int?);
  String? get service_provider_type =>
      (_$data['service_provider_type'] as String?);
  int? get limit => (_$data['limit'] as int?);
  int? get offset => (_$data['offset'] as int?);
  Input$String_comparison_exp? get image =>
      (_$data['image'] as Input$String_comparison_exp?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('service_provider_id')) {
      final l$service_provider_id = service_provider_id;
      result$data['service_provider_id'] = l$service_provider_id;
    }
    if (_$data.containsKey('service_provider_type')) {
      final l$service_provider_type = service_provider_type;
      result$data['service_provider_type'] = l$service_provider_type;
    }
    if (_$data.containsKey('limit')) {
      final l$limit = limit;
      result$data['limit'] = l$limit;
    }
    if (_$data.containsKey('offset')) {
      final l$offset = offset;
      result$data['offset'] = l$offset;
    }
    if (_$data.containsKey('image')) {
      final l$image = image;
      result$data['image'] = l$image?.toJson();
    }
    return result$data;
  }

  CopyWith$Variables$Query$fetch_service_provider_posts<
          Variables$Query$fetch_service_provider_posts>
      get copyWith => CopyWith$Variables$Query$fetch_service_provider_posts(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$fetch_service_provider_posts) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$service_provider_id = service_provider_id;
    final lOther$service_provider_id = other.service_provider_id;
    if (_$data.containsKey('service_provider_id') !=
        other._$data.containsKey('service_provider_id')) {
      return false;
    }
    if (l$service_provider_id != lOther$service_provider_id) {
      return false;
    }
    final l$service_provider_type = service_provider_type;
    final lOther$service_provider_type = other.service_provider_type;
    if (_$data.containsKey('service_provider_type') !=
        other._$data.containsKey('service_provider_type')) {
      return false;
    }
    if (l$service_provider_type != lOther$service_provider_type) {
      return false;
    }
    final l$limit = limit;
    final lOther$limit = other.limit;
    if (_$data.containsKey('limit') != other._$data.containsKey('limit')) {
      return false;
    }
    if (l$limit != lOther$limit) {
      return false;
    }
    final l$offset = offset;
    final lOther$offset = other.offset;
    if (_$data.containsKey('offset') != other._$data.containsKey('offset')) {
      return false;
    }
    if (l$offset != lOther$offset) {
      return false;
    }
    final l$image = image;
    final lOther$image = other.image;
    if (_$data.containsKey('image') != other._$data.containsKey('image')) {
      return false;
    }
    if (l$image != lOther$image) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$service_provider_id = service_provider_id;
    final l$service_provider_type = service_provider_type;
    final l$limit = limit;
    final l$offset = offset;
    final l$image = image;
    return Object.hashAll([
      _$data.containsKey('service_provider_id')
          ? l$service_provider_id
          : const {},
      _$data.containsKey('service_provider_type')
          ? l$service_provider_type
          : const {},
      _$data.containsKey('limit') ? l$limit : const {},
      _$data.containsKey('offset') ? l$offset : const {},
      _$data.containsKey('image') ? l$image : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$fetch_service_provider_posts<TRes> {
  factory CopyWith$Variables$Query$fetch_service_provider_posts(
    Variables$Query$fetch_service_provider_posts instance,
    TRes Function(Variables$Query$fetch_service_provider_posts) then,
  ) = _CopyWithImpl$Variables$Query$fetch_service_provider_posts;

  factory CopyWith$Variables$Query$fetch_service_provider_posts.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$fetch_service_provider_posts;

  TRes call({
    int? service_provider_id,
    String? service_provider_type,
    int? limit,
    int? offset,
    Input$String_comparison_exp? image,
  });
}

class _CopyWithImpl$Variables$Query$fetch_service_provider_posts<TRes>
    implements CopyWith$Variables$Query$fetch_service_provider_posts<TRes> {
  _CopyWithImpl$Variables$Query$fetch_service_provider_posts(
    this._instance,
    this._then,
  );

  final Variables$Query$fetch_service_provider_posts _instance;

  final TRes Function(Variables$Query$fetch_service_provider_posts) _then;

  static const _undefined = {};

  TRes call({
    Object? service_provider_id = _undefined,
    Object? service_provider_type = _undefined,
    Object? limit = _undefined,
    Object? offset = _undefined,
    Object? image = _undefined,
  }) =>
      _then(Variables$Query$fetch_service_provider_posts._({
        ..._instance._$data,
        if (service_provider_id != _undefined)
          'service_provider_id': (service_provider_id as int?),
        if (service_provider_type != _undefined)
          'service_provider_type': (service_provider_type as String?),
        if (limit != _undefined) 'limit': (limit as int?),
        if (offset != _undefined) 'offset': (offset as int?),
        if (image != _undefined)
          'image': (image as Input$String_comparison_exp?),
      }));
}

class _CopyWithStubImpl$Variables$Query$fetch_service_provider_posts<TRes>
    implements CopyWith$Variables$Query$fetch_service_provider_posts<TRes> {
  _CopyWithStubImpl$Variables$Query$fetch_service_provider_posts(this._res);

  TRes _res;

  call({
    int? service_provider_id,
    String? service_provider_type,
    int? limit,
    int? offset,
    Input$String_comparison_exp? image,
  }) =>
      _res;
}

class Query$fetch_service_provider_posts {
  Query$fetch_service_provider_posts({
    required this.service_provider_post,
    required this.$__typename,
  });

  factory Query$fetch_service_provider_posts.fromJson(
      Map<String, dynamic> json) {
    final l$service_provider_post = json['service_provider_post'];
    final l$$__typename = json['__typename'];
    return Query$fetch_service_provider_posts(
      service_provider_post: (l$service_provider_post as List<dynamic>)
          .map((e) =>
              Query$fetch_service_provider_posts$service_provider_post.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$fetch_service_provider_posts$service_provider_post>
      service_provider_post;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$service_provider_post = service_provider_post;
    _resultData['service_provider_post'] =
        l$service_provider_post.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$service_provider_post = service_provider_post;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$service_provider_post.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$fetch_service_provider_posts) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$service_provider_post = service_provider_post;
    final lOther$service_provider_post = other.service_provider_post;
    if (l$service_provider_post.length != lOther$service_provider_post.length) {
      return false;
    }
    for (int i = 0; i < l$service_provider_post.length; i++) {
      final l$service_provider_post$entry = l$service_provider_post[i];
      final lOther$service_provider_post$entry =
          lOther$service_provider_post[i];
      if (l$service_provider_post$entry != lOther$service_provider_post$entry) {
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

extension UtilityExtension$Query$fetch_service_provider_posts
    on Query$fetch_service_provider_posts {
  CopyWith$Query$fetch_service_provider_posts<
          Query$fetch_service_provider_posts>
      get copyWith => CopyWith$Query$fetch_service_provider_posts(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$fetch_service_provider_posts<TRes> {
  factory CopyWith$Query$fetch_service_provider_posts(
    Query$fetch_service_provider_posts instance,
    TRes Function(Query$fetch_service_provider_posts) then,
  ) = _CopyWithImpl$Query$fetch_service_provider_posts;

  factory CopyWith$Query$fetch_service_provider_posts.stub(TRes res) =
      _CopyWithStubImpl$Query$fetch_service_provider_posts;

  TRes call({
    List<Query$fetch_service_provider_posts$service_provider_post>?
        service_provider_post,
    String? $__typename,
  });
  TRes service_provider_post(
      Iterable<Query$fetch_service_provider_posts$service_provider_post> Function(
              Iterable<
                  CopyWith$Query$fetch_service_provider_posts$service_provider_post<
                      Query$fetch_service_provider_posts$service_provider_post>>)
          _fn);
}

class _CopyWithImpl$Query$fetch_service_provider_posts<TRes>
    implements CopyWith$Query$fetch_service_provider_posts<TRes> {
  _CopyWithImpl$Query$fetch_service_provider_posts(
    this._instance,
    this._then,
  );

  final Query$fetch_service_provider_posts _instance;

  final TRes Function(Query$fetch_service_provider_posts) _then;

  static const _undefined = {};

  TRes call({
    Object? service_provider_post = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$fetch_service_provider_posts(
        service_provider_post:
            service_provider_post == _undefined || service_provider_post == null
                ? _instance.service_provider_post
                : (service_provider_post as List<
                    Query$fetch_service_provider_posts$service_provider_post>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes service_provider_post(
          Iterable<Query$fetch_service_provider_posts$service_provider_post> Function(
                  Iterable<
                      CopyWith$Query$fetch_service_provider_posts$service_provider_post<
                          Query$fetch_service_provider_posts$service_provider_post>>)
              _fn) =>
      call(
          service_provider_post: _fn(_instance.service_provider_post.map((e) =>
              CopyWith$Query$fetch_service_provider_posts$service_provider_post(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$fetch_service_provider_posts<TRes>
    implements CopyWith$Query$fetch_service_provider_posts<TRes> {
  _CopyWithStubImpl$Query$fetch_service_provider_posts(this._res);

  TRes _res;

  call({
    List<Query$fetch_service_provider_posts$service_provider_post>?
        service_provider_post,
    String? $__typename,
  }) =>
      _res;
  service_provider_post(_fn) => _res;
}

const documentNodeQueryfetch_service_provider_posts =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'fetch_service_provider_posts'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'service_provider_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'service_provider_type')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'limit')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'offset')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'image')),
        type: NamedTypeNode(
          name: NameNode(value: 'String_comparison_exp'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: ObjectValueNode(fields: [])),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'service_provider_post'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'service_provider_id'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(
                        name: NameNode(value: 'service_provider_id')),
                  )
                ]),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'service_provider_type'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(
                        name: NameNode(value: 'service_provider_type')),
                  )
                ]),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'image'),
                value: VariableNode(name: NameNode(value: 'image')),
              ),
            ]),
          ),
          ArgumentNode(
            name: NameNode(value: 'limit'),
            value: VariableNode(name: NameNode(value: 'limit')),
          ),
          ArgumentNode(
            name: NameNode(value: 'offset'),
            value: VariableNode(name: NameNode(value: 'offset')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'comments'),
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
                name: NameNode(value: 'message'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'likes'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'commented_on'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
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
            name: NameNode(value: 'likes'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'message'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'link'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'posted_on'),
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
Query$fetch_service_provider_posts _parserFn$Query$fetch_service_provider_posts(
        Map<String, dynamic> data) =>
    Query$fetch_service_provider_posts.fromJson(data);

class Options$Query$fetch_service_provider_posts
    extends graphql.QueryOptions<Query$fetch_service_provider_posts> {
  Options$Query$fetch_service_provider_posts({
    String? operationName,
    Variables$Query$fetch_service_provider_posts? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
  }) : super(
          variables: variables?.toJson() ?? {},
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          pollInterval: pollInterval,
          context: context,
          document: documentNodeQueryfetch_service_provider_posts,
          parserFn: _parserFn$Query$fetch_service_provider_posts,
        );
}

class WatchOptions$Query$fetch_service_provider_posts
    extends graphql.WatchQueryOptions<Query$fetch_service_provider_posts> {
  WatchOptions$Query$fetch_service_provider_posts({
    String? operationName,
    Variables$Query$fetch_service_provider_posts? variables,
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
          variables: variables?.toJson() ?? {},
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          context: context,
          document: documentNodeQueryfetch_service_provider_posts,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$fetch_service_provider_posts,
        );
}

class FetchMoreOptions$Query$fetch_service_provider_posts
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$fetch_service_provider_posts({
    required graphql.UpdateQuery updateQuery,
    Variables$Query$fetch_service_provider_posts? variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables?.toJson() ?? {},
          document: documentNodeQueryfetch_service_provider_posts,
        );
}

extension ClientExtension$Query$fetch_service_provider_posts
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$fetch_service_provider_posts>>
      query$fetch_service_provider_posts(
              [Options$Query$fetch_service_provider_posts? options]) async =>
          await this
              .query(options ?? Options$Query$fetch_service_provider_posts());
  graphql.ObservableQuery<Query$fetch_service_provider_posts>
      watchQuery$fetch_service_provider_posts(
              [WatchOptions$Query$fetch_service_provider_posts? options]) =>
          this.watchQuery(
              options ?? WatchOptions$Query$fetch_service_provider_posts());
  void writeQuery$fetch_service_provider_posts({
    required Query$fetch_service_provider_posts data,
    Variables$Query$fetch_service_provider_posts? variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryfetch_service_provider_posts),
          variables: variables?.toJson() ?? const {},
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$fetch_service_provider_posts? readQuery$fetch_service_provider_posts({
    Variables$Query$fetch_service_provider_posts? variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQueryfetch_service_provider_posts),
        variables: variables?.toJson() ?? const {},
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$fetch_service_provider_posts.fromJson(result);
  }
}

class Query$fetch_service_provider_posts$service_provider_post {
  Query$fetch_service_provider_posts$service_provider_post({
    required this.comments,
    required this.id,
    this.image,
    required this.likes,
    required this.message,
    this.link,
    required this.posted_on,
    required this.$__typename,
  });

  factory Query$fetch_service_provider_posts$service_provider_post.fromJson(
      Map<String, dynamic> json) {
    final l$comments = json['comments'];
    final l$id = json['id'];
    final l$image = json['image'];
    final l$likes = json['likes'];
    final l$message = json['message'];
    final l$link = json['link'];
    final l$posted_on = json['posted_on'];
    final l$$__typename = json['__typename'];
    return Query$fetch_service_provider_posts$service_provider_post(
      comments: (l$comments as List<dynamic>)
          .map((e) =>
              Query$fetch_service_provider_posts$service_provider_post$comments
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      id: (l$id as int),
      image: (l$image as String?),
      likes: mapFromJson(l$likes),
      message: (l$message as String),
      link: (l$link as String?),
      posted_on: (l$posted_on as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$fetch_service_provider_posts$service_provider_post$comments>
      comments;

  final int id;

  final String? image;

  final dynamic likes;

  final String message;

  final String? link;

  final String posted_on;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$comments = comments;
    _resultData['comments'] = l$comments.map((e) => e.toJson()).toList();
    final l$id = id;
    _resultData['id'] = l$id;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$likes = likes;
    _resultData['likes'] = mapToJson(l$likes);
    final l$message = message;
    _resultData['message'] = l$message;
    final l$link = link;
    _resultData['link'] = l$link;
    final l$posted_on = posted_on;
    _resultData['posted_on'] = l$posted_on;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$comments = comments;
    final l$id = id;
    final l$image = image;
    final l$likes = likes;
    final l$message = message;
    final l$link = link;
    final l$posted_on = posted_on;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$comments.map((v) => v)),
      l$id,
      l$image,
      l$likes,
      l$message,
      l$link,
      l$posted_on,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$fetch_service_provider_posts$service_provider_post) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$comments = comments;
    final lOther$comments = other.comments;
    if (l$comments.length != lOther$comments.length) {
      return false;
    }
    for (int i = 0; i < l$comments.length; i++) {
      final l$comments$entry = l$comments[i];
      final lOther$comments$entry = lOther$comments[i];
      if (l$comments$entry != lOther$comments$entry) {
        return false;
      }
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
    final l$likes = likes;
    final lOther$likes = other.likes;
    if (l$likes != lOther$likes) {
      return false;
    }
    final l$message = message;
    final lOther$message = other.message;
    if (l$message != lOther$message) {
      return false;
    }
    final l$link = link;
    final lOther$link = other.link;
    if (l$link != lOther$link) {
      return false;
    }
    final l$posted_on = posted_on;
    final lOther$posted_on = other.posted_on;
    if (l$posted_on != lOther$posted_on) {
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

extension UtilityExtension$Query$fetch_service_provider_posts$service_provider_post
    on Query$fetch_service_provider_posts$service_provider_post {
  CopyWith$Query$fetch_service_provider_posts$service_provider_post<
          Query$fetch_service_provider_posts$service_provider_post>
      get copyWith =>
          CopyWith$Query$fetch_service_provider_posts$service_provider_post(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$fetch_service_provider_posts$service_provider_post<
    TRes> {
  factory CopyWith$Query$fetch_service_provider_posts$service_provider_post(
    Query$fetch_service_provider_posts$service_provider_post instance,
    TRes Function(Query$fetch_service_provider_posts$service_provider_post)
        then,
  ) = _CopyWithImpl$Query$fetch_service_provider_posts$service_provider_post;

  factory CopyWith$Query$fetch_service_provider_posts$service_provider_post.stub(
          TRes res) =
      _CopyWithStubImpl$Query$fetch_service_provider_posts$service_provider_post;

  TRes call({
    List<Query$fetch_service_provider_posts$service_provider_post$comments>?
        comments,
    int? id,
    String? image,
    dynamic? likes,
    String? message,
    String? link,
    String? posted_on,
    String? $__typename,
  });
  TRes comments(
      Iterable<Query$fetch_service_provider_posts$service_provider_post$comments> Function(
              Iterable<
                  CopyWith$Query$fetch_service_provider_posts$service_provider_post$comments<
                      Query$fetch_service_provider_posts$service_provider_post$comments>>)
          _fn);
}

class _CopyWithImpl$Query$fetch_service_provider_posts$service_provider_post<
        TRes>
    implements
        CopyWith$Query$fetch_service_provider_posts$service_provider_post<
            TRes> {
  _CopyWithImpl$Query$fetch_service_provider_posts$service_provider_post(
    this._instance,
    this._then,
  );

  final Query$fetch_service_provider_posts$service_provider_post _instance;

  final TRes Function(Query$fetch_service_provider_posts$service_provider_post)
      _then;

  static const _undefined = {};

  TRes call({
    Object? comments = _undefined,
    Object? id = _undefined,
    Object? image = _undefined,
    Object? likes = _undefined,
    Object? message = _undefined,
    Object? link = _undefined,
    Object? posted_on = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$fetch_service_provider_posts$service_provider_post(
        comments: comments == _undefined || comments == null
            ? _instance.comments
            : (comments as List<
                Query$fetch_service_provider_posts$service_provider_post$comments>),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        image: image == _undefined ? _instance.image : (image as String?),
        likes: likes == _undefined || likes == null
            ? _instance.likes
            : (likes as dynamic),
        message: message == _undefined || message == null
            ? _instance.message
            : (message as String),
        link: link == _undefined ? _instance.link : (link as String?),
        posted_on: posted_on == _undefined || posted_on == null
            ? _instance.posted_on
            : (posted_on as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes comments(
          Iterable<Query$fetch_service_provider_posts$service_provider_post$comments> Function(
                  Iterable<
                      CopyWith$Query$fetch_service_provider_posts$service_provider_post$comments<
                          Query$fetch_service_provider_posts$service_provider_post$comments>>)
              _fn) =>
      call(
          comments: _fn(_instance.comments.map((e) =>
              CopyWith$Query$fetch_service_provider_posts$service_provider_post$comments(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$fetch_service_provider_posts$service_provider_post<
        TRes>
    implements
        CopyWith$Query$fetch_service_provider_posts$service_provider_post<
            TRes> {
  _CopyWithStubImpl$Query$fetch_service_provider_posts$service_provider_post(
      this._res);

  TRes _res;

  call({
    List<Query$fetch_service_provider_posts$service_provider_post$comments>?
        comments,
    int? id,
    String? image,
    dynamic? likes,
    String? message,
    String? link,
    String? posted_on,
    String? $__typename,
  }) =>
      _res;
  comments(_fn) => _res;
}

class Query$fetch_service_provider_posts$service_provider_post$comments {
  Query$fetch_service_provider_posts$service_provider_post$comments({
    required this.id,
    required this.message,
    required this.likes,
    required this.commented_on,
    required this.user,
    required this.$__typename,
  });

  factory Query$fetch_service_provider_posts$service_provider_post$comments.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$message = json['message'];
    final l$likes = json['likes'];
    final l$commented_on = json['commented_on'];
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Query$fetch_service_provider_posts$service_provider_post$comments(
      id: (l$id as int),
      message: (l$message as String),
      likes: mapFromJson(l$likes),
      commented_on: (l$commented_on as String),
      user:
          Query$fetch_service_provider_posts$service_provider_post$comments$user
              .fromJson((l$user as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String message;

  final dynamic likes;

  final String commented_on;

  final Query$fetch_service_provider_posts$service_provider_post$comments$user
      user;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$message = message;
    _resultData['message'] = l$message;
    final l$likes = likes;
    _resultData['likes'] = mapToJson(l$likes);
    final l$commented_on = commented_on;
    _resultData['commented_on'] = l$commented_on;
    final l$user = user;
    _resultData['user'] = l$user.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$message = message;
    final l$likes = likes;
    final l$commented_on = commented_on;
    final l$user = user;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$message,
      l$likes,
      l$commented_on,
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
            is Query$fetch_service_provider_posts$service_provider_post$comments) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$message = message;
    final lOther$message = other.message;
    if (l$message != lOther$message) {
      return false;
    }
    final l$likes = likes;
    final lOther$likes = other.likes;
    if (l$likes != lOther$likes) {
      return false;
    }
    final l$commented_on = commented_on;
    final lOther$commented_on = other.commented_on;
    if (l$commented_on != lOther$commented_on) {
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

extension UtilityExtension$Query$fetch_service_provider_posts$service_provider_post$comments
    on Query$fetch_service_provider_posts$service_provider_post$comments {
  CopyWith$Query$fetch_service_provider_posts$service_provider_post$comments<
          Query$fetch_service_provider_posts$service_provider_post$comments>
      get copyWith =>
          CopyWith$Query$fetch_service_provider_posts$service_provider_post$comments(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$fetch_service_provider_posts$service_provider_post$comments<
    TRes> {
  factory CopyWith$Query$fetch_service_provider_posts$service_provider_post$comments(
    Query$fetch_service_provider_posts$service_provider_post$comments instance,
    TRes Function(
            Query$fetch_service_provider_posts$service_provider_post$comments)
        then,
  ) = _CopyWithImpl$Query$fetch_service_provider_posts$service_provider_post$comments;

  factory CopyWith$Query$fetch_service_provider_posts$service_provider_post$comments.stub(
          TRes res) =
      _CopyWithStubImpl$Query$fetch_service_provider_posts$service_provider_post$comments;

  TRes call({
    int? id,
    String? message,
    dynamic? likes,
    String? commented_on,
    Query$fetch_service_provider_posts$service_provider_post$comments$user?
        user,
    String? $__typename,
  });
  CopyWith$Query$fetch_service_provider_posts$service_provider_post$comments$user<
      TRes> get user;
}

class _CopyWithImpl$Query$fetch_service_provider_posts$service_provider_post$comments<
        TRes>
    implements
        CopyWith$Query$fetch_service_provider_posts$service_provider_post$comments<
            TRes> {
  _CopyWithImpl$Query$fetch_service_provider_posts$service_provider_post$comments(
    this._instance,
    this._then,
  );

  final Query$fetch_service_provider_posts$service_provider_post$comments
      _instance;

  final TRes Function(
      Query$fetch_service_provider_posts$service_provider_post$comments) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? message = _undefined,
    Object? likes = _undefined,
    Object? commented_on = _undefined,
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$fetch_service_provider_posts$service_provider_post$comments(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        message: message == _undefined || message == null
            ? _instance.message
            : (message as String),
        likes: likes == _undefined || likes == null
            ? _instance.likes
            : (likes as dynamic),
        commented_on: commented_on == _undefined || commented_on == null
            ? _instance.commented_on
            : (commented_on as String),
        user: user == _undefined || user == null
            ? _instance.user
            : (user
                as Query$fetch_service_provider_posts$service_provider_post$comments$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$fetch_service_provider_posts$service_provider_post$comments$user<
      TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Query$fetch_service_provider_posts$service_provider_post$comments$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Query$fetch_service_provider_posts$service_provider_post$comments<
        TRes>
    implements
        CopyWith$Query$fetch_service_provider_posts$service_provider_post$comments<
            TRes> {
  _CopyWithStubImpl$Query$fetch_service_provider_posts$service_provider_post$comments(
      this._res);

  TRes _res;

  call({
    int? id,
    String? message,
    dynamic? likes,
    String? commented_on,
    Query$fetch_service_provider_posts$service_provider_post$comments$user?
        user,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$fetch_service_provider_posts$service_provider_post$comments$user<
          TRes>
      get user =>
          CopyWith$Query$fetch_service_provider_posts$service_provider_post$comments$user
              .stub(_res);
}

class Query$fetch_service_provider_posts$service_provider_post$comments$user {
  Query$fetch_service_provider_posts$service_provider_post$comments$user({
    required this.id,
    this.name,
    this.image,
    required this.$__typename,
  });

  factory Query$fetch_service_provider_posts$service_provider_post$comments$user.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Query$fetch_service_provider_posts$service_provider_post$comments$user(
      id: (l$id as int),
      name: (l$name as String?),
      image: (l$image as String?),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String? name;

  final String? image;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
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
    final l$id = id;
    final l$name = name;
    final l$image = image;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
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
            is Query$fetch_service_provider_posts$service_provider_post$comments$user) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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

extension UtilityExtension$Query$fetch_service_provider_posts$service_provider_post$comments$user
    on Query$fetch_service_provider_posts$service_provider_post$comments$user {
  CopyWith$Query$fetch_service_provider_posts$service_provider_post$comments$user<
          Query$fetch_service_provider_posts$service_provider_post$comments$user>
      get copyWith =>
          CopyWith$Query$fetch_service_provider_posts$service_provider_post$comments$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$fetch_service_provider_posts$service_provider_post$comments$user<
    TRes> {
  factory CopyWith$Query$fetch_service_provider_posts$service_provider_post$comments$user(
    Query$fetch_service_provider_posts$service_provider_post$comments$user
        instance,
    TRes Function(
            Query$fetch_service_provider_posts$service_provider_post$comments$user)
        then,
  ) = _CopyWithImpl$Query$fetch_service_provider_posts$service_provider_post$comments$user;

  factory CopyWith$Query$fetch_service_provider_posts$service_provider_post$comments$user.stub(
          TRes res) =
      _CopyWithStubImpl$Query$fetch_service_provider_posts$service_provider_post$comments$user;

  TRes call({
    int? id,
    String? name,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$fetch_service_provider_posts$service_provider_post$comments$user<
        TRes>
    implements
        CopyWith$Query$fetch_service_provider_posts$service_provider_post$comments$user<
            TRes> {
  _CopyWithImpl$Query$fetch_service_provider_posts$service_provider_post$comments$user(
    this._instance,
    this._then,
  );

  final Query$fetch_service_provider_posts$service_provider_post$comments$user
      _instance;

  final TRes Function(
          Query$fetch_service_provider_posts$service_provider_post$comments$user)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$fetch_service_provider_posts$service_provider_post$comments$user(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined ? _instance.name : (name as String?),
        image: image == _undefined ? _instance.image : (image as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$fetch_service_provider_posts$service_provider_post$comments$user<
        TRes>
    implements
        CopyWith$Query$fetch_service_provider_posts$service_provider_post$comments$user<
            TRes> {
  _CopyWithStubImpl$Query$fetch_service_provider_posts$service_provider_post$comments$user(
      this._res);

  TRes _res;

  call({
    int? id,
    String? name,
    String? image,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$fetch_posts_within_distance {
  factory Variables$Query$fetch_posts_within_distance({
    int? limit,
    int? offset,
    required Geography from,
    required double distance,
  }) =>
      Variables$Query$fetch_posts_within_distance._({
        if (limit != null) r'limit': limit,
        if (offset != null) r'offset': offset,
        r'from': from,
        r'distance': distance,
      });

  Variables$Query$fetch_posts_within_distance._(this._$data);

  factory Variables$Query$fetch_posts_within_distance.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('limit')) {
      final l$limit = data['limit'];
      result$data['limit'] = (l$limit as int?);
    }
    if (data.containsKey('offset')) {
      final l$offset = data['offset'];
      result$data['offset'] = (l$offset as int?);
    }
    final l$from = data['from'];
    result$data['from'] = geographyFromJson(l$from);
    final l$distance = data['distance'];
    result$data['distance'] = (l$distance as num).toDouble();
    return Variables$Query$fetch_posts_within_distance._(result$data);
  }

  Map<String, dynamic> _$data;

  int? get limit => (_$data['limit'] as int?);
  int? get offset => (_$data['offset'] as int?);
  Geography get from => (_$data['from'] as Geography);
  double get distance => (_$data['distance'] as double);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('limit')) {
      final l$limit = limit;
      result$data['limit'] = l$limit;
    }
    if (_$data.containsKey('offset')) {
      final l$offset = offset;
      result$data['offset'] = l$offset;
    }
    final l$from = from;
    result$data['from'] = geographyToJson(l$from);
    final l$distance = distance;
    result$data['distance'] = l$distance;
    return result$data;
  }

  CopyWith$Variables$Query$fetch_posts_within_distance<
          Variables$Query$fetch_posts_within_distance>
      get copyWith => CopyWith$Variables$Query$fetch_posts_within_distance(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$fetch_posts_within_distance) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$limit = limit;
    final lOther$limit = other.limit;
    if (_$data.containsKey('limit') != other._$data.containsKey('limit')) {
      return false;
    }
    if (l$limit != lOther$limit) {
      return false;
    }
    final l$offset = offset;
    final lOther$offset = other.offset;
    if (_$data.containsKey('offset') != other._$data.containsKey('offset')) {
      return false;
    }
    if (l$offset != lOther$offset) {
      return false;
    }
    final l$from = from;
    final lOther$from = other.from;
    if (l$from != lOther$from) {
      return false;
    }
    final l$distance = distance;
    final lOther$distance = other.distance;
    if (l$distance != lOther$distance) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$limit = limit;
    final l$offset = offset;
    final l$from = from;
    final l$distance = distance;
    return Object.hashAll([
      _$data.containsKey('limit') ? l$limit : const {},
      _$data.containsKey('offset') ? l$offset : const {},
      l$from,
      l$distance,
    ]);
  }
}

abstract class CopyWith$Variables$Query$fetch_posts_within_distance<TRes> {
  factory CopyWith$Variables$Query$fetch_posts_within_distance(
    Variables$Query$fetch_posts_within_distance instance,
    TRes Function(Variables$Query$fetch_posts_within_distance) then,
  ) = _CopyWithImpl$Variables$Query$fetch_posts_within_distance;

  factory CopyWith$Variables$Query$fetch_posts_within_distance.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$fetch_posts_within_distance;

  TRes call({
    int? limit,
    int? offset,
    Geography? from,
    double? distance,
  });
}

class _CopyWithImpl$Variables$Query$fetch_posts_within_distance<TRes>
    implements CopyWith$Variables$Query$fetch_posts_within_distance<TRes> {
  _CopyWithImpl$Variables$Query$fetch_posts_within_distance(
    this._instance,
    this._then,
  );

  final Variables$Query$fetch_posts_within_distance _instance;

  final TRes Function(Variables$Query$fetch_posts_within_distance) _then;

  static const _undefined = {};

  TRes call({
    Object? limit = _undefined,
    Object? offset = _undefined,
    Object? from = _undefined,
    Object? distance = _undefined,
  }) =>
      _then(Variables$Query$fetch_posts_within_distance._({
        ..._instance._$data,
        if (limit != _undefined) 'limit': (limit as int?),
        if (offset != _undefined) 'offset': (offset as int?),
        if (from != _undefined && from != null) 'from': (from as Geography),
        if (distance != _undefined && distance != null)
          'distance': (distance as double),
      }));
}

class _CopyWithStubImpl$Variables$Query$fetch_posts_within_distance<TRes>
    implements CopyWith$Variables$Query$fetch_posts_within_distance<TRes> {
  _CopyWithStubImpl$Variables$Query$fetch_posts_within_distance(this._res);

  TRes _res;

  call({
    int? limit,
    int? offset,
    Geography? from,
    double? distance,
  }) =>
      _res;
}

class Query$fetch_posts_within_distance {
  Query$fetch_posts_within_distance({
    required this.service_provider_post,
    required this.$__typename,
  });

  factory Query$fetch_posts_within_distance.fromJson(
      Map<String, dynamic> json) {
    final l$service_provider_post = json['service_provider_post'];
    final l$$__typename = json['__typename'];
    return Query$fetch_posts_within_distance(
      service_provider_post: (l$service_provider_post as List<dynamic>)
          .map((e) =>
              Query$fetch_posts_within_distance$service_provider_post.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$fetch_posts_within_distance$service_provider_post>
      service_provider_post;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$service_provider_post = service_provider_post;
    _resultData['service_provider_post'] =
        l$service_provider_post.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$service_provider_post = service_provider_post;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$service_provider_post.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$fetch_posts_within_distance) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$service_provider_post = service_provider_post;
    final lOther$service_provider_post = other.service_provider_post;
    if (l$service_provider_post.length != lOther$service_provider_post.length) {
      return false;
    }
    for (int i = 0; i < l$service_provider_post.length; i++) {
      final l$service_provider_post$entry = l$service_provider_post[i];
      final lOther$service_provider_post$entry =
          lOther$service_provider_post[i];
      if (l$service_provider_post$entry != lOther$service_provider_post$entry) {
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

extension UtilityExtension$Query$fetch_posts_within_distance
    on Query$fetch_posts_within_distance {
  CopyWith$Query$fetch_posts_within_distance<Query$fetch_posts_within_distance>
      get copyWith => CopyWith$Query$fetch_posts_within_distance(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$fetch_posts_within_distance<TRes> {
  factory CopyWith$Query$fetch_posts_within_distance(
    Query$fetch_posts_within_distance instance,
    TRes Function(Query$fetch_posts_within_distance) then,
  ) = _CopyWithImpl$Query$fetch_posts_within_distance;

  factory CopyWith$Query$fetch_posts_within_distance.stub(TRes res) =
      _CopyWithStubImpl$Query$fetch_posts_within_distance;

  TRes call({
    List<Query$fetch_posts_within_distance$service_provider_post>?
        service_provider_post,
    String? $__typename,
  });
  TRes service_provider_post(
      Iterable<Query$fetch_posts_within_distance$service_provider_post> Function(
              Iterable<
                  CopyWith$Query$fetch_posts_within_distance$service_provider_post<
                      Query$fetch_posts_within_distance$service_provider_post>>)
          _fn);
}

class _CopyWithImpl$Query$fetch_posts_within_distance<TRes>
    implements CopyWith$Query$fetch_posts_within_distance<TRes> {
  _CopyWithImpl$Query$fetch_posts_within_distance(
    this._instance,
    this._then,
  );

  final Query$fetch_posts_within_distance _instance;

  final TRes Function(Query$fetch_posts_within_distance) _then;

  static const _undefined = {};

  TRes call({
    Object? service_provider_post = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$fetch_posts_within_distance(
        service_provider_post:
            service_provider_post == _undefined || service_provider_post == null
                ? _instance.service_provider_post
                : (service_provider_post as List<
                    Query$fetch_posts_within_distance$service_provider_post>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes service_provider_post(
          Iterable<Query$fetch_posts_within_distance$service_provider_post> Function(
                  Iterable<
                      CopyWith$Query$fetch_posts_within_distance$service_provider_post<
                          Query$fetch_posts_within_distance$service_provider_post>>)
              _fn) =>
      call(
          service_provider_post: _fn(_instance.service_provider_post.map((e) =>
              CopyWith$Query$fetch_posts_within_distance$service_provider_post(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$fetch_posts_within_distance<TRes>
    implements CopyWith$Query$fetch_posts_within_distance<TRes> {
  _CopyWithStubImpl$Query$fetch_posts_within_distance(this._res);

  TRes _res;

  call({
    List<Query$fetch_posts_within_distance$service_provider_post>?
        service_provider_post,
    String? $__typename,
  }) =>
      _res;
  service_provider_post(_fn) => _res;
}

const documentNodeQueryfetch_posts_within_distance = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'fetch_posts_within_distance'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'limit')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'offset')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'from')),
        type: NamedTypeNode(
          name: NameNode(value: 'geography'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'distance')),
        type: NamedTypeNode(
          name: NameNode(value: 'Float'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'service_provider_post'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'limit'),
            value: VariableNode(name: NameNode(value: 'limit')),
          ),
          ArgumentNode(
            name: NameNode(value: 'offset'),
            value: VariableNode(name: NameNode(value: 'offset')),
          ),
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: '_or'),
                value: ListValueNode(values: [
                  ObjectValueNode(fields: [
                    ObjectFieldNode(
                      name: NameNode(value: 'business'),
                      value: ObjectValueNode(fields: [
                        ObjectFieldNode(
                          name: NameNode(value: 'details'),
                          value: ObjectValueNode(fields: [
                            ObjectFieldNode(
                              name: NameNode(value: 'location'),
                              value: ObjectValueNode(fields: [
                                ObjectFieldNode(
                                  name: NameNode(value: 'gps'),
                                  value: ObjectValueNode(fields: [
                                    ObjectFieldNode(
                                      name: NameNode(value: '_st_d_within'),
                                      value: ObjectValueNode(fields: [
                                        ObjectFieldNode(
                                          name: NameNode(value: 'distance'),
                                          value: VariableNode(
                                              name:
                                                  NameNode(value: 'distance')),
                                        ),
                                        ObjectFieldNode(
                                          name: NameNode(value: 'from'),
                                          value: VariableNode(
                                              name: NameNode(value: 'from')),
                                        ),
                                      ]),
                                    )
                                  ]),
                                )
                              ]),
                            )
                          ]),
                        )
                      ]),
                    )
                  ]),
                  ObjectValueNode(fields: [
                    ObjectFieldNode(
                      name: NameNode(value: 'laundry'),
                      value: ObjectValueNode(fields: [
                        ObjectFieldNode(
                          name: NameNode(value: 'details'),
                          value: ObjectValueNode(fields: [
                            ObjectFieldNode(
                              name: NameNode(value: 'location'),
                              value: ObjectValueNode(fields: [
                                ObjectFieldNode(
                                  name: NameNode(value: 'gps'),
                                  value: ObjectValueNode(fields: [
                                    ObjectFieldNode(
                                      name: NameNode(value: '_st_d_within'),
                                      value: ObjectValueNode(fields: [
                                        ObjectFieldNode(
                                          name: NameNode(value: 'distance'),
                                          value: VariableNode(
                                              name:
                                                  NameNode(value: 'distance')),
                                        ),
                                        ObjectFieldNode(
                                          name: NameNode(value: 'from'),
                                          value: VariableNode(
                                              name: NameNode(value: 'from')),
                                        ),
                                      ]),
                                    )
                                  ]),
                                )
                              ]),
                            )
                          ]),
                        )
                      ]),
                    )
                  ]),
                  ObjectValueNode(fields: [
                    ObjectFieldNode(
                      name: NameNode(value: 'delivery_company'),
                      value: ObjectValueNode(fields: [
                        ObjectFieldNode(
                          name: NameNode(value: 'details'),
                          value: ObjectValueNode(fields: [
                            ObjectFieldNode(
                              name: NameNode(value: 'location'),
                              value: ObjectValueNode(fields: [
                                ObjectFieldNode(
                                  name: NameNode(value: 'gps'),
                                  value: ObjectValueNode(fields: [
                                    ObjectFieldNode(
                                      name: NameNode(value: '_st_d_within'),
                                      value: ObjectValueNode(fields: [
                                        ObjectFieldNode(
                                          name: NameNode(value: 'distance'),
                                          value: VariableNode(
                                              name:
                                                  NameNode(value: 'distance')),
                                        ),
                                        ObjectFieldNode(
                                          name: NameNode(value: 'from'),
                                          value: VariableNode(
                                              name: NameNode(value: 'from')),
                                        ),
                                      ]),
                                    )
                                  ]),
                                )
                              ]),
                            )
                          ]),
                        )
                      ]),
                    )
                  ]),
                  ObjectValueNode(fields: [
                    ObjectFieldNode(
                      name: NameNode(value: 'restaurant'),
                      value: ObjectValueNode(fields: [
                        ObjectFieldNode(
                          name: NameNode(value: 'details'),
                          value: ObjectValueNode(fields: [
                            ObjectFieldNode(
                              name: NameNode(value: 'location'),
                              value: ObjectValueNode(fields: [
                                ObjectFieldNode(
                                  name: NameNode(value: 'gps'),
                                  value: ObjectValueNode(fields: [
                                    ObjectFieldNode(
                                      name: NameNode(value: '_st_d_within'),
                                      value: ObjectValueNode(fields: [
                                        ObjectFieldNode(
                                          name: NameNode(value: 'distance'),
                                          value: VariableNode(
                                              name:
                                                  NameNode(value: 'distance')),
                                        ),
                                        ObjectFieldNode(
                                          name: NameNode(value: 'from'),
                                          value: VariableNode(
                                              name: NameNode(value: 'from')),
                                        ),
                                      ]),
                                    )
                                  ]),
                                )
                              ]),
                            )
                          ]),
                        )
                      ]),
                    )
                  ]),
                ]),
              )
            ]),
          ),
          ArgumentNode(
            name: NameNode(value: 'order_by'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'posted_on'),
                value: EnumValueNode(name: NameNode(value: 'desc')),
              )
            ]),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'comments'),
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
                name: NameNode(value: 'message'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'likes'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'commented_on'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
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
            name: NameNode(value: 'likes'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'link'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'message'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'posted_on'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'service_provider_id'),
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
            name: NameNode(value: 'restaurant'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'details'),
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
            name: NameNode(value: 'laundry'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'details'),
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
            name: NameNode(value: 'delivery_company'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'details'),
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
            name: NameNode(value: 'business'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'details'),
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
Query$fetch_posts_within_distance _parserFn$Query$fetch_posts_within_distance(
        Map<String, dynamic> data) =>
    Query$fetch_posts_within_distance.fromJson(data);

class Options$Query$fetch_posts_within_distance
    extends graphql.QueryOptions<Query$fetch_posts_within_distance> {
  Options$Query$fetch_posts_within_distance({
    String? operationName,
    required Variables$Query$fetch_posts_within_distance variables,
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
          document: documentNodeQueryfetch_posts_within_distance,
          parserFn: _parserFn$Query$fetch_posts_within_distance,
        );
}

class WatchOptions$Query$fetch_posts_within_distance
    extends graphql.WatchQueryOptions<Query$fetch_posts_within_distance> {
  WatchOptions$Query$fetch_posts_within_distance({
    String? operationName,
    required Variables$Query$fetch_posts_within_distance variables,
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
          document: documentNodeQueryfetch_posts_within_distance,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$fetch_posts_within_distance,
        );
}

class FetchMoreOptions$Query$fetch_posts_within_distance
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$fetch_posts_within_distance({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$fetch_posts_within_distance variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryfetch_posts_within_distance,
        );
}

extension ClientExtension$Query$fetch_posts_within_distance
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$fetch_posts_within_distance>>
      query$fetch_posts_within_distance(
              Options$Query$fetch_posts_within_distance options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$fetch_posts_within_distance>
      watchQuery$fetch_posts_within_distance(
              WatchOptions$Query$fetch_posts_within_distance options) =>
          this.watchQuery(options);
  void writeQuery$fetch_posts_within_distance({
    required Query$fetch_posts_within_distance data,
    required Variables$Query$fetch_posts_within_distance variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryfetch_posts_within_distance),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$fetch_posts_within_distance? readQuery$fetch_posts_within_distance({
    required Variables$Query$fetch_posts_within_distance variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQueryfetch_posts_within_distance),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$fetch_posts_within_distance.fromJson(result);
  }
}

class Query$fetch_posts_within_distance$service_provider_post {
  Query$fetch_posts_within_distance$service_provider_post({
    required this.comments,
    required this.id,
    this.image,
    required this.likes,
    this.link,
    required this.message,
    required this.posted_on,
    required this.service_provider_id,
    required this.service_provider_type,
    this.restaurant,
    this.laundry,
    this.delivery_company,
    this.business,
    required this.$__typename,
  });

  factory Query$fetch_posts_within_distance$service_provider_post.fromJson(
      Map<String, dynamic> json) {
    final l$comments = json['comments'];
    final l$id = json['id'];
    final l$image = json['image'];
    final l$likes = json['likes'];
    final l$link = json['link'];
    final l$message = json['message'];
    final l$posted_on = json['posted_on'];
    final l$service_provider_id = json['service_provider_id'];
    final l$service_provider_type = json['service_provider_type'];
    final l$restaurant = json['restaurant'];
    final l$laundry = json['laundry'];
    final l$delivery_company = json['delivery_company'];
    final l$business = json['business'];
    final l$$__typename = json['__typename'];
    return Query$fetch_posts_within_distance$service_provider_post(
      comments: (l$comments as List<dynamic>)
          .map((e) =>
              Query$fetch_posts_within_distance$service_provider_post$comments
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      id: (l$id as int),
      image: (l$image as String?),
      likes: mapFromJson(l$likes),
      link: (l$link as String?),
      message: (l$message as String),
      posted_on: (l$posted_on as String),
      service_provider_id: (l$service_provider_id as int),
      service_provider_type: (l$service_provider_type as String),
      restaurant: l$restaurant == null
          ? null
          : Query$fetch_posts_within_distance$service_provider_post$restaurant
              .fromJson((l$restaurant as Map<String, dynamic>)),
      laundry: l$laundry == null
          ? null
          : Query$fetch_posts_within_distance$service_provider_post$laundry
              .fromJson((l$laundry as Map<String, dynamic>)),
      delivery_company: l$delivery_company == null
          ? null
          : Query$fetch_posts_within_distance$service_provider_post$delivery_company
              .fromJson((l$delivery_company as Map<String, dynamic>)),
      business: l$business == null
          ? null
          : Query$fetch_posts_within_distance$service_provider_post$business
              .fromJson((l$business as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$fetch_posts_within_distance$service_provider_post$comments>
      comments;

  final int id;

  final String? image;

  final dynamic likes;

  final String? link;

  final String message;

  final String posted_on;

  final int service_provider_id;

  final String service_provider_type;

  final Query$fetch_posts_within_distance$service_provider_post$restaurant?
      restaurant;

  final Query$fetch_posts_within_distance$service_provider_post$laundry?
      laundry;

  final Query$fetch_posts_within_distance$service_provider_post$delivery_company?
      delivery_company;

  final Query$fetch_posts_within_distance$service_provider_post$business?
      business;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$comments = comments;
    _resultData['comments'] = l$comments.map((e) => e.toJson()).toList();
    final l$id = id;
    _resultData['id'] = l$id;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$likes = likes;
    _resultData['likes'] = mapToJson(l$likes);
    final l$link = link;
    _resultData['link'] = l$link;
    final l$message = message;
    _resultData['message'] = l$message;
    final l$posted_on = posted_on;
    _resultData['posted_on'] = l$posted_on;
    final l$service_provider_id = service_provider_id;
    _resultData['service_provider_id'] = l$service_provider_id;
    final l$service_provider_type = service_provider_type;
    _resultData['service_provider_type'] = l$service_provider_type;
    final l$restaurant = restaurant;
    _resultData['restaurant'] = l$restaurant?.toJson();
    final l$laundry = laundry;
    _resultData['laundry'] = l$laundry?.toJson();
    final l$delivery_company = delivery_company;
    _resultData['delivery_company'] = l$delivery_company?.toJson();
    final l$business = business;
    _resultData['business'] = l$business?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$comments = comments;
    final l$id = id;
    final l$image = image;
    final l$likes = likes;
    final l$link = link;
    final l$message = message;
    final l$posted_on = posted_on;
    final l$service_provider_id = service_provider_id;
    final l$service_provider_type = service_provider_type;
    final l$restaurant = restaurant;
    final l$laundry = laundry;
    final l$delivery_company = delivery_company;
    final l$business = business;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$comments.map((v) => v)),
      l$id,
      l$image,
      l$likes,
      l$link,
      l$message,
      l$posted_on,
      l$service_provider_id,
      l$service_provider_type,
      l$restaurant,
      l$laundry,
      l$delivery_company,
      l$business,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$fetch_posts_within_distance$service_provider_post) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$comments = comments;
    final lOther$comments = other.comments;
    if (l$comments.length != lOther$comments.length) {
      return false;
    }
    for (int i = 0; i < l$comments.length; i++) {
      final l$comments$entry = l$comments[i];
      final lOther$comments$entry = lOther$comments[i];
      if (l$comments$entry != lOther$comments$entry) {
        return false;
      }
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
    final l$likes = likes;
    final lOther$likes = other.likes;
    if (l$likes != lOther$likes) {
      return false;
    }
    final l$link = link;
    final lOther$link = other.link;
    if (l$link != lOther$link) {
      return false;
    }
    final l$message = message;
    final lOther$message = other.message;
    if (l$message != lOther$message) {
      return false;
    }
    final l$posted_on = posted_on;
    final lOther$posted_on = other.posted_on;
    if (l$posted_on != lOther$posted_on) {
      return false;
    }
    final l$service_provider_id = service_provider_id;
    final lOther$service_provider_id = other.service_provider_id;
    if (l$service_provider_id != lOther$service_provider_id) {
      return false;
    }
    final l$service_provider_type = service_provider_type;
    final lOther$service_provider_type = other.service_provider_type;
    if (l$service_provider_type != lOther$service_provider_type) {
      return false;
    }
    final l$restaurant = restaurant;
    final lOther$restaurant = other.restaurant;
    if (l$restaurant != lOther$restaurant) {
      return false;
    }
    final l$laundry = laundry;
    final lOther$laundry = other.laundry;
    if (l$laundry != lOther$laundry) {
      return false;
    }
    final l$delivery_company = delivery_company;
    final lOther$delivery_company = other.delivery_company;
    if (l$delivery_company != lOther$delivery_company) {
      return false;
    }
    final l$business = business;
    final lOther$business = other.business;
    if (l$business != lOther$business) {
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

extension UtilityExtension$Query$fetch_posts_within_distance$service_provider_post
    on Query$fetch_posts_within_distance$service_provider_post {
  CopyWith$Query$fetch_posts_within_distance$service_provider_post<
          Query$fetch_posts_within_distance$service_provider_post>
      get copyWith =>
          CopyWith$Query$fetch_posts_within_distance$service_provider_post(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$fetch_posts_within_distance$service_provider_post<
    TRes> {
  factory CopyWith$Query$fetch_posts_within_distance$service_provider_post(
    Query$fetch_posts_within_distance$service_provider_post instance,
    TRes Function(Query$fetch_posts_within_distance$service_provider_post) then,
  ) = _CopyWithImpl$Query$fetch_posts_within_distance$service_provider_post;

  factory CopyWith$Query$fetch_posts_within_distance$service_provider_post.stub(
          TRes res) =
      _CopyWithStubImpl$Query$fetch_posts_within_distance$service_provider_post;

  TRes call({
    List<Query$fetch_posts_within_distance$service_provider_post$comments>?
        comments,
    int? id,
    String? image,
    dynamic? likes,
    String? link,
    String? message,
    String? posted_on,
    int? service_provider_id,
    String? service_provider_type,
    Query$fetch_posts_within_distance$service_provider_post$restaurant?
        restaurant,
    Query$fetch_posts_within_distance$service_provider_post$laundry? laundry,
    Query$fetch_posts_within_distance$service_provider_post$delivery_company?
        delivery_company,
    Query$fetch_posts_within_distance$service_provider_post$business? business,
    String? $__typename,
  });
  TRes comments(
      Iterable<Query$fetch_posts_within_distance$service_provider_post$comments> Function(
              Iterable<
                  CopyWith$Query$fetch_posts_within_distance$service_provider_post$comments<
                      Query$fetch_posts_within_distance$service_provider_post$comments>>)
          _fn);
  CopyWith$Query$fetch_posts_within_distance$service_provider_post$restaurant<
      TRes> get restaurant;
  CopyWith$Query$fetch_posts_within_distance$service_provider_post$laundry<TRes>
      get laundry;
  CopyWith$Query$fetch_posts_within_distance$service_provider_post$delivery_company<
      TRes> get delivery_company;
  CopyWith$Query$fetch_posts_within_distance$service_provider_post$business<
      TRes> get business;
}

class _CopyWithImpl$Query$fetch_posts_within_distance$service_provider_post<
        TRes>
    implements
        CopyWith$Query$fetch_posts_within_distance$service_provider_post<TRes> {
  _CopyWithImpl$Query$fetch_posts_within_distance$service_provider_post(
    this._instance,
    this._then,
  );

  final Query$fetch_posts_within_distance$service_provider_post _instance;

  final TRes Function(Query$fetch_posts_within_distance$service_provider_post)
      _then;

  static const _undefined = {};

  TRes call({
    Object? comments = _undefined,
    Object? id = _undefined,
    Object? image = _undefined,
    Object? likes = _undefined,
    Object? link = _undefined,
    Object? message = _undefined,
    Object? posted_on = _undefined,
    Object? service_provider_id = _undefined,
    Object? service_provider_type = _undefined,
    Object? restaurant = _undefined,
    Object? laundry = _undefined,
    Object? delivery_company = _undefined,
    Object? business = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$fetch_posts_within_distance$service_provider_post(
        comments: comments == _undefined || comments == null
            ? _instance.comments
            : (comments as List<
                Query$fetch_posts_within_distance$service_provider_post$comments>),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        image: image == _undefined ? _instance.image : (image as String?),
        likes: likes == _undefined || likes == null
            ? _instance.likes
            : (likes as dynamic),
        link: link == _undefined ? _instance.link : (link as String?),
        message: message == _undefined || message == null
            ? _instance.message
            : (message as String),
        posted_on: posted_on == _undefined || posted_on == null
            ? _instance.posted_on
            : (posted_on as String),
        service_provider_id:
            service_provider_id == _undefined || service_provider_id == null
                ? _instance.service_provider_id
                : (service_provider_id as int),
        service_provider_type:
            service_provider_type == _undefined || service_provider_type == null
                ? _instance.service_provider_type
                : (service_provider_type as String),
        restaurant: restaurant == _undefined
            ? _instance.restaurant
            : (restaurant
                as Query$fetch_posts_within_distance$service_provider_post$restaurant?),
        laundry: laundry == _undefined
            ? _instance.laundry
            : (laundry
                as Query$fetch_posts_within_distance$service_provider_post$laundry?),
        delivery_company: delivery_company == _undefined
            ? _instance.delivery_company
            : (delivery_company
                as Query$fetch_posts_within_distance$service_provider_post$delivery_company?),
        business: business == _undefined
            ? _instance.business
            : (business
                as Query$fetch_posts_within_distance$service_provider_post$business?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes comments(
          Iterable<Query$fetch_posts_within_distance$service_provider_post$comments> Function(
                  Iterable<
                      CopyWith$Query$fetch_posts_within_distance$service_provider_post$comments<
                          Query$fetch_posts_within_distance$service_provider_post$comments>>)
              _fn) =>
      call(
          comments: _fn(_instance.comments.map((e) =>
              CopyWith$Query$fetch_posts_within_distance$service_provider_post$comments(
                e,
                (i) => i,
              ))).toList());
  CopyWith$Query$fetch_posts_within_distance$service_provider_post$restaurant<
      TRes> get restaurant {
    final local$restaurant = _instance.restaurant;
    return local$restaurant == null
        ? CopyWith$Query$fetch_posts_within_distance$service_provider_post$restaurant
            .stub(_then(_instance))
        : CopyWith$Query$fetch_posts_within_distance$service_provider_post$restaurant(
            local$restaurant, (e) => call(restaurant: e));
  }

  CopyWith$Query$fetch_posts_within_distance$service_provider_post$laundry<TRes>
      get laundry {
    final local$laundry = _instance.laundry;
    return local$laundry == null
        ? CopyWith$Query$fetch_posts_within_distance$service_provider_post$laundry
            .stub(_then(_instance))
        : CopyWith$Query$fetch_posts_within_distance$service_provider_post$laundry(
            local$laundry, (e) => call(laundry: e));
  }

  CopyWith$Query$fetch_posts_within_distance$service_provider_post$delivery_company<
      TRes> get delivery_company {
    final local$delivery_company = _instance.delivery_company;
    return local$delivery_company == null
        ? CopyWith$Query$fetch_posts_within_distance$service_provider_post$delivery_company
            .stub(_then(_instance))
        : CopyWith$Query$fetch_posts_within_distance$service_provider_post$delivery_company(
            local$delivery_company, (e) => call(delivery_company: e));
  }

  CopyWith$Query$fetch_posts_within_distance$service_provider_post$business<
      TRes> get business {
    final local$business = _instance.business;
    return local$business == null
        ? CopyWith$Query$fetch_posts_within_distance$service_provider_post$business
            .stub(_then(_instance))
        : CopyWith$Query$fetch_posts_within_distance$service_provider_post$business(
            local$business, (e) => call(business: e));
  }
}

class _CopyWithStubImpl$Query$fetch_posts_within_distance$service_provider_post<
        TRes>
    implements
        CopyWith$Query$fetch_posts_within_distance$service_provider_post<TRes> {
  _CopyWithStubImpl$Query$fetch_posts_within_distance$service_provider_post(
      this._res);

  TRes _res;

  call({
    List<Query$fetch_posts_within_distance$service_provider_post$comments>?
        comments,
    int? id,
    String? image,
    dynamic? likes,
    String? link,
    String? message,
    String? posted_on,
    int? service_provider_id,
    String? service_provider_type,
    Query$fetch_posts_within_distance$service_provider_post$restaurant?
        restaurant,
    Query$fetch_posts_within_distance$service_provider_post$laundry? laundry,
    Query$fetch_posts_within_distance$service_provider_post$delivery_company?
        delivery_company,
    Query$fetch_posts_within_distance$service_provider_post$business? business,
    String? $__typename,
  }) =>
      _res;
  comments(_fn) => _res;
  CopyWith$Query$fetch_posts_within_distance$service_provider_post$restaurant<
          TRes>
      get restaurant =>
          CopyWith$Query$fetch_posts_within_distance$service_provider_post$restaurant
              .stub(_res);
  CopyWith$Query$fetch_posts_within_distance$service_provider_post$laundry<TRes>
      get laundry =>
          CopyWith$Query$fetch_posts_within_distance$service_provider_post$laundry
              .stub(_res);
  CopyWith$Query$fetch_posts_within_distance$service_provider_post$delivery_company<
          TRes>
      get delivery_company =>
          CopyWith$Query$fetch_posts_within_distance$service_provider_post$delivery_company
              .stub(_res);
  CopyWith$Query$fetch_posts_within_distance$service_provider_post$business<
          TRes>
      get business =>
          CopyWith$Query$fetch_posts_within_distance$service_provider_post$business
              .stub(_res);
}

class Query$fetch_posts_within_distance$service_provider_post$comments {
  Query$fetch_posts_within_distance$service_provider_post$comments({
    required this.id,
    required this.message,
    required this.likes,
    required this.commented_on,
    required this.user,
    required this.$__typename,
  });

  factory Query$fetch_posts_within_distance$service_provider_post$comments.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$message = json['message'];
    final l$likes = json['likes'];
    final l$commented_on = json['commented_on'];
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Query$fetch_posts_within_distance$service_provider_post$comments(
      id: (l$id as int),
      message: (l$message as String),
      likes: mapFromJson(l$likes),
      commented_on: (l$commented_on as String),
      user:
          Query$fetch_posts_within_distance$service_provider_post$comments$user
              .fromJson((l$user as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String message;

  final dynamic likes;

  final String commented_on;

  final Query$fetch_posts_within_distance$service_provider_post$comments$user
      user;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$message = message;
    _resultData['message'] = l$message;
    final l$likes = likes;
    _resultData['likes'] = mapToJson(l$likes);
    final l$commented_on = commented_on;
    _resultData['commented_on'] = l$commented_on;
    final l$user = user;
    _resultData['user'] = l$user.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$message = message;
    final l$likes = likes;
    final l$commented_on = commented_on;
    final l$user = user;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$message,
      l$likes,
      l$commented_on,
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
            is Query$fetch_posts_within_distance$service_provider_post$comments) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$message = message;
    final lOther$message = other.message;
    if (l$message != lOther$message) {
      return false;
    }
    final l$likes = likes;
    final lOther$likes = other.likes;
    if (l$likes != lOther$likes) {
      return false;
    }
    final l$commented_on = commented_on;
    final lOther$commented_on = other.commented_on;
    if (l$commented_on != lOther$commented_on) {
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

extension UtilityExtension$Query$fetch_posts_within_distance$service_provider_post$comments
    on Query$fetch_posts_within_distance$service_provider_post$comments {
  CopyWith$Query$fetch_posts_within_distance$service_provider_post$comments<
          Query$fetch_posts_within_distance$service_provider_post$comments>
      get copyWith =>
          CopyWith$Query$fetch_posts_within_distance$service_provider_post$comments(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$fetch_posts_within_distance$service_provider_post$comments<
    TRes> {
  factory CopyWith$Query$fetch_posts_within_distance$service_provider_post$comments(
    Query$fetch_posts_within_distance$service_provider_post$comments instance,
    TRes Function(
            Query$fetch_posts_within_distance$service_provider_post$comments)
        then,
  ) = _CopyWithImpl$Query$fetch_posts_within_distance$service_provider_post$comments;

  factory CopyWith$Query$fetch_posts_within_distance$service_provider_post$comments.stub(
          TRes res) =
      _CopyWithStubImpl$Query$fetch_posts_within_distance$service_provider_post$comments;

  TRes call({
    int? id,
    String? message,
    dynamic? likes,
    String? commented_on,
    Query$fetch_posts_within_distance$service_provider_post$comments$user? user,
    String? $__typename,
  });
  CopyWith$Query$fetch_posts_within_distance$service_provider_post$comments$user<
      TRes> get user;
}

class _CopyWithImpl$Query$fetch_posts_within_distance$service_provider_post$comments<
        TRes>
    implements
        CopyWith$Query$fetch_posts_within_distance$service_provider_post$comments<
            TRes> {
  _CopyWithImpl$Query$fetch_posts_within_distance$service_provider_post$comments(
    this._instance,
    this._then,
  );

  final Query$fetch_posts_within_distance$service_provider_post$comments
      _instance;

  final TRes Function(
      Query$fetch_posts_within_distance$service_provider_post$comments) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? message = _undefined,
    Object? likes = _undefined,
    Object? commented_on = _undefined,
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$fetch_posts_within_distance$service_provider_post$comments(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        message: message == _undefined || message == null
            ? _instance.message
            : (message as String),
        likes: likes == _undefined || likes == null
            ? _instance.likes
            : (likes as dynamic),
        commented_on: commented_on == _undefined || commented_on == null
            ? _instance.commented_on
            : (commented_on as String),
        user: user == _undefined || user == null
            ? _instance.user
            : (user
                as Query$fetch_posts_within_distance$service_provider_post$comments$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$fetch_posts_within_distance$service_provider_post$comments$user<
      TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Query$fetch_posts_within_distance$service_provider_post$comments$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Query$fetch_posts_within_distance$service_provider_post$comments<
        TRes>
    implements
        CopyWith$Query$fetch_posts_within_distance$service_provider_post$comments<
            TRes> {
  _CopyWithStubImpl$Query$fetch_posts_within_distance$service_provider_post$comments(
      this._res);

  TRes _res;

  call({
    int? id,
    String? message,
    dynamic? likes,
    String? commented_on,
    Query$fetch_posts_within_distance$service_provider_post$comments$user? user,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$fetch_posts_within_distance$service_provider_post$comments$user<
          TRes>
      get user =>
          CopyWith$Query$fetch_posts_within_distance$service_provider_post$comments$user
              .stub(_res);
}

class Query$fetch_posts_within_distance$service_provider_post$comments$user {
  Query$fetch_posts_within_distance$service_provider_post$comments$user({
    required this.id,
    this.name,
    this.image,
    required this.$__typename,
  });

  factory Query$fetch_posts_within_distance$service_provider_post$comments$user.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Query$fetch_posts_within_distance$service_provider_post$comments$user(
      id: (l$id as int),
      name: (l$name as String?),
      image: (l$image as String?),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String? name;

  final String? image;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
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
    final l$id = id;
    final l$name = name;
    final l$image = image;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
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
            is Query$fetch_posts_within_distance$service_provider_post$comments$user) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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

extension UtilityExtension$Query$fetch_posts_within_distance$service_provider_post$comments$user
    on Query$fetch_posts_within_distance$service_provider_post$comments$user {
  CopyWith$Query$fetch_posts_within_distance$service_provider_post$comments$user<
          Query$fetch_posts_within_distance$service_provider_post$comments$user>
      get copyWith =>
          CopyWith$Query$fetch_posts_within_distance$service_provider_post$comments$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$fetch_posts_within_distance$service_provider_post$comments$user<
    TRes> {
  factory CopyWith$Query$fetch_posts_within_distance$service_provider_post$comments$user(
    Query$fetch_posts_within_distance$service_provider_post$comments$user
        instance,
    TRes Function(
            Query$fetch_posts_within_distance$service_provider_post$comments$user)
        then,
  ) = _CopyWithImpl$Query$fetch_posts_within_distance$service_provider_post$comments$user;

  factory CopyWith$Query$fetch_posts_within_distance$service_provider_post$comments$user.stub(
          TRes res) =
      _CopyWithStubImpl$Query$fetch_posts_within_distance$service_provider_post$comments$user;

  TRes call({
    int? id,
    String? name,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$fetch_posts_within_distance$service_provider_post$comments$user<
        TRes>
    implements
        CopyWith$Query$fetch_posts_within_distance$service_provider_post$comments$user<
            TRes> {
  _CopyWithImpl$Query$fetch_posts_within_distance$service_provider_post$comments$user(
    this._instance,
    this._then,
  );

  final Query$fetch_posts_within_distance$service_provider_post$comments$user
      _instance;

  final TRes Function(
          Query$fetch_posts_within_distance$service_provider_post$comments$user)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$fetch_posts_within_distance$service_provider_post$comments$user(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined ? _instance.name : (name as String?),
        image: image == _undefined ? _instance.image : (image as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$fetch_posts_within_distance$service_provider_post$comments$user<
        TRes>
    implements
        CopyWith$Query$fetch_posts_within_distance$service_provider_post$comments$user<
            TRes> {
  _CopyWithStubImpl$Query$fetch_posts_within_distance$service_provider_post$comments$user(
      this._res);

  TRes _res;

  call({
    int? id,
    String? name,
    String? image,
    String? $__typename,
  }) =>
      _res;
}

class Query$fetch_posts_within_distance$service_provider_post$restaurant {
  Query$fetch_posts_within_distance$service_provider_post$restaurant({
    this.details,
    required this.$__typename,
  });

  factory Query$fetch_posts_within_distance$service_provider_post$restaurant.fromJson(
      Map<String, dynamic> json) {
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Query$fetch_posts_within_distance$service_provider_post$restaurant(
      details: l$details == null
          ? null
          : Query$fetch_posts_within_distance$service_provider_post$restaurant$details
              .fromJson((l$details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$fetch_posts_within_distance$service_provider_post$restaurant$details?
      details;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$details = details;
    _resultData['details'] = l$details?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$details = details;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$details,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$fetch_posts_within_distance$service_provider_post$restaurant) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$details = details;
    final lOther$details = other.details;
    if (l$details != lOther$details) {
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

extension UtilityExtension$Query$fetch_posts_within_distance$service_provider_post$restaurant
    on Query$fetch_posts_within_distance$service_provider_post$restaurant {
  CopyWith$Query$fetch_posts_within_distance$service_provider_post$restaurant<
          Query$fetch_posts_within_distance$service_provider_post$restaurant>
      get copyWith =>
          CopyWith$Query$fetch_posts_within_distance$service_provider_post$restaurant(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$fetch_posts_within_distance$service_provider_post$restaurant<
    TRes> {
  factory CopyWith$Query$fetch_posts_within_distance$service_provider_post$restaurant(
    Query$fetch_posts_within_distance$service_provider_post$restaurant instance,
    TRes Function(
            Query$fetch_posts_within_distance$service_provider_post$restaurant)
        then,
  ) = _CopyWithImpl$Query$fetch_posts_within_distance$service_provider_post$restaurant;

  factory CopyWith$Query$fetch_posts_within_distance$service_provider_post$restaurant.stub(
          TRes res) =
      _CopyWithStubImpl$Query$fetch_posts_within_distance$service_provider_post$restaurant;

  TRes call({
    Query$fetch_posts_within_distance$service_provider_post$restaurant$details?
        details,
    String? $__typename,
  });
  CopyWith$Query$fetch_posts_within_distance$service_provider_post$restaurant$details<
      TRes> get details;
}

class _CopyWithImpl$Query$fetch_posts_within_distance$service_provider_post$restaurant<
        TRes>
    implements
        CopyWith$Query$fetch_posts_within_distance$service_provider_post$restaurant<
            TRes> {
  _CopyWithImpl$Query$fetch_posts_within_distance$service_provider_post$restaurant(
    this._instance,
    this._then,
  );

  final Query$fetch_posts_within_distance$service_provider_post$restaurant
      _instance;

  final TRes Function(
      Query$fetch_posts_within_distance$service_provider_post$restaurant) _then;

  static const _undefined = {};

  TRes call({
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$fetch_posts_within_distance$service_provider_post$restaurant(
        details: details == _undefined
            ? _instance.details
            : (details
                as Query$fetch_posts_within_distance$service_provider_post$restaurant$details?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$fetch_posts_within_distance$service_provider_post$restaurant$details<
      TRes> get details {
    final local$details = _instance.details;
    return local$details == null
        ? CopyWith$Query$fetch_posts_within_distance$service_provider_post$restaurant$details
            .stub(_then(_instance))
        : CopyWith$Query$fetch_posts_within_distance$service_provider_post$restaurant$details(
            local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Query$fetch_posts_within_distance$service_provider_post$restaurant<
        TRes>
    implements
        CopyWith$Query$fetch_posts_within_distance$service_provider_post$restaurant<
            TRes> {
  _CopyWithStubImpl$Query$fetch_posts_within_distance$service_provider_post$restaurant(
      this._res);

  TRes _res;

  call({
    Query$fetch_posts_within_distance$service_provider_post$restaurant$details?
        details,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$fetch_posts_within_distance$service_provider_post$restaurant$details<
          TRes>
      get details =>
          CopyWith$Query$fetch_posts_within_distance$service_provider_post$restaurant$details
              .stub(_res);
}

class Query$fetch_posts_within_distance$service_provider_post$restaurant$details {
  Query$fetch_posts_within_distance$service_provider_post$restaurant$details({
    required this.name,
    required this.image,
    required this.$__typename,
  });

  factory Query$fetch_posts_within_distance$service_provider_post$restaurant$details.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Query$fetch_posts_within_distance$service_provider_post$restaurant$details(
      name: (l$name as String),
      image: (l$image as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String name;

  final String image;

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
            is Query$fetch_posts_within_distance$service_provider_post$restaurant$details) ||
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

extension UtilityExtension$Query$fetch_posts_within_distance$service_provider_post$restaurant$details
    on Query$fetch_posts_within_distance$service_provider_post$restaurant$details {
  CopyWith$Query$fetch_posts_within_distance$service_provider_post$restaurant$details<
          Query$fetch_posts_within_distance$service_provider_post$restaurant$details>
      get copyWith =>
          CopyWith$Query$fetch_posts_within_distance$service_provider_post$restaurant$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$fetch_posts_within_distance$service_provider_post$restaurant$details<
    TRes> {
  factory CopyWith$Query$fetch_posts_within_distance$service_provider_post$restaurant$details(
    Query$fetch_posts_within_distance$service_provider_post$restaurant$details
        instance,
    TRes Function(
            Query$fetch_posts_within_distance$service_provider_post$restaurant$details)
        then,
  ) = _CopyWithImpl$Query$fetch_posts_within_distance$service_provider_post$restaurant$details;

  factory CopyWith$Query$fetch_posts_within_distance$service_provider_post$restaurant$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$fetch_posts_within_distance$service_provider_post$restaurant$details;

  TRes call({
    String? name,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$fetch_posts_within_distance$service_provider_post$restaurant$details<
        TRes>
    implements
        CopyWith$Query$fetch_posts_within_distance$service_provider_post$restaurant$details<
            TRes> {
  _CopyWithImpl$Query$fetch_posts_within_distance$service_provider_post$restaurant$details(
    this._instance,
    this._then,
  );

  final Query$fetch_posts_within_distance$service_provider_post$restaurant$details
      _instance;

  final TRes Function(
          Query$fetch_posts_within_distance$service_provider_post$restaurant$details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$fetch_posts_within_distance$service_provider_post$restaurant$details(
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$fetch_posts_within_distance$service_provider_post$restaurant$details<
        TRes>
    implements
        CopyWith$Query$fetch_posts_within_distance$service_provider_post$restaurant$details<
            TRes> {
  _CopyWithStubImpl$Query$fetch_posts_within_distance$service_provider_post$restaurant$details(
      this._res);

  TRes _res;

  call({
    String? name,
    String? image,
    String? $__typename,
  }) =>
      _res;
}

class Query$fetch_posts_within_distance$service_provider_post$laundry {
  Query$fetch_posts_within_distance$service_provider_post$laundry({
    this.details,
    required this.$__typename,
  });

  factory Query$fetch_posts_within_distance$service_provider_post$laundry.fromJson(
      Map<String, dynamic> json) {
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Query$fetch_posts_within_distance$service_provider_post$laundry(
      details: l$details == null
          ? null
          : Query$fetch_posts_within_distance$service_provider_post$laundry$details
              .fromJson((l$details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$fetch_posts_within_distance$service_provider_post$laundry$details?
      details;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$details = details;
    _resultData['details'] = l$details?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$details = details;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$details,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$fetch_posts_within_distance$service_provider_post$laundry) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$details = details;
    final lOther$details = other.details;
    if (l$details != lOther$details) {
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

extension UtilityExtension$Query$fetch_posts_within_distance$service_provider_post$laundry
    on Query$fetch_posts_within_distance$service_provider_post$laundry {
  CopyWith$Query$fetch_posts_within_distance$service_provider_post$laundry<
          Query$fetch_posts_within_distance$service_provider_post$laundry>
      get copyWith =>
          CopyWith$Query$fetch_posts_within_distance$service_provider_post$laundry(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$fetch_posts_within_distance$service_provider_post$laundry<
    TRes> {
  factory CopyWith$Query$fetch_posts_within_distance$service_provider_post$laundry(
    Query$fetch_posts_within_distance$service_provider_post$laundry instance,
    TRes Function(
            Query$fetch_posts_within_distance$service_provider_post$laundry)
        then,
  ) = _CopyWithImpl$Query$fetch_posts_within_distance$service_provider_post$laundry;

  factory CopyWith$Query$fetch_posts_within_distance$service_provider_post$laundry.stub(
          TRes res) =
      _CopyWithStubImpl$Query$fetch_posts_within_distance$service_provider_post$laundry;

  TRes call({
    Query$fetch_posts_within_distance$service_provider_post$laundry$details?
        details,
    String? $__typename,
  });
  CopyWith$Query$fetch_posts_within_distance$service_provider_post$laundry$details<
      TRes> get details;
}

class _CopyWithImpl$Query$fetch_posts_within_distance$service_provider_post$laundry<
        TRes>
    implements
        CopyWith$Query$fetch_posts_within_distance$service_provider_post$laundry<
            TRes> {
  _CopyWithImpl$Query$fetch_posts_within_distance$service_provider_post$laundry(
    this._instance,
    this._then,
  );

  final Query$fetch_posts_within_distance$service_provider_post$laundry
      _instance;

  final TRes Function(
      Query$fetch_posts_within_distance$service_provider_post$laundry) _then;

  static const _undefined = {};

  TRes call({
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$fetch_posts_within_distance$service_provider_post$laundry(
        details: details == _undefined
            ? _instance.details
            : (details
                as Query$fetch_posts_within_distance$service_provider_post$laundry$details?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$fetch_posts_within_distance$service_provider_post$laundry$details<
      TRes> get details {
    final local$details = _instance.details;
    return local$details == null
        ? CopyWith$Query$fetch_posts_within_distance$service_provider_post$laundry$details
            .stub(_then(_instance))
        : CopyWith$Query$fetch_posts_within_distance$service_provider_post$laundry$details(
            local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Query$fetch_posts_within_distance$service_provider_post$laundry<
        TRes>
    implements
        CopyWith$Query$fetch_posts_within_distance$service_provider_post$laundry<
            TRes> {
  _CopyWithStubImpl$Query$fetch_posts_within_distance$service_provider_post$laundry(
      this._res);

  TRes _res;

  call({
    Query$fetch_posts_within_distance$service_provider_post$laundry$details?
        details,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$fetch_posts_within_distance$service_provider_post$laundry$details<
          TRes>
      get details =>
          CopyWith$Query$fetch_posts_within_distance$service_provider_post$laundry$details
              .stub(_res);
}

class Query$fetch_posts_within_distance$service_provider_post$laundry$details {
  Query$fetch_posts_within_distance$service_provider_post$laundry$details({
    required this.name,
    required this.image,
    required this.$__typename,
  });

  factory Query$fetch_posts_within_distance$service_provider_post$laundry$details.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Query$fetch_posts_within_distance$service_provider_post$laundry$details(
      name: (l$name as String),
      image: (l$image as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String name;

  final String image;

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
            is Query$fetch_posts_within_distance$service_provider_post$laundry$details) ||
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

extension UtilityExtension$Query$fetch_posts_within_distance$service_provider_post$laundry$details
    on Query$fetch_posts_within_distance$service_provider_post$laundry$details {
  CopyWith$Query$fetch_posts_within_distance$service_provider_post$laundry$details<
          Query$fetch_posts_within_distance$service_provider_post$laundry$details>
      get copyWith =>
          CopyWith$Query$fetch_posts_within_distance$service_provider_post$laundry$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$fetch_posts_within_distance$service_provider_post$laundry$details<
    TRes> {
  factory CopyWith$Query$fetch_posts_within_distance$service_provider_post$laundry$details(
    Query$fetch_posts_within_distance$service_provider_post$laundry$details
        instance,
    TRes Function(
            Query$fetch_posts_within_distance$service_provider_post$laundry$details)
        then,
  ) = _CopyWithImpl$Query$fetch_posts_within_distance$service_provider_post$laundry$details;

  factory CopyWith$Query$fetch_posts_within_distance$service_provider_post$laundry$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$fetch_posts_within_distance$service_provider_post$laundry$details;

  TRes call({
    String? name,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$fetch_posts_within_distance$service_provider_post$laundry$details<
        TRes>
    implements
        CopyWith$Query$fetch_posts_within_distance$service_provider_post$laundry$details<
            TRes> {
  _CopyWithImpl$Query$fetch_posts_within_distance$service_provider_post$laundry$details(
    this._instance,
    this._then,
  );

  final Query$fetch_posts_within_distance$service_provider_post$laundry$details
      _instance;

  final TRes Function(
          Query$fetch_posts_within_distance$service_provider_post$laundry$details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$fetch_posts_within_distance$service_provider_post$laundry$details(
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$fetch_posts_within_distance$service_provider_post$laundry$details<
        TRes>
    implements
        CopyWith$Query$fetch_posts_within_distance$service_provider_post$laundry$details<
            TRes> {
  _CopyWithStubImpl$Query$fetch_posts_within_distance$service_provider_post$laundry$details(
      this._res);

  TRes _res;

  call({
    String? name,
    String? image,
    String? $__typename,
  }) =>
      _res;
}

class Query$fetch_posts_within_distance$service_provider_post$delivery_company {
  Query$fetch_posts_within_distance$service_provider_post$delivery_company({
    this.details,
    required this.$__typename,
  });

  factory Query$fetch_posts_within_distance$service_provider_post$delivery_company.fromJson(
      Map<String, dynamic> json) {
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Query$fetch_posts_within_distance$service_provider_post$delivery_company(
      details: l$details == null
          ? null
          : Query$fetch_posts_within_distance$service_provider_post$delivery_company$details
              .fromJson((l$details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$fetch_posts_within_distance$service_provider_post$delivery_company$details?
      details;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$details = details;
    _resultData['details'] = l$details?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$details = details;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$details,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$fetch_posts_within_distance$service_provider_post$delivery_company) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$details = details;
    final lOther$details = other.details;
    if (l$details != lOther$details) {
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

extension UtilityExtension$Query$fetch_posts_within_distance$service_provider_post$delivery_company
    on Query$fetch_posts_within_distance$service_provider_post$delivery_company {
  CopyWith$Query$fetch_posts_within_distance$service_provider_post$delivery_company<
          Query$fetch_posts_within_distance$service_provider_post$delivery_company>
      get copyWith =>
          CopyWith$Query$fetch_posts_within_distance$service_provider_post$delivery_company(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$fetch_posts_within_distance$service_provider_post$delivery_company<
    TRes> {
  factory CopyWith$Query$fetch_posts_within_distance$service_provider_post$delivery_company(
    Query$fetch_posts_within_distance$service_provider_post$delivery_company
        instance,
    TRes Function(
            Query$fetch_posts_within_distance$service_provider_post$delivery_company)
        then,
  ) = _CopyWithImpl$Query$fetch_posts_within_distance$service_provider_post$delivery_company;

  factory CopyWith$Query$fetch_posts_within_distance$service_provider_post$delivery_company.stub(
          TRes res) =
      _CopyWithStubImpl$Query$fetch_posts_within_distance$service_provider_post$delivery_company;

  TRes call({
    Query$fetch_posts_within_distance$service_provider_post$delivery_company$details?
        details,
    String? $__typename,
  });
  CopyWith$Query$fetch_posts_within_distance$service_provider_post$delivery_company$details<
      TRes> get details;
}

class _CopyWithImpl$Query$fetch_posts_within_distance$service_provider_post$delivery_company<
        TRes>
    implements
        CopyWith$Query$fetch_posts_within_distance$service_provider_post$delivery_company<
            TRes> {
  _CopyWithImpl$Query$fetch_posts_within_distance$service_provider_post$delivery_company(
    this._instance,
    this._then,
  );

  final Query$fetch_posts_within_distance$service_provider_post$delivery_company
      _instance;

  final TRes Function(
          Query$fetch_posts_within_distance$service_provider_post$delivery_company)
      _then;

  static const _undefined = {};

  TRes call({
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$fetch_posts_within_distance$service_provider_post$delivery_company(
        details: details == _undefined
            ? _instance.details
            : (details
                as Query$fetch_posts_within_distance$service_provider_post$delivery_company$details?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$fetch_posts_within_distance$service_provider_post$delivery_company$details<
      TRes> get details {
    final local$details = _instance.details;
    return local$details == null
        ? CopyWith$Query$fetch_posts_within_distance$service_provider_post$delivery_company$details
            .stub(_then(_instance))
        : CopyWith$Query$fetch_posts_within_distance$service_provider_post$delivery_company$details(
            local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Query$fetch_posts_within_distance$service_provider_post$delivery_company<
        TRes>
    implements
        CopyWith$Query$fetch_posts_within_distance$service_provider_post$delivery_company<
            TRes> {
  _CopyWithStubImpl$Query$fetch_posts_within_distance$service_provider_post$delivery_company(
      this._res);

  TRes _res;

  call({
    Query$fetch_posts_within_distance$service_provider_post$delivery_company$details?
        details,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$fetch_posts_within_distance$service_provider_post$delivery_company$details<
          TRes>
      get details =>
          CopyWith$Query$fetch_posts_within_distance$service_provider_post$delivery_company$details
              .stub(_res);
}

class Query$fetch_posts_within_distance$service_provider_post$delivery_company$details {
  Query$fetch_posts_within_distance$service_provider_post$delivery_company$details({
    required this.name,
    required this.image,
    required this.$__typename,
  });

  factory Query$fetch_posts_within_distance$service_provider_post$delivery_company$details.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Query$fetch_posts_within_distance$service_provider_post$delivery_company$details(
      name: (l$name as String),
      image: (l$image as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String name;

  final String image;

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
            is Query$fetch_posts_within_distance$service_provider_post$delivery_company$details) ||
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

extension UtilityExtension$Query$fetch_posts_within_distance$service_provider_post$delivery_company$details
    on Query$fetch_posts_within_distance$service_provider_post$delivery_company$details {
  CopyWith$Query$fetch_posts_within_distance$service_provider_post$delivery_company$details<
          Query$fetch_posts_within_distance$service_provider_post$delivery_company$details>
      get copyWith =>
          CopyWith$Query$fetch_posts_within_distance$service_provider_post$delivery_company$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$fetch_posts_within_distance$service_provider_post$delivery_company$details<
    TRes> {
  factory CopyWith$Query$fetch_posts_within_distance$service_provider_post$delivery_company$details(
    Query$fetch_posts_within_distance$service_provider_post$delivery_company$details
        instance,
    TRes Function(
            Query$fetch_posts_within_distance$service_provider_post$delivery_company$details)
        then,
  ) = _CopyWithImpl$Query$fetch_posts_within_distance$service_provider_post$delivery_company$details;

  factory CopyWith$Query$fetch_posts_within_distance$service_provider_post$delivery_company$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$fetch_posts_within_distance$service_provider_post$delivery_company$details;

  TRes call({
    String? name,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$fetch_posts_within_distance$service_provider_post$delivery_company$details<
        TRes>
    implements
        CopyWith$Query$fetch_posts_within_distance$service_provider_post$delivery_company$details<
            TRes> {
  _CopyWithImpl$Query$fetch_posts_within_distance$service_provider_post$delivery_company$details(
    this._instance,
    this._then,
  );

  final Query$fetch_posts_within_distance$service_provider_post$delivery_company$details
      _instance;

  final TRes Function(
          Query$fetch_posts_within_distance$service_provider_post$delivery_company$details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$fetch_posts_within_distance$service_provider_post$delivery_company$details(
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$fetch_posts_within_distance$service_provider_post$delivery_company$details<
        TRes>
    implements
        CopyWith$Query$fetch_posts_within_distance$service_provider_post$delivery_company$details<
            TRes> {
  _CopyWithStubImpl$Query$fetch_posts_within_distance$service_provider_post$delivery_company$details(
      this._res);

  TRes _res;

  call({
    String? name,
    String? image,
    String? $__typename,
  }) =>
      _res;
}

class Query$fetch_posts_within_distance$service_provider_post$business {
  Query$fetch_posts_within_distance$service_provider_post$business({
    required this.details,
    required this.$__typename,
  });

  factory Query$fetch_posts_within_distance$service_provider_post$business.fromJson(
      Map<String, dynamic> json) {
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Query$fetch_posts_within_distance$service_provider_post$business(
      details:
          Query$fetch_posts_within_distance$service_provider_post$business$details
              .fromJson((l$details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$fetch_posts_within_distance$service_provider_post$business$details
      details;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$details = details;
    _resultData['details'] = l$details.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$details = details;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$details,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$fetch_posts_within_distance$service_provider_post$business) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$details = details;
    final lOther$details = other.details;
    if (l$details != lOther$details) {
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

extension UtilityExtension$Query$fetch_posts_within_distance$service_provider_post$business
    on Query$fetch_posts_within_distance$service_provider_post$business {
  CopyWith$Query$fetch_posts_within_distance$service_provider_post$business<
          Query$fetch_posts_within_distance$service_provider_post$business>
      get copyWith =>
          CopyWith$Query$fetch_posts_within_distance$service_provider_post$business(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$fetch_posts_within_distance$service_provider_post$business<
    TRes> {
  factory CopyWith$Query$fetch_posts_within_distance$service_provider_post$business(
    Query$fetch_posts_within_distance$service_provider_post$business instance,
    TRes Function(
            Query$fetch_posts_within_distance$service_provider_post$business)
        then,
  ) = _CopyWithImpl$Query$fetch_posts_within_distance$service_provider_post$business;

  factory CopyWith$Query$fetch_posts_within_distance$service_provider_post$business.stub(
          TRes res) =
      _CopyWithStubImpl$Query$fetch_posts_within_distance$service_provider_post$business;

  TRes call({
    Query$fetch_posts_within_distance$service_provider_post$business$details?
        details,
    String? $__typename,
  });
  CopyWith$Query$fetch_posts_within_distance$service_provider_post$business$details<
      TRes> get details;
}

class _CopyWithImpl$Query$fetch_posts_within_distance$service_provider_post$business<
        TRes>
    implements
        CopyWith$Query$fetch_posts_within_distance$service_provider_post$business<
            TRes> {
  _CopyWithImpl$Query$fetch_posts_within_distance$service_provider_post$business(
    this._instance,
    this._then,
  );

  final Query$fetch_posts_within_distance$service_provider_post$business
      _instance;

  final TRes Function(
      Query$fetch_posts_within_distance$service_provider_post$business) _then;

  static const _undefined = {};

  TRes call({
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$fetch_posts_within_distance$service_provider_post$business(
        details: details == _undefined || details == null
            ? _instance.details
            : (details
                as Query$fetch_posts_within_distance$service_provider_post$business$details),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$fetch_posts_within_distance$service_provider_post$business$details<
      TRes> get details {
    final local$details = _instance.details;
    return CopyWith$Query$fetch_posts_within_distance$service_provider_post$business$details(
        local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Query$fetch_posts_within_distance$service_provider_post$business<
        TRes>
    implements
        CopyWith$Query$fetch_posts_within_distance$service_provider_post$business<
            TRes> {
  _CopyWithStubImpl$Query$fetch_posts_within_distance$service_provider_post$business(
      this._res);

  TRes _res;

  call({
    Query$fetch_posts_within_distance$service_provider_post$business$details?
        details,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$fetch_posts_within_distance$service_provider_post$business$details<
          TRes>
      get details =>
          CopyWith$Query$fetch_posts_within_distance$service_provider_post$business$details
              .stub(_res);
}

class Query$fetch_posts_within_distance$service_provider_post$business$details {
  Query$fetch_posts_within_distance$service_provider_post$business$details({
    required this.name,
    required this.image,
    required this.$__typename,
  });

  factory Query$fetch_posts_within_distance$service_provider_post$business$details.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Query$fetch_posts_within_distance$service_provider_post$business$details(
      name: (l$name as String),
      image: (l$image as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String name;

  final String image;

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
            is Query$fetch_posts_within_distance$service_provider_post$business$details) ||
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

extension UtilityExtension$Query$fetch_posts_within_distance$service_provider_post$business$details
    on Query$fetch_posts_within_distance$service_provider_post$business$details {
  CopyWith$Query$fetch_posts_within_distance$service_provider_post$business$details<
          Query$fetch_posts_within_distance$service_provider_post$business$details>
      get copyWith =>
          CopyWith$Query$fetch_posts_within_distance$service_provider_post$business$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$fetch_posts_within_distance$service_provider_post$business$details<
    TRes> {
  factory CopyWith$Query$fetch_posts_within_distance$service_provider_post$business$details(
    Query$fetch_posts_within_distance$service_provider_post$business$details
        instance,
    TRes Function(
            Query$fetch_posts_within_distance$service_provider_post$business$details)
        then,
  ) = _CopyWithImpl$Query$fetch_posts_within_distance$service_provider_post$business$details;

  factory CopyWith$Query$fetch_posts_within_distance$service_provider_post$business$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$fetch_posts_within_distance$service_provider_post$business$details;

  TRes call({
    String? name,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$fetch_posts_within_distance$service_provider_post$business$details<
        TRes>
    implements
        CopyWith$Query$fetch_posts_within_distance$service_provider_post$business$details<
            TRes> {
  _CopyWithImpl$Query$fetch_posts_within_distance$service_provider_post$business$details(
    this._instance,
    this._then,
  );

  final Query$fetch_posts_within_distance$service_provider_post$business$details
      _instance;

  final TRes Function(
          Query$fetch_posts_within_distance$service_provider_post$business$details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$fetch_posts_within_distance$service_provider_post$business$details(
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$fetch_posts_within_distance$service_provider_post$business$details<
        TRes>
    implements
        CopyWith$Query$fetch_posts_within_distance$service_provider_post$business$details<
            TRes> {
  _CopyWithStubImpl$Query$fetch_posts_within_distance$service_provider_post$business$details(
      this._res);

  TRes _res;

  call({
    String? name,
    String? image,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$fetch_number_of_subscribers {
  factory Variables$Query$fetch_number_of_subscribers({
    int? service_provider_id,
    String? service_provider_type,
  }) =>
      Variables$Query$fetch_number_of_subscribers._({
        if (service_provider_id != null)
          r'service_provider_id': service_provider_id,
        if (service_provider_type != null)
          r'service_provider_type': service_provider_type,
      });

  Variables$Query$fetch_number_of_subscribers._(this._$data);

  factory Variables$Query$fetch_number_of_subscribers.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('service_provider_id')) {
      final l$service_provider_id = data['service_provider_id'];
      result$data['service_provider_id'] = (l$service_provider_id as int?);
    }
    if (data.containsKey('service_provider_type')) {
      final l$service_provider_type = data['service_provider_type'];
      result$data['service_provider_type'] =
          (l$service_provider_type as String?);
    }
    return Variables$Query$fetch_number_of_subscribers._(result$data);
  }

  Map<String, dynamic> _$data;

  int? get service_provider_id => (_$data['service_provider_id'] as int?);
  String? get service_provider_type =>
      (_$data['service_provider_type'] as String?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('service_provider_id')) {
      final l$service_provider_id = service_provider_id;
      result$data['service_provider_id'] = l$service_provider_id;
    }
    if (_$data.containsKey('service_provider_type')) {
      final l$service_provider_type = service_provider_type;
      result$data['service_provider_type'] = l$service_provider_type;
    }
    return result$data;
  }

  CopyWith$Variables$Query$fetch_number_of_subscribers<
          Variables$Query$fetch_number_of_subscribers>
      get copyWith => CopyWith$Variables$Query$fetch_number_of_subscribers(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$fetch_number_of_subscribers) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$service_provider_id = service_provider_id;
    final lOther$service_provider_id = other.service_provider_id;
    if (_$data.containsKey('service_provider_id') !=
        other._$data.containsKey('service_provider_id')) {
      return false;
    }
    if (l$service_provider_id != lOther$service_provider_id) {
      return false;
    }
    final l$service_provider_type = service_provider_type;
    final lOther$service_provider_type = other.service_provider_type;
    if (_$data.containsKey('service_provider_type') !=
        other._$data.containsKey('service_provider_type')) {
      return false;
    }
    if (l$service_provider_type != lOther$service_provider_type) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$service_provider_id = service_provider_id;
    final l$service_provider_type = service_provider_type;
    return Object.hashAll([
      _$data.containsKey('service_provider_id')
          ? l$service_provider_id
          : const {},
      _$data.containsKey('service_provider_type')
          ? l$service_provider_type
          : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$fetch_number_of_subscribers<TRes> {
  factory CopyWith$Variables$Query$fetch_number_of_subscribers(
    Variables$Query$fetch_number_of_subscribers instance,
    TRes Function(Variables$Query$fetch_number_of_subscribers) then,
  ) = _CopyWithImpl$Variables$Query$fetch_number_of_subscribers;

  factory CopyWith$Variables$Query$fetch_number_of_subscribers.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$fetch_number_of_subscribers;

  TRes call({
    int? service_provider_id,
    String? service_provider_type,
  });
}

class _CopyWithImpl$Variables$Query$fetch_number_of_subscribers<TRes>
    implements CopyWith$Variables$Query$fetch_number_of_subscribers<TRes> {
  _CopyWithImpl$Variables$Query$fetch_number_of_subscribers(
    this._instance,
    this._then,
  );

  final Variables$Query$fetch_number_of_subscribers _instance;

  final TRes Function(Variables$Query$fetch_number_of_subscribers) _then;

  static const _undefined = {};

  TRes call({
    Object? service_provider_id = _undefined,
    Object? service_provider_type = _undefined,
  }) =>
      _then(Variables$Query$fetch_number_of_subscribers._({
        ..._instance._$data,
        if (service_provider_id != _undefined)
          'service_provider_id': (service_provider_id as int?),
        if (service_provider_type != _undefined)
          'service_provider_type': (service_provider_type as String?),
      }));
}

class _CopyWithStubImpl$Variables$Query$fetch_number_of_subscribers<TRes>
    implements CopyWith$Variables$Query$fetch_number_of_subscribers<TRes> {
  _CopyWithStubImpl$Variables$Query$fetch_number_of_subscribers(this._res);

  TRes _res;

  call({
    int? service_provider_id,
    String? service_provider_type,
  }) =>
      _res;
}

class Query$fetch_number_of_subscribers {
  Query$fetch_number_of_subscribers({
    required this.service_provider_subscriber_aggregate,
    required this.$__typename,
  });

  factory Query$fetch_number_of_subscribers.fromJson(
      Map<String, dynamic> json) {
    final l$service_provider_subscriber_aggregate =
        json['service_provider_subscriber_aggregate'];
    final l$$__typename = json['__typename'];
    return Query$fetch_number_of_subscribers(
      service_provider_subscriber_aggregate:
          Query$fetch_number_of_subscribers$service_provider_subscriber_aggregate
              .fromJson((l$service_provider_subscriber_aggregate
                  as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$fetch_number_of_subscribers$service_provider_subscriber_aggregate
      service_provider_subscriber_aggregate;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$service_provider_subscriber_aggregate =
        service_provider_subscriber_aggregate;
    _resultData['service_provider_subscriber_aggregate'] =
        l$service_provider_subscriber_aggregate.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$service_provider_subscriber_aggregate =
        service_provider_subscriber_aggregate;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$service_provider_subscriber_aggregate,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$fetch_number_of_subscribers) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$service_provider_subscriber_aggregate =
        service_provider_subscriber_aggregate;
    final lOther$service_provider_subscriber_aggregate =
        other.service_provider_subscriber_aggregate;
    if (l$service_provider_subscriber_aggregate !=
        lOther$service_provider_subscriber_aggregate) {
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

extension UtilityExtension$Query$fetch_number_of_subscribers
    on Query$fetch_number_of_subscribers {
  CopyWith$Query$fetch_number_of_subscribers<Query$fetch_number_of_subscribers>
      get copyWith => CopyWith$Query$fetch_number_of_subscribers(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$fetch_number_of_subscribers<TRes> {
  factory CopyWith$Query$fetch_number_of_subscribers(
    Query$fetch_number_of_subscribers instance,
    TRes Function(Query$fetch_number_of_subscribers) then,
  ) = _CopyWithImpl$Query$fetch_number_of_subscribers;

  factory CopyWith$Query$fetch_number_of_subscribers.stub(TRes res) =
      _CopyWithStubImpl$Query$fetch_number_of_subscribers;

  TRes call({
    Query$fetch_number_of_subscribers$service_provider_subscriber_aggregate?
        service_provider_subscriber_aggregate,
    String? $__typename,
  });
  CopyWith$Query$fetch_number_of_subscribers$service_provider_subscriber_aggregate<
      TRes> get service_provider_subscriber_aggregate;
}

class _CopyWithImpl$Query$fetch_number_of_subscribers<TRes>
    implements CopyWith$Query$fetch_number_of_subscribers<TRes> {
  _CopyWithImpl$Query$fetch_number_of_subscribers(
    this._instance,
    this._then,
  );

  final Query$fetch_number_of_subscribers _instance;

  final TRes Function(Query$fetch_number_of_subscribers) _then;

  static const _undefined = {};

  TRes call({
    Object? service_provider_subscriber_aggregate = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$fetch_number_of_subscribers(
        service_provider_subscriber_aggregate:
            service_provider_subscriber_aggregate == _undefined ||
                    service_provider_subscriber_aggregate == null
                ? _instance.service_provider_subscriber_aggregate
                : (service_provider_subscriber_aggregate
                    as Query$fetch_number_of_subscribers$service_provider_subscriber_aggregate),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$fetch_number_of_subscribers$service_provider_subscriber_aggregate<
      TRes> get service_provider_subscriber_aggregate {
    final local$service_provider_subscriber_aggregate =
        _instance.service_provider_subscriber_aggregate;
    return CopyWith$Query$fetch_number_of_subscribers$service_provider_subscriber_aggregate(
        local$service_provider_subscriber_aggregate,
        (e) => call(service_provider_subscriber_aggregate: e));
  }
}

class _CopyWithStubImpl$Query$fetch_number_of_subscribers<TRes>
    implements CopyWith$Query$fetch_number_of_subscribers<TRes> {
  _CopyWithStubImpl$Query$fetch_number_of_subscribers(this._res);

  TRes _res;

  call({
    Query$fetch_number_of_subscribers$service_provider_subscriber_aggregate?
        service_provider_subscriber_aggregate,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$fetch_number_of_subscribers$service_provider_subscriber_aggregate<
          TRes>
      get service_provider_subscriber_aggregate =>
          CopyWith$Query$fetch_number_of_subscribers$service_provider_subscriber_aggregate
              .stub(_res);
}

const documentNodeQueryfetch_number_of_subscribers = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'fetch_number_of_subscribers'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'service_provider_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'service_provider_type')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'service_provider_subscriber_aggregate'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'service_provider_id'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(
                        name: NameNode(value: 'service_provider_id')),
                  )
                ]),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'service_provider_type'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(
                        name: NameNode(value: 'service_provider_type')),
                  )
                ]),
              ),
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'aggregate'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'count'),
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
Query$fetch_number_of_subscribers _parserFn$Query$fetch_number_of_subscribers(
        Map<String, dynamic> data) =>
    Query$fetch_number_of_subscribers.fromJson(data);

class Options$Query$fetch_number_of_subscribers
    extends graphql.QueryOptions<Query$fetch_number_of_subscribers> {
  Options$Query$fetch_number_of_subscribers({
    String? operationName,
    Variables$Query$fetch_number_of_subscribers? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
  }) : super(
          variables: variables?.toJson() ?? {},
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          pollInterval: pollInterval,
          context: context,
          document: documentNodeQueryfetch_number_of_subscribers,
          parserFn: _parserFn$Query$fetch_number_of_subscribers,
        );
}

class WatchOptions$Query$fetch_number_of_subscribers
    extends graphql.WatchQueryOptions<Query$fetch_number_of_subscribers> {
  WatchOptions$Query$fetch_number_of_subscribers({
    String? operationName,
    Variables$Query$fetch_number_of_subscribers? variables,
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
          variables: variables?.toJson() ?? {},
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          context: context,
          document: documentNodeQueryfetch_number_of_subscribers,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$fetch_number_of_subscribers,
        );
}

class FetchMoreOptions$Query$fetch_number_of_subscribers
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$fetch_number_of_subscribers({
    required graphql.UpdateQuery updateQuery,
    Variables$Query$fetch_number_of_subscribers? variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables?.toJson() ?? {},
          document: documentNodeQueryfetch_number_of_subscribers,
        );
}

extension ClientExtension$Query$fetch_number_of_subscribers
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$fetch_number_of_subscribers>>
      query$fetch_number_of_subscribers(
              [Options$Query$fetch_number_of_subscribers? options]) async =>
          await this
              .query(options ?? Options$Query$fetch_number_of_subscribers());
  graphql.ObservableQuery<Query$fetch_number_of_subscribers>
      watchQuery$fetch_number_of_subscribers(
              [WatchOptions$Query$fetch_number_of_subscribers? options]) =>
          this.watchQuery(
              options ?? WatchOptions$Query$fetch_number_of_subscribers());
  void writeQuery$fetch_number_of_subscribers({
    required Query$fetch_number_of_subscribers data,
    Variables$Query$fetch_number_of_subscribers? variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryfetch_number_of_subscribers),
          variables: variables?.toJson() ?? const {},
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$fetch_number_of_subscribers? readQuery$fetch_number_of_subscribers({
    Variables$Query$fetch_number_of_subscribers? variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQueryfetch_number_of_subscribers),
        variables: variables?.toJson() ?? const {},
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$fetch_number_of_subscribers.fromJson(result);
  }
}

class Query$fetch_number_of_subscribers$service_provider_subscriber_aggregate {
  Query$fetch_number_of_subscribers$service_provider_subscriber_aggregate({
    this.aggregate,
    required this.$__typename,
  });

  factory Query$fetch_number_of_subscribers$service_provider_subscriber_aggregate.fromJson(
      Map<String, dynamic> json) {
    final l$aggregate = json['aggregate'];
    final l$$__typename = json['__typename'];
    return Query$fetch_number_of_subscribers$service_provider_subscriber_aggregate(
      aggregate: l$aggregate == null
          ? null
          : Query$fetch_number_of_subscribers$service_provider_subscriber_aggregate$aggregate
              .fromJson((l$aggregate as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$fetch_number_of_subscribers$service_provider_subscriber_aggregate$aggregate?
      aggregate;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$aggregate = aggregate;
    _resultData['aggregate'] = l$aggregate?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$aggregate = aggregate;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$aggregate,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$fetch_number_of_subscribers$service_provider_subscriber_aggregate) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$aggregate = aggregate;
    final lOther$aggregate = other.aggregate;
    if (l$aggregate != lOther$aggregate) {
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

extension UtilityExtension$Query$fetch_number_of_subscribers$service_provider_subscriber_aggregate
    on Query$fetch_number_of_subscribers$service_provider_subscriber_aggregate {
  CopyWith$Query$fetch_number_of_subscribers$service_provider_subscriber_aggregate<
          Query$fetch_number_of_subscribers$service_provider_subscriber_aggregate>
      get copyWith =>
          CopyWith$Query$fetch_number_of_subscribers$service_provider_subscriber_aggregate(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$fetch_number_of_subscribers$service_provider_subscriber_aggregate<
    TRes> {
  factory CopyWith$Query$fetch_number_of_subscribers$service_provider_subscriber_aggregate(
    Query$fetch_number_of_subscribers$service_provider_subscriber_aggregate
        instance,
    TRes Function(
            Query$fetch_number_of_subscribers$service_provider_subscriber_aggregate)
        then,
  ) = _CopyWithImpl$Query$fetch_number_of_subscribers$service_provider_subscriber_aggregate;

  factory CopyWith$Query$fetch_number_of_subscribers$service_provider_subscriber_aggregate.stub(
          TRes res) =
      _CopyWithStubImpl$Query$fetch_number_of_subscribers$service_provider_subscriber_aggregate;

  TRes call({
    Query$fetch_number_of_subscribers$service_provider_subscriber_aggregate$aggregate?
        aggregate,
    String? $__typename,
  });
  CopyWith$Query$fetch_number_of_subscribers$service_provider_subscriber_aggregate$aggregate<
      TRes> get aggregate;
}

class _CopyWithImpl$Query$fetch_number_of_subscribers$service_provider_subscriber_aggregate<
        TRes>
    implements
        CopyWith$Query$fetch_number_of_subscribers$service_provider_subscriber_aggregate<
            TRes> {
  _CopyWithImpl$Query$fetch_number_of_subscribers$service_provider_subscriber_aggregate(
    this._instance,
    this._then,
  );

  final Query$fetch_number_of_subscribers$service_provider_subscriber_aggregate
      _instance;

  final TRes Function(
          Query$fetch_number_of_subscribers$service_provider_subscriber_aggregate)
      _then;

  static const _undefined = {};

  TRes call({
    Object? aggregate = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$fetch_number_of_subscribers$service_provider_subscriber_aggregate(
        aggregate: aggregate == _undefined
            ? _instance.aggregate
            : (aggregate
                as Query$fetch_number_of_subscribers$service_provider_subscriber_aggregate$aggregate?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$fetch_number_of_subscribers$service_provider_subscriber_aggregate$aggregate<
      TRes> get aggregate {
    final local$aggregate = _instance.aggregate;
    return local$aggregate == null
        ? CopyWith$Query$fetch_number_of_subscribers$service_provider_subscriber_aggregate$aggregate
            .stub(_then(_instance))
        : CopyWith$Query$fetch_number_of_subscribers$service_provider_subscriber_aggregate$aggregate(
            local$aggregate, (e) => call(aggregate: e));
  }
}

class _CopyWithStubImpl$Query$fetch_number_of_subscribers$service_provider_subscriber_aggregate<
        TRes>
    implements
        CopyWith$Query$fetch_number_of_subscribers$service_provider_subscriber_aggregate<
            TRes> {
  _CopyWithStubImpl$Query$fetch_number_of_subscribers$service_provider_subscriber_aggregate(
      this._res);

  TRes _res;

  call({
    Query$fetch_number_of_subscribers$service_provider_subscriber_aggregate$aggregate?
        aggregate,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$fetch_number_of_subscribers$service_provider_subscriber_aggregate$aggregate<
          TRes>
      get aggregate =>
          CopyWith$Query$fetch_number_of_subscribers$service_provider_subscriber_aggregate$aggregate
              .stub(_res);
}

class Query$fetch_number_of_subscribers$service_provider_subscriber_aggregate$aggregate {
  Query$fetch_number_of_subscribers$service_provider_subscriber_aggregate$aggregate({
    required this.count,
    required this.$__typename,
  });

  factory Query$fetch_number_of_subscribers$service_provider_subscriber_aggregate$aggregate.fromJson(
      Map<String, dynamic> json) {
    final l$count = json['count'];
    final l$$__typename = json['__typename'];
    return Query$fetch_number_of_subscribers$service_provider_subscriber_aggregate$aggregate(
      count: (l$count as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int count;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$count = count;
    _resultData['count'] = l$count;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$count = count;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$count,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$fetch_number_of_subscribers$service_provider_subscriber_aggregate$aggregate) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$count = count;
    final lOther$count = other.count;
    if (l$count != lOther$count) {
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

extension UtilityExtension$Query$fetch_number_of_subscribers$service_provider_subscriber_aggregate$aggregate
    on Query$fetch_number_of_subscribers$service_provider_subscriber_aggregate$aggregate {
  CopyWith$Query$fetch_number_of_subscribers$service_provider_subscriber_aggregate$aggregate<
          Query$fetch_number_of_subscribers$service_provider_subscriber_aggregate$aggregate>
      get copyWith =>
          CopyWith$Query$fetch_number_of_subscribers$service_provider_subscriber_aggregate$aggregate(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$fetch_number_of_subscribers$service_provider_subscriber_aggregate$aggregate<
    TRes> {
  factory CopyWith$Query$fetch_number_of_subscribers$service_provider_subscriber_aggregate$aggregate(
    Query$fetch_number_of_subscribers$service_provider_subscriber_aggregate$aggregate
        instance,
    TRes Function(
            Query$fetch_number_of_subscribers$service_provider_subscriber_aggregate$aggregate)
        then,
  ) = _CopyWithImpl$Query$fetch_number_of_subscribers$service_provider_subscriber_aggregate$aggregate;

  factory CopyWith$Query$fetch_number_of_subscribers$service_provider_subscriber_aggregate$aggregate.stub(
          TRes res) =
      _CopyWithStubImpl$Query$fetch_number_of_subscribers$service_provider_subscriber_aggregate$aggregate;

  TRes call({
    int? count,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$fetch_number_of_subscribers$service_provider_subscriber_aggregate$aggregate<
        TRes>
    implements
        CopyWith$Query$fetch_number_of_subscribers$service_provider_subscriber_aggregate$aggregate<
            TRes> {
  _CopyWithImpl$Query$fetch_number_of_subscribers$service_provider_subscriber_aggregate$aggregate(
    this._instance,
    this._then,
  );

  final Query$fetch_number_of_subscribers$service_provider_subscriber_aggregate$aggregate
      _instance;

  final TRes Function(
          Query$fetch_number_of_subscribers$service_provider_subscriber_aggregate$aggregate)
      _then;

  static const _undefined = {};

  TRes call({
    Object? count = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$fetch_number_of_subscribers$service_provider_subscriber_aggregate$aggregate(
        count: count == _undefined || count == null
            ? _instance.count
            : (count as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$fetch_number_of_subscribers$service_provider_subscriber_aggregate$aggregate<
        TRes>
    implements
        CopyWith$Query$fetch_number_of_subscribers$service_provider_subscriber_aggregate$aggregate<
            TRes> {
  _CopyWithStubImpl$Query$fetch_number_of_subscribers$service_provider_subscriber_aggregate$aggregate(
      this._res);

  TRes _res;

  call({
    int? count,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$subscribe_service_provider {
  factory Variables$Mutation$subscribe_service_provider({
    int? customer_id,
    int? service_provider_id,
    String? service_provider_type,
  }) =>
      Variables$Mutation$subscribe_service_provider._({
        if (customer_id != null) r'customer_id': customer_id,
        if (service_provider_id != null)
          r'service_provider_id': service_provider_id,
        if (service_provider_type != null)
          r'service_provider_type': service_provider_type,
      });

  Variables$Mutation$subscribe_service_provider._(this._$data);

  factory Variables$Mutation$subscribe_service_provider.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('customer_id')) {
      final l$customer_id = data['customer_id'];
      result$data['customer_id'] = (l$customer_id as int?);
    }
    if (data.containsKey('service_provider_id')) {
      final l$service_provider_id = data['service_provider_id'];
      result$data['service_provider_id'] = (l$service_provider_id as int?);
    }
    if (data.containsKey('service_provider_type')) {
      final l$service_provider_type = data['service_provider_type'];
      result$data['service_provider_type'] =
          (l$service_provider_type as String?);
    }
    return Variables$Mutation$subscribe_service_provider._(result$data);
  }

  Map<String, dynamic> _$data;

  int? get customer_id => (_$data['customer_id'] as int?);
  int? get service_provider_id => (_$data['service_provider_id'] as int?);
  String? get service_provider_type =>
      (_$data['service_provider_type'] as String?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('customer_id')) {
      final l$customer_id = customer_id;
      result$data['customer_id'] = l$customer_id;
    }
    if (_$data.containsKey('service_provider_id')) {
      final l$service_provider_id = service_provider_id;
      result$data['service_provider_id'] = l$service_provider_id;
    }
    if (_$data.containsKey('service_provider_type')) {
      final l$service_provider_type = service_provider_type;
      result$data['service_provider_type'] = l$service_provider_type;
    }
    return result$data;
  }

  CopyWith$Variables$Mutation$subscribe_service_provider<
          Variables$Mutation$subscribe_service_provider>
      get copyWith => CopyWith$Variables$Mutation$subscribe_service_provider(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$subscribe_service_provider) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$customer_id = customer_id;
    final lOther$customer_id = other.customer_id;
    if (_$data.containsKey('customer_id') !=
        other._$data.containsKey('customer_id')) {
      return false;
    }
    if (l$customer_id != lOther$customer_id) {
      return false;
    }
    final l$service_provider_id = service_provider_id;
    final lOther$service_provider_id = other.service_provider_id;
    if (_$data.containsKey('service_provider_id') !=
        other._$data.containsKey('service_provider_id')) {
      return false;
    }
    if (l$service_provider_id != lOther$service_provider_id) {
      return false;
    }
    final l$service_provider_type = service_provider_type;
    final lOther$service_provider_type = other.service_provider_type;
    if (_$data.containsKey('service_provider_type') !=
        other._$data.containsKey('service_provider_type')) {
      return false;
    }
    if (l$service_provider_type != lOther$service_provider_type) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$customer_id = customer_id;
    final l$service_provider_id = service_provider_id;
    final l$service_provider_type = service_provider_type;
    return Object.hashAll([
      _$data.containsKey('customer_id') ? l$customer_id : const {},
      _$data.containsKey('service_provider_id')
          ? l$service_provider_id
          : const {},
      _$data.containsKey('service_provider_type')
          ? l$service_provider_type
          : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$subscribe_service_provider<TRes> {
  factory CopyWith$Variables$Mutation$subscribe_service_provider(
    Variables$Mutation$subscribe_service_provider instance,
    TRes Function(Variables$Mutation$subscribe_service_provider) then,
  ) = _CopyWithImpl$Variables$Mutation$subscribe_service_provider;

  factory CopyWith$Variables$Mutation$subscribe_service_provider.stub(
          TRes res) =
      _CopyWithStubImpl$Variables$Mutation$subscribe_service_provider;

  TRes call({
    int? customer_id,
    int? service_provider_id,
    String? service_provider_type,
  });
}

class _CopyWithImpl$Variables$Mutation$subscribe_service_provider<TRes>
    implements CopyWith$Variables$Mutation$subscribe_service_provider<TRes> {
  _CopyWithImpl$Variables$Mutation$subscribe_service_provider(
    this._instance,
    this._then,
  );

  final Variables$Mutation$subscribe_service_provider _instance;

  final TRes Function(Variables$Mutation$subscribe_service_provider) _then;

  static const _undefined = {};

  TRes call({
    Object? customer_id = _undefined,
    Object? service_provider_id = _undefined,
    Object? service_provider_type = _undefined,
  }) =>
      _then(Variables$Mutation$subscribe_service_provider._({
        ..._instance._$data,
        if (customer_id != _undefined) 'customer_id': (customer_id as int?),
        if (service_provider_id != _undefined)
          'service_provider_id': (service_provider_id as int?),
        if (service_provider_type != _undefined)
          'service_provider_type': (service_provider_type as String?),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$subscribe_service_provider<TRes>
    implements CopyWith$Variables$Mutation$subscribe_service_provider<TRes> {
  _CopyWithStubImpl$Variables$Mutation$subscribe_service_provider(this._res);

  TRes _res;

  call({
    int? customer_id,
    int? service_provider_id,
    String? service_provider_type,
  }) =>
      _res;
}

class Mutation$subscribe_service_provider {
  Mutation$subscribe_service_provider({
    this.insert_service_provider_subscriber_one,
    required this.$__typename,
  });

  factory Mutation$subscribe_service_provider.fromJson(
      Map<String, dynamic> json) {
    final l$insert_service_provider_subscriber_one =
        json['insert_service_provider_subscriber_one'];
    final l$$__typename = json['__typename'];
    return Mutation$subscribe_service_provider(
      insert_service_provider_subscriber_one:
          l$insert_service_provider_subscriber_one == null
              ? null
              : Mutation$subscribe_service_provider$insert_service_provider_subscriber_one
                  .fromJson((l$insert_service_provider_subscriber_one
                      as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$subscribe_service_provider$insert_service_provider_subscriber_one?
      insert_service_provider_subscriber_one;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$insert_service_provider_subscriber_one =
        insert_service_provider_subscriber_one;
    _resultData['insert_service_provider_subscriber_one'] =
        l$insert_service_provider_subscriber_one?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$insert_service_provider_subscriber_one =
        insert_service_provider_subscriber_one;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$insert_service_provider_subscriber_one,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$subscribe_service_provider) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$insert_service_provider_subscriber_one =
        insert_service_provider_subscriber_one;
    final lOther$insert_service_provider_subscriber_one =
        other.insert_service_provider_subscriber_one;
    if (l$insert_service_provider_subscriber_one !=
        lOther$insert_service_provider_subscriber_one) {
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

extension UtilityExtension$Mutation$subscribe_service_provider
    on Mutation$subscribe_service_provider {
  CopyWith$Mutation$subscribe_service_provider<
          Mutation$subscribe_service_provider>
      get copyWith => CopyWith$Mutation$subscribe_service_provider(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$subscribe_service_provider<TRes> {
  factory CopyWith$Mutation$subscribe_service_provider(
    Mutation$subscribe_service_provider instance,
    TRes Function(Mutation$subscribe_service_provider) then,
  ) = _CopyWithImpl$Mutation$subscribe_service_provider;

  factory CopyWith$Mutation$subscribe_service_provider.stub(TRes res) =
      _CopyWithStubImpl$Mutation$subscribe_service_provider;

  TRes call({
    Mutation$subscribe_service_provider$insert_service_provider_subscriber_one?
        insert_service_provider_subscriber_one,
    String? $__typename,
  });
  CopyWith$Mutation$subscribe_service_provider$insert_service_provider_subscriber_one<
      TRes> get insert_service_provider_subscriber_one;
}

class _CopyWithImpl$Mutation$subscribe_service_provider<TRes>
    implements CopyWith$Mutation$subscribe_service_provider<TRes> {
  _CopyWithImpl$Mutation$subscribe_service_provider(
    this._instance,
    this._then,
  );

  final Mutation$subscribe_service_provider _instance;

  final TRes Function(Mutation$subscribe_service_provider) _then;

  static const _undefined = {};

  TRes call({
    Object? insert_service_provider_subscriber_one = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$subscribe_service_provider(
        insert_service_provider_subscriber_one:
            insert_service_provider_subscriber_one == _undefined
                ? _instance.insert_service_provider_subscriber_one
                : (insert_service_provider_subscriber_one
                    as Mutation$subscribe_service_provider$insert_service_provider_subscriber_one?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$subscribe_service_provider$insert_service_provider_subscriber_one<
      TRes> get insert_service_provider_subscriber_one {
    final local$insert_service_provider_subscriber_one =
        _instance.insert_service_provider_subscriber_one;
    return local$insert_service_provider_subscriber_one == null
        ? CopyWith$Mutation$subscribe_service_provider$insert_service_provider_subscriber_one
            .stub(_then(_instance))
        : CopyWith$Mutation$subscribe_service_provider$insert_service_provider_subscriber_one(
            local$insert_service_provider_subscriber_one,
            (e) => call(insert_service_provider_subscriber_one: e));
  }
}

class _CopyWithStubImpl$Mutation$subscribe_service_provider<TRes>
    implements CopyWith$Mutation$subscribe_service_provider<TRes> {
  _CopyWithStubImpl$Mutation$subscribe_service_provider(this._res);

  TRes _res;

  call({
    Mutation$subscribe_service_provider$insert_service_provider_subscriber_one?
        insert_service_provider_subscriber_one,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$subscribe_service_provider$insert_service_provider_subscriber_one<
          TRes>
      get insert_service_provider_subscriber_one =>
          CopyWith$Mutation$subscribe_service_provider$insert_service_provider_subscriber_one
              .stub(_res);
}

const documentNodeMutationsubscribe_service_provider =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'subscribe_service_provider'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'customer_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'service_provider_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'service_provider_type')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'insert_service_provider_subscriber_one'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'object'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'customer_id'),
                value: VariableNode(name: NameNode(value: 'customer_id')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'service_provider_id'),
                value:
                    VariableNode(name: NameNode(value: 'service_provider_id')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'service_provider_type'),
                value: VariableNode(
                    name: NameNode(value: 'service_provider_type')),
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
Mutation$subscribe_service_provider
    _parserFn$Mutation$subscribe_service_provider(Map<String, dynamic> data) =>
        Mutation$subscribe_service_provider.fromJson(data);
typedef OnMutationCompleted$Mutation$subscribe_service_provider = FutureOr<void>
    Function(
  dynamic,
  Mutation$subscribe_service_provider?,
);

class Options$Mutation$subscribe_service_provider
    extends graphql.MutationOptions<Mutation$subscribe_service_provider> {
  Options$Mutation$subscribe_service_provider({
    String? operationName,
    Variables$Mutation$subscribe_service_provider? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$subscribe_service_provider? onCompleted,
    graphql.OnMutationUpdate<Mutation$subscribe_service_provider>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables?.toJson() ?? {},
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
                        : _parserFn$Mutation$subscribe_service_provider(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationsubscribe_service_provider,
          parserFn: _parserFn$Mutation$subscribe_service_provider,
        );

  final OnMutationCompleted$Mutation$subscribe_service_provider?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$subscribe_service_provider
    extends graphql.WatchQueryOptions<Mutation$subscribe_service_provider> {
  WatchOptions$Mutation$subscribe_service_provider({
    String? operationName,
    Variables$Mutation$subscribe_service_provider? variables,
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
          variables: variables?.toJson() ?? {},
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          context: context,
          document: documentNodeMutationsubscribe_service_provider,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$subscribe_service_provider,
        );
}

extension ClientExtension$Mutation$subscribe_service_provider
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$subscribe_service_provider>>
      mutate$subscribe_service_provider(
              [Options$Mutation$subscribe_service_provider? options]) async =>
          await this
              .mutate(options ?? Options$Mutation$subscribe_service_provider());
  graphql.ObservableQuery<Mutation$subscribe_service_provider>
      watchMutation$subscribe_service_provider(
              [WatchOptions$Mutation$subscribe_service_provider? options]) =>
          this.watchMutation(
              options ?? WatchOptions$Mutation$subscribe_service_provider());
}

class Mutation$subscribe_service_provider$insert_service_provider_subscriber_one {
  Mutation$subscribe_service_provider$insert_service_provider_subscriber_one({
    required this.id,
    required this.$__typename,
  });

  factory Mutation$subscribe_service_provider$insert_service_provider_subscriber_one.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Mutation$subscribe_service_provider$insert_service_provider_subscriber_one(
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
            is Mutation$subscribe_service_provider$insert_service_provider_subscriber_one) ||
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

extension UtilityExtension$Mutation$subscribe_service_provider$insert_service_provider_subscriber_one
    on Mutation$subscribe_service_provider$insert_service_provider_subscriber_one {
  CopyWith$Mutation$subscribe_service_provider$insert_service_provider_subscriber_one<
          Mutation$subscribe_service_provider$insert_service_provider_subscriber_one>
      get copyWith =>
          CopyWith$Mutation$subscribe_service_provider$insert_service_provider_subscriber_one(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$subscribe_service_provider$insert_service_provider_subscriber_one<
    TRes> {
  factory CopyWith$Mutation$subscribe_service_provider$insert_service_provider_subscriber_one(
    Mutation$subscribe_service_provider$insert_service_provider_subscriber_one
        instance,
    TRes Function(
            Mutation$subscribe_service_provider$insert_service_provider_subscriber_one)
        then,
  ) = _CopyWithImpl$Mutation$subscribe_service_provider$insert_service_provider_subscriber_one;

  factory CopyWith$Mutation$subscribe_service_provider$insert_service_provider_subscriber_one.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$subscribe_service_provider$insert_service_provider_subscriber_one;

  TRes call({
    int? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$subscribe_service_provider$insert_service_provider_subscriber_one<
        TRes>
    implements
        CopyWith$Mutation$subscribe_service_provider$insert_service_provider_subscriber_one<
            TRes> {
  _CopyWithImpl$Mutation$subscribe_service_provider$insert_service_provider_subscriber_one(
    this._instance,
    this._then,
  );

  final Mutation$subscribe_service_provider$insert_service_provider_subscriber_one
      _instance;

  final TRes Function(
          Mutation$subscribe_service_provider$insert_service_provider_subscriber_one)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Mutation$subscribe_service_provider$insert_service_provider_subscriber_one(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$subscribe_service_provider$insert_service_provider_subscriber_one<
        TRes>
    implements
        CopyWith$Mutation$subscribe_service_provider$insert_service_provider_subscriber_one<
            TRes> {
  _CopyWithStubImpl$Mutation$subscribe_service_provider$insert_service_provider_subscriber_one(
      this._res);

  TRes _res;

  call({
    int? id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$unsubscribe_service_provider {
  factory Variables$Mutation$unsubscribe_service_provider({
    int? customer_id,
    int? service_provider_id,
    String? service_provider_type,
  }) =>
      Variables$Mutation$unsubscribe_service_provider._({
        if (customer_id != null) r'customer_id': customer_id,
        if (service_provider_id != null)
          r'service_provider_id': service_provider_id,
        if (service_provider_type != null)
          r'service_provider_type': service_provider_type,
      });

  Variables$Mutation$unsubscribe_service_provider._(this._$data);

  factory Variables$Mutation$unsubscribe_service_provider.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('customer_id')) {
      final l$customer_id = data['customer_id'];
      result$data['customer_id'] = (l$customer_id as int?);
    }
    if (data.containsKey('service_provider_id')) {
      final l$service_provider_id = data['service_provider_id'];
      result$data['service_provider_id'] = (l$service_provider_id as int?);
    }
    if (data.containsKey('service_provider_type')) {
      final l$service_provider_type = data['service_provider_type'];
      result$data['service_provider_type'] =
          (l$service_provider_type as String?);
    }
    return Variables$Mutation$unsubscribe_service_provider._(result$data);
  }

  Map<String, dynamic> _$data;

  int? get customer_id => (_$data['customer_id'] as int?);
  int? get service_provider_id => (_$data['service_provider_id'] as int?);
  String? get service_provider_type =>
      (_$data['service_provider_type'] as String?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('customer_id')) {
      final l$customer_id = customer_id;
      result$data['customer_id'] = l$customer_id;
    }
    if (_$data.containsKey('service_provider_id')) {
      final l$service_provider_id = service_provider_id;
      result$data['service_provider_id'] = l$service_provider_id;
    }
    if (_$data.containsKey('service_provider_type')) {
      final l$service_provider_type = service_provider_type;
      result$data['service_provider_type'] = l$service_provider_type;
    }
    return result$data;
  }

  CopyWith$Variables$Mutation$unsubscribe_service_provider<
          Variables$Mutation$unsubscribe_service_provider>
      get copyWith => CopyWith$Variables$Mutation$unsubscribe_service_provider(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$unsubscribe_service_provider) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$customer_id = customer_id;
    final lOther$customer_id = other.customer_id;
    if (_$data.containsKey('customer_id') !=
        other._$data.containsKey('customer_id')) {
      return false;
    }
    if (l$customer_id != lOther$customer_id) {
      return false;
    }
    final l$service_provider_id = service_provider_id;
    final lOther$service_provider_id = other.service_provider_id;
    if (_$data.containsKey('service_provider_id') !=
        other._$data.containsKey('service_provider_id')) {
      return false;
    }
    if (l$service_provider_id != lOther$service_provider_id) {
      return false;
    }
    final l$service_provider_type = service_provider_type;
    final lOther$service_provider_type = other.service_provider_type;
    if (_$data.containsKey('service_provider_type') !=
        other._$data.containsKey('service_provider_type')) {
      return false;
    }
    if (l$service_provider_type != lOther$service_provider_type) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$customer_id = customer_id;
    final l$service_provider_id = service_provider_id;
    final l$service_provider_type = service_provider_type;
    return Object.hashAll([
      _$data.containsKey('customer_id') ? l$customer_id : const {},
      _$data.containsKey('service_provider_id')
          ? l$service_provider_id
          : const {},
      _$data.containsKey('service_provider_type')
          ? l$service_provider_type
          : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$unsubscribe_service_provider<TRes> {
  factory CopyWith$Variables$Mutation$unsubscribe_service_provider(
    Variables$Mutation$unsubscribe_service_provider instance,
    TRes Function(Variables$Mutation$unsubscribe_service_provider) then,
  ) = _CopyWithImpl$Variables$Mutation$unsubscribe_service_provider;

  factory CopyWith$Variables$Mutation$unsubscribe_service_provider.stub(
          TRes res) =
      _CopyWithStubImpl$Variables$Mutation$unsubscribe_service_provider;

  TRes call({
    int? customer_id,
    int? service_provider_id,
    String? service_provider_type,
  });
}

class _CopyWithImpl$Variables$Mutation$unsubscribe_service_provider<TRes>
    implements CopyWith$Variables$Mutation$unsubscribe_service_provider<TRes> {
  _CopyWithImpl$Variables$Mutation$unsubscribe_service_provider(
    this._instance,
    this._then,
  );

  final Variables$Mutation$unsubscribe_service_provider _instance;

  final TRes Function(Variables$Mutation$unsubscribe_service_provider) _then;

  static const _undefined = {};

  TRes call({
    Object? customer_id = _undefined,
    Object? service_provider_id = _undefined,
    Object? service_provider_type = _undefined,
  }) =>
      _then(Variables$Mutation$unsubscribe_service_provider._({
        ..._instance._$data,
        if (customer_id != _undefined) 'customer_id': (customer_id as int?),
        if (service_provider_id != _undefined)
          'service_provider_id': (service_provider_id as int?),
        if (service_provider_type != _undefined)
          'service_provider_type': (service_provider_type as String?),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$unsubscribe_service_provider<TRes>
    implements CopyWith$Variables$Mutation$unsubscribe_service_provider<TRes> {
  _CopyWithStubImpl$Variables$Mutation$unsubscribe_service_provider(this._res);

  TRes _res;

  call({
    int? customer_id,
    int? service_provider_id,
    String? service_provider_type,
  }) =>
      _res;
}

class Mutation$unsubscribe_service_provider {
  Mutation$unsubscribe_service_provider({
    this.delete_service_provider_subscriber,
    required this.$__typename,
  });

  factory Mutation$unsubscribe_service_provider.fromJson(
      Map<String, dynamic> json) {
    final l$delete_service_provider_subscriber =
        json['delete_service_provider_subscriber'];
    final l$$__typename = json['__typename'];
    return Mutation$unsubscribe_service_provider(
      delete_service_provider_subscriber: l$delete_service_provider_subscriber ==
              null
          ? null
          : Mutation$unsubscribe_service_provider$delete_service_provider_subscriber
              .fromJson((l$delete_service_provider_subscriber
                  as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$unsubscribe_service_provider$delete_service_provider_subscriber?
      delete_service_provider_subscriber;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$delete_service_provider_subscriber =
        delete_service_provider_subscriber;
    _resultData['delete_service_provider_subscriber'] =
        l$delete_service_provider_subscriber?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$delete_service_provider_subscriber =
        delete_service_provider_subscriber;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$delete_service_provider_subscriber,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$unsubscribe_service_provider) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$delete_service_provider_subscriber =
        delete_service_provider_subscriber;
    final lOther$delete_service_provider_subscriber =
        other.delete_service_provider_subscriber;
    if (l$delete_service_provider_subscriber !=
        lOther$delete_service_provider_subscriber) {
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

extension UtilityExtension$Mutation$unsubscribe_service_provider
    on Mutation$unsubscribe_service_provider {
  CopyWith$Mutation$unsubscribe_service_provider<
          Mutation$unsubscribe_service_provider>
      get copyWith => CopyWith$Mutation$unsubscribe_service_provider(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$unsubscribe_service_provider<TRes> {
  factory CopyWith$Mutation$unsubscribe_service_provider(
    Mutation$unsubscribe_service_provider instance,
    TRes Function(Mutation$unsubscribe_service_provider) then,
  ) = _CopyWithImpl$Mutation$unsubscribe_service_provider;

  factory CopyWith$Mutation$unsubscribe_service_provider.stub(TRes res) =
      _CopyWithStubImpl$Mutation$unsubscribe_service_provider;

  TRes call({
    Mutation$unsubscribe_service_provider$delete_service_provider_subscriber?
        delete_service_provider_subscriber,
    String? $__typename,
  });
  CopyWith$Mutation$unsubscribe_service_provider$delete_service_provider_subscriber<
      TRes> get delete_service_provider_subscriber;
}

class _CopyWithImpl$Mutation$unsubscribe_service_provider<TRes>
    implements CopyWith$Mutation$unsubscribe_service_provider<TRes> {
  _CopyWithImpl$Mutation$unsubscribe_service_provider(
    this._instance,
    this._then,
  );

  final Mutation$unsubscribe_service_provider _instance;

  final TRes Function(Mutation$unsubscribe_service_provider) _then;

  static const _undefined = {};

  TRes call({
    Object? delete_service_provider_subscriber = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$unsubscribe_service_provider(
        delete_service_provider_subscriber: delete_service_provider_subscriber ==
                _undefined
            ? _instance.delete_service_provider_subscriber
            : (delete_service_provider_subscriber
                as Mutation$unsubscribe_service_provider$delete_service_provider_subscriber?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$unsubscribe_service_provider$delete_service_provider_subscriber<
      TRes> get delete_service_provider_subscriber {
    final local$delete_service_provider_subscriber =
        _instance.delete_service_provider_subscriber;
    return local$delete_service_provider_subscriber == null
        ? CopyWith$Mutation$unsubscribe_service_provider$delete_service_provider_subscriber
            .stub(_then(_instance))
        : CopyWith$Mutation$unsubscribe_service_provider$delete_service_provider_subscriber(
            local$delete_service_provider_subscriber,
            (e) => call(delete_service_provider_subscriber: e));
  }
}

class _CopyWithStubImpl$Mutation$unsubscribe_service_provider<TRes>
    implements CopyWith$Mutation$unsubscribe_service_provider<TRes> {
  _CopyWithStubImpl$Mutation$unsubscribe_service_provider(this._res);

  TRes _res;

  call({
    Mutation$unsubscribe_service_provider$delete_service_provider_subscriber?
        delete_service_provider_subscriber,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$unsubscribe_service_provider$delete_service_provider_subscriber<
          TRes>
      get delete_service_provider_subscriber =>
          CopyWith$Mutation$unsubscribe_service_provider$delete_service_provider_subscriber
              .stub(_res);
}

const documentNodeMutationunsubscribe_service_provider =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'unsubscribe_service_provider'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'customer_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'service_provider_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'service_provider_type')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'delete_service_provider_subscriber'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'customer_id'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'customer_id')),
                  )
                ]),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'service_provider_id'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(
                        name: NameNode(value: 'service_provider_id')),
                  )
                ]),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'service_provider_type'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(
                        name: NameNode(value: 'service_provider_type')),
                  )
                ]),
              ),
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'affected_rows'),
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
Mutation$unsubscribe_service_provider
    _parserFn$Mutation$unsubscribe_service_provider(
            Map<String, dynamic> data) =>
        Mutation$unsubscribe_service_provider.fromJson(data);
typedef OnMutationCompleted$Mutation$unsubscribe_service_provider
    = FutureOr<void> Function(
  dynamic,
  Mutation$unsubscribe_service_provider?,
);

class Options$Mutation$unsubscribe_service_provider
    extends graphql.MutationOptions<Mutation$unsubscribe_service_provider> {
  Options$Mutation$unsubscribe_service_provider({
    String? operationName,
    Variables$Mutation$unsubscribe_service_provider? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$unsubscribe_service_provider? onCompleted,
    graphql.OnMutationUpdate<Mutation$unsubscribe_service_provider>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables?.toJson() ?? {},
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
                        : _parserFn$Mutation$unsubscribe_service_provider(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationunsubscribe_service_provider,
          parserFn: _parserFn$Mutation$unsubscribe_service_provider,
        );

  final OnMutationCompleted$Mutation$unsubscribe_service_provider?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$unsubscribe_service_provider
    extends graphql.WatchQueryOptions<Mutation$unsubscribe_service_provider> {
  WatchOptions$Mutation$unsubscribe_service_provider({
    String? operationName,
    Variables$Mutation$unsubscribe_service_provider? variables,
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
          variables: variables?.toJson() ?? {},
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          context: context,
          document: documentNodeMutationunsubscribe_service_provider,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$unsubscribe_service_provider,
        );
}

extension ClientExtension$Mutation$unsubscribe_service_provider
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$unsubscribe_service_provider>>
      mutate$unsubscribe_service_provider(
              [Options$Mutation$unsubscribe_service_provider? options]) async =>
          await this.mutate(
              options ?? Options$Mutation$unsubscribe_service_provider());
  graphql.ObservableQuery<Mutation$unsubscribe_service_provider>
      watchMutation$unsubscribe_service_provider(
              [WatchOptions$Mutation$unsubscribe_service_provider? options]) =>
          this.watchMutation(
              options ?? WatchOptions$Mutation$unsubscribe_service_provider());
}

class Mutation$unsubscribe_service_provider$delete_service_provider_subscriber {
  Mutation$unsubscribe_service_provider$delete_service_provider_subscriber({
    required this.affected_rows,
    required this.$__typename,
  });

  factory Mutation$unsubscribe_service_provider$delete_service_provider_subscriber.fromJson(
      Map<String, dynamic> json) {
    final l$affected_rows = json['affected_rows'];
    final l$$__typename = json['__typename'];
    return Mutation$unsubscribe_service_provider$delete_service_provider_subscriber(
      affected_rows: (l$affected_rows as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int affected_rows;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$affected_rows = affected_rows;
    _resultData['affected_rows'] = l$affected_rows;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$affected_rows = affected_rows;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$affected_rows,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Mutation$unsubscribe_service_provider$delete_service_provider_subscriber) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$affected_rows = affected_rows;
    final lOther$affected_rows = other.affected_rows;
    if (l$affected_rows != lOther$affected_rows) {
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

extension UtilityExtension$Mutation$unsubscribe_service_provider$delete_service_provider_subscriber
    on Mutation$unsubscribe_service_provider$delete_service_provider_subscriber {
  CopyWith$Mutation$unsubscribe_service_provider$delete_service_provider_subscriber<
          Mutation$unsubscribe_service_provider$delete_service_provider_subscriber>
      get copyWith =>
          CopyWith$Mutation$unsubscribe_service_provider$delete_service_provider_subscriber(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$unsubscribe_service_provider$delete_service_provider_subscriber<
    TRes> {
  factory CopyWith$Mutation$unsubscribe_service_provider$delete_service_provider_subscriber(
    Mutation$unsubscribe_service_provider$delete_service_provider_subscriber
        instance,
    TRes Function(
            Mutation$unsubscribe_service_provider$delete_service_provider_subscriber)
        then,
  ) = _CopyWithImpl$Mutation$unsubscribe_service_provider$delete_service_provider_subscriber;

  factory CopyWith$Mutation$unsubscribe_service_provider$delete_service_provider_subscriber.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$unsubscribe_service_provider$delete_service_provider_subscriber;

  TRes call({
    int? affected_rows,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$unsubscribe_service_provider$delete_service_provider_subscriber<
        TRes>
    implements
        CopyWith$Mutation$unsubscribe_service_provider$delete_service_provider_subscriber<
            TRes> {
  _CopyWithImpl$Mutation$unsubscribe_service_provider$delete_service_provider_subscriber(
    this._instance,
    this._then,
  );

  final Mutation$unsubscribe_service_provider$delete_service_provider_subscriber
      _instance;

  final TRes Function(
          Mutation$unsubscribe_service_provider$delete_service_provider_subscriber)
      _then;

  static const _undefined = {};

  TRes call({
    Object? affected_rows = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Mutation$unsubscribe_service_provider$delete_service_provider_subscriber(
        affected_rows: affected_rows == _undefined || affected_rows == null
            ? _instance.affected_rows
            : (affected_rows as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$unsubscribe_service_provider$delete_service_provider_subscriber<
        TRes>
    implements
        CopyWith$Mutation$unsubscribe_service_provider$delete_service_provider_subscriber<
            TRes> {
  _CopyWithStubImpl$Mutation$unsubscribe_service_provider$delete_service_provider_subscriber(
      this._res);

  TRes _res;

  call({
    int? affected_rows,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$write_comment {
  factory Variables$Mutation$write_comment({
    required int post_id,
    required String message,
    required int user_id,
  }) =>
      Variables$Mutation$write_comment._({
        r'post_id': post_id,
        r'message': message,
        r'user_id': user_id,
      });

  Variables$Mutation$write_comment._(this._$data);

  factory Variables$Mutation$write_comment.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$post_id = data['post_id'];
    result$data['post_id'] = (l$post_id as int);
    final l$message = data['message'];
    result$data['message'] = (l$message as String);
    final l$user_id = data['user_id'];
    result$data['user_id'] = (l$user_id as int);
    return Variables$Mutation$write_comment._(result$data);
  }

  Map<String, dynamic> _$data;

  int get post_id => (_$data['post_id'] as int);
  String get message => (_$data['message'] as String);
  int get user_id => (_$data['user_id'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$post_id = post_id;
    result$data['post_id'] = l$post_id;
    final l$message = message;
    result$data['message'] = l$message;
    final l$user_id = user_id;
    result$data['user_id'] = l$user_id;
    return result$data;
  }

  CopyWith$Variables$Mutation$write_comment<Variables$Mutation$write_comment>
      get copyWith => CopyWith$Variables$Mutation$write_comment(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$write_comment) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$post_id = post_id;
    final lOther$post_id = other.post_id;
    if (l$post_id != lOther$post_id) {
      return false;
    }
    final l$message = message;
    final lOther$message = other.message;
    if (l$message != lOther$message) {
      return false;
    }
    final l$user_id = user_id;
    final lOther$user_id = other.user_id;
    if (l$user_id != lOther$user_id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$post_id = post_id;
    final l$message = message;
    final l$user_id = user_id;
    return Object.hashAll([
      l$post_id,
      l$message,
      l$user_id,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$write_comment<TRes> {
  factory CopyWith$Variables$Mutation$write_comment(
    Variables$Mutation$write_comment instance,
    TRes Function(Variables$Mutation$write_comment) then,
  ) = _CopyWithImpl$Variables$Mutation$write_comment;

  factory CopyWith$Variables$Mutation$write_comment.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$write_comment;

  TRes call({
    int? post_id,
    String? message,
    int? user_id,
  });
}

class _CopyWithImpl$Variables$Mutation$write_comment<TRes>
    implements CopyWith$Variables$Mutation$write_comment<TRes> {
  _CopyWithImpl$Variables$Mutation$write_comment(
    this._instance,
    this._then,
  );

  final Variables$Mutation$write_comment _instance;

  final TRes Function(Variables$Mutation$write_comment) _then;

  static const _undefined = {};

  TRes call({
    Object? post_id = _undefined,
    Object? message = _undefined,
    Object? user_id = _undefined,
  }) =>
      _then(Variables$Mutation$write_comment._({
        ..._instance._$data,
        if (post_id != _undefined && post_id != null)
          'post_id': (post_id as int),
        if (message != _undefined && message != null)
          'message': (message as String),
        if (user_id != _undefined && user_id != null)
          'user_id': (user_id as int),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$write_comment<TRes>
    implements CopyWith$Variables$Mutation$write_comment<TRes> {
  _CopyWithStubImpl$Variables$Mutation$write_comment(this._res);

  TRes _res;

  call({
    int? post_id,
    String? message,
    int? user_id,
  }) =>
      _res;
}

class Mutation$write_comment {
  Mutation$write_comment({
    this.insert_service_provider_post_comment_one,
    required this.$__typename,
  });

  factory Mutation$write_comment.fromJson(Map<String, dynamic> json) {
    final l$insert_service_provider_post_comment_one =
        json['insert_service_provider_post_comment_one'];
    final l$$__typename = json['__typename'];
    return Mutation$write_comment(
      insert_service_provider_post_comment_one:
          l$insert_service_provider_post_comment_one == null
              ? null
              : Mutation$write_comment$insert_service_provider_post_comment_one
                  .fromJson((l$insert_service_provider_post_comment_one
                      as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$write_comment$insert_service_provider_post_comment_one?
      insert_service_provider_post_comment_one;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$insert_service_provider_post_comment_one =
        insert_service_provider_post_comment_one;
    _resultData['insert_service_provider_post_comment_one'] =
        l$insert_service_provider_post_comment_one?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$insert_service_provider_post_comment_one =
        insert_service_provider_post_comment_one;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$insert_service_provider_post_comment_one,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$write_comment) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$insert_service_provider_post_comment_one =
        insert_service_provider_post_comment_one;
    final lOther$insert_service_provider_post_comment_one =
        other.insert_service_provider_post_comment_one;
    if (l$insert_service_provider_post_comment_one !=
        lOther$insert_service_provider_post_comment_one) {
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

extension UtilityExtension$Mutation$write_comment on Mutation$write_comment {
  CopyWith$Mutation$write_comment<Mutation$write_comment> get copyWith =>
      CopyWith$Mutation$write_comment(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$write_comment<TRes> {
  factory CopyWith$Mutation$write_comment(
    Mutation$write_comment instance,
    TRes Function(Mutation$write_comment) then,
  ) = _CopyWithImpl$Mutation$write_comment;

  factory CopyWith$Mutation$write_comment.stub(TRes res) =
      _CopyWithStubImpl$Mutation$write_comment;

  TRes call({
    Mutation$write_comment$insert_service_provider_post_comment_one?
        insert_service_provider_post_comment_one,
    String? $__typename,
  });
  CopyWith$Mutation$write_comment$insert_service_provider_post_comment_one<TRes>
      get insert_service_provider_post_comment_one;
}

class _CopyWithImpl$Mutation$write_comment<TRes>
    implements CopyWith$Mutation$write_comment<TRes> {
  _CopyWithImpl$Mutation$write_comment(
    this._instance,
    this._then,
  );

  final Mutation$write_comment _instance;

  final TRes Function(Mutation$write_comment) _then;

  static const _undefined = {};

  TRes call({
    Object? insert_service_provider_post_comment_one = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$write_comment(
        insert_service_provider_post_comment_one:
            insert_service_provider_post_comment_one == _undefined
                ? _instance.insert_service_provider_post_comment_one
                : (insert_service_provider_post_comment_one
                    as Mutation$write_comment$insert_service_provider_post_comment_one?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$write_comment$insert_service_provider_post_comment_one<TRes>
      get insert_service_provider_post_comment_one {
    final local$insert_service_provider_post_comment_one =
        _instance.insert_service_provider_post_comment_one;
    return local$insert_service_provider_post_comment_one == null
        ? CopyWith$Mutation$write_comment$insert_service_provider_post_comment_one
            .stub(_then(_instance))
        : CopyWith$Mutation$write_comment$insert_service_provider_post_comment_one(
            local$insert_service_provider_post_comment_one,
            (e) => call(insert_service_provider_post_comment_one: e));
  }
}

class _CopyWithStubImpl$Mutation$write_comment<TRes>
    implements CopyWith$Mutation$write_comment<TRes> {
  _CopyWithStubImpl$Mutation$write_comment(this._res);

  TRes _res;

  call({
    Mutation$write_comment$insert_service_provider_post_comment_one?
        insert_service_provider_post_comment_one,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$write_comment$insert_service_provider_post_comment_one<TRes>
      get insert_service_provider_post_comment_one =>
          CopyWith$Mutation$write_comment$insert_service_provider_post_comment_one
              .stub(_res);
}

const documentNodeMutationwrite_comment = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'write_comment'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'post_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'message')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'user_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'insert_service_provider_post_comment_one'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'object'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'post_id'),
                value: VariableNode(name: NameNode(value: 'post_id')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'message'),
                value: VariableNode(name: NameNode(value: 'message')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'user_id'),
                value: VariableNode(name: NameNode(value: 'user_id')),
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
            name: NameNode(value: 'commented_on'),
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
Mutation$write_comment _parserFn$Mutation$write_comment(
        Map<String, dynamic> data) =>
    Mutation$write_comment.fromJson(data);
typedef OnMutationCompleted$Mutation$write_comment = FutureOr<void> Function(
  dynamic,
  Mutation$write_comment?,
);

class Options$Mutation$write_comment
    extends graphql.MutationOptions<Mutation$write_comment> {
  Options$Mutation$write_comment({
    String? operationName,
    required Variables$Mutation$write_comment variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$write_comment? onCompleted,
    graphql.OnMutationUpdate<Mutation$write_comment>? update,
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
                        : _parserFn$Mutation$write_comment(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationwrite_comment,
          parserFn: _parserFn$Mutation$write_comment,
        );

  final OnMutationCompleted$Mutation$write_comment? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$write_comment
    extends graphql.WatchQueryOptions<Mutation$write_comment> {
  WatchOptions$Mutation$write_comment({
    String? operationName,
    required Variables$Mutation$write_comment variables,
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
          document: documentNodeMutationwrite_comment,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$write_comment,
        );
}

extension ClientExtension$Mutation$write_comment on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$write_comment>> mutate$write_comment(
          Options$Mutation$write_comment options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$write_comment> watchMutation$write_comment(
          WatchOptions$Mutation$write_comment options) =>
      this.watchMutation(options);
}

class Mutation$write_comment$insert_service_provider_post_comment_one {
  Mutation$write_comment$insert_service_provider_post_comment_one({
    required this.id,
    required this.commented_on,
    required this.$__typename,
  });

  factory Mutation$write_comment$insert_service_provider_post_comment_one.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$commented_on = json['commented_on'];
    final l$$__typename = json['__typename'];
    return Mutation$write_comment$insert_service_provider_post_comment_one(
      id: (l$id as int),
      commented_on: (l$commented_on as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String commented_on;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$commented_on = commented_on;
    _resultData['commented_on'] = l$commented_on;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$commented_on = commented_on;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$commented_on,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Mutation$write_comment$insert_service_provider_post_comment_one) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$commented_on = commented_on;
    final lOther$commented_on = other.commented_on;
    if (l$commented_on != lOther$commented_on) {
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

extension UtilityExtension$Mutation$write_comment$insert_service_provider_post_comment_one
    on Mutation$write_comment$insert_service_provider_post_comment_one {
  CopyWith$Mutation$write_comment$insert_service_provider_post_comment_one<
          Mutation$write_comment$insert_service_provider_post_comment_one>
      get copyWith =>
          CopyWith$Mutation$write_comment$insert_service_provider_post_comment_one(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$write_comment$insert_service_provider_post_comment_one<
    TRes> {
  factory CopyWith$Mutation$write_comment$insert_service_provider_post_comment_one(
    Mutation$write_comment$insert_service_provider_post_comment_one instance,
    TRes Function(
            Mutation$write_comment$insert_service_provider_post_comment_one)
        then,
  ) = _CopyWithImpl$Mutation$write_comment$insert_service_provider_post_comment_one;

  factory CopyWith$Mutation$write_comment$insert_service_provider_post_comment_one.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$write_comment$insert_service_provider_post_comment_one;

  TRes call({
    int? id,
    String? commented_on,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$write_comment$insert_service_provider_post_comment_one<
        TRes>
    implements
        CopyWith$Mutation$write_comment$insert_service_provider_post_comment_one<
            TRes> {
  _CopyWithImpl$Mutation$write_comment$insert_service_provider_post_comment_one(
    this._instance,
    this._then,
  );

  final Mutation$write_comment$insert_service_provider_post_comment_one
      _instance;

  final TRes Function(
      Mutation$write_comment$insert_service_provider_post_comment_one) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? commented_on = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$write_comment$insert_service_provider_post_comment_one(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        commented_on: commented_on == _undefined || commented_on == null
            ? _instance.commented_on
            : (commented_on as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$write_comment$insert_service_provider_post_comment_one<
        TRes>
    implements
        CopyWith$Mutation$write_comment$insert_service_provider_post_comment_one<
            TRes> {
  _CopyWithStubImpl$Mutation$write_comment$insert_service_provider_post_comment_one(
      this._res);

  TRes _res;

  call({
    int? id,
    String? commented_on,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$update_comment_likes {
  factory Variables$Mutation$update_comment_likes({
    int? id,
    dynamic? likes,
  }) =>
      Variables$Mutation$update_comment_likes._({
        if (id != null) r'id': id,
        if (likes != null) r'likes': likes,
      });

  Variables$Mutation$update_comment_likes._(this._$data);

  factory Variables$Mutation$update_comment_likes.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('id')) {
      final l$id = data['id'];
      result$data['id'] = (l$id as int?);
    }
    if (data.containsKey('likes')) {
      final l$likes = data['likes'];
      result$data['likes'] = l$likes == null ? null : mapFromJson(l$likes);
    }
    return Variables$Mutation$update_comment_likes._(result$data);
  }

  Map<String, dynamic> _$data;

  int? get id => (_$data['id'] as int?);
  dynamic? get likes => (_$data['likes'] as dynamic?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('id')) {
      final l$id = id;
      result$data['id'] = l$id;
    }
    if (_$data.containsKey('likes')) {
      final l$likes = likes;
      result$data['likes'] = l$likes == null ? null : mapToJson(l$likes);
    }
    return result$data;
  }

  CopyWith$Variables$Mutation$update_comment_likes<
          Variables$Mutation$update_comment_likes>
      get copyWith => CopyWith$Variables$Mutation$update_comment_likes(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$update_comment_likes) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (_$data.containsKey('id') != other._$data.containsKey('id')) {
      return false;
    }
    if (l$id != lOther$id) {
      return false;
    }
    final l$likes = likes;
    final lOther$likes = other.likes;
    if (_$data.containsKey('likes') != other._$data.containsKey('likes')) {
      return false;
    }
    if (l$likes != lOther$likes) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$likes = likes;
    return Object.hashAll([
      _$data.containsKey('id') ? l$id : const {},
      _$data.containsKey('likes') ? l$likes : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$update_comment_likes<TRes> {
  factory CopyWith$Variables$Mutation$update_comment_likes(
    Variables$Mutation$update_comment_likes instance,
    TRes Function(Variables$Mutation$update_comment_likes) then,
  ) = _CopyWithImpl$Variables$Mutation$update_comment_likes;

  factory CopyWith$Variables$Mutation$update_comment_likes.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$update_comment_likes;

  TRes call({
    int? id,
    dynamic? likes,
  });
}

class _CopyWithImpl$Variables$Mutation$update_comment_likes<TRes>
    implements CopyWith$Variables$Mutation$update_comment_likes<TRes> {
  _CopyWithImpl$Variables$Mutation$update_comment_likes(
    this._instance,
    this._then,
  );

  final Variables$Mutation$update_comment_likes _instance;

  final TRes Function(Variables$Mutation$update_comment_likes) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? likes = _undefined,
  }) =>
      _then(Variables$Mutation$update_comment_likes._({
        ..._instance._$data,
        if (id != _undefined) 'id': (id as int?),
        if (likes != _undefined) 'likes': (likes as dynamic?),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$update_comment_likes<TRes>
    implements CopyWith$Variables$Mutation$update_comment_likes<TRes> {
  _CopyWithStubImpl$Variables$Mutation$update_comment_likes(this._res);

  TRes _res;

  call({
    int? id,
    dynamic? likes,
  }) =>
      _res;
}

class Mutation$update_comment_likes {
  Mutation$update_comment_likes({
    this.update_service_provider_post_comment_by_pk,
    required this.$__typename,
  });

  factory Mutation$update_comment_likes.fromJson(Map<String, dynamic> json) {
    final l$update_service_provider_post_comment_by_pk =
        json['update_service_provider_post_comment_by_pk'];
    final l$$__typename = json['__typename'];
    return Mutation$update_comment_likes(
      update_service_provider_post_comment_by_pk:
          l$update_service_provider_post_comment_by_pk == null
              ? null
              : Mutation$update_comment_likes$update_service_provider_post_comment_by_pk
                  .fromJson((l$update_service_provider_post_comment_by_pk
                      as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$update_comment_likes$update_service_provider_post_comment_by_pk?
      update_service_provider_post_comment_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$update_service_provider_post_comment_by_pk =
        update_service_provider_post_comment_by_pk;
    _resultData['update_service_provider_post_comment_by_pk'] =
        l$update_service_provider_post_comment_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$update_service_provider_post_comment_by_pk =
        update_service_provider_post_comment_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$update_service_provider_post_comment_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$update_comment_likes) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$update_service_provider_post_comment_by_pk =
        update_service_provider_post_comment_by_pk;
    final lOther$update_service_provider_post_comment_by_pk =
        other.update_service_provider_post_comment_by_pk;
    if (l$update_service_provider_post_comment_by_pk !=
        lOther$update_service_provider_post_comment_by_pk) {
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

extension UtilityExtension$Mutation$update_comment_likes
    on Mutation$update_comment_likes {
  CopyWith$Mutation$update_comment_likes<Mutation$update_comment_likes>
      get copyWith => CopyWith$Mutation$update_comment_likes(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$update_comment_likes<TRes> {
  factory CopyWith$Mutation$update_comment_likes(
    Mutation$update_comment_likes instance,
    TRes Function(Mutation$update_comment_likes) then,
  ) = _CopyWithImpl$Mutation$update_comment_likes;

  factory CopyWith$Mutation$update_comment_likes.stub(TRes res) =
      _CopyWithStubImpl$Mutation$update_comment_likes;

  TRes call({
    Mutation$update_comment_likes$update_service_provider_post_comment_by_pk?
        update_service_provider_post_comment_by_pk,
    String? $__typename,
  });
  CopyWith$Mutation$update_comment_likes$update_service_provider_post_comment_by_pk<
      TRes> get update_service_provider_post_comment_by_pk;
}

class _CopyWithImpl$Mutation$update_comment_likes<TRes>
    implements CopyWith$Mutation$update_comment_likes<TRes> {
  _CopyWithImpl$Mutation$update_comment_likes(
    this._instance,
    this._then,
  );

  final Mutation$update_comment_likes _instance;

  final TRes Function(Mutation$update_comment_likes) _then;

  static const _undefined = {};

  TRes call({
    Object? update_service_provider_post_comment_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$update_comment_likes(
        update_service_provider_post_comment_by_pk:
            update_service_provider_post_comment_by_pk == _undefined
                ? _instance.update_service_provider_post_comment_by_pk
                : (update_service_provider_post_comment_by_pk
                    as Mutation$update_comment_likes$update_service_provider_post_comment_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$update_comment_likes$update_service_provider_post_comment_by_pk<
      TRes> get update_service_provider_post_comment_by_pk {
    final local$update_service_provider_post_comment_by_pk =
        _instance.update_service_provider_post_comment_by_pk;
    return local$update_service_provider_post_comment_by_pk == null
        ? CopyWith$Mutation$update_comment_likes$update_service_provider_post_comment_by_pk
            .stub(_then(_instance))
        : CopyWith$Mutation$update_comment_likes$update_service_provider_post_comment_by_pk(
            local$update_service_provider_post_comment_by_pk,
            (e) => call(update_service_provider_post_comment_by_pk: e));
  }
}

class _CopyWithStubImpl$Mutation$update_comment_likes<TRes>
    implements CopyWith$Mutation$update_comment_likes<TRes> {
  _CopyWithStubImpl$Mutation$update_comment_likes(this._res);

  TRes _res;

  call({
    Mutation$update_comment_likes$update_service_provider_post_comment_by_pk?
        update_service_provider_post_comment_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$update_comment_likes$update_service_provider_post_comment_by_pk<
          TRes>
      get update_service_provider_post_comment_by_pk =>
          CopyWith$Mutation$update_comment_likes$update_service_provider_post_comment_by_pk
              .stub(_res);
}

const documentNodeMutationupdate_comment_likes = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'update_comment_likes'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'likes')),
        type: NamedTypeNode(
          name: NameNode(value: 'jsonb'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'update_service_provider_post_comment_by_pk'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'pk_columns'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'id')),
              )
            ]),
          ),
          ArgumentNode(
            name: NameNode(value: '_set'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'likes'),
                value: VariableNode(name: NameNode(value: 'likes')),
              )
            ]),
          ),
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
Mutation$update_comment_likes _parserFn$Mutation$update_comment_likes(
        Map<String, dynamic> data) =>
    Mutation$update_comment_likes.fromJson(data);
typedef OnMutationCompleted$Mutation$update_comment_likes = FutureOr<void>
    Function(
  dynamic,
  Mutation$update_comment_likes?,
);

class Options$Mutation$update_comment_likes
    extends graphql.MutationOptions<Mutation$update_comment_likes> {
  Options$Mutation$update_comment_likes({
    String? operationName,
    Variables$Mutation$update_comment_likes? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$update_comment_likes? onCompleted,
    graphql.OnMutationUpdate<Mutation$update_comment_likes>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables?.toJson() ?? {},
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
                        : _parserFn$Mutation$update_comment_likes(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationupdate_comment_likes,
          parserFn: _parserFn$Mutation$update_comment_likes,
        );

  final OnMutationCompleted$Mutation$update_comment_likes?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$update_comment_likes
    extends graphql.WatchQueryOptions<Mutation$update_comment_likes> {
  WatchOptions$Mutation$update_comment_likes({
    String? operationName,
    Variables$Mutation$update_comment_likes? variables,
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
          variables: variables?.toJson() ?? {},
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          context: context,
          document: documentNodeMutationupdate_comment_likes,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$update_comment_likes,
        );
}

extension ClientExtension$Mutation$update_comment_likes
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$update_comment_likes>>
      mutate$update_comment_likes(
              [Options$Mutation$update_comment_likes? options]) async =>
          await this.mutate(options ?? Options$Mutation$update_comment_likes());
  graphql.ObservableQuery<Mutation$update_comment_likes>
      watchMutation$update_comment_likes(
              [WatchOptions$Mutation$update_comment_likes? options]) =>
          this.watchMutation(
              options ?? WatchOptions$Mutation$update_comment_likes());
}

class Mutation$update_comment_likes$update_service_provider_post_comment_by_pk {
  Mutation$update_comment_likes$update_service_provider_post_comment_by_pk({
    required this.id,
    required this.$__typename,
  });

  factory Mutation$update_comment_likes$update_service_provider_post_comment_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Mutation$update_comment_likes$update_service_provider_post_comment_by_pk(
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
            is Mutation$update_comment_likes$update_service_provider_post_comment_by_pk) ||
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

extension UtilityExtension$Mutation$update_comment_likes$update_service_provider_post_comment_by_pk
    on Mutation$update_comment_likes$update_service_provider_post_comment_by_pk {
  CopyWith$Mutation$update_comment_likes$update_service_provider_post_comment_by_pk<
          Mutation$update_comment_likes$update_service_provider_post_comment_by_pk>
      get copyWith =>
          CopyWith$Mutation$update_comment_likes$update_service_provider_post_comment_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$update_comment_likes$update_service_provider_post_comment_by_pk<
    TRes> {
  factory CopyWith$Mutation$update_comment_likes$update_service_provider_post_comment_by_pk(
    Mutation$update_comment_likes$update_service_provider_post_comment_by_pk
        instance,
    TRes Function(
            Mutation$update_comment_likes$update_service_provider_post_comment_by_pk)
        then,
  ) = _CopyWithImpl$Mutation$update_comment_likes$update_service_provider_post_comment_by_pk;

  factory CopyWith$Mutation$update_comment_likes$update_service_provider_post_comment_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$update_comment_likes$update_service_provider_post_comment_by_pk;

  TRes call({
    int? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$update_comment_likes$update_service_provider_post_comment_by_pk<
        TRes>
    implements
        CopyWith$Mutation$update_comment_likes$update_service_provider_post_comment_by_pk<
            TRes> {
  _CopyWithImpl$Mutation$update_comment_likes$update_service_provider_post_comment_by_pk(
    this._instance,
    this._then,
  );

  final Mutation$update_comment_likes$update_service_provider_post_comment_by_pk
      _instance;

  final TRes Function(
          Mutation$update_comment_likes$update_service_provider_post_comment_by_pk)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Mutation$update_comment_likes$update_service_provider_post_comment_by_pk(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$update_comment_likes$update_service_provider_post_comment_by_pk<
        TRes>
    implements
        CopyWith$Mutation$update_comment_likes$update_service_provider_post_comment_by_pk<
            TRes> {
  _CopyWithStubImpl$Mutation$update_comment_likes$update_service_provider_post_comment_by_pk(
      this._res);

  TRes _res;

  call({
    int? id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$update_post_likes {
  factory Variables$Mutation$update_post_likes({
    int? id,
    dynamic? likes,
  }) =>
      Variables$Mutation$update_post_likes._({
        if (id != null) r'id': id,
        if (likes != null) r'likes': likes,
      });

  Variables$Mutation$update_post_likes._(this._$data);

  factory Variables$Mutation$update_post_likes.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('id')) {
      final l$id = data['id'];
      result$data['id'] = (l$id as int?);
    }
    if (data.containsKey('likes')) {
      final l$likes = data['likes'];
      result$data['likes'] = l$likes == null ? null : mapFromJson(l$likes);
    }
    return Variables$Mutation$update_post_likes._(result$data);
  }

  Map<String, dynamic> _$data;

  int? get id => (_$data['id'] as int?);
  dynamic? get likes => (_$data['likes'] as dynamic?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('id')) {
      final l$id = id;
      result$data['id'] = l$id;
    }
    if (_$data.containsKey('likes')) {
      final l$likes = likes;
      result$data['likes'] = l$likes == null ? null : mapToJson(l$likes);
    }
    return result$data;
  }

  CopyWith$Variables$Mutation$update_post_likes<
          Variables$Mutation$update_post_likes>
      get copyWith => CopyWith$Variables$Mutation$update_post_likes(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$update_post_likes) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (_$data.containsKey('id') != other._$data.containsKey('id')) {
      return false;
    }
    if (l$id != lOther$id) {
      return false;
    }
    final l$likes = likes;
    final lOther$likes = other.likes;
    if (_$data.containsKey('likes') != other._$data.containsKey('likes')) {
      return false;
    }
    if (l$likes != lOther$likes) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$likes = likes;
    return Object.hashAll([
      _$data.containsKey('id') ? l$id : const {},
      _$data.containsKey('likes') ? l$likes : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$update_post_likes<TRes> {
  factory CopyWith$Variables$Mutation$update_post_likes(
    Variables$Mutation$update_post_likes instance,
    TRes Function(Variables$Mutation$update_post_likes) then,
  ) = _CopyWithImpl$Variables$Mutation$update_post_likes;

  factory CopyWith$Variables$Mutation$update_post_likes.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$update_post_likes;

  TRes call({
    int? id,
    dynamic? likes,
  });
}

class _CopyWithImpl$Variables$Mutation$update_post_likes<TRes>
    implements CopyWith$Variables$Mutation$update_post_likes<TRes> {
  _CopyWithImpl$Variables$Mutation$update_post_likes(
    this._instance,
    this._then,
  );

  final Variables$Mutation$update_post_likes _instance;

  final TRes Function(Variables$Mutation$update_post_likes) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? likes = _undefined,
  }) =>
      _then(Variables$Mutation$update_post_likes._({
        ..._instance._$data,
        if (id != _undefined) 'id': (id as int?),
        if (likes != _undefined) 'likes': (likes as dynamic?),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$update_post_likes<TRes>
    implements CopyWith$Variables$Mutation$update_post_likes<TRes> {
  _CopyWithStubImpl$Variables$Mutation$update_post_likes(this._res);

  TRes _res;

  call({
    int? id,
    dynamic? likes,
  }) =>
      _res;
}

class Mutation$update_post_likes {
  Mutation$update_post_likes({
    this.update_service_provider_post_by_pk,
    required this.$__typename,
  });

  factory Mutation$update_post_likes.fromJson(Map<String, dynamic> json) {
    final l$update_service_provider_post_by_pk =
        json['update_service_provider_post_by_pk'];
    final l$$__typename = json['__typename'];
    return Mutation$update_post_likes(
      update_service_provider_post_by_pk:
          l$update_service_provider_post_by_pk == null
              ? null
              : Mutation$update_post_likes$update_service_provider_post_by_pk
                  .fromJson((l$update_service_provider_post_by_pk
                      as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$update_post_likes$update_service_provider_post_by_pk?
      update_service_provider_post_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$update_service_provider_post_by_pk =
        update_service_provider_post_by_pk;
    _resultData['update_service_provider_post_by_pk'] =
        l$update_service_provider_post_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$update_service_provider_post_by_pk =
        update_service_provider_post_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$update_service_provider_post_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$update_post_likes) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$update_service_provider_post_by_pk =
        update_service_provider_post_by_pk;
    final lOther$update_service_provider_post_by_pk =
        other.update_service_provider_post_by_pk;
    if (l$update_service_provider_post_by_pk !=
        lOther$update_service_provider_post_by_pk) {
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

extension UtilityExtension$Mutation$update_post_likes
    on Mutation$update_post_likes {
  CopyWith$Mutation$update_post_likes<Mutation$update_post_likes>
      get copyWith => CopyWith$Mutation$update_post_likes(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$update_post_likes<TRes> {
  factory CopyWith$Mutation$update_post_likes(
    Mutation$update_post_likes instance,
    TRes Function(Mutation$update_post_likes) then,
  ) = _CopyWithImpl$Mutation$update_post_likes;

  factory CopyWith$Mutation$update_post_likes.stub(TRes res) =
      _CopyWithStubImpl$Mutation$update_post_likes;

  TRes call({
    Mutation$update_post_likes$update_service_provider_post_by_pk?
        update_service_provider_post_by_pk,
    String? $__typename,
  });
  CopyWith$Mutation$update_post_likes$update_service_provider_post_by_pk<TRes>
      get update_service_provider_post_by_pk;
}

class _CopyWithImpl$Mutation$update_post_likes<TRes>
    implements CopyWith$Mutation$update_post_likes<TRes> {
  _CopyWithImpl$Mutation$update_post_likes(
    this._instance,
    this._then,
  );

  final Mutation$update_post_likes _instance;

  final TRes Function(Mutation$update_post_likes) _then;

  static const _undefined = {};

  TRes call({
    Object? update_service_provider_post_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$update_post_likes(
        update_service_provider_post_by_pk: update_service_provider_post_by_pk ==
                _undefined
            ? _instance.update_service_provider_post_by_pk
            : (update_service_provider_post_by_pk
                as Mutation$update_post_likes$update_service_provider_post_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$update_post_likes$update_service_provider_post_by_pk<TRes>
      get update_service_provider_post_by_pk {
    final local$update_service_provider_post_by_pk =
        _instance.update_service_provider_post_by_pk;
    return local$update_service_provider_post_by_pk == null
        ? CopyWith$Mutation$update_post_likes$update_service_provider_post_by_pk
            .stub(_then(_instance))
        : CopyWith$Mutation$update_post_likes$update_service_provider_post_by_pk(
            local$update_service_provider_post_by_pk,
            (e) => call(update_service_provider_post_by_pk: e));
  }
}

class _CopyWithStubImpl$Mutation$update_post_likes<TRes>
    implements CopyWith$Mutation$update_post_likes<TRes> {
  _CopyWithStubImpl$Mutation$update_post_likes(this._res);

  TRes _res;

  call({
    Mutation$update_post_likes$update_service_provider_post_by_pk?
        update_service_provider_post_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$update_post_likes$update_service_provider_post_by_pk<TRes>
      get update_service_provider_post_by_pk =>
          CopyWith$Mutation$update_post_likes$update_service_provider_post_by_pk
              .stub(_res);
}

const documentNodeMutationupdate_post_likes = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'update_post_likes'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'likes')),
        type: NamedTypeNode(
          name: NameNode(value: 'jsonb'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'update_service_provider_post_by_pk'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'pk_columns'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'id')),
              )
            ]),
          ),
          ArgumentNode(
            name: NameNode(value: '_set'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'likes'),
                value: VariableNode(name: NameNode(value: 'likes')),
              )
            ]),
          ),
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
Mutation$update_post_likes _parserFn$Mutation$update_post_likes(
        Map<String, dynamic> data) =>
    Mutation$update_post_likes.fromJson(data);
typedef OnMutationCompleted$Mutation$update_post_likes = FutureOr<void>
    Function(
  dynamic,
  Mutation$update_post_likes?,
);

class Options$Mutation$update_post_likes
    extends graphql.MutationOptions<Mutation$update_post_likes> {
  Options$Mutation$update_post_likes({
    String? operationName,
    Variables$Mutation$update_post_likes? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$update_post_likes? onCompleted,
    graphql.OnMutationUpdate<Mutation$update_post_likes>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables?.toJson() ?? {},
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
                        : _parserFn$Mutation$update_post_likes(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationupdate_post_likes,
          parserFn: _parserFn$Mutation$update_post_likes,
        );

  final OnMutationCompleted$Mutation$update_post_likes? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$update_post_likes
    extends graphql.WatchQueryOptions<Mutation$update_post_likes> {
  WatchOptions$Mutation$update_post_likes({
    String? operationName,
    Variables$Mutation$update_post_likes? variables,
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
          variables: variables?.toJson() ?? {},
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          context: context,
          document: documentNodeMutationupdate_post_likes,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$update_post_likes,
        );
}

extension ClientExtension$Mutation$update_post_likes on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$update_post_likes>>
      mutate$update_post_likes(
              [Options$Mutation$update_post_likes? options]) async =>
          await this.mutate(options ?? Options$Mutation$update_post_likes());
  graphql.ObservableQuery<
      Mutation$update_post_likes> watchMutation$update_post_likes(
          [WatchOptions$Mutation$update_post_likes? options]) =>
      this.watchMutation(options ?? WatchOptions$Mutation$update_post_likes());
}

class Mutation$update_post_likes$update_service_provider_post_by_pk {
  Mutation$update_post_likes$update_service_provider_post_by_pk({
    required this.id,
    required this.$__typename,
  });

  factory Mutation$update_post_likes$update_service_provider_post_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Mutation$update_post_likes$update_service_provider_post_by_pk(
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
            is Mutation$update_post_likes$update_service_provider_post_by_pk) ||
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

extension UtilityExtension$Mutation$update_post_likes$update_service_provider_post_by_pk
    on Mutation$update_post_likes$update_service_provider_post_by_pk {
  CopyWith$Mutation$update_post_likes$update_service_provider_post_by_pk<
          Mutation$update_post_likes$update_service_provider_post_by_pk>
      get copyWith =>
          CopyWith$Mutation$update_post_likes$update_service_provider_post_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$update_post_likes$update_service_provider_post_by_pk<
    TRes> {
  factory CopyWith$Mutation$update_post_likes$update_service_provider_post_by_pk(
    Mutation$update_post_likes$update_service_provider_post_by_pk instance,
    TRes Function(Mutation$update_post_likes$update_service_provider_post_by_pk)
        then,
  ) = _CopyWithImpl$Mutation$update_post_likes$update_service_provider_post_by_pk;

  factory CopyWith$Mutation$update_post_likes$update_service_provider_post_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$update_post_likes$update_service_provider_post_by_pk;

  TRes call({
    int? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$update_post_likes$update_service_provider_post_by_pk<
        TRes>
    implements
        CopyWith$Mutation$update_post_likes$update_service_provider_post_by_pk<
            TRes> {
  _CopyWithImpl$Mutation$update_post_likes$update_service_provider_post_by_pk(
    this._instance,
    this._then,
  );

  final Mutation$update_post_likes$update_service_provider_post_by_pk _instance;

  final TRes Function(
      Mutation$update_post_likes$update_service_provider_post_by_pk) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$update_post_likes$update_service_provider_post_by_pk(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$update_post_likes$update_service_provider_post_by_pk<
        TRes>
    implements
        CopyWith$Mutation$update_post_likes$update_service_provider_post_by_pk<
            TRes> {
  _CopyWithStubImpl$Mutation$update_post_likes$update_service_provider_post_by_pk(
      this._res);

  TRes _res;

  call({
    int? id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$create_post {
  factory Variables$Mutation$create_post({
    String? image,
    String? message,
    required int service_provider_id,
    String? service_provider_type,
  }) =>
      Variables$Mutation$create_post._({
        if (image != null) r'image': image,
        if (message != null) r'message': message,
        r'service_provider_id': service_provider_id,
        if (service_provider_type != null)
          r'service_provider_type': service_provider_type,
      });

  Variables$Mutation$create_post._(this._$data);

  factory Variables$Mutation$create_post.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('image')) {
      final l$image = data['image'];
      result$data['image'] = (l$image as String?);
    }
    if (data.containsKey('message')) {
      final l$message = data['message'];
      result$data['message'] = (l$message as String?);
    }
    final l$service_provider_id = data['service_provider_id'];
    result$data['service_provider_id'] = (l$service_provider_id as int);
    if (data.containsKey('service_provider_type')) {
      final l$service_provider_type = data['service_provider_type'];
      result$data['service_provider_type'] =
          (l$service_provider_type as String?);
    }
    return Variables$Mutation$create_post._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get image => (_$data['image'] as String?);
  String? get message => (_$data['message'] as String?);
  int get service_provider_id => (_$data['service_provider_id'] as int);
  String? get service_provider_type =>
      (_$data['service_provider_type'] as String?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('image')) {
      final l$image = image;
      result$data['image'] = l$image;
    }
    if (_$data.containsKey('message')) {
      final l$message = message;
      result$data['message'] = l$message;
    }
    final l$service_provider_id = service_provider_id;
    result$data['service_provider_id'] = l$service_provider_id;
    if (_$data.containsKey('service_provider_type')) {
      final l$service_provider_type = service_provider_type;
      result$data['service_provider_type'] = l$service_provider_type;
    }
    return result$data;
  }

  CopyWith$Variables$Mutation$create_post<Variables$Mutation$create_post>
      get copyWith => CopyWith$Variables$Mutation$create_post(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$create_post) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$image = image;
    final lOther$image = other.image;
    if (_$data.containsKey('image') != other._$data.containsKey('image')) {
      return false;
    }
    if (l$image != lOther$image) {
      return false;
    }
    final l$message = message;
    final lOther$message = other.message;
    if (_$data.containsKey('message') != other._$data.containsKey('message')) {
      return false;
    }
    if (l$message != lOther$message) {
      return false;
    }
    final l$service_provider_id = service_provider_id;
    final lOther$service_provider_id = other.service_provider_id;
    if (l$service_provider_id != lOther$service_provider_id) {
      return false;
    }
    final l$service_provider_type = service_provider_type;
    final lOther$service_provider_type = other.service_provider_type;
    if (_$data.containsKey('service_provider_type') !=
        other._$data.containsKey('service_provider_type')) {
      return false;
    }
    if (l$service_provider_type != lOther$service_provider_type) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$image = image;
    final l$message = message;
    final l$service_provider_id = service_provider_id;
    final l$service_provider_type = service_provider_type;
    return Object.hashAll([
      _$data.containsKey('image') ? l$image : const {},
      _$data.containsKey('message') ? l$message : const {},
      l$service_provider_id,
      _$data.containsKey('service_provider_type')
          ? l$service_provider_type
          : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$create_post<TRes> {
  factory CopyWith$Variables$Mutation$create_post(
    Variables$Mutation$create_post instance,
    TRes Function(Variables$Mutation$create_post) then,
  ) = _CopyWithImpl$Variables$Mutation$create_post;

  factory CopyWith$Variables$Mutation$create_post.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$create_post;

  TRes call({
    String? image,
    String? message,
    int? service_provider_id,
    String? service_provider_type,
  });
}

class _CopyWithImpl$Variables$Mutation$create_post<TRes>
    implements CopyWith$Variables$Mutation$create_post<TRes> {
  _CopyWithImpl$Variables$Mutation$create_post(
    this._instance,
    this._then,
  );

  final Variables$Mutation$create_post _instance;

  final TRes Function(Variables$Mutation$create_post) _then;

  static const _undefined = {};

  TRes call({
    Object? image = _undefined,
    Object? message = _undefined,
    Object? service_provider_id = _undefined,
    Object? service_provider_type = _undefined,
  }) =>
      _then(Variables$Mutation$create_post._({
        ..._instance._$data,
        if (image != _undefined) 'image': (image as String?),
        if (message != _undefined) 'message': (message as String?),
        if (service_provider_id != _undefined && service_provider_id != null)
          'service_provider_id': (service_provider_id as int),
        if (service_provider_type != _undefined)
          'service_provider_type': (service_provider_type as String?),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$create_post<TRes>
    implements CopyWith$Variables$Mutation$create_post<TRes> {
  _CopyWithStubImpl$Variables$Mutation$create_post(this._res);

  TRes _res;

  call({
    String? image,
    String? message,
    int? service_provider_id,
    String? service_provider_type,
  }) =>
      _res;
}

class Mutation$create_post {
  Mutation$create_post({
    this.insert_service_provider_post_one,
    required this.$__typename,
  });

  factory Mutation$create_post.fromJson(Map<String, dynamic> json) {
    final l$insert_service_provider_post_one =
        json['insert_service_provider_post_one'];
    final l$$__typename = json['__typename'];
    return Mutation$create_post(
      insert_service_provider_post_one:
          l$insert_service_provider_post_one == null
              ? null
              : Mutation$create_post$insert_service_provider_post_one.fromJson(
                  (l$insert_service_provider_post_one as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$create_post$insert_service_provider_post_one?
      insert_service_provider_post_one;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$insert_service_provider_post_one = insert_service_provider_post_one;
    _resultData['insert_service_provider_post_one'] =
        l$insert_service_provider_post_one?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$insert_service_provider_post_one = insert_service_provider_post_one;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$insert_service_provider_post_one,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$create_post) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$insert_service_provider_post_one = insert_service_provider_post_one;
    final lOther$insert_service_provider_post_one =
        other.insert_service_provider_post_one;
    if (l$insert_service_provider_post_one !=
        lOther$insert_service_provider_post_one) {
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

extension UtilityExtension$Mutation$create_post on Mutation$create_post {
  CopyWith$Mutation$create_post<Mutation$create_post> get copyWith =>
      CopyWith$Mutation$create_post(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$create_post<TRes> {
  factory CopyWith$Mutation$create_post(
    Mutation$create_post instance,
    TRes Function(Mutation$create_post) then,
  ) = _CopyWithImpl$Mutation$create_post;

  factory CopyWith$Mutation$create_post.stub(TRes res) =
      _CopyWithStubImpl$Mutation$create_post;

  TRes call({
    Mutation$create_post$insert_service_provider_post_one?
        insert_service_provider_post_one,
    String? $__typename,
  });
  CopyWith$Mutation$create_post$insert_service_provider_post_one<TRes>
      get insert_service_provider_post_one;
}

class _CopyWithImpl$Mutation$create_post<TRes>
    implements CopyWith$Mutation$create_post<TRes> {
  _CopyWithImpl$Mutation$create_post(
    this._instance,
    this._then,
  );

  final Mutation$create_post _instance;

  final TRes Function(Mutation$create_post) _then;

  static const _undefined = {};

  TRes call({
    Object? insert_service_provider_post_one = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$create_post(
        insert_service_provider_post_one:
            insert_service_provider_post_one == _undefined
                ? _instance.insert_service_provider_post_one
                : (insert_service_provider_post_one
                    as Mutation$create_post$insert_service_provider_post_one?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$create_post$insert_service_provider_post_one<TRes>
      get insert_service_provider_post_one {
    final local$insert_service_provider_post_one =
        _instance.insert_service_provider_post_one;
    return local$insert_service_provider_post_one == null
        ? CopyWith$Mutation$create_post$insert_service_provider_post_one.stub(
            _then(_instance))
        : CopyWith$Mutation$create_post$insert_service_provider_post_one(
            local$insert_service_provider_post_one,
            (e) => call(insert_service_provider_post_one: e));
  }
}

class _CopyWithStubImpl$Mutation$create_post<TRes>
    implements CopyWith$Mutation$create_post<TRes> {
  _CopyWithStubImpl$Mutation$create_post(this._res);

  TRes _res;

  call({
    Mutation$create_post$insert_service_provider_post_one?
        insert_service_provider_post_one,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$create_post$insert_service_provider_post_one<TRes>
      get insert_service_provider_post_one =>
          CopyWith$Mutation$create_post$insert_service_provider_post_one.stub(
              _res);
}

const documentNodeMutationcreate_post = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'create_post'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'image')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'message')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'service_provider_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'service_provider_type')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'insert_service_provider_post_one'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'object'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'image'),
                value: VariableNode(name: NameNode(value: 'image')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'message'),
                value: VariableNode(name: NameNode(value: 'message')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'service_provider_id'),
                value:
                    VariableNode(name: NameNode(value: 'service_provider_id')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'service_provider_type'),
                value: VariableNode(
                    name: NameNode(value: 'service_provider_type')),
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
            name: NameNode(value: 'posted_on'),
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
Mutation$create_post _parserFn$Mutation$create_post(
        Map<String, dynamic> data) =>
    Mutation$create_post.fromJson(data);
typedef OnMutationCompleted$Mutation$create_post = FutureOr<void> Function(
  dynamic,
  Mutation$create_post?,
);

class Options$Mutation$create_post
    extends graphql.MutationOptions<Mutation$create_post> {
  Options$Mutation$create_post({
    String? operationName,
    required Variables$Mutation$create_post variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$create_post? onCompleted,
    graphql.OnMutationUpdate<Mutation$create_post>? update,
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
                    data == null ? null : _parserFn$Mutation$create_post(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationcreate_post,
          parserFn: _parserFn$Mutation$create_post,
        );

  final OnMutationCompleted$Mutation$create_post? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$create_post
    extends graphql.WatchQueryOptions<Mutation$create_post> {
  WatchOptions$Mutation$create_post({
    String? operationName,
    required Variables$Mutation$create_post variables,
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
          document: documentNodeMutationcreate_post,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$create_post,
        );
}

extension ClientExtension$Mutation$create_post on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$create_post>> mutate$create_post(
          Options$Mutation$create_post options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$create_post> watchMutation$create_post(
          WatchOptions$Mutation$create_post options) =>
      this.watchMutation(options);
}

class Mutation$create_post$insert_service_provider_post_one {
  Mutation$create_post$insert_service_provider_post_one({
    required this.id,
    required this.posted_on,
    required this.$__typename,
  });

  factory Mutation$create_post$insert_service_provider_post_one.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$posted_on = json['posted_on'];
    final l$$__typename = json['__typename'];
    return Mutation$create_post$insert_service_provider_post_one(
      id: (l$id as int),
      posted_on: (l$posted_on as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String posted_on;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$posted_on = posted_on;
    _resultData['posted_on'] = l$posted_on;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$posted_on = posted_on;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$posted_on,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$create_post$insert_service_provider_post_one) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$posted_on = posted_on;
    final lOther$posted_on = other.posted_on;
    if (l$posted_on != lOther$posted_on) {
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

extension UtilityExtension$Mutation$create_post$insert_service_provider_post_one
    on Mutation$create_post$insert_service_provider_post_one {
  CopyWith$Mutation$create_post$insert_service_provider_post_one<
          Mutation$create_post$insert_service_provider_post_one>
      get copyWith =>
          CopyWith$Mutation$create_post$insert_service_provider_post_one(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$create_post$insert_service_provider_post_one<
    TRes> {
  factory CopyWith$Mutation$create_post$insert_service_provider_post_one(
    Mutation$create_post$insert_service_provider_post_one instance,
    TRes Function(Mutation$create_post$insert_service_provider_post_one) then,
  ) = _CopyWithImpl$Mutation$create_post$insert_service_provider_post_one;

  factory CopyWith$Mutation$create_post$insert_service_provider_post_one.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$create_post$insert_service_provider_post_one;

  TRes call({
    int? id,
    String? posted_on,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$create_post$insert_service_provider_post_one<TRes>
    implements
        CopyWith$Mutation$create_post$insert_service_provider_post_one<TRes> {
  _CopyWithImpl$Mutation$create_post$insert_service_provider_post_one(
    this._instance,
    this._then,
  );

  final Mutation$create_post$insert_service_provider_post_one _instance;

  final TRes Function(Mutation$create_post$insert_service_provider_post_one)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? posted_on = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$create_post$insert_service_provider_post_one(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        posted_on: posted_on == _undefined || posted_on == null
            ? _instance.posted_on
            : (posted_on as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$create_post$insert_service_provider_post_one<
        TRes>
    implements
        CopyWith$Mutation$create_post$insert_service_provider_post_one<TRes> {
  _CopyWithStubImpl$Mutation$create_post$insert_service_provider_post_one(
      this._res);

  TRes _res;

  call({
    int? id,
    String? posted_on,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$delete_post {
  factory Variables$Mutation$delete_post({required int id}) =>
      Variables$Mutation$delete_post._({
        r'id': id,
      });

  Variables$Mutation$delete_post._(this._$data);

  factory Variables$Mutation$delete_post.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as int);
    return Variables$Mutation$delete_post._(result$data);
  }

  Map<String, dynamic> _$data;

  int get id => (_$data['id'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Mutation$delete_post<Variables$Mutation$delete_post>
      get copyWith => CopyWith$Variables$Mutation$delete_post(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$delete_post) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    return Object.hashAll([l$id]);
  }
}

abstract class CopyWith$Variables$Mutation$delete_post<TRes> {
  factory CopyWith$Variables$Mutation$delete_post(
    Variables$Mutation$delete_post instance,
    TRes Function(Variables$Mutation$delete_post) then,
  ) = _CopyWithImpl$Variables$Mutation$delete_post;

  factory CopyWith$Variables$Mutation$delete_post.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$delete_post;

  TRes call({int? id});
}

class _CopyWithImpl$Variables$Mutation$delete_post<TRes>
    implements CopyWith$Variables$Mutation$delete_post<TRes> {
  _CopyWithImpl$Variables$Mutation$delete_post(
    this._instance,
    this._then,
  );

  final Variables$Mutation$delete_post _instance;

  final TRes Function(Variables$Mutation$delete_post) _then;

  static const _undefined = {};

  TRes call({Object? id = _undefined}) =>
      _then(Variables$Mutation$delete_post._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as int),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$delete_post<TRes>
    implements CopyWith$Variables$Mutation$delete_post<TRes> {
  _CopyWithStubImpl$Variables$Mutation$delete_post(this._res);

  TRes _res;

  call({int? id}) => _res;
}

class Mutation$delete_post {
  Mutation$delete_post({
    this.delete_service_provider_post_by_pk,
    required this.$__typename,
  });

  factory Mutation$delete_post.fromJson(Map<String, dynamic> json) {
    final l$delete_service_provider_post_by_pk =
        json['delete_service_provider_post_by_pk'];
    final l$$__typename = json['__typename'];
    return Mutation$delete_post(
      delete_service_provider_post_by_pk:
          l$delete_service_provider_post_by_pk == null
              ? null
              : Mutation$delete_post$delete_service_provider_post_by_pk
                  .fromJson((l$delete_service_provider_post_by_pk
                      as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$delete_post$delete_service_provider_post_by_pk?
      delete_service_provider_post_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$delete_service_provider_post_by_pk =
        delete_service_provider_post_by_pk;
    _resultData['delete_service_provider_post_by_pk'] =
        l$delete_service_provider_post_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$delete_service_provider_post_by_pk =
        delete_service_provider_post_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$delete_service_provider_post_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$delete_post) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$delete_service_provider_post_by_pk =
        delete_service_provider_post_by_pk;
    final lOther$delete_service_provider_post_by_pk =
        other.delete_service_provider_post_by_pk;
    if (l$delete_service_provider_post_by_pk !=
        lOther$delete_service_provider_post_by_pk) {
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

extension UtilityExtension$Mutation$delete_post on Mutation$delete_post {
  CopyWith$Mutation$delete_post<Mutation$delete_post> get copyWith =>
      CopyWith$Mutation$delete_post(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$delete_post<TRes> {
  factory CopyWith$Mutation$delete_post(
    Mutation$delete_post instance,
    TRes Function(Mutation$delete_post) then,
  ) = _CopyWithImpl$Mutation$delete_post;

  factory CopyWith$Mutation$delete_post.stub(TRes res) =
      _CopyWithStubImpl$Mutation$delete_post;

  TRes call({
    Mutation$delete_post$delete_service_provider_post_by_pk?
        delete_service_provider_post_by_pk,
    String? $__typename,
  });
  CopyWith$Mutation$delete_post$delete_service_provider_post_by_pk<TRes>
      get delete_service_provider_post_by_pk;
}

class _CopyWithImpl$Mutation$delete_post<TRes>
    implements CopyWith$Mutation$delete_post<TRes> {
  _CopyWithImpl$Mutation$delete_post(
    this._instance,
    this._then,
  );

  final Mutation$delete_post _instance;

  final TRes Function(Mutation$delete_post) _then;

  static const _undefined = {};

  TRes call({
    Object? delete_service_provider_post_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$delete_post(
        delete_service_provider_post_by_pk:
            delete_service_provider_post_by_pk == _undefined
                ? _instance.delete_service_provider_post_by_pk
                : (delete_service_provider_post_by_pk
                    as Mutation$delete_post$delete_service_provider_post_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$delete_post$delete_service_provider_post_by_pk<TRes>
      get delete_service_provider_post_by_pk {
    final local$delete_service_provider_post_by_pk =
        _instance.delete_service_provider_post_by_pk;
    return local$delete_service_provider_post_by_pk == null
        ? CopyWith$Mutation$delete_post$delete_service_provider_post_by_pk.stub(
            _then(_instance))
        : CopyWith$Mutation$delete_post$delete_service_provider_post_by_pk(
            local$delete_service_provider_post_by_pk,
            (e) => call(delete_service_provider_post_by_pk: e));
  }
}

class _CopyWithStubImpl$Mutation$delete_post<TRes>
    implements CopyWith$Mutation$delete_post<TRes> {
  _CopyWithStubImpl$Mutation$delete_post(this._res);

  TRes _res;

  call({
    Mutation$delete_post$delete_service_provider_post_by_pk?
        delete_service_provider_post_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$delete_post$delete_service_provider_post_by_pk<TRes>
      get delete_service_provider_post_by_pk =>
          CopyWith$Mutation$delete_post$delete_service_provider_post_by_pk.stub(
              _res);
}

const documentNodeMutationdelete_post = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'delete_post'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
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
        name: NameNode(value: 'delete_service_provider_post_by_pk'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'id')),
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
Mutation$delete_post _parserFn$Mutation$delete_post(
        Map<String, dynamic> data) =>
    Mutation$delete_post.fromJson(data);
typedef OnMutationCompleted$Mutation$delete_post = FutureOr<void> Function(
  dynamic,
  Mutation$delete_post?,
);

class Options$Mutation$delete_post
    extends graphql.MutationOptions<Mutation$delete_post> {
  Options$Mutation$delete_post({
    String? operationName,
    required Variables$Mutation$delete_post variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$delete_post? onCompleted,
    graphql.OnMutationUpdate<Mutation$delete_post>? update,
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
                    data == null ? null : _parserFn$Mutation$delete_post(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationdelete_post,
          parserFn: _parserFn$Mutation$delete_post,
        );

  final OnMutationCompleted$Mutation$delete_post? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$delete_post
    extends graphql.WatchQueryOptions<Mutation$delete_post> {
  WatchOptions$Mutation$delete_post({
    String? operationName,
    required Variables$Mutation$delete_post variables,
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
          document: documentNodeMutationdelete_post,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$delete_post,
        );
}

extension ClientExtension$Mutation$delete_post on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$delete_post>> mutate$delete_post(
          Options$Mutation$delete_post options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$delete_post> watchMutation$delete_post(
          WatchOptions$Mutation$delete_post options) =>
      this.watchMutation(options);
}

class Mutation$delete_post$delete_service_provider_post_by_pk {
  Mutation$delete_post$delete_service_provider_post_by_pk({
    required this.id,
    required this.$__typename,
  });

  factory Mutation$delete_post$delete_service_provider_post_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Mutation$delete_post$delete_service_provider_post_by_pk(
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
    if (!(other is Mutation$delete_post$delete_service_provider_post_by_pk) ||
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

extension UtilityExtension$Mutation$delete_post$delete_service_provider_post_by_pk
    on Mutation$delete_post$delete_service_provider_post_by_pk {
  CopyWith$Mutation$delete_post$delete_service_provider_post_by_pk<
          Mutation$delete_post$delete_service_provider_post_by_pk>
      get copyWith =>
          CopyWith$Mutation$delete_post$delete_service_provider_post_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$delete_post$delete_service_provider_post_by_pk<
    TRes> {
  factory CopyWith$Mutation$delete_post$delete_service_provider_post_by_pk(
    Mutation$delete_post$delete_service_provider_post_by_pk instance,
    TRes Function(Mutation$delete_post$delete_service_provider_post_by_pk) then,
  ) = _CopyWithImpl$Mutation$delete_post$delete_service_provider_post_by_pk;

  factory CopyWith$Mutation$delete_post$delete_service_provider_post_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$delete_post$delete_service_provider_post_by_pk;

  TRes call({
    int? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$delete_post$delete_service_provider_post_by_pk<
        TRes>
    implements
        CopyWith$Mutation$delete_post$delete_service_provider_post_by_pk<TRes> {
  _CopyWithImpl$Mutation$delete_post$delete_service_provider_post_by_pk(
    this._instance,
    this._then,
  );

  final Mutation$delete_post$delete_service_provider_post_by_pk _instance;

  final TRes Function(Mutation$delete_post$delete_service_provider_post_by_pk)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$delete_post$delete_service_provider_post_by_pk(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$delete_post$delete_service_provider_post_by_pk<
        TRes>
    implements
        CopyWith$Mutation$delete_post$delete_service_provider_post_by_pk<TRes> {
  _CopyWithStubImpl$Mutation$delete_post$delete_service_provider_post_by_pk(
      this._res);

  TRes _res;

  call({
    int? id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$delete_comment {
  factory Variables$Mutation$delete_comment({required int id}) =>
      Variables$Mutation$delete_comment._({
        r'id': id,
      });

  Variables$Mutation$delete_comment._(this._$data);

  factory Variables$Mutation$delete_comment.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as int);
    return Variables$Mutation$delete_comment._(result$data);
  }

  Map<String, dynamic> _$data;

  int get id => (_$data['id'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Mutation$delete_comment<Variables$Mutation$delete_comment>
      get copyWith => CopyWith$Variables$Mutation$delete_comment(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$delete_comment) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    return Object.hashAll([l$id]);
  }
}

abstract class CopyWith$Variables$Mutation$delete_comment<TRes> {
  factory CopyWith$Variables$Mutation$delete_comment(
    Variables$Mutation$delete_comment instance,
    TRes Function(Variables$Mutation$delete_comment) then,
  ) = _CopyWithImpl$Variables$Mutation$delete_comment;

  factory CopyWith$Variables$Mutation$delete_comment.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$delete_comment;

  TRes call({int? id});
}

class _CopyWithImpl$Variables$Mutation$delete_comment<TRes>
    implements CopyWith$Variables$Mutation$delete_comment<TRes> {
  _CopyWithImpl$Variables$Mutation$delete_comment(
    this._instance,
    this._then,
  );

  final Variables$Mutation$delete_comment _instance;

  final TRes Function(Variables$Mutation$delete_comment) _then;

  static const _undefined = {};

  TRes call({Object? id = _undefined}) =>
      _then(Variables$Mutation$delete_comment._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as int),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$delete_comment<TRes>
    implements CopyWith$Variables$Mutation$delete_comment<TRes> {
  _CopyWithStubImpl$Variables$Mutation$delete_comment(this._res);

  TRes _res;

  call({int? id}) => _res;
}

class Mutation$delete_comment {
  Mutation$delete_comment({
    this.delete_service_provider_post_comment_by_pk,
    required this.$__typename,
  });

  factory Mutation$delete_comment.fromJson(Map<String, dynamic> json) {
    final l$delete_service_provider_post_comment_by_pk =
        json['delete_service_provider_post_comment_by_pk'];
    final l$$__typename = json['__typename'];
    return Mutation$delete_comment(
      delete_service_provider_post_comment_by_pk:
          l$delete_service_provider_post_comment_by_pk == null
              ? null
              : Mutation$delete_comment$delete_service_provider_post_comment_by_pk
                  .fromJson((l$delete_service_provider_post_comment_by_pk
                      as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$delete_comment$delete_service_provider_post_comment_by_pk?
      delete_service_provider_post_comment_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$delete_service_provider_post_comment_by_pk =
        delete_service_provider_post_comment_by_pk;
    _resultData['delete_service_provider_post_comment_by_pk'] =
        l$delete_service_provider_post_comment_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$delete_service_provider_post_comment_by_pk =
        delete_service_provider_post_comment_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$delete_service_provider_post_comment_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$delete_comment) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$delete_service_provider_post_comment_by_pk =
        delete_service_provider_post_comment_by_pk;
    final lOther$delete_service_provider_post_comment_by_pk =
        other.delete_service_provider_post_comment_by_pk;
    if (l$delete_service_provider_post_comment_by_pk !=
        lOther$delete_service_provider_post_comment_by_pk) {
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

extension UtilityExtension$Mutation$delete_comment on Mutation$delete_comment {
  CopyWith$Mutation$delete_comment<Mutation$delete_comment> get copyWith =>
      CopyWith$Mutation$delete_comment(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$delete_comment<TRes> {
  factory CopyWith$Mutation$delete_comment(
    Mutation$delete_comment instance,
    TRes Function(Mutation$delete_comment) then,
  ) = _CopyWithImpl$Mutation$delete_comment;

  factory CopyWith$Mutation$delete_comment.stub(TRes res) =
      _CopyWithStubImpl$Mutation$delete_comment;

  TRes call({
    Mutation$delete_comment$delete_service_provider_post_comment_by_pk?
        delete_service_provider_post_comment_by_pk,
    String? $__typename,
  });
  CopyWith$Mutation$delete_comment$delete_service_provider_post_comment_by_pk<
      TRes> get delete_service_provider_post_comment_by_pk;
}

class _CopyWithImpl$Mutation$delete_comment<TRes>
    implements CopyWith$Mutation$delete_comment<TRes> {
  _CopyWithImpl$Mutation$delete_comment(
    this._instance,
    this._then,
  );

  final Mutation$delete_comment _instance;

  final TRes Function(Mutation$delete_comment) _then;

  static const _undefined = {};

  TRes call({
    Object? delete_service_provider_post_comment_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$delete_comment(
        delete_service_provider_post_comment_by_pk:
            delete_service_provider_post_comment_by_pk == _undefined
                ? _instance.delete_service_provider_post_comment_by_pk
                : (delete_service_provider_post_comment_by_pk
                    as Mutation$delete_comment$delete_service_provider_post_comment_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$delete_comment$delete_service_provider_post_comment_by_pk<
      TRes> get delete_service_provider_post_comment_by_pk {
    final local$delete_service_provider_post_comment_by_pk =
        _instance.delete_service_provider_post_comment_by_pk;
    return local$delete_service_provider_post_comment_by_pk == null
        ? CopyWith$Mutation$delete_comment$delete_service_provider_post_comment_by_pk
            .stub(_then(_instance))
        : CopyWith$Mutation$delete_comment$delete_service_provider_post_comment_by_pk(
            local$delete_service_provider_post_comment_by_pk,
            (e) => call(delete_service_provider_post_comment_by_pk: e));
  }
}

class _CopyWithStubImpl$Mutation$delete_comment<TRes>
    implements CopyWith$Mutation$delete_comment<TRes> {
  _CopyWithStubImpl$Mutation$delete_comment(this._res);

  TRes _res;

  call({
    Mutation$delete_comment$delete_service_provider_post_comment_by_pk?
        delete_service_provider_post_comment_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$delete_comment$delete_service_provider_post_comment_by_pk<
          TRes>
      get delete_service_provider_post_comment_by_pk =>
          CopyWith$Mutation$delete_comment$delete_service_provider_post_comment_by_pk
              .stub(_res);
}

const documentNodeMutationdelete_comment = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'delete_comment'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
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
        name: NameNode(value: 'delete_service_provider_post_comment_by_pk'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: IntValueNode(value: '10'),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'post_id'),
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
Mutation$delete_comment _parserFn$Mutation$delete_comment(
        Map<String, dynamic> data) =>
    Mutation$delete_comment.fromJson(data);
typedef OnMutationCompleted$Mutation$delete_comment = FutureOr<void> Function(
  dynamic,
  Mutation$delete_comment?,
);

class Options$Mutation$delete_comment
    extends graphql.MutationOptions<Mutation$delete_comment> {
  Options$Mutation$delete_comment({
    String? operationName,
    required Variables$Mutation$delete_comment variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$delete_comment? onCompleted,
    graphql.OnMutationUpdate<Mutation$delete_comment>? update,
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
                        : _parserFn$Mutation$delete_comment(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationdelete_comment,
          parserFn: _parserFn$Mutation$delete_comment,
        );

  final OnMutationCompleted$Mutation$delete_comment? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$delete_comment
    extends graphql.WatchQueryOptions<Mutation$delete_comment> {
  WatchOptions$Mutation$delete_comment({
    String? operationName,
    required Variables$Mutation$delete_comment variables,
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
          document: documentNodeMutationdelete_comment,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$delete_comment,
        );
}

extension ClientExtension$Mutation$delete_comment on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$delete_comment>> mutate$delete_comment(
          Options$Mutation$delete_comment options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$delete_comment> watchMutation$delete_comment(
          WatchOptions$Mutation$delete_comment options) =>
      this.watchMutation(options);
}

class Mutation$delete_comment$delete_service_provider_post_comment_by_pk {
  Mutation$delete_comment$delete_service_provider_post_comment_by_pk({
    required this.post_id,
    required this.$__typename,
  });

  factory Mutation$delete_comment$delete_service_provider_post_comment_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$post_id = json['post_id'];
    final l$$__typename = json['__typename'];
    return Mutation$delete_comment$delete_service_provider_post_comment_by_pk(
      post_id: (l$post_id as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int post_id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$post_id = post_id;
    _resultData['post_id'] = l$post_id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$post_id = post_id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$post_id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Mutation$delete_comment$delete_service_provider_post_comment_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$post_id = post_id;
    final lOther$post_id = other.post_id;
    if (l$post_id != lOther$post_id) {
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

extension UtilityExtension$Mutation$delete_comment$delete_service_provider_post_comment_by_pk
    on Mutation$delete_comment$delete_service_provider_post_comment_by_pk {
  CopyWith$Mutation$delete_comment$delete_service_provider_post_comment_by_pk<
          Mutation$delete_comment$delete_service_provider_post_comment_by_pk>
      get copyWith =>
          CopyWith$Mutation$delete_comment$delete_service_provider_post_comment_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$delete_comment$delete_service_provider_post_comment_by_pk<
    TRes> {
  factory CopyWith$Mutation$delete_comment$delete_service_provider_post_comment_by_pk(
    Mutation$delete_comment$delete_service_provider_post_comment_by_pk instance,
    TRes Function(
            Mutation$delete_comment$delete_service_provider_post_comment_by_pk)
        then,
  ) = _CopyWithImpl$Mutation$delete_comment$delete_service_provider_post_comment_by_pk;

  factory CopyWith$Mutation$delete_comment$delete_service_provider_post_comment_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$delete_comment$delete_service_provider_post_comment_by_pk;

  TRes call({
    int? post_id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$delete_comment$delete_service_provider_post_comment_by_pk<
        TRes>
    implements
        CopyWith$Mutation$delete_comment$delete_service_provider_post_comment_by_pk<
            TRes> {
  _CopyWithImpl$Mutation$delete_comment$delete_service_provider_post_comment_by_pk(
    this._instance,
    this._then,
  );

  final Mutation$delete_comment$delete_service_provider_post_comment_by_pk
      _instance;

  final TRes Function(
      Mutation$delete_comment$delete_service_provider_post_comment_by_pk) _then;

  static const _undefined = {};

  TRes call({
    Object? post_id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$delete_comment$delete_service_provider_post_comment_by_pk(
        post_id: post_id == _undefined || post_id == null
            ? _instance.post_id
            : (post_id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$delete_comment$delete_service_provider_post_comment_by_pk<
        TRes>
    implements
        CopyWith$Mutation$delete_comment$delete_service_provider_post_comment_by_pk<
            TRes> {
  _CopyWithStubImpl$Mutation$delete_comment$delete_service_provider_post_comment_by_pk(
      this._res);

  TRes _res;

  call({
    int? post_id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$addFavouriteItem {
  factory Variables$Mutation$addFavouriteItem({
    int? customer_id,
    int? restaurant_id,
    int? restaurant_item_id,
  }) =>
      Variables$Mutation$addFavouriteItem._({
        if (customer_id != null) r'customer_id': customer_id,
        if (restaurant_id != null) r'restaurant_id': restaurant_id,
        if (restaurant_item_id != null)
          r'restaurant_item_id': restaurant_item_id,
      });

  Variables$Mutation$addFavouriteItem._(this._$data);

  factory Variables$Mutation$addFavouriteItem.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('customer_id')) {
      final l$customer_id = data['customer_id'];
      result$data['customer_id'] = (l$customer_id as int?);
    }
    if (data.containsKey('restaurant_id')) {
      final l$restaurant_id = data['restaurant_id'];
      result$data['restaurant_id'] = (l$restaurant_id as int?);
    }
    if (data.containsKey('restaurant_item_id')) {
      final l$restaurant_item_id = data['restaurant_item_id'];
      result$data['restaurant_item_id'] = (l$restaurant_item_id as int?);
    }
    return Variables$Mutation$addFavouriteItem._(result$data);
  }

  Map<String, dynamic> _$data;

  int? get customer_id => (_$data['customer_id'] as int?);
  int? get restaurant_id => (_$data['restaurant_id'] as int?);
  int? get restaurant_item_id => (_$data['restaurant_item_id'] as int?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('customer_id')) {
      final l$customer_id = customer_id;
      result$data['customer_id'] = l$customer_id;
    }
    if (_$data.containsKey('restaurant_id')) {
      final l$restaurant_id = restaurant_id;
      result$data['restaurant_id'] = l$restaurant_id;
    }
    if (_$data.containsKey('restaurant_item_id')) {
      final l$restaurant_item_id = restaurant_item_id;
      result$data['restaurant_item_id'] = l$restaurant_item_id;
    }
    return result$data;
  }

  CopyWith$Variables$Mutation$addFavouriteItem<
          Variables$Mutation$addFavouriteItem>
      get copyWith => CopyWith$Variables$Mutation$addFavouriteItem(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$addFavouriteItem) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$customer_id = customer_id;
    final lOther$customer_id = other.customer_id;
    if (_$data.containsKey('customer_id') !=
        other._$data.containsKey('customer_id')) {
      return false;
    }
    if (l$customer_id != lOther$customer_id) {
      return false;
    }
    final l$restaurant_id = restaurant_id;
    final lOther$restaurant_id = other.restaurant_id;
    if (_$data.containsKey('restaurant_id') !=
        other._$data.containsKey('restaurant_id')) {
      return false;
    }
    if (l$restaurant_id != lOther$restaurant_id) {
      return false;
    }
    final l$restaurant_item_id = restaurant_item_id;
    final lOther$restaurant_item_id = other.restaurant_item_id;
    if (_$data.containsKey('restaurant_item_id') !=
        other._$data.containsKey('restaurant_item_id')) {
      return false;
    }
    if (l$restaurant_item_id != lOther$restaurant_item_id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$customer_id = customer_id;
    final l$restaurant_id = restaurant_id;
    final l$restaurant_item_id = restaurant_item_id;
    return Object.hashAll([
      _$data.containsKey('customer_id') ? l$customer_id : const {},
      _$data.containsKey('restaurant_id') ? l$restaurant_id : const {},
      _$data.containsKey('restaurant_item_id')
          ? l$restaurant_item_id
          : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$addFavouriteItem<TRes> {
  factory CopyWith$Variables$Mutation$addFavouriteItem(
    Variables$Mutation$addFavouriteItem instance,
    TRes Function(Variables$Mutation$addFavouriteItem) then,
  ) = _CopyWithImpl$Variables$Mutation$addFavouriteItem;

  factory CopyWith$Variables$Mutation$addFavouriteItem.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$addFavouriteItem;

  TRes call({
    int? customer_id,
    int? restaurant_id,
    int? restaurant_item_id,
  });
}

class _CopyWithImpl$Variables$Mutation$addFavouriteItem<TRes>
    implements CopyWith$Variables$Mutation$addFavouriteItem<TRes> {
  _CopyWithImpl$Variables$Mutation$addFavouriteItem(
    this._instance,
    this._then,
  );

  final Variables$Mutation$addFavouriteItem _instance;

  final TRes Function(Variables$Mutation$addFavouriteItem) _then;

  static const _undefined = {};

  TRes call({
    Object? customer_id = _undefined,
    Object? restaurant_id = _undefined,
    Object? restaurant_item_id = _undefined,
  }) =>
      _then(Variables$Mutation$addFavouriteItem._({
        ..._instance._$data,
        if (customer_id != _undefined) 'customer_id': (customer_id as int?),
        if (restaurant_id != _undefined)
          'restaurant_id': (restaurant_id as int?),
        if (restaurant_item_id != _undefined)
          'restaurant_item_id': (restaurant_item_id as int?),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$addFavouriteItem<TRes>
    implements CopyWith$Variables$Mutation$addFavouriteItem<TRes> {
  _CopyWithStubImpl$Variables$Mutation$addFavouriteItem(this._res);

  TRes _res;

  call({
    int? customer_id,
    int? restaurant_id,
    int? restaurant_item_id,
  }) =>
      _res;
}

class Mutation$addFavouriteItem {
  Mutation$addFavouriteItem({
    this.insert_customer_favourited_item_one,
    required this.$__typename,
  });

  factory Mutation$addFavouriteItem.fromJson(Map<String, dynamic> json) {
    final l$insert_customer_favourited_item_one =
        json['insert_customer_favourited_item_one'];
    final l$$__typename = json['__typename'];
    return Mutation$addFavouriteItem(
      insert_customer_favourited_item_one:
          l$insert_customer_favourited_item_one == null
              ? null
              : Mutation$addFavouriteItem$insert_customer_favourited_item_one
                  .fromJson((l$insert_customer_favourited_item_one
                      as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$addFavouriteItem$insert_customer_favourited_item_one?
      insert_customer_favourited_item_one;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$insert_customer_favourited_item_one =
        insert_customer_favourited_item_one;
    _resultData['insert_customer_favourited_item_one'] =
        l$insert_customer_favourited_item_one?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$insert_customer_favourited_item_one =
        insert_customer_favourited_item_one;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$insert_customer_favourited_item_one,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$addFavouriteItem) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$insert_customer_favourited_item_one =
        insert_customer_favourited_item_one;
    final lOther$insert_customer_favourited_item_one =
        other.insert_customer_favourited_item_one;
    if (l$insert_customer_favourited_item_one !=
        lOther$insert_customer_favourited_item_one) {
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

extension UtilityExtension$Mutation$addFavouriteItem
    on Mutation$addFavouriteItem {
  CopyWith$Mutation$addFavouriteItem<Mutation$addFavouriteItem> get copyWith =>
      CopyWith$Mutation$addFavouriteItem(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$addFavouriteItem<TRes> {
  factory CopyWith$Mutation$addFavouriteItem(
    Mutation$addFavouriteItem instance,
    TRes Function(Mutation$addFavouriteItem) then,
  ) = _CopyWithImpl$Mutation$addFavouriteItem;

  factory CopyWith$Mutation$addFavouriteItem.stub(TRes res) =
      _CopyWithStubImpl$Mutation$addFavouriteItem;

  TRes call({
    Mutation$addFavouriteItem$insert_customer_favourited_item_one?
        insert_customer_favourited_item_one,
    String? $__typename,
  });
  CopyWith$Mutation$addFavouriteItem$insert_customer_favourited_item_one<TRes>
      get insert_customer_favourited_item_one;
}

class _CopyWithImpl$Mutation$addFavouriteItem<TRes>
    implements CopyWith$Mutation$addFavouriteItem<TRes> {
  _CopyWithImpl$Mutation$addFavouriteItem(
    this._instance,
    this._then,
  );

  final Mutation$addFavouriteItem _instance;

  final TRes Function(Mutation$addFavouriteItem) _then;

  static const _undefined = {};

  TRes call({
    Object? insert_customer_favourited_item_one = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$addFavouriteItem(
        insert_customer_favourited_item_one: insert_customer_favourited_item_one ==
                _undefined
            ? _instance.insert_customer_favourited_item_one
            : (insert_customer_favourited_item_one
                as Mutation$addFavouriteItem$insert_customer_favourited_item_one?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$addFavouriteItem$insert_customer_favourited_item_one<TRes>
      get insert_customer_favourited_item_one {
    final local$insert_customer_favourited_item_one =
        _instance.insert_customer_favourited_item_one;
    return local$insert_customer_favourited_item_one == null
        ? CopyWith$Mutation$addFavouriteItem$insert_customer_favourited_item_one
            .stub(_then(_instance))
        : CopyWith$Mutation$addFavouriteItem$insert_customer_favourited_item_one(
            local$insert_customer_favourited_item_one,
            (e) => call(insert_customer_favourited_item_one: e));
  }
}

class _CopyWithStubImpl$Mutation$addFavouriteItem<TRes>
    implements CopyWith$Mutation$addFavouriteItem<TRes> {
  _CopyWithStubImpl$Mutation$addFavouriteItem(this._res);

  TRes _res;

  call({
    Mutation$addFavouriteItem$insert_customer_favourited_item_one?
        insert_customer_favourited_item_one,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$addFavouriteItem$insert_customer_favourited_item_one<TRes>
      get insert_customer_favourited_item_one =>
          CopyWith$Mutation$addFavouriteItem$insert_customer_favourited_item_one
              .stub(_res);
}

const documentNodeMutationaddFavouriteItem = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'addFavouriteItem'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'customer_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'restaurant_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'restaurant_item_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'insert_customer_favourited_item_one'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'object'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'customer_id'),
                value: VariableNode(name: NameNode(value: 'customer_id')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'restaurant_id'),
                value: VariableNode(name: NameNode(value: 'restaurant_id')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'restaurant_item_id'),
                value:
                    VariableNode(name: NameNode(value: 'restaurant_item_id')),
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
Mutation$addFavouriteItem _parserFn$Mutation$addFavouriteItem(
        Map<String, dynamic> data) =>
    Mutation$addFavouriteItem.fromJson(data);
typedef OnMutationCompleted$Mutation$addFavouriteItem = FutureOr<void> Function(
  dynamic,
  Mutation$addFavouriteItem?,
);

class Options$Mutation$addFavouriteItem
    extends graphql.MutationOptions<Mutation$addFavouriteItem> {
  Options$Mutation$addFavouriteItem({
    String? operationName,
    Variables$Mutation$addFavouriteItem? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$addFavouriteItem? onCompleted,
    graphql.OnMutationUpdate<Mutation$addFavouriteItem>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables?.toJson() ?? {},
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
                        : _parserFn$Mutation$addFavouriteItem(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationaddFavouriteItem,
          parserFn: _parserFn$Mutation$addFavouriteItem,
        );

  final OnMutationCompleted$Mutation$addFavouriteItem? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$addFavouriteItem
    extends graphql.WatchQueryOptions<Mutation$addFavouriteItem> {
  WatchOptions$Mutation$addFavouriteItem({
    String? operationName,
    Variables$Mutation$addFavouriteItem? variables,
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
          variables: variables?.toJson() ?? {},
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          context: context,
          document: documentNodeMutationaddFavouriteItem,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$addFavouriteItem,
        );
}

extension ClientExtension$Mutation$addFavouriteItem on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$addFavouriteItem>>
      mutate$addFavouriteItem(
              [Options$Mutation$addFavouriteItem? options]) async =>
          await this.mutate(options ?? Options$Mutation$addFavouriteItem());
  graphql.ObservableQuery<
      Mutation$addFavouriteItem> watchMutation$addFavouriteItem(
          [WatchOptions$Mutation$addFavouriteItem? options]) =>
      this.watchMutation(options ?? WatchOptions$Mutation$addFavouriteItem());
}

class Mutation$addFavouriteItem$insert_customer_favourited_item_one {
  Mutation$addFavouriteItem$insert_customer_favourited_item_one({
    required this.id,
    required this.$__typename,
  });

  factory Mutation$addFavouriteItem$insert_customer_favourited_item_one.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Mutation$addFavouriteItem$insert_customer_favourited_item_one(
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
            is Mutation$addFavouriteItem$insert_customer_favourited_item_one) ||
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

extension UtilityExtension$Mutation$addFavouriteItem$insert_customer_favourited_item_one
    on Mutation$addFavouriteItem$insert_customer_favourited_item_one {
  CopyWith$Mutation$addFavouriteItem$insert_customer_favourited_item_one<
          Mutation$addFavouriteItem$insert_customer_favourited_item_one>
      get copyWith =>
          CopyWith$Mutation$addFavouriteItem$insert_customer_favourited_item_one(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$addFavouriteItem$insert_customer_favourited_item_one<
    TRes> {
  factory CopyWith$Mutation$addFavouriteItem$insert_customer_favourited_item_one(
    Mutation$addFavouriteItem$insert_customer_favourited_item_one instance,
    TRes Function(Mutation$addFavouriteItem$insert_customer_favourited_item_one)
        then,
  ) = _CopyWithImpl$Mutation$addFavouriteItem$insert_customer_favourited_item_one;

  factory CopyWith$Mutation$addFavouriteItem$insert_customer_favourited_item_one.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$addFavouriteItem$insert_customer_favourited_item_one;

  TRes call({
    int? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$addFavouriteItem$insert_customer_favourited_item_one<
        TRes>
    implements
        CopyWith$Mutation$addFavouriteItem$insert_customer_favourited_item_one<
            TRes> {
  _CopyWithImpl$Mutation$addFavouriteItem$insert_customer_favourited_item_one(
    this._instance,
    this._then,
  );

  final Mutation$addFavouriteItem$insert_customer_favourited_item_one _instance;

  final TRes Function(
      Mutation$addFavouriteItem$insert_customer_favourited_item_one) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$addFavouriteItem$insert_customer_favourited_item_one(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$addFavouriteItem$insert_customer_favourited_item_one<
        TRes>
    implements
        CopyWith$Mutation$addFavouriteItem$insert_customer_favourited_item_one<
            TRes> {
  _CopyWithStubImpl$Mutation$addFavouriteItem$insert_customer_favourited_item_one(
      this._res);

  TRes _res;

  call({
    int? id,
    String? $__typename,
  }) =>
      _res;
}
