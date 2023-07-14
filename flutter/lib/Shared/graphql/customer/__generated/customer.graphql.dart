import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';

class Variables$Mutation$set_customer_app_version {
  factory Variables$Mutation$set_customer_app_version({
    required int customer_id,
    required String version,
  }) =>
      Variables$Mutation$set_customer_app_version._({
        r'customer_id': customer_id,
        r'version': version,
      });

  Variables$Mutation$set_customer_app_version._(this._$data);

  factory Variables$Mutation$set_customer_app_version.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$customer_id = data['customer_id'];
    result$data['customer_id'] = (l$customer_id as int);
    final l$version = data['version'];
    result$data['version'] = (l$version as String);
    return Variables$Mutation$set_customer_app_version._(result$data);
  }

  Map<String, dynamic> _$data;

  int get customer_id => (_$data['customer_id'] as int);
  String get version => (_$data['version'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$customer_id = customer_id;
    result$data['customer_id'] = l$customer_id;
    final l$version = version;
    result$data['version'] = l$version;
    return result$data;
  }

  CopyWith$Variables$Mutation$set_customer_app_version<
          Variables$Mutation$set_customer_app_version>
      get copyWith => CopyWith$Variables$Mutation$set_customer_app_version(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$set_customer_app_version) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$customer_id = customer_id;
    final lOther$customer_id = other.customer_id;
    if (l$customer_id != lOther$customer_id) {
      return false;
    }
    final l$version = version;
    final lOther$version = other.version;
    if (l$version != lOther$version) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$customer_id = customer_id;
    final l$version = version;
    return Object.hashAll([
      l$customer_id,
      l$version,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$set_customer_app_version<TRes> {
  factory CopyWith$Variables$Mutation$set_customer_app_version(
    Variables$Mutation$set_customer_app_version instance,
    TRes Function(Variables$Mutation$set_customer_app_version) then,
  ) = _CopyWithImpl$Variables$Mutation$set_customer_app_version;

  factory CopyWith$Variables$Mutation$set_customer_app_version.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$set_customer_app_version;

  TRes call({
    int? customer_id,
    String? version,
  });
}

class _CopyWithImpl$Variables$Mutation$set_customer_app_version<TRes>
    implements CopyWith$Variables$Mutation$set_customer_app_version<TRes> {
  _CopyWithImpl$Variables$Mutation$set_customer_app_version(
    this._instance,
    this._then,
  );

  final Variables$Mutation$set_customer_app_version _instance;

  final TRes Function(Variables$Mutation$set_customer_app_version) _then;

  static const _undefined = {};

  TRes call({
    Object? customer_id = _undefined,
    Object? version = _undefined,
  }) =>
      _then(Variables$Mutation$set_customer_app_version._({
        ..._instance._$data,
        if (customer_id != _undefined && customer_id != null)
          'customer_id': (customer_id as int),
        if (version != _undefined && version != null)
          'version': (version as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$set_customer_app_version<TRes>
    implements CopyWith$Variables$Mutation$set_customer_app_version<TRes> {
  _CopyWithStubImpl$Variables$Mutation$set_customer_app_version(this._res);

  TRes _res;

  call({
    int? customer_id,
    String? version,
  }) =>
      _res;
}

class Mutation$set_customer_app_version {
  Mutation$set_customer_app_version({
    this.update_customer_customer_by_pk,
    required this.$__typename,
  });

  factory Mutation$set_customer_app_version.fromJson(
      Map<String, dynamic> json) {
    final l$update_customer_customer_by_pk =
        json['update_customer_customer_by_pk'];
    final l$$__typename = json['__typename'];
    return Mutation$set_customer_app_version(
      update_customer_customer_by_pk: l$update_customer_customer_by_pk == null
          ? null
          : Mutation$set_customer_app_version$update_customer_customer_by_pk
              .fromJson(
                  (l$update_customer_customer_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$set_customer_app_version$update_customer_customer_by_pk?
      update_customer_customer_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$update_customer_customer_by_pk = update_customer_customer_by_pk;
    _resultData['update_customer_customer_by_pk'] =
        l$update_customer_customer_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$update_customer_customer_by_pk = update_customer_customer_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$update_customer_customer_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$set_customer_app_version) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$update_customer_customer_by_pk = update_customer_customer_by_pk;
    final lOther$update_customer_customer_by_pk =
        other.update_customer_customer_by_pk;
    if (l$update_customer_customer_by_pk !=
        lOther$update_customer_customer_by_pk) {
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

extension UtilityExtension$Mutation$set_customer_app_version
    on Mutation$set_customer_app_version {
  CopyWith$Mutation$set_customer_app_version<Mutation$set_customer_app_version>
      get copyWith => CopyWith$Mutation$set_customer_app_version(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$set_customer_app_version<TRes> {
  factory CopyWith$Mutation$set_customer_app_version(
    Mutation$set_customer_app_version instance,
    TRes Function(Mutation$set_customer_app_version) then,
  ) = _CopyWithImpl$Mutation$set_customer_app_version;

  factory CopyWith$Mutation$set_customer_app_version.stub(TRes res) =
      _CopyWithStubImpl$Mutation$set_customer_app_version;

  TRes call({
    Mutation$set_customer_app_version$update_customer_customer_by_pk?
        update_customer_customer_by_pk,
    String? $__typename,
  });
  CopyWith$Mutation$set_customer_app_version$update_customer_customer_by_pk<
      TRes> get update_customer_customer_by_pk;
}

class _CopyWithImpl$Mutation$set_customer_app_version<TRes>
    implements CopyWith$Mutation$set_customer_app_version<TRes> {
  _CopyWithImpl$Mutation$set_customer_app_version(
    this._instance,
    this._then,
  );

  final Mutation$set_customer_app_version _instance;

  final TRes Function(Mutation$set_customer_app_version) _then;

  static const _undefined = {};

  TRes call({
    Object? update_customer_customer_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$set_customer_app_version(
        update_customer_customer_by_pk: update_customer_customer_by_pk ==
                _undefined
            ? _instance.update_customer_customer_by_pk
            : (update_customer_customer_by_pk
                as Mutation$set_customer_app_version$update_customer_customer_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$set_customer_app_version$update_customer_customer_by_pk<
      TRes> get update_customer_customer_by_pk {
    final local$update_customer_customer_by_pk =
        _instance.update_customer_customer_by_pk;
    return local$update_customer_customer_by_pk == null
        ? CopyWith$Mutation$set_customer_app_version$update_customer_customer_by_pk
            .stub(_then(_instance))
        : CopyWith$Mutation$set_customer_app_version$update_customer_customer_by_pk(
            local$update_customer_customer_by_pk,
            (e) => call(update_customer_customer_by_pk: e));
  }
}

class _CopyWithStubImpl$Mutation$set_customer_app_version<TRes>
    implements CopyWith$Mutation$set_customer_app_version<TRes> {
  _CopyWithStubImpl$Mutation$set_customer_app_version(this._res);

  TRes _res;

  call({
    Mutation$set_customer_app_version$update_customer_customer_by_pk?
        update_customer_customer_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$set_customer_app_version$update_customer_customer_by_pk<
          TRes>
      get update_customer_customer_by_pk =>
          CopyWith$Mutation$set_customer_app_version$update_customer_customer_by_pk
              .stub(_res);
}

const documentNodeMutationset_customer_app_version = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'set_customer_app_version'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'customer_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'version')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'update_customer_customer_by_pk'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'pk_columns'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'user_id'),
                value: VariableNode(name: NameNode(value: 'customer_id')),
              )
            ]),
          ),
          ArgumentNode(
            name: NameNode(value: '_set'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'app_version'),
                value: VariableNode(name: NameNode(value: 'version')),
              )
            ]),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'app_version'),
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
Mutation$set_customer_app_version _parserFn$Mutation$set_customer_app_version(
        Map<String, dynamic> data) =>
    Mutation$set_customer_app_version.fromJson(data);
typedef OnMutationCompleted$Mutation$set_customer_app_version = FutureOr<void>
    Function(
  dynamic,
  Mutation$set_customer_app_version?,
);

class Options$Mutation$set_customer_app_version
    extends graphql.MutationOptions<Mutation$set_customer_app_version> {
  Options$Mutation$set_customer_app_version({
    String? operationName,
    required Variables$Mutation$set_customer_app_version variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$set_customer_app_version? onCompleted,
    graphql.OnMutationUpdate<Mutation$set_customer_app_version>? update,
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
                        : _parserFn$Mutation$set_customer_app_version(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationset_customer_app_version,
          parserFn: _parserFn$Mutation$set_customer_app_version,
        );

  final OnMutationCompleted$Mutation$set_customer_app_version?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$set_customer_app_version
    extends graphql.WatchQueryOptions<Mutation$set_customer_app_version> {
  WatchOptions$Mutation$set_customer_app_version({
    String? operationName,
    required Variables$Mutation$set_customer_app_version variables,
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
          document: documentNodeMutationset_customer_app_version,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$set_customer_app_version,
        );
}

extension ClientExtension$Mutation$set_customer_app_version
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$set_customer_app_version>>
      mutate$set_customer_app_version(
              Options$Mutation$set_customer_app_version options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$set_customer_app_version>
      watchMutation$set_customer_app_version(
              WatchOptions$Mutation$set_customer_app_version options) =>
          this.watchMutation(options);
}

class Mutation$set_customer_app_version$update_customer_customer_by_pk {
  Mutation$set_customer_app_version$update_customer_customer_by_pk({
    this.app_version,
    required this.$__typename,
  });

  factory Mutation$set_customer_app_version$update_customer_customer_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$app_version = json['app_version'];
    final l$$__typename = json['__typename'];
    return Mutation$set_customer_app_version$update_customer_customer_by_pk(
      app_version: (l$app_version as String?),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String? app_version;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$app_version = app_version;
    _resultData['app_version'] = l$app_version;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$app_version = app_version;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$app_version,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Mutation$set_customer_app_version$update_customer_customer_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$app_version = app_version;
    final lOther$app_version = other.app_version;
    if (l$app_version != lOther$app_version) {
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

extension UtilityExtension$Mutation$set_customer_app_version$update_customer_customer_by_pk
    on Mutation$set_customer_app_version$update_customer_customer_by_pk {
  CopyWith$Mutation$set_customer_app_version$update_customer_customer_by_pk<
          Mutation$set_customer_app_version$update_customer_customer_by_pk>
      get copyWith =>
          CopyWith$Mutation$set_customer_app_version$update_customer_customer_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$set_customer_app_version$update_customer_customer_by_pk<
    TRes> {
  factory CopyWith$Mutation$set_customer_app_version$update_customer_customer_by_pk(
    Mutation$set_customer_app_version$update_customer_customer_by_pk instance,
    TRes Function(
            Mutation$set_customer_app_version$update_customer_customer_by_pk)
        then,
  ) = _CopyWithImpl$Mutation$set_customer_app_version$update_customer_customer_by_pk;

  factory CopyWith$Mutation$set_customer_app_version$update_customer_customer_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$set_customer_app_version$update_customer_customer_by_pk;

  TRes call({
    String? app_version,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$set_customer_app_version$update_customer_customer_by_pk<
        TRes>
    implements
        CopyWith$Mutation$set_customer_app_version$update_customer_customer_by_pk<
            TRes> {
  _CopyWithImpl$Mutation$set_customer_app_version$update_customer_customer_by_pk(
    this._instance,
    this._then,
  );

  final Mutation$set_customer_app_version$update_customer_customer_by_pk
      _instance;

  final TRes Function(
      Mutation$set_customer_app_version$update_customer_customer_by_pk) _then;

  static const _undefined = {};

  TRes call({
    Object? app_version = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$set_customer_app_version$update_customer_customer_by_pk(
        app_version: app_version == _undefined
            ? _instance.app_version
            : (app_version as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$set_customer_app_version$update_customer_customer_by_pk<
        TRes>
    implements
        CopyWith$Mutation$set_customer_app_version$update_customer_customer_by_pk<
            TRes> {
  _CopyWithStubImpl$Mutation$set_customer_app_version$update_customer_customer_by_pk(
      this._res);

  TRes _res;

  call({
    String? app_version,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$set_notif_token {
  factory Variables$Mutation$set_notif_token({
    required int customer_id,
    required String token,
  }) =>
      Variables$Mutation$set_notif_token._({
        r'customer_id': customer_id,
        r'token': token,
      });

  Variables$Mutation$set_notif_token._(this._$data);

  factory Variables$Mutation$set_notif_token.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$customer_id = data['customer_id'];
    result$data['customer_id'] = (l$customer_id as int);
    final l$token = data['token'];
    result$data['token'] = (l$token as String);
    return Variables$Mutation$set_notif_token._(result$data);
  }

  Map<String, dynamic> _$data;

  int get customer_id => (_$data['customer_id'] as int);
  String get token => (_$data['token'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$customer_id = customer_id;
    result$data['customer_id'] = l$customer_id;
    final l$token = token;
    result$data['token'] = l$token;
    return result$data;
  }

  CopyWith$Variables$Mutation$set_notif_token<
          Variables$Mutation$set_notif_token>
      get copyWith => CopyWith$Variables$Mutation$set_notif_token(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$set_notif_token) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$customer_id = customer_id;
    final lOther$customer_id = other.customer_id;
    if (l$customer_id != lOther$customer_id) {
      return false;
    }
    final l$token = token;
    final lOther$token = other.token;
    if (l$token != lOther$token) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$customer_id = customer_id;
    final l$token = token;
    return Object.hashAll([
      l$customer_id,
      l$token,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$set_notif_token<TRes> {
  factory CopyWith$Variables$Mutation$set_notif_token(
    Variables$Mutation$set_notif_token instance,
    TRes Function(Variables$Mutation$set_notif_token) then,
  ) = _CopyWithImpl$Variables$Mutation$set_notif_token;

  factory CopyWith$Variables$Mutation$set_notif_token.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$set_notif_token;

  TRes call({
    int? customer_id,
    String? token,
  });
}

class _CopyWithImpl$Variables$Mutation$set_notif_token<TRes>
    implements CopyWith$Variables$Mutation$set_notif_token<TRes> {
  _CopyWithImpl$Variables$Mutation$set_notif_token(
    this._instance,
    this._then,
  );

  final Variables$Mutation$set_notif_token _instance;

  final TRes Function(Variables$Mutation$set_notif_token) _then;

  static const _undefined = {};

  TRes call({
    Object? customer_id = _undefined,
    Object? token = _undefined,
  }) =>
      _then(Variables$Mutation$set_notif_token._({
        ..._instance._$data,
        if (customer_id != _undefined && customer_id != null)
          'customer_id': (customer_id as int),
        if (token != _undefined && token != null) 'token': (token as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$set_notif_token<TRes>
    implements CopyWith$Variables$Mutation$set_notif_token<TRes> {
  _CopyWithStubImpl$Variables$Mutation$set_notif_token(this._res);

  TRes _res;

  call({
    int? customer_id,
    String? token,
  }) =>
      _res;
}

class Mutation$set_notif_token {
  Mutation$set_notif_token({
    this.update_notification_info,
    required this.$__typename,
  });

  factory Mutation$set_notif_token.fromJson(Map<String, dynamic> json) {
    final l$update_notification_info = json['update_notification_info'];
    final l$$__typename = json['__typename'];
    return Mutation$set_notif_token(
      update_notification_info: l$update_notification_info == null
          ? null
          : Mutation$set_notif_token$update_notification_info.fromJson(
              (l$update_notification_info as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$set_notif_token$update_notification_info?
      update_notification_info;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$update_notification_info = update_notification_info;
    _resultData['update_notification_info'] =
        l$update_notification_info?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$update_notification_info = update_notification_info;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$update_notification_info,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$set_notif_token) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$update_notification_info = update_notification_info;
    final lOther$update_notification_info = other.update_notification_info;
    if (l$update_notification_info != lOther$update_notification_info) {
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

extension UtilityExtension$Mutation$set_notif_token
    on Mutation$set_notif_token {
  CopyWith$Mutation$set_notif_token<Mutation$set_notif_token> get copyWith =>
      CopyWith$Mutation$set_notif_token(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$set_notif_token<TRes> {
  factory CopyWith$Mutation$set_notif_token(
    Mutation$set_notif_token instance,
    TRes Function(Mutation$set_notif_token) then,
  ) = _CopyWithImpl$Mutation$set_notif_token;

  factory CopyWith$Mutation$set_notif_token.stub(TRes res) =
      _CopyWithStubImpl$Mutation$set_notif_token;

  TRes call({
    Mutation$set_notif_token$update_notification_info? update_notification_info,
    String? $__typename,
  });
  CopyWith$Mutation$set_notif_token$update_notification_info<TRes>
      get update_notification_info;
}

class _CopyWithImpl$Mutation$set_notif_token<TRes>
    implements CopyWith$Mutation$set_notif_token<TRes> {
  _CopyWithImpl$Mutation$set_notif_token(
    this._instance,
    this._then,
  );

  final Mutation$set_notif_token _instance;

  final TRes Function(Mutation$set_notif_token) _then;

  static const _undefined = {};

  TRes call({
    Object? update_notification_info = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$set_notif_token(
        update_notification_info: update_notification_info == _undefined
            ? _instance.update_notification_info
            : (update_notification_info
                as Mutation$set_notif_token$update_notification_info?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$set_notif_token$update_notification_info<TRes>
      get update_notification_info {
    final local$update_notification_info = _instance.update_notification_info;
    return local$update_notification_info == null
        ? CopyWith$Mutation$set_notif_token$update_notification_info.stub(
            _then(_instance))
        : CopyWith$Mutation$set_notif_token$update_notification_info(
            local$update_notification_info,
            (e) => call(update_notification_info: e));
  }
}

class _CopyWithStubImpl$Mutation$set_notif_token<TRes>
    implements CopyWith$Mutation$set_notif_token<TRes> {
  _CopyWithStubImpl$Mutation$set_notif_token(this._res);

  TRes _res;

  call({
    Mutation$set_notif_token$update_notification_info? update_notification_info,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$set_notif_token$update_notification_info<TRes>
      get update_notification_info =>
          CopyWith$Mutation$set_notif_token$update_notification_info.stub(_res);
}

const documentNodeMutationset_notif_token = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'set_notif_token'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'customer_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'token')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'update_notification_info'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'user_id'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'customer_id')),
                  )
                ]),
              )
            ]),
          ),
          ArgumentNode(
            name: NameNode(value: '_set'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'token'),
                value: VariableNode(name: NameNode(value: 'token')),
              )
            ]),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'returning'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'token'),
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
Mutation$set_notif_token _parserFn$Mutation$set_notif_token(
        Map<String, dynamic> data) =>
    Mutation$set_notif_token.fromJson(data);
typedef OnMutationCompleted$Mutation$set_notif_token = FutureOr<void> Function(
  dynamic,
  Mutation$set_notif_token?,
);

class Options$Mutation$set_notif_token
    extends graphql.MutationOptions<Mutation$set_notif_token> {
  Options$Mutation$set_notif_token({
    String? operationName,
    required Variables$Mutation$set_notif_token variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$set_notif_token? onCompleted,
    graphql.OnMutationUpdate<Mutation$set_notif_token>? update,
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
                        : _parserFn$Mutation$set_notif_token(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationset_notif_token,
          parserFn: _parserFn$Mutation$set_notif_token,
        );

  final OnMutationCompleted$Mutation$set_notif_token? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$set_notif_token
    extends graphql.WatchQueryOptions<Mutation$set_notif_token> {
  WatchOptions$Mutation$set_notif_token({
    String? operationName,
    required Variables$Mutation$set_notif_token variables,
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
          document: documentNodeMutationset_notif_token,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$set_notif_token,
        );
}

extension ClientExtension$Mutation$set_notif_token on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$set_notif_token>> mutate$set_notif_token(
          Options$Mutation$set_notif_token options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$set_notif_token>
      watchMutation$set_notif_token(
              WatchOptions$Mutation$set_notif_token options) =>
          this.watchMutation(options);
}

class Mutation$set_notif_token$update_notification_info {
  Mutation$set_notif_token$update_notification_info({
    required this.returning,
    required this.$__typename,
  });

  factory Mutation$set_notif_token$update_notification_info.fromJson(
      Map<String, dynamic> json) {
    final l$returning = json['returning'];
    final l$$__typename = json['__typename'];
    return Mutation$set_notif_token$update_notification_info(
      returning: (l$returning as List<dynamic>)
          .map((e) =>
              Mutation$set_notif_token$update_notification_info$returning
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Mutation$set_notif_token$update_notification_info$returning>
      returning;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$returning = returning;
    _resultData['returning'] = l$returning.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$returning = returning;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$returning.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$set_notif_token$update_notification_info) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$returning = returning;
    final lOther$returning = other.returning;
    if (l$returning.length != lOther$returning.length) {
      return false;
    }
    for (int i = 0; i < l$returning.length; i++) {
      final l$returning$entry = l$returning[i];
      final lOther$returning$entry = lOther$returning[i];
      if (l$returning$entry != lOther$returning$entry) {
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

extension UtilityExtension$Mutation$set_notif_token$update_notification_info
    on Mutation$set_notif_token$update_notification_info {
  CopyWith$Mutation$set_notif_token$update_notification_info<
          Mutation$set_notif_token$update_notification_info>
      get copyWith =>
          CopyWith$Mutation$set_notif_token$update_notification_info(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$set_notif_token$update_notification_info<
    TRes> {
  factory CopyWith$Mutation$set_notif_token$update_notification_info(
    Mutation$set_notif_token$update_notification_info instance,
    TRes Function(Mutation$set_notif_token$update_notification_info) then,
  ) = _CopyWithImpl$Mutation$set_notif_token$update_notification_info;

  factory CopyWith$Mutation$set_notif_token$update_notification_info.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$set_notif_token$update_notification_info;

  TRes call({
    List<Mutation$set_notif_token$update_notification_info$returning>?
        returning,
    String? $__typename,
  });
  TRes returning(
      Iterable<Mutation$set_notif_token$update_notification_info$returning> Function(
              Iterable<
                  CopyWith$Mutation$set_notif_token$update_notification_info$returning<
                      Mutation$set_notif_token$update_notification_info$returning>>)
          _fn);
}

class _CopyWithImpl$Mutation$set_notif_token$update_notification_info<TRes>
    implements
        CopyWith$Mutation$set_notif_token$update_notification_info<TRes> {
  _CopyWithImpl$Mutation$set_notif_token$update_notification_info(
    this._instance,
    this._then,
  );

  final Mutation$set_notif_token$update_notification_info _instance;

  final TRes Function(Mutation$set_notif_token$update_notification_info) _then;

  static const _undefined = {};

  TRes call({
    Object? returning = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$set_notif_token$update_notification_info(
        returning: returning == _undefined || returning == null
            ? _instance.returning
            : (returning as List<
                Mutation$set_notif_token$update_notification_info$returning>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes returning(
          Iterable<Mutation$set_notif_token$update_notification_info$returning> Function(
                  Iterable<
                      CopyWith$Mutation$set_notif_token$update_notification_info$returning<
                          Mutation$set_notif_token$update_notification_info$returning>>)
              _fn) =>
      call(
          returning: _fn(_instance.returning.map((e) =>
              CopyWith$Mutation$set_notif_token$update_notification_info$returning(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Mutation$set_notif_token$update_notification_info<TRes>
    implements
        CopyWith$Mutation$set_notif_token$update_notification_info<TRes> {
  _CopyWithStubImpl$Mutation$set_notif_token$update_notification_info(
      this._res);

  TRes _res;

  call({
    List<Mutation$set_notif_token$update_notification_info$returning>?
        returning,
    String? $__typename,
  }) =>
      _res;
  returning(_fn) => _res;
}

class Mutation$set_notif_token$update_notification_info$returning {
  Mutation$set_notif_token$update_notification_info$returning({
    required this.token,
    required this.$__typename,
  });

  factory Mutation$set_notif_token$update_notification_info$returning.fromJson(
      Map<String, dynamic> json) {
    final l$token = json['token'];
    final l$$__typename = json['__typename'];
    return Mutation$set_notif_token$update_notification_info$returning(
      token: (l$token as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String token;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$token = token;
    _resultData['token'] = l$token;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$token = token;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$token,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Mutation$set_notif_token$update_notification_info$returning) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$token = token;
    final lOther$token = other.token;
    if (l$token != lOther$token) {
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

extension UtilityExtension$Mutation$set_notif_token$update_notification_info$returning
    on Mutation$set_notif_token$update_notification_info$returning {
  CopyWith$Mutation$set_notif_token$update_notification_info$returning<
          Mutation$set_notif_token$update_notification_info$returning>
      get copyWith =>
          CopyWith$Mutation$set_notif_token$update_notification_info$returning(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$set_notif_token$update_notification_info$returning<
    TRes> {
  factory CopyWith$Mutation$set_notif_token$update_notification_info$returning(
    Mutation$set_notif_token$update_notification_info$returning instance,
    TRes Function(Mutation$set_notif_token$update_notification_info$returning)
        then,
  ) = _CopyWithImpl$Mutation$set_notif_token$update_notification_info$returning;

  factory CopyWith$Mutation$set_notif_token$update_notification_info$returning.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$set_notif_token$update_notification_info$returning;

  TRes call({
    String? token,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$set_notif_token$update_notification_info$returning<
        TRes>
    implements
        CopyWith$Mutation$set_notif_token$update_notification_info$returning<
            TRes> {
  _CopyWithImpl$Mutation$set_notif_token$update_notification_info$returning(
    this._instance,
    this._then,
  );

  final Mutation$set_notif_token$update_notification_info$returning _instance;

  final TRes Function(
      Mutation$set_notif_token$update_notification_info$returning) _then;

  static const _undefined = {};

  TRes call({
    Object? token = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$set_notif_token$update_notification_info$returning(
        token: token == _undefined || token == null
            ? _instance.token
            : (token as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$set_notif_token$update_notification_info$returning<
        TRes>
    implements
        CopyWith$Mutation$set_notif_token$update_notification_info$returning<
            TRes> {
  _CopyWithStubImpl$Mutation$set_notif_token$update_notification_info$returning(
      this._res);

  TRes _res;

  call({
    String? token,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$get_customer_info {
  factory Variables$Query$get_customer_info({required int customer_id}) =>
      Variables$Query$get_customer_info._({
        r'customer_id': customer_id,
      });

  Variables$Query$get_customer_info._(this._$data);

  factory Variables$Query$get_customer_info.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$customer_id = data['customer_id'];
    result$data['customer_id'] = (l$customer_id as int);
    return Variables$Query$get_customer_info._(result$data);
  }

  Map<String, dynamic> _$data;

  int get customer_id => (_$data['customer_id'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$customer_id = customer_id;
    result$data['customer_id'] = l$customer_id;
    return result$data;
  }

  CopyWith$Variables$Query$get_customer_info<Variables$Query$get_customer_info>
      get copyWith => CopyWith$Variables$Query$get_customer_info(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$get_customer_info) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$customer_id = customer_id;
    final lOther$customer_id = other.customer_id;
    if (l$customer_id != lOther$customer_id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$customer_id = customer_id;
    return Object.hashAll([l$customer_id]);
  }
}

abstract class CopyWith$Variables$Query$get_customer_info<TRes> {
  factory CopyWith$Variables$Query$get_customer_info(
    Variables$Query$get_customer_info instance,
    TRes Function(Variables$Query$get_customer_info) then,
  ) = _CopyWithImpl$Variables$Query$get_customer_info;

  factory CopyWith$Variables$Query$get_customer_info.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$get_customer_info;

  TRes call({int? customer_id});
}

class _CopyWithImpl$Variables$Query$get_customer_info<TRes>
    implements CopyWith$Variables$Query$get_customer_info<TRes> {
  _CopyWithImpl$Variables$Query$get_customer_info(
    this._instance,
    this._then,
  );

  final Variables$Query$get_customer_info _instance;

  final TRes Function(Variables$Query$get_customer_info) _then;

  static const _undefined = {};

  TRes call({Object? customer_id = _undefined}) =>
      _then(Variables$Query$get_customer_info._({
        ..._instance._$data,
        if (customer_id != _undefined && customer_id != null)
          'customer_id': (customer_id as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$get_customer_info<TRes>
    implements CopyWith$Variables$Query$get_customer_info<TRes> {
  _CopyWithStubImpl$Variables$Query$get_customer_info(this._res);

  TRes _res;

  call({int? customer_id}) => _res;
}

class Query$get_customer_info {
  Query$get_customer_info({
    required this.customer_customer,
    required this.$__typename,
  });

  factory Query$get_customer_info.fromJson(Map<String, dynamic> json) {
    final l$customer_customer = json['customer_customer'];
    final l$$__typename = json['__typename'];
    return Query$get_customer_info(
      customer_customer: (l$customer_customer as List<dynamic>)
          .map((e) => Query$get_customer_info$customer_customer.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$get_customer_info$customer_customer> customer_customer;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$customer_customer = customer_customer;
    _resultData['customer_customer'] =
        l$customer_customer.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$customer_customer = customer_customer;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$customer_customer.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_customer_info) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$customer_customer = customer_customer;
    final lOther$customer_customer = other.customer_customer;
    if (l$customer_customer.length != lOther$customer_customer.length) {
      return false;
    }
    for (int i = 0; i < l$customer_customer.length; i++) {
      final l$customer_customer$entry = l$customer_customer[i];
      final lOther$customer_customer$entry = lOther$customer_customer[i];
      if (l$customer_customer$entry != lOther$customer_customer$entry) {
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

extension UtilityExtension$Query$get_customer_info on Query$get_customer_info {
  CopyWith$Query$get_customer_info<Query$get_customer_info> get copyWith =>
      CopyWith$Query$get_customer_info(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$get_customer_info<TRes> {
  factory CopyWith$Query$get_customer_info(
    Query$get_customer_info instance,
    TRes Function(Query$get_customer_info) then,
  ) = _CopyWithImpl$Query$get_customer_info;

  factory CopyWith$Query$get_customer_info.stub(TRes res) =
      _CopyWithStubImpl$Query$get_customer_info;

  TRes call({
    List<Query$get_customer_info$customer_customer>? customer_customer,
    String? $__typename,
  });
  TRes customer_customer(
      Iterable<Query$get_customer_info$customer_customer> Function(
              Iterable<
                  CopyWith$Query$get_customer_info$customer_customer<
                      Query$get_customer_info$customer_customer>>)
          _fn);
}

class _CopyWithImpl$Query$get_customer_info<TRes>
    implements CopyWith$Query$get_customer_info<TRes> {
  _CopyWithImpl$Query$get_customer_info(
    this._instance,
    this._then,
  );

  final Query$get_customer_info _instance;

  final TRes Function(Query$get_customer_info) _then;

  static const _undefined = {};

  TRes call({
    Object? customer_customer = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_customer_info(
        customer_customer:
            customer_customer == _undefined || customer_customer == null
                ? _instance.customer_customer
                : (customer_customer
                    as List<Query$get_customer_info$customer_customer>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes customer_customer(
          Iterable<Query$get_customer_info$customer_customer> Function(
                  Iterable<
                      CopyWith$Query$get_customer_info$customer_customer<
                          Query$get_customer_info$customer_customer>>)
              _fn) =>
      call(
          customer_customer: _fn(_instance.customer_customer
              .map((e) => CopyWith$Query$get_customer_info$customer_customer(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$get_customer_info<TRes>
    implements CopyWith$Query$get_customer_info<TRes> {
  _CopyWithStubImpl$Query$get_customer_info(this._res);

  TRes _res;

  call({
    List<Query$get_customer_info$customer_customer>? customer_customer,
    String? $__typename,
  }) =>
      _res;
  customer_customer(_fn) => _res;
}

const documentNodeQueryget_customer_info = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'get_customer_info'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'customer_id')),
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
        name: NameNode(value: 'customer_customer'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'user_id'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'customer_id')),
                  )
                ]),
              )
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'app_version'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'notification_info'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'token'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'turn_off_notifications'),
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
                name: NameNode(value: 'email'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'phone'),
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
            name: NameNode(value: 'saved_locations'),
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
                        value:
                            VariableNode(name: NameNode(value: 'customer_id')),
                      )
                    ]),
                  )
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
                name: NameNode(value: 'default'),
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
Query$get_customer_info _parserFn$Query$get_customer_info(
        Map<String, dynamic> data) =>
    Query$get_customer_info.fromJson(data);

class Options$Query$get_customer_info
    extends graphql.QueryOptions<Query$get_customer_info> {
  Options$Query$get_customer_info({
    String? operationName,
    required Variables$Query$get_customer_info variables,
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
          document: documentNodeQueryget_customer_info,
          parserFn: _parserFn$Query$get_customer_info,
        );
}

class WatchOptions$Query$get_customer_info
    extends graphql.WatchQueryOptions<Query$get_customer_info> {
  WatchOptions$Query$get_customer_info({
    String? operationName,
    required Variables$Query$get_customer_info variables,
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
          document: documentNodeQueryget_customer_info,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$get_customer_info,
        );
}

class FetchMoreOptions$Query$get_customer_info
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$get_customer_info({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$get_customer_info variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryget_customer_info,
        );
}

extension ClientExtension$Query$get_customer_info on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$get_customer_info>> query$get_customer_info(
          Options$Query$get_customer_info options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$get_customer_info> watchQuery$get_customer_info(
          WatchOptions$Query$get_customer_info options) =>
      this.watchQuery(options);
  void writeQuery$get_customer_info({
    required Query$get_customer_info data,
    required Variables$Query$get_customer_info variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryget_customer_info),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$get_customer_info? readQuery$get_customer_info({
    required Variables$Query$get_customer_info variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQueryget_customer_info),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$get_customer_info.fromJson(result);
  }
}

class Query$get_customer_info$customer_customer {
  Query$get_customer_info$customer_customer({
    this.app_version,
    this.notification_info,
    required this.user,
    required this.saved_locations,
    required this.$__typename,
  });

  factory Query$get_customer_info$customer_customer.fromJson(
      Map<String, dynamic> json) {
    final l$app_version = json['app_version'];
    final l$notification_info = json['notification_info'];
    final l$user = json['user'];
    final l$saved_locations = json['saved_locations'];
    final l$$__typename = json['__typename'];
    return Query$get_customer_info$customer_customer(
      app_version: (l$app_version as String?),
      notification_info: l$notification_info == null
          ? null
          : Query$get_customer_info$customer_customer$notification_info
              .fromJson((l$notification_info as Map<String, dynamic>)),
      user: Query$get_customer_info$customer_customer$user.fromJson(
          (l$user as Map<String, dynamic>)),
      saved_locations: (l$saved_locations as List<dynamic>)
          .map((e) => Query$get_customer_info$customer_customer$saved_locations
              .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String? app_version;

  final Query$get_customer_info$customer_customer$notification_info?
      notification_info;

  final Query$get_customer_info$customer_customer$user user;

  final List<Query$get_customer_info$customer_customer$saved_locations>
      saved_locations;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$app_version = app_version;
    _resultData['app_version'] = l$app_version;
    final l$notification_info = notification_info;
    _resultData['notification_info'] = l$notification_info?.toJson();
    final l$user = user;
    _resultData['user'] = l$user.toJson();
    final l$saved_locations = saved_locations;
    _resultData['saved_locations'] =
        l$saved_locations.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$app_version = app_version;
    final l$notification_info = notification_info;
    final l$user = user;
    final l$saved_locations = saved_locations;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$app_version,
      l$notification_info,
      l$user,
      Object.hashAll(l$saved_locations.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_customer_info$customer_customer) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$app_version = app_version;
    final lOther$app_version = other.app_version;
    if (l$app_version != lOther$app_version) {
      return false;
    }
    final l$notification_info = notification_info;
    final lOther$notification_info = other.notification_info;
    if (l$notification_info != lOther$notification_info) {
      return false;
    }
    final l$user = user;
    final lOther$user = other.user;
    if (l$user != lOther$user) {
      return false;
    }
    final l$saved_locations = saved_locations;
    final lOther$saved_locations = other.saved_locations;
    if (l$saved_locations.length != lOther$saved_locations.length) {
      return false;
    }
    for (int i = 0; i < l$saved_locations.length; i++) {
      final l$saved_locations$entry = l$saved_locations[i];
      final lOther$saved_locations$entry = lOther$saved_locations[i];
      if (l$saved_locations$entry != lOther$saved_locations$entry) {
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

extension UtilityExtension$Query$get_customer_info$customer_customer
    on Query$get_customer_info$customer_customer {
  CopyWith$Query$get_customer_info$customer_customer<
          Query$get_customer_info$customer_customer>
      get copyWith => CopyWith$Query$get_customer_info$customer_customer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_customer_info$customer_customer<TRes> {
  factory CopyWith$Query$get_customer_info$customer_customer(
    Query$get_customer_info$customer_customer instance,
    TRes Function(Query$get_customer_info$customer_customer) then,
  ) = _CopyWithImpl$Query$get_customer_info$customer_customer;

  factory CopyWith$Query$get_customer_info$customer_customer.stub(TRes res) =
      _CopyWithStubImpl$Query$get_customer_info$customer_customer;

  TRes call({
    String? app_version,
    Query$get_customer_info$customer_customer$notification_info?
        notification_info,
    Query$get_customer_info$customer_customer$user? user,
    List<Query$get_customer_info$customer_customer$saved_locations>?
        saved_locations,
    String? $__typename,
  });
  CopyWith$Query$get_customer_info$customer_customer$notification_info<TRes>
      get notification_info;
  CopyWith$Query$get_customer_info$customer_customer$user<TRes> get user;
  TRes saved_locations(
      Iterable<Query$get_customer_info$customer_customer$saved_locations> Function(
              Iterable<
                  CopyWith$Query$get_customer_info$customer_customer$saved_locations<
                      Query$get_customer_info$customer_customer$saved_locations>>)
          _fn);
}

class _CopyWithImpl$Query$get_customer_info$customer_customer<TRes>
    implements CopyWith$Query$get_customer_info$customer_customer<TRes> {
  _CopyWithImpl$Query$get_customer_info$customer_customer(
    this._instance,
    this._then,
  );

  final Query$get_customer_info$customer_customer _instance;

  final TRes Function(Query$get_customer_info$customer_customer) _then;

  static const _undefined = {};

  TRes call({
    Object? app_version = _undefined,
    Object? notification_info = _undefined,
    Object? user = _undefined,
    Object? saved_locations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_customer_info$customer_customer(
        app_version: app_version == _undefined
            ? _instance.app_version
            : (app_version as String?),
        notification_info: notification_info == _undefined
            ? _instance.notification_info
            : (notification_info
                as Query$get_customer_info$customer_customer$notification_info?),
        user: user == _undefined || user == null
            ? _instance.user
            : (user as Query$get_customer_info$customer_customer$user),
        saved_locations:
            saved_locations == _undefined || saved_locations == null
                ? _instance.saved_locations
                : (saved_locations as List<
                    Query$get_customer_info$customer_customer$saved_locations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_customer_info$customer_customer$notification_info<TRes>
      get notification_info {
    final local$notification_info = _instance.notification_info;
    return local$notification_info == null
        ? CopyWith$Query$get_customer_info$customer_customer$notification_info
            .stub(_then(_instance))
        : CopyWith$Query$get_customer_info$customer_customer$notification_info(
            local$notification_info, (e) => call(notification_info: e));
  }

  CopyWith$Query$get_customer_info$customer_customer$user<TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Query$get_customer_info$customer_customer$user(
        local$user, (e) => call(user: e));
  }

  TRes saved_locations(
          Iterable<Query$get_customer_info$customer_customer$saved_locations> Function(
                  Iterable<
                      CopyWith$Query$get_customer_info$customer_customer$saved_locations<
                          Query$get_customer_info$customer_customer$saved_locations>>)
              _fn) =>
      call(
          saved_locations: _fn(_instance.saved_locations.map((e) =>
              CopyWith$Query$get_customer_info$customer_customer$saved_locations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$get_customer_info$customer_customer<TRes>
    implements CopyWith$Query$get_customer_info$customer_customer<TRes> {
  _CopyWithStubImpl$Query$get_customer_info$customer_customer(this._res);

  TRes _res;

  call({
    String? app_version,
    Query$get_customer_info$customer_customer$notification_info?
        notification_info,
    Query$get_customer_info$customer_customer$user? user,
    List<Query$get_customer_info$customer_customer$saved_locations>?
        saved_locations,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_customer_info$customer_customer$notification_info<TRes>
      get notification_info =>
          CopyWith$Query$get_customer_info$customer_customer$notification_info
              .stub(_res);
  CopyWith$Query$get_customer_info$customer_customer$user<TRes> get user =>
      CopyWith$Query$get_customer_info$customer_customer$user.stub(_res);
  saved_locations(_fn) => _res;
}

class Query$get_customer_info$customer_customer$notification_info {
  Query$get_customer_info$customer_customer$notification_info({
    required this.token,
    required this.turn_off_notifications,
    required this.$__typename,
  });

  factory Query$get_customer_info$customer_customer$notification_info.fromJson(
      Map<String, dynamic> json) {
    final l$token = json['token'];
    final l$turn_off_notifications = json['turn_off_notifications'];
    final l$$__typename = json['__typename'];
    return Query$get_customer_info$customer_customer$notification_info(
      token: (l$token as String),
      turn_off_notifications: (l$turn_off_notifications as bool),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String token;

  final bool turn_off_notifications;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$token = token;
    _resultData['token'] = l$token;
    final l$turn_off_notifications = turn_off_notifications;
    _resultData['turn_off_notifications'] = l$turn_off_notifications;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$token = token;
    final l$turn_off_notifications = turn_off_notifications;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$token,
      l$turn_off_notifications,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$get_customer_info$customer_customer$notification_info) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$token = token;
    final lOther$token = other.token;
    if (l$token != lOther$token) {
      return false;
    }
    final l$turn_off_notifications = turn_off_notifications;
    final lOther$turn_off_notifications = other.turn_off_notifications;
    if (l$turn_off_notifications != lOther$turn_off_notifications) {
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

extension UtilityExtension$Query$get_customer_info$customer_customer$notification_info
    on Query$get_customer_info$customer_customer$notification_info {
  CopyWith$Query$get_customer_info$customer_customer$notification_info<
          Query$get_customer_info$customer_customer$notification_info>
      get copyWith =>
          CopyWith$Query$get_customer_info$customer_customer$notification_info(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_customer_info$customer_customer$notification_info<
    TRes> {
  factory CopyWith$Query$get_customer_info$customer_customer$notification_info(
    Query$get_customer_info$customer_customer$notification_info instance,
    TRes Function(Query$get_customer_info$customer_customer$notification_info)
        then,
  ) = _CopyWithImpl$Query$get_customer_info$customer_customer$notification_info;

  factory CopyWith$Query$get_customer_info$customer_customer$notification_info.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_customer_info$customer_customer$notification_info;

  TRes call({
    String? token,
    bool? turn_off_notifications,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_customer_info$customer_customer$notification_info<
        TRes>
    implements
        CopyWith$Query$get_customer_info$customer_customer$notification_info<
            TRes> {
  _CopyWithImpl$Query$get_customer_info$customer_customer$notification_info(
    this._instance,
    this._then,
  );

  final Query$get_customer_info$customer_customer$notification_info _instance;

  final TRes Function(
      Query$get_customer_info$customer_customer$notification_info) _then;

  static const _undefined = {};

  TRes call({
    Object? token = _undefined,
    Object? turn_off_notifications = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_customer_info$customer_customer$notification_info(
        token: token == _undefined || token == null
            ? _instance.token
            : (token as String),
        turn_off_notifications: turn_off_notifications == _undefined ||
                turn_off_notifications == null
            ? _instance.turn_off_notifications
            : (turn_off_notifications as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$get_customer_info$customer_customer$notification_info<
        TRes>
    implements
        CopyWith$Query$get_customer_info$customer_customer$notification_info<
            TRes> {
  _CopyWithStubImpl$Query$get_customer_info$customer_customer$notification_info(
      this._res);

  TRes _res;

  call({
    String? token,
    bool? turn_off_notifications,
    String? $__typename,
  }) =>
      _res;
}

class Query$get_customer_info$customer_customer$user {
  Query$get_customer_info$customer_customer$user({
    required this.id,
    this.name,
    this.image,
    this.email,
    this.phone,
    required this.language_id,
    required this.$__typename,
  });

  factory Query$get_customer_info$customer_customer$user.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$image = json['image'];
    final l$email = json['email'];
    final l$phone = json['phone'];
    final l$language_id = json['language_id'];
    final l$$__typename = json['__typename'];
    return Query$get_customer_info$customer_customer$user(
      id: (l$id as int),
      name: (l$name as String?),
      image: (l$image as String?),
      email: (l$email as String?),
      phone: (l$phone as String?),
      language_id: (l$language_id as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String? name;

  final String? image;

  final String? email;

  final String? phone;

  final String language_id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$email = email;
    _resultData['email'] = l$email;
    final l$phone = phone;
    _resultData['phone'] = l$phone;
    final l$language_id = language_id;
    _resultData['language_id'] = l$language_id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$image = image;
    final l$email = email;
    final l$phone = phone;
    final l$language_id = language_id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$image,
      l$email,
      l$phone,
      l$language_id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_customer_info$customer_customer$user) ||
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
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) {
      return false;
    }
    final l$phone = phone;
    final lOther$phone = other.phone;
    if (l$phone != lOther$phone) {
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

extension UtilityExtension$Query$get_customer_info$customer_customer$user
    on Query$get_customer_info$customer_customer$user {
  CopyWith$Query$get_customer_info$customer_customer$user<
          Query$get_customer_info$customer_customer$user>
      get copyWith => CopyWith$Query$get_customer_info$customer_customer$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_customer_info$customer_customer$user<TRes> {
  factory CopyWith$Query$get_customer_info$customer_customer$user(
    Query$get_customer_info$customer_customer$user instance,
    TRes Function(Query$get_customer_info$customer_customer$user) then,
  ) = _CopyWithImpl$Query$get_customer_info$customer_customer$user;

  factory CopyWith$Query$get_customer_info$customer_customer$user.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_customer_info$customer_customer$user;

  TRes call({
    int? id,
    String? name,
    String? image,
    String? email,
    String? phone,
    String? language_id,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_customer_info$customer_customer$user<TRes>
    implements CopyWith$Query$get_customer_info$customer_customer$user<TRes> {
  _CopyWithImpl$Query$get_customer_info$customer_customer$user(
    this._instance,
    this._then,
  );

  final Query$get_customer_info$customer_customer$user _instance;

  final TRes Function(Query$get_customer_info$customer_customer$user) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? image = _undefined,
    Object? email = _undefined,
    Object? phone = _undefined,
    Object? language_id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_customer_info$customer_customer$user(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined ? _instance.name : (name as String?),
        image: image == _undefined ? _instance.image : (image as String?),
        email: email == _undefined ? _instance.email : (email as String?),
        phone: phone == _undefined ? _instance.phone : (phone as String?),
        language_id: language_id == _undefined || language_id == null
            ? _instance.language_id
            : (language_id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$get_customer_info$customer_customer$user<TRes>
    implements CopyWith$Query$get_customer_info$customer_customer$user<TRes> {
  _CopyWithStubImpl$Query$get_customer_info$customer_customer$user(this._res);

  TRes _res;

  call({
    int? id,
    String? name,
    String? image,
    String? email,
    String? phone,
    String? language_id,
    String? $__typename,
  }) =>
      _res;
}

class Query$get_customer_info$customer_customer$saved_locations {
  Query$get_customer_info$customer_customer$saved_locations({
    required this.id,
    required this.name,
    required this.location_gps,
    required this.location_text,
    required this.$default,
    required this.$__typename,
  });

  factory Query$get_customer_info$customer_customer$saved_locations.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$location_gps = json['location_gps'];
    final l$location_text = json['location_text'];
    final l$$default = json['default'];
    final l$$__typename = json['__typename'];
    return Query$get_customer_info$customer_customer$saved_locations(
      id: (l$id as int),
      name: (l$name as String),
      location_gps: geographyFromJson(l$location_gps),
      location_text: (l$location_text as String),
      $default: (l$$default as bool),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String name;

  final Geography location_gps;

  final String location_text;

  final bool $default;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$location_gps = location_gps;
    _resultData['location_gps'] = geographyToJson(l$location_gps);
    final l$location_text = location_text;
    _resultData['location_text'] = l$location_text;
    final l$$default = $default;
    _resultData['default'] = l$$default;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$location_gps = location_gps;
    final l$location_text = location_text;
    final l$$default = $default;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$location_gps,
      l$location_text,
      l$$default,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_customer_info$customer_customer$saved_locations) ||
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
    final l$$default = $default;
    final lOther$$default = other.$default;
    if (l$$default != lOther$$default) {
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

extension UtilityExtension$Query$get_customer_info$customer_customer$saved_locations
    on Query$get_customer_info$customer_customer$saved_locations {
  CopyWith$Query$get_customer_info$customer_customer$saved_locations<
          Query$get_customer_info$customer_customer$saved_locations>
      get copyWith =>
          CopyWith$Query$get_customer_info$customer_customer$saved_locations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_customer_info$customer_customer$saved_locations<
    TRes> {
  factory CopyWith$Query$get_customer_info$customer_customer$saved_locations(
    Query$get_customer_info$customer_customer$saved_locations instance,
    TRes Function(Query$get_customer_info$customer_customer$saved_locations)
        then,
  ) = _CopyWithImpl$Query$get_customer_info$customer_customer$saved_locations;

  factory CopyWith$Query$get_customer_info$customer_customer$saved_locations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_customer_info$customer_customer$saved_locations;

  TRes call({
    int? id,
    String? name,
    Geography? location_gps,
    String? location_text,
    bool? $default,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_customer_info$customer_customer$saved_locations<
        TRes>
    implements
        CopyWith$Query$get_customer_info$customer_customer$saved_locations<
            TRes> {
  _CopyWithImpl$Query$get_customer_info$customer_customer$saved_locations(
    this._instance,
    this._then,
  );

  final Query$get_customer_info$customer_customer$saved_locations _instance;

  final TRes Function(Query$get_customer_info$customer_customer$saved_locations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? location_gps = _undefined,
    Object? location_text = _undefined,
    Object? $default = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_customer_info$customer_customer$saved_locations(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        location_gps: location_gps == _undefined || location_gps == null
            ? _instance.location_gps
            : (location_gps as Geography),
        location_text: location_text == _undefined || location_text == null
            ? _instance.location_text
            : (location_text as String),
        $default: $default == _undefined || $default == null
            ? _instance.$default
            : ($default as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$get_customer_info$customer_customer$saved_locations<
        TRes>
    implements
        CopyWith$Query$get_customer_info$customer_customer$saved_locations<
            TRes> {
  _CopyWithStubImpl$Query$get_customer_info$customer_customer$saved_locations(
      this._res);

  TRes _res;

  call({
    int? id,
    String? name,
    Geography? location_gps,
    String? location_text,
    bool? $default,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$set_customer_info {
  factory Variables$Mutation$set_customer_info({
    required int user_id,
    required String app_version,
  }) =>
      Variables$Mutation$set_customer_info._({
        r'user_id': user_id,
        r'app_version': app_version,
      });

  Variables$Mutation$set_customer_info._(this._$data);

  factory Variables$Mutation$set_customer_info.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$user_id = data['user_id'];
    result$data['user_id'] = (l$user_id as int);
    final l$app_version = data['app_version'];
    result$data['app_version'] = (l$app_version as String);
    return Variables$Mutation$set_customer_info._(result$data);
  }

  Map<String, dynamic> _$data;

  int get user_id => (_$data['user_id'] as int);
  String get app_version => (_$data['app_version'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$user_id = user_id;
    result$data['user_id'] = l$user_id;
    final l$app_version = app_version;
    result$data['app_version'] = l$app_version;
    return result$data;
  }

  CopyWith$Variables$Mutation$set_customer_info<
          Variables$Mutation$set_customer_info>
      get copyWith => CopyWith$Variables$Mutation$set_customer_info(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$set_customer_info) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$user_id = user_id;
    final lOther$user_id = other.user_id;
    if (l$user_id != lOther$user_id) {
      return false;
    }
    final l$app_version = app_version;
    final lOther$app_version = other.app_version;
    if (l$app_version != lOther$app_version) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$user_id = user_id;
    final l$app_version = app_version;
    return Object.hashAll([
      l$user_id,
      l$app_version,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$set_customer_info<TRes> {
  factory CopyWith$Variables$Mutation$set_customer_info(
    Variables$Mutation$set_customer_info instance,
    TRes Function(Variables$Mutation$set_customer_info) then,
  ) = _CopyWithImpl$Variables$Mutation$set_customer_info;

  factory CopyWith$Variables$Mutation$set_customer_info.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$set_customer_info;

  TRes call({
    int? user_id,
    String? app_version,
  });
}

class _CopyWithImpl$Variables$Mutation$set_customer_info<TRes>
    implements CopyWith$Variables$Mutation$set_customer_info<TRes> {
  _CopyWithImpl$Variables$Mutation$set_customer_info(
    this._instance,
    this._then,
  );

  final Variables$Mutation$set_customer_info _instance;

  final TRes Function(Variables$Mutation$set_customer_info) _then;

  static const _undefined = {};

  TRes call({
    Object? user_id = _undefined,
    Object? app_version = _undefined,
  }) =>
      _then(Variables$Mutation$set_customer_info._({
        ..._instance._$data,
        if (user_id != _undefined && user_id != null)
          'user_id': (user_id as int),
        if (app_version != _undefined && app_version != null)
          'app_version': (app_version as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$set_customer_info<TRes>
    implements CopyWith$Variables$Mutation$set_customer_info<TRes> {
  _CopyWithStubImpl$Variables$Mutation$set_customer_info(this._res);

  TRes _res;

  call({
    int? user_id,
    String? app_version,
  }) =>
      _res;
}

class Mutation$set_customer_info {
  Mutation$set_customer_info({
    this.insert_customer_customer_one,
    required this.$__typename,
  });

  factory Mutation$set_customer_info.fromJson(Map<String, dynamic> json) {
    final l$insert_customer_customer_one = json['insert_customer_customer_one'];
    final l$$__typename = json['__typename'];
    return Mutation$set_customer_info(
      insert_customer_customer_one: l$insert_customer_customer_one == null
          ? null
          : Mutation$set_customer_info$insert_customer_customer_one.fromJson(
              (l$insert_customer_customer_one as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$set_customer_info$insert_customer_customer_one?
      insert_customer_customer_one;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$insert_customer_customer_one = insert_customer_customer_one;
    _resultData['insert_customer_customer_one'] =
        l$insert_customer_customer_one?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$insert_customer_customer_one = insert_customer_customer_one;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$insert_customer_customer_one,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$set_customer_info) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$insert_customer_customer_one = insert_customer_customer_one;
    final lOther$insert_customer_customer_one =
        other.insert_customer_customer_one;
    if (l$insert_customer_customer_one != lOther$insert_customer_customer_one) {
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

extension UtilityExtension$Mutation$set_customer_info
    on Mutation$set_customer_info {
  CopyWith$Mutation$set_customer_info<Mutation$set_customer_info>
      get copyWith => CopyWith$Mutation$set_customer_info(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$set_customer_info<TRes> {
  factory CopyWith$Mutation$set_customer_info(
    Mutation$set_customer_info instance,
    TRes Function(Mutation$set_customer_info) then,
  ) = _CopyWithImpl$Mutation$set_customer_info;

  factory CopyWith$Mutation$set_customer_info.stub(TRes res) =
      _CopyWithStubImpl$Mutation$set_customer_info;

  TRes call({
    Mutation$set_customer_info$insert_customer_customer_one?
        insert_customer_customer_one,
    String? $__typename,
  });
  CopyWith$Mutation$set_customer_info$insert_customer_customer_one<TRes>
      get insert_customer_customer_one;
}

class _CopyWithImpl$Mutation$set_customer_info<TRes>
    implements CopyWith$Mutation$set_customer_info<TRes> {
  _CopyWithImpl$Mutation$set_customer_info(
    this._instance,
    this._then,
  );

  final Mutation$set_customer_info _instance;

  final TRes Function(Mutation$set_customer_info) _then;

  static const _undefined = {};

  TRes call({
    Object? insert_customer_customer_one = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$set_customer_info(
        insert_customer_customer_one: insert_customer_customer_one == _undefined
            ? _instance.insert_customer_customer_one
            : (insert_customer_customer_one
                as Mutation$set_customer_info$insert_customer_customer_one?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$set_customer_info$insert_customer_customer_one<TRes>
      get insert_customer_customer_one {
    final local$insert_customer_customer_one =
        _instance.insert_customer_customer_one;
    return local$insert_customer_customer_one == null
        ? CopyWith$Mutation$set_customer_info$insert_customer_customer_one.stub(
            _then(_instance))
        : CopyWith$Mutation$set_customer_info$insert_customer_customer_one(
            local$insert_customer_customer_one,
            (e) => call(insert_customer_customer_one: e));
  }
}

class _CopyWithStubImpl$Mutation$set_customer_info<TRes>
    implements CopyWith$Mutation$set_customer_info<TRes> {
  _CopyWithStubImpl$Mutation$set_customer_info(this._res);

  TRes _res;

  call({
    Mutation$set_customer_info$insert_customer_customer_one?
        insert_customer_customer_one,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$set_customer_info$insert_customer_customer_one<TRes>
      get insert_customer_customer_one =>
          CopyWith$Mutation$set_customer_info$insert_customer_customer_one.stub(
              _res);
}

const documentNodeMutationset_customer_info = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'set_customer_info'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'user_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'app_version')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'insert_customer_customer_one'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'object'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'user_id'),
                value: VariableNode(name: NameNode(value: 'user_id')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'app_version'),
                value: VariableNode(name: NameNode(value: 'app_version')),
              ),
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'user_id'),
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
Mutation$set_customer_info _parserFn$Mutation$set_customer_info(
        Map<String, dynamic> data) =>
    Mutation$set_customer_info.fromJson(data);
typedef OnMutationCompleted$Mutation$set_customer_info = FutureOr<void>
    Function(
  dynamic,
  Mutation$set_customer_info?,
);

class Options$Mutation$set_customer_info
    extends graphql.MutationOptions<Mutation$set_customer_info> {
  Options$Mutation$set_customer_info({
    String? operationName,
    required Variables$Mutation$set_customer_info variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$set_customer_info? onCompleted,
    graphql.OnMutationUpdate<Mutation$set_customer_info>? update,
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
                        : _parserFn$Mutation$set_customer_info(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationset_customer_info,
          parserFn: _parserFn$Mutation$set_customer_info,
        );

  final OnMutationCompleted$Mutation$set_customer_info? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$set_customer_info
    extends graphql.WatchQueryOptions<Mutation$set_customer_info> {
  WatchOptions$Mutation$set_customer_info({
    String? operationName,
    required Variables$Mutation$set_customer_info variables,
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
          document: documentNodeMutationset_customer_info,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$set_customer_info,
        );
}

extension ClientExtension$Mutation$set_customer_info on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$set_customer_info>>
      mutate$set_customer_info(
              Options$Mutation$set_customer_info options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$set_customer_info>
      watchMutation$set_customer_info(
              WatchOptions$Mutation$set_customer_info options) =>
          this.watchMutation(options);
}

class Mutation$set_customer_info$insert_customer_customer_one {
  Mutation$set_customer_info$insert_customer_customer_one({
    required this.user_id,
    required this.$__typename,
  });

  factory Mutation$set_customer_info$insert_customer_customer_one.fromJson(
      Map<String, dynamic> json) {
    final l$user_id = json['user_id'];
    final l$$__typename = json['__typename'];
    return Mutation$set_customer_info$insert_customer_customer_one(
      user_id: (l$user_id as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int user_id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$user_id = user_id;
    _resultData['user_id'] = l$user_id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$user_id = user_id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$user_id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$set_customer_info$insert_customer_customer_one) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$user_id = user_id;
    final lOther$user_id = other.user_id;
    if (l$user_id != lOther$user_id) {
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

extension UtilityExtension$Mutation$set_customer_info$insert_customer_customer_one
    on Mutation$set_customer_info$insert_customer_customer_one {
  CopyWith$Mutation$set_customer_info$insert_customer_customer_one<
          Mutation$set_customer_info$insert_customer_customer_one>
      get copyWith =>
          CopyWith$Mutation$set_customer_info$insert_customer_customer_one(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$set_customer_info$insert_customer_customer_one<
    TRes> {
  factory CopyWith$Mutation$set_customer_info$insert_customer_customer_one(
    Mutation$set_customer_info$insert_customer_customer_one instance,
    TRes Function(Mutation$set_customer_info$insert_customer_customer_one) then,
  ) = _CopyWithImpl$Mutation$set_customer_info$insert_customer_customer_one;

  factory CopyWith$Mutation$set_customer_info$insert_customer_customer_one.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$set_customer_info$insert_customer_customer_one;

  TRes call({
    int? user_id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$set_customer_info$insert_customer_customer_one<
        TRes>
    implements
        CopyWith$Mutation$set_customer_info$insert_customer_customer_one<TRes> {
  _CopyWithImpl$Mutation$set_customer_info$insert_customer_customer_one(
    this._instance,
    this._then,
  );

  final Mutation$set_customer_info$insert_customer_customer_one _instance;

  final TRes Function(Mutation$set_customer_info$insert_customer_customer_one)
      _then;

  static const _undefined = {};

  TRes call({
    Object? user_id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$set_customer_info$insert_customer_customer_one(
        user_id: user_id == _undefined || user_id == null
            ? _instance.user_id
            : (user_id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$set_customer_info$insert_customer_customer_one<
        TRes>
    implements
        CopyWith$Mutation$set_customer_info$insert_customer_customer_one<TRes> {
  _CopyWithStubImpl$Mutation$set_customer_info$insert_customer_customer_one(
      this._res);

  TRes _res;

  call({
    int? user_id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$get_customer_orders {
  factory Variables$Query$get_customer_orders({
    required int custId,
    required bool inProcess,
    int? limit,
    int? offset,
  }) =>
      Variables$Query$get_customer_orders._({
        r'custId': custId,
        r'inProcess': inProcess,
        if (limit != null) r'limit': limit,
        if (offset != null) r'offset': offset,
      });

  Variables$Query$get_customer_orders._(this._$data);

  factory Variables$Query$get_customer_orders.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$custId = data['custId'];
    result$data['custId'] = (l$custId as int);
    final l$inProcess = data['inProcess'];
    result$data['inProcess'] = (l$inProcess as bool);
    if (data.containsKey('limit')) {
      final l$limit = data['limit'];
      result$data['limit'] = (l$limit as int?);
    }
    if (data.containsKey('offset')) {
      final l$offset = data['offset'];
      result$data['offset'] = (l$offset as int?);
    }
    return Variables$Query$get_customer_orders._(result$data);
  }

  Map<String, dynamic> _$data;

  int get custId => (_$data['custId'] as int);
  bool get inProcess => (_$data['inProcess'] as bool);
  int? get limit => (_$data['limit'] as int?);
  int? get offset => (_$data['offset'] as int?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$custId = custId;
    result$data['custId'] = l$custId;
    final l$inProcess = inProcess;
    result$data['inProcess'] = l$inProcess;
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

  CopyWith$Variables$Query$get_customer_orders<
          Variables$Query$get_customer_orders>
      get copyWith => CopyWith$Variables$Query$get_customer_orders(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$get_customer_orders) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$custId = custId;
    final lOther$custId = other.custId;
    if (l$custId != lOther$custId) {
      return false;
    }
    final l$inProcess = inProcess;
    final lOther$inProcess = other.inProcess;
    if (l$inProcess != lOther$inProcess) {
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
    final l$custId = custId;
    final l$inProcess = inProcess;
    final l$limit = limit;
    final l$offset = offset;
    return Object.hashAll([
      l$custId,
      l$inProcess,
      _$data.containsKey('limit') ? l$limit : const {},
      _$data.containsKey('offset') ? l$offset : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$get_customer_orders<TRes> {
  factory CopyWith$Variables$Query$get_customer_orders(
    Variables$Query$get_customer_orders instance,
    TRes Function(Variables$Query$get_customer_orders) then,
  ) = _CopyWithImpl$Variables$Query$get_customer_orders;

  factory CopyWith$Variables$Query$get_customer_orders.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$get_customer_orders;

  TRes call({
    int? custId,
    bool? inProcess,
    int? limit,
    int? offset,
  });
}

class _CopyWithImpl$Variables$Query$get_customer_orders<TRes>
    implements CopyWith$Variables$Query$get_customer_orders<TRes> {
  _CopyWithImpl$Variables$Query$get_customer_orders(
    this._instance,
    this._then,
  );

  final Variables$Query$get_customer_orders _instance;

  final TRes Function(Variables$Query$get_customer_orders) _then;

  static const _undefined = {};

  TRes call({
    Object? custId = _undefined,
    Object? inProcess = _undefined,
    Object? limit = _undefined,
    Object? offset = _undefined,
  }) =>
      _then(Variables$Query$get_customer_orders._({
        ..._instance._$data,
        if (custId != _undefined && custId != null) 'custId': (custId as int),
        if (inProcess != _undefined && inProcess != null)
          'inProcess': (inProcess as bool),
        if (limit != _undefined) 'limit': (limit as int?),
        if (offset != _undefined) 'offset': (offset as int?),
      }));
}

class _CopyWithStubImpl$Variables$Query$get_customer_orders<TRes>
    implements CopyWith$Variables$Query$get_customer_orders<TRes> {
  _CopyWithStubImpl$Variables$Query$get_customer_orders(this._res);

  TRes _res;

  call({
    int? custId,
    bool? inProcess,
    int? limit,
    int? offset,
  }) =>
      _res;
}

class Query$get_customer_orders {
  Query$get_customer_orders({
    required this.customer_minimal_orders,
    required this.$__typename,
  });

  factory Query$get_customer_orders.fromJson(Map<String, dynamic> json) {
    final l$customer_minimal_orders = json['customer_minimal_orders'];
    final l$$__typename = json['__typename'];
    return Query$get_customer_orders(
      customer_minimal_orders: (l$customer_minimal_orders as List<dynamic>)
          .map((e) =>
              Query$get_customer_orders$customer_minimal_orders.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$get_customer_orders$customer_minimal_orders>
      customer_minimal_orders;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$customer_minimal_orders = customer_minimal_orders;
    _resultData['customer_minimal_orders'] =
        l$customer_minimal_orders.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$customer_minimal_orders = customer_minimal_orders;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$customer_minimal_orders.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_customer_orders) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$customer_minimal_orders = customer_minimal_orders;
    final lOther$customer_minimal_orders = other.customer_minimal_orders;
    if (l$customer_minimal_orders.length !=
        lOther$customer_minimal_orders.length) {
      return false;
    }
    for (int i = 0; i < l$customer_minimal_orders.length; i++) {
      final l$customer_minimal_orders$entry = l$customer_minimal_orders[i];
      final lOther$customer_minimal_orders$entry =
          lOther$customer_minimal_orders[i];
      if (l$customer_minimal_orders$entry !=
          lOther$customer_minimal_orders$entry) {
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

extension UtilityExtension$Query$get_customer_orders
    on Query$get_customer_orders {
  CopyWith$Query$get_customer_orders<Query$get_customer_orders> get copyWith =>
      CopyWith$Query$get_customer_orders(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$get_customer_orders<TRes> {
  factory CopyWith$Query$get_customer_orders(
    Query$get_customer_orders instance,
    TRes Function(Query$get_customer_orders) then,
  ) = _CopyWithImpl$Query$get_customer_orders;

  factory CopyWith$Query$get_customer_orders.stub(TRes res) =
      _CopyWithStubImpl$Query$get_customer_orders;

  TRes call({
    List<Query$get_customer_orders$customer_minimal_orders>?
        customer_minimal_orders,
    String? $__typename,
  });
  TRes customer_minimal_orders(
      Iterable<Query$get_customer_orders$customer_minimal_orders> Function(
              Iterable<
                  CopyWith$Query$get_customer_orders$customer_minimal_orders<
                      Query$get_customer_orders$customer_minimal_orders>>)
          _fn);
}

class _CopyWithImpl$Query$get_customer_orders<TRes>
    implements CopyWith$Query$get_customer_orders<TRes> {
  _CopyWithImpl$Query$get_customer_orders(
    this._instance,
    this._then,
  );

  final Query$get_customer_orders _instance;

  final TRes Function(Query$get_customer_orders) _then;

  static const _undefined = {};

  TRes call({
    Object? customer_minimal_orders = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_customer_orders(
        customer_minimal_orders: customer_minimal_orders == _undefined ||
                customer_minimal_orders == null
            ? _instance.customer_minimal_orders
            : (customer_minimal_orders
                as List<Query$get_customer_orders$customer_minimal_orders>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes customer_minimal_orders(
          Iterable<Query$get_customer_orders$customer_minimal_orders> Function(
                  Iterable<
                      CopyWith$Query$get_customer_orders$customer_minimal_orders<
                          Query$get_customer_orders$customer_minimal_orders>>)
              _fn) =>
      call(
          customer_minimal_orders: _fn(_instance.customer_minimal_orders.map(
              (e) => CopyWith$Query$get_customer_orders$customer_minimal_orders(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$get_customer_orders<TRes>
    implements CopyWith$Query$get_customer_orders<TRes> {
  _CopyWithStubImpl$Query$get_customer_orders(this._res);

  TRes _res;

  call({
    List<Query$get_customer_orders$customer_minimal_orders>?
        customer_minimal_orders,
    String? $__typename,
  }) =>
      _res;
  customer_minimal_orders(_fn) => _res;
}

const documentNodeQueryget_customer_orders = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'get_customer_orders'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'custId')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'inProcess')),
        type: NamedTypeNode(
          name: NameNode(value: 'Boolean'),
          isNonNull: true,
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
        name: NameNode(value: 'customer_minimal_orders'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'args'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'cus_id'),
                value: VariableNode(name: NameNode(value: 'custId')),
              )
            ]),
          ),
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'in_process'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'inProcess')),
                  )
                ]),
              )
            ]),
          ),
          ArgumentNode(
            name: NameNode(value: 'order_by'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'order_time'),
                value: EnumValueNode(name: NameNode(value: 'desc')),
              )
            ]),
          ),
          ArgumentNode(
            name: NameNode(value: 'offset'),
            value: VariableNode(name: NameNode(value: 'offset')),
          ),
          ArgumentNode(
            name: NameNode(value: 'limit'),
            value: VariableNode(name: NameNode(value: 'limit')),
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
            name: NameNode(value: 'image'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'in_process'),
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
            name: NameNode(value: 'delivery_cost'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'to_address'),
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
            name: NameNode(value: 'order_type'),
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
            name: NameNode(value: 'status'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'total_cost'),
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
Query$get_customer_orders _parserFn$Query$get_customer_orders(
        Map<String, dynamic> data) =>
    Query$get_customer_orders.fromJson(data);

class Options$Query$get_customer_orders
    extends graphql.QueryOptions<Query$get_customer_orders> {
  Options$Query$get_customer_orders({
    String? operationName,
    required Variables$Query$get_customer_orders variables,
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
          document: documentNodeQueryget_customer_orders,
          parserFn: _parserFn$Query$get_customer_orders,
        );
}

class WatchOptions$Query$get_customer_orders
    extends graphql.WatchQueryOptions<Query$get_customer_orders> {
  WatchOptions$Query$get_customer_orders({
    String? operationName,
    required Variables$Query$get_customer_orders variables,
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
          document: documentNodeQueryget_customer_orders,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$get_customer_orders,
        );
}

class FetchMoreOptions$Query$get_customer_orders
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$get_customer_orders({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$get_customer_orders variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryget_customer_orders,
        );
}

extension ClientExtension$Query$get_customer_orders on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$get_customer_orders>>
      query$get_customer_orders(
              Options$Query$get_customer_orders options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$get_customer_orders>
      watchQuery$get_customer_orders(
              WatchOptions$Query$get_customer_orders options) =>
          this.watchQuery(options);
  void writeQuery$get_customer_orders({
    required Query$get_customer_orders data,
    required Variables$Query$get_customer_orders variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryget_customer_orders),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$get_customer_orders? readQuery$get_customer_orders({
    required Variables$Query$get_customer_orders variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQueryget_customer_orders),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$get_customer_orders.fromJson(result);
  }
}

class Query$get_customer_orders$customer_minimal_orders {
  Query$get_customer_orders$customer_minimal_orders({
    required this.id,
    this.image,
    required this.in_process,
    this.name,
    required this.delivery_cost,
    this.to_address,
    required this.order_time,
    required this.order_type,
    this.payment_type,
    required this.status,
    required this.total_cost,
    required this.$__typename,
  });

  factory Query$get_customer_orders$customer_minimal_orders.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$image = json['image'];
    final l$in_process = json['in_process'];
    final l$name = json['name'];
    final l$delivery_cost = json['delivery_cost'];
    final l$to_address = json['to_address'];
    final l$order_time = json['order_time'];
    final l$order_type = json['order_type'];
    final l$payment_type = json['payment_type'];
    final l$status = json['status'];
    final l$total_cost = json['total_cost'];
    final l$$__typename = json['__typename'];
    return Query$get_customer_orders$customer_minimal_orders(
      id: (l$id as int),
      image: (l$image as String?),
      in_process: (l$in_process as bool),
      name: (l$name as String?),
      delivery_cost: moneyFromJson(l$delivery_cost),
      to_address: (l$to_address as String?),
      order_time: (l$order_time as String),
      order_type: (l$order_type as String),
      payment_type: (l$payment_type as String?),
      status: (l$status as String),
      total_cost: moneyFromJson(l$total_cost),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String? image;

  final bool in_process;

  final String? name;

  final double delivery_cost;

  final String? to_address;

  final String order_time;

  final String order_type;

  final String? payment_type;

  final String status;

  final double total_cost;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$in_process = in_process;
    _resultData['in_process'] = l$in_process;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$delivery_cost = delivery_cost;
    _resultData['delivery_cost'] = moneyToJson(l$delivery_cost);
    final l$to_address = to_address;
    _resultData['to_address'] = l$to_address;
    final l$order_time = order_time;
    _resultData['order_time'] = l$order_time;
    final l$order_type = order_type;
    _resultData['order_type'] = l$order_type;
    final l$payment_type = payment_type;
    _resultData['payment_type'] = l$payment_type;
    final l$status = status;
    _resultData['status'] = l$status;
    final l$total_cost = total_cost;
    _resultData['total_cost'] = moneyToJson(l$total_cost);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$image = image;
    final l$in_process = in_process;
    final l$name = name;
    final l$delivery_cost = delivery_cost;
    final l$to_address = to_address;
    final l$order_time = order_time;
    final l$order_type = order_type;
    final l$payment_type = payment_type;
    final l$status = status;
    final l$total_cost = total_cost;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$image,
      l$in_process,
      l$name,
      l$delivery_cost,
      l$to_address,
      l$order_time,
      l$order_type,
      l$payment_type,
      l$status,
      l$total_cost,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_customer_orders$customer_minimal_orders) ||
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
    final l$in_process = in_process;
    final lOther$in_process = other.in_process;
    if (l$in_process != lOther$in_process) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$delivery_cost = delivery_cost;
    final lOther$delivery_cost = other.delivery_cost;
    if (l$delivery_cost != lOther$delivery_cost) {
      return false;
    }
    final l$to_address = to_address;
    final lOther$to_address = other.to_address;
    if (l$to_address != lOther$to_address) {
      return false;
    }
    final l$order_time = order_time;
    final lOther$order_time = other.order_time;
    if (l$order_time != lOther$order_time) {
      return false;
    }
    final l$order_type = order_type;
    final lOther$order_type = other.order_type;
    if (l$order_type != lOther$order_type) {
      return false;
    }
    final l$payment_type = payment_type;
    final lOther$payment_type = other.payment_type;
    if (l$payment_type != lOther$payment_type) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$total_cost = total_cost;
    final lOther$total_cost = other.total_cost;
    if (l$total_cost != lOther$total_cost) {
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

extension UtilityExtension$Query$get_customer_orders$customer_minimal_orders
    on Query$get_customer_orders$customer_minimal_orders {
  CopyWith$Query$get_customer_orders$customer_minimal_orders<
          Query$get_customer_orders$customer_minimal_orders>
      get copyWith =>
          CopyWith$Query$get_customer_orders$customer_minimal_orders(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_customer_orders$customer_minimal_orders<
    TRes> {
  factory CopyWith$Query$get_customer_orders$customer_minimal_orders(
    Query$get_customer_orders$customer_minimal_orders instance,
    TRes Function(Query$get_customer_orders$customer_minimal_orders) then,
  ) = _CopyWithImpl$Query$get_customer_orders$customer_minimal_orders;

  factory CopyWith$Query$get_customer_orders$customer_minimal_orders.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_customer_orders$customer_minimal_orders;

  TRes call({
    int? id,
    String? image,
    bool? in_process,
    String? name,
    double? delivery_cost,
    String? to_address,
    String? order_time,
    String? order_type,
    String? payment_type,
    String? status,
    double? total_cost,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_customer_orders$customer_minimal_orders<TRes>
    implements
        CopyWith$Query$get_customer_orders$customer_minimal_orders<TRes> {
  _CopyWithImpl$Query$get_customer_orders$customer_minimal_orders(
    this._instance,
    this._then,
  );

  final Query$get_customer_orders$customer_minimal_orders _instance;

  final TRes Function(Query$get_customer_orders$customer_minimal_orders) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? image = _undefined,
    Object? in_process = _undefined,
    Object? name = _undefined,
    Object? delivery_cost = _undefined,
    Object? to_address = _undefined,
    Object? order_time = _undefined,
    Object? order_type = _undefined,
    Object? payment_type = _undefined,
    Object? status = _undefined,
    Object? total_cost = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_customer_orders$customer_minimal_orders(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        image: image == _undefined ? _instance.image : (image as String?),
        in_process: in_process == _undefined || in_process == null
            ? _instance.in_process
            : (in_process as bool),
        name: name == _undefined ? _instance.name : (name as String?),
        delivery_cost: delivery_cost == _undefined || delivery_cost == null
            ? _instance.delivery_cost
            : (delivery_cost as double),
        to_address: to_address == _undefined
            ? _instance.to_address
            : (to_address as String?),
        order_time: order_time == _undefined || order_time == null
            ? _instance.order_time
            : (order_time as String),
        order_type: order_type == _undefined || order_type == null
            ? _instance.order_type
            : (order_type as String),
        payment_type: payment_type == _undefined
            ? _instance.payment_type
            : (payment_type as String?),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as String),
        total_cost: total_cost == _undefined || total_cost == null
            ? _instance.total_cost
            : (total_cost as double),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$get_customer_orders$customer_minimal_orders<TRes>
    implements
        CopyWith$Query$get_customer_orders$customer_minimal_orders<TRes> {
  _CopyWithStubImpl$Query$get_customer_orders$customer_minimal_orders(
      this._res);

  TRes _res;

  call({
    int? id,
    String? image,
    bool? in_process,
    String? name,
    double? delivery_cost,
    String? to_address,
    String? order_time,
    String? order_type,
    String? payment_type,
    String? status,
    double? total_cost,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Subscription$listen_on_customer_orders {
  factory Variables$Subscription$listen_on_customer_orders({
    required int custId,
    required bool inProcess,
  }) =>
      Variables$Subscription$listen_on_customer_orders._({
        r'custId': custId,
        r'inProcess': inProcess,
      });

  Variables$Subscription$listen_on_customer_orders._(this._$data);

  factory Variables$Subscription$listen_on_customer_orders.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$custId = data['custId'];
    result$data['custId'] = (l$custId as int);
    final l$inProcess = data['inProcess'];
    result$data['inProcess'] = (l$inProcess as bool);
    return Variables$Subscription$listen_on_customer_orders._(result$data);
  }

  Map<String, dynamic> _$data;

  int get custId => (_$data['custId'] as int);
  bool get inProcess => (_$data['inProcess'] as bool);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$custId = custId;
    result$data['custId'] = l$custId;
    final l$inProcess = inProcess;
    result$data['inProcess'] = l$inProcess;
    return result$data;
  }

  CopyWith$Variables$Subscription$listen_on_customer_orders<
          Variables$Subscription$listen_on_customer_orders>
      get copyWith => CopyWith$Variables$Subscription$listen_on_customer_orders(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Subscription$listen_on_customer_orders) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$custId = custId;
    final lOther$custId = other.custId;
    if (l$custId != lOther$custId) {
      return false;
    }
    final l$inProcess = inProcess;
    final lOther$inProcess = other.inProcess;
    if (l$inProcess != lOther$inProcess) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$custId = custId;
    final l$inProcess = inProcess;
    return Object.hashAll([
      l$custId,
      l$inProcess,
    ]);
  }
}

abstract class CopyWith$Variables$Subscription$listen_on_customer_orders<TRes> {
  factory CopyWith$Variables$Subscription$listen_on_customer_orders(
    Variables$Subscription$listen_on_customer_orders instance,
    TRes Function(Variables$Subscription$listen_on_customer_orders) then,
  ) = _CopyWithImpl$Variables$Subscription$listen_on_customer_orders;

  factory CopyWith$Variables$Subscription$listen_on_customer_orders.stub(
          TRes res) =
      _CopyWithStubImpl$Variables$Subscription$listen_on_customer_orders;

  TRes call({
    int? custId,
    bool? inProcess,
  });
}

class _CopyWithImpl$Variables$Subscription$listen_on_customer_orders<TRes>
    implements CopyWith$Variables$Subscription$listen_on_customer_orders<TRes> {
  _CopyWithImpl$Variables$Subscription$listen_on_customer_orders(
    this._instance,
    this._then,
  );

  final Variables$Subscription$listen_on_customer_orders _instance;

  final TRes Function(Variables$Subscription$listen_on_customer_orders) _then;

  static const _undefined = {};

  TRes call({
    Object? custId = _undefined,
    Object? inProcess = _undefined,
  }) =>
      _then(Variables$Subscription$listen_on_customer_orders._({
        ..._instance._$data,
        if (custId != _undefined && custId != null) 'custId': (custId as int),
        if (inProcess != _undefined && inProcess != null)
          'inProcess': (inProcess as bool),
      }));
}

class _CopyWithStubImpl$Variables$Subscription$listen_on_customer_orders<TRes>
    implements CopyWith$Variables$Subscription$listen_on_customer_orders<TRes> {
  _CopyWithStubImpl$Variables$Subscription$listen_on_customer_orders(this._res);

  TRes _res;

  call({
    int? custId,
    bool? inProcess,
  }) =>
      _res;
}

class Subscription$listen_on_customer_orders {
  Subscription$listen_on_customer_orders({
    required this.customer_minimal_orders,
    required this.$__typename,
  });

  factory Subscription$listen_on_customer_orders.fromJson(
      Map<String, dynamic> json) {
    final l$customer_minimal_orders = json['customer_minimal_orders'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_customer_orders(
      customer_minimal_orders: (l$customer_minimal_orders as List<dynamic>)
          .map((e) =>
              Subscription$listen_on_customer_orders$customer_minimal_orders
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Subscription$listen_on_customer_orders$customer_minimal_orders>
      customer_minimal_orders;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$customer_minimal_orders = customer_minimal_orders;
    _resultData['customer_minimal_orders'] =
        l$customer_minimal_orders.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$customer_minimal_orders = customer_minimal_orders;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$customer_minimal_orders.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Subscription$listen_on_customer_orders) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$customer_minimal_orders = customer_minimal_orders;
    final lOther$customer_minimal_orders = other.customer_minimal_orders;
    if (l$customer_minimal_orders.length !=
        lOther$customer_minimal_orders.length) {
      return false;
    }
    for (int i = 0; i < l$customer_minimal_orders.length; i++) {
      final l$customer_minimal_orders$entry = l$customer_minimal_orders[i];
      final lOther$customer_minimal_orders$entry =
          lOther$customer_minimal_orders[i];
      if (l$customer_minimal_orders$entry !=
          lOther$customer_minimal_orders$entry) {
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

extension UtilityExtension$Subscription$listen_on_customer_orders
    on Subscription$listen_on_customer_orders {
  CopyWith$Subscription$listen_on_customer_orders<
          Subscription$listen_on_customer_orders>
      get copyWith => CopyWith$Subscription$listen_on_customer_orders(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_customer_orders<TRes> {
  factory CopyWith$Subscription$listen_on_customer_orders(
    Subscription$listen_on_customer_orders instance,
    TRes Function(Subscription$listen_on_customer_orders) then,
  ) = _CopyWithImpl$Subscription$listen_on_customer_orders;

  factory CopyWith$Subscription$listen_on_customer_orders.stub(TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_customer_orders;

  TRes call({
    List<Subscription$listen_on_customer_orders$customer_minimal_orders>?
        customer_minimal_orders,
    String? $__typename,
  });
  TRes customer_minimal_orders(
      Iterable<Subscription$listen_on_customer_orders$customer_minimal_orders> Function(
              Iterable<
                  CopyWith$Subscription$listen_on_customer_orders$customer_minimal_orders<
                      Subscription$listen_on_customer_orders$customer_minimal_orders>>)
          _fn);
}

class _CopyWithImpl$Subscription$listen_on_customer_orders<TRes>
    implements CopyWith$Subscription$listen_on_customer_orders<TRes> {
  _CopyWithImpl$Subscription$listen_on_customer_orders(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_customer_orders _instance;

  final TRes Function(Subscription$listen_on_customer_orders) _then;

  static const _undefined = {};

  TRes call({
    Object? customer_minimal_orders = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$listen_on_customer_orders(
        customer_minimal_orders: customer_minimal_orders == _undefined ||
                customer_minimal_orders == null
            ? _instance.customer_minimal_orders
            : (customer_minimal_orders as List<
                Subscription$listen_on_customer_orders$customer_minimal_orders>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes customer_minimal_orders(
          Iterable<Subscription$listen_on_customer_orders$customer_minimal_orders> Function(
                  Iterable<
                      CopyWith$Subscription$listen_on_customer_orders$customer_minimal_orders<
                          Subscription$listen_on_customer_orders$customer_minimal_orders>>)
              _fn) =>
      call(
          customer_minimal_orders: _fn(_instance.customer_minimal_orders.map((e) =>
              CopyWith$Subscription$listen_on_customer_orders$customer_minimal_orders(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Subscription$listen_on_customer_orders<TRes>
    implements CopyWith$Subscription$listen_on_customer_orders<TRes> {
  _CopyWithStubImpl$Subscription$listen_on_customer_orders(this._res);

  TRes _res;

  call({
    List<Subscription$listen_on_customer_orders$customer_minimal_orders>?
        customer_minimal_orders,
    String? $__typename,
  }) =>
      _res;
  customer_minimal_orders(_fn) => _res;
}

const documentNodeSubscriptionlisten_on_customer_orders =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.subscription,
    name: NameNode(value: 'listen_on_customer_orders'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'custId')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'inProcess')),
        type: NamedTypeNode(
          name: NameNode(value: 'Boolean'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'customer_minimal_orders'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'args'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'cus_id'),
                value: VariableNode(name: NameNode(value: 'custId')),
              )
            ]),
          ),
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'in_process'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'inProcess')),
                  )
                ]),
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
            name: NameNode(value: 'image'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'in_process'),
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
            name: NameNode(value: 'delivery_cost'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'to_address'),
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
            name: NameNode(value: 'order_type'),
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
            name: NameNode(value: 'status'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'total_cost'),
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
Subscription$listen_on_customer_orders
    _parserFn$Subscription$listen_on_customer_orders(
            Map<String, dynamic> data) =>
        Subscription$listen_on_customer_orders.fromJson(data);

class Options$Subscription$listen_on_customer_orders extends graphql
    .SubscriptionOptions<Subscription$listen_on_customer_orders> {
  Options$Subscription$listen_on_customer_orders({
    String? operationName,
    required Variables$Subscription$listen_on_customer_orders variables,
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
          document: documentNodeSubscriptionlisten_on_customer_orders,
          parserFn: _parserFn$Subscription$listen_on_customer_orders,
        );
}

class WatchOptions$Subscription$listen_on_customer_orders
    extends graphql.WatchQueryOptions<Subscription$listen_on_customer_orders> {
  WatchOptions$Subscription$listen_on_customer_orders({
    String? operationName,
    required Variables$Subscription$listen_on_customer_orders variables,
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
          document: documentNodeSubscriptionlisten_on_customer_orders,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Subscription$listen_on_customer_orders,
        );
}

class FetchMoreOptions$Subscription$listen_on_customer_orders
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Subscription$listen_on_customer_orders({
    required graphql.UpdateQuery updateQuery,
    required Variables$Subscription$listen_on_customer_orders variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeSubscriptionlisten_on_customer_orders,
        );
}

extension ClientExtension$Subscription$listen_on_customer_orders
    on graphql.GraphQLClient {
  Stream<graphql.QueryResult<Subscription$listen_on_customer_orders>>
      subscribe$listen_on_customer_orders(
              Options$Subscription$listen_on_customer_orders options) =>
          this.subscribe(options);
  graphql.ObservableQuery<Subscription$listen_on_customer_orders>
      watchSubscription$listen_on_customer_orders(
              WatchOptions$Subscription$listen_on_customer_orders options) =>
          this.watchQuery(options);
}

class Subscription$listen_on_customer_orders$customer_minimal_orders {
  Subscription$listen_on_customer_orders$customer_minimal_orders({
    required this.id,
    this.image,
    required this.in_process,
    this.name,
    required this.delivery_cost,
    this.to_address,
    required this.order_time,
    required this.order_type,
    this.payment_type,
    required this.status,
    required this.total_cost,
    required this.$__typename,
  });

  factory Subscription$listen_on_customer_orders$customer_minimal_orders.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$image = json['image'];
    final l$in_process = json['in_process'];
    final l$name = json['name'];
    final l$delivery_cost = json['delivery_cost'];
    final l$to_address = json['to_address'];
    final l$order_time = json['order_time'];
    final l$order_type = json['order_type'];
    final l$payment_type = json['payment_type'];
    final l$status = json['status'];
    final l$total_cost = json['total_cost'];
    final l$$__typename = json['__typename'];
    return Subscription$listen_on_customer_orders$customer_minimal_orders(
      id: (l$id as int),
      image: (l$image as String?),
      in_process: (l$in_process as bool),
      name: (l$name as String?),
      delivery_cost: moneyFromJson(l$delivery_cost),
      to_address: (l$to_address as String?),
      order_time: (l$order_time as String),
      order_type: (l$order_type as String),
      payment_type: (l$payment_type as String?),
      status: (l$status as String),
      total_cost: moneyFromJson(l$total_cost),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String? image;

  final bool in_process;

  final String? name;

  final double delivery_cost;

  final String? to_address;

  final String order_time;

  final String order_type;

  final String? payment_type;

  final String status;

  final double total_cost;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$in_process = in_process;
    _resultData['in_process'] = l$in_process;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$delivery_cost = delivery_cost;
    _resultData['delivery_cost'] = moneyToJson(l$delivery_cost);
    final l$to_address = to_address;
    _resultData['to_address'] = l$to_address;
    final l$order_time = order_time;
    _resultData['order_time'] = l$order_time;
    final l$order_type = order_type;
    _resultData['order_type'] = l$order_type;
    final l$payment_type = payment_type;
    _resultData['payment_type'] = l$payment_type;
    final l$status = status;
    _resultData['status'] = l$status;
    final l$total_cost = total_cost;
    _resultData['total_cost'] = moneyToJson(l$total_cost);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$image = image;
    final l$in_process = in_process;
    final l$name = name;
    final l$delivery_cost = delivery_cost;
    final l$to_address = to_address;
    final l$order_time = order_time;
    final l$order_type = order_type;
    final l$payment_type = payment_type;
    final l$status = status;
    final l$total_cost = total_cost;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$image,
      l$in_process,
      l$name,
      l$delivery_cost,
      l$to_address,
      l$order_time,
      l$order_type,
      l$payment_type,
      l$status,
      l$total_cost,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Subscription$listen_on_customer_orders$customer_minimal_orders) ||
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
    final l$in_process = in_process;
    final lOther$in_process = other.in_process;
    if (l$in_process != lOther$in_process) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$delivery_cost = delivery_cost;
    final lOther$delivery_cost = other.delivery_cost;
    if (l$delivery_cost != lOther$delivery_cost) {
      return false;
    }
    final l$to_address = to_address;
    final lOther$to_address = other.to_address;
    if (l$to_address != lOther$to_address) {
      return false;
    }
    final l$order_time = order_time;
    final lOther$order_time = other.order_time;
    if (l$order_time != lOther$order_time) {
      return false;
    }
    final l$order_type = order_type;
    final lOther$order_type = other.order_type;
    if (l$order_type != lOther$order_type) {
      return false;
    }
    final l$payment_type = payment_type;
    final lOther$payment_type = other.payment_type;
    if (l$payment_type != lOther$payment_type) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$total_cost = total_cost;
    final lOther$total_cost = other.total_cost;
    if (l$total_cost != lOther$total_cost) {
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

extension UtilityExtension$Subscription$listen_on_customer_orders$customer_minimal_orders
    on Subscription$listen_on_customer_orders$customer_minimal_orders {
  CopyWith$Subscription$listen_on_customer_orders$customer_minimal_orders<
          Subscription$listen_on_customer_orders$customer_minimal_orders>
      get copyWith =>
          CopyWith$Subscription$listen_on_customer_orders$customer_minimal_orders(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listen_on_customer_orders$customer_minimal_orders<
    TRes> {
  factory CopyWith$Subscription$listen_on_customer_orders$customer_minimal_orders(
    Subscription$listen_on_customer_orders$customer_minimal_orders instance,
    TRes Function(
            Subscription$listen_on_customer_orders$customer_minimal_orders)
        then,
  ) = _CopyWithImpl$Subscription$listen_on_customer_orders$customer_minimal_orders;

  factory CopyWith$Subscription$listen_on_customer_orders$customer_minimal_orders.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listen_on_customer_orders$customer_minimal_orders;

  TRes call({
    int? id,
    String? image,
    bool? in_process,
    String? name,
    double? delivery_cost,
    String? to_address,
    String? order_time,
    String? order_type,
    String? payment_type,
    String? status,
    double? total_cost,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$listen_on_customer_orders$customer_minimal_orders<
        TRes>
    implements
        CopyWith$Subscription$listen_on_customer_orders$customer_minimal_orders<
            TRes> {
  _CopyWithImpl$Subscription$listen_on_customer_orders$customer_minimal_orders(
    this._instance,
    this._then,
  );

  final Subscription$listen_on_customer_orders$customer_minimal_orders
      _instance;

  final TRes Function(
      Subscription$listen_on_customer_orders$customer_minimal_orders) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? image = _undefined,
    Object? in_process = _undefined,
    Object? name = _undefined,
    Object? delivery_cost = _undefined,
    Object? to_address = _undefined,
    Object? order_time = _undefined,
    Object? order_type = _undefined,
    Object? payment_type = _undefined,
    Object? status = _undefined,
    Object? total_cost = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$listen_on_customer_orders$customer_minimal_orders(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        image: image == _undefined ? _instance.image : (image as String?),
        in_process: in_process == _undefined || in_process == null
            ? _instance.in_process
            : (in_process as bool),
        name: name == _undefined ? _instance.name : (name as String?),
        delivery_cost: delivery_cost == _undefined || delivery_cost == null
            ? _instance.delivery_cost
            : (delivery_cost as double),
        to_address: to_address == _undefined
            ? _instance.to_address
            : (to_address as String?),
        order_time: order_time == _undefined || order_time == null
            ? _instance.order_time
            : (order_time as String),
        order_type: order_type == _undefined || order_type == null
            ? _instance.order_type
            : (order_type as String),
        payment_type: payment_type == _undefined
            ? _instance.payment_type
            : (payment_type as String?),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as String),
        total_cost: total_cost == _undefined || total_cost == null
            ? _instance.total_cost
            : (total_cost as double),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Subscription$listen_on_customer_orders$customer_minimal_orders<
        TRes>
    implements
        CopyWith$Subscription$listen_on_customer_orders$customer_minimal_orders<
            TRes> {
  _CopyWithStubImpl$Subscription$listen_on_customer_orders$customer_minimal_orders(
      this._res);

  TRes _res;

  call({
    int? id,
    String? image,
    bool? in_process,
    String? name,
    double? delivery_cost,
    String? to_address,
    String? order_time,
    String? order_type,
    String? payment_type,
    String? status,
    double? total_cost,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$updateDriverOrderReviewId {
  factory Variables$Mutation$updateDriverOrderReviewId({
    required int orderId,
    required int reviewId,
  }) =>
      Variables$Mutation$updateDriverOrderReviewId._({
        r'orderId': orderId,
        r'reviewId': reviewId,
      });

  Variables$Mutation$updateDriverOrderReviewId._(this._$data);

  factory Variables$Mutation$updateDriverOrderReviewId.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$orderId = data['orderId'];
    result$data['orderId'] = (l$orderId as int);
    final l$reviewId = data['reviewId'];
    result$data['reviewId'] = (l$reviewId as int);
    return Variables$Mutation$updateDriverOrderReviewId._(result$data);
  }

  Map<String, dynamic> _$data;

  int get orderId => (_$data['orderId'] as int);
  int get reviewId => (_$data['reviewId'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$orderId = orderId;
    result$data['orderId'] = l$orderId;
    final l$reviewId = reviewId;
    result$data['reviewId'] = l$reviewId;
    return result$data;
  }

  CopyWith$Variables$Mutation$updateDriverOrderReviewId<
          Variables$Mutation$updateDriverOrderReviewId>
      get copyWith => CopyWith$Variables$Mutation$updateDriverOrderReviewId(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$updateDriverOrderReviewId) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$orderId = orderId;
    final lOther$orderId = other.orderId;
    if (l$orderId != lOther$orderId) {
      return false;
    }
    final l$reviewId = reviewId;
    final lOther$reviewId = other.reviewId;
    if (l$reviewId != lOther$reviewId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$orderId = orderId;
    final l$reviewId = reviewId;
    return Object.hashAll([
      l$orderId,
      l$reviewId,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$updateDriverOrderReviewId<TRes> {
  factory CopyWith$Variables$Mutation$updateDriverOrderReviewId(
    Variables$Mutation$updateDriverOrderReviewId instance,
    TRes Function(Variables$Mutation$updateDriverOrderReviewId) then,
  ) = _CopyWithImpl$Variables$Mutation$updateDriverOrderReviewId;

  factory CopyWith$Variables$Mutation$updateDriverOrderReviewId.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$updateDriverOrderReviewId;

  TRes call({
    int? orderId,
    int? reviewId,
  });
}

class _CopyWithImpl$Variables$Mutation$updateDriverOrderReviewId<TRes>
    implements CopyWith$Variables$Mutation$updateDriverOrderReviewId<TRes> {
  _CopyWithImpl$Variables$Mutation$updateDriverOrderReviewId(
    this._instance,
    this._then,
  );

  final Variables$Mutation$updateDriverOrderReviewId _instance;

  final TRes Function(Variables$Mutation$updateDriverOrderReviewId) _then;

  static const _undefined = {};

  TRes call({
    Object? orderId = _undefined,
    Object? reviewId = _undefined,
  }) =>
      _then(Variables$Mutation$updateDriverOrderReviewId._({
        ..._instance._$data,
        if (orderId != _undefined && orderId != null)
          'orderId': (orderId as int),
        if (reviewId != _undefined && reviewId != null)
          'reviewId': (reviewId as int),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$updateDriverOrderReviewId<TRes>
    implements CopyWith$Variables$Mutation$updateDriverOrderReviewId<TRes> {
  _CopyWithStubImpl$Variables$Mutation$updateDriverOrderReviewId(this._res);

  TRes _res;

  call({
    int? orderId,
    int? reviewId,
  }) =>
      _res;
}

class Mutation$updateDriverOrderReviewId {
  Mutation$updateDriverOrderReviewId({
    this.update_delivery_order_by_pk,
    required this.$__typename,
  });

  factory Mutation$updateDriverOrderReviewId.fromJson(
      Map<String, dynamic> json) {
    final l$update_delivery_order_by_pk = json['update_delivery_order_by_pk'];
    final l$$__typename = json['__typename'];
    return Mutation$updateDriverOrderReviewId(
      update_delivery_order_by_pk: l$update_delivery_order_by_pk == null
          ? null
          : Mutation$updateDriverOrderReviewId$update_delivery_order_by_pk
              .fromJson(
                  (l$update_delivery_order_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$updateDriverOrderReviewId$update_delivery_order_by_pk?
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
    if (!(other is Mutation$updateDriverOrderReviewId) ||
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

extension UtilityExtension$Mutation$updateDriverOrderReviewId
    on Mutation$updateDriverOrderReviewId {
  CopyWith$Mutation$updateDriverOrderReviewId<
          Mutation$updateDriverOrderReviewId>
      get copyWith => CopyWith$Mutation$updateDriverOrderReviewId(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateDriverOrderReviewId<TRes> {
  factory CopyWith$Mutation$updateDriverOrderReviewId(
    Mutation$updateDriverOrderReviewId instance,
    TRes Function(Mutation$updateDriverOrderReviewId) then,
  ) = _CopyWithImpl$Mutation$updateDriverOrderReviewId;

  factory CopyWith$Mutation$updateDriverOrderReviewId.stub(TRes res) =
      _CopyWithStubImpl$Mutation$updateDriverOrderReviewId;

  TRes call({
    Mutation$updateDriverOrderReviewId$update_delivery_order_by_pk?
        update_delivery_order_by_pk,
    String? $__typename,
  });
  CopyWith$Mutation$updateDriverOrderReviewId$update_delivery_order_by_pk<TRes>
      get update_delivery_order_by_pk;
}

class _CopyWithImpl$Mutation$updateDriverOrderReviewId<TRes>
    implements CopyWith$Mutation$updateDriverOrderReviewId<TRes> {
  _CopyWithImpl$Mutation$updateDriverOrderReviewId(
    this._instance,
    this._then,
  );

  final Mutation$updateDriverOrderReviewId _instance;

  final TRes Function(Mutation$updateDriverOrderReviewId) _then;

  static const _undefined = {};

  TRes call({
    Object? update_delivery_order_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$updateDriverOrderReviewId(
        update_delivery_order_by_pk: update_delivery_order_by_pk == _undefined
            ? _instance.update_delivery_order_by_pk
            : (update_delivery_order_by_pk
                as Mutation$updateDriverOrderReviewId$update_delivery_order_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$updateDriverOrderReviewId$update_delivery_order_by_pk<TRes>
      get update_delivery_order_by_pk {
    final local$update_delivery_order_by_pk =
        _instance.update_delivery_order_by_pk;
    return local$update_delivery_order_by_pk == null
        ? CopyWith$Mutation$updateDriverOrderReviewId$update_delivery_order_by_pk
            .stub(_then(_instance))
        : CopyWith$Mutation$updateDriverOrderReviewId$update_delivery_order_by_pk(
            local$update_delivery_order_by_pk,
            (e) => call(update_delivery_order_by_pk: e));
  }
}

class _CopyWithStubImpl$Mutation$updateDriverOrderReviewId<TRes>
    implements CopyWith$Mutation$updateDriverOrderReviewId<TRes> {
  _CopyWithStubImpl$Mutation$updateDriverOrderReviewId(this._res);

  TRes _res;

  call({
    Mutation$updateDriverOrderReviewId$update_delivery_order_by_pk?
        update_delivery_order_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$updateDriverOrderReviewId$update_delivery_order_by_pk<TRes>
      get update_delivery_order_by_pk =>
          CopyWith$Mutation$updateDriverOrderReviewId$update_delivery_order_by_pk
              .stub(_res);
}

const documentNodeMutationupdateDriverOrderReviewId =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'updateDriverOrderReviewId'),
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
        variable: VariableNode(name: NameNode(value: 'reviewId')),
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
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'driver_review_by_customer_id'),
                value: VariableNode(name: NameNode(value: 'reviewId')),
              )
            ]),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'driver_review_by_customer_id'),
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
Mutation$updateDriverOrderReviewId _parserFn$Mutation$updateDriverOrderReviewId(
        Map<String, dynamic> data) =>
    Mutation$updateDriverOrderReviewId.fromJson(data);
typedef OnMutationCompleted$Mutation$updateDriverOrderReviewId = FutureOr<void>
    Function(
  dynamic,
  Mutation$updateDriverOrderReviewId?,
);

class Options$Mutation$updateDriverOrderReviewId
    extends graphql.MutationOptions<Mutation$updateDriverOrderReviewId> {
  Options$Mutation$updateDriverOrderReviewId({
    String? operationName,
    required Variables$Mutation$updateDriverOrderReviewId variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$updateDriverOrderReviewId? onCompleted,
    graphql.OnMutationUpdate<Mutation$updateDriverOrderReviewId>? update,
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
                        : _parserFn$Mutation$updateDriverOrderReviewId(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationupdateDriverOrderReviewId,
          parserFn: _parserFn$Mutation$updateDriverOrderReviewId,
        );

  final OnMutationCompleted$Mutation$updateDriverOrderReviewId?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$updateDriverOrderReviewId
    extends graphql.WatchQueryOptions<Mutation$updateDriverOrderReviewId> {
  WatchOptions$Mutation$updateDriverOrderReviewId({
    String? operationName,
    required Variables$Mutation$updateDriverOrderReviewId variables,
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
          document: documentNodeMutationupdateDriverOrderReviewId,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$updateDriverOrderReviewId,
        );
}

extension ClientExtension$Mutation$updateDriverOrderReviewId
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$updateDriverOrderReviewId>>
      mutate$updateDriverOrderReviewId(
              Options$Mutation$updateDriverOrderReviewId options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$updateDriverOrderReviewId>
      watchMutation$updateDriverOrderReviewId(
              WatchOptions$Mutation$updateDriverOrderReviewId options) =>
          this.watchMutation(options);
}

class Mutation$updateDriverOrderReviewId$update_delivery_order_by_pk {
  Mutation$updateDriverOrderReviewId$update_delivery_order_by_pk({
    this.driver_review_by_customer_id,
    required this.$__typename,
  });

  factory Mutation$updateDriverOrderReviewId$update_delivery_order_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$driver_review_by_customer_id = json['driver_review_by_customer_id'];
    final l$$__typename = json['__typename'];
    return Mutation$updateDriverOrderReviewId$update_delivery_order_by_pk(
      driver_review_by_customer_id: (l$driver_review_by_customer_id as int?),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int? driver_review_by_customer_id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$driver_review_by_customer_id = driver_review_by_customer_id;
    _resultData['driver_review_by_customer_id'] =
        l$driver_review_by_customer_id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$driver_review_by_customer_id = driver_review_by_customer_id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$driver_review_by_customer_id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Mutation$updateDriverOrderReviewId$update_delivery_order_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$driver_review_by_customer_id = driver_review_by_customer_id;
    final lOther$driver_review_by_customer_id =
        other.driver_review_by_customer_id;
    if (l$driver_review_by_customer_id != lOther$driver_review_by_customer_id) {
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

extension UtilityExtension$Mutation$updateDriverOrderReviewId$update_delivery_order_by_pk
    on Mutation$updateDriverOrderReviewId$update_delivery_order_by_pk {
  CopyWith$Mutation$updateDriverOrderReviewId$update_delivery_order_by_pk<
          Mutation$updateDriverOrderReviewId$update_delivery_order_by_pk>
      get copyWith =>
          CopyWith$Mutation$updateDriverOrderReviewId$update_delivery_order_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateDriverOrderReviewId$update_delivery_order_by_pk<
    TRes> {
  factory CopyWith$Mutation$updateDriverOrderReviewId$update_delivery_order_by_pk(
    Mutation$updateDriverOrderReviewId$update_delivery_order_by_pk instance,
    TRes Function(
            Mutation$updateDriverOrderReviewId$update_delivery_order_by_pk)
        then,
  ) = _CopyWithImpl$Mutation$updateDriverOrderReviewId$update_delivery_order_by_pk;

  factory CopyWith$Mutation$updateDriverOrderReviewId$update_delivery_order_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$updateDriverOrderReviewId$update_delivery_order_by_pk;

  TRes call({
    int? driver_review_by_customer_id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$updateDriverOrderReviewId$update_delivery_order_by_pk<
        TRes>
    implements
        CopyWith$Mutation$updateDriverOrderReviewId$update_delivery_order_by_pk<
            TRes> {
  _CopyWithImpl$Mutation$updateDriverOrderReviewId$update_delivery_order_by_pk(
    this._instance,
    this._then,
  );

  final Mutation$updateDriverOrderReviewId$update_delivery_order_by_pk
      _instance;

  final TRes Function(
      Mutation$updateDriverOrderReviewId$update_delivery_order_by_pk) _then;

  static const _undefined = {};

  TRes call({
    Object? driver_review_by_customer_id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$updateDriverOrderReviewId$update_delivery_order_by_pk(
        driver_review_by_customer_id: driver_review_by_customer_id == _undefined
            ? _instance.driver_review_by_customer_id
            : (driver_review_by_customer_id as int?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$updateDriverOrderReviewId$update_delivery_order_by_pk<
        TRes>
    implements
        CopyWith$Mutation$updateDriverOrderReviewId$update_delivery_order_by_pk<
            TRes> {
  _CopyWithStubImpl$Mutation$updateDriverOrderReviewId$update_delivery_order_by_pk(
      this._res);

  TRes _res;

  call({
    int? driver_review_by_customer_id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$updateRestaurantOrderReviewId {
  factory Variables$Mutation$updateRestaurantOrderReviewId({
    required int orderId,
    required int reviewId,
  }) =>
      Variables$Mutation$updateRestaurantOrderReviewId._({
        r'orderId': orderId,
        r'reviewId': reviewId,
      });

  Variables$Mutation$updateRestaurantOrderReviewId._(this._$data);

  factory Variables$Mutation$updateRestaurantOrderReviewId.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$orderId = data['orderId'];
    result$data['orderId'] = (l$orderId as int);
    final l$reviewId = data['reviewId'];
    result$data['reviewId'] = (l$reviewId as int);
    return Variables$Mutation$updateRestaurantOrderReviewId._(result$data);
  }

  Map<String, dynamic> _$data;

  int get orderId => (_$data['orderId'] as int);
  int get reviewId => (_$data['reviewId'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$orderId = orderId;
    result$data['orderId'] = l$orderId;
    final l$reviewId = reviewId;
    result$data['reviewId'] = l$reviewId;
    return result$data;
  }

  CopyWith$Variables$Mutation$updateRestaurantOrderReviewId<
          Variables$Mutation$updateRestaurantOrderReviewId>
      get copyWith => CopyWith$Variables$Mutation$updateRestaurantOrderReviewId(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$updateRestaurantOrderReviewId) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$orderId = orderId;
    final lOther$orderId = other.orderId;
    if (l$orderId != lOther$orderId) {
      return false;
    }
    final l$reviewId = reviewId;
    final lOther$reviewId = other.reviewId;
    if (l$reviewId != lOther$reviewId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$orderId = orderId;
    final l$reviewId = reviewId;
    return Object.hashAll([
      l$orderId,
      l$reviewId,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$updateRestaurantOrderReviewId<TRes> {
  factory CopyWith$Variables$Mutation$updateRestaurantOrderReviewId(
    Variables$Mutation$updateRestaurantOrderReviewId instance,
    TRes Function(Variables$Mutation$updateRestaurantOrderReviewId) then,
  ) = _CopyWithImpl$Variables$Mutation$updateRestaurantOrderReviewId;

  factory CopyWith$Variables$Mutation$updateRestaurantOrderReviewId.stub(
          TRes res) =
      _CopyWithStubImpl$Variables$Mutation$updateRestaurantOrderReviewId;

  TRes call({
    int? orderId,
    int? reviewId,
  });
}

class _CopyWithImpl$Variables$Mutation$updateRestaurantOrderReviewId<TRes>
    implements CopyWith$Variables$Mutation$updateRestaurantOrderReviewId<TRes> {
  _CopyWithImpl$Variables$Mutation$updateRestaurantOrderReviewId(
    this._instance,
    this._then,
  );

  final Variables$Mutation$updateRestaurantOrderReviewId _instance;

  final TRes Function(Variables$Mutation$updateRestaurantOrderReviewId) _then;

  static const _undefined = {};

  TRes call({
    Object? orderId = _undefined,
    Object? reviewId = _undefined,
  }) =>
      _then(Variables$Mutation$updateRestaurantOrderReviewId._({
        ..._instance._$data,
        if (orderId != _undefined && orderId != null)
          'orderId': (orderId as int),
        if (reviewId != _undefined && reviewId != null)
          'reviewId': (reviewId as int),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$updateRestaurantOrderReviewId<TRes>
    implements CopyWith$Variables$Mutation$updateRestaurantOrderReviewId<TRes> {
  _CopyWithStubImpl$Variables$Mutation$updateRestaurantOrderReviewId(this._res);

  TRes _res;

  call({
    int? orderId,
    int? reviewId,
  }) =>
      _res;
}

class Mutation$updateRestaurantOrderReviewId {
  Mutation$updateRestaurantOrderReviewId({
    this.update_restaurant_order_by_pk,
    required this.$__typename,
  });

  factory Mutation$updateRestaurantOrderReviewId.fromJson(
      Map<String, dynamic> json) {
    final l$update_restaurant_order_by_pk =
        json['update_restaurant_order_by_pk'];
    final l$$__typename = json['__typename'];
    return Mutation$updateRestaurantOrderReviewId(
      update_restaurant_order_by_pk: l$update_restaurant_order_by_pk == null
          ? null
          : Mutation$updateRestaurantOrderReviewId$update_restaurant_order_by_pk
              .fromJson(
                  (l$update_restaurant_order_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$updateRestaurantOrderReviewId$update_restaurant_order_by_pk?
      update_restaurant_order_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$update_restaurant_order_by_pk = update_restaurant_order_by_pk;
    _resultData['update_restaurant_order_by_pk'] =
        l$update_restaurant_order_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$update_restaurant_order_by_pk = update_restaurant_order_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$update_restaurant_order_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$updateRestaurantOrderReviewId) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$update_restaurant_order_by_pk = update_restaurant_order_by_pk;
    final lOther$update_restaurant_order_by_pk =
        other.update_restaurant_order_by_pk;
    if (l$update_restaurant_order_by_pk !=
        lOther$update_restaurant_order_by_pk) {
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

extension UtilityExtension$Mutation$updateRestaurantOrderReviewId
    on Mutation$updateRestaurantOrderReviewId {
  CopyWith$Mutation$updateRestaurantOrderReviewId<
          Mutation$updateRestaurantOrderReviewId>
      get copyWith => CopyWith$Mutation$updateRestaurantOrderReviewId(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateRestaurantOrderReviewId<TRes> {
  factory CopyWith$Mutation$updateRestaurantOrderReviewId(
    Mutation$updateRestaurantOrderReviewId instance,
    TRes Function(Mutation$updateRestaurantOrderReviewId) then,
  ) = _CopyWithImpl$Mutation$updateRestaurantOrderReviewId;

  factory CopyWith$Mutation$updateRestaurantOrderReviewId.stub(TRes res) =
      _CopyWithStubImpl$Mutation$updateRestaurantOrderReviewId;

  TRes call({
    Mutation$updateRestaurantOrderReviewId$update_restaurant_order_by_pk?
        update_restaurant_order_by_pk,
    String? $__typename,
  });
  CopyWith$Mutation$updateRestaurantOrderReviewId$update_restaurant_order_by_pk<
      TRes> get update_restaurant_order_by_pk;
}

class _CopyWithImpl$Mutation$updateRestaurantOrderReviewId<TRes>
    implements CopyWith$Mutation$updateRestaurantOrderReviewId<TRes> {
  _CopyWithImpl$Mutation$updateRestaurantOrderReviewId(
    this._instance,
    this._then,
  );

  final Mutation$updateRestaurantOrderReviewId _instance;

  final TRes Function(Mutation$updateRestaurantOrderReviewId) _then;

  static const _undefined = {};

  TRes call({
    Object? update_restaurant_order_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$updateRestaurantOrderReviewId(
        update_restaurant_order_by_pk: update_restaurant_order_by_pk ==
                _undefined
            ? _instance.update_restaurant_order_by_pk
            : (update_restaurant_order_by_pk
                as Mutation$updateRestaurantOrderReviewId$update_restaurant_order_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$updateRestaurantOrderReviewId$update_restaurant_order_by_pk<
      TRes> get update_restaurant_order_by_pk {
    final local$update_restaurant_order_by_pk =
        _instance.update_restaurant_order_by_pk;
    return local$update_restaurant_order_by_pk == null
        ? CopyWith$Mutation$updateRestaurantOrderReviewId$update_restaurant_order_by_pk
            .stub(_then(_instance))
        : CopyWith$Mutation$updateRestaurantOrderReviewId$update_restaurant_order_by_pk(
            local$update_restaurant_order_by_pk,
            (e) => call(update_restaurant_order_by_pk: e));
  }
}

class _CopyWithStubImpl$Mutation$updateRestaurantOrderReviewId<TRes>
    implements CopyWith$Mutation$updateRestaurantOrderReviewId<TRes> {
  _CopyWithStubImpl$Mutation$updateRestaurantOrderReviewId(this._res);

  TRes _res;

  call({
    Mutation$updateRestaurantOrderReviewId$update_restaurant_order_by_pk?
        update_restaurant_order_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$updateRestaurantOrderReviewId$update_restaurant_order_by_pk<
          TRes>
      get update_restaurant_order_by_pk =>
          CopyWith$Mutation$updateRestaurantOrderReviewId$update_restaurant_order_by_pk
              .stub(_res);
}

const documentNodeMutationupdateRestaurantOrderReviewId =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'updateRestaurantOrderReviewId'),
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
        variable: VariableNode(name: NameNode(value: 'reviewId')),
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
        name: NameNode(value: 'update_restaurant_order_by_pk'),
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
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'review_id'),
                value: VariableNode(name: NameNode(value: 'reviewId')),
              )
            ]),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'review_id'),
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
Mutation$updateRestaurantOrderReviewId
    _parserFn$Mutation$updateRestaurantOrderReviewId(
            Map<String, dynamic> data) =>
        Mutation$updateRestaurantOrderReviewId.fromJson(data);
typedef OnMutationCompleted$Mutation$updateRestaurantOrderReviewId
    = FutureOr<void> Function(
  dynamic,
  Mutation$updateRestaurantOrderReviewId?,
);

class Options$Mutation$updateRestaurantOrderReviewId
    extends graphql.MutationOptions<Mutation$updateRestaurantOrderReviewId> {
  Options$Mutation$updateRestaurantOrderReviewId({
    String? operationName,
    required Variables$Mutation$updateRestaurantOrderReviewId variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$updateRestaurantOrderReviewId? onCompleted,
    graphql.OnMutationUpdate<Mutation$updateRestaurantOrderReviewId>? update,
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
                        : _parserFn$Mutation$updateRestaurantOrderReviewId(
                            data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationupdateRestaurantOrderReviewId,
          parserFn: _parserFn$Mutation$updateRestaurantOrderReviewId,
        );

  final OnMutationCompleted$Mutation$updateRestaurantOrderReviewId?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$updateRestaurantOrderReviewId
    extends graphql.WatchQueryOptions<Mutation$updateRestaurantOrderReviewId> {
  WatchOptions$Mutation$updateRestaurantOrderReviewId({
    String? operationName,
    required Variables$Mutation$updateRestaurantOrderReviewId variables,
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
          document: documentNodeMutationupdateRestaurantOrderReviewId,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$updateRestaurantOrderReviewId,
        );
}

extension ClientExtension$Mutation$updateRestaurantOrderReviewId
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$updateRestaurantOrderReviewId>>
      mutate$updateRestaurantOrderReviewId(
              Options$Mutation$updateRestaurantOrderReviewId options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$updateRestaurantOrderReviewId>
      watchMutation$updateRestaurantOrderReviewId(
              WatchOptions$Mutation$updateRestaurantOrderReviewId options) =>
          this.watchMutation(options);
}

class Mutation$updateRestaurantOrderReviewId$update_restaurant_order_by_pk {
  Mutation$updateRestaurantOrderReviewId$update_restaurant_order_by_pk({
    this.review_id,
    required this.$__typename,
  });

  factory Mutation$updateRestaurantOrderReviewId$update_restaurant_order_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$review_id = json['review_id'];
    final l$$__typename = json['__typename'];
    return Mutation$updateRestaurantOrderReviewId$update_restaurant_order_by_pk(
      review_id: (l$review_id as int?),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int? review_id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$review_id = review_id;
    _resultData['review_id'] = l$review_id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$review_id = review_id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$review_id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Mutation$updateRestaurantOrderReviewId$update_restaurant_order_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$review_id = review_id;
    final lOther$review_id = other.review_id;
    if (l$review_id != lOther$review_id) {
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

extension UtilityExtension$Mutation$updateRestaurantOrderReviewId$update_restaurant_order_by_pk
    on Mutation$updateRestaurantOrderReviewId$update_restaurant_order_by_pk {
  CopyWith$Mutation$updateRestaurantOrderReviewId$update_restaurant_order_by_pk<
          Mutation$updateRestaurantOrderReviewId$update_restaurant_order_by_pk>
      get copyWith =>
          CopyWith$Mutation$updateRestaurantOrderReviewId$update_restaurant_order_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateRestaurantOrderReviewId$update_restaurant_order_by_pk<
    TRes> {
  factory CopyWith$Mutation$updateRestaurantOrderReviewId$update_restaurant_order_by_pk(
    Mutation$updateRestaurantOrderReviewId$update_restaurant_order_by_pk
        instance,
    TRes Function(
            Mutation$updateRestaurantOrderReviewId$update_restaurant_order_by_pk)
        then,
  ) = _CopyWithImpl$Mutation$updateRestaurantOrderReviewId$update_restaurant_order_by_pk;

  factory CopyWith$Mutation$updateRestaurantOrderReviewId$update_restaurant_order_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$updateRestaurantOrderReviewId$update_restaurant_order_by_pk;

  TRes call({
    int? review_id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$updateRestaurantOrderReviewId$update_restaurant_order_by_pk<
        TRes>
    implements
        CopyWith$Mutation$updateRestaurantOrderReviewId$update_restaurant_order_by_pk<
            TRes> {
  _CopyWithImpl$Mutation$updateRestaurantOrderReviewId$update_restaurant_order_by_pk(
    this._instance,
    this._then,
  );

  final Mutation$updateRestaurantOrderReviewId$update_restaurant_order_by_pk
      _instance;

  final TRes Function(
          Mutation$updateRestaurantOrderReviewId$update_restaurant_order_by_pk)
      _then;

  static const _undefined = {};

  TRes call({
    Object? review_id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Mutation$updateRestaurantOrderReviewId$update_restaurant_order_by_pk(
        review_id:
            review_id == _undefined ? _instance.review_id : (review_id as int?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$updateRestaurantOrderReviewId$update_restaurant_order_by_pk<
        TRes>
    implements
        CopyWith$Mutation$updateRestaurantOrderReviewId$update_restaurant_order_by_pk<
            TRes> {
  _CopyWithStubImpl$Mutation$updateRestaurantOrderReviewId$update_restaurant_order_by_pk(
      this._res);

  TRes _res;

  call({
    int? review_id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$updateLaundryOrderReviewId {
  factory Variables$Mutation$updateLaundryOrderReviewId({
    required int orderId,
    required int reviewId,
  }) =>
      Variables$Mutation$updateLaundryOrderReviewId._({
        r'orderId': orderId,
        r'reviewId': reviewId,
      });

  Variables$Mutation$updateLaundryOrderReviewId._(this._$data);

  factory Variables$Mutation$updateLaundryOrderReviewId.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$orderId = data['orderId'];
    result$data['orderId'] = (l$orderId as int);
    final l$reviewId = data['reviewId'];
    result$data['reviewId'] = (l$reviewId as int);
    return Variables$Mutation$updateLaundryOrderReviewId._(result$data);
  }

  Map<String, dynamic> _$data;

  int get orderId => (_$data['orderId'] as int);
  int get reviewId => (_$data['reviewId'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$orderId = orderId;
    result$data['orderId'] = l$orderId;
    final l$reviewId = reviewId;
    result$data['reviewId'] = l$reviewId;
    return result$data;
  }

  CopyWith$Variables$Mutation$updateLaundryOrderReviewId<
          Variables$Mutation$updateLaundryOrderReviewId>
      get copyWith => CopyWith$Variables$Mutation$updateLaundryOrderReviewId(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$updateLaundryOrderReviewId) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$orderId = orderId;
    final lOther$orderId = other.orderId;
    if (l$orderId != lOther$orderId) {
      return false;
    }
    final l$reviewId = reviewId;
    final lOther$reviewId = other.reviewId;
    if (l$reviewId != lOther$reviewId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$orderId = orderId;
    final l$reviewId = reviewId;
    return Object.hashAll([
      l$orderId,
      l$reviewId,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$updateLaundryOrderReviewId<TRes> {
  factory CopyWith$Variables$Mutation$updateLaundryOrderReviewId(
    Variables$Mutation$updateLaundryOrderReviewId instance,
    TRes Function(Variables$Mutation$updateLaundryOrderReviewId) then,
  ) = _CopyWithImpl$Variables$Mutation$updateLaundryOrderReviewId;

  factory CopyWith$Variables$Mutation$updateLaundryOrderReviewId.stub(
          TRes res) =
      _CopyWithStubImpl$Variables$Mutation$updateLaundryOrderReviewId;

  TRes call({
    int? orderId,
    int? reviewId,
  });
}

class _CopyWithImpl$Variables$Mutation$updateLaundryOrderReviewId<TRes>
    implements CopyWith$Variables$Mutation$updateLaundryOrderReviewId<TRes> {
  _CopyWithImpl$Variables$Mutation$updateLaundryOrderReviewId(
    this._instance,
    this._then,
  );

  final Variables$Mutation$updateLaundryOrderReviewId _instance;

  final TRes Function(Variables$Mutation$updateLaundryOrderReviewId) _then;

  static const _undefined = {};

  TRes call({
    Object? orderId = _undefined,
    Object? reviewId = _undefined,
  }) =>
      _then(Variables$Mutation$updateLaundryOrderReviewId._({
        ..._instance._$data,
        if (orderId != _undefined && orderId != null)
          'orderId': (orderId as int),
        if (reviewId != _undefined && reviewId != null)
          'reviewId': (reviewId as int),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$updateLaundryOrderReviewId<TRes>
    implements CopyWith$Variables$Mutation$updateLaundryOrderReviewId<TRes> {
  _CopyWithStubImpl$Variables$Mutation$updateLaundryOrderReviewId(this._res);

  TRes _res;

  call({
    int? orderId,
    int? reviewId,
  }) =>
      _res;
}

class Mutation$updateLaundryOrderReviewId {
  Mutation$updateLaundryOrderReviewId({
    this.update_laundry_order_by_pk,
    required this.$__typename,
  });

  factory Mutation$updateLaundryOrderReviewId.fromJson(
      Map<String, dynamic> json) {
    final l$update_laundry_order_by_pk = json['update_laundry_order_by_pk'];
    final l$$__typename = json['__typename'];
    return Mutation$updateLaundryOrderReviewId(
      update_laundry_order_by_pk: l$update_laundry_order_by_pk == null
          ? null
          : Mutation$updateLaundryOrderReviewId$update_laundry_order_by_pk
              .fromJson((l$update_laundry_order_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$updateLaundryOrderReviewId$update_laundry_order_by_pk?
      update_laundry_order_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$update_laundry_order_by_pk = update_laundry_order_by_pk;
    _resultData['update_laundry_order_by_pk'] =
        l$update_laundry_order_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$update_laundry_order_by_pk = update_laundry_order_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$update_laundry_order_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$updateLaundryOrderReviewId) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$update_laundry_order_by_pk = update_laundry_order_by_pk;
    final lOther$update_laundry_order_by_pk = other.update_laundry_order_by_pk;
    if (l$update_laundry_order_by_pk != lOther$update_laundry_order_by_pk) {
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

extension UtilityExtension$Mutation$updateLaundryOrderReviewId
    on Mutation$updateLaundryOrderReviewId {
  CopyWith$Mutation$updateLaundryOrderReviewId<
          Mutation$updateLaundryOrderReviewId>
      get copyWith => CopyWith$Mutation$updateLaundryOrderReviewId(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateLaundryOrderReviewId<TRes> {
  factory CopyWith$Mutation$updateLaundryOrderReviewId(
    Mutation$updateLaundryOrderReviewId instance,
    TRes Function(Mutation$updateLaundryOrderReviewId) then,
  ) = _CopyWithImpl$Mutation$updateLaundryOrderReviewId;

  factory CopyWith$Mutation$updateLaundryOrderReviewId.stub(TRes res) =
      _CopyWithStubImpl$Mutation$updateLaundryOrderReviewId;

  TRes call({
    Mutation$updateLaundryOrderReviewId$update_laundry_order_by_pk?
        update_laundry_order_by_pk,
    String? $__typename,
  });
  CopyWith$Mutation$updateLaundryOrderReviewId$update_laundry_order_by_pk<TRes>
      get update_laundry_order_by_pk;
}

class _CopyWithImpl$Mutation$updateLaundryOrderReviewId<TRes>
    implements CopyWith$Mutation$updateLaundryOrderReviewId<TRes> {
  _CopyWithImpl$Mutation$updateLaundryOrderReviewId(
    this._instance,
    this._then,
  );

  final Mutation$updateLaundryOrderReviewId _instance;

  final TRes Function(Mutation$updateLaundryOrderReviewId) _then;

  static const _undefined = {};

  TRes call({
    Object? update_laundry_order_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$updateLaundryOrderReviewId(
        update_laundry_order_by_pk: update_laundry_order_by_pk == _undefined
            ? _instance.update_laundry_order_by_pk
            : (update_laundry_order_by_pk
                as Mutation$updateLaundryOrderReviewId$update_laundry_order_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$updateLaundryOrderReviewId$update_laundry_order_by_pk<TRes>
      get update_laundry_order_by_pk {
    final local$update_laundry_order_by_pk =
        _instance.update_laundry_order_by_pk;
    return local$update_laundry_order_by_pk == null
        ? CopyWith$Mutation$updateLaundryOrderReviewId$update_laundry_order_by_pk
            .stub(_then(_instance))
        : CopyWith$Mutation$updateLaundryOrderReviewId$update_laundry_order_by_pk(
            local$update_laundry_order_by_pk,
            (e) => call(update_laundry_order_by_pk: e));
  }
}

class _CopyWithStubImpl$Mutation$updateLaundryOrderReviewId<TRes>
    implements CopyWith$Mutation$updateLaundryOrderReviewId<TRes> {
  _CopyWithStubImpl$Mutation$updateLaundryOrderReviewId(this._res);

  TRes _res;

  call({
    Mutation$updateLaundryOrderReviewId$update_laundry_order_by_pk?
        update_laundry_order_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$updateLaundryOrderReviewId$update_laundry_order_by_pk<TRes>
      get update_laundry_order_by_pk =>
          CopyWith$Mutation$updateLaundryOrderReviewId$update_laundry_order_by_pk
              .stub(_res);
}

const documentNodeMutationupdateLaundryOrderReviewId =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'updateLaundryOrderReviewId'),
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
        variable: VariableNode(name: NameNode(value: 'reviewId')),
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
        name: NameNode(value: 'update_laundry_order_by_pk'),
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
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'review_id'),
                value: VariableNode(name: NameNode(value: 'reviewId')),
              )
            ]),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'review_id'),
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
Mutation$updateLaundryOrderReviewId
    _parserFn$Mutation$updateLaundryOrderReviewId(Map<String, dynamic> data) =>
        Mutation$updateLaundryOrderReviewId.fromJson(data);
typedef OnMutationCompleted$Mutation$updateLaundryOrderReviewId = FutureOr<void>
    Function(
  dynamic,
  Mutation$updateLaundryOrderReviewId?,
);

class Options$Mutation$updateLaundryOrderReviewId
    extends graphql.MutationOptions<Mutation$updateLaundryOrderReviewId> {
  Options$Mutation$updateLaundryOrderReviewId({
    String? operationName,
    required Variables$Mutation$updateLaundryOrderReviewId variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$updateLaundryOrderReviewId? onCompleted,
    graphql.OnMutationUpdate<Mutation$updateLaundryOrderReviewId>? update,
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
                        : _parserFn$Mutation$updateLaundryOrderReviewId(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationupdateLaundryOrderReviewId,
          parserFn: _parserFn$Mutation$updateLaundryOrderReviewId,
        );

  final OnMutationCompleted$Mutation$updateLaundryOrderReviewId?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$updateLaundryOrderReviewId
    extends graphql.WatchQueryOptions<Mutation$updateLaundryOrderReviewId> {
  WatchOptions$Mutation$updateLaundryOrderReviewId({
    String? operationName,
    required Variables$Mutation$updateLaundryOrderReviewId variables,
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
          document: documentNodeMutationupdateLaundryOrderReviewId,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$updateLaundryOrderReviewId,
        );
}

extension ClientExtension$Mutation$updateLaundryOrderReviewId
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$updateLaundryOrderReviewId>>
      mutate$updateLaundryOrderReviewId(
              Options$Mutation$updateLaundryOrderReviewId options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$updateLaundryOrderReviewId>
      watchMutation$updateLaundryOrderReviewId(
              WatchOptions$Mutation$updateLaundryOrderReviewId options) =>
          this.watchMutation(options);
}

class Mutation$updateLaundryOrderReviewId$update_laundry_order_by_pk {
  Mutation$updateLaundryOrderReviewId$update_laundry_order_by_pk({
    this.review_id,
    required this.$__typename,
  });

  factory Mutation$updateLaundryOrderReviewId$update_laundry_order_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$review_id = json['review_id'];
    final l$$__typename = json['__typename'];
    return Mutation$updateLaundryOrderReviewId$update_laundry_order_by_pk(
      review_id: (l$review_id as int?),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int? review_id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$review_id = review_id;
    _resultData['review_id'] = l$review_id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$review_id = review_id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$review_id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Mutation$updateLaundryOrderReviewId$update_laundry_order_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$review_id = review_id;
    final lOther$review_id = other.review_id;
    if (l$review_id != lOther$review_id) {
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

extension UtilityExtension$Mutation$updateLaundryOrderReviewId$update_laundry_order_by_pk
    on Mutation$updateLaundryOrderReviewId$update_laundry_order_by_pk {
  CopyWith$Mutation$updateLaundryOrderReviewId$update_laundry_order_by_pk<
          Mutation$updateLaundryOrderReviewId$update_laundry_order_by_pk>
      get copyWith =>
          CopyWith$Mutation$updateLaundryOrderReviewId$update_laundry_order_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateLaundryOrderReviewId$update_laundry_order_by_pk<
    TRes> {
  factory CopyWith$Mutation$updateLaundryOrderReviewId$update_laundry_order_by_pk(
    Mutation$updateLaundryOrderReviewId$update_laundry_order_by_pk instance,
    TRes Function(
            Mutation$updateLaundryOrderReviewId$update_laundry_order_by_pk)
        then,
  ) = _CopyWithImpl$Mutation$updateLaundryOrderReviewId$update_laundry_order_by_pk;

  factory CopyWith$Mutation$updateLaundryOrderReviewId$update_laundry_order_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$updateLaundryOrderReviewId$update_laundry_order_by_pk;

  TRes call({
    int? review_id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$updateLaundryOrderReviewId$update_laundry_order_by_pk<
        TRes>
    implements
        CopyWith$Mutation$updateLaundryOrderReviewId$update_laundry_order_by_pk<
            TRes> {
  _CopyWithImpl$Mutation$updateLaundryOrderReviewId$update_laundry_order_by_pk(
    this._instance,
    this._then,
  );

  final Mutation$updateLaundryOrderReviewId$update_laundry_order_by_pk
      _instance;

  final TRes Function(
      Mutation$updateLaundryOrderReviewId$update_laundry_order_by_pk) _then;

  static const _undefined = {};

  TRes call({
    Object? review_id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$updateLaundryOrderReviewId$update_laundry_order_by_pk(
        review_id:
            review_id == _undefined ? _instance.review_id : (review_id as int?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$updateLaundryOrderReviewId$update_laundry_order_by_pk<
        TRes>
    implements
        CopyWith$Mutation$updateLaundryOrderReviewId$update_laundry_order_by_pk<
            TRes> {
  _CopyWithStubImpl$Mutation$updateLaundryOrderReviewId$update_laundry_order_by_pk(
      this._res);

  TRes _res;

  call({
    int? review_id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$getCustomerOrdersByType {
  factory Variables$Query$getCustomerOrdersByType({
    required int custId,
    required String orderType,
    int? limit,
    int? offset,
    bool? inProcess,
  }) =>
      Variables$Query$getCustomerOrdersByType._({
        r'custId': custId,
        r'orderType': orderType,
        if (limit != null) r'limit': limit,
        if (offset != null) r'offset': offset,
        if (inProcess != null) r'inProcess': inProcess,
      });

  Variables$Query$getCustomerOrdersByType._(this._$data);

  factory Variables$Query$getCustomerOrdersByType.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$custId = data['custId'];
    result$data['custId'] = (l$custId as int);
    final l$orderType = data['orderType'];
    result$data['orderType'] = (l$orderType as String);
    if (data.containsKey('limit')) {
      final l$limit = data['limit'];
      result$data['limit'] = (l$limit as int?);
    }
    if (data.containsKey('offset')) {
      final l$offset = data['offset'];
      result$data['offset'] = (l$offset as int?);
    }
    if (data.containsKey('inProcess')) {
      final l$inProcess = data['inProcess'];
      result$data['inProcess'] = (l$inProcess as bool?);
    }
    return Variables$Query$getCustomerOrdersByType._(result$data);
  }

  Map<String, dynamic> _$data;

  int get custId => (_$data['custId'] as int);
  String get orderType => (_$data['orderType'] as String);
  int? get limit => (_$data['limit'] as int?);
  int? get offset => (_$data['offset'] as int?);
  bool? get inProcess => (_$data['inProcess'] as bool?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$custId = custId;
    result$data['custId'] = l$custId;
    final l$orderType = orderType;
    result$data['orderType'] = l$orderType;
    if (_$data.containsKey('limit')) {
      final l$limit = limit;
      result$data['limit'] = l$limit;
    }
    if (_$data.containsKey('offset')) {
      final l$offset = offset;
      result$data['offset'] = l$offset;
    }
    if (_$data.containsKey('inProcess')) {
      final l$inProcess = inProcess;
      result$data['inProcess'] = l$inProcess;
    }
    return result$data;
  }

  CopyWith$Variables$Query$getCustomerOrdersByType<
          Variables$Query$getCustomerOrdersByType>
      get copyWith => CopyWith$Variables$Query$getCustomerOrdersByType(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getCustomerOrdersByType) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$custId = custId;
    final lOther$custId = other.custId;
    if (l$custId != lOther$custId) {
      return false;
    }
    final l$orderType = orderType;
    final lOther$orderType = other.orderType;
    if (l$orderType != lOther$orderType) {
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
    final l$inProcess = inProcess;
    final lOther$inProcess = other.inProcess;
    if (_$data.containsKey('inProcess') !=
        other._$data.containsKey('inProcess')) {
      return false;
    }
    if (l$inProcess != lOther$inProcess) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$custId = custId;
    final l$orderType = orderType;
    final l$limit = limit;
    final l$offset = offset;
    final l$inProcess = inProcess;
    return Object.hashAll([
      l$custId,
      l$orderType,
      _$data.containsKey('limit') ? l$limit : const {},
      _$data.containsKey('offset') ? l$offset : const {},
      _$data.containsKey('inProcess') ? l$inProcess : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$getCustomerOrdersByType<TRes> {
  factory CopyWith$Variables$Query$getCustomerOrdersByType(
    Variables$Query$getCustomerOrdersByType instance,
    TRes Function(Variables$Query$getCustomerOrdersByType) then,
  ) = _CopyWithImpl$Variables$Query$getCustomerOrdersByType;

  factory CopyWith$Variables$Query$getCustomerOrdersByType.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getCustomerOrdersByType;

  TRes call({
    int? custId,
    String? orderType,
    int? limit,
    int? offset,
    bool? inProcess,
  });
}

class _CopyWithImpl$Variables$Query$getCustomerOrdersByType<TRes>
    implements CopyWith$Variables$Query$getCustomerOrdersByType<TRes> {
  _CopyWithImpl$Variables$Query$getCustomerOrdersByType(
    this._instance,
    this._then,
  );

  final Variables$Query$getCustomerOrdersByType _instance;

  final TRes Function(Variables$Query$getCustomerOrdersByType) _then;

  static const _undefined = {};

  TRes call({
    Object? custId = _undefined,
    Object? orderType = _undefined,
    Object? limit = _undefined,
    Object? offset = _undefined,
    Object? inProcess = _undefined,
  }) =>
      _then(Variables$Query$getCustomerOrdersByType._({
        ..._instance._$data,
        if (custId != _undefined && custId != null) 'custId': (custId as int),
        if (orderType != _undefined && orderType != null)
          'orderType': (orderType as String),
        if (limit != _undefined) 'limit': (limit as int?),
        if (offset != _undefined) 'offset': (offset as int?),
        if (inProcess != _undefined) 'inProcess': (inProcess as bool?),
      }));
}

class _CopyWithStubImpl$Variables$Query$getCustomerOrdersByType<TRes>
    implements CopyWith$Variables$Query$getCustomerOrdersByType<TRes> {
  _CopyWithStubImpl$Variables$Query$getCustomerOrdersByType(this._res);

  TRes _res;

  call({
    int? custId,
    String? orderType,
    int? limit,
    int? offset,
    bool? inProcess,
  }) =>
      _res;
}

class Query$getCustomerOrdersByType {
  Query$getCustomerOrdersByType({
    required this.customer_minimal_orders_aggregate,
    required this.$__typename,
  });

  factory Query$getCustomerOrdersByType.fromJson(Map<String, dynamic> json) {
    final l$customer_minimal_orders_aggregate =
        json['customer_minimal_orders_aggregate'];
    final l$$__typename = json['__typename'];
    return Query$getCustomerOrdersByType(
      customer_minimal_orders_aggregate:
          Query$getCustomerOrdersByType$customer_minimal_orders_aggregate
              .fromJson((l$customer_minimal_orders_aggregate
                  as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getCustomerOrdersByType$customer_minimal_orders_aggregate
      customer_minimal_orders_aggregate;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$customer_minimal_orders_aggregate =
        customer_minimal_orders_aggregate;
    _resultData['customer_minimal_orders_aggregate'] =
        l$customer_minimal_orders_aggregate.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$customer_minimal_orders_aggregate =
        customer_minimal_orders_aggregate;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$customer_minimal_orders_aggregate,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getCustomerOrdersByType) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$customer_minimal_orders_aggregate =
        customer_minimal_orders_aggregate;
    final lOther$customer_minimal_orders_aggregate =
        other.customer_minimal_orders_aggregate;
    if (l$customer_minimal_orders_aggregate !=
        lOther$customer_minimal_orders_aggregate) {
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

extension UtilityExtension$Query$getCustomerOrdersByType
    on Query$getCustomerOrdersByType {
  CopyWith$Query$getCustomerOrdersByType<Query$getCustomerOrdersByType>
      get copyWith => CopyWith$Query$getCustomerOrdersByType(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getCustomerOrdersByType<TRes> {
  factory CopyWith$Query$getCustomerOrdersByType(
    Query$getCustomerOrdersByType instance,
    TRes Function(Query$getCustomerOrdersByType) then,
  ) = _CopyWithImpl$Query$getCustomerOrdersByType;

  factory CopyWith$Query$getCustomerOrdersByType.stub(TRes res) =
      _CopyWithStubImpl$Query$getCustomerOrdersByType;

  TRes call({
    Query$getCustomerOrdersByType$customer_minimal_orders_aggregate?
        customer_minimal_orders_aggregate,
    String? $__typename,
  });
  CopyWith$Query$getCustomerOrdersByType$customer_minimal_orders_aggregate<TRes>
      get customer_minimal_orders_aggregate;
}

class _CopyWithImpl$Query$getCustomerOrdersByType<TRes>
    implements CopyWith$Query$getCustomerOrdersByType<TRes> {
  _CopyWithImpl$Query$getCustomerOrdersByType(
    this._instance,
    this._then,
  );

  final Query$getCustomerOrdersByType _instance;

  final TRes Function(Query$getCustomerOrdersByType) _then;

  static const _undefined = {};

  TRes call({
    Object? customer_minimal_orders_aggregate = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getCustomerOrdersByType(
        customer_minimal_orders_aggregate: customer_minimal_orders_aggregate ==
                    _undefined ||
                customer_minimal_orders_aggregate == null
            ? _instance.customer_minimal_orders_aggregate
            : (customer_minimal_orders_aggregate
                as Query$getCustomerOrdersByType$customer_minimal_orders_aggregate),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getCustomerOrdersByType$customer_minimal_orders_aggregate<TRes>
      get customer_minimal_orders_aggregate {
    final local$customer_minimal_orders_aggregate =
        _instance.customer_minimal_orders_aggregate;
    return CopyWith$Query$getCustomerOrdersByType$customer_minimal_orders_aggregate(
        local$customer_minimal_orders_aggregate,
        (e) => call(customer_minimal_orders_aggregate: e));
  }
}

class _CopyWithStubImpl$Query$getCustomerOrdersByType<TRes>
    implements CopyWith$Query$getCustomerOrdersByType<TRes> {
  _CopyWithStubImpl$Query$getCustomerOrdersByType(this._res);

  TRes _res;

  call({
    Query$getCustomerOrdersByType$customer_minimal_orders_aggregate?
        customer_minimal_orders_aggregate,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getCustomerOrdersByType$customer_minimal_orders_aggregate<TRes>
      get customer_minimal_orders_aggregate =>
          CopyWith$Query$getCustomerOrdersByType$customer_minimal_orders_aggregate
              .stub(_res);
}

const documentNodeQuerygetCustomerOrdersByType = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getCustomerOrdersByType'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'custId')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'orderType')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
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
        variable: VariableNode(name: NameNode(value: 'inProcess')),
        type: NamedTypeNode(
          name: NameNode(value: 'Boolean'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'customer_minimal_orders_aggregate'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'order_type'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'orderType')),
                  )
                ]),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'in_process'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'inProcess')),
                  )
                ]),
              ),
            ]),
          ),
          ArgumentNode(
            name: NameNode(value: 'args'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'cus_id'),
                value: VariableNode(name: NameNode(value: 'custId')),
              )
            ]),
          ),
          ArgumentNode(
            name: NameNode(value: 'offset'),
            value: VariableNode(name: NameNode(value: 'offset')),
          ),
          ArgumentNode(
            name: NameNode(value: 'limit'),
            value: VariableNode(name: NameNode(value: 'limit')),
          ),
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
            name: NameNode(value: 'nodes'),
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
Query$getCustomerOrdersByType _parserFn$Query$getCustomerOrdersByType(
        Map<String, dynamic> data) =>
    Query$getCustomerOrdersByType.fromJson(data);

class Options$Query$getCustomerOrdersByType
    extends graphql.QueryOptions<Query$getCustomerOrdersByType> {
  Options$Query$getCustomerOrdersByType({
    String? operationName,
    required Variables$Query$getCustomerOrdersByType variables,
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
          document: documentNodeQuerygetCustomerOrdersByType,
          parserFn: _parserFn$Query$getCustomerOrdersByType,
        );
}

class WatchOptions$Query$getCustomerOrdersByType
    extends graphql.WatchQueryOptions<Query$getCustomerOrdersByType> {
  WatchOptions$Query$getCustomerOrdersByType({
    String? operationName,
    required Variables$Query$getCustomerOrdersByType variables,
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
          document: documentNodeQuerygetCustomerOrdersByType,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getCustomerOrdersByType,
        );
}

class FetchMoreOptions$Query$getCustomerOrdersByType
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getCustomerOrdersByType({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getCustomerOrdersByType variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetCustomerOrdersByType,
        );
}

extension ClientExtension$Query$getCustomerOrdersByType
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getCustomerOrdersByType>>
      query$getCustomerOrdersByType(
              Options$Query$getCustomerOrdersByType options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$getCustomerOrdersByType>
      watchQuery$getCustomerOrdersByType(
              WatchOptions$Query$getCustomerOrdersByType options) =>
          this.watchQuery(options);
  void writeQuery$getCustomerOrdersByType({
    required Query$getCustomerOrdersByType data,
    required Variables$Query$getCustomerOrdersByType variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQuerygetCustomerOrdersByType),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getCustomerOrdersByType? readQuery$getCustomerOrdersByType({
    required Variables$Query$getCustomerOrdersByType variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQuerygetCustomerOrdersByType),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$getCustomerOrdersByType.fromJson(result);
  }
}

class Query$getCustomerOrdersByType$customer_minimal_orders_aggregate {
  Query$getCustomerOrdersByType$customer_minimal_orders_aggregate({
    this.aggregate,
    required this.nodes,
    required this.$__typename,
  });

  factory Query$getCustomerOrdersByType$customer_minimal_orders_aggregate.fromJson(
      Map<String, dynamic> json) {
    final l$aggregate = json['aggregate'];
    final l$nodes = json['nodes'];
    final l$$__typename = json['__typename'];
    return Query$getCustomerOrdersByType$customer_minimal_orders_aggregate(
      aggregate: l$aggregate == null
          ? null
          : Query$getCustomerOrdersByType$customer_minimal_orders_aggregate$aggregate
              .fromJson((l$aggregate as Map<String, dynamic>)),
      nodes: (l$nodes as List<dynamic>)
          .map((e) =>
              Query$getCustomerOrdersByType$customer_minimal_orders_aggregate$nodes
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getCustomerOrdersByType$customer_minimal_orders_aggregate$aggregate?
      aggregate;

  final List<
          Query$getCustomerOrdersByType$customer_minimal_orders_aggregate$nodes>
      nodes;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$aggregate = aggregate;
    _resultData['aggregate'] = l$aggregate?.toJson();
    final l$nodes = nodes;
    _resultData['nodes'] = l$nodes.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$aggregate = aggregate;
    final l$nodes = nodes;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$aggregate,
      Object.hashAll(l$nodes.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$getCustomerOrdersByType$customer_minimal_orders_aggregate) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$aggregate = aggregate;
    final lOther$aggregate = other.aggregate;
    if (l$aggregate != lOther$aggregate) {
      return false;
    }
    final l$nodes = nodes;
    final lOther$nodes = other.nodes;
    if (l$nodes.length != lOther$nodes.length) {
      return false;
    }
    for (int i = 0; i < l$nodes.length; i++) {
      final l$nodes$entry = l$nodes[i];
      final lOther$nodes$entry = lOther$nodes[i];
      if (l$nodes$entry != lOther$nodes$entry) {
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

extension UtilityExtension$Query$getCustomerOrdersByType$customer_minimal_orders_aggregate
    on Query$getCustomerOrdersByType$customer_minimal_orders_aggregate {
  CopyWith$Query$getCustomerOrdersByType$customer_minimal_orders_aggregate<
          Query$getCustomerOrdersByType$customer_minimal_orders_aggregate>
      get copyWith =>
          CopyWith$Query$getCustomerOrdersByType$customer_minimal_orders_aggregate(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getCustomerOrdersByType$customer_minimal_orders_aggregate<
    TRes> {
  factory CopyWith$Query$getCustomerOrdersByType$customer_minimal_orders_aggregate(
    Query$getCustomerOrdersByType$customer_minimal_orders_aggregate instance,
    TRes Function(
            Query$getCustomerOrdersByType$customer_minimal_orders_aggregate)
        then,
  ) = _CopyWithImpl$Query$getCustomerOrdersByType$customer_minimal_orders_aggregate;

  factory CopyWith$Query$getCustomerOrdersByType$customer_minimal_orders_aggregate.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getCustomerOrdersByType$customer_minimal_orders_aggregate;

  TRes call({
    Query$getCustomerOrdersByType$customer_minimal_orders_aggregate$aggregate?
        aggregate,
    List<Query$getCustomerOrdersByType$customer_minimal_orders_aggregate$nodes>?
        nodes,
    String? $__typename,
  });
  CopyWith$Query$getCustomerOrdersByType$customer_minimal_orders_aggregate$aggregate<
      TRes> get aggregate;
  TRes nodes(
      Iterable<Query$getCustomerOrdersByType$customer_minimal_orders_aggregate$nodes> Function(
              Iterable<
                  CopyWith$Query$getCustomerOrdersByType$customer_minimal_orders_aggregate$nodes<
                      Query$getCustomerOrdersByType$customer_minimal_orders_aggregate$nodes>>)
          _fn);
}

class _CopyWithImpl$Query$getCustomerOrdersByType$customer_minimal_orders_aggregate<
        TRes>
    implements
        CopyWith$Query$getCustomerOrdersByType$customer_minimal_orders_aggregate<
            TRes> {
  _CopyWithImpl$Query$getCustomerOrdersByType$customer_minimal_orders_aggregate(
    this._instance,
    this._then,
  );

  final Query$getCustomerOrdersByType$customer_minimal_orders_aggregate
      _instance;

  final TRes Function(
      Query$getCustomerOrdersByType$customer_minimal_orders_aggregate) _then;

  static const _undefined = {};

  TRes call({
    Object? aggregate = _undefined,
    Object? nodes = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getCustomerOrdersByType$customer_minimal_orders_aggregate(
        aggregate: aggregate == _undefined
            ? _instance.aggregate
            : (aggregate
                as Query$getCustomerOrdersByType$customer_minimal_orders_aggregate$aggregate?),
        nodes: nodes == _undefined || nodes == null
            ? _instance.nodes
            : (nodes as List<
                Query$getCustomerOrdersByType$customer_minimal_orders_aggregate$nodes>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getCustomerOrdersByType$customer_minimal_orders_aggregate$aggregate<
      TRes> get aggregate {
    final local$aggregate = _instance.aggregate;
    return local$aggregate == null
        ? CopyWith$Query$getCustomerOrdersByType$customer_minimal_orders_aggregate$aggregate
            .stub(_then(_instance))
        : CopyWith$Query$getCustomerOrdersByType$customer_minimal_orders_aggregate$aggregate(
            local$aggregate, (e) => call(aggregate: e));
  }

  TRes nodes(
          Iterable<Query$getCustomerOrdersByType$customer_minimal_orders_aggregate$nodes> Function(
                  Iterable<
                      CopyWith$Query$getCustomerOrdersByType$customer_minimal_orders_aggregate$nodes<
                          Query$getCustomerOrdersByType$customer_minimal_orders_aggregate$nodes>>)
              _fn) =>
      call(
          nodes: _fn(_instance.nodes.map((e) =>
              CopyWith$Query$getCustomerOrdersByType$customer_minimal_orders_aggregate$nodes(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getCustomerOrdersByType$customer_minimal_orders_aggregate<
        TRes>
    implements
        CopyWith$Query$getCustomerOrdersByType$customer_minimal_orders_aggregate<
            TRes> {
  _CopyWithStubImpl$Query$getCustomerOrdersByType$customer_minimal_orders_aggregate(
      this._res);

  TRes _res;

  call({
    Query$getCustomerOrdersByType$customer_minimal_orders_aggregate$aggregate?
        aggregate,
    List<Query$getCustomerOrdersByType$customer_minimal_orders_aggregate$nodes>?
        nodes,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getCustomerOrdersByType$customer_minimal_orders_aggregate$aggregate<
          TRes>
      get aggregate =>
          CopyWith$Query$getCustomerOrdersByType$customer_minimal_orders_aggregate$aggregate
              .stub(_res);
  nodes(_fn) => _res;
}

class Query$getCustomerOrdersByType$customer_minimal_orders_aggregate$aggregate {
  Query$getCustomerOrdersByType$customer_minimal_orders_aggregate$aggregate({
    required this.count,
    required this.$__typename,
  });

  factory Query$getCustomerOrdersByType$customer_minimal_orders_aggregate$aggregate.fromJson(
      Map<String, dynamic> json) {
    final l$count = json['count'];
    final l$$__typename = json['__typename'];
    return Query$getCustomerOrdersByType$customer_minimal_orders_aggregate$aggregate(
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
            is Query$getCustomerOrdersByType$customer_minimal_orders_aggregate$aggregate) ||
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

extension UtilityExtension$Query$getCustomerOrdersByType$customer_minimal_orders_aggregate$aggregate
    on Query$getCustomerOrdersByType$customer_minimal_orders_aggregate$aggregate {
  CopyWith$Query$getCustomerOrdersByType$customer_minimal_orders_aggregate$aggregate<
          Query$getCustomerOrdersByType$customer_minimal_orders_aggregate$aggregate>
      get copyWith =>
          CopyWith$Query$getCustomerOrdersByType$customer_minimal_orders_aggregate$aggregate(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getCustomerOrdersByType$customer_minimal_orders_aggregate$aggregate<
    TRes> {
  factory CopyWith$Query$getCustomerOrdersByType$customer_minimal_orders_aggregate$aggregate(
    Query$getCustomerOrdersByType$customer_minimal_orders_aggregate$aggregate
        instance,
    TRes Function(
            Query$getCustomerOrdersByType$customer_minimal_orders_aggregate$aggregate)
        then,
  ) = _CopyWithImpl$Query$getCustomerOrdersByType$customer_minimal_orders_aggregate$aggregate;

  factory CopyWith$Query$getCustomerOrdersByType$customer_minimal_orders_aggregate$aggregate.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getCustomerOrdersByType$customer_minimal_orders_aggregate$aggregate;

  TRes call({
    int? count,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getCustomerOrdersByType$customer_minimal_orders_aggregate$aggregate<
        TRes>
    implements
        CopyWith$Query$getCustomerOrdersByType$customer_minimal_orders_aggregate$aggregate<
            TRes> {
  _CopyWithImpl$Query$getCustomerOrdersByType$customer_minimal_orders_aggregate$aggregate(
    this._instance,
    this._then,
  );

  final Query$getCustomerOrdersByType$customer_minimal_orders_aggregate$aggregate
      _instance;

  final TRes Function(
          Query$getCustomerOrdersByType$customer_minimal_orders_aggregate$aggregate)
      _then;

  static const _undefined = {};

  TRes call({
    Object? count = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getCustomerOrdersByType$customer_minimal_orders_aggregate$aggregate(
        count: count == _undefined || count == null
            ? _instance.count
            : (count as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getCustomerOrdersByType$customer_minimal_orders_aggregate$aggregate<
        TRes>
    implements
        CopyWith$Query$getCustomerOrdersByType$customer_minimal_orders_aggregate$aggregate<
            TRes> {
  _CopyWithStubImpl$Query$getCustomerOrdersByType$customer_minimal_orders_aggregate$aggregate(
      this._res);

  TRes _res;

  call({
    int? count,
    String? $__typename,
  }) =>
      _res;
}

class Query$getCustomerOrdersByType$customer_minimal_orders_aggregate$nodes {
  Query$getCustomerOrdersByType$customer_minimal_orders_aggregate$nodes({
    required this.id,
    required this.$__typename,
  });

  factory Query$getCustomerOrdersByType$customer_minimal_orders_aggregate$nodes.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Query$getCustomerOrdersByType$customer_minimal_orders_aggregate$nodes(
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
            is Query$getCustomerOrdersByType$customer_minimal_orders_aggregate$nodes) ||
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

extension UtilityExtension$Query$getCustomerOrdersByType$customer_minimal_orders_aggregate$nodes
    on Query$getCustomerOrdersByType$customer_minimal_orders_aggregate$nodes {
  CopyWith$Query$getCustomerOrdersByType$customer_minimal_orders_aggregate$nodes<
          Query$getCustomerOrdersByType$customer_minimal_orders_aggregate$nodes>
      get copyWith =>
          CopyWith$Query$getCustomerOrdersByType$customer_minimal_orders_aggregate$nodes(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getCustomerOrdersByType$customer_minimal_orders_aggregate$nodes<
    TRes> {
  factory CopyWith$Query$getCustomerOrdersByType$customer_minimal_orders_aggregate$nodes(
    Query$getCustomerOrdersByType$customer_minimal_orders_aggregate$nodes
        instance,
    TRes Function(
            Query$getCustomerOrdersByType$customer_minimal_orders_aggregate$nodes)
        then,
  ) = _CopyWithImpl$Query$getCustomerOrdersByType$customer_minimal_orders_aggregate$nodes;

  factory CopyWith$Query$getCustomerOrdersByType$customer_minimal_orders_aggregate$nodes.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getCustomerOrdersByType$customer_minimal_orders_aggregate$nodes;

  TRes call({
    int? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getCustomerOrdersByType$customer_minimal_orders_aggregate$nodes<
        TRes>
    implements
        CopyWith$Query$getCustomerOrdersByType$customer_minimal_orders_aggregate$nodes<
            TRes> {
  _CopyWithImpl$Query$getCustomerOrdersByType$customer_minimal_orders_aggregate$nodes(
    this._instance,
    this._then,
  );

  final Query$getCustomerOrdersByType$customer_minimal_orders_aggregate$nodes
      _instance;

  final TRes Function(
          Query$getCustomerOrdersByType$customer_minimal_orders_aggregate$nodes)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getCustomerOrdersByType$customer_minimal_orders_aggregate$nodes(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getCustomerOrdersByType$customer_minimal_orders_aggregate$nodes<
        TRes>
    implements
        CopyWith$Query$getCustomerOrdersByType$customer_minimal_orders_aggregate$nodes<
            TRes> {
  _CopyWithStubImpl$Query$getCustomerOrdersByType$customer_minimal_orders_aggregate$nodes(
      this._res);

  TRes _res;

  call({
    int? id,
    String? $__typename,
  }) =>
      _res;
}
