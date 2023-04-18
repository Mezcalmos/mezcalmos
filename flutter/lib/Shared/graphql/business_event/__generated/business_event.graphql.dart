import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';

class Variables$Query$get_event_by_id {
  factory Variables$Query$get_event_by_id({required int id}) =>
      Variables$Query$get_event_by_id._({
        r'id': id,
      });

  Variables$Query$get_event_by_id._(this._$data);

  factory Variables$Query$get_event_by_id.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as int);
    return Variables$Query$get_event_by_id._(result$data);
  }

  Map<String, dynamic> _$data;

  int get id => (_$data['id'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$get_event_by_id<Variables$Query$get_event_by_id>
      get copyWith => CopyWith$Variables$Query$get_event_by_id(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$get_event_by_id) ||
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

abstract class CopyWith$Variables$Query$get_event_by_id<TRes> {
  factory CopyWith$Variables$Query$get_event_by_id(
    Variables$Query$get_event_by_id instance,
    TRes Function(Variables$Query$get_event_by_id) then,
  ) = _CopyWithImpl$Variables$Query$get_event_by_id;

  factory CopyWith$Variables$Query$get_event_by_id.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$get_event_by_id;

  TRes call({int? id});
}

class _CopyWithImpl$Variables$Query$get_event_by_id<TRes>
    implements CopyWith$Variables$Query$get_event_by_id<TRes> {
  _CopyWithImpl$Variables$Query$get_event_by_id(
    this._instance,
    this._then,
  );

  final Variables$Query$get_event_by_id _instance;

  final TRes Function(Variables$Query$get_event_by_id) _then;

  static const _undefined = {};

  TRes call({Object? id = _undefined}) =>
      _then(Variables$Query$get_event_by_id._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$get_event_by_id<TRes>
    implements CopyWith$Variables$Query$get_event_by_id<TRes> {
  _CopyWithStubImpl$Variables$Query$get_event_by_id(this._res);

  TRes _res;

  call({int? id}) => _res;
}

class Query$get_event_by_id {
  Query$get_event_by_id({
    this.business_event_by_pk,
    required this.$__typename,
  });

  factory Query$get_event_by_id.fromJson(Map<String, dynamic> json) {
    final l$business_event_by_pk = json['business_event_by_pk'];
    final l$$__typename = json['__typename'];
    return Query$get_event_by_id(
      business_event_by_pk: l$business_event_by_pk == null
          ? null
          : Query$get_event_by_id$business_event_by_pk.fromJson(
              (l$business_event_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$get_event_by_id$business_event_by_pk? business_event_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$business_event_by_pk = business_event_by_pk;
    _resultData['business_event_by_pk'] = l$business_event_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$business_event_by_pk = business_event_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$business_event_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_event_by_id) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$business_event_by_pk = business_event_by_pk;
    final lOther$business_event_by_pk = other.business_event_by_pk;
    if (l$business_event_by_pk != lOther$business_event_by_pk) {
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

extension UtilityExtension$Query$get_event_by_id on Query$get_event_by_id {
  CopyWith$Query$get_event_by_id<Query$get_event_by_id> get copyWith =>
      CopyWith$Query$get_event_by_id(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$get_event_by_id<TRes> {
  factory CopyWith$Query$get_event_by_id(
    Query$get_event_by_id instance,
    TRes Function(Query$get_event_by_id) then,
  ) = _CopyWithImpl$Query$get_event_by_id;

  factory CopyWith$Query$get_event_by_id.stub(TRes res) =
      _CopyWithStubImpl$Query$get_event_by_id;

  TRes call({
    Query$get_event_by_id$business_event_by_pk? business_event_by_pk,
    String? $__typename,
  });
  CopyWith$Query$get_event_by_id$business_event_by_pk<TRes>
      get business_event_by_pk;
}

class _CopyWithImpl$Query$get_event_by_id<TRes>
    implements CopyWith$Query$get_event_by_id<TRes> {
  _CopyWithImpl$Query$get_event_by_id(
    this._instance,
    this._then,
  );

  final Query$get_event_by_id _instance;

  final TRes Function(Query$get_event_by_id) _then;

  static const _undefined = {};

  TRes call({
    Object? business_event_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_event_by_id(
        business_event_by_pk: business_event_by_pk == _undefined
            ? _instance.business_event_by_pk
            : (business_event_by_pk
                as Query$get_event_by_id$business_event_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_event_by_id$business_event_by_pk<TRes>
      get business_event_by_pk {
    final local$business_event_by_pk = _instance.business_event_by_pk;
    return local$business_event_by_pk == null
        ? CopyWith$Query$get_event_by_id$business_event_by_pk.stub(
            _then(_instance))
        : CopyWith$Query$get_event_by_id$business_event_by_pk(
            local$business_event_by_pk, (e) => call(business_event_by_pk: e));
  }
}

class _CopyWithStubImpl$Query$get_event_by_id<TRes>
    implements CopyWith$Query$get_event_by_id<TRes> {
  _CopyWithStubImpl$Query$get_event_by_id(this._res);

  TRes _res;

  call({
    Query$get_event_by_id$business_event_by_pk? business_event_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_event_by_id$business_event_by_pk<TRes>
      get business_event_by_pk =>
          CopyWith$Query$get_event_by_id$business_event_by_pk.stub(_res);
}

const documentNodeQueryget_event_by_id = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'get_event_by_id'),
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
        name: NameNode(value: 'business_event_by_pk'),
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
            name: NameNode(value: 'business'),
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
                    name: NameNode(value: 'accepted_payments'),
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
                    name: NameNode(value: '__typename'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                ]),
              ),
              FieldNode(
                name: NameNode(value: 'reviews_aggregate'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'aggregate'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                        name: NameNode(value: 'avg'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(selections: [
                          FieldNode(
                            name: NameNode(value: 'rating'),
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
            name: NameNode(value: 'schedule'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'schedule_type'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'gps_location'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'time'),
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
                name: NameNode(value: 'additional_parameters'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'available'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'category1'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'cost'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'tags'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'description'),
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
                name: NameNode(value: 'position'),
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
Query$get_event_by_id _parserFn$Query$get_event_by_id(
        Map<String, dynamic> data) =>
    Query$get_event_by_id.fromJson(data);

class Options$Query$get_event_by_id
    extends graphql.QueryOptions<Query$get_event_by_id> {
  Options$Query$get_event_by_id({
    String? operationName,
    required Variables$Query$get_event_by_id variables,
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
          document: documentNodeQueryget_event_by_id,
          parserFn: _parserFn$Query$get_event_by_id,
        );
}

class WatchOptions$Query$get_event_by_id
    extends graphql.WatchQueryOptions<Query$get_event_by_id> {
  WatchOptions$Query$get_event_by_id({
    String? operationName,
    required Variables$Query$get_event_by_id variables,
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
          document: documentNodeQueryget_event_by_id,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$get_event_by_id,
        );
}

class FetchMoreOptions$Query$get_event_by_id extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$get_event_by_id({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$get_event_by_id variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryget_event_by_id,
        );
}

extension ClientExtension$Query$get_event_by_id on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$get_event_by_id>> query$get_event_by_id(
          Options$Query$get_event_by_id options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$get_event_by_id> watchQuery$get_event_by_id(
          WatchOptions$Query$get_event_by_id options) =>
      this.watchQuery(options);
  void writeQuery$get_event_by_id({
    required Query$get_event_by_id data,
    required Variables$Query$get_event_by_id variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryget_event_by_id),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$get_event_by_id? readQuery$get_event_by_id({
    required Variables$Query$get_event_by_id variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQueryget_event_by_id),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$get_event_by_id.fromJson(result);
  }
}

class Query$get_event_by_id$business_event_by_pk {
  Query$get_event_by_id$business_event_by_pk({
    required this.business,
    required this.id,
    this.schedule,
    required this.schedule_type,
    this.gps_location,
    this.time,
    required this.details,
    required this.$__typename,
  });

  factory Query$get_event_by_id$business_event_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$business = json['business'];
    final l$id = json['id'];
    final l$schedule = json['schedule'];
    final l$schedule_type = json['schedule_type'];
    final l$gps_location = json['gps_location'];
    final l$time = json['time'];
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Query$get_event_by_id$business_event_by_pk(
      business: Query$get_event_by_id$business_event_by_pk$business.fromJson(
          (l$business as Map<String, dynamic>)),
      id: (l$id as int),
      schedule: l$schedule == null ? null : mapFromJson(l$schedule),
      schedule_type: (l$schedule_type as String),
      gps_location:
          l$gps_location == null ? null : geographyFromJson(l$gps_location),
      time: (l$time as String?),
      details: Query$get_event_by_id$business_event_by_pk$details.fromJson(
          (l$details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$get_event_by_id$business_event_by_pk$business business;

  final int id;

  final dynamic? schedule;

  final String schedule_type;

  final Geography? gps_location;

  final String? time;

  final Query$get_event_by_id$business_event_by_pk$details details;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$business = business;
    _resultData['business'] = l$business.toJson();
    final l$id = id;
    _resultData['id'] = l$id;
    final l$schedule = schedule;
    _resultData['schedule'] = l$schedule == null ? null : mapToJson(l$schedule);
    final l$schedule_type = schedule_type;
    _resultData['schedule_type'] = l$schedule_type;
    final l$gps_location = gps_location;
    _resultData['gps_location'] =
        l$gps_location == null ? null : geographyToJson(l$gps_location);
    final l$time = time;
    _resultData['time'] = l$time;
    final l$details = details;
    _resultData['details'] = l$details.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$business = business;
    final l$id = id;
    final l$schedule = schedule;
    final l$schedule_type = schedule_type;
    final l$gps_location = gps_location;
    final l$time = time;
    final l$details = details;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$business,
      l$id,
      l$schedule,
      l$schedule_type,
      l$gps_location,
      l$time,
      l$details,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_event_by_id$business_event_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$business = business;
    final lOther$business = other.business;
    if (l$business != lOther$business) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$schedule = schedule;
    final lOther$schedule = other.schedule;
    if (l$schedule != lOther$schedule) {
      return false;
    }
    final l$schedule_type = schedule_type;
    final lOther$schedule_type = other.schedule_type;
    if (l$schedule_type != lOther$schedule_type) {
      return false;
    }
    final l$gps_location = gps_location;
    final lOther$gps_location = other.gps_location;
    if (l$gps_location != lOther$gps_location) {
      return false;
    }
    final l$time = time;
    final lOther$time = other.time;
    if (l$time != lOther$time) {
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

extension UtilityExtension$Query$get_event_by_id$business_event_by_pk
    on Query$get_event_by_id$business_event_by_pk {
  CopyWith$Query$get_event_by_id$business_event_by_pk<
          Query$get_event_by_id$business_event_by_pk>
      get copyWith => CopyWith$Query$get_event_by_id$business_event_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_event_by_id$business_event_by_pk<TRes> {
  factory CopyWith$Query$get_event_by_id$business_event_by_pk(
    Query$get_event_by_id$business_event_by_pk instance,
    TRes Function(Query$get_event_by_id$business_event_by_pk) then,
  ) = _CopyWithImpl$Query$get_event_by_id$business_event_by_pk;

  factory CopyWith$Query$get_event_by_id$business_event_by_pk.stub(TRes res) =
      _CopyWithStubImpl$Query$get_event_by_id$business_event_by_pk;

  TRes call({
    Query$get_event_by_id$business_event_by_pk$business? business,
    int? id,
    dynamic? schedule,
    String? schedule_type,
    Geography? gps_location,
    String? time,
    Query$get_event_by_id$business_event_by_pk$details? details,
    String? $__typename,
  });
  CopyWith$Query$get_event_by_id$business_event_by_pk$business<TRes>
      get business;
  CopyWith$Query$get_event_by_id$business_event_by_pk$details<TRes> get details;
}

class _CopyWithImpl$Query$get_event_by_id$business_event_by_pk<TRes>
    implements CopyWith$Query$get_event_by_id$business_event_by_pk<TRes> {
  _CopyWithImpl$Query$get_event_by_id$business_event_by_pk(
    this._instance,
    this._then,
  );

  final Query$get_event_by_id$business_event_by_pk _instance;

  final TRes Function(Query$get_event_by_id$business_event_by_pk) _then;

  static const _undefined = {};

  TRes call({
    Object? business = _undefined,
    Object? id = _undefined,
    Object? schedule = _undefined,
    Object? schedule_type = _undefined,
    Object? gps_location = _undefined,
    Object? time = _undefined,
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_event_by_id$business_event_by_pk(
        business: business == _undefined || business == null
            ? _instance.business
            : (business as Query$get_event_by_id$business_event_by_pk$business),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        schedule: schedule == _undefined
            ? _instance.schedule
            : (schedule as dynamic?),
        schedule_type: schedule_type == _undefined || schedule_type == null
            ? _instance.schedule_type
            : (schedule_type as String),
        gps_location: gps_location == _undefined
            ? _instance.gps_location
            : (gps_location as Geography?),
        time: time == _undefined ? _instance.time : (time as String?),
        details: details == _undefined || details == null
            ? _instance.details
            : (details as Query$get_event_by_id$business_event_by_pk$details),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_event_by_id$business_event_by_pk$business<TRes>
      get business {
    final local$business = _instance.business;
    return CopyWith$Query$get_event_by_id$business_event_by_pk$business(
        local$business, (e) => call(business: e));
  }

  CopyWith$Query$get_event_by_id$business_event_by_pk$details<TRes>
      get details {
    final local$details = _instance.details;
    return CopyWith$Query$get_event_by_id$business_event_by_pk$details(
        local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Query$get_event_by_id$business_event_by_pk<TRes>
    implements CopyWith$Query$get_event_by_id$business_event_by_pk<TRes> {
  _CopyWithStubImpl$Query$get_event_by_id$business_event_by_pk(this._res);

  TRes _res;

  call({
    Query$get_event_by_id$business_event_by_pk$business? business,
    int? id,
    dynamic? schedule,
    String? schedule_type,
    Geography? gps_location,
    String? time,
    Query$get_event_by_id$business_event_by_pk$details? details,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_event_by_id$business_event_by_pk$business<TRes>
      get business =>
          CopyWith$Query$get_event_by_id$business_event_by_pk$business.stub(
              _res);
  CopyWith$Query$get_event_by_id$business_event_by_pk$details<TRes>
      get details =>
          CopyWith$Query$get_event_by_id$business_event_by_pk$details.stub(
              _res);
}

class Query$get_event_by_id$business_event_by_pk$business {
  Query$get_event_by_id$business_event_by_pk$business({
    required this.id,
    required this.details,
    required this.reviews_aggregate,
    required this.$__typename,
  });

  factory Query$get_event_by_id$business_event_by_pk$business.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$details = json['details'];
    final l$reviews_aggregate = json['reviews_aggregate'];
    final l$$__typename = json['__typename'];
    return Query$get_event_by_id$business_event_by_pk$business(
      id: (l$id as int),
      details:
          Query$get_event_by_id$business_event_by_pk$business$details.fromJson(
              (l$details as Map<String, dynamic>)),
      reviews_aggregate:
          Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate
              .fromJson((l$reviews_aggregate as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final Query$get_event_by_id$business_event_by_pk$business$details details;

  final Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate
      reviews_aggregate;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$details = details;
    _resultData['details'] = l$details.toJson();
    final l$reviews_aggregate = reviews_aggregate;
    _resultData['reviews_aggregate'] = l$reviews_aggregate.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$details = details;
    final l$reviews_aggregate = reviews_aggregate;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$details,
      l$reviews_aggregate,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_event_by_id$business_event_by_pk$business) ||
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
    final l$reviews_aggregate = reviews_aggregate;
    final lOther$reviews_aggregate = other.reviews_aggregate;
    if (l$reviews_aggregate != lOther$reviews_aggregate) {
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

extension UtilityExtension$Query$get_event_by_id$business_event_by_pk$business
    on Query$get_event_by_id$business_event_by_pk$business {
  CopyWith$Query$get_event_by_id$business_event_by_pk$business<
          Query$get_event_by_id$business_event_by_pk$business>
      get copyWith =>
          CopyWith$Query$get_event_by_id$business_event_by_pk$business(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_event_by_id$business_event_by_pk$business<
    TRes> {
  factory CopyWith$Query$get_event_by_id$business_event_by_pk$business(
    Query$get_event_by_id$business_event_by_pk$business instance,
    TRes Function(Query$get_event_by_id$business_event_by_pk$business) then,
  ) = _CopyWithImpl$Query$get_event_by_id$business_event_by_pk$business;

  factory CopyWith$Query$get_event_by_id$business_event_by_pk$business.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_event_by_id$business_event_by_pk$business;

  TRes call({
    int? id,
    Query$get_event_by_id$business_event_by_pk$business$details? details,
    Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate?
        reviews_aggregate,
    String? $__typename,
  });
  CopyWith$Query$get_event_by_id$business_event_by_pk$business$details<TRes>
      get details;
  CopyWith$Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate<
      TRes> get reviews_aggregate;
}

class _CopyWithImpl$Query$get_event_by_id$business_event_by_pk$business<TRes>
    implements
        CopyWith$Query$get_event_by_id$business_event_by_pk$business<TRes> {
  _CopyWithImpl$Query$get_event_by_id$business_event_by_pk$business(
    this._instance,
    this._then,
  );

  final Query$get_event_by_id$business_event_by_pk$business _instance;

  final TRes Function(Query$get_event_by_id$business_event_by_pk$business)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? details = _undefined,
    Object? reviews_aggregate = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_event_by_id$business_event_by_pk$business(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        details: details == _undefined || details == null
            ? _instance.details
            : (details
                as Query$get_event_by_id$business_event_by_pk$business$details),
        reviews_aggregate: reviews_aggregate == _undefined ||
                reviews_aggregate == null
            ? _instance.reviews_aggregate
            : (reviews_aggregate
                as Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_event_by_id$business_event_by_pk$business$details<TRes>
      get details {
    final local$details = _instance.details;
    return CopyWith$Query$get_event_by_id$business_event_by_pk$business$details(
        local$details, (e) => call(details: e));
  }

  CopyWith$Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate<
      TRes> get reviews_aggregate {
    final local$reviews_aggregate = _instance.reviews_aggregate;
    return CopyWith$Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate(
        local$reviews_aggregate, (e) => call(reviews_aggregate: e));
  }
}

class _CopyWithStubImpl$Query$get_event_by_id$business_event_by_pk$business<
        TRes>
    implements
        CopyWith$Query$get_event_by_id$business_event_by_pk$business<TRes> {
  _CopyWithStubImpl$Query$get_event_by_id$business_event_by_pk$business(
      this._res);

  TRes _res;

  call({
    int? id,
    Query$get_event_by_id$business_event_by_pk$business$details? details,
    Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate?
        reviews_aggregate,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_event_by_id$business_event_by_pk$business$details<TRes>
      get details =>
          CopyWith$Query$get_event_by_id$business_event_by_pk$business$details
              .stub(_res);
  CopyWith$Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate<
          TRes>
      get reviews_aggregate =>
          CopyWith$Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate
              .stub(_res);
}

class Query$get_event_by_id$business_event_by_pk$business$details {
  Query$get_event_by_id$business_event_by_pk$business$details({
    required this.id,
    required this.accepted_payments,
    required this.image,
    required this.name,
    required this.$__typename,
  });

  factory Query$get_event_by_id$business_event_by_pk$business$details.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$accepted_payments = json['accepted_payments'];
    final l$image = json['image'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Query$get_event_by_id$business_event_by_pk$business$details(
      id: (l$id as int),
      accepted_payments: mapFromJson(l$accepted_payments),
      image: (l$image as String),
      name: (l$name as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final dynamic accepted_payments;

  final String image;

  final String name;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$accepted_payments = accepted_payments;
    _resultData['accepted_payments'] = mapToJson(l$accepted_payments);
    final l$image = image;
    _resultData['image'] = l$image;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$accepted_payments = accepted_payments;
    final l$image = image;
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$accepted_payments,
      l$image,
      l$name,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$get_event_by_id$business_event_by_pk$business$details) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$accepted_payments = accepted_payments;
    final lOther$accepted_payments = other.accepted_payments;
    if (l$accepted_payments != lOther$accepted_payments) {
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$get_event_by_id$business_event_by_pk$business$details
    on Query$get_event_by_id$business_event_by_pk$business$details {
  CopyWith$Query$get_event_by_id$business_event_by_pk$business$details<
          Query$get_event_by_id$business_event_by_pk$business$details>
      get copyWith =>
          CopyWith$Query$get_event_by_id$business_event_by_pk$business$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_event_by_id$business_event_by_pk$business$details<
    TRes> {
  factory CopyWith$Query$get_event_by_id$business_event_by_pk$business$details(
    Query$get_event_by_id$business_event_by_pk$business$details instance,
    TRes Function(Query$get_event_by_id$business_event_by_pk$business$details)
        then,
  ) = _CopyWithImpl$Query$get_event_by_id$business_event_by_pk$business$details;

  factory CopyWith$Query$get_event_by_id$business_event_by_pk$business$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_event_by_id$business_event_by_pk$business$details;

  TRes call({
    int? id,
    dynamic? accepted_payments,
    String? image,
    String? name,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_event_by_id$business_event_by_pk$business$details<
        TRes>
    implements
        CopyWith$Query$get_event_by_id$business_event_by_pk$business$details<
            TRes> {
  _CopyWithImpl$Query$get_event_by_id$business_event_by_pk$business$details(
    this._instance,
    this._then,
  );

  final Query$get_event_by_id$business_event_by_pk$business$details _instance;

  final TRes Function(
      Query$get_event_by_id$business_event_by_pk$business$details) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? accepted_payments = _undefined,
    Object? image = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_event_by_id$business_event_by_pk$business$details(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        accepted_payments:
            accepted_payments == _undefined || accepted_payments == null
                ? _instance.accepted_payments
                : (accepted_payments as dynamic),
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$get_event_by_id$business_event_by_pk$business$details<
        TRes>
    implements
        CopyWith$Query$get_event_by_id$business_event_by_pk$business$details<
            TRes> {
  _CopyWithStubImpl$Query$get_event_by_id$business_event_by_pk$business$details(
      this._res);

  TRes _res;

  call({
    int? id,
    dynamic? accepted_payments,
    String? image,
    String? name,
    String? $__typename,
  }) =>
      _res;
}

class Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate {
  Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate({
    this.aggregate,
    required this.$__typename,
  });

  factory Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate.fromJson(
      Map<String, dynamic> json) {
    final l$aggregate = json['aggregate'];
    final l$$__typename = json['__typename'];
    return Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate(
      aggregate: l$aggregate == null
          ? null
          : Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate$aggregate
              .fromJson((l$aggregate as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate$aggregate?
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
            is Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate) ||
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

extension UtilityExtension$Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate
    on Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate {
  CopyWith$Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate<
          Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate>
      get copyWith =>
          CopyWith$Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate<
    TRes> {
  factory CopyWith$Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate(
    Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate
        instance,
    TRes Function(
            Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate)
        then,
  ) = _CopyWithImpl$Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate;

  factory CopyWith$Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate;

  TRes call({
    Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate$aggregate?
        aggregate,
    String? $__typename,
  });
  CopyWith$Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate$aggregate<
      TRes> get aggregate;
}

class _CopyWithImpl$Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate<
        TRes>
    implements
        CopyWith$Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate<
            TRes> {
  _CopyWithImpl$Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate(
    this._instance,
    this._then,
  );

  final Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate
      _instance;

  final TRes Function(
          Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate)
      _then;

  static const _undefined = {};

  TRes call({
    Object? aggregate = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate(
        aggregate: aggregate == _undefined
            ? _instance.aggregate
            : (aggregate
                as Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate$aggregate?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate$aggregate<
      TRes> get aggregate {
    final local$aggregate = _instance.aggregate;
    return local$aggregate == null
        ? CopyWith$Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate$aggregate
            .stub(_then(_instance))
        : CopyWith$Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate$aggregate(
            local$aggregate, (e) => call(aggregate: e));
  }
}

class _CopyWithStubImpl$Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate<
        TRes>
    implements
        CopyWith$Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate<
            TRes> {
  _CopyWithStubImpl$Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate(
      this._res);

  TRes _res;

  call({
    Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate$aggregate?
        aggregate,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate$aggregate<
          TRes>
      get aggregate =>
          CopyWith$Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate$aggregate
              .stub(_res);
}

class Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate$aggregate {
  Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate$aggregate({
    this.avg,
    required this.count,
    required this.$__typename,
  });

  factory Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate$aggregate.fromJson(
      Map<String, dynamic> json) {
    final l$avg = json['avg'];
    final l$count = json['count'];
    final l$$__typename = json['__typename'];
    return Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate$aggregate(
      avg: l$avg == null
          ? null
          : Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate$aggregate$avg
              .fromJson((l$avg as Map<String, dynamic>)),
      count: (l$count as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate$aggregate$avg?
      avg;

  final int count;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$avg = avg;
    _resultData['avg'] = l$avg?.toJson();
    final l$count = count;
    _resultData['count'] = l$count;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$avg = avg;
    final l$count = count;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$avg,
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
            is Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate$aggregate) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$avg = avg;
    final lOther$avg = other.avg;
    if (l$avg != lOther$avg) {
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

extension UtilityExtension$Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate$aggregate
    on Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate$aggregate {
  CopyWith$Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate$aggregate<
          Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate$aggregate>
      get copyWith =>
          CopyWith$Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate$aggregate(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate$aggregate<
    TRes> {
  factory CopyWith$Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate$aggregate(
    Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate$aggregate
        instance,
    TRes Function(
            Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate$aggregate)
        then,
  ) = _CopyWithImpl$Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate$aggregate;

  factory CopyWith$Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate$aggregate.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate$aggregate;

  TRes call({
    Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate$aggregate$avg?
        avg,
    int? count,
    String? $__typename,
  });
  CopyWith$Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate$aggregate$avg<
      TRes> get avg;
}

class _CopyWithImpl$Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate$aggregate<
        TRes>
    implements
        CopyWith$Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate$aggregate<
            TRes> {
  _CopyWithImpl$Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate$aggregate(
    this._instance,
    this._then,
  );

  final Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate$aggregate
      _instance;

  final TRes Function(
          Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate$aggregate)
      _then;

  static const _undefined = {};

  TRes call({
    Object? avg = _undefined,
    Object? count = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate$aggregate(
        avg: avg == _undefined
            ? _instance.avg
            : (avg
                as Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate$aggregate$avg?),
        count: count == _undefined || count == null
            ? _instance.count
            : (count as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate$aggregate$avg<
      TRes> get avg {
    final local$avg = _instance.avg;
    return local$avg == null
        ? CopyWith$Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate$aggregate$avg
            .stub(_then(_instance))
        : CopyWith$Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate$aggregate$avg(
            local$avg, (e) => call(avg: e));
  }
}

class _CopyWithStubImpl$Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate$aggregate<
        TRes>
    implements
        CopyWith$Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate$aggregate<
            TRes> {
  _CopyWithStubImpl$Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate$aggregate(
      this._res);

  TRes _res;

  call({
    Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate$aggregate$avg?
        avg,
    int? count,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate$aggregate$avg<
          TRes>
      get avg =>
          CopyWith$Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate$aggregate$avg
              .stub(_res);
}

class Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate$aggregate$avg {
  Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate$aggregate$avg({
    this.rating,
    required this.$__typename,
  });

  factory Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate$aggregate$avg.fromJson(
      Map<String, dynamic> json) {
    final l$rating = json['rating'];
    final l$$__typename = json['__typename'];
    return Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate$aggregate$avg(
      rating: (l$rating as num?)?.toDouble(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final double? rating;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$rating = rating;
    _resultData['rating'] = l$rating;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$rating = rating;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$rating,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate$aggregate$avg) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$rating = rating;
    final lOther$rating = other.rating;
    if (l$rating != lOther$rating) {
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

extension UtilityExtension$Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate$aggregate$avg
    on Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate$aggregate$avg {
  CopyWith$Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate$aggregate$avg<
          Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate$aggregate$avg>
      get copyWith =>
          CopyWith$Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate$aggregate$avg(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate$aggregate$avg<
    TRes> {
  factory CopyWith$Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate$aggregate$avg(
    Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate$aggregate$avg
        instance,
    TRes Function(
            Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate$aggregate$avg)
        then,
  ) = _CopyWithImpl$Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate$aggregate$avg;

  factory CopyWith$Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate$aggregate$avg.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate$aggregate$avg;

  TRes call({
    double? rating,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate$aggregate$avg<
        TRes>
    implements
        CopyWith$Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate$aggregate$avg<
            TRes> {
  _CopyWithImpl$Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate$aggregate$avg(
    this._instance,
    this._then,
  );

  final Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate$aggregate$avg
      _instance;

  final TRes Function(
          Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate$aggregate$avg)
      _then;

  static const _undefined = {};

  TRes call({
    Object? rating = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate$aggregate$avg(
        rating: rating == _undefined ? _instance.rating : (rating as double?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate$aggregate$avg<
        TRes>
    implements
        CopyWith$Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate$aggregate$avg<
            TRes> {
  _CopyWithStubImpl$Query$get_event_by_id$business_event_by_pk$business$reviews_aggregate$aggregate$avg(
      this._res);

  TRes _res;

  call({
    double? rating,
    String? $__typename,
  }) =>
      _res;
}

class Query$get_event_by_id$business_event_by_pk$details {
  Query$get_event_by_id$business_event_by_pk$details({
    this.additional_parameters,
    required this.available,
    required this.category1,
    required this.cost,
    this.tags,
    this.description,
    required this.id,
    this.image,
    required this.name,
    required this.position,
    required this.$__typename,
  });

  factory Query$get_event_by_id$business_event_by_pk$details.fromJson(
      Map<String, dynamic> json) {
    final l$additional_parameters = json['additional_parameters'];
    final l$available = json['available'];
    final l$category1 = json['category1'];
    final l$cost = json['cost'];
    final l$tags = json['tags'];
    final l$description = json['description'];
    final l$id = json['id'];
    final l$image = json['image'];
    final l$name = json['name'];
    final l$position = json['position'];
    final l$$__typename = json['__typename'];
    return Query$get_event_by_id$business_event_by_pk$details(
      additional_parameters: l$additional_parameters == null
          ? null
          : mapFromJson(l$additional_parameters),
      available: (l$available as bool),
      category1: (l$category1 as String),
      cost: mapFromJson(l$cost),
      tags: l$tags == null ? null : mapFromJson(l$tags),
      description: l$description == null
          ? null
          : Query$get_event_by_id$business_event_by_pk$details$description
              .fromJson((l$description as Map<String, dynamic>)),
      id: (l$id as int),
      image: l$image == null ? null : mapFromJson(l$image),
      name: Query$get_event_by_id$business_event_by_pk$details$name.fromJson(
          (l$name as Map<String, dynamic>)),
      position: (l$position as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final dynamic? additional_parameters;

  final bool available;

  final String category1;

  final dynamic cost;

  final dynamic? tags;

  final Query$get_event_by_id$business_event_by_pk$details$description?
      description;

  final int id;

  final dynamic? image;

  final Query$get_event_by_id$business_event_by_pk$details$name name;

  final int position;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$additional_parameters = additional_parameters;
    _resultData['additional_parameters'] = l$additional_parameters == null
        ? null
        : mapToJson(l$additional_parameters);
    final l$available = available;
    _resultData['available'] = l$available;
    final l$category1 = category1;
    _resultData['category1'] = l$category1;
    final l$cost = cost;
    _resultData['cost'] = mapToJson(l$cost);
    final l$tags = tags;
    _resultData['tags'] = l$tags == null ? null : mapToJson(l$tags);
    final l$description = description;
    _resultData['description'] = l$description?.toJson();
    final l$id = id;
    _resultData['id'] = l$id;
    final l$image = image;
    _resultData['image'] = l$image == null ? null : mapToJson(l$image);
    final l$name = name;
    _resultData['name'] = l$name.toJson();
    final l$position = position;
    _resultData['position'] = l$position;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$additional_parameters = additional_parameters;
    final l$available = available;
    final l$category1 = category1;
    final l$cost = cost;
    final l$tags = tags;
    final l$description = description;
    final l$id = id;
    final l$image = image;
    final l$name = name;
    final l$position = position;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$additional_parameters,
      l$available,
      l$category1,
      l$cost,
      l$tags,
      l$description,
      l$id,
      l$image,
      l$name,
      l$position,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_event_by_id$business_event_by_pk$details) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$additional_parameters = additional_parameters;
    final lOther$additional_parameters = other.additional_parameters;
    if (l$additional_parameters != lOther$additional_parameters) {
      return false;
    }
    final l$available = available;
    final lOther$available = other.available;
    if (l$available != lOther$available) {
      return false;
    }
    final l$category1 = category1;
    final lOther$category1 = other.category1;
    if (l$category1 != lOther$category1) {
      return false;
    }
    final l$cost = cost;
    final lOther$cost = other.cost;
    if (l$cost != lOther$cost) {
      return false;
    }
    final l$tags = tags;
    final lOther$tags = other.tags;
    if (l$tags != lOther$tags) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
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
    final l$position = position;
    final lOther$position = other.position;
    if (l$position != lOther$position) {
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

extension UtilityExtension$Query$get_event_by_id$business_event_by_pk$details
    on Query$get_event_by_id$business_event_by_pk$details {
  CopyWith$Query$get_event_by_id$business_event_by_pk$details<
          Query$get_event_by_id$business_event_by_pk$details>
      get copyWith =>
          CopyWith$Query$get_event_by_id$business_event_by_pk$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_event_by_id$business_event_by_pk$details<
    TRes> {
  factory CopyWith$Query$get_event_by_id$business_event_by_pk$details(
    Query$get_event_by_id$business_event_by_pk$details instance,
    TRes Function(Query$get_event_by_id$business_event_by_pk$details) then,
  ) = _CopyWithImpl$Query$get_event_by_id$business_event_by_pk$details;

  factory CopyWith$Query$get_event_by_id$business_event_by_pk$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_event_by_id$business_event_by_pk$details;

  TRes call({
    dynamic? additional_parameters,
    bool? available,
    String? category1,
    dynamic? cost,
    dynamic? tags,
    Query$get_event_by_id$business_event_by_pk$details$description? description,
    int? id,
    dynamic? image,
    Query$get_event_by_id$business_event_by_pk$details$name? name,
    int? position,
    String? $__typename,
  });
  CopyWith$Query$get_event_by_id$business_event_by_pk$details$description<TRes>
      get description;
  CopyWith$Query$get_event_by_id$business_event_by_pk$details$name<TRes>
      get name;
}

class _CopyWithImpl$Query$get_event_by_id$business_event_by_pk$details<TRes>
    implements
        CopyWith$Query$get_event_by_id$business_event_by_pk$details<TRes> {
  _CopyWithImpl$Query$get_event_by_id$business_event_by_pk$details(
    this._instance,
    this._then,
  );

  final Query$get_event_by_id$business_event_by_pk$details _instance;

  final TRes Function(Query$get_event_by_id$business_event_by_pk$details) _then;

  static const _undefined = {};

  TRes call({
    Object? additional_parameters = _undefined,
    Object? available = _undefined,
    Object? category1 = _undefined,
    Object? cost = _undefined,
    Object? tags = _undefined,
    Object? description = _undefined,
    Object? id = _undefined,
    Object? image = _undefined,
    Object? name = _undefined,
    Object? position = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_event_by_id$business_event_by_pk$details(
        additional_parameters: additional_parameters == _undefined
            ? _instance.additional_parameters
            : (additional_parameters as dynamic?),
        available: available == _undefined || available == null
            ? _instance.available
            : (available as bool),
        category1: category1 == _undefined || category1 == null
            ? _instance.category1
            : (category1 as String),
        cost: cost == _undefined || cost == null
            ? _instance.cost
            : (cost as dynamic),
        tags: tags == _undefined ? _instance.tags : (tags as dynamic?),
        description: description == _undefined
            ? _instance.description
            : (description
                as Query$get_event_by_id$business_event_by_pk$details$description?),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        image: image == _undefined ? _instance.image : (image as dynamic?),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as Query$get_event_by_id$business_event_by_pk$details$name),
        position: position == _undefined || position == null
            ? _instance.position
            : (position as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_event_by_id$business_event_by_pk$details$description<TRes>
      get description {
    final local$description = _instance.description;
    return local$description == null
        ? CopyWith$Query$get_event_by_id$business_event_by_pk$details$description
            .stub(_then(_instance))
        : CopyWith$Query$get_event_by_id$business_event_by_pk$details$description(
            local$description, (e) => call(description: e));
  }

  CopyWith$Query$get_event_by_id$business_event_by_pk$details$name<TRes>
      get name {
    final local$name = _instance.name;
    return CopyWith$Query$get_event_by_id$business_event_by_pk$details$name(
        local$name, (e) => call(name: e));
  }
}

class _CopyWithStubImpl$Query$get_event_by_id$business_event_by_pk$details<TRes>
    implements
        CopyWith$Query$get_event_by_id$business_event_by_pk$details<TRes> {
  _CopyWithStubImpl$Query$get_event_by_id$business_event_by_pk$details(
      this._res);

  TRes _res;

  call({
    dynamic? additional_parameters,
    bool? available,
    String? category1,
    dynamic? cost,
    dynamic? tags,
    Query$get_event_by_id$business_event_by_pk$details$description? description,
    int? id,
    dynamic? image,
    Query$get_event_by_id$business_event_by_pk$details$name? name,
    int? position,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_event_by_id$business_event_by_pk$details$description<TRes>
      get description =>
          CopyWith$Query$get_event_by_id$business_event_by_pk$details$description
              .stub(_res);
  CopyWith$Query$get_event_by_id$business_event_by_pk$details$name<TRes>
      get name =>
          CopyWith$Query$get_event_by_id$business_event_by_pk$details$name.stub(
              _res);
}

class Query$get_event_by_id$business_event_by_pk$details$description {
  Query$get_event_by_id$business_event_by_pk$details$description({
    required this.translations,
    required this.$__typename,
  });

  factory Query$get_event_by_id$business_event_by_pk$details$description.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$get_event_by_id$business_event_by_pk$details$description(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$get_event_by_id$business_event_by_pk$details$description$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Query$get_event_by_id$business_event_by_pk$details$description$translations>
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
            is Query$get_event_by_id$business_event_by_pk$details$description) ||
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

extension UtilityExtension$Query$get_event_by_id$business_event_by_pk$details$description
    on Query$get_event_by_id$business_event_by_pk$details$description {
  CopyWith$Query$get_event_by_id$business_event_by_pk$details$description<
          Query$get_event_by_id$business_event_by_pk$details$description>
      get copyWith =>
          CopyWith$Query$get_event_by_id$business_event_by_pk$details$description(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_event_by_id$business_event_by_pk$details$description<
    TRes> {
  factory CopyWith$Query$get_event_by_id$business_event_by_pk$details$description(
    Query$get_event_by_id$business_event_by_pk$details$description instance,
    TRes Function(
            Query$get_event_by_id$business_event_by_pk$details$description)
        then,
  ) = _CopyWithImpl$Query$get_event_by_id$business_event_by_pk$details$description;

  factory CopyWith$Query$get_event_by_id$business_event_by_pk$details$description.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_event_by_id$business_event_by_pk$details$description;

  TRes call({
    List<Query$get_event_by_id$business_event_by_pk$details$description$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$get_event_by_id$business_event_by_pk$details$description$translations> Function(
              Iterable<
                  CopyWith$Query$get_event_by_id$business_event_by_pk$details$description$translations<
                      Query$get_event_by_id$business_event_by_pk$details$description$translations>>)
          _fn);
}

class _CopyWithImpl$Query$get_event_by_id$business_event_by_pk$details$description<
        TRes>
    implements
        CopyWith$Query$get_event_by_id$business_event_by_pk$details$description<
            TRes> {
  _CopyWithImpl$Query$get_event_by_id$business_event_by_pk$details$description(
    this._instance,
    this._then,
  );

  final Query$get_event_by_id$business_event_by_pk$details$description
      _instance;

  final TRes Function(
      Query$get_event_by_id$business_event_by_pk$details$description) _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_event_by_id$business_event_by_pk$details$description(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$get_event_by_id$business_event_by_pk$details$description$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$get_event_by_id$business_event_by_pk$details$description$translations> Function(
                  Iterable<
                      CopyWith$Query$get_event_by_id$business_event_by_pk$details$description$translations<
                          Query$get_event_by_id$business_event_by_pk$details$description$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$get_event_by_id$business_event_by_pk$details$description$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$get_event_by_id$business_event_by_pk$details$description<
        TRes>
    implements
        CopyWith$Query$get_event_by_id$business_event_by_pk$details$description<
            TRes> {
  _CopyWithStubImpl$Query$get_event_by_id$business_event_by_pk$details$description(
      this._res);

  TRes _res;

  call({
    List<Query$get_event_by_id$business_event_by_pk$details$description$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$get_event_by_id$business_event_by_pk$details$description$translations {
  Query$get_event_by_id$business_event_by_pk$details$description$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$get_event_by_id$business_event_by_pk$details$description$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$get_event_by_id$business_event_by_pk$details$description$translations(
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
            is Query$get_event_by_id$business_event_by_pk$details$description$translations) ||
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

extension UtilityExtension$Query$get_event_by_id$business_event_by_pk$details$description$translations
    on Query$get_event_by_id$business_event_by_pk$details$description$translations {
  CopyWith$Query$get_event_by_id$business_event_by_pk$details$description$translations<
          Query$get_event_by_id$business_event_by_pk$details$description$translations>
      get copyWith =>
          CopyWith$Query$get_event_by_id$business_event_by_pk$details$description$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_event_by_id$business_event_by_pk$details$description$translations<
    TRes> {
  factory CopyWith$Query$get_event_by_id$business_event_by_pk$details$description$translations(
    Query$get_event_by_id$business_event_by_pk$details$description$translations
        instance,
    TRes Function(
            Query$get_event_by_id$business_event_by_pk$details$description$translations)
        then,
  ) = _CopyWithImpl$Query$get_event_by_id$business_event_by_pk$details$description$translations;

  factory CopyWith$Query$get_event_by_id$business_event_by_pk$details$description$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_event_by_id$business_event_by_pk$details$description$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_event_by_id$business_event_by_pk$details$description$translations<
        TRes>
    implements
        CopyWith$Query$get_event_by_id$business_event_by_pk$details$description$translations<
            TRes> {
  _CopyWithImpl$Query$get_event_by_id$business_event_by_pk$details$description$translations(
    this._instance,
    this._then,
  );

  final Query$get_event_by_id$business_event_by_pk$details$description$translations
      _instance;

  final TRes Function(
          Query$get_event_by_id$business_event_by_pk$details$description$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_event_by_id$business_event_by_pk$details$description$translations(
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

class _CopyWithStubImpl$Query$get_event_by_id$business_event_by_pk$details$description$translations<
        TRes>
    implements
        CopyWith$Query$get_event_by_id$business_event_by_pk$details$description$translations<
            TRes> {
  _CopyWithStubImpl$Query$get_event_by_id$business_event_by_pk$details$description$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Query$get_event_by_id$business_event_by_pk$details$name {
  Query$get_event_by_id$business_event_by_pk$details$name({
    required this.translations,
    required this.$__typename,
  });

  factory Query$get_event_by_id$business_event_by_pk$details$name.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$get_event_by_id$business_event_by_pk$details$name(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$get_event_by_id$business_event_by_pk$details$name$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Query$get_event_by_id$business_event_by_pk$details$name$translations>
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
    if (!(other is Query$get_event_by_id$business_event_by_pk$details$name) ||
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

extension UtilityExtension$Query$get_event_by_id$business_event_by_pk$details$name
    on Query$get_event_by_id$business_event_by_pk$details$name {
  CopyWith$Query$get_event_by_id$business_event_by_pk$details$name<
          Query$get_event_by_id$business_event_by_pk$details$name>
      get copyWith =>
          CopyWith$Query$get_event_by_id$business_event_by_pk$details$name(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_event_by_id$business_event_by_pk$details$name<
    TRes> {
  factory CopyWith$Query$get_event_by_id$business_event_by_pk$details$name(
    Query$get_event_by_id$business_event_by_pk$details$name instance,
    TRes Function(Query$get_event_by_id$business_event_by_pk$details$name) then,
  ) = _CopyWithImpl$Query$get_event_by_id$business_event_by_pk$details$name;

  factory CopyWith$Query$get_event_by_id$business_event_by_pk$details$name.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_event_by_id$business_event_by_pk$details$name;

  TRes call({
    List<Query$get_event_by_id$business_event_by_pk$details$name$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$get_event_by_id$business_event_by_pk$details$name$translations> Function(
              Iterable<
                  CopyWith$Query$get_event_by_id$business_event_by_pk$details$name$translations<
                      Query$get_event_by_id$business_event_by_pk$details$name$translations>>)
          _fn);
}

class _CopyWithImpl$Query$get_event_by_id$business_event_by_pk$details$name<
        TRes>
    implements
        CopyWith$Query$get_event_by_id$business_event_by_pk$details$name<TRes> {
  _CopyWithImpl$Query$get_event_by_id$business_event_by_pk$details$name(
    this._instance,
    this._then,
  );

  final Query$get_event_by_id$business_event_by_pk$details$name _instance;

  final TRes Function(Query$get_event_by_id$business_event_by_pk$details$name)
      _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_event_by_id$business_event_by_pk$details$name(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$get_event_by_id$business_event_by_pk$details$name$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$get_event_by_id$business_event_by_pk$details$name$translations> Function(
                  Iterable<
                      CopyWith$Query$get_event_by_id$business_event_by_pk$details$name$translations<
                          Query$get_event_by_id$business_event_by_pk$details$name$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$get_event_by_id$business_event_by_pk$details$name$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$get_event_by_id$business_event_by_pk$details$name<
        TRes>
    implements
        CopyWith$Query$get_event_by_id$business_event_by_pk$details$name<TRes> {
  _CopyWithStubImpl$Query$get_event_by_id$business_event_by_pk$details$name(
      this._res);

  TRes _res;

  call({
    List<Query$get_event_by_id$business_event_by_pk$details$name$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$get_event_by_id$business_event_by_pk$details$name$translations {
  Query$get_event_by_id$business_event_by_pk$details$name$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$get_event_by_id$business_event_by_pk$details$name$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$get_event_by_id$business_event_by_pk$details$name$translations(
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
            is Query$get_event_by_id$business_event_by_pk$details$name$translations) ||
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

extension UtilityExtension$Query$get_event_by_id$business_event_by_pk$details$name$translations
    on Query$get_event_by_id$business_event_by_pk$details$name$translations {
  CopyWith$Query$get_event_by_id$business_event_by_pk$details$name$translations<
          Query$get_event_by_id$business_event_by_pk$details$name$translations>
      get copyWith =>
          CopyWith$Query$get_event_by_id$business_event_by_pk$details$name$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_event_by_id$business_event_by_pk$details$name$translations<
    TRes> {
  factory CopyWith$Query$get_event_by_id$business_event_by_pk$details$name$translations(
    Query$get_event_by_id$business_event_by_pk$details$name$translations
        instance,
    TRes Function(
            Query$get_event_by_id$business_event_by_pk$details$name$translations)
        then,
  ) = _CopyWithImpl$Query$get_event_by_id$business_event_by_pk$details$name$translations;

  factory CopyWith$Query$get_event_by_id$business_event_by_pk$details$name$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_event_by_id$business_event_by_pk$details$name$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_event_by_id$business_event_by_pk$details$name$translations<
        TRes>
    implements
        CopyWith$Query$get_event_by_id$business_event_by_pk$details$name$translations<
            TRes> {
  _CopyWithImpl$Query$get_event_by_id$business_event_by_pk$details$name$translations(
    this._instance,
    this._then,
  );

  final Query$get_event_by_id$business_event_by_pk$details$name$translations
      _instance;

  final TRes Function(
          Query$get_event_by_id$business_event_by_pk$details$name$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_event_by_id$business_event_by_pk$details$name$translations(
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

class _CopyWithStubImpl$Query$get_event_by_id$business_event_by_pk$details$name$translations<
        TRes>
    implements
        CopyWith$Query$get_event_by_id$business_event_by_pk$details$name$translations<
            TRes> {
  _CopyWithStubImpl$Query$get_event_by_id$business_event_by_pk$details$name$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$get_event_by_category {
  factory Variables$Query$get_event_by_category({
    List<String>? categories1,
    int? limit,
    int? offset,
    List<String>? schedule_type,
    List<String>? tags,
  }) =>
      Variables$Query$get_event_by_category._({
        if (categories1 != null) r'categories1': categories1,
        if (limit != null) r'limit': limit,
        if (offset != null) r'offset': offset,
        if (schedule_type != null) r'schedule_type': schedule_type,
        if (tags != null) r'tags': tags,
      });

  Variables$Query$get_event_by_category._(this._$data);

  factory Variables$Query$get_event_by_category.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('categories1')) {
      final l$categories1 = data['categories1'];
      result$data['categories1'] =
          (l$categories1 as List<dynamic>?)?.map((e) => (e as String)).toList();
    }
    if (data.containsKey('limit')) {
      final l$limit = data['limit'];
      result$data['limit'] = (l$limit as int?);
    }
    if (data.containsKey('offset')) {
      final l$offset = data['offset'];
      result$data['offset'] = (l$offset as int?);
    }
    if (data.containsKey('schedule_type')) {
      final l$schedule_type = data['schedule_type'];
      result$data['schedule_type'] = (l$schedule_type as List<dynamic>?)
          ?.map((e) => (e as String))
          .toList();
    }
    if (data.containsKey('tags')) {
      final l$tags = data['tags'];
      result$data['tags'] =
          (l$tags as List<dynamic>?)?.map((e) => (e as String)).toList();
    }
    return Variables$Query$get_event_by_category._(result$data);
  }

  Map<String, dynamic> _$data;

  List<String>? get categories1 => (_$data['categories1'] as List<String>?);
  int? get limit => (_$data['limit'] as int?);
  int? get offset => (_$data['offset'] as int?);
  List<String>? get schedule_type => (_$data['schedule_type'] as List<String>?);
  List<String>? get tags => (_$data['tags'] as List<String>?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('categories1')) {
      final l$categories1 = categories1;
      result$data['categories1'] = l$categories1?.map((e) => e).toList();
    }
    if (_$data.containsKey('limit')) {
      final l$limit = limit;
      result$data['limit'] = l$limit;
    }
    if (_$data.containsKey('offset')) {
      final l$offset = offset;
      result$data['offset'] = l$offset;
    }
    if (_$data.containsKey('schedule_type')) {
      final l$schedule_type = schedule_type;
      result$data['schedule_type'] = l$schedule_type?.map((e) => e).toList();
    }
    if (_$data.containsKey('tags')) {
      final l$tags = tags;
      result$data['tags'] = l$tags?.map((e) => e).toList();
    }
    return result$data;
  }

  CopyWith$Variables$Query$get_event_by_category<
          Variables$Query$get_event_by_category>
      get copyWith => CopyWith$Variables$Query$get_event_by_category(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$get_event_by_category) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$categories1 = categories1;
    final lOther$categories1 = other.categories1;
    if (_$data.containsKey('categories1') !=
        other._$data.containsKey('categories1')) {
      return false;
    }
    if (l$categories1 != null && lOther$categories1 != null) {
      if (l$categories1.length != lOther$categories1.length) {
        return false;
      }
      for (int i = 0; i < l$categories1.length; i++) {
        final l$categories1$entry = l$categories1[i];
        final lOther$categories1$entry = lOther$categories1[i];
        if (l$categories1$entry != lOther$categories1$entry) {
          return false;
        }
      }
    } else if (l$categories1 != lOther$categories1) {
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
    final l$schedule_type = schedule_type;
    final lOther$schedule_type = other.schedule_type;
    if (_$data.containsKey('schedule_type') !=
        other._$data.containsKey('schedule_type')) {
      return false;
    }
    if (l$schedule_type != null && lOther$schedule_type != null) {
      if (l$schedule_type.length != lOther$schedule_type.length) {
        return false;
      }
      for (int i = 0; i < l$schedule_type.length; i++) {
        final l$schedule_type$entry = l$schedule_type[i];
        final lOther$schedule_type$entry = lOther$schedule_type[i];
        if (l$schedule_type$entry != lOther$schedule_type$entry) {
          return false;
        }
      }
    } else if (l$schedule_type != lOther$schedule_type) {
      return false;
    }
    final l$tags = tags;
    final lOther$tags = other.tags;
    if (_$data.containsKey('tags') != other._$data.containsKey('tags')) {
      return false;
    }
    if (l$tags != null && lOther$tags != null) {
      if (l$tags.length != lOther$tags.length) {
        return false;
      }
      for (int i = 0; i < l$tags.length; i++) {
        final l$tags$entry = l$tags[i];
        final lOther$tags$entry = lOther$tags[i];
        if (l$tags$entry != lOther$tags$entry) {
          return false;
        }
      }
    } else if (l$tags != lOther$tags) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$categories1 = categories1;
    final l$limit = limit;
    final l$offset = offset;
    final l$schedule_type = schedule_type;
    final l$tags = tags;
    return Object.hashAll([
      _$data.containsKey('categories1')
          ? l$categories1 == null
              ? null
              : Object.hashAll(l$categories1.map((v) => v))
          : const {},
      _$data.containsKey('limit') ? l$limit : const {},
      _$data.containsKey('offset') ? l$offset : const {},
      _$data.containsKey('schedule_type')
          ? l$schedule_type == null
              ? null
              : Object.hashAll(l$schedule_type.map((v) => v))
          : const {},
      _$data.containsKey('tags')
          ? l$tags == null
              ? null
              : Object.hashAll(l$tags.map((v) => v))
          : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$get_event_by_category<TRes> {
  factory CopyWith$Variables$Query$get_event_by_category(
    Variables$Query$get_event_by_category instance,
    TRes Function(Variables$Query$get_event_by_category) then,
  ) = _CopyWithImpl$Variables$Query$get_event_by_category;

  factory CopyWith$Variables$Query$get_event_by_category.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$get_event_by_category;

  TRes call({
    List<String>? categories1,
    int? limit,
    int? offset,
    List<String>? schedule_type,
    List<String>? tags,
  });
}

class _CopyWithImpl$Variables$Query$get_event_by_category<TRes>
    implements CopyWith$Variables$Query$get_event_by_category<TRes> {
  _CopyWithImpl$Variables$Query$get_event_by_category(
    this._instance,
    this._then,
  );

  final Variables$Query$get_event_by_category _instance;

  final TRes Function(Variables$Query$get_event_by_category) _then;

  static const _undefined = {};

  TRes call({
    Object? categories1 = _undefined,
    Object? limit = _undefined,
    Object? offset = _undefined,
    Object? schedule_type = _undefined,
    Object? tags = _undefined,
  }) =>
      _then(Variables$Query$get_event_by_category._({
        ..._instance._$data,
        if (categories1 != _undefined)
          'categories1': (categories1 as List<String>?),
        if (limit != _undefined) 'limit': (limit as int?),
        if (offset != _undefined) 'offset': (offset as int?),
        if (schedule_type != _undefined)
          'schedule_type': (schedule_type as List<String>?),
        if (tags != _undefined) 'tags': (tags as List<String>?),
      }));
}

class _CopyWithStubImpl$Variables$Query$get_event_by_category<TRes>
    implements CopyWith$Variables$Query$get_event_by_category<TRes> {
  _CopyWithStubImpl$Variables$Query$get_event_by_category(this._res);

  TRes _res;

  call({
    List<String>? categories1,
    int? limit,
    int? offset,
    List<String>? schedule_type,
    List<String>? tags,
  }) =>
      _res;
}

class Query$get_event_by_category {
  Query$get_event_by_category({
    required this.business_event,
    required this.$__typename,
  });

  factory Query$get_event_by_category.fromJson(Map<String, dynamic> json) {
    final l$business_event = json['business_event'];
    final l$$__typename = json['__typename'];
    return Query$get_event_by_category(
      business_event: (l$business_event as List<dynamic>)
          .map((e) => Query$get_event_by_category$business_event.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$get_event_by_category$business_event> business_event;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$business_event = business_event;
    _resultData['business_event'] =
        l$business_event.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$business_event = business_event;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$business_event.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_event_by_category) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$business_event = business_event;
    final lOther$business_event = other.business_event;
    if (l$business_event.length != lOther$business_event.length) {
      return false;
    }
    for (int i = 0; i < l$business_event.length; i++) {
      final l$business_event$entry = l$business_event[i];
      final lOther$business_event$entry = lOther$business_event[i];
      if (l$business_event$entry != lOther$business_event$entry) {
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

extension UtilityExtension$Query$get_event_by_category
    on Query$get_event_by_category {
  CopyWith$Query$get_event_by_category<Query$get_event_by_category>
      get copyWith => CopyWith$Query$get_event_by_category(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_event_by_category<TRes> {
  factory CopyWith$Query$get_event_by_category(
    Query$get_event_by_category instance,
    TRes Function(Query$get_event_by_category) then,
  ) = _CopyWithImpl$Query$get_event_by_category;

  factory CopyWith$Query$get_event_by_category.stub(TRes res) =
      _CopyWithStubImpl$Query$get_event_by_category;

  TRes call({
    List<Query$get_event_by_category$business_event>? business_event,
    String? $__typename,
  });
  TRes business_event(
      Iterable<Query$get_event_by_category$business_event> Function(
              Iterable<
                  CopyWith$Query$get_event_by_category$business_event<
                      Query$get_event_by_category$business_event>>)
          _fn);
}

class _CopyWithImpl$Query$get_event_by_category<TRes>
    implements CopyWith$Query$get_event_by_category<TRes> {
  _CopyWithImpl$Query$get_event_by_category(
    this._instance,
    this._then,
  );

  final Query$get_event_by_category _instance;

  final TRes Function(Query$get_event_by_category) _then;

  static const _undefined = {};

  TRes call({
    Object? business_event = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_event_by_category(
        business_event: business_event == _undefined || business_event == null
            ? _instance.business_event
            : (business_event
                as List<Query$get_event_by_category$business_event>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes business_event(
          Iterable<Query$get_event_by_category$business_event> Function(
                  Iterable<
                      CopyWith$Query$get_event_by_category$business_event<
                          Query$get_event_by_category$business_event>>)
              _fn) =>
      call(
          business_event: _fn(_instance.business_event
              .map((e) => CopyWith$Query$get_event_by_category$business_event(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$get_event_by_category<TRes>
    implements CopyWith$Query$get_event_by_category<TRes> {
  _CopyWithStubImpl$Query$get_event_by_category(this._res);

  TRes _res;

  call({
    List<Query$get_event_by_category$business_event>? business_event,
    String? $__typename,
  }) =>
      _res;
  business_event(_fn) => _res;
}

const documentNodeQueryget_event_by_category = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'get_event_by_category'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'categories1')),
        type: ListTypeNode(
          type: NamedTypeNode(
            name: NameNode(value: 'String'),
            isNonNull: true,
          ),
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
        variable: VariableNode(name: NameNode(value: 'schedule_type')),
        type: ListTypeNode(
          type: NamedTypeNode(
            name: NameNode(value: 'String'),
            isNonNull: true,
          ),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'tags')),
        type: ListTypeNode(
          type: NamedTypeNode(
            name: NameNode(value: 'String'),
            isNonNull: true,
          ),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'business_event'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: '_and'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: 'details'),
                    value: ObjectValueNode(fields: [
                      ObjectFieldNode(
                        name: NameNode(value: '_and'),
                        value: ObjectValueNode(fields: [
                          ObjectFieldNode(
                            name: NameNode(value: 'category1'),
                            value: ObjectValueNode(fields: [
                              ObjectFieldNode(
                                name: NameNode(value: '_in'),
                                value: VariableNode(
                                    name: NameNode(value: 'categories1')),
                              )
                            ]),
                          ),
                          ObjectFieldNode(
                            name: NameNode(value: 'tags'),
                            value: ObjectValueNode(fields: [
                              ObjectFieldNode(
                                name: NameNode(value: '_has_keys_all'),
                                value:
                                    VariableNode(name: NameNode(value: 'tags')),
                              )
                            ]),
                          ),
                        ]),
                      )
                    ]),
                  ),
                  ObjectFieldNode(
                    name: NameNode(value: 'schedule_type'),
                    value: ObjectValueNode(fields: [
                      ObjectFieldNode(
                        name: NameNode(value: '_in'),
                        value: VariableNode(
                            name: NameNode(value: 'schedule_type')),
                      )
                    ]),
                  ),
                ]),
              )
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
                name: NameNode(value: 'additional_parameters'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'available'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'category1'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'cost'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'tags'),
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
                name: NameNode(value: 'position'),
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
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'gps_location'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'schedule_type'),
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
            name: NameNode(value: 'time'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'business'),
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
                    name: NameNode(value: 'name'),
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
Query$get_event_by_category _parserFn$Query$get_event_by_category(
        Map<String, dynamic> data) =>
    Query$get_event_by_category.fromJson(data);

class Options$Query$get_event_by_category
    extends graphql.QueryOptions<Query$get_event_by_category> {
  Options$Query$get_event_by_category({
    String? operationName,
    Variables$Query$get_event_by_category? variables,
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
          document: documentNodeQueryget_event_by_category,
          parserFn: _parserFn$Query$get_event_by_category,
        );
}

class WatchOptions$Query$get_event_by_category
    extends graphql.WatchQueryOptions<Query$get_event_by_category> {
  WatchOptions$Query$get_event_by_category({
    String? operationName,
    Variables$Query$get_event_by_category? variables,
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
          document: documentNodeQueryget_event_by_category,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$get_event_by_category,
        );
}

class FetchMoreOptions$Query$get_event_by_category
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$get_event_by_category({
    required graphql.UpdateQuery updateQuery,
    Variables$Query$get_event_by_category? variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables?.toJson() ?? {},
          document: documentNodeQueryget_event_by_category,
        );
}

extension ClientExtension$Query$get_event_by_category on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$get_event_by_category>>
      query$get_event_by_category(
              [Options$Query$get_event_by_category? options]) async =>
          await this.query(options ?? Options$Query$get_event_by_category());
  graphql.ObservableQuery<
      Query$get_event_by_category> watchQuery$get_event_by_category(
          [WatchOptions$Query$get_event_by_category? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$get_event_by_category());
  void writeQuery$get_event_by_category({
    required Query$get_event_by_category data,
    Variables$Query$get_event_by_category? variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryget_event_by_category),
          variables: variables?.toJson() ?? const {},
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$get_event_by_category? readQuery$get_event_by_category({
    Variables$Query$get_event_by_category? variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQueryget_event_by_category),
        variables: variables?.toJson() ?? const {},
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$get_event_by_category.fromJson(result);
  }
}

class Query$get_event_by_category$business_event {
  Query$get_event_by_category$business_event({
    required this.details,
    required this.id,
    this.gps_location,
    required this.schedule_type,
    this.schedule,
    this.time,
    required this.business,
    required this.$__typename,
  });

  factory Query$get_event_by_category$business_event.fromJson(
      Map<String, dynamic> json) {
    final l$details = json['details'];
    final l$id = json['id'];
    final l$gps_location = json['gps_location'];
    final l$schedule_type = json['schedule_type'];
    final l$schedule = json['schedule'];
    final l$time = json['time'];
    final l$business = json['business'];
    final l$$__typename = json['__typename'];
    return Query$get_event_by_category$business_event(
      details: Query$get_event_by_category$business_event$details.fromJson(
          (l$details as Map<String, dynamic>)),
      id: (l$id as int),
      gps_location:
          l$gps_location == null ? null : geographyFromJson(l$gps_location),
      schedule_type: (l$schedule_type as String),
      schedule: l$schedule == null ? null : mapFromJson(l$schedule),
      time: (l$time as String?),
      business: Query$get_event_by_category$business_event$business.fromJson(
          (l$business as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$get_event_by_category$business_event$details details;

  final int id;

  final Geography? gps_location;

  final String schedule_type;

  final dynamic? schedule;

  final String? time;

  final Query$get_event_by_category$business_event$business business;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$details = details;
    _resultData['details'] = l$details.toJson();
    final l$id = id;
    _resultData['id'] = l$id;
    final l$gps_location = gps_location;
    _resultData['gps_location'] =
        l$gps_location == null ? null : geographyToJson(l$gps_location);
    final l$schedule_type = schedule_type;
    _resultData['schedule_type'] = l$schedule_type;
    final l$schedule = schedule;
    _resultData['schedule'] = l$schedule == null ? null : mapToJson(l$schedule);
    final l$time = time;
    _resultData['time'] = l$time;
    final l$business = business;
    _resultData['business'] = l$business.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$details = details;
    final l$id = id;
    final l$gps_location = gps_location;
    final l$schedule_type = schedule_type;
    final l$schedule = schedule;
    final l$time = time;
    final l$business = business;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$details,
      l$id,
      l$gps_location,
      l$schedule_type,
      l$schedule,
      l$time,
      l$business,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_event_by_category$business_event) ||
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
    final l$gps_location = gps_location;
    final lOther$gps_location = other.gps_location;
    if (l$gps_location != lOther$gps_location) {
      return false;
    }
    final l$schedule_type = schedule_type;
    final lOther$schedule_type = other.schedule_type;
    if (l$schedule_type != lOther$schedule_type) {
      return false;
    }
    final l$schedule = schedule;
    final lOther$schedule = other.schedule;
    if (l$schedule != lOther$schedule) {
      return false;
    }
    final l$time = time;
    final lOther$time = other.time;
    if (l$time != lOther$time) {
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

extension UtilityExtension$Query$get_event_by_category$business_event
    on Query$get_event_by_category$business_event {
  CopyWith$Query$get_event_by_category$business_event<
          Query$get_event_by_category$business_event>
      get copyWith => CopyWith$Query$get_event_by_category$business_event(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_event_by_category$business_event<TRes> {
  factory CopyWith$Query$get_event_by_category$business_event(
    Query$get_event_by_category$business_event instance,
    TRes Function(Query$get_event_by_category$business_event) then,
  ) = _CopyWithImpl$Query$get_event_by_category$business_event;

  factory CopyWith$Query$get_event_by_category$business_event.stub(TRes res) =
      _CopyWithStubImpl$Query$get_event_by_category$business_event;

  TRes call({
    Query$get_event_by_category$business_event$details? details,
    int? id,
    Geography? gps_location,
    String? schedule_type,
    dynamic? schedule,
    String? time,
    Query$get_event_by_category$business_event$business? business,
    String? $__typename,
  });
  CopyWith$Query$get_event_by_category$business_event$details<TRes> get details;
  CopyWith$Query$get_event_by_category$business_event$business<TRes>
      get business;
}

class _CopyWithImpl$Query$get_event_by_category$business_event<TRes>
    implements CopyWith$Query$get_event_by_category$business_event<TRes> {
  _CopyWithImpl$Query$get_event_by_category$business_event(
    this._instance,
    this._then,
  );

  final Query$get_event_by_category$business_event _instance;

  final TRes Function(Query$get_event_by_category$business_event) _then;

  static const _undefined = {};

  TRes call({
    Object? details = _undefined,
    Object? id = _undefined,
    Object? gps_location = _undefined,
    Object? schedule_type = _undefined,
    Object? schedule = _undefined,
    Object? time = _undefined,
    Object? business = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_event_by_category$business_event(
        details: details == _undefined || details == null
            ? _instance.details
            : (details as Query$get_event_by_category$business_event$details),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        gps_location: gps_location == _undefined
            ? _instance.gps_location
            : (gps_location as Geography?),
        schedule_type: schedule_type == _undefined || schedule_type == null
            ? _instance.schedule_type
            : (schedule_type as String),
        schedule: schedule == _undefined
            ? _instance.schedule
            : (schedule as dynamic?),
        time: time == _undefined ? _instance.time : (time as String?),
        business: business == _undefined || business == null
            ? _instance.business
            : (business as Query$get_event_by_category$business_event$business),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_event_by_category$business_event$details<TRes>
      get details {
    final local$details = _instance.details;
    return CopyWith$Query$get_event_by_category$business_event$details(
        local$details, (e) => call(details: e));
  }

  CopyWith$Query$get_event_by_category$business_event$business<TRes>
      get business {
    final local$business = _instance.business;
    return CopyWith$Query$get_event_by_category$business_event$business(
        local$business, (e) => call(business: e));
  }
}

class _CopyWithStubImpl$Query$get_event_by_category$business_event<TRes>
    implements CopyWith$Query$get_event_by_category$business_event<TRes> {
  _CopyWithStubImpl$Query$get_event_by_category$business_event(this._res);

  TRes _res;

  call({
    Query$get_event_by_category$business_event$details? details,
    int? id,
    Geography? gps_location,
    String? schedule_type,
    dynamic? schedule,
    String? time,
    Query$get_event_by_category$business_event$business? business,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_event_by_category$business_event$details<TRes>
      get details =>
          CopyWith$Query$get_event_by_category$business_event$details.stub(
              _res);
  CopyWith$Query$get_event_by_category$business_event$business<TRes>
      get business =>
          CopyWith$Query$get_event_by_category$business_event$business.stub(
              _res);
}

class Query$get_event_by_category$business_event$details {
  Query$get_event_by_category$business_event$details({
    required this.id,
    required this.name,
    this.additional_parameters,
    required this.available,
    required this.category1,
    required this.cost,
    this.tags,
    this.image,
    required this.position,
    required this.$__typename,
  });

  factory Query$get_event_by_category$business_event$details.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$additional_parameters = json['additional_parameters'];
    final l$available = json['available'];
    final l$category1 = json['category1'];
    final l$cost = json['cost'];
    final l$tags = json['tags'];
    final l$image = json['image'];
    final l$position = json['position'];
    final l$$__typename = json['__typename'];
    return Query$get_event_by_category$business_event$details(
      id: (l$id as int),
      name: Query$get_event_by_category$business_event$details$name.fromJson(
          (l$name as Map<String, dynamic>)),
      additional_parameters: l$additional_parameters == null
          ? null
          : mapFromJson(l$additional_parameters),
      available: (l$available as bool),
      category1: (l$category1 as String),
      cost: mapFromJson(l$cost),
      tags: l$tags == null ? null : mapFromJson(l$tags),
      image: l$image == null ? null : mapFromJson(l$image),
      position: (l$position as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final Query$get_event_by_category$business_event$details$name name;

  final dynamic? additional_parameters;

  final bool available;

  final String category1;

  final dynamic cost;

  final dynamic? tags;

  final dynamic? image;

  final int position;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name.toJson();
    final l$additional_parameters = additional_parameters;
    _resultData['additional_parameters'] = l$additional_parameters == null
        ? null
        : mapToJson(l$additional_parameters);
    final l$available = available;
    _resultData['available'] = l$available;
    final l$category1 = category1;
    _resultData['category1'] = l$category1;
    final l$cost = cost;
    _resultData['cost'] = mapToJson(l$cost);
    final l$tags = tags;
    _resultData['tags'] = l$tags == null ? null : mapToJson(l$tags);
    final l$image = image;
    _resultData['image'] = l$image == null ? null : mapToJson(l$image);
    final l$position = position;
    _resultData['position'] = l$position;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$additional_parameters = additional_parameters;
    final l$available = available;
    final l$category1 = category1;
    final l$cost = cost;
    final l$tags = tags;
    final l$image = image;
    final l$position = position;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$additional_parameters,
      l$available,
      l$category1,
      l$cost,
      l$tags,
      l$image,
      l$position,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_event_by_category$business_event$details) ||
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
    final l$additional_parameters = additional_parameters;
    final lOther$additional_parameters = other.additional_parameters;
    if (l$additional_parameters != lOther$additional_parameters) {
      return false;
    }
    final l$available = available;
    final lOther$available = other.available;
    if (l$available != lOther$available) {
      return false;
    }
    final l$category1 = category1;
    final lOther$category1 = other.category1;
    if (l$category1 != lOther$category1) {
      return false;
    }
    final l$cost = cost;
    final lOther$cost = other.cost;
    if (l$cost != lOther$cost) {
      return false;
    }
    final l$tags = tags;
    final lOther$tags = other.tags;
    if (l$tags != lOther$tags) {
      return false;
    }
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) {
      return false;
    }
    final l$position = position;
    final lOther$position = other.position;
    if (l$position != lOther$position) {
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

extension UtilityExtension$Query$get_event_by_category$business_event$details
    on Query$get_event_by_category$business_event$details {
  CopyWith$Query$get_event_by_category$business_event$details<
          Query$get_event_by_category$business_event$details>
      get copyWith =>
          CopyWith$Query$get_event_by_category$business_event$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_event_by_category$business_event$details<
    TRes> {
  factory CopyWith$Query$get_event_by_category$business_event$details(
    Query$get_event_by_category$business_event$details instance,
    TRes Function(Query$get_event_by_category$business_event$details) then,
  ) = _CopyWithImpl$Query$get_event_by_category$business_event$details;

  factory CopyWith$Query$get_event_by_category$business_event$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_event_by_category$business_event$details;

  TRes call({
    int? id,
    Query$get_event_by_category$business_event$details$name? name,
    dynamic? additional_parameters,
    bool? available,
    String? category1,
    dynamic? cost,
    dynamic? tags,
    dynamic? image,
    int? position,
    String? $__typename,
  });
  CopyWith$Query$get_event_by_category$business_event$details$name<TRes>
      get name;
}

class _CopyWithImpl$Query$get_event_by_category$business_event$details<TRes>
    implements
        CopyWith$Query$get_event_by_category$business_event$details<TRes> {
  _CopyWithImpl$Query$get_event_by_category$business_event$details(
    this._instance,
    this._then,
  );

  final Query$get_event_by_category$business_event$details _instance;

  final TRes Function(Query$get_event_by_category$business_event$details) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? additional_parameters = _undefined,
    Object? available = _undefined,
    Object? category1 = _undefined,
    Object? cost = _undefined,
    Object? tags = _undefined,
    Object? image = _undefined,
    Object? position = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_event_by_category$business_event$details(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as Query$get_event_by_category$business_event$details$name),
        additional_parameters: additional_parameters == _undefined
            ? _instance.additional_parameters
            : (additional_parameters as dynamic?),
        available: available == _undefined || available == null
            ? _instance.available
            : (available as bool),
        category1: category1 == _undefined || category1 == null
            ? _instance.category1
            : (category1 as String),
        cost: cost == _undefined || cost == null
            ? _instance.cost
            : (cost as dynamic),
        tags: tags == _undefined ? _instance.tags : (tags as dynamic?),
        image: image == _undefined ? _instance.image : (image as dynamic?),
        position: position == _undefined || position == null
            ? _instance.position
            : (position as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_event_by_category$business_event$details$name<TRes>
      get name {
    final local$name = _instance.name;
    return CopyWith$Query$get_event_by_category$business_event$details$name(
        local$name, (e) => call(name: e));
  }
}

class _CopyWithStubImpl$Query$get_event_by_category$business_event$details<TRes>
    implements
        CopyWith$Query$get_event_by_category$business_event$details<TRes> {
  _CopyWithStubImpl$Query$get_event_by_category$business_event$details(
      this._res);

  TRes _res;

  call({
    int? id,
    Query$get_event_by_category$business_event$details$name? name,
    dynamic? additional_parameters,
    bool? available,
    String? category1,
    dynamic? cost,
    dynamic? tags,
    dynamic? image,
    int? position,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_event_by_category$business_event$details$name<TRes>
      get name =>
          CopyWith$Query$get_event_by_category$business_event$details$name.stub(
              _res);
}

class Query$get_event_by_category$business_event$details$name {
  Query$get_event_by_category$business_event$details$name({
    required this.translations,
    required this.$__typename,
  });

  factory Query$get_event_by_category$business_event$details$name.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$get_event_by_category$business_event$details$name(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$get_event_by_category$business_event$details$name$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Query$get_event_by_category$business_event$details$name$translations>
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
    if (!(other is Query$get_event_by_category$business_event$details$name) ||
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

extension UtilityExtension$Query$get_event_by_category$business_event$details$name
    on Query$get_event_by_category$business_event$details$name {
  CopyWith$Query$get_event_by_category$business_event$details$name<
          Query$get_event_by_category$business_event$details$name>
      get copyWith =>
          CopyWith$Query$get_event_by_category$business_event$details$name(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_event_by_category$business_event$details$name<
    TRes> {
  factory CopyWith$Query$get_event_by_category$business_event$details$name(
    Query$get_event_by_category$business_event$details$name instance,
    TRes Function(Query$get_event_by_category$business_event$details$name) then,
  ) = _CopyWithImpl$Query$get_event_by_category$business_event$details$name;

  factory CopyWith$Query$get_event_by_category$business_event$details$name.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_event_by_category$business_event$details$name;

  TRes call({
    List<Query$get_event_by_category$business_event$details$name$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$get_event_by_category$business_event$details$name$translations> Function(
              Iterable<
                  CopyWith$Query$get_event_by_category$business_event$details$name$translations<
                      Query$get_event_by_category$business_event$details$name$translations>>)
          _fn);
}

class _CopyWithImpl$Query$get_event_by_category$business_event$details$name<
        TRes>
    implements
        CopyWith$Query$get_event_by_category$business_event$details$name<TRes> {
  _CopyWithImpl$Query$get_event_by_category$business_event$details$name(
    this._instance,
    this._then,
  );

  final Query$get_event_by_category$business_event$details$name _instance;

  final TRes Function(Query$get_event_by_category$business_event$details$name)
      _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_event_by_category$business_event$details$name(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$get_event_by_category$business_event$details$name$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$get_event_by_category$business_event$details$name$translations> Function(
                  Iterable<
                      CopyWith$Query$get_event_by_category$business_event$details$name$translations<
                          Query$get_event_by_category$business_event$details$name$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$get_event_by_category$business_event$details$name$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$get_event_by_category$business_event$details$name<
        TRes>
    implements
        CopyWith$Query$get_event_by_category$business_event$details$name<TRes> {
  _CopyWithStubImpl$Query$get_event_by_category$business_event$details$name(
      this._res);

  TRes _res;

  call({
    List<Query$get_event_by_category$business_event$details$name$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$get_event_by_category$business_event$details$name$translations {
  Query$get_event_by_category$business_event$details$name$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$get_event_by_category$business_event$details$name$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$get_event_by_category$business_event$details$name$translations(
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
            is Query$get_event_by_category$business_event$details$name$translations) ||
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

extension UtilityExtension$Query$get_event_by_category$business_event$details$name$translations
    on Query$get_event_by_category$business_event$details$name$translations {
  CopyWith$Query$get_event_by_category$business_event$details$name$translations<
          Query$get_event_by_category$business_event$details$name$translations>
      get copyWith =>
          CopyWith$Query$get_event_by_category$business_event$details$name$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_event_by_category$business_event$details$name$translations<
    TRes> {
  factory CopyWith$Query$get_event_by_category$business_event$details$name$translations(
    Query$get_event_by_category$business_event$details$name$translations
        instance,
    TRes Function(
            Query$get_event_by_category$business_event$details$name$translations)
        then,
  ) = _CopyWithImpl$Query$get_event_by_category$business_event$details$name$translations;

  factory CopyWith$Query$get_event_by_category$business_event$details$name$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_event_by_category$business_event$details$name$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_event_by_category$business_event$details$name$translations<
        TRes>
    implements
        CopyWith$Query$get_event_by_category$business_event$details$name$translations<
            TRes> {
  _CopyWithImpl$Query$get_event_by_category$business_event$details$name$translations(
    this._instance,
    this._then,
  );

  final Query$get_event_by_category$business_event$details$name$translations
      _instance;

  final TRes Function(
          Query$get_event_by_category$business_event$details$name$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_event_by_category$business_event$details$name$translations(
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

class _CopyWithStubImpl$Query$get_event_by_category$business_event$details$name$translations<
        TRes>
    implements
        CopyWith$Query$get_event_by_category$business_event$details$name$translations<
            TRes> {
  _CopyWithStubImpl$Query$get_event_by_category$business_event$details$name$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Query$get_event_by_category$business_event$business {
  Query$get_event_by_category$business_event$business({
    required this.id,
    required this.details,
    required this.$__typename,
  });

  factory Query$get_event_by_category$business_event$business.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Query$get_event_by_category$business_event$business(
      id: (l$id as int),
      details:
          Query$get_event_by_category$business_event$business$details.fromJson(
              (l$details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final Query$get_event_by_category$business_event$business$details details;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$details = details;
    _resultData['details'] = l$details.toJson();
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
    if (!(other is Query$get_event_by_category$business_event$business) ||
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

extension UtilityExtension$Query$get_event_by_category$business_event$business
    on Query$get_event_by_category$business_event$business {
  CopyWith$Query$get_event_by_category$business_event$business<
          Query$get_event_by_category$business_event$business>
      get copyWith =>
          CopyWith$Query$get_event_by_category$business_event$business(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_event_by_category$business_event$business<
    TRes> {
  factory CopyWith$Query$get_event_by_category$business_event$business(
    Query$get_event_by_category$business_event$business instance,
    TRes Function(Query$get_event_by_category$business_event$business) then,
  ) = _CopyWithImpl$Query$get_event_by_category$business_event$business;

  factory CopyWith$Query$get_event_by_category$business_event$business.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_event_by_category$business_event$business;

  TRes call({
    int? id,
    Query$get_event_by_category$business_event$business$details? details,
    String? $__typename,
  });
  CopyWith$Query$get_event_by_category$business_event$business$details<TRes>
      get details;
}

class _CopyWithImpl$Query$get_event_by_category$business_event$business<TRes>
    implements
        CopyWith$Query$get_event_by_category$business_event$business<TRes> {
  _CopyWithImpl$Query$get_event_by_category$business_event$business(
    this._instance,
    this._then,
  );

  final Query$get_event_by_category$business_event$business _instance;

  final TRes Function(Query$get_event_by_category$business_event$business)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_event_by_category$business_event$business(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        details: details == _undefined || details == null
            ? _instance.details
            : (details
                as Query$get_event_by_category$business_event$business$details),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_event_by_category$business_event$business$details<TRes>
      get details {
    final local$details = _instance.details;
    return CopyWith$Query$get_event_by_category$business_event$business$details(
        local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Query$get_event_by_category$business_event$business<
        TRes>
    implements
        CopyWith$Query$get_event_by_category$business_event$business<TRes> {
  _CopyWithStubImpl$Query$get_event_by_category$business_event$business(
      this._res);

  TRes _res;

  call({
    int? id,
    Query$get_event_by_category$business_event$business$details? details,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_event_by_category$business_event$business$details<TRes>
      get details =>
          CopyWith$Query$get_event_by_category$business_event$business$details
              .stub(_res);
}

class Query$get_event_by_category$business_event$business$details {
  Query$get_event_by_category$business_event$business$details({
    required this.id,
    required this.name,
    required this.location,
    required this.$__typename,
  });

  factory Query$get_event_by_category$business_event$business$details.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$location = json['location'];
    final l$$__typename = json['__typename'];
    return Query$get_event_by_category$business_event$business$details(
      id: (l$id as int),
      name: (l$name as String),
      location:
          Query$get_event_by_category$business_event$business$details$location
              .fromJson((l$location as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String name;

  final Query$get_event_by_category$business_event$business$details$location
      location;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$location = location;
    _resultData['location'] = l$location.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$location = location;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$location,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$get_event_by_category$business_event$business$details) ||
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

extension UtilityExtension$Query$get_event_by_category$business_event$business$details
    on Query$get_event_by_category$business_event$business$details {
  CopyWith$Query$get_event_by_category$business_event$business$details<
          Query$get_event_by_category$business_event$business$details>
      get copyWith =>
          CopyWith$Query$get_event_by_category$business_event$business$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_event_by_category$business_event$business$details<
    TRes> {
  factory CopyWith$Query$get_event_by_category$business_event$business$details(
    Query$get_event_by_category$business_event$business$details instance,
    TRes Function(Query$get_event_by_category$business_event$business$details)
        then,
  ) = _CopyWithImpl$Query$get_event_by_category$business_event$business$details;

  factory CopyWith$Query$get_event_by_category$business_event$business$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_event_by_category$business_event$business$details;

  TRes call({
    int? id,
    String? name,
    Query$get_event_by_category$business_event$business$details$location?
        location,
    String? $__typename,
  });
  CopyWith$Query$get_event_by_category$business_event$business$details$location<
      TRes> get location;
}

class _CopyWithImpl$Query$get_event_by_category$business_event$business$details<
        TRes>
    implements
        CopyWith$Query$get_event_by_category$business_event$business$details<
            TRes> {
  _CopyWithImpl$Query$get_event_by_category$business_event$business$details(
    this._instance,
    this._then,
  );

  final Query$get_event_by_category$business_event$business$details _instance;

  final TRes Function(
      Query$get_event_by_category$business_event$business$details) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? location = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_event_by_category$business_event$business$details(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        location: location == _undefined || location == null
            ? _instance.location
            : (location
                as Query$get_event_by_category$business_event$business$details$location),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_event_by_category$business_event$business$details$location<
      TRes> get location {
    final local$location = _instance.location;
    return CopyWith$Query$get_event_by_category$business_event$business$details$location(
        local$location, (e) => call(location: e));
  }
}

class _CopyWithStubImpl$Query$get_event_by_category$business_event$business$details<
        TRes>
    implements
        CopyWith$Query$get_event_by_category$business_event$business$details<
            TRes> {
  _CopyWithStubImpl$Query$get_event_by_category$business_event$business$details(
      this._res);

  TRes _res;

  call({
    int? id,
    String? name,
    Query$get_event_by_category$business_event$business$details$location?
        location,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_event_by_category$business_event$business$details$location<
          TRes>
      get location =>
          CopyWith$Query$get_event_by_category$business_event$business$details$location
              .stub(_res);
}

class Query$get_event_by_category$business_event$business$details$location {
  Query$get_event_by_category$business_event$business$details$location({
    required this.gps,
    required this.address,
    required this.$__typename,
  });

  factory Query$get_event_by_category$business_event$business$details$location.fromJson(
      Map<String, dynamic> json) {
    final l$gps = json['gps'];
    final l$address = json['address'];
    final l$$__typename = json['__typename'];
    return Query$get_event_by_category$business_event$business$details$location(
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
            is Query$get_event_by_category$business_event$business$details$location) ||
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

extension UtilityExtension$Query$get_event_by_category$business_event$business$details$location
    on Query$get_event_by_category$business_event$business$details$location {
  CopyWith$Query$get_event_by_category$business_event$business$details$location<
          Query$get_event_by_category$business_event$business$details$location>
      get copyWith =>
          CopyWith$Query$get_event_by_category$business_event$business$details$location(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_event_by_category$business_event$business$details$location<
    TRes> {
  factory CopyWith$Query$get_event_by_category$business_event$business$details$location(
    Query$get_event_by_category$business_event$business$details$location
        instance,
    TRes Function(
            Query$get_event_by_category$business_event$business$details$location)
        then,
  ) = _CopyWithImpl$Query$get_event_by_category$business_event$business$details$location;

  factory CopyWith$Query$get_event_by_category$business_event$business$details$location.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_event_by_category$business_event$business$details$location;

  TRes call({
    Geography? gps,
    String? address,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_event_by_category$business_event$business$details$location<
        TRes>
    implements
        CopyWith$Query$get_event_by_category$business_event$business$details$location<
            TRes> {
  _CopyWithImpl$Query$get_event_by_category$business_event$business$details$location(
    this._instance,
    this._then,
  );

  final Query$get_event_by_category$business_event$business$details$location
      _instance;

  final TRes Function(
          Query$get_event_by_category$business_event$business$details$location)
      _then;

  static const _undefined = {};

  TRes call({
    Object? gps = _undefined,
    Object? address = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_event_by_category$business_event$business$details$location(
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

class _CopyWithStubImpl$Query$get_event_by_category$business_event$business$details$location<
        TRes>
    implements
        CopyWith$Query$get_event_by_category$business_event$business$details$location<
            TRes> {
  _CopyWithStubImpl$Query$get_event_by_category$business_event$business$details$location(
      this._res);

  TRes _res;

  call({
    Geography? gps,
    String? address,
    String? $__typename,
  }) =>
      _res;
}
