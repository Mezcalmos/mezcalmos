import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';

class Variables$Query$admin_get_dv_companies {
  factory Variables$Query$admin_get_dv_companies({
    required int limit,
    required int offset,
  }) =>
      Variables$Query$admin_get_dv_companies._({
        r'limit': limit,
        r'offset': offset,
      });

  Variables$Query$admin_get_dv_companies._(this._$data);

  factory Variables$Query$admin_get_dv_companies.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$limit = data['limit'];
    result$data['limit'] = (l$limit as int);
    final l$offset = data['offset'];
    result$data['offset'] = (l$offset as int);
    return Variables$Query$admin_get_dv_companies._(result$data);
  }

  Map<String, dynamic> _$data;

  int get limit => (_$data['limit'] as int);
  int get offset => (_$data['offset'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$limit = limit;
    result$data['limit'] = l$limit;
    final l$offset = offset;
    result$data['offset'] = l$offset;
    return result$data;
  }

  CopyWith$Variables$Query$admin_get_dv_companies<
          Variables$Query$admin_get_dv_companies>
      get copyWith => CopyWith$Variables$Query$admin_get_dv_companies(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$admin_get_dv_companies) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$limit = limit;
    final lOther$limit = other.limit;
    if (l$limit != lOther$limit) {
      return false;
    }
    final l$offset = offset;
    final lOther$offset = other.offset;
    if (l$offset != lOther$offset) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$limit = limit;
    final l$offset = offset;
    return Object.hashAll([
      l$limit,
      l$offset,
    ]);
  }
}

abstract class CopyWith$Variables$Query$admin_get_dv_companies<TRes> {
  factory CopyWith$Variables$Query$admin_get_dv_companies(
    Variables$Query$admin_get_dv_companies instance,
    TRes Function(Variables$Query$admin_get_dv_companies) then,
  ) = _CopyWithImpl$Variables$Query$admin_get_dv_companies;

  factory CopyWith$Variables$Query$admin_get_dv_companies.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$admin_get_dv_companies;

  TRes call({
    int? limit,
    int? offset,
  });
}

