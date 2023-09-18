import '../../service_provider/__generated/service_provider.graphql.dart';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';

class Variables$Query$get_service_provider_offers {
  factory Variables$Query$get_service_provider_offers({
    int? service_provider_id,
    String? service_provider_type,
  }) =>
      Variables$Query$get_service_provider_offers._({
        if (service_provider_id != null)
          r'service_provider_id': service_provider_id,
        if (service_provider_type != null)
          r'service_provider_type': service_provider_type,
      });

  Variables$Query$get_service_provider_offers._(this._$data);

  factory Variables$Query$get_service_provider_offers.fromJson(
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
    return Variables$Query$get_service_provider_offers._(result$data);
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

  CopyWith$Variables$Query$get_service_provider_offers<
          Variables$Query$get_service_provider_offers>
      get copyWith => CopyWith$Variables$Query$get_service_provider_offers(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$get_service_provider_offers) ||
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

abstract class CopyWith$Variables$Query$get_service_provider_offers<TRes> {
  factory CopyWith$Variables$Query$get_service_provider_offers(
    Variables$Query$get_service_provider_offers instance,
    TRes Function(Variables$Query$get_service_provider_offers) then,
  ) = _CopyWithImpl$Variables$Query$get_service_provider_offers;

  factory CopyWith$Variables$Query$get_service_provider_offers.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$get_service_provider_offers;

  TRes call({
    int? service_provider_id,
    String? service_provider_type,
  });
}

class _CopyWithImpl$Variables$Query$get_service_provider_offers<TRes>
    implements CopyWith$Variables$Query$get_service_provider_offers<TRes> {
  _CopyWithImpl$Variables$Query$get_service_provider_offers(
    this._instance,
    this._then,
  );

  final Variables$Query$get_service_provider_offers _instance;

  final TRes Function(Variables$Query$get_service_provider_offers) _then;

  static const _undefined = {};

  TRes call({
    Object? service_provider_id = _undefined,
    Object? service_provider_type = _undefined,
  }) =>
      _then(Variables$Query$get_service_provider_offers._({
        ..._instance._$data,
        if (service_provider_id != _undefined)
          'service_provider_id': (service_provider_id as int?),
        if (service_provider_type != _undefined)
          'service_provider_type': (service_provider_type as String?),
      }));
}

class _CopyWithStubImpl$Variables$Query$get_service_provider_offers<TRes>
    implements CopyWith$Variables$Query$get_service_provider_offers<TRes> {
  _CopyWithStubImpl$Variables$Query$get_service_provider_offers(this._res);

  TRes _res;

  call({
    int? service_provider_id,
    String? service_provider_type,
  }) =>
      _res;
}

class Query$get_service_provider_offers {
  Query$get_service_provider_offers({
    required this.service_provider_offer,
    required this.$__typename,
  });

  factory Query$get_service_provider_offers.fromJson(
      Map<String, dynamic> json) {
    final l$service_provider_offer = json['service_provider_offer'];
    final l$$__typename = json['__typename'];
    return Query$get_service_provider_offers(
      service_provider_offer: (l$service_provider_offer as List<dynamic>)
          .map((e) =>
              Query$get_service_provider_offers$service_provider_offer.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$get_service_provider_offers$service_provider_offer>
      service_provider_offer;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$service_provider_offer = service_provider_offer;
    _resultData['service_provider_offer'] =
        l$service_provider_offer.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$service_provider_offer = service_provider_offer;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$service_provider_offer.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_service_provider_offers) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$service_provider_offer = service_provider_offer;
    final lOther$service_provider_offer = other.service_provider_offer;
    if (l$service_provider_offer.length !=
        lOther$service_provider_offer.length) {
      return false;
    }
    for (int i = 0; i < l$service_provider_offer.length; i++) {
      final l$service_provider_offer$entry = l$service_provider_offer[i];
      final lOther$service_provider_offer$entry =
          lOther$service_provider_offer[i];
      if (l$service_provider_offer$entry !=
          lOther$service_provider_offer$entry) {
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

extension UtilityExtension$Query$get_service_provider_offers
    on Query$get_service_provider_offers {
  CopyWith$Query$get_service_provider_offers<Query$get_service_provider_offers>
      get copyWith => CopyWith$Query$get_service_provider_offers(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_service_provider_offers<TRes> {
  factory CopyWith$Query$get_service_provider_offers(
    Query$get_service_provider_offers instance,
    TRes Function(Query$get_service_provider_offers) then,
  ) = _CopyWithImpl$Query$get_service_provider_offers;

  factory CopyWith$Query$get_service_provider_offers.stub(TRes res) =
      _CopyWithStubImpl$Query$get_service_provider_offers;

  TRes call({
    List<Query$get_service_provider_offers$service_provider_offer>?
        service_provider_offer,
    String? $__typename,
  });
  TRes service_provider_offer(
      Iterable<Query$get_service_provider_offers$service_provider_offer> Function(
              Iterable<
                  CopyWith$Query$get_service_provider_offers$service_provider_offer<
                      Query$get_service_provider_offers$service_provider_offer>>)
          _fn);
}

class _CopyWithImpl$Query$get_service_provider_offers<TRes>
    implements CopyWith$Query$get_service_provider_offers<TRes> {
  _CopyWithImpl$Query$get_service_provider_offers(
    this._instance,
    this._then,
  );

  final Query$get_service_provider_offers _instance;

  final TRes Function(Query$get_service_provider_offers) _then;

  static const _undefined = {};

  TRes call({
    Object? service_provider_offer = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_service_provider_offers(
        service_provider_offer: service_provider_offer == _undefined ||
                service_provider_offer == null
            ? _instance.service_provider_offer
            : (service_provider_offer as List<
                Query$get_service_provider_offers$service_provider_offer>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes service_provider_offer(
          Iterable<Query$get_service_provider_offers$service_provider_offer> Function(
                  Iterable<
                      CopyWith$Query$get_service_provider_offers$service_provider_offer<
                          Query$get_service_provider_offers$service_provider_offer>>)
              _fn) =>
      call(
          service_provider_offer: _fn(_instance.service_provider_offer.map((e) =>
              CopyWith$Query$get_service_provider_offers$service_provider_offer(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$get_service_provider_offers<TRes>
    implements CopyWith$Query$get_service_provider_offers<TRes> {
  _CopyWithStubImpl$Query$get_service_provider_offers(this._res);

  TRes _res;

  call({
    List<Query$get_service_provider_offers$service_provider_offer>?
        service_provider_offer,
    String? $__typename,
  }) =>
      _res;
  service_provider_offer(_fn) => _res;
}

const documentNodeQueryget_service_provider_offers = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'get_service_provider_offers'),
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
        name: NameNode(value: 'service_provider_offer'),
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
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'details'),
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
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'translations'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'language_id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'value'),
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
            name: NameNode(value: 'status'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'coupon_code'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'offer_type'),
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
Query$get_service_provider_offers _parserFn$Query$get_service_provider_offers(
        Map<String, dynamic> data) =>
    Query$get_service_provider_offers.fromJson(data);

class Options$Query$get_service_provider_offers
    extends graphql.QueryOptions<Query$get_service_provider_offers> {
  Options$Query$get_service_provider_offers({
    String? operationName,
    Variables$Query$get_service_provider_offers? variables,
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
          document: documentNodeQueryget_service_provider_offers,
          parserFn: _parserFn$Query$get_service_provider_offers,
        );
}

class WatchOptions$Query$get_service_provider_offers
    extends graphql.WatchQueryOptions<Query$get_service_provider_offers> {
  WatchOptions$Query$get_service_provider_offers({
    String? operationName,
    Variables$Query$get_service_provider_offers? variables,
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
          document: documentNodeQueryget_service_provider_offers,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$get_service_provider_offers,
        );
}

class FetchMoreOptions$Query$get_service_provider_offers
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$get_service_provider_offers({
    required graphql.UpdateQuery updateQuery,
    Variables$Query$get_service_provider_offers? variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables?.toJson() ?? {},
          document: documentNodeQueryget_service_provider_offers,
        );
}

extension ClientExtension$Query$get_service_provider_offers
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$get_service_provider_offers>>
      query$get_service_provider_offers(
              [Options$Query$get_service_provider_offers? options]) async =>
          await this
              .query(options ?? Options$Query$get_service_provider_offers());
  graphql.ObservableQuery<Query$get_service_provider_offers>
      watchQuery$get_service_provider_offers(
              [WatchOptions$Query$get_service_provider_offers? options]) =>
          this.watchQuery(
              options ?? WatchOptions$Query$get_service_provider_offers());
  void writeQuery$get_service_provider_offers({
    required Query$get_service_provider_offers data,
    Variables$Query$get_service_provider_offers? variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryget_service_provider_offers),
          variables: variables?.toJson() ?? const {},
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$get_service_provider_offers? readQuery$get_service_provider_offers({
    Variables$Query$get_service_provider_offers? variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQueryget_service_provider_offers),
        variables: variables?.toJson() ?? const {},
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$get_service_provider_offers.fromJson(result);
  }
}

class Query$get_service_provider_offers$service_provider_offer {
  Query$get_service_provider_offers$service_provider_offer({
    required this.id,
    required this.details,
    required this.name,
    required this.status,
    this.coupon_code,
    required this.offer_type,
    required this.$__typename,
  });

  factory Query$get_service_provider_offers$service_provider_offer.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$details = json['details'];
    final l$name = json['name'];
    final l$status = json['status'];
    final l$coupon_code = json['coupon_code'];
    final l$offer_type = json['offer_type'];
    final l$$__typename = json['__typename'];
    return Query$get_service_provider_offers$service_provider_offer(
      id: (l$id as int),
      details: mapFromJson(l$details),
      name: Query$get_service_provider_offers$service_provider_offer$name
          .fromJson((l$name as Map<String, dynamic>)),
      status: (l$status as String),
      coupon_code: (l$coupon_code as String?),
      offer_type: (l$offer_type as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final dynamic details;

  final Query$get_service_provider_offers$service_provider_offer$name name;

  final String status;

  final String? coupon_code;

  final String offer_type;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$details = details;
    _resultData['details'] = mapToJson(l$details);
    final l$name = name;
    _resultData['name'] = l$name.toJson();
    final l$status = status;
    _resultData['status'] = l$status;
    final l$coupon_code = coupon_code;
    _resultData['coupon_code'] = l$coupon_code;
    final l$offer_type = offer_type;
    _resultData['offer_type'] = l$offer_type;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$details = details;
    final l$name = name;
    final l$status = status;
    final l$coupon_code = coupon_code;
    final l$offer_type = offer_type;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$details,
      l$name,
      l$status,
      l$coupon_code,
      l$offer_type,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_service_provider_offers$service_provider_offer) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$details = details;
    final lOther$details = other.details;
    if (l$details != lOther$details) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$coupon_code = coupon_code;
    final lOther$coupon_code = other.coupon_code;
    if (l$coupon_code != lOther$coupon_code) {
      return false;
    }
    final l$offer_type = offer_type;
    final lOther$offer_type = other.offer_type;
    if (l$offer_type != lOther$offer_type) {
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

extension UtilityExtension$Query$get_service_provider_offers$service_provider_offer
    on Query$get_service_provider_offers$service_provider_offer {
  CopyWith$Query$get_service_provider_offers$service_provider_offer<
          Query$get_service_provider_offers$service_provider_offer>
      get copyWith =>
          CopyWith$Query$get_service_provider_offers$service_provider_offer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_service_provider_offers$service_provider_offer<
    TRes> {
  factory CopyWith$Query$get_service_provider_offers$service_provider_offer(
    Query$get_service_provider_offers$service_provider_offer instance,
    TRes Function(Query$get_service_provider_offers$service_provider_offer)
        then,
  ) = _CopyWithImpl$Query$get_service_provider_offers$service_provider_offer;

  factory CopyWith$Query$get_service_provider_offers$service_provider_offer.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_service_provider_offers$service_provider_offer;

  TRes call({
    int? id,
    dynamic? details,
    Query$get_service_provider_offers$service_provider_offer$name? name,
    String? status,
    String? coupon_code,
    String? offer_type,
    String? $__typename,
  });
  CopyWith$Query$get_service_provider_offers$service_provider_offer$name<TRes>
      get name;
}

class _CopyWithImpl$Query$get_service_provider_offers$service_provider_offer<
        TRes>
    implements
        CopyWith$Query$get_service_provider_offers$service_provider_offer<
            TRes> {
  _CopyWithImpl$Query$get_service_provider_offers$service_provider_offer(
    this._instance,
    this._then,
  );

  final Query$get_service_provider_offers$service_provider_offer _instance;

  final TRes Function(Query$get_service_provider_offers$service_provider_offer)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? details = _undefined,
    Object? name = _undefined,
    Object? status = _undefined,
    Object? coupon_code = _undefined,
    Object? offer_type = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_service_provider_offers$service_provider_offer(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        details: details == _undefined || details == null
            ? _instance.details
            : (details as dynamic),
        name: name == _undefined || name == null
            ? _instance.name
            : (name
                as Query$get_service_provider_offers$service_provider_offer$name),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as String),
        coupon_code: coupon_code == _undefined
            ? _instance.coupon_code
            : (coupon_code as String?),
        offer_type: offer_type == _undefined || offer_type == null
            ? _instance.offer_type
            : (offer_type as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_service_provider_offers$service_provider_offer$name<TRes>
      get name {
    final local$name = _instance.name;
    return CopyWith$Query$get_service_provider_offers$service_provider_offer$name(
        local$name, (e) => call(name: e));
  }
}

class _CopyWithStubImpl$Query$get_service_provider_offers$service_provider_offer<
        TRes>
    implements
        CopyWith$Query$get_service_provider_offers$service_provider_offer<
            TRes> {
  _CopyWithStubImpl$Query$get_service_provider_offers$service_provider_offer(
      this._res);

  TRes _res;

  call({
    int? id,
    dynamic? details,
    Query$get_service_provider_offers$service_provider_offer$name? name,
    String? status,
    String? coupon_code,
    String? offer_type,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_service_provider_offers$service_provider_offer$name<TRes>
      get name =>
          CopyWith$Query$get_service_provider_offers$service_provider_offer$name
              .stub(_res);
}

class Query$get_service_provider_offers$service_provider_offer$name {
  Query$get_service_provider_offers$service_provider_offer$name({
    required this.translations,
    required this.$__typename,
  });

  factory Query$get_service_provider_offers$service_provider_offer$name.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$get_service_provider_offers$service_provider_offer$name(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$get_service_provider_offers$service_provider_offer$name$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Query$get_service_provider_offers$service_provider_offer$name$translations>
      translations;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$translations = translations;
    _resultData['translations'] =
        l$translations.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$translations = translations;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$translations.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$get_service_provider_offers$service_provider_offer$name) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$translations = translations;
    final lOther$translations = other.translations;
    if (l$translations.length != lOther$translations.length) {
      return false;
    }
    for (int i = 0; i < l$translations.length; i++) {
      final l$translations$entry = l$translations[i];
      final lOther$translations$entry = lOther$translations[i];
      if (l$translations$entry != lOther$translations$entry) {
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

extension UtilityExtension$Query$get_service_provider_offers$service_provider_offer$name
    on Query$get_service_provider_offers$service_provider_offer$name {
  CopyWith$Query$get_service_provider_offers$service_provider_offer$name<
          Query$get_service_provider_offers$service_provider_offer$name>
      get copyWith =>
          CopyWith$Query$get_service_provider_offers$service_provider_offer$name(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_service_provider_offers$service_provider_offer$name<
    TRes> {
  factory CopyWith$Query$get_service_provider_offers$service_provider_offer$name(
    Query$get_service_provider_offers$service_provider_offer$name instance,
    TRes Function(Query$get_service_provider_offers$service_provider_offer$name)
        then,
  ) = _CopyWithImpl$Query$get_service_provider_offers$service_provider_offer$name;

  factory CopyWith$Query$get_service_provider_offers$service_provider_offer$name.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_service_provider_offers$service_provider_offer$name;

  TRes call({
    List<Query$get_service_provider_offers$service_provider_offer$name$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$get_service_provider_offers$service_provider_offer$name$translations> Function(
              Iterable<
                  CopyWith$Query$get_service_provider_offers$service_provider_offer$name$translations<
                      Query$get_service_provider_offers$service_provider_offer$name$translations>>)
          _fn);
}

class _CopyWithImpl$Query$get_service_provider_offers$service_provider_offer$name<
        TRes>
    implements
        CopyWith$Query$get_service_provider_offers$service_provider_offer$name<
            TRes> {
  _CopyWithImpl$Query$get_service_provider_offers$service_provider_offer$name(
    this._instance,
    this._then,
  );

  final Query$get_service_provider_offers$service_provider_offer$name _instance;

  final TRes Function(
      Query$get_service_provider_offers$service_provider_offer$name) _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_service_provider_offers$service_provider_offer$name(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$get_service_provider_offers$service_provider_offer$name$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$get_service_provider_offers$service_provider_offer$name$translations> Function(
                  Iterable<
                      CopyWith$Query$get_service_provider_offers$service_provider_offer$name$translations<
                          Query$get_service_provider_offers$service_provider_offer$name$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$get_service_provider_offers$service_provider_offer$name$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$get_service_provider_offers$service_provider_offer$name<
        TRes>
    implements
        CopyWith$Query$get_service_provider_offers$service_provider_offer$name<
            TRes> {
  _CopyWithStubImpl$Query$get_service_provider_offers$service_provider_offer$name(
      this._res);

  TRes _res;

  call({
    List<Query$get_service_provider_offers$service_provider_offer$name$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$get_service_provider_offers$service_provider_offer$name$translations {
  Query$get_service_provider_offers$service_provider_offer$name$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$get_service_provider_offers$service_provider_offer$name$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$get_service_provider_offers$service_provider_offer$name$translations(
      language_id: (l$language_id as String),
      value: (l$value as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String language_id;

  final String value;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$language_id = language_id;
    _resultData['language_id'] = l$language_id;
    final l$value = value;
    _resultData['value'] = l$value;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$language_id = language_id;
    final l$value = value;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$language_id,
      l$value,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$get_service_provider_offers$service_provider_offer$name$translations) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$language_id = language_id;
    final lOther$language_id = other.language_id;
    if (l$language_id != lOther$language_id) {
      return false;
    }
    final l$value = value;
    final lOther$value = other.value;
    if (l$value != lOther$value) {
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

extension UtilityExtension$Query$get_service_provider_offers$service_provider_offer$name$translations
    on Query$get_service_provider_offers$service_provider_offer$name$translations {
  CopyWith$Query$get_service_provider_offers$service_provider_offer$name$translations<
          Query$get_service_provider_offers$service_provider_offer$name$translations>
      get copyWith =>
          CopyWith$Query$get_service_provider_offers$service_provider_offer$name$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_service_provider_offers$service_provider_offer$name$translations<
    TRes> {
  factory CopyWith$Query$get_service_provider_offers$service_provider_offer$name$translations(
    Query$get_service_provider_offers$service_provider_offer$name$translations
        instance,
    TRes Function(
            Query$get_service_provider_offers$service_provider_offer$name$translations)
        then,
  ) = _CopyWithImpl$Query$get_service_provider_offers$service_provider_offer$name$translations;

  factory CopyWith$Query$get_service_provider_offers$service_provider_offer$name$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_service_provider_offers$service_provider_offer$name$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_service_provider_offers$service_provider_offer$name$translations<
        TRes>
    implements
        CopyWith$Query$get_service_provider_offers$service_provider_offer$name$translations<
            TRes> {
  _CopyWithImpl$Query$get_service_provider_offers$service_provider_offer$name$translations(
    this._instance,
    this._then,
  );

  final Query$get_service_provider_offers$service_provider_offer$name$translations
      _instance;

  final TRes Function(
          Query$get_service_provider_offers$service_provider_offer$name$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_service_provider_offers$service_provider_offer$name$translations(
        language_id: language_id == _undefined || language_id == null
            ? _instance.language_id
            : (language_id as String),
        value: value == _undefined || value == null
            ? _instance.value
            : (value as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$get_service_provider_offers$service_provider_offer$name$translations<
        TRes>
    implements
        CopyWith$Query$get_service_provider_offers$service_provider_offer$name$translations<
            TRes> {
  _CopyWithStubImpl$Query$get_service_provider_offers$service_provider_offer$name$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$check_coupon {
  factory Variables$Query$check_coupon({
    String? coupon_code,
    int? service_provider_id,
    String? service_provider_type,
  }) =>
      Variables$Query$check_coupon._({
        if (coupon_code != null) r'coupon_code': coupon_code,
        if (service_provider_id != null)
          r'service_provider_id': service_provider_id,
        if (service_provider_type != null)
          r'service_provider_type': service_provider_type,
      });

  Variables$Query$check_coupon._(this._$data);

  factory Variables$Query$check_coupon.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('coupon_code')) {
      final l$coupon_code = data['coupon_code'];
      result$data['coupon_code'] = (l$coupon_code as String?);
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
    return Variables$Query$check_coupon._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get coupon_code => (_$data['coupon_code'] as String?);
  int? get service_provider_id => (_$data['service_provider_id'] as int?);
  String? get service_provider_type =>
      (_$data['service_provider_type'] as String?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('coupon_code')) {
      final l$coupon_code = coupon_code;
      result$data['coupon_code'] = l$coupon_code;
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

  CopyWith$Variables$Query$check_coupon<Variables$Query$check_coupon>
      get copyWith => CopyWith$Variables$Query$check_coupon(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$check_coupon) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$coupon_code = coupon_code;
    final lOther$coupon_code = other.coupon_code;
    if (_$data.containsKey('coupon_code') !=
        other._$data.containsKey('coupon_code')) {
      return false;
    }
    if (l$coupon_code != lOther$coupon_code) {
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
    final l$coupon_code = coupon_code;
    final l$service_provider_id = service_provider_id;
    final l$service_provider_type = service_provider_type;
    return Object.hashAll([
      _$data.containsKey('coupon_code') ? l$coupon_code : const {},
      _$data.containsKey('service_provider_id')
          ? l$service_provider_id
          : const {},
      _$data.containsKey('service_provider_type')
          ? l$service_provider_type
          : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$check_coupon<TRes> {
  factory CopyWith$Variables$Query$check_coupon(
    Variables$Query$check_coupon instance,
    TRes Function(Variables$Query$check_coupon) then,
  ) = _CopyWithImpl$Variables$Query$check_coupon;

  factory CopyWith$Variables$Query$check_coupon.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$check_coupon;

  TRes call({
    String? coupon_code,
    int? service_provider_id,
    String? service_provider_type,
  });
}

class _CopyWithImpl$Variables$Query$check_coupon<TRes>
    implements CopyWith$Variables$Query$check_coupon<TRes> {
  _CopyWithImpl$Variables$Query$check_coupon(
    this._instance,
    this._then,
  );

  final Variables$Query$check_coupon _instance;

  final TRes Function(Variables$Query$check_coupon) _then;

  static const _undefined = {};

  TRes call({
    Object? coupon_code = _undefined,
    Object? service_provider_id = _undefined,
    Object? service_provider_type = _undefined,
  }) =>
      _then(Variables$Query$check_coupon._({
        ..._instance._$data,
        if (coupon_code != _undefined) 'coupon_code': (coupon_code as String?),
        if (service_provider_id != _undefined)
          'service_provider_id': (service_provider_id as int?),
        if (service_provider_type != _undefined)
          'service_provider_type': (service_provider_type as String?),
      }));
}

class _CopyWithStubImpl$Variables$Query$check_coupon<TRes>
    implements CopyWith$Variables$Query$check_coupon<TRes> {
  _CopyWithStubImpl$Variables$Query$check_coupon(this._res);

  TRes _res;

  call({
    String? coupon_code,
    int? service_provider_id,
    String? service_provider_type,
  }) =>
      _res;
}

class Query$check_coupon {
  Query$check_coupon({
    required this.service_provider_offer,
    required this.$__typename,
  });

  factory Query$check_coupon.fromJson(Map<String, dynamic> json) {
    final l$service_provider_offer = json['service_provider_offer'];
    final l$$__typename = json['__typename'];
    return Query$check_coupon(
      service_provider_offer: (l$service_provider_offer as List<dynamic>)
          .map((e) => Query$check_coupon$service_provider_offer.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$check_coupon$service_provider_offer> service_provider_offer;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$service_provider_offer = service_provider_offer;
    _resultData['service_provider_offer'] =
        l$service_provider_offer.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$service_provider_offer = service_provider_offer;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$service_provider_offer.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$check_coupon) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$service_provider_offer = service_provider_offer;
    final lOther$service_provider_offer = other.service_provider_offer;
    if (l$service_provider_offer.length !=
        lOther$service_provider_offer.length) {
      return false;
    }
    for (int i = 0; i < l$service_provider_offer.length; i++) {
      final l$service_provider_offer$entry = l$service_provider_offer[i];
      final lOther$service_provider_offer$entry =
          lOther$service_provider_offer[i];
      if (l$service_provider_offer$entry !=
          lOther$service_provider_offer$entry) {
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

extension UtilityExtension$Query$check_coupon on Query$check_coupon {
  CopyWith$Query$check_coupon<Query$check_coupon> get copyWith =>
      CopyWith$Query$check_coupon(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$check_coupon<TRes> {
  factory CopyWith$Query$check_coupon(
    Query$check_coupon instance,
    TRes Function(Query$check_coupon) then,
  ) = _CopyWithImpl$Query$check_coupon;

  factory CopyWith$Query$check_coupon.stub(TRes res) =
      _CopyWithStubImpl$Query$check_coupon;

  TRes call({
    List<Query$check_coupon$service_provider_offer>? service_provider_offer,
    String? $__typename,
  });
  TRes service_provider_offer(
      Iterable<Query$check_coupon$service_provider_offer> Function(
              Iterable<
                  CopyWith$Query$check_coupon$service_provider_offer<
                      Query$check_coupon$service_provider_offer>>)
          _fn);
}

class _CopyWithImpl$Query$check_coupon<TRes>
    implements CopyWith$Query$check_coupon<TRes> {
  _CopyWithImpl$Query$check_coupon(
    this._instance,
    this._then,
  );

  final Query$check_coupon _instance;

  final TRes Function(Query$check_coupon) _then;

  static const _undefined = {};

  TRes call({
    Object? service_provider_offer = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$check_coupon(
        service_provider_offer: service_provider_offer == _undefined ||
                service_provider_offer == null
            ? _instance.service_provider_offer
            : (service_provider_offer
                as List<Query$check_coupon$service_provider_offer>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes service_provider_offer(
          Iterable<Query$check_coupon$service_provider_offer> Function(
                  Iterable<
                      CopyWith$Query$check_coupon$service_provider_offer<
                          Query$check_coupon$service_provider_offer>>)
              _fn) =>
      call(
          service_provider_offer: _fn(_instance.service_provider_offer
              .map((e) => CopyWith$Query$check_coupon$service_provider_offer(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$check_coupon<TRes>
    implements CopyWith$Query$check_coupon<TRes> {
  _CopyWithStubImpl$Query$check_coupon(this._res);

  TRes _res;

  call({
    List<Query$check_coupon$service_provider_offer>? service_provider_offer,
    String? $__typename,
  }) =>
      _res;
  service_provider_offer(_fn) => _res;
}

const documentNodeQuerycheck_coupon = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'check_coupon'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'coupon_code')),
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
        name: NameNode(value: 'service_provider_offer'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'coupon_code'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'coupon_code')),
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
              ObjectFieldNode(
                name: NameNode(value: 'status'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: StringValueNode(
                      value: 'active',
                      isBlock: false,
                    ),
                  )
                ]),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'offer_type'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: StringValueNode(
                      value: 'coupon',
                      isBlock: false,
                    ),
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
            name: NameNode(value: 'details'),
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
Query$check_coupon _parserFn$Query$check_coupon(Map<String, dynamic> data) =>
    Query$check_coupon.fromJson(data);

class Options$Query$check_coupon
    extends graphql.QueryOptions<Query$check_coupon> {
  Options$Query$check_coupon({
    String? operationName,
    Variables$Query$check_coupon? variables,
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
          document: documentNodeQuerycheck_coupon,
          parserFn: _parserFn$Query$check_coupon,
        );
}

class WatchOptions$Query$check_coupon
    extends graphql.WatchQueryOptions<Query$check_coupon> {
  WatchOptions$Query$check_coupon({
    String? operationName,
    Variables$Query$check_coupon? variables,
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
          document: documentNodeQuerycheck_coupon,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$check_coupon,
        );
}

class FetchMoreOptions$Query$check_coupon extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$check_coupon({
    required graphql.UpdateQuery updateQuery,
    Variables$Query$check_coupon? variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables?.toJson() ?? {},
          document: documentNodeQuerycheck_coupon,
        );
}

extension ClientExtension$Query$check_coupon on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$check_coupon>> query$check_coupon(
          [Options$Query$check_coupon? options]) async =>
      await this.query(options ?? Options$Query$check_coupon());
  graphql.ObservableQuery<Query$check_coupon> watchQuery$check_coupon(
          [WatchOptions$Query$check_coupon? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$check_coupon());
  void writeQuery$check_coupon({
    required Query$check_coupon data,
    Variables$Query$check_coupon? variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(document: documentNodeQuerycheck_coupon),
          variables: variables?.toJson() ?? const {},
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$check_coupon? readQuery$check_coupon({
    Variables$Query$check_coupon? variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQuerycheck_coupon),
        variables: variables?.toJson() ?? const {},
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$check_coupon.fromJson(result);
  }
}

class Query$check_coupon$service_provider_offer {
  Query$check_coupon$service_provider_offer({
    required this.id,
    required this.details,
    required this.$__typename,
  });

  factory Query$check_coupon$service_provider_offer.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Query$check_coupon$service_provider_offer(
      id: (l$id as int),
      details: mapFromJson(l$details),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final dynamic details;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$details = details;
    _resultData['details'] = mapToJson(l$details);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$details = details;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$details,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$check_coupon$service_provider_offer) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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

extension UtilityExtension$Query$check_coupon$service_provider_offer
    on Query$check_coupon$service_provider_offer {
  CopyWith$Query$check_coupon$service_provider_offer<
          Query$check_coupon$service_provider_offer>
      get copyWith => CopyWith$Query$check_coupon$service_provider_offer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$check_coupon$service_provider_offer<TRes> {
  factory CopyWith$Query$check_coupon$service_provider_offer(
    Query$check_coupon$service_provider_offer instance,
    TRes Function(Query$check_coupon$service_provider_offer) then,
  ) = _CopyWithImpl$Query$check_coupon$service_provider_offer;

  factory CopyWith$Query$check_coupon$service_provider_offer.stub(TRes res) =
      _CopyWithStubImpl$Query$check_coupon$service_provider_offer;

  TRes call({
    int? id,
    dynamic? details,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$check_coupon$service_provider_offer<TRes>
    implements CopyWith$Query$check_coupon$service_provider_offer<TRes> {
  _CopyWithImpl$Query$check_coupon$service_provider_offer(
    this._instance,
    this._then,
  );

  final Query$check_coupon$service_provider_offer _instance;

  final TRes Function(Query$check_coupon$service_provider_offer) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$check_coupon$service_provider_offer(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        details: details == _undefined || details == null
            ? _instance.details
            : (details as dynamic),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$check_coupon$service_provider_offer<TRes>
    implements CopyWith$Query$check_coupon$service_provider_offer<TRes> {
  _CopyWithStubImpl$Query$check_coupon$service_provider_offer(this._res);

  TRes _res;

  call({
    int? id,
    dynamic? details,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$check_offer_applied {
  factory Variables$Query$check_offer_applied({
    int? offer_id,
    int? customer_id,
    String? order_type,
  }) =>
      Variables$Query$check_offer_applied._({
        if (offer_id != null) r'offer_id': offer_id,
        if (customer_id != null) r'customer_id': customer_id,
        if (order_type != null) r'order_type': order_type,
      });

  Variables$Query$check_offer_applied._(this._$data);

  factory Variables$Query$check_offer_applied.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('offer_id')) {
      final l$offer_id = data['offer_id'];
      result$data['offer_id'] = (l$offer_id as int?);
    }
    if (data.containsKey('customer_id')) {
      final l$customer_id = data['customer_id'];
      result$data['customer_id'] = (l$customer_id as int?);
    }
    if (data.containsKey('order_type')) {
      final l$order_type = data['order_type'];
      result$data['order_type'] = (l$order_type as String?);
    }
    return Variables$Query$check_offer_applied._(result$data);
  }

  Map<String, dynamic> _$data;

  int? get offer_id => (_$data['offer_id'] as int?);
  int? get customer_id => (_$data['customer_id'] as int?);
  String? get order_type => (_$data['order_type'] as String?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('offer_id')) {
      final l$offer_id = offer_id;
      result$data['offer_id'] = l$offer_id;
    }
    if (_$data.containsKey('customer_id')) {
      final l$customer_id = customer_id;
      result$data['customer_id'] = l$customer_id;
    }
    if (_$data.containsKey('order_type')) {
      final l$order_type = order_type;
      result$data['order_type'] = l$order_type;
    }
    return result$data;
  }

  CopyWith$Variables$Query$check_offer_applied<
          Variables$Query$check_offer_applied>
      get copyWith => CopyWith$Variables$Query$check_offer_applied(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$check_offer_applied) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$offer_id = offer_id;
    final lOther$offer_id = other.offer_id;
    if (_$data.containsKey('offer_id') !=
        other._$data.containsKey('offer_id')) {
      return false;
    }
    if (l$offer_id != lOther$offer_id) {
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
    final l$order_type = order_type;
    final lOther$order_type = other.order_type;
    if (_$data.containsKey('order_type') !=
        other._$data.containsKey('order_type')) {
      return false;
    }
    if (l$order_type != lOther$order_type) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$offer_id = offer_id;
    final l$customer_id = customer_id;
    final l$order_type = order_type;
    return Object.hashAll([
      _$data.containsKey('offer_id') ? l$offer_id : const {},
      _$data.containsKey('customer_id') ? l$customer_id : const {},
      _$data.containsKey('order_type') ? l$order_type : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$check_offer_applied<TRes> {
  factory CopyWith$Variables$Query$check_offer_applied(
    Variables$Query$check_offer_applied instance,
    TRes Function(Variables$Query$check_offer_applied) then,
  ) = _CopyWithImpl$Variables$Query$check_offer_applied;

  factory CopyWith$Variables$Query$check_offer_applied.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$check_offer_applied;

  TRes call({
    int? offer_id,
    int? customer_id,
    String? order_type,
  });
}

class _CopyWithImpl$Variables$Query$check_offer_applied<TRes>
    implements CopyWith$Variables$Query$check_offer_applied<TRes> {
  _CopyWithImpl$Variables$Query$check_offer_applied(
    this._instance,
    this._then,
  );

  final Variables$Query$check_offer_applied _instance;

  final TRes Function(Variables$Query$check_offer_applied) _then;

  static const _undefined = {};

  TRes call({
    Object? offer_id = _undefined,
    Object? customer_id = _undefined,
    Object? order_type = _undefined,
  }) =>
      _then(Variables$Query$check_offer_applied._({
        ..._instance._$data,
        if (offer_id != _undefined) 'offer_id': (offer_id as int?),
        if (customer_id != _undefined) 'customer_id': (customer_id as int?),
        if (order_type != _undefined) 'order_type': (order_type as String?),
      }));
}

class _CopyWithStubImpl$Variables$Query$check_offer_applied<TRes>
    implements CopyWith$Variables$Query$check_offer_applied<TRes> {
  _CopyWithStubImpl$Variables$Query$check_offer_applied(this._res);

  TRes _res;

  call({
    int? offer_id,
    int? customer_id,
    String? order_type,
  }) =>
      _res;
}

class Query$check_offer_applied {
  Query$check_offer_applied({
    required this.service_provider_offer_applied,
    required this.$__typename,
  });

  factory Query$check_offer_applied.fromJson(Map<String, dynamic> json) {
    final l$service_provider_offer_applied =
        json['service_provider_offer_applied'];
    final l$$__typename = json['__typename'];
    return Query$check_offer_applied(
      service_provider_offer_applied: (l$service_provider_offer_applied
              as List<dynamic>)
          .map((e) =>
              Query$check_offer_applied$service_provider_offer_applied.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$check_offer_applied$service_provider_offer_applied>
      service_provider_offer_applied;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$service_provider_offer_applied = service_provider_offer_applied;
    _resultData['service_provider_offer_applied'] =
        l$service_provider_offer_applied.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$service_provider_offer_applied = service_provider_offer_applied;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$service_provider_offer_applied.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$check_offer_applied) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$service_provider_offer_applied = service_provider_offer_applied;
    final lOther$service_provider_offer_applied =
        other.service_provider_offer_applied;
    if (l$service_provider_offer_applied.length !=
        lOther$service_provider_offer_applied.length) {
      return false;
    }
    for (int i = 0; i < l$service_provider_offer_applied.length; i++) {
      final l$service_provider_offer_applied$entry =
          l$service_provider_offer_applied[i];
      final lOther$service_provider_offer_applied$entry =
          lOther$service_provider_offer_applied[i];
      if (l$service_provider_offer_applied$entry !=
          lOther$service_provider_offer_applied$entry) {
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

extension UtilityExtension$Query$check_offer_applied
    on Query$check_offer_applied {
  CopyWith$Query$check_offer_applied<Query$check_offer_applied> get copyWith =>
      CopyWith$Query$check_offer_applied(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$check_offer_applied<TRes> {
  factory CopyWith$Query$check_offer_applied(
    Query$check_offer_applied instance,
    TRes Function(Query$check_offer_applied) then,
  ) = _CopyWithImpl$Query$check_offer_applied;

  factory CopyWith$Query$check_offer_applied.stub(TRes res) =
      _CopyWithStubImpl$Query$check_offer_applied;

  TRes call({
    List<Query$check_offer_applied$service_provider_offer_applied>?
        service_provider_offer_applied,
    String? $__typename,
  });
  TRes service_provider_offer_applied(
      Iterable<Query$check_offer_applied$service_provider_offer_applied> Function(
              Iterable<
                  CopyWith$Query$check_offer_applied$service_provider_offer_applied<
                      Query$check_offer_applied$service_provider_offer_applied>>)
          _fn);
}

class _CopyWithImpl$Query$check_offer_applied<TRes>
    implements CopyWith$Query$check_offer_applied<TRes> {
  _CopyWithImpl$Query$check_offer_applied(
    this._instance,
    this._then,
  );

  final Query$check_offer_applied _instance;

  final TRes Function(Query$check_offer_applied) _then;

  static const _undefined = {};

  TRes call({
    Object? service_provider_offer_applied = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$check_offer_applied(
        service_provider_offer_applied:
            service_provider_offer_applied == _undefined ||
                    service_provider_offer_applied == null
                ? _instance.service_provider_offer_applied
                : (service_provider_offer_applied as List<
                    Query$check_offer_applied$service_provider_offer_applied>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes service_provider_offer_applied(
          Iterable<Query$check_offer_applied$service_provider_offer_applied> Function(
                  Iterable<
                      CopyWith$Query$check_offer_applied$service_provider_offer_applied<
                          Query$check_offer_applied$service_provider_offer_applied>>)
              _fn) =>
      call(
          service_provider_offer_applied: _fn(
              _instance.service_provider_offer_applied.map((e) =>
                  CopyWith$Query$check_offer_applied$service_provider_offer_applied(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$check_offer_applied<TRes>
    implements CopyWith$Query$check_offer_applied<TRes> {
  _CopyWithStubImpl$Query$check_offer_applied(this._res);

  TRes _res;

  call({
    List<Query$check_offer_applied$service_provider_offer_applied>?
        service_provider_offer_applied,
    String? $__typename,
  }) =>
      _res;
  service_provider_offer_applied(_fn) => _res;
}

const documentNodeQuerycheck_offer_applied = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'check_offer_applied'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'offer_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
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
        variable: VariableNode(name: NameNode(value: 'order_type')),
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
        name: NameNode(value: 'service_provider_offer_applied'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'offer_id'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'offer_id')),
                  )
                ]),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'order_type'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'order_type')),
                  )
                ]),
              ),
              ObjectFieldNode(
                name: NameNode(value: '_or'),
                value: ListValueNode(values: [
                  ObjectValueNode(fields: [
                    ObjectFieldNode(
                      name: NameNode(value: 'business_order'),
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
                  ObjectValueNode(fields: [
                    ObjectFieldNode(
                      name: NameNode(value: 'restaurant_order'),
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
                  ObjectValueNode(fields: [
                    ObjectFieldNode(
                      name: NameNode(value: 'laundry_order'),
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
                ]),
              ),
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'order_id'),
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
Query$check_offer_applied _parserFn$Query$check_offer_applied(
        Map<String, dynamic> data) =>
    Query$check_offer_applied.fromJson(data);

class Options$Query$check_offer_applied
    extends graphql.QueryOptions<Query$check_offer_applied> {
  Options$Query$check_offer_applied({
    String? operationName,
    Variables$Query$check_offer_applied? variables,
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
          document: documentNodeQuerycheck_offer_applied,
          parserFn: _parserFn$Query$check_offer_applied,
        );
}

class WatchOptions$Query$check_offer_applied
    extends graphql.WatchQueryOptions<Query$check_offer_applied> {
  WatchOptions$Query$check_offer_applied({
    String? operationName,
    Variables$Query$check_offer_applied? variables,
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
          document: documentNodeQuerycheck_offer_applied,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$check_offer_applied,
        );
}

class FetchMoreOptions$Query$check_offer_applied
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$check_offer_applied({
    required graphql.UpdateQuery updateQuery,
    Variables$Query$check_offer_applied? variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables?.toJson() ?? {},
          document: documentNodeQuerycheck_offer_applied,
        );
}

extension ClientExtension$Query$check_offer_applied on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$check_offer_applied>>
      query$check_offer_applied(
              [Options$Query$check_offer_applied? options]) async =>
          await this.query(options ?? Options$Query$check_offer_applied());
  graphql.ObservableQuery<Query$check_offer_applied>
      watchQuery$check_offer_applied(
              [WatchOptions$Query$check_offer_applied? options]) =>
          this.watchQuery(options ?? WatchOptions$Query$check_offer_applied());
  void writeQuery$check_offer_applied({
    required Query$check_offer_applied data,
    Variables$Query$check_offer_applied? variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQuerycheck_offer_applied),
          variables: variables?.toJson() ?? const {},
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$check_offer_applied? readQuery$check_offer_applied({
    Variables$Query$check_offer_applied? variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQuerycheck_offer_applied),
        variables: variables?.toJson() ?? const {},
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$check_offer_applied.fromJson(result);
  }
}

class Query$check_offer_applied$service_provider_offer_applied {
  Query$check_offer_applied$service_provider_offer_applied({
    required this.order_id,
    required this.$__typename,
  });

  factory Query$check_offer_applied$service_provider_offer_applied.fromJson(
      Map<String, dynamic> json) {
    final l$order_id = json['order_id'];
    final l$$__typename = json['__typename'];
    return Query$check_offer_applied$service_provider_offer_applied(
      order_id: (l$order_id as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int order_id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$order_id = order_id;
    _resultData['order_id'] = l$order_id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$order_id = order_id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$order_id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$check_offer_applied$service_provider_offer_applied) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$order_id = order_id;
    final lOther$order_id = other.order_id;
    if (l$order_id != lOther$order_id) {
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

extension UtilityExtension$Query$check_offer_applied$service_provider_offer_applied
    on Query$check_offer_applied$service_provider_offer_applied {
  CopyWith$Query$check_offer_applied$service_provider_offer_applied<
          Query$check_offer_applied$service_provider_offer_applied>
      get copyWith =>
          CopyWith$Query$check_offer_applied$service_provider_offer_applied(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$check_offer_applied$service_provider_offer_applied<
    TRes> {
  factory CopyWith$Query$check_offer_applied$service_provider_offer_applied(
    Query$check_offer_applied$service_provider_offer_applied instance,
    TRes Function(Query$check_offer_applied$service_provider_offer_applied)
        then,
  ) = _CopyWithImpl$Query$check_offer_applied$service_provider_offer_applied;

  factory CopyWith$Query$check_offer_applied$service_provider_offer_applied.stub(
          TRes res) =
      _CopyWithStubImpl$Query$check_offer_applied$service_provider_offer_applied;

  TRes call({
    int? order_id,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$check_offer_applied$service_provider_offer_applied<
        TRes>
    implements
        CopyWith$Query$check_offer_applied$service_provider_offer_applied<
            TRes> {
  _CopyWithImpl$Query$check_offer_applied$service_provider_offer_applied(
    this._instance,
    this._then,
  );

  final Query$check_offer_applied$service_provider_offer_applied _instance;

  final TRes Function(Query$check_offer_applied$service_provider_offer_applied)
      _then;

  static const _undefined = {};

  TRes call({
    Object? order_id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$check_offer_applied$service_provider_offer_applied(
        order_id: order_id == _undefined || order_id == null
            ? _instance.order_id
            : (order_id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$check_offer_applied$service_provider_offer_applied<
        TRes>
    implements
        CopyWith$Query$check_offer_applied$service_provider_offer_applied<
            TRes> {
  _CopyWithStubImpl$Query$check_offer_applied$service_provider_offer_applied(
      this._res);

  TRes _res;

  call({
    int? order_id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$fetchPromotions {
  factory Variables$Query$fetchPromotions({
    int? service_provider_id,
    String? service_provider_type,
  }) =>
      Variables$Query$fetchPromotions._({
        if (service_provider_id != null)
          r'service_provider_id': service_provider_id,
        if (service_provider_type != null)
          r'service_provider_type': service_provider_type,
      });

  Variables$Query$fetchPromotions._(this._$data);

  factory Variables$Query$fetchPromotions.fromJson(Map<String, dynamic> data) {
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
    return Variables$Query$fetchPromotions._(result$data);
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

  CopyWith$Variables$Query$fetchPromotions<Variables$Query$fetchPromotions>
      get copyWith => CopyWith$Variables$Query$fetchPromotions(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$fetchPromotions) ||
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

abstract class CopyWith$Variables$Query$fetchPromotions<TRes> {
  factory CopyWith$Variables$Query$fetchPromotions(
    Variables$Query$fetchPromotions instance,
    TRes Function(Variables$Query$fetchPromotions) then,
  ) = _CopyWithImpl$Variables$Query$fetchPromotions;

  factory CopyWith$Variables$Query$fetchPromotions.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$fetchPromotions;

  TRes call({
    int? service_provider_id,
    String? service_provider_type,
  });
}

class _CopyWithImpl$Variables$Query$fetchPromotions<TRes>
    implements CopyWith$Variables$Query$fetchPromotions<TRes> {
  _CopyWithImpl$Variables$Query$fetchPromotions(
    this._instance,
    this._then,
  );

  final Variables$Query$fetchPromotions _instance;

  final TRes Function(Variables$Query$fetchPromotions) _then;

  static const _undefined = {};

  TRes call({
    Object? service_provider_id = _undefined,
    Object? service_provider_type = _undefined,
  }) =>
      _then(Variables$Query$fetchPromotions._({
        ..._instance._$data,
        if (service_provider_id != _undefined)
          'service_provider_id': (service_provider_id as int?),
        if (service_provider_type != _undefined)
          'service_provider_type': (service_provider_type as String?),
      }));
}

class _CopyWithStubImpl$Variables$Query$fetchPromotions<TRes>
    implements CopyWith$Variables$Query$fetchPromotions<TRes> {
  _CopyWithStubImpl$Variables$Query$fetchPromotions(this._res);

  TRes _res;

  call({
    int? service_provider_id,
    String? service_provider_type,
  }) =>
      _res;
}

class Query$fetchPromotions {
  Query$fetchPromotions({
    required this.service_provider_offer,
    required this.$__typename,
  });

  factory Query$fetchPromotions.fromJson(Map<String, dynamic> json) {
    final l$service_provider_offer = json['service_provider_offer'];
    final l$$__typename = json['__typename'];
    return Query$fetchPromotions(
      service_provider_offer: (l$service_provider_offer as List<dynamic>)
          .map((e) => Query$fetchPromotions$service_provider_offer.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$fetchPromotions$service_provider_offer>
      service_provider_offer;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$service_provider_offer = service_provider_offer;
    _resultData['service_provider_offer'] =
        l$service_provider_offer.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$service_provider_offer = service_provider_offer;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$service_provider_offer.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$fetchPromotions) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$service_provider_offer = service_provider_offer;
    final lOther$service_provider_offer = other.service_provider_offer;
    if (l$service_provider_offer.length !=
        lOther$service_provider_offer.length) {
      return false;
    }
    for (int i = 0; i < l$service_provider_offer.length; i++) {
      final l$service_provider_offer$entry = l$service_provider_offer[i];
      final lOther$service_provider_offer$entry =
          lOther$service_provider_offer[i];
      if (l$service_provider_offer$entry !=
          lOther$service_provider_offer$entry) {
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

extension UtilityExtension$Query$fetchPromotions on Query$fetchPromotions {
  CopyWith$Query$fetchPromotions<Query$fetchPromotions> get copyWith =>
      CopyWith$Query$fetchPromotions(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$fetchPromotions<TRes> {
  factory CopyWith$Query$fetchPromotions(
    Query$fetchPromotions instance,
    TRes Function(Query$fetchPromotions) then,
  ) = _CopyWithImpl$Query$fetchPromotions;

  factory CopyWith$Query$fetchPromotions.stub(TRes res) =
      _CopyWithStubImpl$Query$fetchPromotions;

  TRes call({
    List<Query$fetchPromotions$service_provider_offer>? service_provider_offer,
    String? $__typename,
  });
  TRes service_provider_offer(
      Iterable<Query$fetchPromotions$service_provider_offer> Function(
              Iterable<
                  CopyWith$Query$fetchPromotions$service_provider_offer<
                      Query$fetchPromotions$service_provider_offer>>)
          _fn);
}

class _CopyWithImpl$Query$fetchPromotions<TRes>
    implements CopyWith$Query$fetchPromotions<TRes> {
  _CopyWithImpl$Query$fetchPromotions(
    this._instance,
    this._then,
  );

  final Query$fetchPromotions _instance;

  final TRes Function(Query$fetchPromotions) _then;

  static const _undefined = {};

  TRes call({
    Object? service_provider_offer = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$fetchPromotions(
        service_provider_offer: service_provider_offer == _undefined ||
                service_provider_offer == null
            ? _instance.service_provider_offer
            : (service_provider_offer
                as List<Query$fetchPromotions$service_provider_offer>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes service_provider_offer(
          Iterable<Query$fetchPromotions$service_provider_offer> Function(
                  Iterable<
                      CopyWith$Query$fetchPromotions$service_provider_offer<
                          Query$fetchPromotions$service_provider_offer>>)
              _fn) =>
      call(
          service_provider_offer: _fn(_instance.service_provider_offer
              .map((e) => CopyWith$Query$fetchPromotions$service_provider_offer(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$fetchPromotions<TRes>
    implements CopyWith$Query$fetchPromotions<TRes> {
  _CopyWithStubImpl$Query$fetchPromotions(this._res);

  TRes _res;

  call({
    List<Query$fetchPromotions$service_provider_offer>? service_provider_offer,
    String? $__typename,
  }) =>
      _res;
  service_provider_offer(_fn) => _res;
}

const documentNodeQueryfetchPromotions = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'fetchPromotions'),
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
        name: NameNode(value: 'service_provider_offer'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'offer_type'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: StringValueNode(
                      value: 'promotion',
                      isBlock: false,
                    ),
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
              ObjectFieldNode(
                name: NameNode(value: 'status'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: StringValueNode(
                      value: 'active',
                      isBlock: false,
                    ),
                  )
                ]),
              ),
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'details'),
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
            name: NameNode(value: 'name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'translations'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'language_id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'value'),
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
            name: NameNode(value: 'name_id'),
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
Query$fetchPromotions _parserFn$Query$fetchPromotions(
        Map<String, dynamic> data) =>
    Query$fetchPromotions.fromJson(data);

class Options$Query$fetchPromotions
    extends graphql.QueryOptions<Query$fetchPromotions> {
  Options$Query$fetchPromotions({
    String? operationName,
    Variables$Query$fetchPromotions? variables,
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
          document: documentNodeQueryfetchPromotions,
          parserFn: _parserFn$Query$fetchPromotions,
        );
}

class WatchOptions$Query$fetchPromotions
    extends graphql.WatchQueryOptions<Query$fetchPromotions> {
  WatchOptions$Query$fetchPromotions({
    String? operationName,
    Variables$Query$fetchPromotions? variables,
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
          document: documentNodeQueryfetchPromotions,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$fetchPromotions,
        );
}

class FetchMoreOptions$Query$fetchPromotions extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$fetchPromotions({
    required graphql.UpdateQuery updateQuery,
    Variables$Query$fetchPromotions? variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables?.toJson() ?? {},
          document: documentNodeQueryfetchPromotions,
        );
}

extension ClientExtension$Query$fetchPromotions on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$fetchPromotions>> query$fetchPromotions(
          [Options$Query$fetchPromotions? options]) async =>
      await this.query(options ?? Options$Query$fetchPromotions());
  graphql.ObservableQuery<Query$fetchPromotions> watchQuery$fetchPromotions(
          [WatchOptions$Query$fetchPromotions? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$fetchPromotions());
  void writeQuery$fetchPromotions({
    required Query$fetchPromotions data,
    Variables$Query$fetchPromotions? variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryfetchPromotions),
          variables: variables?.toJson() ?? const {},
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$fetchPromotions? readQuery$fetchPromotions({
    Variables$Query$fetchPromotions? variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQueryfetchPromotions),
        variables: variables?.toJson() ?? const {},
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$fetchPromotions.fromJson(result);
  }
}

class Query$fetchPromotions$service_provider_offer {
  Query$fetchPromotions$service_provider_offer({
    required this.details,
    required this.id,
    required this.name,
    required this.name_id,
    required this.$__typename,
  });

  factory Query$fetchPromotions$service_provider_offer.fromJson(
      Map<String, dynamic> json) {
    final l$details = json['details'];
    final l$id = json['id'];
    final l$name = json['name'];
    final l$name_id = json['name_id'];
    final l$$__typename = json['__typename'];
    return Query$fetchPromotions$service_provider_offer(
      details: mapFromJson(l$details),
      id: (l$id as int),
      name: Query$fetchPromotions$service_provider_offer$name.fromJson(
          (l$name as Map<String, dynamic>)),
      name_id: (l$name_id as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final dynamic details;

  final int id;

  final Query$fetchPromotions$service_provider_offer$name name;

  final int name_id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$details = details;
    _resultData['details'] = mapToJson(l$details);
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name.toJson();
    final l$name_id = name_id;
    _resultData['name_id'] = l$name_id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$details = details;
    final l$id = id;
    final l$name = name;
    final l$name_id = name_id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$details,
      l$id,
      l$name,
      l$name_id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$fetchPromotions$service_provider_offer) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$details = details;
    final lOther$details = other.details;
    if (l$details != lOther$details) {
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
    final l$name_id = name_id;
    final lOther$name_id = other.name_id;
    if (l$name_id != lOther$name_id) {
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

extension UtilityExtension$Query$fetchPromotions$service_provider_offer
    on Query$fetchPromotions$service_provider_offer {
  CopyWith$Query$fetchPromotions$service_provider_offer<
          Query$fetchPromotions$service_provider_offer>
      get copyWith => CopyWith$Query$fetchPromotions$service_provider_offer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$fetchPromotions$service_provider_offer<TRes> {
  factory CopyWith$Query$fetchPromotions$service_provider_offer(
    Query$fetchPromotions$service_provider_offer instance,
    TRes Function(Query$fetchPromotions$service_provider_offer) then,
  ) = _CopyWithImpl$Query$fetchPromotions$service_provider_offer;

  factory CopyWith$Query$fetchPromotions$service_provider_offer.stub(TRes res) =
      _CopyWithStubImpl$Query$fetchPromotions$service_provider_offer;

  TRes call({
    dynamic? details,
    int? id,
    Query$fetchPromotions$service_provider_offer$name? name,
    int? name_id,
    String? $__typename,
  });
  CopyWith$Query$fetchPromotions$service_provider_offer$name<TRes> get name;
}

class _CopyWithImpl$Query$fetchPromotions$service_provider_offer<TRes>
    implements CopyWith$Query$fetchPromotions$service_provider_offer<TRes> {
  _CopyWithImpl$Query$fetchPromotions$service_provider_offer(
    this._instance,
    this._then,
  );

  final Query$fetchPromotions$service_provider_offer _instance;

  final TRes Function(Query$fetchPromotions$service_provider_offer) _then;

  static const _undefined = {};

  TRes call({
    Object? details = _undefined,
    Object? id = _undefined,
    Object? name = _undefined,
    Object? name_id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$fetchPromotions$service_provider_offer(
        details: details == _undefined || details == null
            ? _instance.details
            : (details as dynamic),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as Query$fetchPromotions$service_provider_offer$name),
        name_id: name_id == _undefined || name_id == null
            ? _instance.name_id
            : (name_id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$fetchPromotions$service_provider_offer$name<TRes> get name {
    final local$name = _instance.name;
    return CopyWith$Query$fetchPromotions$service_provider_offer$name(
        local$name, (e) => call(name: e));
  }
}

class _CopyWithStubImpl$Query$fetchPromotions$service_provider_offer<TRes>
    implements CopyWith$Query$fetchPromotions$service_provider_offer<TRes> {
  _CopyWithStubImpl$Query$fetchPromotions$service_provider_offer(this._res);

  TRes _res;

  call({
    dynamic? details,
    int? id,
    Query$fetchPromotions$service_provider_offer$name? name,
    int? name_id,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$fetchPromotions$service_provider_offer$name<TRes> get name =>
      CopyWith$Query$fetchPromotions$service_provider_offer$name.stub(_res);
}

class Query$fetchPromotions$service_provider_offer$name {
  Query$fetchPromotions$service_provider_offer$name({
    required this.translations,
    required this.$__typename,
  });

  factory Query$fetchPromotions$service_provider_offer$name.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$fetchPromotions$service_provider_offer$name(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$fetchPromotions$service_provider_offer$name$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$fetchPromotions$service_provider_offer$name$translations>
      translations;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$translations = translations;
    _resultData['translations'] =
        l$translations.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$translations = translations;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$translations.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$fetchPromotions$service_provider_offer$name) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$translations = translations;
    final lOther$translations = other.translations;
    if (l$translations.length != lOther$translations.length) {
      return false;
    }
    for (int i = 0; i < l$translations.length; i++) {
      final l$translations$entry = l$translations[i];
      final lOther$translations$entry = lOther$translations[i];
      if (l$translations$entry != lOther$translations$entry) {
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

extension UtilityExtension$Query$fetchPromotions$service_provider_offer$name
    on Query$fetchPromotions$service_provider_offer$name {
  CopyWith$Query$fetchPromotions$service_provider_offer$name<
          Query$fetchPromotions$service_provider_offer$name>
      get copyWith =>
          CopyWith$Query$fetchPromotions$service_provider_offer$name(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$fetchPromotions$service_provider_offer$name<
    TRes> {
  factory CopyWith$Query$fetchPromotions$service_provider_offer$name(
    Query$fetchPromotions$service_provider_offer$name instance,
    TRes Function(Query$fetchPromotions$service_provider_offer$name) then,
  ) = _CopyWithImpl$Query$fetchPromotions$service_provider_offer$name;

  factory CopyWith$Query$fetchPromotions$service_provider_offer$name.stub(
          TRes res) =
      _CopyWithStubImpl$Query$fetchPromotions$service_provider_offer$name;

  TRes call({
    List<Query$fetchPromotions$service_provider_offer$name$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$fetchPromotions$service_provider_offer$name$translations> Function(
              Iterable<
                  CopyWith$Query$fetchPromotions$service_provider_offer$name$translations<
                      Query$fetchPromotions$service_provider_offer$name$translations>>)
          _fn);
}

class _CopyWithImpl$Query$fetchPromotions$service_provider_offer$name<TRes>
    implements
        CopyWith$Query$fetchPromotions$service_provider_offer$name<TRes> {
  _CopyWithImpl$Query$fetchPromotions$service_provider_offer$name(
    this._instance,
    this._then,
  );

  final Query$fetchPromotions$service_provider_offer$name _instance;

  final TRes Function(Query$fetchPromotions$service_provider_offer$name) _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$fetchPromotions$service_provider_offer$name(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$fetchPromotions$service_provider_offer$name$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$fetchPromotions$service_provider_offer$name$translations> Function(
                  Iterable<
                      CopyWith$Query$fetchPromotions$service_provider_offer$name$translations<
                          Query$fetchPromotions$service_provider_offer$name$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$fetchPromotions$service_provider_offer$name$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$fetchPromotions$service_provider_offer$name<TRes>
    implements
        CopyWith$Query$fetchPromotions$service_provider_offer$name<TRes> {
  _CopyWithStubImpl$Query$fetchPromotions$service_provider_offer$name(
      this._res);

  TRes _res;

  call({
    List<Query$fetchPromotions$service_provider_offer$name$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$fetchPromotions$service_provider_offer$name$translations {
  Query$fetchPromotions$service_provider_offer$name$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$fetchPromotions$service_provider_offer$name$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$fetchPromotions$service_provider_offer$name$translations(
      language_id: (l$language_id as String),
      value: (l$value as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String language_id;

  final String value;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$language_id = language_id;
    _resultData['language_id'] = l$language_id;
    final l$value = value;
    _resultData['value'] = l$value;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$language_id = language_id;
    final l$value = value;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$language_id,
      l$value,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$fetchPromotions$service_provider_offer$name$translations) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$language_id = language_id;
    final lOther$language_id = other.language_id;
    if (l$language_id != lOther$language_id) {
      return false;
    }
    final l$value = value;
    final lOther$value = other.value;
    if (l$value != lOther$value) {
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

extension UtilityExtension$Query$fetchPromotions$service_provider_offer$name$translations
    on Query$fetchPromotions$service_provider_offer$name$translations {
  CopyWith$Query$fetchPromotions$service_provider_offer$name$translations<
          Query$fetchPromotions$service_provider_offer$name$translations>
      get copyWith =>
          CopyWith$Query$fetchPromotions$service_provider_offer$name$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$fetchPromotions$service_provider_offer$name$translations<
    TRes> {
  factory CopyWith$Query$fetchPromotions$service_provider_offer$name$translations(
    Query$fetchPromotions$service_provider_offer$name$translations instance,
    TRes Function(
            Query$fetchPromotions$service_provider_offer$name$translations)
        then,
  ) = _CopyWithImpl$Query$fetchPromotions$service_provider_offer$name$translations;

  factory CopyWith$Query$fetchPromotions$service_provider_offer$name$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$fetchPromotions$service_provider_offer$name$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$fetchPromotions$service_provider_offer$name$translations<
        TRes>
    implements
        CopyWith$Query$fetchPromotions$service_provider_offer$name$translations<
            TRes> {
  _CopyWithImpl$Query$fetchPromotions$service_provider_offer$name$translations(
    this._instance,
    this._then,
  );

  final Query$fetchPromotions$service_provider_offer$name$translations
      _instance;

  final TRes Function(
      Query$fetchPromotions$service_provider_offer$name$translations) _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$fetchPromotions$service_provider_offer$name$translations(
        language_id: language_id == _undefined || language_id == null
            ? _instance.language_id
            : (language_id as String),
        value: value == _undefined || value == null
            ? _instance.value
            : (value as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$fetchPromotions$service_provider_offer$name$translations<
        TRes>
    implements
        CopyWith$Query$fetchPromotions$service_provider_offer$name$translations<
            TRes> {
  _CopyWithStubImpl$Query$fetchPromotions$service_provider_offer$name$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}