class _CopyWithImpl$Variables$Query$admin_get_dv_companies<TRes>
    implements CopyWith$Variables$Query$admin_get_dv_companies<TRes> {
  _CopyWithImpl$Variables$Query$admin_get_dv_companies(
    this._instance,
    this._then,
  );

  final Variables$Query$admin_get_dv_companies _instance;

  final TRes Function(Variables$Query$admin_get_dv_companies) _then;

  static const _undefined = {};

  TRes call({
    Object? limit = _undefined,
    Object? offset = _undefined,
  }) =>
      _then(Variables$Query$admin_get_dv_companies._({
        ..._instance._$data,
        if (limit != _undefined && limit != null) 'limit': (limit as int),
        if (offset != _undefined && offset != null) 'offset': (offset as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$admin_get_dv_companies<TRes>
    implements CopyWith$Variables$Query$admin_get_dv_companies<TRes> {
  _CopyWithStubImpl$Variables$Query$admin_get_dv_companies(this._res);

  TRes _res;

  call({
    int? limit,
    int? offset,
  }) =>
      _res;
}

class Query$admin_get_dv_companies {
  Query$admin_get_dv_companies({
    required this.delivery_company,
    required this.$__typename,
  });

  factory Query$admin_get_dv_companies.fromJson(Map<String, dynamic> json) {
    final l$delivery_company = json['delivery_company'];
    final l$$__typename = json['__typename'];
    return Query$admin_get_dv_companies(
      delivery_company: (l$delivery_company as List<dynamic>)
          .map((e) => Query$admin_get_dv_companies$delivery_company.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$admin_get_dv_companies$delivery_company> delivery_company;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$delivery_company = delivery_company;
    _resultData['delivery_company'] =
        l$delivery_company.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$delivery_company = delivery_company;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$delivery_company.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$admin_get_dv_companies) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$delivery_company = delivery_company;
    final lOther$delivery_company = other.delivery_company;
    if (l$delivery_company.length != lOther$delivery_company.length) {
      return false;
    }
    for (int i = 0; i < l$delivery_company.length; i++) {
      final l$delivery_company$entry = l$delivery_company[i];
      final lOther$delivery_company$entry = lOther$delivery_company[i];
      if (l$delivery_company$entry != lOther$delivery_company$entry) {
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

extension UtilityExtension$Query$admin_get_dv_companies
    on Query$admin_get_dv_companies {
  CopyWith$Query$admin_get_dv_companies<Query$admin_get_dv_companies>
      get copyWith => CopyWith$Query$admin_get_dv_companies(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$admin_get_dv_companies<TRes> {
  factory CopyWith$Query$admin_get_dv_companies(
    Query$admin_get_dv_companies instance,
    TRes Function(Query$admin_get_dv_companies) then,
  ) = _CopyWithImpl$Query$admin_get_dv_companies;

  factory CopyWith$Query$admin_get_dv_companies.stub(TRes res) =
      _CopyWithStubImpl$Query$admin_get_dv_companies;

  TRes call({
    List<Query$admin_get_dv_companies$delivery_company>? delivery_company,
    String? $__typename,
  });
  TRes delivery_company(
      Iterable<Query$admin_get_dv_companies$delivery_company> Function(
              Iterable<
                  CopyWith$Query$admin_get_dv_companies$delivery_company<
                      Query$admin_get_dv_companies$delivery_company>>)
          _fn);
}

class _CopyWithImpl$Query$admin_get_dv_companies<TRes>
    implements CopyWith$Query$admin_get_dv_companies<TRes> {
  _CopyWithImpl$Query$admin_get_dv_companies(
    this._instance,
    this._then,
  );

  final Query$admin_get_dv_companies _instance;

  final TRes Function(Query$admin_get_dv_companies) _then;

  static const _undefined = {};

  TRes call({
    Object? delivery_company = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$admin_get_dv_companies(
        delivery_company:
            delivery_company == _undefined || delivery_company == null
                ? _instance.delivery_company
                : (delivery_company
                    as List<Query$admin_get_dv_companies$delivery_company>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes delivery_company(
          Iterable<Query$admin_get_dv_companies$delivery_company> Function(
                  Iterable<
                      CopyWith$Query$admin_get_dv_companies$delivery_company<
                          Query$admin_get_dv_companies$delivery_company>>)
              _fn) =>
      call(
          delivery_company: _fn(_instance.delivery_company.map(
              (e) => CopyWith$Query$admin_get_dv_companies$delivery_company(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$admin_get_dv_companies<TRes>
    implements CopyWith$Query$admin_get_dv_companies<TRes> {
  _CopyWithStubImpl$Query$admin_get_dv_companies(this._res);

  TRes _res;

  call({
    List<Query$admin_get_dv_companies$delivery_company>? delivery_company,
    String? $__typename,
  }) =>
      _res;
  delivery_company(_fn) => _res;
}

const documentNodeQueryadmin_get_dv_companies = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'admin_get_dv_companies'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'limit')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'offset')),
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
        name: NameNode(value: 'delivery_company'),
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
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'delivery_details'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'cost_per_km'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'customer_pickup'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'delivery_available'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'free_delivery_km_range'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'free_delivery_minimum_cost'),
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
                name: NameNode(value: 'radius'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'minimum_cost'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'self_delivery'),
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
            name: NameNode(value: 'details'),
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
                name: NameNode(value: 'is_open'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'approved'),
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
                name: NameNode(value: 'language'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'schedule'),
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
                name: NameNode(value: 'creation_time'),
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
                name: NameNode(value: 'location'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'gps'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'address'),
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
            name: NameNode(value: 'delivery_details_id'),
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
Query$admin_get_dv_companies _parserFn$Query$admin_get_dv_companies(
        Map<String, dynamic> data) =>
    Query$admin_get_dv_companies.fromJson(data);

class Options$Query$admin_get_dv_companies
    extends graphql.QueryOptions<Query$admin_get_dv_companies> {
  Options$Query$admin_get_dv_companies({
    String? operationName,
    required Variables$Query$admin_get_dv_companies variables,
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
          document: documentNodeQueryadmin_get_dv_companies,
          parserFn: _parserFn$Query$admin_get_dv_companies,
        );
}

class WatchOptions$Query$admin_get_dv_companies
    extends graphql.WatchQueryOptions<Query$admin_get_dv_companies> {
  WatchOptions$Query$admin_get_dv_companies({
    String? operationName,
    required Variables$Query$admin_get_dv_companies variables,
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
          document: documentNodeQueryadmin_get_dv_companies,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$admin_get_dv_companies,
        );
}

class FetchMoreOptions$Query$admin_get_dv_companies
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$admin_get_dv_companies({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$admin_get_dv_companies variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryadmin_get_dv_companies,
        );
}

extension ClientExtension$Query$admin_get_dv_companies
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$admin_get_dv_companies>>
      query$admin_get_dv_companies(
              Options$Query$admin_get_dv_companies options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$admin_get_dv_companies>
      watchQuery$admin_get_dv_companies(
              WatchOptions$Query$admin_get_dv_companies options) =>
          this.watchQuery(options);
  void writeQuery$admin_get_dv_companies({
    required Query$admin_get_dv_companies data,
    required Variables$Query$admin_get_dv_companies variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryadmin_get_dv_companies),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$admin_get_dv_companies? readQuery$admin_get_dv_companies({
    required Variables$Query$admin_get_dv_companies variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQueryadmin_get_dv_companies),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$admin_get_dv_companies.fromJson(result);
  }
}

class Query$admin_get_dv_companies$delivery_company {
  Query$admin_get_dv_companies$delivery_company({
    required this.delivery_details,
    this.details,
    required this.delivery_details_id,
    required this.id,
    required this.$__typename,
  });

  factory Query$admin_get_dv_companies$delivery_company.fromJson(
      Map<String, dynamic> json) {
    final l$delivery_details = json['delivery_details'];
    final l$details = json['details'];
    final l$delivery_details_id = json['delivery_details_id'];
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Query$admin_get_dv_companies$delivery_company(
      delivery_details:
          Query$admin_get_dv_companies$delivery_company$delivery_details
              .fromJson((l$delivery_details as Map<String, dynamic>)),
      details: l$details == null
          ? null
          : Query$admin_get_dv_companies$delivery_company$details.fromJson(
              (l$details as Map<String, dynamic>)),
      delivery_details_id: (l$delivery_details_id as int),
      id: (l$id as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$admin_get_dv_companies$delivery_company$delivery_details
      delivery_details;

  final Query$admin_get_dv_companies$delivery_company$details? details;

  final int delivery_details_id;

  final int id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$delivery_details = delivery_details;
    _resultData['delivery_details'] = l$delivery_details.toJson();
    final l$details = details;
    _resultData['details'] = l$details?.toJson();
    final l$delivery_details_id = delivery_details_id;
    _resultData['delivery_details_id'] = l$delivery_details_id;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$delivery_details = delivery_details;
    final l$details = details;
    final l$delivery_details_id = delivery_details_id;
    final l$id = id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$delivery_details,
      l$details,
      l$delivery_details_id,
      l$id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$admin_get_dv_companies$delivery_company) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$delivery_details = delivery_details;
    final lOther$delivery_details = other.delivery_details;
    if (l$delivery_details != lOther$delivery_details) {
      return false;
    }
    final l$details = details;
    final lOther$details = other.details;
    if (l$details != lOther$details) {
      return false;
    }
    final l$delivery_details_id = delivery_details_id;
    final lOther$delivery_details_id = other.delivery_details_id;
    if (l$delivery_details_id != lOther$delivery_details_id) {
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

extension UtilityExtension$Query$admin_get_dv_companies$delivery_company
    on Query$admin_get_dv_companies$delivery_company {
  CopyWith$Query$admin_get_dv_companies$delivery_company<
          Query$admin_get_dv_companies$delivery_company>
      get copyWith => CopyWith$Query$admin_get_dv_companies$delivery_company(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$admin_get_dv_companies$delivery_company<TRes> {
  factory CopyWith$Query$admin_get_dv_companies$delivery_company(
    Query$admin_get_dv_companies$delivery_company instance,
    TRes Function(Query$admin_get_dv_companies$delivery_company) then,
  ) = _CopyWithImpl$Query$admin_get_dv_companies$delivery_company;

  factory CopyWith$Query$admin_get_dv_companies$delivery_company.stub(
          TRes res) =
      _CopyWithStubImpl$Query$admin_get_dv_companies$delivery_company;

  TRes call({
    Query$admin_get_dv_companies$delivery_company$delivery_details?
        delivery_details,
    Query$admin_get_dv_companies$delivery_company$details? details,
    int? delivery_details_id,
    int? id,
    String? $__typename,
  });
  CopyWith$Query$admin_get_dv_companies$delivery_company$delivery_details<TRes>
      get delivery_details;
  CopyWith$Query$admin_get_dv_companies$delivery_company$details<TRes>
      get details;
}

class _CopyWithImpl$Query$admin_get_dv_companies$delivery_company<TRes>
    implements CopyWith$Query$admin_get_dv_companies$delivery_company<TRes> {
  _CopyWithImpl$Query$admin_get_dv_companies$delivery_company(
    this._instance,
    this._then,
  );

  final Query$admin_get_dv_companies$delivery_company _instance;

  final TRes Function(Query$admin_get_dv_companies$delivery_company) _then;

  static const _undefined = {};

  TRes call({
    Object? delivery_details = _undefined,
    Object? details = _undefined,
    Object? delivery_details_id = _undefined,
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$admin_get_dv_companies$delivery_company(
        delivery_details: delivery_details == _undefined ||
                delivery_details == null
            ? _instance.delivery_details
            : (delivery_details
                as Query$admin_get_dv_companies$delivery_company$delivery_details),
        details: details == _undefined
            ? _instance.details
            : (details
                as Query$admin_get_dv_companies$delivery_company$details?),
        delivery_details_id:
            delivery_details_id == _undefined || delivery_details_id == null
                ? _instance.delivery_details_id
                : (delivery_details_id as int),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$admin_get_dv_companies$delivery_company$delivery_details<TRes>
      get delivery_details {
    final local$delivery_details = _instance.delivery_details;
    return CopyWith$Query$admin_get_dv_companies$delivery_company$delivery_details(
        local$delivery_details, (e) => call(delivery_details: e));
  }

  CopyWith$Query$admin_get_dv_companies$delivery_company$details<TRes>
      get details {
    final local$details = _instance.details;
    return local$details == null
        ? CopyWith$Query$admin_get_dv_companies$delivery_company$details.stub(
            _then(_instance))
        : CopyWith$Query$admin_get_dv_companies$delivery_company$details(
            local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Query$admin_get_dv_companies$delivery_company<TRes>
    implements CopyWith$Query$admin_get_dv_companies$delivery_company<TRes> {
  _CopyWithStubImpl$Query$admin_get_dv_companies$delivery_company(this._res);

  TRes _res;

  call({
    Query$admin_get_dv_companies$delivery_company$delivery_details?
        delivery_details,
    Query$admin_get_dv_companies$delivery_company$details? details,
    int? delivery_details_id,
    int? id,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$admin_get_dv_companies$delivery_company$delivery_details<TRes>
      get delivery_details =>
          CopyWith$Query$admin_get_dv_companies$delivery_company$delivery_details
              .stub(_res);
  CopyWith$Query$admin_get_dv_companies$delivery_company$details<TRes>
      get details =>
          CopyWith$Query$admin_get_dv_companies$delivery_company$details.stub(
              _res);
}

class Query$admin_get_dv_companies$delivery_company$delivery_details {
  Query$admin_get_dv_companies$delivery_company$delivery_details({
    required this.cost_per_km,
    required this.customer_pickup,
    required this.delivery_available,
    this.free_delivery_km_range,
    this.free_delivery_minimum_cost,
    required this.id,
    required this.radius,
    required this.minimum_cost,
    required this.self_delivery,
    required this.$__typename,
  });

  factory Query$admin_get_dv_companies$delivery_company$delivery_details.fromJson(
      Map<String, dynamic> json) {
    final l$cost_per_km = json['cost_per_km'];
    final l$customer_pickup = json['customer_pickup'];
    final l$delivery_available = json['delivery_available'];
    final l$free_delivery_km_range = json['free_delivery_km_range'];
    final l$free_delivery_minimum_cost = json['free_delivery_minimum_cost'];
    final l$id = json['id'];
    final l$radius = json['radius'];
    final l$minimum_cost = json['minimum_cost'];
    final l$self_delivery = json['self_delivery'];
    final l$$__typename = json['__typename'];
    return Query$admin_get_dv_companies$delivery_company$delivery_details(
      cost_per_km: moneyFromJson(l$cost_per_km),
      customer_pickup: (l$customer_pickup as bool),
      delivery_available: (l$delivery_available as bool),
      free_delivery_km_range: (l$free_delivery_km_range as num?)?.toDouble(),
      free_delivery_minimum_cost: l$free_delivery_minimum_cost == null
          ? null
          : moneyFromJson(l$free_delivery_minimum_cost),
      id: (l$id as int),
      radius: (l$radius as int),
      minimum_cost: moneyFromJson(l$minimum_cost),
      self_delivery: (l$self_delivery as bool),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final double cost_per_km;

  final bool customer_pickup;

  final bool delivery_available;

  final double? free_delivery_km_range;

  final double? free_delivery_minimum_cost;

  final int id;

  final int radius;

  final double minimum_cost;

  final bool self_delivery;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$cost_per_km = cost_per_km;
    _resultData['cost_per_km'] = moneyToJson(l$cost_per_km);
    final l$customer_pickup = customer_pickup;
    _resultData['customer_pickup'] = l$customer_pickup;
    final l$delivery_available = delivery_available;
    _resultData['delivery_available'] = l$delivery_available;
    final l$free_delivery_km_range = free_delivery_km_range;
    _resultData['free_delivery_km_range'] = l$free_delivery_km_range;
    final l$free_delivery_minimum_cost = free_delivery_minimum_cost;
    _resultData['free_delivery_minimum_cost'] =
        l$free_delivery_minimum_cost == null
            ? null
            : moneyToJson(l$free_delivery_minimum_cost);
    final l$id = id;
    _resultData['id'] = l$id;
    final l$radius = radius;
    _resultData['radius'] = l$radius;
    final l$minimum_cost = minimum_cost;
    _resultData['minimum_cost'] = moneyToJson(l$minimum_cost);
    final l$self_delivery = self_delivery;
    _resultData['self_delivery'] = l$self_delivery;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$cost_per_km = cost_per_km;
    final l$customer_pickup = customer_pickup;
    final l$delivery_available = delivery_available;
    final l$free_delivery_km_range = free_delivery_km_range;
    final l$free_delivery_minimum_cost = free_delivery_minimum_cost;
    final l$id = id;
    final l$radius = radius;
    final l$minimum_cost = minimum_cost;
    final l$self_delivery = self_delivery;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$cost_per_km,
      l$customer_pickup,
      l$delivery_available,
      l$free_delivery_km_range,
      l$free_delivery_minimum_cost,
      l$id,
      l$radius,
      l$minimum_cost,
      l$self_delivery,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$admin_get_dv_companies$delivery_company$delivery_details) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$cost_per_km = cost_per_km;
    final lOther$cost_per_km = other.cost_per_km;
    if (l$cost_per_km != lOther$cost_per_km) {
      return false;
    }
    final l$customer_pickup = customer_pickup;
    final lOther$customer_pickup = other.customer_pickup;
    if (l$customer_pickup != lOther$customer_pickup) {
      return false;
    }
    final l$delivery_available = delivery_available;
    final lOther$delivery_available = other.delivery_available;
    if (l$delivery_available != lOther$delivery_available) {
      return false;
    }
    final l$free_delivery_km_range = free_delivery_km_range;
    final lOther$free_delivery_km_range = other.free_delivery_km_range;
    if (l$free_delivery_km_range != lOther$free_delivery_km_range) {
      return false;
    }
    final l$free_delivery_minimum_cost = free_delivery_minimum_cost;
    final lOther$free_delivery_minimum_cost = other.free_delivery_minimum_cost;
    if (l$free_delivery_minimum_cost != lOther$free_delivery_minimum_cost) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$radius = radius;
    final lOther$radius = other.radius;
    if (l$radius != lOther$radius) {
      return false;
    }
    final l$minimum_cost = minimum_cost;
    final lOther$minimum_cost = other.minimum_cost;
    if (l$minimum_cost != lOther$minimum_cost) {
      return false;
    }
    final l$self_delivery = self_delivery;
    final lOther$self_delivery = other.self_delivery;
    if (l$self_delivery != lOther$self_delivery) {
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

extension UtilityExtension$Query$admin_get_dv_companies$delivery_company$delivery_details
    on Query$admin_get_dv_companies$delivery_company$delivery_details {
  CopyWith$Query$admin_get_dv_companies$delivery_company$delivery_details<
          Query$admin_get_dv_companies$delivery_company$delivery_details>
      get copyWith =>
          CopyWith$Query$admin_get_dv_companies$delivery_company$delivery_details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$admin_get_dv_companies$delivery_company$delivery_details<
    TRes> {
  factory CopyWith$Query$admin_get_dv_companies$delivery_company$delivery_details(
    Query$admin_get_dv_companies$delivery_company$delivery_details instance,
    TRes Function(
            Query$admin_get_dv_companies$delivery_company$delivery_details)
        then,
  ) = _CopyWithImpl$Query$admin_get_dv_companies$delivery_company$delivery_details;

  factory CopyWith$Query$admin_get_dv_companies$delivery_company$delivery_details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$admin_get_dv_companies$delivery_company$delivery_details;

  TRes call({
    double? cost_per_km,
    bool? customer_pickup,
    bool? delivery_available,
    double? free_delivery_km_range,
    double? free_delivery_minimum_cost,
    int? id,
    int? radius,
    double? minimum_cost,
    bool? self_delivery,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$admin_get_dv_companies$delivery_company$delivery_details<
        TRes>
    implements
        CopyWith$Query$admin_get_dv_companies$delivery_company$delivery_details<
            TRes> {
  _CopyWithImpl$Query$admin_get_dv_companies$delivery_company$delivery_details(
    this._instance,
    this._then,
  );

  final Query$admin_get_dv_companies$delivery_company$delivery_details
      _instance;

  final TRes Function(
      Query$admin_get_dv_companies$delivery_company$delivery_details) _then;

  static const _undefined = {};

  TRes call({
    Object? cost_per_km = _undefined,
    Object? customer_pickup = _undefined,
    Object? delivery_available = _undefined,
    Object? free_delivery_km_range = _undefined,
    Object? free_delivery_minimum_cost = _undefined,
    Object? id = _undefined,
    Object? radius = _undefined,
    Object? minimum_cost = _undefined,
    Object? self_delivery = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$admin_get_dv_companies$delivery_company$delivery_details(
        cost_per_km: cost_per_km == _undefined || cost_per_km == null
            ? _instance.cost_per_km
            : (cost_per_km as double),
        customer_pickup:
            customer_pickup == _undefined || customer_pickup == null
                ? _instance.customer_pickup
                : (customer_pickup as bool),
        delivery_available:
            delivery_available == _undefined || delivery_available == null
                ? _instance.delivery_available
                : (delivery_available as bool),
        free_delivery_km_range: free_delivery_km_range == _undefined
            ? _instance.free_delivery_km_range
            : (free_delivery_km_range as double?),
        free_delivery_minimum_cost: free_delivery_minimum_cost == _undefined
            ? _instance.free_delivery_minimum_cost
            : (free_delivery_minimum_cost as double?),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        radius: radius == _undefined || radius == null
            ? _instance.radius
            : (radius as int),
        minimum_cost: minimum_cost == _undefined || minimum_cost == null
            ? _instance.minimum_cost
            : (minimum_cost as double),
        self_delivery: self_delivery == _undefined || self_delivery == null
            ? _instance.self_delivery
            : (self_delivery as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$admin_get_dv_companies$delivery_company$delivery_details<
        TRes>
    implements
        CopyWith$Query$admin_get_dv_companies$delivery_company$delivery_details<
            TRes> {
  _CopyWithStubImpl$Query$admin_get_dv_companies$delivery_company$delivery_details(
      this._res);

  TRes _res;

  call({
    double? cost_per_km,
    bool? customer_pickup,
    bool? delivery_available,
    double? free_delivery_km_range,
    double? free_delivery_minimum_cost,
    int? id,
    int? radius,
    double? minimum_cost,
    bool? self_delivery,
    String? $__typename,
  }) =>
      _res;
}

class Query$admin_get_dv_companies$delivery_company$details {
  Query$admin_get_dv_companies$delivery_company$details({
    required this.id,
    this.is_open,
    required this.approved,
    required this.image,
    required this.name,
    required this.language,
    this.schedule,
    required this.open_status,
    required this.creation_time,
    required this.service_provider_type,
    required this.location,
    required this.$__typename,
  });

  factory Query$admin_get_dv_companies$delivery_company$details.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$is_open = json['is_open'];
    final l$approved = json['approved'];
    final l$image = json['image'];
    final l$name = json['name'];
    final l$language = json['language'];
    final l$schedule = json['schedule'];
    final l$open_status = json['open_status'];
    final l$creation_time = json['creation_time'];
    final l$service_provider_type = json['service_provider_type'];
    final l$location = json['location'];
    final l$$__typename = json['__typename'];
    return Query$admin_get_dv_companies$delivery_company$details(
      id: (l$id as int),
      is_open: (l$is_open as bool?),
      approved: (l$approved as bool),
      image: (l$image as String),
      name: (l$name as String),
      language: mapFromJson(l$language),
      schedule: l$schedule == null ? null : mapFromJson(l$schedule),
      open_status: (l$open_status as String),
      creation_time: (l$creation_time as String),
      service_provider_type: (l$service_provider_type as String),
      location: Query$admin_get_dv_companies$delivery_company$details$location
          .fromJson((l$location as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final bool? is_open;

  final bool approved;

  final String image;

  final String name;

  final dynamic language;

  final dynamic? schedule;

  final String open_status;

  final String creation_time;

  final String service_provider_type;

  final Query$admin_get_dv_companies$delivery_company$details$location location;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$is_open = is_open;
    _resultData['is_open'] = l$is_open;
    final l$approved = approved;
    _resultData['approved'] = l$approved;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$language = language;
    _resultData['language'] = mapToJson(l$language);
    final l$schedule = schedule;
    _resultData['schedule'] = l$schedule == null ? null : mapToJson(l$schedule);
    final l$open_status = open_status;
    _resultData['open_status'] = l$open_status;
    final l$creation_time = creation_time;
    _resultData['creation_time'] = l$creation_time;
    final l$service_provider_type = service_provider_type;
    _resultData['service_provider_type'] = l$service_provider_type;
    final l$location = location;
    _resultData['location'] = l$location.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$is_open = is_open;
    final l$approved = approved;
    final l$image = image;
    final l$name = name;
    final l$language = language;
    final l$schedule = schedule;
    final l$open_status = open_status;
    final l$creation_time = creation_time;
    final l$service_provider_type = service_provider_type;
    final l$location = location;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$is_open,
      l$approved,
      l$image,
      l$name,
      l$language,
      l$schedule,
      l$open_status,
      l$creation_time,
      l$service_provider_type,
      l$location,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$admin_get_dv_companies$delivery_company$details) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$is_open = is_open;
    final lOther$is_open = other.is_open;
    if (l$is_open != lOther$is_open) {
      return false;
    }
    final l$approved = approved;
    final lOther$approved = other.approved;
    if (l$approved != lOther$approved) {
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
    final l$language = language;
    final lOther$language = other.language;
    if (l$language != lOther$language) {
      return false;
    }
    final l$schedule = schedule;
    final lOther$schedule = other.schedule;
    if (l$schedule != lOther$schedule) {
      return false;
    }
    final l$open_status = open_status;
    final lOther$open_status = other.open_status;
    if (l$open_status != lOther$open_status) {
      return false;
    }
    final l$creation_time = creation_time;
    final lOther$creation_time = other.creation_time;
    if (l$creation_time != lOther$creation_time) {
      return false;
    }
    final l$service_provider_type = service_provider_type;
    final lOther$service_provider_type = other.service_provider_type;
    if (l$service_provider_type != lOther$service_provider_type) {
      return false;
    }
    final l$location = location;
    final lOther$location = other.location;
    if (l$location != lOther$location) {
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

extension UtilityExtension$Query$admin_get_dv_companies$delivery_company$details
    on Query$admin_get_dv_companies$delivery_company$details {
  CopyWith$Query$admin_get_dv_companies$delivery_company$details<
          Query$admin_get_dv_companies$delivery_company$details>
      get copyWith =>
          CopyWith$Query$admin_get_dv_companies$delivery_company$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$admin_get_dv_companies$delivery_company$details<
    TRes> {
  factory CopyWith$Query$admin_get_dv_companies$delivery_company$details(
    Query$admin_get_dv_companies$delivery_company$details instance,
    TRes Function(Query$admin_get_dv_companies$delivery_company$details) then,
  ) = _CopyWithImpl$Query$admin_get_dv_companies$delivery_company$details;

  factory CopyWith$Query$admin_get_dv_companies$delivery_company$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$admin_get_dv_companies$delivery_company$details;

  TRes call({
    int? id,
    bool? is_open,
    bool? approved,
    String? image,
    String? name,
    dynamic? language,
    dynamic? schedule,
    String? open_status,
    String? creation_time,
    String? service_provider_type,
    Query$admin_get_dv_companies$delivery_company$details$location? location,
    String? $__typename,
  });
  CopyWith$Query$admin_get_dv_companies$delivery_company$details$location<TRes>
      get location;
}

class _CopyWithImpl$Query$admin_get_dv_companies$delivery_company$details<TRes>
    implements
        CopyWith$Query$admin_get_dv_companies$delivery_company$details<TRes> {
  _CopyWithImpl$Query$admin_get_dv_companies$delivery_company$details(
    this._instance,
    this._then,
  );

  final Query$admin_get_dv_companies$delivery_company$details _instance;

  final TRes Function(Query$admin_get_dv_companies$delivery_company$details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? is_open = _undefined,
    Object? approved = _undefined,
    Object? image = _undefined,
    Object? name = _undefined,
    Object? language = _undefined,
    Object? schedule = _undefined,
    Object? open_status = _undefined,
    Object? creation_time = _undefined,
    Object? service_provider_type = _undefined,
    Object? location = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$admin_get_dv_companies$delivery_company$details(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        is_open: is_open == _undefined ? _instance.is_open : (is_open as bool?),
        approved: approved == _undefined || approved == null
            ? _instance.approved
            : (approved as bool),
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        language: language == _undefined || language == null
            ? _instance.language
            : (language as dynamic),
        schedule: schedule == _undefined
            ? _instance.schedule
            : (schedule as dynamic?),
        open_status: open_status == _undefined || open_status == null
            ? _instance.open_status
            : (open_status as String),
        creation_time: creation_time == _undefined || creation_time == null
            ? _instance.creation_time
            : (creation_time as String),
        service_provider_type:
            service_provider_type == _undefined || service_provider_type == null
                ? _instance.service_provider_type
                : (service_provider_type as String),
        location: location == _undefined || location == null
            ? _instance.location
            : (location
                as Query$admin_get_dv_companies$delivery_company$details$location),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$admin_get_dv_companies$delivery_company$details$location<TRes>
      get location {
    final local$location = _instance.location;
    return CopyWith$Query$admin_get_dv_companies$delivery_company$details$location(
        local$location, (e) => call(location: e));
  }
}

class _CopyWithStubImpl$Query$admin_get_dv_companies$delivery_company$details<
        TRes>
    implements
        CopyWith$Query$admin_get_dv_companies$delivery_company$details<TRes> {
  _CopyWithStubImpl$Query$admin_get_dv_companies$delivery_company$details(
      this._res);

  TRes _res;

  call({
    int? id,
    bool? is_open,
    bool? approved,
    String? image,
    String? name,
    dynamic? language,
    dynamic? schedule,
    String? open_status,
    String? creation_time,
    String? service_provider_type,
    Query$admin_get_dv_companies$delivery_company$details$location? location,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$admin_get_dv_companies$delivery_company$details$location<TRes>
      get location =>
          CopyWith$Query$admin_get_dv_companies$delivery_company$details$location
              .stub(_res);
}

class Query$admin_get_dv_companies$delivery_company$details$location {
  Query$admin_get_dv_companies$delivery_company$details$location({
    required this.gps,
    required this.address,
    required this.$__typename,
  });

  factory Query$admin_get_dv_companies$delivery_company$details$location.fromJson(
      Map<String, dynamic> json) {
    final l$gps = json['gps'];
    final l$address = json['address'];
    final l$$__typename = json['__typename'];
    return Query$admin_get_dv_companies$delivery_company$details$location(
      gps: geographyFromJson(l$gps),
      address: (l$address as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Geography gps;

  final String address;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$gps = gps;
    _resultData['gps'] = geographyToJson(l$gps);
    final l$address = address;
    _resultData['address'] = l$address;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$gps = gps;
    final l$address = address;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$gps,
      l$address,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$admin_get_dv_companies$delivery_company$details$location) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$gps = gps;
    final lOther$gps = other.gps;
    if (l$gps != lOther$gps) {
      return false;
    }
    final l$address = address;
    final lOther$address = other.address;
    if (l$address != lOther$address) {
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

extension UtilityExtension$Query$admin_get_dv_companies$delivery_company$details$location
    on Query$admin_get_dv_companies$delivery_company$details$location {
  CopyWith$Query$admin_get_dv_companies$delivery_company$details$location<
          Query$admin_get_dv_companies$delivery_company$details$location>
      get copyWith =>
          CopyWith$Query$admin_get_dv_companies$delivery_company$details$location(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$admin_get_dv_companies$delivery_company$details$location<
    TRes> {
  factory CopyWith$Query$admin_get_dv_companies$delivery_company$details$location(
    Query$admin_get_dv_companies$delivery_company$details$location instance,
    TRes Function(
            Query$admin_get_dv_companies$delivery_company$details$location)
        then,
  ) = _CopyWithImpl$Query$admin_get_dv_companies$delivery_company$details$location;

  factory CopyWith$Query$admin_get_dv_companies$delivery_company$details$location.stub(
          TRes res) =
      _CopyWithStubImpl$Query$admin_get_dv_companies$delivery_company$details$location;

  TRes call({
    Geography? gps,
    String? address,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$admin_get_dv_companies$delivery_company$details$location<
        TRes>
    implements
        CopyWith$Query$admin_get_dv_companies$delivery_company$details$location<
            TRes> {
  _CopyWithImpl$Query$admin_get_dv_companies$delivery_company$details$location(
    this._instance,
    this._then,
  );

  final Query$admin_get_dv_companies$delivery_company$details$location
      _instance;

  final TRes Function(
      Query$admin_get_dv_companies$delivery_company$details$location) _then;

  static const _undefined = {};

  TRes call({
    Object? gps = _undefined,
    Object? address = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$admin_get_dv_companies$delivery_company$details$location(
        gps: gps == _undefined || gps == null
            ? _instance.gps
            : (gps as Geography),
        address: address == _undefined || address == null
            ? _instance.address
            : (address as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$admin_get_dv_companies$delivery_company$details$location<
        TRes>
    implements
        CopyWith$Query$admin_get_dv_companies$delivery_company$details$location<
            TRes> {
  _CopyWithStubImpl$Query$admin_get_dv_companies$delivery_company$details$location(
      this._res);

  TRes _res;

  call({
    Geography? gps,
    String? address,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$admin_get_laundries {
  factory Variables$Query$admin_get_laundries({
    required int limit,
    required int offset,
  }) =>
      Variables$Query$admin_get_laundries._({
        r'limit': limit,
        r'offset': offset,
      });

  Variables$Query$admin_get_laundries._(this._$data);

  factory Variables$Query$admin_get_laundries.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$limit = data['limit'];
    result$data['limit'] = (l$limit as int);
    final l$offset = data['offset'];
    result$data['offset'] = (l$offset as int);
    return Variables$Query$admin_get_laundries._(result$data);
  }

  Map<String, dynamic> _$data;

  int get limit => (_$data['limit'] as int);
  int get offset => (_$data['offset'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$limit = limit;
    result$data['limit'] = l$limit;
    final l$offset = offset;
    result$data['offset'] = l$offset;
    return result$data;
  }

  CopyWith$Variables$Query$admin_get_laundries<
          Variables$Query$admin_get_laundries>
      get copyWith => CopyWith$Variables$Query$admin_get_laundries(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$admin_get_laundries) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$limit = limit;
    final lOther$limit = other.limit;
    if (l$limit != lOther$limit) {
      return false;
    }
    final l$offset = offset;
    final lOther$offset = other.offset;
    if (l$offset != lOther$offset) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$limit = limit;
    final l$offset = offset;
    return Object.hashAll([
      l$limit,
      l$offset,
    ]);
  }
}

abstract class CopyWith$Variables$Query$admin_get_laundries<TRes> {
  factory CopyWith$Variables$Query$admin_get_laundries(
    Variables$Query$admin_get_laundries instance,
    TRes Function(Variables$Query$admin_get_laundries) then,
  ) = _CopyWithImpl$Variables$Query$admin_get_laundries;

  factory CopyWith$Variables$Query$admin_get_laundries.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$admin_get_laundries;

  TRes call({
    int? limit,
    int? offset,
  });
}

class _CopyWithImpl$Variables$Query$admin_get_laundries<TRes>
    implements CopyWith$Variables$Query$admin_get_laundries<TRes> {
  _CopyWithImpl$Variables$Query$admin_get_laundries(
    this._instance,
    this._then,
  );

  final Variables$Query$admin_get_laundries _instance;

  final TRes Function(Variables$Query$admin_get_laundries) _then;

  static const _undefined = {};

  TRes call({
    Object? limit = _undefined,
    Object? offset = _undefined,
  }) =>
      _then(Variables$Query$admin_get_laundries._({
        ..._instance._$data,
        if (limit != _undefined && limit != null) 'limit': (limit as int),
        if (offset != _undefined && offset != null) 'offset': (offset as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$admin_get_laundries<TRes>
    implements CopyWith$Variables$Query$admin_get_laundries<TRes> {
  _CopyWithStubImpl$Variables$Query$admin_get_laundries(this._res);

  TRes _res;

  call({
    int? limit,
    int? offset,
  }) =>
      _res;
}

class Query$admin_get_laundries {
  Query$admin_get_laundries({
    required this.laundry_store,
    required this.$__typename,
  });

  factory Query$admin_get_laundries.fromJson(Map<String, dynamic> json) {
    final l$laundry_store = json['laundry_store'];
    final l$$__typename = json['__typename'];
    return Query$admin_get_laundries(
      laundry_store: (l$laundry_store as List<dynamic>)
          .map((e) => Query$admin_get_laundries$laundry_store.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$admin_get_laundries$laundry_store> laundry_store;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$laundry_store = laundry_store;
    _resultData['laundry_store'] =
        l$laundry_store.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$laundry_store = laundry_store;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$laundry_store.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$admin_get_laundries) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$laundry_store = laundry_store;
    final lOther$laundry_store = other.laundry_store;
    if (l$laundry_store.length != lOther$laundry_store.length) {
      return false;
    }
    for (int i = 0; i < l$laundry_store.length; i++) {
      final l$laundry_store$entry = l$laundry_store[i];
      final lOther$laundry_store$entry = lOther$laundry_store[i];
      if (l$laundry_store$entry != lOther$laundry_store$entry) {
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

extension UtilityExtension$Query$admin_get_laundries
    on Query$admin_get_laundries {
  CopyWith$Query$admin_get_laundries<Query$admin_get_laundries> get copyWith =>
      CopyWith$Query$admin_get_laundries(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$admin_get_laundries<TRes> {
  factory CopyWith$Query$admin_get_laundries(
    Query$admin_get_laundries instance,
    TRes Function(Query$admin_get_laundries) then,
  ) = _CopyWithImpl$Query$admin_get_laundries;

  factory CopyWith$Query$admin_get_laundries.stub(TRes res) =
      _CopyWithStubImpl$Query$admin_get_laundries;

  TRes call({
    List<Query$admin_get_laundries$laundry_store>? laundry_store,
    String? $__typename,
  });
  TRes laundry_store(
      Iterable<Query$admin_get_laundries$laundry_store> Function(
              Iterable<
                  CopyWith$Query$admin_get_laundries$laundry_store<
                      Query$admin_get_laundries$laundry_store>>)
          _fn);
}

class _CopyWithImpl$Query$admin_get_laundries<TRes>
    implements CopyWith$Query$admin_get_laundries<TRes> {
  _CopyWithImpl$Query$admin_get_laundries(
    this._instance,
    this._then,
  );

  final Query$admin_get_laundries _instance;

  final TRes Function(Query$admin_get_laundries) _then;

  static const _undefined = {};

  TRes call({
    Object? laundry_store = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$admin_get_laundries(
        laundry_store: laundry_store == _undefined || laundry_store == null
            ? _instance.laundry_store
            : (laundry_store as List<Query$admin_get_laundries$laundry_store>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes laundry_store(
          Iterable<Query$admin_get_laundries$laundry_store> Function(
                  Iterable<
                      CopyWith$Query$admin_get_laundries$laundry_store<
                          Query$admin_get_laundries$laundry_store>>)
              _fn) =>
      call(
          laundry_store: _fn(_instance.laundry_store
              .map((e) => CopyWith$Query$admin_get_laundries$laundry_store(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$admin_get_laundries<TRes>
    implements CopyWith$Query$admin_get_laundries<TRes> {
  _CopyWithStubImpl$Query$admin_get_laundries(this._res);

  TRes _res;

  call({
    List<Query$admin_get_laundries$laundry_store>? laundry_store,
    String? $__typename,
  }) =>
      _res;
  laundry_store(_fn) => _res;
}

const documentNodeQueryadmin_get_laundries = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'admin_get_laundries'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'limit')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'offset')),
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
        name: NameNode(value: 'laundry_store'),
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
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'details'),
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
                name: NameNode(value: 'is_open'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'approved'),
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
                name: NameNode(value: 'language'),
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
                name: NameNode(value: 'creation_time'),
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
                name: NameNode(value: 'location'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'gps'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'address'),
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
            name: NameNode(value: 'delivery_details_id'),
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
Query$admin_get_laundries _parserFn$Query$admin_get_laundries(
        Map<String, dynamic> data) =>
    Query$admin_get_laundries.fromJson(data);

class Options$Query$admin_get_laundries
    extends graphql.QueryOptions<Query$admin_get_laundries> {
  Options$Query$admin_get_laundries({
    String? operationName,
    required Variables$Query$admin_get_laundries variables,
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
          document: documentNodeQueryadmin_get_laundries,
          parserFn: _parserFn$Query$admin_get_laundries,
        );
}

class WatchOptions$Query$admin_get_laundries
    extends graphql.WatchQueryOptions<Query$admin_get_laundries> {
  WatchOptions$Query$admin_get_laundries({
    String? operationName,
    required Variables$Query$admin_get_laundries variables,
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
          document: documentNodeQueryadmin_get_laundries,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$admin_get_laundries,
        );
}

class FetchMoreOptions$Query$admin_get_laundries
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$admin_get_laundries({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$admin_get_laundries variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryadmin_get_laundries,
        );
}

extension ClientExtension$Query$admin_get_laundries on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$admin_get_laundries>>
      query$admin_get_laundries(
              Options$Query$admin_get_laundries options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$admin_get_laundries>
      watchQuery$admin_get_laundries(
              WatchOptions$Query$admin_get_laundries options) =>
          this.watchQuery(options);
  void writeQuery$admin_get_laundries({
    required Query$admin_get_laundries data,
    required Variables$Query$admin_get_laundries variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryadmin_get_laundries),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$admin_get_laundries? readQuery$admin_get_laundries({
    required Variables$Query$admin_get_laundries variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQueryadmin_get_laundries),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$admin_get_laundries.fromJson(result);
  }
}

class Query$admin_get_laundries$laundry_store {
  Query$admin_get_laundries$laundry_store({
    this.details,
    required this.delivery_details_id,
    required this.id,
    required this.$__typename,
  });

  factory Query$admin_get_laundries$laundry_store.fromJson(
      Map<String, dynamic> json) {
    final l$details = json['details'];
    final l$delivery_details_id = json['delivery_details_id'];
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Query$admin_get_laundries$laundry_store(
      details: l$details == null
          ? null
          : Query$admin_get_laundries$laundry_store$details.fromJson(
              (l$details as Map<String, dynamic>)),
      delivery_details_id: (l$delivery_details_id as int),
      id: (l$id as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$admin_get_laundries$laundry_store$details? details;

  final int delivery_details_id;

  final int id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$details = details;
    _resultData['details'] = l$details?.toJson();
    final l$delivery_details_id = delivery_details_id;
    _resultData['delivery_details_id'] = l$delivery_details_id;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$details = details;
    final l$delivery_details_id = delivery_details_id;
    final l$id = id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$details,
      l$delivery_details_id,
      l$id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$admin_get_laundries$laundry_store) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$details = details;
    final lOther$details = other.details;
    if (l$details != lOther$details) {
      return false;
    }
    final l$delivery_details_id = delivery_details_id;
    final lOther$delivery_details_id = other.delivery_details_id;
    if (l$delivery_details_id != lOther$delivery_details_id) {
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

extension UtilityExtension$Query$admin_get_laundries$laundry_store
    on Query$admin_get_laundries$laundry_store {
  CopyWith$Query$admin_get_laundries$laundry_store<
          Query$admin_get_laundries$laundry_store>
      get copyWith => CopyWith$Query$admin_get_laundries$laundry_store(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$admin_get_laundries$laundry_store<TRes> {
  factory CopyWith$Query$admin_get_laundries$laundry_store(
    Query$admin_get_laundries$laundry_store instance,
    TRes Function(Query$admin_get_laundries$laundry_store) then,
  ) = _CopyWithImpl$Query$admin_get_laundries$laundry_store;

  factory CopyWith$Query$admin_get_laundries$laundry_store.stub(TRes res) =
      _CopyWithStubImpl$Query$admin_get_laundries$laundry_store;

  TRes call({
    Query$admin_get_laundries$laundry_store$details? details,
    int? delivery_details_id,
    int? id,
    String? $__typename,
  });
  CopyWith$Query$admin_get_laundries$laundry_store$details<TRes> get details;
}

class _CopyWithImpl$Query$admin_get_laundries$laundry_store<TRes>
    implements CopyWith$Query$admin_get_laundries$laundry_store<TRes> {
  _CopyWithImpl$Query$admin_get_laundries$laundry_store(
    this._instance,
    this._then,
  );

  final Query$admin_get_laundries$laundry_store _instance;

  final TRes Function(Query$admin_get_laundries$laundry_store) _then;

  static const _undefined = {};

  TRes call({
    Object? details = _undefined,
    Object? delivery_details_id = _undefined,
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$admin_get_laundries$laundry_store(
        details: details == _undefined
            ? _instance.details
            : (details as Query$admin_get_laundries$laundry_store$details?),
        delivery_details_id:
            delivery_details_id == _undefined || delivery_details_id == null
                ? _instance.delivery_details_id
                : (delivery_details_id as int),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$admin_get_laundries$laundry_store$details<TRes> get details {
    final local$details = _instance.details;
    return local$details == null
        ? CopyWith$Query$admin_get_laundries$laundry_store$details.stub(
            _then(_instance))
        : CopyWith$Query$admin_get_laundries$laundry_store$details(
            local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Query$admin_get_laundries$laundry_store<TRes>
    implements CopyWith$Query$admin_get_laundries$laundry_store<TRes> {
  _CopyWithStubImpl$Query$admin_get_laundries$laundry_store(this._res);

  TRes _res;

  call({
    Query$admin_get_laundries$laundry_store$details? details,
    int? delivery_details_id,
    int? id,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$admin_get_laundries$laundry_store$details<TRes> get details =>
      CopyWith$Query$admin_get_laundries$laundry_store$details.stub(_res);
}

class Query$admin_get_laundries$laundry_store$details {
  Query$admin_get_laundries$laundry_store$details({
    required this.id,
    this.is_open,
    required this.approved,
    required this.image,
    required this.name,
    required this.language,
    required this.open_status,
    required this.creation_time,
    required this.service_provider_type,
    required this.location,
    required this.$__typename,
  });

  factory Query$admin_get_laundries$laundry_store$details.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$is_open = json['is_open'];
    final l$approved = json['approved'];
    final l$image = json['image'];
    final l$name = json['name'];
    final l$language = json['language'];
    final l$open_status = json['open_status'];
    final l$creation_time = json['creation_time'];
    final l$service_provider_type = json['service_provider_type'];
    final l$location = json['location'];
    final l$$__typename = json['__typename'];
    return Query$admin_get_laundries$laundry_store$details(
      id: (l$id as int),
      is_open: (l$is_open as bool?),
      approved: (l$approved as bool),
      image: (l$image as String),
      name: (l$name as String),
      language: mapFromJson(l$language),
      open_status: (l$open_status as String),
      creation_time: (l$creation_time as String),
      service_provider_type: (l$service_provider_type as String),
      location:
          Query$admin_get_laundries$laundry_store$details$location.fromJson(
              (l$location as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final bool? is_open;

  final bool approved;

  final String image;

  final String name;

  final dynamic language;

  final String open_status;

  final String creation_time;

  final String service_provider_type;

  final Query$admin_get_laundries$laundry_store$details$location location;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$is_open = is_open;
    _resultData['is_open'] = l$is_open;
    final l$approved = approved;
    _resultData['approved'] = l$approved;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$language = language;
    _resultData['language'] = mapToJson(l$language);
    final l$open_status = open_status;
    _resultData['open_status'] = l$open_status;
    final l$creation_time = creation_time;
    _resultData['creation_time'] = l$creation_time;
    final l$service_provider_type = service_provider_type;
    _resultData['service_provider_type'] = l$service_provider_type;
    final l$location = location;
    _resultData['location'] = l$location.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$is_open = is_open;
    final l$approved = approved;
    final l$image = image;
    final l$name = name;
    final l$language = language;
    final l$open_status = open_status;
    final l$creation_time = creation_time;
    final l$service_provider_type = service_provider_type;
    final l$location = location;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$is_open,
      l$approved,
      l$image,
      l$name,
      l$language,
      l$open_status,
      l$creation_time,
      l$service_provider_type,
      l$location,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$admin_get_laundries$laundry_store$details) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$is_open = is_open;
    final lOther$is_open = other.is_open;
    if (l$is_open != lOther$is_open) {
      return false;
    }
    final l$approved = approved;
    final lOther$approved = other.approved;
    if (l$approved != lOther$approved) {
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
    final l$language = language;
    final lOther$language = other.language;
    if (l$language != lOther$language) {
      return false;
    }
    final l$open_status = open_status;
    final lOther$open_status = other.open_status;
    if (l$open_status != lOther$open_status) {
      return false;
    }
    final l$creation_time = creation_time;
    final lOther$creation_time = other.creation_time;
    if (l$creation_time != lOther$creation_time) {
      return false;
    }
    final l$service_provider_type = service_provider_type;
    final lOther$service_provider_type = other.service_provider_type;
    if (l$service_provider_type != lOther$service_provider_type) {
      return false;
    }
    final l$location = location;
    final lOther$location = other.location;
    if (l$location != lOther$location) {
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

extension UtilityExtension$Query$admin_get_laundries$laundry_store$details
    on Query$admin_get_laundries$laundry_store$details {
  CopyWith$Query$admin_get_laundries$laundry_store$details<
          Query$admin_get_laundries$laundry_store$details>
      get copyWith => CopyWith$Query$admin_get_laundries$laundry_store$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$admin_get_laundries$laundry_store$details<TRes> {
  factory CopyWith$Query$admin_get_laundries$laundry_store$details(
    Query$admin_get_laundries$laundry_store$details instance,
    TRes Function(Query$admin_get_laundries$laundry_store$details) then,
  ) = _CopyWithImpl$Query$admin_get_laundries$laundry_store$details;

  factory CopyWith$Query$admin_get_laundries$laundry_store$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$admin_get_laundries$laundry_store$details;

  TRes call({
    int? id,
    bool? is_open,
    bool? approved,
    String? image,
    String? name,
    dynamic? language,
    String? open_status,
    String? creation_time,
    String? service_provider_type,
    Query$admin_get_laundries$laundry_store$details$location? location,
    String? $__typename,
  });
  CopyWith$Query$admin_get_laundries$laundry_store$details$location<TRes>
      get location;
}

class _CopyWithImpl$Query$admin_get_laundries$laundry_store$details<TRes>
    implements CopyWith$Query$admin_get_laundries$laundry_store$details<TRes> {
  _CopyWithImpl$Query$admin_get_laundries$laundry_store$details(
    this._instance,
    this._then,
  );

  final Query$admin_get_laundries$laundry_store$details _instance;

  final TRes Function(Query$admin_get_laundries$laundry_store$details) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? is_open = _undefined,
    Object? approved = _undefined,
    Object? image = _undefined,
    Object? name = _undefined,
    Object? language = _undefined,
    Object? open_status = _undefined,
    Object? creation_time = _undefined,
    Object? service_provider_type = _undefined,
    Object? location = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$admin_get_laundries$laundry_store$details(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        is_open: is_open == _undefined ? _instance.is_open : (is_open as bool?),
        approved: approved == _undefined || approved == null
            ? _instance.approved
            : (approved as bool),
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        language: language == _undefined || language == null
            ? _instance.language
            : (language as dynamic),
        open_status: open_status == _undefined || open_status == null
            ? _instance.open_status
            : (open_status as String),
        creation_time: creation_time == _undefined || creation_time == null
            ? _instance.creation_time
            : (creation_time as String),
        service_provider_type:
            service_provider_type == _undefined || service_provider_type == null
                ? _instance.service_provider_type
                : (service_provider_type as String),
        location: location == _undefined || location == null
            ? _instance.location
            : (location
                as Query$admin_get_laundries$laundry_store$details$location),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$admin_get_laundries$laundry_store$details$location<TRes>
      get location {
    final local$location = _instance.location;
    return CopyWith$Query$admin_get_laundries$laundry_store$details$location(
        local$location, (e) => call(location: e));
  }
}

class _CopyWithStubImpl$Query$admin_get_laundries$laundry_store$details<TRes>
    implements CopyWith$Query$admin_get_laundries$laundry_store$details<TRes> {
  _CopyWithStubImpl$Query$admin_get_laundries$laundry_store$details(this._res);

  TRes _res;

  call({
    int? id,
    bool? is_open,
    bool? approved,
    String? image,
    String? name,
    dynamic? language,
    String? open_status,
    String? creation_time,
    String? service_provider_type,
    Query$admin_get_laundries$laundry_store$details$location? location,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$admin_get_laundries$laundry_store$details$location<TRes>
      get location =>
          CopyWith$Query$admin_get_laundries$laundry_store$details$location
              .stub(_res);
}

class Query$admin_get_laundries$laundry_store$details$location {
  Query$admin_get_laundries$laundry_store$details$location({
    required this.gps,
    required this.address,
    required this.$__typename,
  });

  factory Query$admin_get_laundries$laundry_store$details$location.fromJson(
      Map<String, dynamic> json) {
    final l$gps = json['gps'];
    final l$address = json['address'];
    final l$$__typename = json['__typename'];
    return Query$admin_get_laundries$laundry_store$details$location(
      gps: geographyFromJson(l$gps),
      address: (l$address as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Geography gps;

  final String address;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$gps = gps;
    _resultData['gps'] = geographyToJson(l$gps);
    final l$address = address;
    _resultData['address'] = l$address;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$gps = gps;
    final l$address = address;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$gps,
      l$address,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$admin_get_laundries$laundry_store$details$location) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$gps = gps;
    final lOther$gps = other.gps;
    if (l$gps != lOther$gps) {
      return false;
    }
    final l$address = address;
    final lOther$address = other.address;
    if (l$address != lOther$address) {
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

extension UtilityExtension$Query$admin_get_laundries$laundry_store$details$location
    on Query$admin_get_laundries$laundry_store$details$location {
  CopyWith$Query$admin_get_laundries$laundry_store$details$location<
          Query$admin_get_laundries$laundry_store$details$location>
      get copyWith =>
          CopyWith$Query$admin_get_laundries$laundry_store$details$location(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$admin_get_laundries$laundry_store$details$location<
    TRes> {
  factory CopyWith$Query$admin_get_laundries$laundry_store$details$location(
    Query$admin_get_laundries$laundry_store$details$location instance,
    TRes Function(Query$admin_get_laundries$laundry_store$details$location)
        then,
  ) = _CopyWithImpl$Query$admin_get_laundries$laundry_store$details$location;

  factory CopyWith$Query$admin_get_laundries$laundry_store$details$location.stub(
          TRes res) =
      _CopyWithStubImpl$Query$admin_get_laundries$laundry_store$details$location;

  TRes call({
    Geography? gps,
    String? address,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$admin_get_laundries$laundry_store$details$location<
        TRes>
    implements
        CopyWith$Query$admin_get_laundries$laundry_store$details$location<
            TRes> {
  _CopyWithImpl$Query$admin_get_laundries$laundry_store$details$location(
    this._instance,
    this._then,
  );

  final Query$admin_get_laundries$laundry_store$details$location _instance;

  final TRes Function(Query$admin_get_laundries$laundry_store$details$location)
      _then;

  static const _undefined = {};

  TRes call({
    Object? gps = _undefined,
    Object? address = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$admin_get_laundries$laundry_store$details$location(
        gps: gps == _undefined || gps == null
            ? _instance.gps
            : (gps as Geography),
        address: address == _undefined || address == null
            ? _instance.address
            : (address as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$admin_get_laundries$laundry_store$details$location<
        TRes>
    implements
        CopyWith$Query$admin_get_laundries$laundry_store$details$location<
            TRes> {
  _CopyWithStubImpl$Query$admin_get_laundries$laundry_store$details$location(
      this._res);

  TRes _res;

  call({
    Geography? gps,
    String? address,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$admin_get_businesses {
  factory Variables$Query$admin_get_businesses({
    required int limit,
    required int offset,
  }) =>
      Variables$Query$admin_get_businesses._({
        r'limit': limit,
        r'offset': offset,
      });

  Variables$Query$admin_get_businesses._(this._$data);

  factory Variables$Query$admin_get_businesses.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$limit = data['limit'];
    result$data['limit'] = (l$limit as int);
    final l$offset = data['offset'];
    result$data['offset'] = (l$offset as int);
    return Variables$Query$admin_get_businesses._(result$data);
  }

  Map<String, dynamic> _$data;

  int get limit => (_$data['limit'] as int);
  int get offset => (_$data['offset'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$limit = limit;
    result$data['limit'] = l$limit;
    final l$offset = offset;
    result$data['offset'] = l$offset;
    return result$data;
  }

  CopyWith$Variables$Query$admin_get_businesses<
          Variables$Query$admin_get_businesses>
      get copyWith => CopyWith$Variables$Query$admin_get_businesses(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$admin_get_businesses) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$limit = limit;
    final lOther$limit = other.limit;
    if (l$limit != lOther$limit) {
      return false;
    }
    final l$offset = offset;
    final lOther$offset = other.offset;
    if (l$offset != lOther$offset) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$limit = limit;
    final l$offset = offset;
    return Object.hashAll([
      l$limit,
      l$offset,
    ]);
  }
}

abstract class CopyWith$Variables$Query$admin_get_businesses<TRes> {
  factory CopyWith$Variables$Query$admin_get_businesses(
    Variables$Query$admin_get_businesses instance,
    TRes Function(Variables$Query$admin_get_businesses) then,
  ) = _CopyWithImpl$Variables$Query$admin_get_businesses;

  factory CopyWith$Variables$Query$admin_get_businesses.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$admin_get_businesses;

  TRes call({
    int? limit,
    int? offset,
  });
}

class _CopyWithImpl$Variables$Query$admin_get_businesses<TRes>
    implements CopyWith$Variables$Query$admin_get_businesses<TRes> {
  _CopyWithImpl$Variables$Query$admin_get_businesses(
    this._instance,
    this._then,
  );

  final Variables$Query$admin_get_businesses _instance;

  final TRes Function(Variables$Query$admin_get_businesses) _then;

  static const _undefined = {};

  TRes call({
    Object? limit = _undefined,
    Object? offset = _undefined,
  }) =>
      _then(Variables$Query$admin_get_businesses._({
        ..._instance._$data,
        if (limit != _undefined && limit != null) 'limit': (limit as int),
        if (offset != _undefined && offset != null) 'offset': (offset as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$admin_get_businesses<TRes>
    implements CopyWith$Variables$Query$admin_get_businesses<TRes> {
  _CopyWithStubImpl$Variables$Query$admin_get_businesses(this._res);

  TRes _res;

  call({
    int? limit,
    int? offset,
  }) =>
      _res;
}

class Query$admin_get_businesses {
  Query$admin_get_businesses({
    required this.business_business,
    required this.$__typename,
  });

  factory Query$admin_get_businesses.fromJson(Map<String, dynamic> json) {
    final l$business_business = json['business_business'];
    final l$$__typename = json['__typename'];
    return Query$admin_get_businesses(
      business_business: (l$business_business as List<dynamic>)
          .map((e) => Query$admin_get_businesses$business_business.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$admin_get_businesses$business_business> business_business;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$business_business = business_business;
    _resultData['business_business'] =
        l$business_business.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$business_business = business_business;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$business_business.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$admin_get_businesses) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$business_business = business_business;
    final lOther$business_business = other.business_business;
    if (l$business_business.length != lOther$business_business.length) {
      return false;
    }
    for (int i = 0; i < l$business_business.length; i++) {
      final l$business_business$entry = l$business_business[i];
      final lOther$business_business$entry = lOther$business_business[i];
      if (l$business_business$entry != lOther$business_business$entry) {
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

extension UtilityExtension$Query$admin_get_businesses
    on Query$admin_get_businesses {
  CopyWith$Query$admin_get_businesses<Query$admin_get_businesses>
      get copyWith => CopyWith$Query$admin_get_businesses(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$admin_get_businesses<TRes> {
  factory CopyWith$Query$admin_get_businesses(
    Query$admin_get_businesses instance,
    TRes Function(Query$admin_get_businesses) then,
  ) = _CopyWithImpl$Query$admin_get_businesses;

  factory CopyWith$Query$admin_get_businesses.stub(TRes res) =
      _CopyWithStubImpl$Query$admin_get_businesses;

  TRes call({
    List<Query$admin_get_businesses$business_business>? business_business,
    String? $__typename,
  });
  TRes business_business(
      Iterable<Query$admin_get_businesses$business_business> Function(
              Iterable<
                  CopyWith$Query$admin_get_businesses$business_business<
                      Query$admin_get_businesses$business_business>>)
          _fn);
}

class _CopyWithImpl$Query$admin_get_businesses<TRes>
    implements CopyWith$Query$admin_get_businesses<TRes> {
  _CopyWithImpl$Query$admin_get_businesses(
    this._instance,
    this._then,
  );

  final Query$admin_get_businesses _instance;

  final TRes Function(Query$admin_get_businesses) _then;

  static const _undefined = {};

  TRes call({
    Object? business_business = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$admin_get_businesses(
        business_business:
            business_business == _undefined || business_business == null
                ? _instance.business_business
                : (business_business
                    as List<Query$admin_get_businesses$business_business>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes business_business(
          Iterable<Query$admin_get_businesses$business_business> Function(
                  Iterable<
                      CopyWith$Query$admin_get_businesses$business_business<
                          Query$admin_get_businesses$business_business>>)
              _fn) =>
      call(
          business_business: _fn(_instance.business_business
              .map((e) => CopyWith$Query$admin_get_businesses$business_business(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$admin_get_businesses<TRes>
    implements CopyWith$Query$admin_get_businesses<TRes> {
  _CopyWithStubImpl$Query$admin_get_businesses(this._res);

  TRes _res;

  call({
    List<Query$admin_get_businesses$business_business>? business_business,
    String? $__typename,
  }) =>
      _res;
  business_business(_fn) => _res;
}

const documentNodeQueryadmin_get_businesses = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'admin_get_businesses'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'limit')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'offset')),
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
        name: NameNode(value: 'business_business'),
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
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'details'),
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
                name: NameNode(value: 'approved'),
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
                name: NameNode(value: 'is_open'),
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
                name: NameNode(value: 'language'),
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
                name: NameNode(value: 'creation_time'),
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
                name: NameNode(value: 'location'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'gps'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'address'),
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
            name: NameNode(value: 'profile'),
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
Query$admin_get_businesses _parserFn$Query$admin_get_businesses(
        Map<String, dynamic> data) =>
    Query$admin_get_businesses.fromJson(data);

class Options$Query$admin_get_businesses
    extends graphql.QueryOptions<Query$admin_get_businesses> {
  Options$Query$admin_get_businesses({
    String? operationName,
    required Variables$Query$admin_get_businesses variables,
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
          document: documentNodeQueryadmin_get_businesses,
          parserFn: _parserFn$Query$admin_get_businesses,
        );
}

class WatchOptions$Query$admin_get_businesses
    extends graphql.WatchQueryOptions<Query$admin_get_businesses> {
  WatchOptions$Query$admin_get_businesses({
    String? operationName,
    required Variables$Query$admin_get_businesses variables,
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
          document: documentNodeQueryadmin_get_businesses,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$admin_get_businesses,
        );
}

class FetchMoreOptions$Query$admin_get_businesses
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$admin_get_businesses({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$admin_get_businesses variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryadmin_get_businesses,
        );
}

extension ClientExtension$Query$admin_get_businesses on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$admin_get_businesses>>
      query$admin_get_businesses(
              Options$Query$admin_get_businesses options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$admin_get_businesses>
      watchQuery$admin_get_businesses(
              WatchOptions$Query$admin_get_businesses options) =>
          this.watchQuery(options);
  void writeQuery$admin_get_businesses({
    required Query$admin_get_businesses data,
    required Variables$Query$admin_get_businesses variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryadmin_get_businesses),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$admin_get_businesses? readQuery$admin_get_businesses({
    required Variables$Query$admin_get_businesses variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQueryadmin_get_businesses),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$admin_get_businesses.fromJson(result);
  }
}

class Query$admin_get_businesses$business_business {
  Query$admin_get_businesses$business_business({
    required this.details,
    required this.profile,
    required this.id,
    required this.$__typename,
  });

  factory Query$admin_get_businesses$business_business.fromJson(
      Map<String, dynamic> json) {
    final l$details = json['details'];
    final l$profile = json['profile'];
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Query$admin_get_businesses$business_business(
      details: Query$admin_get_businesses$business_business$details.fromJson(
          (l$details as Map<String, dynamic>)),
      profile: (l$profile as String),
      id: (l$id as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$admin_get_businesses$business_business$details details;

  final String profile;

  final int id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$details = details;
    _resultData['details'] = l$details.toJson();
    final l$profile = profile;
    _resultData['profile'] = l$profile;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$details = details;
    final l$profile = profile;
    final l$id = id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$details,
      l$profile,
      l$id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$admin_get_businesses$business_business) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$details = details;
    final lOther$details = other.details;
    if (l$details != lOther$details) {
      return false;
    }
    final l$profile = profile;
    final lOther$profile = other.profile;
    if (l$profile != lOther$profile) {
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

extension UtilityExtension$Query$admin_get_businesses$business_business
    on Query$admin_get_businesses$business_business {
  CopyWith$Query$admin_get_businesses$business_business<
          Query$admin_get_businesses$business_business>
      get copyWith => CopyWith$Query$admin_get_businesses$business_business(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$admin_get_businesses$business_business<TRes> {
  factory CopyWith$Query$admin_get_businesses$business_business(
    Query$admin_get_businesses$business_business instance,
    TRes Function(Query$admin_get_businesses$business_business) then,
  ) = _CopyWithImpl$Query$admin_get_businesses$business_business;

  factory CopyWith$Query$admin_get_businesses$business_business.stub(TRes res) =
      _CopyWithStubImpl$Query$admin_get_businesses$business_business;

  TRes call({
    Query$admin_get_businesses$business_business$details? details,
    String? profile,
    int? id,
    String? $__typename,
  });
  CopyWith$Query$admin_get_businesses$business_business$details<TRes>
      get details;
}

class _CopyWithImpl$Query$admin_get_businesses$business_business<TRes>
    implements CopyWith$Query$admin_get_businesses$business_business<TRes> {
  _CopyWithImpl$Query$admin_get_businesses$business_business(
    this._instance,
    this._then,
  );

  final Query$admin_get_businesses$business_business _instance;

  final TRes Function(Query$admin_get_businesses$business_business) _then;

  static const _undefined = {};

  TRes call({
    Object? details = _undefined,
    Object? profile = _undefined,
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$admin_get_businesses$business_business(
        details: details == _undefined || details == null
            ? _instance.details
            : (details as Query$admin_get_businesses$business_business$details),
        profile: profile == _undefined || profile == null
            ? _instance.profile
            : (profile as String),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$admin_get_businesses$business_business$details<TRes>
      get details {
    final local$details = _instance.details;
    return CopyWith$Query$admin_get_businesses$business_business$details(
        local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Query$admin_get_businesses$business_business<TRes>
    implements CopyWith$Query$admin_get_businesses$business_business<TRes> {
  _CopyWithStubImpl$Query$admin_get_businesses$business_business(this._res);

  TRes _res;

  call({
    Query$admin_get_businesses$business_business$details? details,
    String? profile,
    int? id,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$admin_get_businesses$business_business$details<TRes>
      get details =>
          CopyWith$Query$admin_get_businesses$business_business$details.stub(
              _res);
}

class Query$admin_get_businesses$business_business$details {
  Query$admin_get_businesses$business_business$details({
    required this.id,
    required this.approved,
    required this.image,
    this.is_open,
    required this.name,
    required this.language,
    required this.open_status,
    required this.creation_time,
    required this.service_provider_type,
    required this.location,
    required this.$__typename,
  });

  factory Query$admin_get_businesses$business_business$details.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$approved = json['approved'];
    final l$image = json['image'];
    final l$is_open = json['is_open'];
    final l$name = json['name'];
    final l$language = json['language'];
    final l$open_status = json['open_status'];
    final l$creation_time = json['creation_time'];
    final l$service_provider_type = json['service_provider_type'];
    final l$location = json['location'];
    final l$$__typename = json['__typename'];
    return Query$admin_get_businesses$business_business$details(
      id: (l$id as int),
      approved: (l$approved as bool),
      image: (l$image as String),
      is_open: (l$is_open as bool?),
      name: (l$name as String),
      language: mapFromJson(l$language),
      open_status: (l$open_status as String),
      creation_time: (l$creation_time as String),
      service_provider_type: (l$service_provider_type as String),
      location: Query$admin_get_businesses$business_business$details$location
          .fromJson((l$location as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final bool approved;

  final String image;

  final bool? is_open;

  final String name;

  final dynamic language;

  final String open_status;

  final String creation_time;

  final String service_provider_type;

  final Query$admin_get_businesses$business_business$details$location location;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$approved = approved;
    _resultData['approved'] = l$approved;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$is_open = is_open;
    _resultData['is_open'] = l$is_open;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$language = language;
    _resultData['language'] = mapToJson(l$language);
    final l$open_status = open_status;
    _resultData['open_status'] = l$open_status;
    final l$creation_time = creation_time;
    _resultData['creation_time'] = l$creation_time;
    final l$service_provider_type = service_provider_type;
    _resultData['service_provider_type'] = l$service_provider_type;
    final l$location = location;
    _resultData['location'] = l$location.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$approved = approved;
    final l$image = image;
    final l$is_open = is_open;
    final l$name = name;
    final l$language = language;
    final l$open_status = open_status;
    final l$creation_time = creation_time;
    final l$service_provider_type = service_provider_type;
    final l$location = location;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$approved,
      l$image,
      l$is_open,
      l$name,
      l$language,
      l$open_status,
      l$creation_time,
      l$service_provider_type,
      l$location,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$admin_get_businesses$business_business$details) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$approved = approved;
    final lOther$approved = other.approved;
    if (l$approved != lOther$approved) {
      return false;
    }
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) {
      return false;
    }
    final l$is_open = is_open;
    final lOther$is_open = other.is_open;
    if (l$is_open != lOther$is_open) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$language = language;
    final lOther$language = other.language;
    if (l$language != lOther$language) {
      return false;
    }
    final l$open_status = open_status;
    final lOther$open_status = other.open_status;
    if (l$open_status != lOther$open_status) {
      return false;
    }
    final l$creation_time = creation_time;
    final lOther$creation_time = other.creation_time;
    if (l$creation_time != lOther$creation_time) {
      return false;
    }
    final l$service_provider_type = service_provider_type;
    final lOther$service_provider_type = other.service_provider_type;
    if (l$service_provider_type != lOther$service_provider_type) {
      return false;
    }
    final l$location = location;
    final lOther$location = other.location;
    if (l$location != lOther$location) {
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

extension UtilityExtension$Query$admin_get_businesses$business_business$details
    on Query$admin_get_businesses$business_business$details {
  CopyWith$Query$admin_get_businesses$business_business$details<
          Query$admin_get_businesses$business_business$details>
      get copyWith =>
          CopyWith$Query$admin_get_businesses$business_business$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$admin_get_businesses$business_business$details<
    TRes> {
  factory CopyWith$Query$admin_get_businesses$business_business$details(
    Query$admin_get_businesses$business_business$details instance,
    TRes Function(Query$admin_get_businesses$business_business$details) then,
  ) = _CopyWithImpl$Query$admin_get_businesses$business_business$details;

  factory CopyWith$Query$admin_get_businesses$business_business$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$admin_get_businesses$business_business$details;

  TRes call({
    int? id,
    bool? approved,
    String? image,
    bool? is_open,
    String? name,
    dynamic? language,
    String? open_status,
    String? creation_time,
    String? service_provider_type,
    Query$admin_get_businesses$business_business$details$location? location,
    String? $__typename,
  });
  CopyWith$Query$admin_get_businesses$business_business$details$location<TRes>
      get location;
}

class _CopyWithImpl$Query$admin_get_businesses$business_business$details<TRes>
    implements
        CopyWith$Query$admin_get_businesses$business_business$details<TRes> {
  _CopyWithImpl$Query$admin_get_businesses$business_business$details(
    this._instance,
    this._then,
  );

  final Query$admin_get_businesses$business_business$details _instance;

  final TRes Function(Query$admin_get_businesses$business_business$details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? approved = _undefined,
    Object? image = _undefined,
    Object? is_open = _undefined,
    Object? name = _undefined,
    Object? language = _undefined,
    Object? open_status = _undefined,
    Object? creation_time = _undefined,
    Object? service_provider_type = _undefined,
    Object? location = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$admin_get_businesses$business_business$details(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        approved: approved == _undefined || approved == null
            ? _instance.approved
            : (approved as bool),
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        is_open: is_open == _undefined ? _instance.is_open : (is_open as bool?),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        language: language == _undefined || language == null
            ? _instance.language
            : (language as dynamic),
        open_status: open_status == _undefined || open_status == null
            ? _instance.open_status
            : (open_status as String),
        creation_time: creation_time == _undefined || creation_time == null
            ? _instance.creation_time
            : (creation_time as String),
        service_provider_type:
            service_provider_type == _undefined || service_provider_type == null
                ? _instance.service_provider_type
                : (service_provider_type as String),
        location: location == _undefined || location == null
            ? _instance.location
            : (location
                as Query$admin_get_businesses$business_business$details$location),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$admin_get_businesses$business_business$details$location<TRes>
      get location {
    final local$location = _instance.location;
    return CopyWith$Query$admin_get_businesses$business_business$details$location(
        local$location, (e) => call(location: e));
  }
}

class _CopyWithStubImpl$Query$admin_get_businesses$business_business$details<
        TRes>
    implements
        CopyWith$Query$admin_get_businesses$business_business$details<TRes> {
  _CopyWithStubImpl$Query$admin_get_businesses$business_business$details(
      this._res);

  TRes _res;

  call({
    int? id,
    bool? approved,
    String? image,
    bool? is_open,
    String? name,
    dynamic? language,
    String? open_status,
    String? creation_time,
    String? service_provider_type,
    Query$admin_get_businesses$business_business$details$location? location,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$admin_get_businesses$business_business$details$location<TRes>
      get location =>
          CopyWith$Query$admin_get_businesses$business_business$details$location
              .stub(_res);
}

class Query$admin_get_businesses$business_business$details$location {
  Query$admin_get_businesses$business_business$details$location({
    required this.gps,
    required this.address,
    required this.$__typename,
  });

  factory Query$admin_get_businesses$business_business$details$location.fromJson(
      Map<String, dynamic> json) {
    final l$gps = json['gps'];
    final l$address = json['address'];
    final l$$__typename = json['__typename'];
    return Query$admin_get_businesses$business_business$details$location(
      gps: geographyFromJson(l$gps),
      address: (l$address as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Geography gps;

  final String address;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$gps = gps;
    _resultData['gps'] = geographyToJson(l$gps);
    final l$address = address;
    _resultData['address'] = l$address;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$gps = gps;
    final l$address = address;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$gps,
      l$address,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$admin_get_businesses$business_business$details$location) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$gps = gps;
    final lOther$gps = other.gps;
    if (l$gps != lOther$gps) {
      return false;
    }
    final l$address = address;
    final lOther$address = other.address;
    if (l$address != lOther$address) {
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

extension UtilityExtension$Query$admin_get_businesses$business_business$details$location
    on Query$admin_get_businesses$business_business$details$location {
  CopyWith$Query$admin_get_businesses$business_business$details$location<
          Query$admin_get_businesses$business_business$details$location>
      get copyWith =>
          CopyWith$Query$admin_get_businesses$business_business$details$location(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$admin_get_businesses$business_business$details$location<
    TRes> {
  factory CopyWith$Query$admin_get_businesses$business_business$details$location(
    Query$admin_get_businesses$business_business$details$location instance,
    TRes Function(Query$admin_get_businesses$business_business$details$location)
        then,
  ) = _CopyWithImpl$Query$admin_get_businesses$business_business$details$location;

  factory CopyWith$Query$admin_get_businesses$business_business$details$location.stub(
          TRes res) =
      _CopyWithStubImpl$Query$admin_get_businesses$business_business$details$location;

  TRes call({
    Geography? gps,
    String? address,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$admin_get_businesses$business_business$details$location<
        TRes>
    implements
        CopyWith$Query$admin_get_businesses$business_business$details$location<
            TRes> {
  _CopyWithImpl$Query$admin_get_businesses$business_business$details$location(
    this._instance,
    this._then,
  );

  final Query$admin_get_businesses$business_business$details$location _instance;

  final TRes Function(
      Query$admin_get_businesses$business_business$details$location) _then;

  static const _undefined = {};

  TRes call({
    Object? gps = _undefined,
    Object? address = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$admin_get_businesses$business_business$details$location(
        gps: gps == _undefined || gps == null
            ? _instance.gps
            : (gps as Geography),
        address: address == _undefined || address == null
            ? _instance.address
            : (address as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$admin_get_businesses$business_business$details$location<
        TRes>
    implements
        CopyWith$Query$admin_get_businesses$business_business$details$location<
            TRes> {
  _CopyWithStubImpl$Query$admin_get_businesses$business_business$details$location(
      this._res);

  TRes _res;

  call({
    Geography? gps,
    String? address,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$admin_get_restaurants {
  factory Variables$Query$admin_get_restaurants({
    required int limit,
    required int offset,
  }) =>
      Variables$Query$admin_get_restaurants._({
        r'limit': limit,
        r'offset': offset,
      });

  Variables$Query$admin_get_restaurants._(this._$data);

  factory Variables$Query$admin_get_restaurants.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$limit = data['limit'];
    result$data['limit'] = (l$limit as int);
    final l$offset = data['offset'];
    result$data['offset'] = (l$offset as int);
    return Variables$Query$admin_get_restaurants._(result$data);
  }

  Map<String, dynamic> _$data;

  int get limit => (_$data['limit'] as int);
  int get offset => (_$data['offset'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$limit = limit;
    result$data['limit'] = l$limit;
    final l$offset = offset;
    result$data['offset'] = l$offset;
    return result$data;
  }

  CopyWith$Variables$Query$admin_get_restaurants<
          Variables$Query$admin_get_restaurants>
      get copyWith => CopyWith$Variables$Query$admin_get_restaurants(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$admin_get_restaurants) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$limit = limit;
    final lOther$limit = other.limit;
    if (l$limit != lOther$limit) {
      return false;
    }
    final l$offset = offset;
    final lOther$offset = other.offset;
    if (l$offset != lOther$offset) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$limit = limit;
    final l$offset = offset;
    return Object.hashAll([
      l$limit,
      l$offset,
    ]);
  }
}

abstract class CopyWith$Variables$Query$admin_get_restaurants<TRes> {
  factory CopyWith$Variables$Query$admin_get_restaurants(
    Variables$Query$admin_get_restaurants instance,
    TRes Function(Variables$Query$admin_get_restaurants) then,
  ) = _CopyWithImpl$Variables$Query$admin_get_restaurants;

  factory CopyWith$Variables$Query$admin_get_restaurants.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$admin_get_restaurants;

  TRes call({
    int? limit,
    int? offset,
  });
}

class _CopyWithImpl$Variables$Query$admin_get_restaurants<TRes>
    implements CopyWith$Variables$Query$admin_get_restaurants<TRes> {
  _CopyWithImpl$Variables$Query$admin_get_restaurants(
    this._instance,
    this._then,
  );

  final Variables$Query$admin_get_restaurants _instance;

  final TRes Function(Variables$Query$admin_get_restaurants) _then;

  static const _undefined = {};

  TRes call({
    Object? limit = _undefined,
    Object? offset = _undefined,
  }) =>
      _then(Variables$Query$admin_get_restaurants._({
        ..._instance._$data,
        if (limit != _undefined && limit != null) 'limit': (limit as int),
        if (offset != _undefined && offset != null) 'offset': (offset as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$admin_get_restaurants<TRes>
    implements CopyWith$Variables$Query$admin_get_restaurants<TRes> {
  _CopyWithStubImpl$Variables$Query$admin_get_restaurants(this._res);

  TRes _res;

  call({
    int? limit,
    int? offset,
  }) =>
      _res;
}

class Query$admin_get_restaurants {
  Query$admin_get_restaurants({
    required this.restaurant_restaurant,
    required this.$__typename,
  });

  factory Query$admin_get_restaurants.fromJson(Map<String, dynamic> json) {
    final l$restaurant_restaurant = json['restaurant_restaurant'];
    final l$$__typename = json['__typename'];
    return Query$admin_get_restaurants(
      restaurant_restaurant: (l$restaurant_restaurant as List<dynamic>)
          .map((e) =>
              Query$admin_get_restaurants$restaurant_restaurant.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$admin_get_restaurants$restaurant_restaurant>
      restaurant_restaurant;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$restaurant_restaurant = restaurant_restaurant;
    _resultData['restaurant_restaurant'] =
        l$restaurant_restaurant.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$restaurant_restaurant = restaurant_restaurant;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$restaurant_restaurant.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$admin_get_restaurants) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$restaurant_restaurant = restaurant_restaurant;
    final lOther$restaurant_restaurant = other.restaurant_restaurant;
    if (l$restaurant_restaurant.length != lOther$restaurant_restaurant.length) {
      return false;
    }
    for (int i = 0; i < l$restaurant_restaurant.length; i++) {
      final l$restaurant_restaurant$entry = l$restaurant_restaurant[i];
      final lOther$restaurant_restaurant$entry =
          lOther$restaurant_restaurant[i];
      if (l$restaurant_restaurant$entry != lOther$restaurant_restaurant$entry) {
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

extension UtilityExtension$Query$admin_get_restaurants
    on Query$admin_get_restaurants {
  CopyWith$Query$admin_get_restaurants<Query$admin_get_restaurants>
      get copyWith => CopyWith$Query$admin_get_restaurants(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$admin_get_restaurants<TRes> {
  factory CopyWith$Query$admin_get_restaurants(
    Query$admin_get_restaurants instance,
    TRes Function(Query$admin_get_restaurants) then,
  ) = _CopyWithImpl$Query$admin_get_restaurants;

  factory CopyWith$Query$admin_get_restaurants.stub(TRes res) =
      _CopyWithStubImpl$Query$admin_get_restaurants;

  TRes call({
    List<Query$admin_get_restaurants$restaurant_restaurant>?
        restaurant_restaurant,
    String? $__typename,
  });
  TRes restaurant_restaurant(
      Iterable<Query$admin_get_restaurants$restaurant_restaurant> Function(
              Iterable<
                  CopyWith$Query$admin_get_restaurants$restaurant_restaurant<
                      Query$admin_get_restaurants$restaurant_restaurant>>)
          _fn);
}

class _CopyWithImpl$Query$admin_get_restaurants<TRes>
    implements CopyWith$Query$admin_get_restaurants<TRes> {
  _CopyWithImpl$Query$admin_get_restaurants(
    this._instance,
    this._then,
  );

  final Query$admin_get_restaurants _instance;

  final TRes Function(Query$admin_get_restaurants) _then;

  static const _undefined = {};

  TRes call({
    Object? restaurant_restaurant = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$admin_get_restaurants(
        restaurant_restaurant:
            restaurant_restaurant == _undefined || restaurant_restaurant == null
                ? _instance.restaurant_restaurant
                : (restaurant_restaurant
                    as List<Query$admin_get_restaurants$restaurant_restaurant>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes restaurant_restaurant(
          Iterable<Query$admin_get_restaurants$restaurant_restaurant> Function(
                  Iterable<
                      CopyWith$Query$admin_get_restaurants$restaurant_restaurant<
                          Query$admin_get_restaurants$restaurant_restaurant>>)
              _fn) =>
      call(
          restaurant_restaurant: _fn(_instance.restaurant_restaurant.map(
              (e) => CopyWith$Query$admin_get_restaurants$restaurant_restaurant(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$admin_get_restaurants<TRes>
    implements CopyWith$Query$admin_get_restaurants<TRes> {
  _CopyWithStubImpl$Query$admin_get_restaurants(this._res);

  TRes _res;

  call({
    List<Query$admin_get_restaurants$restaurant_restaurant>?
        restaurant_restaurant,
    String? $__typename,
  }) =>
      _res;
  restaurant_restaurant(_fn) => _res;
}

const documentNodeQueryadmin_get_restaurants = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'admin_get_restaurants'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'limit')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'offset')),
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
        name: NameNode(value: 'restaurant_restaurant'),
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
            name: NameNode(value: 'delivery_details_id'),
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
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'is_open'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'approved'),
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
                name: NameNode(value: 'language'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'location'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'gps'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'address'),
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
                name: NameNode(value: 'name'),
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
                name: NameNode(value: 'service_provider_type'),
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
Query$admin_get_restaurants _parserFn$Query$admin_get_restaurants(
        Map<String, dynamic> data) =>
    Query$admin_get_restaurants.fromJson(data);

class Options$Query$admin_get_restaurants
    extends graphql.QueryOptions<Query$admin_get_restaurants> {
  Options$Query$admin_get_restaurants({
    String? operationName,
    required Variables$Query$admin_get_restaurants variables,
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
          document: documentNodeQueryadmin_get_restaurants,
          parserFn: _parserFn$Query$admin_get_restaurants,
        );
}

class WatchOptions$Query$admin_get_restaurants
    extends graphql.WatchQueryOptions<Query$admin_get_restaurants> {
  WatchOptions$Query$admin_get_restaurants({
    String? operationName,
    required Variables$Query$admin_get_restaurants variables,
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
          document: documentNodeQueryadmin_get_restaurants,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$admin_get_restaurants,
        );
}

class FetchMoreOptions$Query$admin_get_restaurants
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$admin_get_restaurants({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$admin_get_restaurants variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryadmin_get_restaurants,
        );
}

extension ClientExtension$Query$admin_get_restaurants on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$admin_get_restaurants>>
      query$admin_get_restaurants(
              Options$Query$admin_get_restaurants options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$admin_get_restaurants>
      watchQuery$admin_get_restaurants(
              WatchOptions$Query$admin_get_restaurants options) =>
          this.watchQuery(options);
  void writeQuery$admin_get_restaurants({
    required Query$admin_get_restaurants data,
    required Variables$Query$admin_get_restaurants variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryadmin_get_restaurants),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$admin_get_restaurants? readQuery$admin_get_restaurants({
    required Variables$Query$admin_get_restaurants variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQueryadmin_get_restaurants),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$admin_get_restaurants.fromJson(result);
  }
}

class Query$admin_get_restaurants$restaurant_restaurant {
  Query$admin_get_restaurants$restaurant_restaurant({
    required this.id,
    required this.delivery_details_id,
    this.details,
    required this.$__typename,
  });

  factory Query$admin_get_restaurants$restaurant_restaurant.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$delivery_details_id = json['delivery_details_id'];
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Query$admin_get_restaurants$restaurant_restaurant(
      id: (l$id as int),
      delivery_details_id: (l$delivery_details_id as int),
      details: l$details == null
          ? null
          : Query$admin_get_restaurants$restaurant_restaurant$details.fromJson(
              (l$details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final int delivery_details_id;

  final Query$admin_get_restaurants$restaurant_restaurant$details? details;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$delivery_details_id = delivery_details_id;
    _resultData['delivery_details_id'] = l$delivery_details_id;
    final l$details = details;
    _resultData['details'] = l$details?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$delivery_details_id = delivery_details_id;
    final l$details = details;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$delivery_details_id,
      l$details,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$admin_get_restaurants$restaurant_restaurant) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$delivery_details_id = delivery_details_id;
    final lOther$delivery_details_id = other.delivery_details_id;
    if (l$delivery_details_id != lOther$delivery_details_id) {
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

extension UtilityExtension$Query$admin_get_restaurants$restaurant_restaurant
    on Query$admin_get_restaurants$restaurant_restaurant {
  CopyWith$Query$admin_get_restaurants$restaurant_restaurant<
          Query$admin_get_restaurants$restaurant_restaurant>
      get copyWith =>
          CopyWith$Query$admin_get_restaurants$restaurant_restaurant(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$admin_get_restaurants$restaurant_restaurant<
    TRes> {
  factory CopyWith$Query$admin_get_restaurants$restaurant_restaurant(
    Query$admin_get_restaurants$restaurant_restaurant instance,
    TRes Function(Query$admin_get_restaurants$restaurant_restaurant) then,
  ) = _CopyWithImpl$Query$admin_get_restaurants$restaurant_restaurant;

  factory CopyWith$Query$admin_get_restaurants$restaurant_restaurant.stub(
          TRes res) =
      _CopyWithStubImpl$Query$admin_get_restaurants$restaurant_restaurant;

  TRes call({
    int? id,
    int? delivery_details_id,
    Query$admin_get_restaurants$restaurant_restaurant$details? details,
    String? $__typename,
  });
  CopyWith$Query$admin_get_restaurants$restaurant_restaurant$details<TRes>
      get details;
}

class _CopyWithImpl$Query$admin_get_restaurants$restaurant_restaurant<TRes>
    implements
        CopyWith$Query$admin_get_restaurants$restaurant_restaurant<TRes> {
  _CopyWithImpl$Query$admin_get_restaurants$restaurant_restaurant(
    this._instance,
    this._then,
  );

  final Query$admin_get_restaurants$restaurant_restaurant _instance;

  final TRes Function(Query$admin_get_restaurants$restaurant_restaurant) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? delivery_details_id = _undefined,
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$admin_get_restaurants$restaurant_restaurant(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        delivery_details_id:
            delivery_details_id == _undefined || delivery_details_id == null
                ? _instance.delivery_details_id
                : (delivery_details_id as int),
        details: details == _undefined
            ? _instance.details
            : (details
                as Query$admin_get_restaurants$restaurant_restaurant$details?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$admin_get_restaurants$restaurant_restaurant$details<TRes>
      get details {
    final local$details = _instance.details;
    return local$details == null
        ? CopyWith$Query$admin_get_restaurants$restaurant_restaurant$details
            .stub(_then(_instance))
        : CopyWith$Query$admin_get_restaurants$restaurant_restaurant$details(
            local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Query$admin_get_restaurants$restaurant_restaurant<TRes>
    implements
        CopyWith$Query$admin_get_restaurants$restaurant_restaurant<TRes> {
  _CopyWithStubImpl$Query$admin_get_restaurants$restaurant_restaurant(
      this._res);

  TRes _res;

  call({
    int? id,
    int? delivery_details_id,
    Query$admin_get_restaurants$restaurant_restaurant$details? details,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$admin_get_restaurants$restaurant_restaurant$details<TRes>
      get details =>
          CopyWith$Query$admin_get_restaurants$restaurant_restaurant$details
              .stub(_res);
}

class Query$admin_get_restaurants$restaurant_restaurant$details {
  Query$admin_get_restaurants$restaurant_restaurant$details({
    required this.id,
    this.is_open,
    required this.approved,
    this.firebase_id,
    required this.image,
    required this.language,
    required this.location,
    required this.name,
    required this.open_status,
    required this.service_provider_type,
    required this.$__typename,
  });

  factory Query$admin_get_restaurants$restaurant_restaurant$details.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$is_open = json['is_open'];
    final l$approved = json['approved'];
    final l$firebase_id = json['firebase_id'];
    final l$image = json['image'];
    final l$language = json['language'];
    final l$location = json['location'];
    final l$name = json['name'];
    final l$open_status = json['open_status'];
    final l$service_provider_type = json['service_provider_type'];
    final l$$__typename = json['__typename'];
    return Query$admin_get_restaurants$restaurant_restaurant$details(
      id: (l$id as int),
      is_open: (l$is_open as bool?),
      approved: (l$approved as bool),
      firebase_id: (l$firebase_id as String?),
      image: (l$image as String),
      language: mapFromJson(l$language),
      location:
          Query$admin_get_restaurants$restaurant_restaurant$details$location
              .fromJson((l$location as Map<String, dynamic>)),
      name: (l$name as String),
      open_status: (l$open_status as String),
      service_provider_type: (l$service_provider_type as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final bool? is_open;

  final bool approved;

  final String? firebase_id;

  final String image;

  final dynamic language;

  final Query$admin_get_restaurants$restaurant_restaurant$details$location
      location;

  final String name;

  final String open_status;

  final String service_provider_type;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$is_open = is_open;
    _resultData['is_open'] = l$is_open;
    final l$approved = approved;
    _resultData['approved'] = l$approved;
    final l$firebase_id = firebase_id;
    _resultData['firebase_id'] = l$firebase_id;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$language = language;
    _resultData['language'] = mapToJson(l$language);
    final l$location = location;
    _resultData['location'] = l$location.toJson();
    final l$name = name;
    _resultData['name'] = l$name;
    final l$open_status = open_status;
    _resultData['open_status'] = l$open_status;
    final l$service_provider_type = service_provider_type;
    _resultData['service_provider_type'] = l$service_provider_type;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$is_open = is_open;
    final l$approved = approved;
    final l$firebase_id = firebase_id;
    final l$image = image;
    final l$language = language;
    final l$location = location;
    final l$name = name;
    final l$open_status = open_status;
    final l$service_provider_type = service_provider_type;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$is_open,
      l$approved,
      l$firebase_id,
      l$image,
      l$language,
      l$location,
      l$name,
      l$open_status,
      l$service_provider_type,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$admin_get_restaurants$restaurant_restaurant$details) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$is_open = is_open;
    final lOther$is_open = other.is_open;
    if (l$is_open != lOther$is_open) {
      return false;
    }
    final l$approved = approved;
    final lOther$approved = other.approved;
    if (l$approved != lOther$approved) {
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
    final l$language = language;
    final lOther$language = other.language;
    if (l$language != lOther$language) {
      return false;
    }
    final l$location = location;
    final lOther$location = other.location;
    if (l$location != lOther$location) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$open_status = open_status;
    final lOther$open_status = other.open_status;
    if (l$open_status != lOther$open_status) {
      return false;
    }
    final l$service_provider_type = service_provider_type;
    final lOther$service_provider_type = other.service_provider_type;
    if (l$service_provider_type != lOther$service_provider_type) {
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

extension UtilityExtension$Query$admin_get_restaurants$restaurant_restaurant$details
    on Query$admin_get_restaurants$restaurant_restaurant$details {
  CopyWith$Query$admin_get_restaurants$restaurant_restaurant$details<
          Query$admin_get_restaurants$restaurant_restaurant$details>
      get copyWith =>
          CopyWith$Query$admin_get_restaurants$restaurant_restaurant$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$admin_get_restaurants$restaurant_restaurant$details<
    TRes> {
  factory CopyWith$Query$admin_get_restaurants$restaurant_restaurant$details(
    Query$admin_get_restaurants$restaurant_restaurant$details instance,
    TRes Function(Query$admin_get_restaurants$restaurant_restaurant$details)
        then,
  ) = _CopyWithImpl$Query$admin_get_restaurants$restaurant_restaurant$details;

  factory CopyWith$Query$admin_get_restaurants$restaurant_restaurant$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$admin_get_restaurants$restaurant_restaurant$details;

  TRes call({
    int? id,
    bool? is_open,
    bool? approved,
    String? firebase_id,
    String? image,
    dynamic? language,
    Query$admin_get_restaurants$restaurant_restaurant$details$location?
        location,
    String? name,
    String? open_status,
    String? service_provider_type,
    String? $__typename,
  });
  CopyWith$Query$admin_get_restaurants$restaurant_restaurant$details$location<
      TRes> get location;
}

class _CopyWithImpl$Query$admin_get_restaurants$restaurant_restaurant$details<
        TRes>
    implements
        CopyWith$Query$admin_get_restaurants$restaurant_restaurant$details<
            TRes> {
  _CopyWithImpl$Query$admin_get_restaurants$restaurant_restaurant$details(
    this._instance,
    this._then,
  );

  final Query$admin_get_restaurants$restaurant_restaurant$details _instance;

  final TRes Function(Query$admin_get_restaurants$restaurant_restaurant$details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? is_open = _undefined,
    Object? approved = _undefined,
    Object? firebase_id = _undefined,
    Object? image = _undefined,
    Object? language = _undefined,
    Object? location = _undefined,
    Object? name = _undefined,
    Object? open_status = _undefined,
    Object? service_provider_type = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$admin_get_restaurants$restaurant_restaurant$details(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        is_open: is_open == _undefined ? _instance.is_open : (is_open as bool?),
        approved: approved == _undefined || approved == null
            ? _instance.approved
            : (approved as bool),
        firebase_id: firebase_id == _undefined
            ? _instance.firebase_id
            : (firebase_id as String?),
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        language: language == _undefined || language == null
            ? _instance.language
            : (language as dynamic),
        location: location == _undefined || location == null
            ? _instance.location
            : (location
                as Query$admin_get_restaurants$restaurant_restaurant$details$location),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        open_status: open_status == _undefined || open_status == null
            ? _instance.open_status
            : (open_status as String),
        service_provider_type:
            service_provider_type == _undefined || service_provider_type == null
                ? _instance.service_provider_type
                : (service_provider_type as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$admin_get_restaurants$restaurant_restaurant$details$location<
      TRes> get location {
    final local$location = _instance.location;
    return CopyWith$Query$admin_get_restaurants$restaurant_restaurant$details$location(
        local$location, (e) => call(location: e));
  }
}

class _CopyWithStubImpl$Query$admin_get_restaurants$restaurant_restaurant$details<
        TRes>
    implements
        CopyWith$Query$admin_get_restaurants$restaurant_restaurant$details<
            TRes> {
  _CopyWithStubImpl$Query$admin_get_restaurants$restaurant_restaurant$details(
      this._res);

  TRes _res;

  call({
    int? id,
    bool? is_open,
    bool? approved,
    String? firebase_id,
    String? image,
    dynamic? language,
    Query$admin_get_restaurants$restaurant_restaurant$details$location?
        location,
    String? name,
    String? open_status,
    String? service_provider_type,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$admin_get_restaurants$restaurant_restaurant$details$location<
          TRes>
      get location =>
          CopyWith$Query$admin_get_restaurants$restaurant_restaurant$details$location
              .stub(_res);
}

class Query$admin_get_restaurants$restaurant_restaurant$details$location {
  Query$admin_get_restaurants$restaurant_restaurant$details$location({
    required this.gps,
    required this.address,
    required this.$__typename,
  });

  factory Query$admin_get_restaurants$restaurant_restaurant$details$location.fromJson(
      Map<String, dynamic> json) {
    final l$gps = json['gps'];
    final l$address = json['address'];
    final l$$__typename = json['__typename'];
    return Query$admin_get_restaurants$restaurant_restaurant$details$location(
      gps: geographyFromJson(l$gps),
      address: (l$address as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Geography gps;

  final String address;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$gps = gps;
    _resultData['gps'] = geographyToJson(l$gps);
    final l$address = address;
    _resultData['address'] = l$address;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$gps = gps;
    final l$address = address;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$gps,
      l$address,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$admin_get_restaurants$restaurant_restaurant$details$location) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$gps = gps;
    final lOther$gps = other.gps;
    if (l$gps != lOther$gps) {
      return false;
    }
    final l$address = address;
    final lOther$address = other.address;
    if (l$address != lOther$address) {
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

extension UtilityExtension$Query$admin_get_restaurants$restaurant_restaurant$details$location
    on Query$admin_get_restaurants$restaurant_restaurant$details$location {
  CopyWith$Query$admin_get_restaurants$restaurant_restaurant$details$location<
          Query$admin_get_restaurants$restaurant_restaurant$details$location>
      get copyWith =>
          CopyWith$Query$admin_get_restaurants$restaurant_restaurant$details$location(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$admin_get_restaurants$restaurant_restaurant$details$location<
    TRes> {
  factory CopyWith$Query$admin_get_restaurants$restaurant_restaurant$details$location(
    Query$admin_get_restaurants$restaurant_restaurant$details$location instance,
    TRes Function(
            Query$admin_get_restaurants$restaurant_restaurant$details$location)
        then,
  ) = _CopyWithImpl$Query$admin_get_restaurants$restaurant_restaurant$details$location;

  factory CopyWith$Query$admin_get_restaurants$restaurant_restaurant$details$location.stub(
          TRes res) =
      _CopyWithStubImpl$Query$admin_get_restaurants$restaurant_restaurant$details$location;

  TRes call({
    Geography? gps,
    String? address,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$admin_get_restaurants$restaurant_restaurant$details$location<
        TRes>
    implements
        CopyWith$Query$admin_get_restaurants$restaurant_restaurant$details$location<
            TRes> {
  _CopyWithImpl$Query$admin_get_restaurants$restaurant_restaurant$details$location(
    this._instance,
    this._then,
  );

  final Query$admin_get_restaurants$restaurant_restaurant$details$location
      _instance;

  final TRes Function(
      Query$admin_get_restaurants$restaurant_restaurant$details$location) _then;

  static const _undefined = {};

  TRes call({
    Object? gps = _undefined,
    Object? address = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$admin_get_restaurants$restaurant_restaurant$details$location(
        gps: gps == _undefined || gps == null
            ? _instance.gps
            : (gps as Geography),
        address: address == _undefined || address == null
            ? _instance.address
            : (address as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$admin_get_restaurants$restaurant_restaurant$details$location<
        TRes>
    implements
        CopyWith$Query$admin_get_restaurants$restaurant_restaurant$details$location<
            TRes> {
  _CopyWithStubImpl$Query$admin_get_restaurants$restaurant_restaurant$details$location(
      this._res);

  TRes _res;

  call({
    Geography? gps,
    String? address,
    String? $__typename,
  }) =>
      _res;
}
