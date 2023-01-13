import '../../__generated/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';

class Query$getRestaurants {
  Query$getRestaurants({
    required this.restaurant,
    required this.$__typename,
  });

  factory Query$getRestaurants.fromJson(Map<String, dynamic> json) {
    final l$restaurant = json['restaurant'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurants(
      restaurant: (l$restaurant as List<dynamic>)
          .map((e) => Query$getRestaurants$restaurant.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$getRestaurants$restaurant> restaurant;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$restaurant = restaurant;
    _resultData['restaurant'] = l$restaurant.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$restaurant = restaurant;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$restaurant.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getRestaurants) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$restaurant = restaurant;
    final lOther$restaurant = other.restaurant;
    if (l$restaurant.length != lOther$restaurant.length) {
      return false;
    }
    for (int i = 0; i < l$restaurant.length; i++) {
      final l$restaurant$entry = l$restaurant[i];
      final lOther$restaurant$entry = lOther$restaurant[i];
      if (l$restaurant$entry != lOther$restaurant$entry) {
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

extension UtilityExtension$Query$getRestaurants on Query$getRestaurants {
  CopyWith$Query$getRestaurants<Query$getRestaurants> get copyWith =>
      CopyWith$Query$getRestaurants(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$getRestaurants<TRes> {
  factory CopyWith$Query$getRestaurants(
    Query$getRestaurants instance,
    TRes Function(Query$getRestaurants) then,
  ) = _CopyWithImpl$Query$getRestaurants;

  factory CopyWith$Query$getRestaurants.stub(TRes res) =
      _CopyWithStubImpl$Query$getRestaurants;

  TRes call({
    List<Query$getRestaurants$restaurant>? restaurant,
    String? $__typename,
  });
  TRes restaurant(
      Iterable<Query$getRestaurants$restaurant> Function(
              Iterable<
                  CopyWith$Query$getRestaurants$restaurant<
                      Query$getRestaurants$restaurant>>)
          _fn);
}

class _CopyWithImpl$Query$getRestaurants<TRes>
    implements CopyWith$Query$getRestaurants<TRes> {
  _CopyWithImpl$Query$getRestaurants(
    this._instance,
    this._then,
  );

  final Query$getRestaurants _instance;

  final TRes Function(Query$getRestaurants) _then;

  static const _undefined = {};

  TRes call({
    Object? restaurant = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getRestaurants(
        restaurant: restaurant == _undefined || restaurant == null
            ? _instance.restaurant
            : (restaurant as List<Query$getRestaurants$restaurant>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes restaurant(
          Iterable<Query$getRestaurants$restaurant> Function(
                  Iterable<
                      CopyWith$Query$getRestaurants$restaurant<
                          Query$getRestaurants$restaurant>>)
              _fn) =>
      call(
          restaurant: _fn(_instance.restaurant
              .map((e) => CopyWith$Query$getRestaurants$restaurant(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$getRestaurants<TRes>
    implements CopyWith$Query$getRestaurants<TRes> {
  _CopyWithStubImpl$Query$getRestaurants(this._res);

  TRes _res;

  call({
    List<Query$getRestaurants$restaurant>? restaurant,
    String? $__typename,
  }) =>
      _res;
  restaurant(_fn) => _res;
}

const documentNodeQuerygetRestaurants = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getRestaurants'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
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
            name: NameNode(value: 'image'),
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
            name: NameNode(value: 'location_text'),
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
            name: NameNode(value: 'firebase_id'),
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
            name: NameNode(value: 'description_id'),
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
            name: NameNode(value: 'self_delivery'),
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
            name: NameNode(value: 'schedule'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'payment_info_id'),
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
Query$getRestaurants _parserFn$Query$getRestaurants(
        Map<String, dynamic> data) =>
    Query$getRestaurants.fromJson(data);

class Options$Query$getRestaurants
    extends graphql.QueryOptions<Query$getRestaurants> {
  Options$Query$getRestaurants({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
  }) : super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          pollInterval: pollInterval,
          context: context,
          document: documentNodeQuerygetRestaurants,
          parserFn: _parserFn$Query$getRestaurants,
        );
}

class WatchOptions$Query$getRestaurants
    extends graphql.WatchQueryOptions<Query$getRestaurants> {
  WatchOptions$Query$getRestaurants({
    String? operationName,
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
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          context: context,
          document: documentNodeQuerygetRestaurants,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getRestaurants,
        );
}

class FetchMoreOptions$Query$getRestaurants extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getRestaurants(
      {required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeQuerygetRestaurants,
        );
}

extension ClientExtension$Query$getRestaurants on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getRestaurants>> query$getRestaurants(
          [Options$Query$getRestaurants? options]) async =>
      await this.query(options ?? Options$Query$getRestaurants());
  graphql.ObservableQuery<Query$getRestaurants> watchQuery$getRestaurants(
          [WatchOptions$Query$getRestaurants? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$getRestaurants());
  void writeQuery$getRestaurants({
    required Query$getRestaurants data,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
            operation:
                graphql.Operation(document: documentNodeQuerygetRestaurants)),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getRestaurants? readQuery$getRestaurants({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQuerygetRestaurants)),
      optimistic: optimistic,
    );
    return result == null ? null : Query$getRestaurants.fromJson(result);
  }
}

class Query$getRestaurants$restaurant {
  Query$getRestaurants$restaurant({
    required this.id,
    required this.image,
    required this.language_id,
    required this.location_text,
    required this.name,
    required this.location_gps,
    this.firebase_id,
    required this.approved,
    this.description_id,
    this.schedule,
    this.description,
    required this.self_delivery,
    required this.open_status,
    this.payment_info_id,
    required this.$__typename,
  });

  factory Query$getRestaurants$restaurant.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$image = json['image'];
    final l$language_id = json['language_id'];
    final l$location_text = json['location_text'];
    final l$name = json['name'];
    final l$location_gps = json['location_gps'];
    final l$firebase_id = json['firebase_id'];
    final l$approved = json['approved'];
    final l$description_id = json['description_id'];
    final l$schedule = json['schedule'];
    final l$description = json['description'];
    final l$self_delivery = json['self_delivery'];
    final l$open_status = json['open_status'];
    final l$payment_info_id = json['payment_info_id'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurants$restaurant(
      id: (l$id as int),
      image: (l$image as String),
      language_id: (l$language_id as String),
      location_text: (l$location_text as String),
      name: (l$name as String),
      location_gps: geographyFromJson(l$location_gps),
      firebase_id: (l$firebase_id as String?),
      approved: (l$approved as bool),
      description_id: (l$description_id as int?),
      schedule: l$schedule == null ? null : mapFromJson(l$schedule),
      description: l$description == null
          ? null
          : Query$getRestaurants$restaurant$description.fromJson(
              (l$description as Map<String, dynamic>)),
      self_delivery: (l$self_delivery as bool),
      open_status: (l$open_status as String),
      payment_info_id: (l$payment_info_id as int?),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String image;

  final String language_id;

  final String location_text;

  final String name;

  final Geography location_gps;

  final String? firebase_id;

  final bool approved;

  final int? description_id;

  final dynamic? schedule;

  final Query$getRestaurants$restaurant$description? description;

  final bool self_delivery;

  final String open_status;

  final int? payment_info_id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$language_id = language_id;
    _resultData['language_id'] = l$language_id;
    final l$location_text = location_text;
    _resultData['location_text'] = l$location_text;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$location_gps = location_gps;
    _resultData['location_gps'] = geographyToJson(l$location_gps);
    final l$firebase_id = firebase_id;
    _resultData['firebase_id'] = l$firebase_id;
    final l$approved = approved;
    _resultData['approved'] = l$approved;
    final l$description_id = description_id;
    _resultData['description_id'] = l$description_id;
    final l$schedule = schedule;
    _resultData['schedule'] = l$schedule == null ? null : mapToJson(l$schedule);
    final l$description = description;
    _resultData['description'] = l$description?.toJson();
    final l$self_delivery = self_delivery;
    _resultData['self_delivery'] = l$self_delivery;
    final l$open_status = open_status;
    _resultData['open_status'] = l$open_status;
    final l$payment_info_id = payment_info_id;
    _resultData['payment_info_id'] = l$payment_info_id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$image = image;
    final l$language_id = language_id;
    final l$location_text = location_text;
    final l$name = name;
    final l$location_gps = location_gps;
    final l$firebase_id = firebase_id;
    final l$approved = approved;
    final l$description_id = description_id;
    final l$schedule = schedule;
    final l$description = description;
    final l$self_delivery = self_delivery;
    final l$open_status = open_status;
    final l$payment_info_id = payment_info_id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$image,
      l$language_id,
      l$location_text,
      l$name,
      l$location_gps,
      l$firebase_id,
      l$approved,
      l$description_id,
      l$schedule,
      l$description,
      l$self_delivery,
      l$open_status,
      l$payment_info_id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getRestaurants$restaurant) ||
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
    final l$language_id = language_id;
    final lOther$language_id = other.language_id;
    if (l$language_id != lOther$language_id) {
      return false;
    }
    final l$location_text = location_text;
    final lOther$location_text = other.location_text;
    if (l$location_text != lOther$location_text) {
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
    final l$firebase_id = firebase_id;
    final lOther$firebase_id = other.firebase_id;
    if (l$firebase_id != lOther$firebase_id) {
      return false;
    }
    final l$approved = approved;
    final lOther$approved = other.approved;
    if (l$approved != lOther$approved) {
      return false;
    }
    final l$description_id = description_id;
    final lOther$description_id = other.description_id;
    if (l$description_id != lOther$description_id) {
      return false;
    }
    final l$schedule = schedule;
    final lOther$schedule = other.schedule;
    if (l$schedule != lOther$schedule) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
      return false;
    }
    final l$self_delivery = self_delivery;
    final lOther$self_delivery = other.self_delivery;
    if (l$self_delivery != lOther$self_delivery) {
      return false;
    }
    final l$open_status = open_status;
    final lOther$open_status = other.open_status;
    if (l$open_status != lOther$open_status) {
      return false;
    }
    final l$payment_info_id = payment_info_id;
    final lOther$payment_info_id = other.payment_info_id;
    if (l$payment_info_id != lOther$payment_info_id) {
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

extension UtilityExtension$Query$getRestaurants$restaurant
    on Query$getRestaurants$restaurant {
  CopyWith$Query$getRestaurants$restaurant<Query$getRestaurants$restaurant>
      get copyWith => CopyWith$Query$getRestaurants$restaurant(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurants$restaurant<TRes> {
  factory CopyWith$Query$getRestaurants$restaurant(
    Query$getRestaurants$restaurant instance,
    TRes Function(Query$getRestaurants$restaurant) then,
  ) = _CopyWithImpl$Query$getRestaurants$restaurant;

  factory CopyWith$Query$getRestaurants$restaurant.stub(TRes res) =
      _CopyWithStubImpl$Query$getRestaurants$restaurant;

  TRes call({
    int? id,
    String? image,
    String? language_id,
    String? location_text,
    String? name,
    Geography? location_gps,
    String? firebase_id,
    bool? approved,
    int? description_id,
    dynamic? schedule,
    Query$getRestaurants$restaurant$description? description,
    bool? self_delivery,
    String? open_status,
    int? payment_info_id,
    String? $__typename,
  });
  CopyWith$Query$getRestaurants$restaurant$description<TRes> get description;
}

class _CopyWithImpl$Query$getRestaurants$restaurant<TRes>
    implements CopyWith$Query$getRestaurants$restaurant<TRes> {
  _CopyWithImpl$Query$getRestaurants$restaurant(
    this._instance,
    this._then,
  );

  final Query$getRestaurants$restaurant _instance;

  final TRes Function(Query$getRestaurants$restaurant) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? image = _undefined,
    Object? language_id = _undefined,
    Object? location_text = _undefined,
    Object? name = _undefined,
    Object? location_gps = _undefined,
    Object? firebase_id = _undefined,
    Object? approved = _undefined,
    Object? description_id = _undefined,
    Object? schedule = _undefined,
    Object? description = _undefined,
    Object? self_delivery = _undefined,
    Object? open_status = _undefined,
    Object? payment_info_id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getRestaurants$restaurant(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        language_id: language_id == _undefined || language_id == null
            ? _instance.language_id
            : (language_id as String),
        location_text: location_text == _undefined || location_text == null
            ? _instance.location_text
            : (location_text as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        location_gps: location_gps == _undefined || location_gps == null
            ? _instance.location_gps
            : (location_gps as Geography),
        firebase_id: firebase_id == _undefined
            ? _instance.firebase_id
            : (firebase_id as String?),
        approved: approved == _undefined || approved == null
            ? _instance.approved
            : (approved as bool),
        description_id: description_id == _undefined
            ? _instance.description_id
            : (description_id as int?),
        schedule: schedule == _undefined
            ? _instance.schedule
            : (schedule as dynamic?),
        description: description == _undefined
            ? _instance.description
            : (description as Query$getRestaurants$restaurant$description?),
        self_delivery: self_delivery == _undefined || self_delivery == null
            ? _instance.self_delivery
            : (self_delivery as bool),
        open_status: open_status == _undefined || open_status == null
            ? _instance.open_status
            : (open_status as String),
        payment_info_id: payment_info_id == _undefined
            ? _instance.payment_info_id
            : (payment_info_id as int?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getRestaurants$restaurant$description<TRes> get description {
    final local$description = _instance.description;
    return local$description == null
        ? CopyWith$Query$getRestaurants$restaurant$description.stub(
            _then(_instance))
        : CopyWith$Query$getRestaurants$restaurant$description(
            local$description, (e) => call(description: e));
  }
}

class _CopyWithStubImpl$Query$getRestaurants$restaurant<TRes>
    implements CopyWith$Query$getRestaurants$restaurant<TRes> {
  _CopyWithStubImpl$Query$getRestaurants$restaurant(this._res);

  TRes _res;

  call({
    int? id,
    String? image,
    String? language_id,
    String? location_text,
    String? name,
    Geography? location_gps,
    String? firebase_id,
    bool? approved,
    int? description_id,
    dynamic? schedule,
    Query$getRestaurants$restaurant$description? description,
    bool? self_delivery,
    String? open_status,
    int? payment_info_id,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getRestaurants$restaurant$description<TRes> get description =>
      CopyWith$Query$getRestaurants$restaurant$description.stub(_res);
}

class Query$getRestaurants$restaurant$description {
  Query$getRestaurants$restaurant$description({
    required this.translations,
    required this.$__typename,
  });

  factory Query$getRestaurants$restaurant$description.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurants$restaurant$description(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$getRestaurants$restaurant$description$translations.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$getRestaurants$restaurant$description$translations>
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
    if (!(other is Query$getRestaurants$restaurant$description) ||
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

extension UtilityExtension$Query$getRestaurants$restaurant$description
    on Query$getRestaurants$restaurant$description {
  CopyWith$Query$getRestaurants$restaurant$description<
          Query$getRestaurants$restaurant$description>
      get copyWith => CopyWith$Query$getRestaurants$restaurant$description(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurants$restaurant$description<TRes> {
  factory CopyWith$Query$getRestaurants$restaurant$description(
    Query$getRestaurants$restaurant$description instance,
    TRes Function(Query$getRestaurants$restaurant$description) then,
  ) = _CopyWithImpl$Query$getRestaurants$restaurant$description;

  factory CopyWith$Query$getRestaurants$restaurant$description.stub(TRes res) =
      _CopyWithStubImpl$Query$getRestaurants$restaurant$description;

  TRes call({
    List<Query$getRestaurants$restaurant$description$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$getRestaurants$restaurant$description$translations> Function(
              Iterable<
                  CopyWith$Query$getRestaurants$restaurant$description$translations<
                      Query$getRestaurants$restaurant$description$translations>>)
          _fn);
}

class _CopyWithImpl$Query$getRestaurants$restaurant$description<TRes>
    implements CopyWith$Query$getRestaurants$restaurant$description<TRes> {
  _CopyWithImpl$Query$getRestaurants$restaurant$description(
    this._instance,
    this._then,
  );

  final Query$getRestaurants$restaurant$description _instance;

  final TRes Function(Query$getRestaurants$restaurant$description) _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getRestaurants$restaurant$description(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$getRestaurants$restaurant$description$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$getRestaurants$restaurant$description$translations> Function(
                  Iterable<
                      CopyWith$Query$getRestaurants$restaurant$description$translations<
                          Query$getRestaurants$restaurant$description$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$getRestaurants$restaurant$description$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getRestaurants$restaurant$description<TRes>
    implements CopyWith$Query$getRestaurants$restaurant$description<TRes> {
  _CopyWithStubImpl$Query$getRestaurants$restaurant$description(this._res);

  TRes _res;

  call({
    List<Query$getRestaurants$restaurant$description$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$getRestaurants$restaurant$description$translations {
  Query$getRestaurants$restaurant$description$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$getRestaurants$restaurant$description$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurants$restaurant$description$translations(
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
    if (!(other is Query$getRestaurants$restaurant$description$translations) ||
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

extension UtilityExtension$Query$getRestaurants$restaurant$description$translations
    on Query$getRestaurants$restaurant$description$translations {
  CopyWith$Query$getRestaurants$restaurant$description$translations<
          Query$getRestaurants$restaurant$description$translations>
      get copyWith =>
          CopyWith$Query$getRestaurants$restaurant$description$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurants$restaurant$description$translations<
    TRes> {
  factory CopyWith$Query$getRestaurants$restaurant$description$translations(
    Query$getRestaurants$restaurant$description$translations instance,
    TRes Function(Query$getRestaurants$restaurant$description$translations)
        then,
  ) = _CopyWithImpl$Query$getRestaurants$restaurant$description$translations;

  factory CopyWith$Query$getRestaurants$restaurant$description$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getRestaurants$restaurant$description$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getRestaurants$restaurant$description$translations<
        TRes>
    implements
        CopyWith$Query$getRestaurants$restaurant$description$translations<
            TRes> {
  _CopyWithImpl$Query$getRestaurants$restaurant$description$translations(
    this._instance,
    this._then,
  );

  final Query$getRestaurants$restaurant$description$translations _instance;

  final TRes Function(Query$getRestaurants$restaurant$description$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getRestaurants$restaurant$description$translations(
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

class _CopyWithStubImpl$Query$getRestaurants$restaurant$description$translations<
        TRes>
    implements
        CopyWith$Query$getRestaurants$restaurant$description$translations<
            TRes> {
  _CopyWithStubImpl$Query$getRestaurants$restaurant$description$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$get_restaurant_desc_by_pk {
  factory Variables$Query$get_restaurant_desc_by_pk({required int desc_id}) =>
      Variables$Query$get_restaurant_desc_by_pk._({
        r'desc_id': desc_id,
      });

  Variables$Query$get_restaurant_desc_by_pk._(this._$data);

  factory Variables$Query$get_restaurant_desc_by_pk.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$desc_id = data['desc_id'];
    result$data['desc_id'] = (l$desc_id as int);
    return Variables$Query$get_restaurant_desc_by_pk._(result$data);
  }

  Map<String, dynamic> _$data;

  int get desc_id => (_$data['desc_id'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$desc_id = desc_id;
    result$data['desc_id'] = l$desc_id;
    return result$data;
  }

  CopyWith$Variables$Query$get_restaurant_desc_by_pk<
          Variables$Query$get_restaurant_desc_by_pk>
      get copyWith => CopyWith$Variables$Query$get_restaurant_desc_by_pk(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$get_restaurant_desc_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$desc_id = desc_id;
    final lOther$desc_id = other.desc_id;
    if (l$desc_id != lOther$desc_id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$desc_id = desc_id;
    return Object.hashAll([l$desc_id]);
  }
}

abstract class CopyWith$Variables$Query$get_restaurant_desc_by_pk<TRes> {
  factory CopyWith$Variables$Query$get_restaurant_desc_by_pk(
    Variables$Query$get_restaurant_desc_by_pk instance,
    TRes Function(Variables$Query$get_restaurant_desc_by_pk) then,
  ) = _CopyWithImpl$Variables$Query$get_restaurant_desc_by_pk;

  factory CopyWith$Variables$Query$get_restaurant_desc_by_pk.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$get_restaurant_desc_by_pk;

  TRes call({int? desc_id});
}

class _CopyWithImpl$Variables$Query$get_restaurant_desc_by_pk<TRes>
    implements CopyWith$Variables$Query$get_restaurant_desc_by_pk<TRes> {
  _CopyWithImpl$Variables$Query$get_restaurant_desc_by_pk(
    this._instance,
    this._then,
  );

  final Variables$Query$get_restaurant_desc_by_pk _instance;

  final TRes Function(Variables$Query$get_restaurant_desc_by_pk) _then;

  static const _undefined = {};

  TRes call({Object? desc_id = _undefined}) =>
      _then(Variables$Query$get_restaurant_desc_by_pk._({
        ..._instance._$data,
        if (desc_id != _undefined && desc_id != null)
          'desc_id': (desc_id as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$get_restaurant_desc_by_pk<TRes>
    implements CopyWith$Variables$Query$get_restaurant_desc_by_pk<TRes> {
  _CopyWithStubImpl$Variables$Query$get_restaurant_desc_by_pk(this._res);

  TRes _res;

  call({int? desc_id}) => _res;
}

class Query$get_restaurant_desc_by_pk {
  Query$get_restaurant_desc_by_pk({
    this.translation_by_pk,
    required this.$__typename,
  });

  factory Query$get_restaurant_desc_by_pk.fromJson(Map<String, dynamic> json) {
    final l$translation_by_pk = json['translation_by_pk'];
    final l$$__typename = json['__typename'];
    return Query$get_restaurant_desc_by_pk(
      translation_by_pk: l$translation_by_pk == null
          ? null
          : Query$get_restaurant_desc_by_pk$translation_by_pk.fromJson(
              (l$translation_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$get_restaurant_desc_by_pk$translation_by_pk? translation_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$translation_by_pk = translation_by_pk;
    _resultData['translation_by_pk'] = l$translation_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$translation_by_pk = translation_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$translation_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_restaurant_desc_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$translation_by_pk = translation_by_pk;
    final lOther$translation_by_pk = other.translation_by_pk;
    if (l$translation_by_pk != lOther$translation_by_pk) {
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

extension UtilityExtension$Query$get_restaurant_desc_by_pk
    on Query$get_restaurant_desc_by_pk {
  CopyWith$Query$get_restaurant_desc_by_pk<Query$get_restaurant_desc_by_pk>
      get copyWith => CopyWith$Query$get_restaurant_desc_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_restaurant_desc_by_pk<TRes> {
  factory CopyWith$Query$get_restaurant_desc_by_pk(
    Query$get_restaurant_desc_by_pk instance,
    TRes Function(Query$get_restaurant_desc_by_pk) then,
  ) = _CopyWithImpl$Query$get_restaurant_desc_by_pk;

  factory CopyWith$Query$get_restaurant_desc_by_pk.stub(TRes res) =
      _CopyWithStubImpl$Query$get_restaurant_desc_by_pk;

  TRes call({
    Query$get_restaurant_desc_by_pk$translation_by_pk? translation_by_pk,
    String? $__typename,
  });
  CopyWith$Query$get_restaurant_desc_by_pk$translation_by_pk<TRes>
      get translation_by_pk;
}

class _CopyWithImpl$Query$get_restaurant_desc_by_pk<TRes>
    implements CopyWith$Query$get_restaurant_desc_by_pk<TRes> {
  _CopyWithImpl$Query$get_restaurant_desc_by_pk(
    this._instance,
    this._then,
  );

  final Query$get_restaurant_desc_by_pk _instance;

  final TRes Function(Query$get_restaurant_desc_by_pk) _then;

  static const _undefined = {};

  TRes call({
    Object? translation_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_restaurant_desc_by_pk(
        translation_by_pk: translation_by_pk == _undefined
            ? _instance.translation_by_pk
            : (translation_by_pk
                as Query$get_restaurant_desc_by_pk$translation_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_restaurant_desc_by_pk$translation_by_pk<TRes>
      get translation_by_pk {
    final local$translation_by_pk = _instance.translation_by_pk;
    return local$translation_by_pk == null
        ? CopyWith$Query$get_restaurant_desc_by_pk$translation_by_pk.stub(
            _then(_instance))
        : CopyWith$Query$get_restaurant_desc_by_pk$translation_by_pk(
            local$translation_by_pk, (e) => call(translation_by_pk: e));
  }
}

class _CopyWithStubImpl$Query$get_restaurant_desc_by_pk<TRes>
    implements CopyWith$Query$get_restaurant_desc_by_pk<TRes> {
  _CopyWithStubImpl$Query$get_restaurant_desc_by_pk(this._res);

  TRes _res;

  call({
    Query$get_restaurant_desc_by_pk$translation_by_pk? translation_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_restaurant_desc_by_pk$translation_by_pk<TRes>
      get translation_by_pk =>
          CopyWith$Query$get_restaurant_desc_by_pk$translation_by_pk.stub(_res);
}

const documentNodeQueryget_restaurant_desc_by_pk = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'get_restaurant_desc_by_pk'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'desc_id')),
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
        name: NameNode(value: 'translation_by_pk'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'desc_id')),
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
      
    ]),
  ),
]);
Query$get_restaurant_desc_by_pk _parserFn$Query$get_restaurant_desc_by_pk(
        Map<String, dynamic> data) =>
    Query$get_restaurant_desc_by_pk.fromJson(data);

class Options$Query$get_restaurant_desc_by_pk
    extends graphql.QueryOptions<Query$get_restaurant_desc_by_pk> {
  Options$Query$get_restaurant_desc_by_pk({
    String? operationName,
    required Variables$Query$get_restaurant_desc_by_pk variables,
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
          document: documentNodeQueryget_restaurant_desc_by_pk,
          parserFn: _parserFn$Query$get_restaurant_desc_by_pk,
        );
}

class WatchOptions$Query$get_restaurant_desc_by_pk
    extends graphql.WatchQueryOptions<Query$get_restaurant_desc_by_pk> {
  WatchOptions$Query$get_restaurant_desc_by_pk({
    String? operationName,
    required Variables$Query$get_restaurant_desc_by_pk variables,
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
          document: documentNodeQueryget_restaurant_desc_by_pk,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$get_restaurant_desc_by_pk,
        );
}

class FetchMoreOptions$Query$get_restaurant_desc_by_pk
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$get_restaurant_desc_by_pk({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$get_restaurant_desc_by_pk variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryget_restaurant_desc_by_pk,
        );
}

extension ClientExtension$Query$get_restaurant_desc_by_pk
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$get_restaurant_desc_by_pk>>
      query$get_restaurant_desc_by_pk(
              Options$Query$get_restaurant_desc_by_pk options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$get_restaurant_desc_by_pk>
      watchQuery$get_restaurant_desc_by_pk(
              WatchOptions$Query$get_restaurant_desc_by_pk options) =>
          this.watchQuery(options);
  void writeQuery$get_restaurant_desc_by_pk({
    required Query$get_restaurant_desc_by_pk data,
    required Variables$Query$get_restaurant_desc_by_pk variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryget_restaurant_desc_by_pk),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$get_restaurant_desc_by_pk? readQuery$get_restaurant_desc_by_pk({
    required Variables$Query$get_restaurant_desc_by_pk variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQueryget_restaurant_desc_by_pk),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$get_restaurant_desc_by_pk.fromJson(result);
  }
}

class Query$get_restaurant_desc_by_pk$translation_by_pk {
  Query$get_restaurant_desc_by_pk$translation_by_pk({
    required this.id,
    required this.translations,
    required this.$__typename,
  });

  factory Query$get_restaurant_desc_by_pk$translation_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$get_restaurant_desc_by_pk$translation_by_pk(
      id: (l$id as int),
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$get_restaurant_desc_by_pk$translation_by_pk$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final List<Query$get_restaurant_desc_by_pk$translation_by_pk$translations>
      translations;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$translations = translations;
    _resultData['translations'] =
        l$translations.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$translations = translations;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      Object.hashAll(l$translations.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_restaurant_desc_by_pk$translation_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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

extension UtilityExtension$Query$get_restaurant_desc_by_pk$translation_by_pk
    on Query$get_restaurant_desc_by_pk$translation_by_pk {
  CopyWith$Query$get_restaurant_desc_by_pk$translation_by_pk<
          Query$get_restaurant_desc_by_pk$translation_by_pk>
      get copyWith =>
          CopyWith$Query$get_restaurant_desc_by_pk$translation_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_restaurant_desc_by_pk$translation_by_pk<
    TRes> {
  factory CopyWith$Query$get_restaurant_desc_by_pk$translation_by_pk(
    Query$get_restaurant_desc_by_pk$translation_by_pk instance,
    TRes Function(Query$get_restaurant_desc_by_pk$translation_by_pk) then,
  ) = _CopyWithImpl$Query$get_restaurant_desc_by_pk$translation_by_pk;

  factory CopyWith$Query$get_restaurant_desc_by_pk$translation_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_restaurant_desc_by_pk$translation_by_pk;

  TRes call({
    int? id,
    List<Query$get_restaurant_desc_by_pk$translation_by_pk$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$get_restaurant_desc_by_pk$translation_by_pk$translations> Function(
              Iterable<
                  CopyWith$Query$get_restaurant_desc_by_pk$translation_by_pk$translations<
                      Query$get_restaurant_desc_by_pk$translation_by_pk$translations>>)
          _fn);
}

class _CopyWithImpl$Query$get_restaurant_desc_by_pk$translation_by_pk<TRes>
    implements
        CopyWith$Query$get_restaurant_desc_by_pk$translation_by_pk<TRes> {
  _CopyWithImpl$Query$get_restaurant_desc_by_pk$translation_by_pk(
    this._instance,
    this._then,
  );

  final Query$get_restaurant_desc_by_pk$translation_by_pk _instance;

  final TRes Function(Query$get_restaurant_desc_by_pk$translation_by_pk) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_restaurant_desc_by_pk$translation_by_pk(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$get_restaurant_desc_by_pk$translation_by_pk$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$get_restaurant_desc_by_pk$translation_by_pk$translations> Function(
                  Iterable<
                      CopyWith$Query$get_restaurant_desc_by_pk$translation_by_pk$translations<
                          Query$get_restaurant_desc_by_pk$translation_by_pk$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$get_restaurant_desc_by_pk$translation_by_pk$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$get_restaurant_desc_by_pk$translation_by_pk<TRes>
    implements
        CopyWith$Query$get_restaurant_desc_by_pk$translation_by_pk<TRes> {
  _CopyWithStubImpl$Query$get_restaurant_desc_by_pk$translation_by_pk(
      this._res);

  TRes _res;

  call({
    int? id,
    List<Query$get_restaurant_desc_by_pk$translation_by_pk$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$get_restaurant_desc_by_pk$translation_by_pk$translations {
  Query$get_restaurant_desc_by_pk$translation_by_pk$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$get_restaurant_desc_by_pk$translation_by_pk$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$get_restaurant_desc_by_pk$translation_by_pk$translations(
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
            is Query$get_restaurant_desc_by_pk$translation_by_pk$translations) ||
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

extension UtilityExtension$Query$get_restaurant_desc_by_pk$translation_by_pk$translations
    on Query$get_restaurant_desc_by_pk$translation_by_pk$translations {
  CopyWith$Query$get_restaurant_desc_by_pk$translation_by_pk$translations<
          Query$get_restaurant_desc_by_pk$translation_by_pk$translations>
      get copyWith =>
          CopyWith$Query$get_restaurant_desc_by_pk$translation_by_pk$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_restaurant_desc_by_pk$translation_by_pk$translations<
    TRes> {
  factory CopyWith$Query$get_restaurant_desc_by_pk$translation_by_pk$translations(
    Query$get_restaurant_desc_by_pk$translation_by_pk$translations instance,
    TRes Function(
            Query$get_restaurant_desc_by_pk$translation_by_pk$translations)
        then,
  ) = _CopyWithImpl$Query$get_restaurant_desc_by_pk$translation_by_pk$translations;

  factory CopyWith$Query$get_restaurant_desc_by_pk$translation_by_pk$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_restaurant_desc_by_pk$translation_by_pk$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_restaurant_desc_by_pk$translation_by_pk$translations<
        TRes>
    implements
        CopyWith$Query$get_restaurant_desc_by_pk$translation_by_pk$translations<
            TRes> {
  _CopyWithImpl$Query$get_restaurant_desc_by_pk$translation_by_pk$translations(
    this._instance,
    this._then,
  );

  final Query$get_restaurant_desc_by_pk$translation_by_pk$translations
      _instance;

  final TRes Function(
      Query$get_restaurant_desc_by_pk$translation_by_pk$translations) _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_restaurant_desc_by_pk$translation_by_pk$translations(
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

class _CopyWithStubImpl$Query$get_restaurant_desc_by_pk$translation_by_pk$translations<
        TRes>
    implements
        CopyWith$Query$get_restaurant_desc_by_pk$translation_by_pk$translations<
            TRes> {
  _CopyWithStubImpl$Query$get_restaurant_desc_by_pk$translation_by_pk$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$getOneRestaurant {
  factory Variables$Query$getOneRestaurant({required int id}) =>
      Variables$Query$getOneRestaurant._({
        r'id': id,
      });

  Variables$Query$getOneRestaurant._(this._$data);

  factory Variables$Query$getOneRestaurant.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as int);
    return Variables$Query$getOneRestaurant._(result$data);
  }

  Map<String, dynamic> _$data;

  int get id => (_$data['id'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$getOneRestaurant<Variables$Query$getOneRestaurant>
      get copyWith => CopyWith$Variables$Query$getOneRestaurant(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getOneRestaurant) ||
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

abstract class CopyWith$Variables$Query$getOneRestaurant<TRes> {
  factory CopyWith$Variables$Query$getOneRestaurant(
    Variables$Query$getOneRestaurant instance,
    TRes Function(Variables$Query$getOneRestaurant) then,
  ) = _CopyWithImpl$Variables$Query$getOneRestaurant;

  factory CopyWith$Variables$Query$getOneRestaurant.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getOneRestaurant;

  TRes call({int? id});
}

class _CopyWithImpl$Variables$Query$getOneRestaurant<TRes>
    implements CopyWith$Variables$Query$getOneRestaurant<TRes> {
  _CopyWithImpl$Variables$Query$getOneRestaurant(
    this._instance,
    this._then,
  );

  final Variables$Query$getOneRestaurant _instance;

  final TRes Function(Variables$Query$getOneRestaurant) _then;

  static const _undefined = {};

  TRes call({Object? id = _undefined}) =>
      _then(Variables$Query$getOneRestaurant._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$getOneRestaurant<TRes>
    implements CopyWith$Variables$Query$getOneRestaurant<TRes> {
  _CopyWithStubImpl$Variables$Query$getOneRestaurant(this._res);

  TRes _res;

  call({int? id}) => _res;
}

class Query$getOneRestaurant {
  Query$getOneRestaurant({
    this.restaurant_by_pk,
    required this.$__typename,
  });

  factory Query$getOneRestaurant.fromJson(Map<String, dynamic> json) {
    final l$restaurant_by_pk = json['restaurant_by_pk'];
    final l$$__typename = json['__typename'];
    return Query$getOneRestaurant(
      restaurant_by_pk: l$restaurant_by_pk == null
          ? null
          : Query$getOneRestaurant$restaurant_by_pk.fromJson(
              (l$restaurant_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getOneRestaurant$restaurant_by_pk? restaurant_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$restaurant_by_pk = restaurant_by_pk;
    _resultData['restaurant_by_pk'] = l$restaurant_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$restaurant_by_pk = restaurant_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$restaurant_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getOneRestaurant) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$restaurant_by_pk = restaurant_by_pk;
    final lOther$restaurant_by_pk = other.restaurant_by_pk;
    if (l$restaurant_by_pk != lOther$restaurant_by_pk) {
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

extension UtilityExtension$Query$getOneRestaurant on Query$getOneRestaurant {
  CopyWith$Query$getOneRestaurant<Query$getOneRestaurant> get copyWith =>
      CopyWith$Query$getOneRestaurant(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$getOneRestaurant<TRes> {
  factory CopyWith$Query$getOneRestaurant(
    Query$getOneRestaurant instance,
    TRes Function(Query$getOneRestaurant) then,
  ) = _CopyWithImpl$Query$getOneRestaurant;

  factory CopyWith$Query$getOneRestaurant.stub(TRes res) =
      _CopyWithStubImpl$Query$getOneRestaurant;

  TRes call({
    Query$getOneRestaurant$restaurant_by_pk? restaurant_by_pk,
    String? $__typename,
  });
  CopyWith$Query$getOneRestaurant$restaurant_by_pk<TRes> get restaurant_by_pk;
}

class _CopyWithImpl$Query$getOneRestaurant<TRes>
    implements CopyWith$Query$getOneRestaurant<TRes> {
  _CopyWithImpl$Query$getOneRestaurant(
    this._instance,
    this._then,
  );

  final Query$getOneRestaurant _instance;

  final TRes Function(Query$getOneRestaurant) _then;

  static const _undefined = {};

  TRes call({
    Object? restaurant_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getOneRestaurant(
        restaurant_by_pk: restaurant_by_pk == _undefined
            ? _instance.restaurant_by_pk
            : (restaurant_by_pk as Query$getOneRestaurant$restaurant_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getOneRestaurant$restaurant_by_pk<TRes> get restaurant_by_pk {
    final local$restaurant_by_pk = _instance.restaurant_by_pk;
    return local$restaurant_by_pk == null
        ? CopyWith$Query$getOneRestaurant$restaurant_by_pk.stub(
            _then(_instance))
        : CopyWith$Query$getOneRestaurant$restaurant_by_pk(
            local$restaurant_by_pk, (e) => call(restaurant_by_pk: e));
  }
}

class _CopyWithStubImpl$Query$getOneRestaurant<TRes>
    implements CopyWith$Query$getOneRestaurant<TRes> {
  _CopyWithStubImpl$Query$getOneRestaurant(this._res);

  TRes _res;

  call({
    Query$getOneRestaurant$restaurant_by_pk? restaurant_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getOneRestaurant$restaurant_by_pk<TRes> get restaurant_by_pk =>
      CopyWith$Query$getOneRestaurant$restaurant_by_pk.stub(_res);
}

const documentNodeQuerygetOneRestaurant = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getOneRestaurant'),
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
        name: NameNode(value: 'restaurant_by_pk'),
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
            name: NameNode(value: 'language_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'description_id'),
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
            name: NameNode(value: 'self_delivery'),
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
            name: NameNode(value: 'stripe_info'),
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
            name: NameNode(value: 'approved'),
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
Query$getOneRestaurant _parserFn$Query$getOneRestaurant(
        Map<String, dynamic> data) =>
    Query$getOneRestaurant.fromJson(data);

class Options$Query$getOneRestaurant
    extends graphql.QueryOptions<Query$getOneRestaurant> {
  Options$Query$getOneRestaurant({
    String? operationName,
    required Variables$Query$getOneRestaurant variables,
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
          document: documentNodeQuerygetOneRestaurant,
          parserFn: _parserFn$Query$getOneRestaurant,
        );
}

class WatchOptions$Query$getOneRestaurant
    extends graphql.WatchQueryOptions<Query$getOneRestaurant> {
  WatchOptions$Query$getOneRestaurant({
    String? operationName,
    required Variables$Query$getOneRestaurant variables,
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
          document: documentNodeQuerygetOneRestaurant,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getOneRestaurant,
        );
}

class FetchMoreOptions$Query$getOneRestaurant extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getOneRestaurant({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getOneRestaurant variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetOneRestaurant,
        );
}

extension ClientExtension$Query$getOneRestaurant on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getOneRestaurant>> query$getOneRestaurant(
          Options$Query$getOneRestaurant options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$getOneRestaurant> watchQuery$getOneRestaurant(
          WatchOptions$Query$getOneRestaurant options) =>
      this.watchQuery(options);
  void writeQuery$getOneRestaurant({
    required Query$getOneRestaurant data,
    required Variables$Query$getOneRestaurant variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQuerygetOneRestaurant),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getOneRestaurant? readQuery$getOneRestaurant({
    required Variables$Query$getOneRestaurant variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQuerygetOneRestaurant),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$getOneRestaurant.fromJson(result);
  }
}

class Query$getOneRestaurant$restaurant_by_pk {
  Query$getOneRestaurant$restaurant_by_pk({
    required this.id,
    this.firebase_id,
    required this.image,
    required this.language_id,
    this.description_id,
    required this.location_gps,
    required this.location_text,
    required this.self_delivery,
    this.accepted_payments,
    this.stripe_info,
    required this.name,
    this.description,
    required this.approved,
    this.schedule,
    required this.open_status,
    required this.$__typename,
  });

  factory Query$getOneRestaurant$restaurant_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$firebase_id = json['firebase_id'];
    final l$image = json['image'];
    final l$language_id = json['language_id'];
    final l$description_id = json['description_id'];
    final l$location_gps = json['location_gps'];
    final l$location_text = json['location_text'];
    final l$self_delivery = json['self_delivery'];
    final l$accepted_payments = json['accepted_payments'];
    final l$stripe_info = json['stripe_info'];
    final l$name = json['name'];
    final l$description = json['description'];
    final l$approved = json['approved'];
    final l$schedule = json['schedule'];
    final l$open_status = json['open_status'];
    final l$$__typename = json['__typename'];
    return Query$getOneRestaurant$restaurant_by_pk(
      id: (l$id as int),
      firebase_id: (l$firebase_id as String?),
      image: (l$image as String),
      language_id: (l$language_id as String),
      description_id: (l$description_id as int?),
      location_gps: geographyFromJson(l$location_gps),
      location_text: (l$location_text as String),
      self_delivery: (l$self_delivery as bool),
      accepted_payments:
          l$accepted_payments == null ? null : mapFromJson(l$accepted_payments),
      stripe_info: l$stripe_info == null ? null : mapFromJson(l$stripe_info),
      name: (l$name as String),
      description: l$description == null
          ? null
          : Query$getOneRestaurant$restaurant_by_pk$description.fromJson(
              (l$description as Map<String, dynamic>)),
      approved: (l$approved as bool),
      schedule: l$schedule == null ? null : mapFromJson(l$schedule),
      open_status: (l$open_status as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String? firebase_id;

  final String image;

  final String language_id;

  final int? description_id;

  final Geography location_gps;

  final String location_text;

  final bool self_delivery;

  final dynamic? accepted_payments;

  final dynamic? stripe_info;

  final String name;

  final Query$getOneRestaurant$restaurant_by_pk$description? description;

  final bool approved;

  final dynamic? schedule;

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
    final l$language_id = language_id;
    _resultData['language_id'] = l$language_id;
    final l$description_id = description_id;
    _resultData['description_id'] = l$description_id;
    final l$location_gps = location_gps;
    _resultData['location_gps'] = geographyToJson(l$location_gps);
    final l$location_text = location_text;
    _resultData['location_text'] = l$location_text;
    final l$self_delivery = self_delivery;
    _resultData['self_delivery'] = l$self_delivery;
    final l$accepted_payments = accepted_payments;
    _resultData['accepted_payments'] =
        l$accepted_payments == null ? null : mapToJson(l$accepted_payments);
    final l$stripe_info = stripe_info;
    _resultData['stripe_info'] =
        l$stripe_info == null ? null : mapToJson(l$stripe_info);
    final l$name = name;
    _resultData['name'] = l$name;
    final l$description = description;
    _resultData['description'] = l$description?.toJson();
    final l$approved = approved;
    _resultData['approved'] = l$approved;
    final l$schedule = schedule;
    _resultData['schedule'] = l$schedule == null ? null : mapToJson(l$schedule);
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
    final l$language_id = language_id;
    final l$description_id = description_id;
    final l$location_gps = location_gps;
    final l$location_text = location_text;
    final l$self_delivery = self_delivery;
    final l$accepted_payments = accepted_payments;
    final l$stripe_info = stripe_info;
    final l$name = name;
    final l$description = description;
    final l$approved = approved;
    final l$schedule = schedule;
    final l$open_status = open_status;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$firebase_id,
      l$image,
      l$language_id,
      l$description_id,
      l$location_gps,
      l$location_text,
      l$self_delivery,
      l$accepted_payments,
      l$stripe_info,
      l$name,
      l$description,
      l$approved,
      l$schedule,
      l$open_status,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getOneRestaurant$restaurant_by_pk) ||
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
    final l$language_id = language_id;
    final lOther$language_id = other.language_id;
    if (l$language_id != lOther$language_id) {
      return false;
    }
    final l$description_id = description_id;
    final lOther$description_id = other.description_id;
    if (l$description_id != lOther$description_id) {
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
    final l$self_delivery = self_delivery;
    final lOther$self_delivery = other.self_delivery;
    if (l$self_delivery != lOther$self_delivery) {
      return false;
    }
    final l$accepted_payments = accepted_payments;
    final lOther$accepted_payments = other.accepted_payments;
    if (l$accepted_payments != lOther$accepted_payments) {
      return false;
    }
    final l$stripe_info = stripe_info;
    final lOther$stripe_info = other.stripe_info;
    if (l$stripe_info != lOther$stripe_info) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
      return false;
    }
    final l$approved = approved;
    final lOther$approved = other.approved;
    if (l$approved != lOther$approved) {
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$getOneRestaurant$restaurant_by_pk
    on Query$getOneRestaurant$restaurant_by_pk {
  CopyWith$Query$getOneRestaurant$restaurant_by_pk<
          Query$getOneRestaurant$restaurant_by_pk>
      get copyWith => CopyWith$Query$getOneRestaurant$restaurant_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getOneRestaurant$restaurant_by_pk<TRes> {
  factory CopyWith$Query$getOneRestaurant$restaurant_by_pk(
    Query$getOneRestaurant$restaurant_by_pk instance,
    TRes Function(Query$getOneRestaurant$restaurant_by_pk) then,
  ) = _CopyWithImpl$Query$getOneRestaurant$restaurant_by_pk;

  factory CopyWith$Query$getOneRestaurant$restaurant_by_pk.stub(TRes res) =
      _CopyWithStubImpl$Query$getOneRestaurant$restaurant_by_pk;

  TRes call({
    int? id,
    String? firebase_id,
    String? image,
    String? language_id,
    int? description_id,
    Geography? location_gps,
    String? location_text,
    bool? self_delivery,
    dynamic? accepted_payments,
    dynamic? stripe_info,
    String? name,
    Query$getOneRestaurant$restaurant_by_pk$description? description,
    bool? approved,
    dynamic? schedule,
    String? open_status,
    String? $__typename,
  });
  CopyWith$Query$getOneRestaurant$restaurant_by_pk$description<TRes>
      get description;
}

class _CopyWithImpl$Query$getOneRestaurant$restaurant_by_pk<TRes>
    implements CopyWith$Query$getOneRestaurant$restaurant_by_pk<TRes> {
  _CopyWithImpl$Query$getOneRestaurant$restaurant_by_pk(
    this._instance,
    this._then,
  );

  final Query$getOneRestaurant$restaurant_by_pk _instance;

  final TRes Function(Query$getOneRestaurant$restaurant_by_pk) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? firebase_id = _undefined,
    Object? image = _undefined,
    Object? language_id = _undefined,
    Object? description_id = _undefined,
    Object? location_gps = _undefined,
    Object? location_text = _undefined,
    Object? self_delivery = _undefined,
    Object? accepted_payments = _undefined,
    Object? stripe_info = _undefined,
    Object? name = _undefined,
    Object? description = _undefined,
    Object? approved = _undefined,
    Object? schedule = _undefined,
    Object? open_status = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getOneRestaurant$restaurant_by_pk(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        firebase_id: firebase_id == _undefined
            ? _instance.firebase_id
            : (firebase_id as String?),
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        language_id: language_id == _undefined || language_id == null
            ? _instance.language_id
            : (language_id as String),
        description_id: description_id == _undefined
            ? _instance.description_id
            : (description_id as int?),
        location_gps: location_gps == _undefined || location_gps == null
            ? _instance.location_gps
            : (location_gps as Geography),
        location_text: location_text == _undefined || location_text == null
            ? _instance.location_text
            : (location_text as String),
        self_delivery: self_delivery == _undefined || self_delivery == null
            ? _instance.self_delivery
            : (self_delivery as bool),
        accepted_payments: accepted_payments == _undefined
            ? _instance.accepted_payments
            : (accepted_payments as dynamic?),
        stripe_info: stripe_info == _undefined
            ? _instance.stripe_info
            : (stripe_info as dynamic?),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        description: description == _undefined
            ? _instance.description
            : (description
                as Query$getOneRestaurant$restaurant_by_pk$description?),
        approved: approved == _undefined || approved == null
            ? _instance.approved
            : (approved as bool),
        schedule: schedule == _undefined
            ? _instance.schedule
            : (schedule as dynamic?),
        open_status: open_status == _undefined || open_status == null
            ? _instance.open_status
            : (open_status as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getOneRestaurant$restaurant_by_pk$description<TRes>
      get description {
    final local$description = _instance.description;
    return local$description == null
        ? CopyWith$Query$getOneRestaurant$restaurant_by_pk$description.stub(
            _then(_instance))
        : CopyWith$Query$getOneRestaurant$restaurant_by_pk$description(
            local$description, (e) => call(description: e));
  }
}

class _CopyWithStubImpl$Query$getOneRestaurant$restaurant_by_pk<TRes>
    implements CopyWith$Query$getOneRestaurant$restaurant_by_pk<TRes> {
  _CopyWithStubImpl$Query$getOneRestaurant$restaurant_by_pk(this._res);

  TRes _res;

  call({
    int? id,
    String? firebase_id,
    String? image,
    String? language_id,
    int? description_id,
    Geography? location_gps,
    String? location_text,
    bool? self_delivery,
    dynamic? accepted_payments,
    dynamic? stripe_info,
    String? name,
    Query$getOneRestaurant$restaurant_by_pk$description? description,
    bool? approved,
    dynamic? schedule,
    String? open_status,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getOneRestaurant$restaurant_by_pk$description<TRes>
      get description =>
          CopyWith$Query$getOneRestaurant$restaurant_by_pk$description.stub(
              _res);
}

class Query$getOneRestaurant$restaurant_by_pk$description {
  Query$getOneRestaurant$restaurant_by_pk$description({
    required this.translations,
    required this.$__typename,
  });

  factory Query$getOneRestaurant$restaurant_by_pk$description.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$getOneRestaurant$restaurant_by_pk$description(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$getOneRestaurant$restaurant_by_pk$description$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$getOneRestaurant$restaurant_by_pk$description$translations>
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
    if (!(other is Query$getOneRestaurant$restaurant_by_pk$description) ||
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

extension UtilityExtension$Query$getOneRestaurant$restaurant_by_pk$description
    on Query$getOneRestaurant$restaurant_by_pk$description {
  CopyWith$Query$getOneRestaurant$restaurant_by_pk$description<
          Query$getOneRestaurant$restaurant_by_pk$description>
      get copyWith =>
          CopyWith$Query$getOneRestaurant$restaurant_by_pk$description(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getOneRestaurant$restaurant_by_pk$description<
    TRes> {
  factory CopyWith$Query$getOneRestaurant$restaurant_by_pk$description(
    Query$getOneRestaurant$restaurant_by_pk$description instance,
    TRes Function(Query$getOneRestaurant$restaurant_by_pk$description) then,
  ) = _CopyWithImpl$Query$getOneRestaurant$restaurant_by_pk$description;

  factory CopyWith$Query$getOneRestaurant$restaurant_by_pk$description.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getOneRestaurant$restaurant_by_pk$description;

  TRes call({
    List<Query$getOneRestaurant$restaurant_by_pk$description$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$getOneRestaurant$restaurant_by_pk$description$translations> Function(
              Iterable<
                  CopyWith$Query$getOneRestaurant$restaurant_by_pk$description$translations<
                      Query$getOneRestaurant$restaurant_by_pk$description$translations>>)
          _fn);
}

class _CopyWithImpl$Query$getOneRestaurant$restaurant_by_pk$description<TRes>
    implements
        CopyWith$Query$getOneRestaurant$restaurant_by_pk$description<TRes> {
  _CopyWithImpl$Query$getOneRestaurant$restaurant_by_pk$description(
    this._instance,
    this._then,
  );

  final Query$getOneRestaurant$restaurant_by_pk$description _instance;

  final TRes Function(Query$getOneRestaurant$restaurant_by_pk$description)
      _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getOneRestaurant$restaurant_by_pk$description(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$getOneRestaurant$restaurant_by_pk$description$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$getOneRestaurant$restaurant_by_pk$description$translations> Function(
                  Iterable<
                      CopyWith$Query$getOneRestaurant$restaurant_by_pk$description$translations<
                          Query$getOneRestaurant$restaurant_by_pk$description$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$getOneRestaurant$restaurant_by_pk$description$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getOneRestaurant$restaurant_by_pk$description<
        TRes>
    implements
        CopyWith$Query$getOneRestaurant$restaurant_by_pk$description<TRes> {
  _CopyWithStubImpl$Query$getOneRestaurant$restaurant_by_pk$description(
      this._res);

  TRes _res;

  call({
    List<Query$getOneRestaurant$restaurant_by_pk$description$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$getOneRestaurant$restaurant_by_pk$description$translations {
  Query$getOneRestaurant$restaurant_by_pk$description$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$getOneRestaurant$restaurant_by_pk$description$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$getOneRestaurant$restaurant_by_pk$description$translations(
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
            is Query$getOneRestaurant$restaurant_by_pk$description$translations) ||
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

extension UtilityExtension$Query$getOneRestaurant$restaurant_by_pk$description$translations
    on Query$getOneRestaurant$restaurant_by_pk$description$translations {
  CopyWith$Query$getOneRestaurant$restaurant_by_pk$description$translations<
          Query$getOneRestaurant$restaurant_by_pk$description$translations>
      get copyWith =>
          CopyWith$Query$getOneRestaurant$restaurant_by_pk$description$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getOneRestaurant$restaurant_by_pk$description$translations<
    TRes> {
  factory CopyWith$Query$getOneRestaurant$restaurant_by_pk$description$translations(
    Query$getOneRestaurant$restaurant_by_pk$description$translations instance,
    TRes Function(
            Query$getOneRestaurant$restaurant_by_pk$description$translations)
        then,
  ) = _CopyWithImpl$Query$getOneRestaurant$restaurant_by_pk$description$translations;

  factory CopyWith$Query$getOneRestaurant$restaurant_by_pk$description$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getOneRestaurant$restaurant_by_pk$description$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getOneRestaurant$restaurant_by_pk$description$translations<
        TRes>
    implements
        CopyWith$Query$getOneRestaurant$restaurant_by_pk$description$translations<
            TRes> {
  _CopyWithImpl$Query$getOneRestaurant$restaurant_by_pk$description$translations(
    this._instance,
    this._then,
  );

  final Query$getOneRestaurant$restaurant_by_pk$description$translations
      _instance;

  final TRes Function(
      Query$getOneRestaurant$restaurant_by_pk$description$translations) _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getOneRestaurant$restaurant_by_pk$description$translations(
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

class _CopyWithStubImpl$Query$getOneRestaurant$restaurant_by_pk$description$translations<
        TRes>
    implements
        CopyWith$Query$getOneRestaurant$restaurant_by_pk$description$translations<
            TRes> {
  _CopyWithStubImpl$Query$getOneRestaurant$restaurant_by_pk$description$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$getRestaurantStatus {
  factory Variables$Query$getRestaurantStatus({required int id}) =>
      Variables$Query$getRestaurantStatus._({
        r'id': id,
      });

  Variables$Query$getRestaurantStatus._(this._$data);

  factory Variables$Query$getRestaurantStatus.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as int);
    return Variables$Query$getRestaurantStatus._(result$data);
  }

  Map<String, dynamic> _$data;

  int get id => (_$data['id'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$getRestaurantStatus<
          Variables$Query$getRestaurantStatus>
      get copyWith => CopyWith$Variables$Query$getRestaurantStatus(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getRestaurantStatus) ||
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

abstract class CopyWith$Variables$Query$getRestaurantStatus<TRes> {
  factory CopyWith$Variables$Query$getRestaurantStatus(
    Variables$Query$getRestaurantStatus instance,
    TRes Function(Variables$Query$getRestaurantStatus) then,
  ) = _CopyWithImpl$Variables$Query$getRestaurantStatus;

  factory CopyWith$Variables$Query$getRestaurantStatus.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getRestaurantStatus;

  TRes call({int? id});
}

class _CopyWithImpl$Variables$Query$getRestaurantStatus<TRes>
    implements CopyWith$Variables$Query$getRestaurantStatus<TRes> {
  _CopyWithImpl$Variables$Query$getRestaurantStatus(
    this._instance,
    this._then,
  );

  final Variables$Query$getRestaurantStatus _instance;

  final TRes Function(Variables$Query$getRestaurantStatus) _then;

  static const _undefined = {};

  TRes call({Object? id = _undefined}) =>
      _then(Variables$Query$getRestaurantStatus._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$getRestaurantStatus<TRes>
    implements CopyWith$Variables$Query$getRestaurantStatus<TRes> {
  _CopyWithStubImpl$Variables$Query$getRestaurantStatus(this._res);

  TRes _res;

  call({int? id}) => _res;
}

class Query$getRestaurantStatus {
  Query$getRestaurantStatus({
    this.restaurant_by_pk,
    required this.$__typename,
  });

  factory Query$getRestaurantStatus.fromJson(Map<String, dynamic> json) {
    final l$restaurant_by_pk = json['restaurant_by_pk'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurantStatus(
      restaurant_by_pk: l$restaurant_by_pk == null
          ? null
          : Query$getRestaurantStatus$restaurant_by_pk.fromJson(
              (l$restaurant_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getRestaurantStatus$restaurant_by_pk? restaurant_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$restaurant_by_pk = restaurant_by_pk;
    _resultData['restaurant_by_pk'] = l$restaurant_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$restaurant_by_pk = restaurant_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$restaurant_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getRestaurantStatus) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$restaurant_by_pk = restaurant_by_pk;
    final lOther$restaurant_by_pk = other.restaurant_by_pk;
    if (l$restaurant_by_pk != lOther$restaurant_by_pk) {
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

extension UtilityExtension$Query$getRestaurantStatus
    on Query$getRestaurantStatus {
  CopyWith$Query$getRestaurantStatus<Query$getRestaurantStatus> get copyWith =>
      CopyWith$Query$getRestaurantStatus(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$getRestaurantStatus<TRes> {
  factory CopyWith$Query$getRestaurantStatus(
    Query$getRestaurantStatus instance,
    TRes Function(Query$getRestaurantStatus) then,
  ) = _CopyWithImpl$Query$getRestaurantStatus;

  factory CopyWith$Query$getRestaurantStatus.stub(TRes res) =
      _CopyWithStubImpl$Query$getRestaurantStatus;

  TRes call({
    Query$getRestaurantStatus$restaurant_by_pk? restaurant_by_pk,
    String? $__typename,
  });
  CopyWith$Query$getRestaurantStatus$restaurant_by_pk<TRes>
      get restaurant_by_pk;
}

class _CopyWithImpl$Query$getRestaurantStatus<TRes>
    implements CopyWith$Query$getRestaurantStatus<TRes> {
  _CopyWithImpl$Query$getRestaurantStatus(
    this._instance,
    this._then,
  );

  final Query$getRestaurantStatus _instance;

  final TRes Function(Query$getRestaurantStatus) _then;

  static const _undefined = {};

  TRes call({
    Object? restaurant_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getRestaurantStatus(
        restaurant_by_pk: restaurant_by_pk == _undefined
            ? _instance.restaurant_by_pk
            : (restaurant_by_pk as Query$getRestaurantStatus$restaurant_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getRestaurantStatus$restaurant_by_pk<TRes>
      get restaurant_by_pk {
    final local$restaurant_by_pk = _instance.restaurant_by_pk;
    return local$restaurant_by_pk == null
        ? CopyWith$Query$getRestaurantStatus$restaurant_by_pk.stub(
            _then(_instance))
        : CopyWith$Query$getRestaurantStatus$restaurant_by_pk(
            local$restaurant_by_pk, (e) => call(restaurant_by_pk: e));
  }
}

class _CopyWithStubImpl$Query$getRestaurantStatus<TRes>
    implements CopyWith$Query$getRestaurantStatus<TRes> {
  _CopyWithStubImpl$Query$getRestaurantStatus(this._res);

  TRes _res;

  call({
    Query$getRestaurantStatus$restaurant_by_pk? restaurant_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getRestaurantStatus$restaurant_by_pk<TRes>
      get restaurant_by_pk =>
          CopyWith$Query$getRestaurantStatus$restaurant_by_pk.stub(_res);
}

const documentNodeQuerygetRestaurantStatus = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getRestaurantStatus'),
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
        name: NameNode(value: 'restaurant_by_pk'),
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
      
    ]),
  ),
]);
Query$getRestaurantStatus _parserFn$Query$getRestaurantStatus(
        Map<String, dynamic> data) =>
    Query$getRestaurantStatus.fromJson(data);

class Options$Query$getRestaurantStatus
    extends graphql.QueryOptions<Query$getRestaurantStatus> {
  Options$Query$getRestaurantStatus({
    String? operationName,
    required Variables$Query$getRestaurantStatus variables,
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
          document: documentNodeQuerygetRestaurantStatus,
          parserFn: _parserFn$Query$getRestaurantStatus,
        );
}

class WatchOptions$Query$getRestaurantStatus
    extends graphql.WatchQueryOptions<Query$getRestaurantStatus> {
  WatchOptions$Query$getRestaurantStatus({
    String? operationName,
    required Variables$Query$getRestaurantStatus variables,
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
          document: documentNodeQuerygetRestaurantStatus,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getRestaurantStatus,
        );
}

class FetchMoreOptions$Query$getRestaurantStatus
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getRestaurantStatus({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getRestaurantStatus variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetRestaurantStatus,
        );
}

extension ClientExtension$Query$getRestaurantStatus on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getRestaurantStatus>>
      query$getRestaurantStatus(
              Options$Query$getRestaurantStatus options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$getRestaurantStatus>
      watchQuery$getRestaurantStatus(
              WatchOptions$Query$getRestaurantStatus options) =>
          this.watchQuery(options);
  void writeQuery$getRestaurantStatus({
    required Query$getRestaurantStatus data,
    required Variables$Query$getRestaurantStatus variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQuerygetRestaurantStatus),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getRestaurantStatus? readQuery$getRestaurantStatus({
    required Variables$Query$getRestaurantStatus variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQuerygetRestaurantStatus),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$getRestaurantStatus.fromJson(result);
  }
}

class Query$getRestaurantStatus$restaurant_by_pk {
  Query$getRestaurantStatus$restaurant_by_pk({
    required this.open_status,
    required this.$__typename,
  });

  factory Query$getRestaurantStatus$restaurant_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$open_status = json['open_status'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurantStatus$restaurant_by_pk(
      open_status: (l$open_status as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String open_status;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$open_status = open_status;
    _resultData['open_status'] = l$open_status;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$open_status = open_status;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$open_status,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getRestaurantStatus$restaurant_by_pk) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$getRestaurantStatus$restaurant_by_pk
    on Query$getRestaurantStatus$restaurant_by_pk {
  CopyWith$Query$getRestaurantStatus$restaurant_by_pk<
          Query$getRestaurantStatus$restaurant_by_pk>
      get copyWith => CopyWith$Query$getRestaurantStatus$restaurant_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurantStatus$restaurant_by_pk<TRes> {
  factory CopyWith$Query$getRestaurantStatus$restaurant_by_pk(
    Query$getRestaurantStatus$restaurant_by_pk instance,
    TRes Function(Query$getRestaurantStatus$restaurant_by_pk) then,
  ) = _CopyWithImpl$Query$getRestaurantStatus$restaurant_by_pk;

  factory CopyWith$Query$getRestaurantStatus$restaurant_by_pk.stub(TRes res) =
      _CopyWithStubImpl$Query$getRestaurantStatus$restaurant_by_pk;

  TRes call({
    String? open_status,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getRestaurantStatus$restaurant_by_pk<TRes>
    implements CopyWith$Query$getRestaurantStatus$restaurant_by_pk<TRes> {
  _CopyWithImpl$Query$getRestaurantStatus$restaurant_by_pk(
    this._instance,
    this._then,
  );

  final Query$getRestaurantStatus$restaurant_by_pk _instance;

  final TRes Function(Query$getRestaurantStatus$restaurant_by_pk) _then;

  static const _undefined = {};

  TRes call({
    Object? open_status = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getRestaurantStatus$restaurant_by_pk(
        open_status: open_status == _undefined || open_status == null
            ? _instance.open_status
            : (open_status as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getRestaurantStatus$restaurant_by_pk<TRes>
    implements CopyWith$Query$getRestaurantStatus$restaurant_by_pk<TRes> {
  _CopyWithStubImpl$Query$getRestaurantStatus$restaurant_by_pk(this._res);

  TRes _res;

  call({
    String? open_status,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$getRestaurantSchedule {
  factory Variables$Query$getRestaurantSchedule({required int id}) =>
      Variables$Query$getRestaurantSchedule._({
        r'id': id,
      });

  Variables$Query$getRestaurantSchedule._(this._$data);

  factory Variables$Query$getRestaurantSchedule.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as int);
    return Variables$Query$getRestaurantSchedule._(result$data);
  }

  Map<String, dynamic> _$data;

  int get id => (_$data['id'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$getRestaurantSchedule<
          Variables$Query$getRestaurantSchedule>
      get copyWith => CopyWith$Variables$Query$getRestaurantSchedule(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getRestaurantSchedule) ||
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

abstract class CopyWith$Variables$Query$getRestaurantSchedule<TRes> {
  factory CopyWith$Variables$Query$getRestaurantSchedule(
    Variables$Query$getRestaurantSchedule instance,
    TRes Function(Variables$Query$getRestaurantSchedule) then,
  ) = _CopyWithImpl$Variables$Query$getRestaurantSchedule;

  factory CopyWith$Variables$Query$getRestaurantSchedule.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getRestaurantSchedule;

  TRes call({int? id});
}

class _CopyWithImpl$Variables$Query$getRestaurantSchedule<TRes>
    implements CopyWith$Variables$Query$getRestaurantSchedule<TRes> {
  _CopyWithImpl$Variables$Query$getRestaurantSchedule(
    this._instance,
    this._then,
  );

  final Variables$Query$getRestaurantSchedule _instance;

  final TRes Function(Variables$Query$getRestaurantSchedule) _then;

  static const _undefined = {};

  TRes call({Object? id = _undefined}) =>
      _then(Variables$Query$getRestaurantSchedule._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$getRestaurantSchedule<TRes>
    implements CopyWith$Variables$Query$getRestaurantSchedule<TRes> {
  _CopyWithStubImpl$Variables$Query$getRestaurantSchedule(this._res);

  TRes _res;

  call({int? id}) => _res;
}

class Query$getRestaurantSchedule {
  Query$getRestaurantSchedule({
    this.restaurant_by_pk,
    required this.$__typename,
  });

  factory Query$getRestaurantSchedule.fromJson(Map<String, dynamic> json) {
    final l$restaurant_by_pk = json['restaurant_by_pk'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurantSchedule(
      restaurant_by_pk: l$restaurant_by_pk == null
          ? null
          : Query$getRestaurantSchedule$restaurant_by_pk.fromJson(
              (l$restaurant_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getRestaurantSchedule$restaurant_by_pk? restaurant_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$restaurant_by_pk = restaurant_by_pk;
    _resultData['restaurant_by_pk'] = l$restaurant_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$restaurant_by_pk = restaurant_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$restaurant_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getRestaurantSchedule) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$restaurant_by_pk = restaurant_by_pk;
    final lOther$restaurant_by_pk = other.restaurant_by_pk;
    if (l$restaurant_by_pk != lOther$restaurant_by_pk) {
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

extension UtilityExtension$Query$getRestaurantSchedule
    on Query$getRestaurantSchedule {
  CopyWith$Query$getRestaurantSchedule<Query$getRestaurantSchedule>
      get copyWith => CopyWith$Query$getRestaurantSchedule(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurantSchedule<TRes> {
  factory CopyWith$Query$getRestaurantSchedule(
    Query$getRestaurantSchedule instance,
    TRes Function(Query$getRestaurantSchedule) then,
  ) = _CopyWithImpl$Query$getRestaurantSchedule;

  factory CopyWith$Query$getRestaurantSchedule.stub(TRes res) =
      _CopyWithStubImpl$Query$getRestaurantSchedule;

  TRes call({
    Query$getRestaurantSchedule$restaurant_by_pk? restaurant_by_pk,
    String? $__typename,
  });
  CopyWith$Query$getRestaurantSchedule$restaurant_by_pk<TRes>
      get restaurant_by_pk;
}

class _CopyWithImpl$Query$getRestaurantSchedule<TRes>
    implements CopyWith$Query$getRestaurantSchedule<TRes> {
  _CopyWithImpl$Query$getRestaurantSchedule(
    this._instance,
    this._then,
  );

  final Query$getRestaurantSchedule _instance;

  final TRes Function(Query$getRestaurantSchedule) _then;

  static const _undefined = {};

  TRes call({
    Object? restaurant_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getRestaurantSchedule(
        restaurant_by_pk: restaurant_by_pk == _undefined
            ? _instance.restaurant_by_pk
            : (restaurant_by_pk
                as Query$getRestaurantSchedule$restaurant_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getRestaurantSchedule$restaurant_by_pk<TRes>
      get restaurant_by_pk {
    final local$restaurant_by_pk = _instance.restaurant_by_pk;
    return local$restaurant_by_pk == null
        ? CopyWith$Query$getRestaurantSchedule$restaurant_by_pk.stub(
            _then(_instance))
        : CopyWith$Query$getRestaurantSchedule$restaurant_by_pk(
            local$restaurant_by_pk, (e) => call(restaurant_by_pk: e));
  }
}

class _CopyWithStubImpl$Query$getRestaurantSchedule<TRes>
    implements CopyWith$Query$getRestaurantSchedule<TRes> {
  _CopyWithStubImpl$Query$getRestaurantSchedule(this._res);

  TRes _res;

  call({
    Query$getRestaurantSchedule$restaurant_by_pk? restaurant_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getRestaurantSchedule$restaurant_by_pk<TRes>
      get restaurant_by_pk =>
          CopyWith$Query$getRestaurantSchedule$restaurant_by_pk.stub(_res);
}

const documentNodeQuerygetRestaurantSchedule = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getRestaurantSchedule'),
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
        name: NameNode(value: 'restaurant_by_pk'),
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
            name: NameNode(value: 'schedule'),
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
Query$getRestaurantSchedule _parserFn$Query$getRestaurantSchedule(
        Map<String, dynamic> data) =>
    Query$getRestaurantSchedule.fromJson(data);

class Options$Query$getRestaurantSchedule
    extends graphql.QueryOptions<Query$getRestaurantSchedule> {
  Options$Query$getRestaurantSchedule({
    String? operationName,
    required Variables$Query$getRestaurantSchedule variables,
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
          document: documentNodeQuerygetRestaurantSchedule,
          parserFn: _parserFn$Query$getRestaurantSchedule,
        );
}

class WatchOptions$Query$getRestaurantSchedule
    extends graphql.WatchQueryOptions<Query$getRestaurantSchedule> {
  WatchOptions$Query$getRestaurantSchedule({
    String? operationName,
    required Variables$Query$getRestaurantSchedule variables,
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
          document: documentNodeQuerygetRestaurantSchedule,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getRestaurantSchedule,
        );
}

class FetchMoreOptions$Query$getRestaurantSchedule
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getRestaurantSchedule({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getRestaurantSchedule variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetRestaurantSchedule,
        );
}

extension ClientExtension$Query$getRestaurantSchedule on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getRestaurantSchedule>>
      query$getRestaurantSchedule(
              Options$Query$getRestaurantSchedule options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$getRestaurantSchedule>
      watchQuery$getRestaurantSchedule(
              WatchOptions$Query$getRestaurantSchedule options) =>
          this.watchQuery(options);
  void writeQuery$getRestaurantSchedule({
    required Query$getRestaurantSchedule data,
    required Variables$Query$getRestaurantSchedule variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQuerygetRestaurantSchedule),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getRestaurantSchedule? readQuery$getRestaurantSchedule({
    required Variables$Query$getRestaurantSchedule variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQuerygetRestaurantSchedule),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$getRestaurantSchedule.fromJson(result);
  }
}

class Query$getRestaurantSchedule$restaurant_by_pk {
  Query$getRestaurantSchedule$restaurant_by_pk({
    this.schedule,
    required this.$__typename,
  });

  factory Query$getRestaurantSchedule$restaurant_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$schedule = json['schedule'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurantSchedule$restaurant_by_pk(
      schedule: l$schedule == null ? null : mapFromJson(l$schedule),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final dynamic? schedule;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$schedule = schedule;
    _resultData['schedule'] = l$schedule == null ? null : mapToJson(l$schedule);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$schedule = schedule;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$schedule,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getRestaurantSchedule$restaurant_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$schedule = schedule;
    final lOther$schedule = other.schedule;
    if (l$schedule != lOther$schedule) {
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

extension UtilityExtension$Query$getRestaurantSchedule$restaurant_by_pk
    on Query$getRestaurantSchedule$restaurant_by_pk {
  CopyWith$Query$getRestaurantSchedule$restaurant_by_pk<
          Query$getRestaurantSchedule$restaurant_by_pk>
      get copyWith => CopyWith$Query$getRestaurantSchedule$restaurant_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurantSchedule$restaurant_by_pk<TRes> {
  factory CopyWith$Query$getRestaurantSchedule$restaurant_by_pk(
    Query$getRestaurantSchedule$restaurant_by_pk instance,
    TRes Function(Query$getRestaurantSchedule$restaurant_by_pk) then,
  ) = _CopyWithImpl$Query$getRestaurantSchedule$restaurant_by_pk;

  factory CopyWith$Query$getRestaurantSchedule$restaurant_by_pk.stub(TRes res) =
      _CopyWithStubImpl$Query$getRestaurantSchedule$restaurant_by_pk;

  TRes call({
    dynamic? schedule,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getRestaurantSchedule$restaurant_by_pk<TRes>
    implements CopyWith$Query$getRestaurantSchedule$restaurant_by_pk<TRes> {
  _CopyWithImpl$Query$getRestaurantSchedule$restaurant_by_pk(
    this._instance,
    this._then,
  );

  final Query$getRestaurantSchedule$restaurant_by_pk _instance;

  final TRes Function(Query$getRestaurantSchedule$restaurant_by_pk) _then;

  static const _undefined = {};

  TRes call({
    Object? schedule = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getRestaurantSchedule$restaurant_by_pk(
        schedule: schedule == _undefined
            ? _instance.schedule
            : (schedule as dynamic?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getRestaurantSchedule$restaurant_by_pk<TRes>
    implements CopyWith$Query$getRestaurantSchedule$restaurant_by_pk<TRes> {
  _CopyWithStubImpl$Query$getRestaurantSchedule$restaurant_by_pk(this._res);

  TRes _res;

  call({
    dynamic? schedule,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$getRestaurantAprroved {
  factory Variables$Query$getRestaurantAprroved({required int id}) =>
      Variables$Query$getRestaurantAprroved._({
        r'id': id,
      });

  Variables$Query$getRestaurantAprroved._(this._$data);

  factory Variables$Query$getRestaurantAprroved.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as int);
    return Variables$Query$getRestaurantAprroved._(result$data);
  }

  Map<String, dynamic> _$data;

  int get id => (_$data['id'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$getRestaurantAprroved<
          Variables$Query$getRestaurantAprroved>
      get copyWith => CopyWith$Variables$Query$getRestaurantAprroved(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getRestaurantAprroved) ||
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

abstract class CopyWith$Variables$Query$getRestaurantAprroved<TRes> {
  factory CopyWith$Variables$Query$getRestaurantAprroved(
    Variables$Query$getRestaurantAprroved instance,
    TRes Function(Variables$Query$getRestaurantAprroved) then,
  ) = _CopyWithImpl$Variables$Query$getRestaurantAprroved;

  factory CopyWith$Variables$Query$getRestaurantAprroved.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getRestaurantAprroved;

  TRes call({int? id});
}

class _CopyWithImpl$Variables$Query$getRestaurantAprroved<TRes>
    implements CopyWith$Variables$Query$getRestaurantAprroved<TRes> {
  _CopyWithImpl$Variables$Query$getRestaurantAprroved(
    this._instance,
    this._then,
  );

  final Variables$Query$getRestaurantAprroved _instance;

  final TRes Function(Variables$Query$getRestaurantAprroved) _then;

  static const _undefined = {};

  TRes call({Object? id = _undefined}) =>
      _then(Variables$Query$getRestaurantAprroved._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$getRestaurantAprroved<TRes>
    implements CopyWith$Variables$Query$getRestaurantAprroved<TRes> {
  _CopyWithStubImpl$Variables$Query$getRestaurantAprroved(this._res);

  TRes _res;

  call({int? id}) => _res;
}

class Query$getRestaurantAprroved {
  Query$getRestaurantAprroved({
    this.restaurant_by_pk,
    required this.$__typename,
  });

  factory Query$getRestaurantAprroved.fromJson(Map<String, dynamic> json) {
    final l$restaurant_by_pk = json['restaurant_by_pk'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurantAprroved(
      restaurant_by_pk: l$restaurant_by_pk == null
          ? null
          : Query$getRestaurantAprroved$restaurant_by_pk.fromJson(
              (l$restaurant_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getRestaurantAprroved$restaurant_by_pk? restaurant_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$restaurant_by_pk = restaurant_by_pk;
    _resultData['restaurant_by_pk'] = l$restaurant_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$restaurant_by_pk = restaurant_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$restaurant_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getRestaurantAprroved) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$restaurant_by_pk = restaurant_by_pk;
    final lOther$restaurant_by_pk = other.restaurant_by_pk;
    if (l$restaurant_by_pk != lOther$restaurant_by_pk) {
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

extension UtilityExtension$Query$getRestaurantAprroved
    on Query$getRestaurantAprroved {
  CopyWith$Query$getRestaurantAprroved<Query$getRestaurantAprroved>
      get copyWith => CopyWith$Query$getRestaurantAprroved(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurantAprroved<TRes> {
  factory CopyWith$Query$getRestaurantAprroved(
    Query$getRestaurantAprroved instance,
    TRes Function(Query$getRestaurantAprroved) then,
  ) = _CopyWithImpl$Query$getRestaurantAprroved;

  factory CopyWith$Query$getRestaurantAprroved.stub(TRes res) =
      _CopyWithStubImpl$Query$getRestaurantAprroved;

  TRes call({
    Query$getRestaurantAprroved$restaurant_by_pk? restaurant_by_pk,
    String? $__typename,
  });
  CopyWith$Query$getRestaurantAprroved$restaurant_by_pk<TRes>
      get restaurant_by_pk;
}

class _CopyWithImpl$Query$getRestaurantAprroved<TRes>
    implements CopyWith$Query$getRestaurantAprroved<TRes> {
  _CopyWithImpl$Query$getRestaurantAprroved(
    this._instance,
    this._then,
  );

  final Query$getRestaurantAprroved _instance;

  final TRes Function(Query$getRestaurantAprroved) _then;

  static const _undefined = {};

  TRes call({
    Object? restaurant_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getRestaurantAprroved(
        restaurant_by_pk: restaurant_by_pk == _undefined
            ? _instance.restaurant_by_pk
            : (restaurant_by_pk
                as Query$getRestaurantAprroved$restaurant_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getRestaurantAprroved$restaurant_by_pk<TRes>
      get restaurant_by_pk {
    final local$restaurant_by_pk = _instance.restaurant_by_pk;
    return local$restaurant_by_pk == null
        ? CopyWith$Query$getRestaurantAprroved$restaurant_by_pk.stub(
            _then(_instance))
        : CopyWith$Query$getRestaurantAprroved$restaurant_by_pk(
            local$restaurant_by_pk, (e) => call(restaurant_by_pk: e));
  }
}

class _CopyWithStubImpl$Query$getRestaurantAprroved<TRes>
    implements CopyWith$Query$getRestaurantAprroved<TRes> {
  _CopyWithStubImpl$Query$getRestaurantAprroved(this._res);

  TRes _res;

  call({
    Query$getRestaurantAprroved$restaurant_by_pk? restaurant_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getRestaurantAprroved$restaurant_by_pk<TRes>
      get restaurant_by_pk =>
          CopyWith$Query$getRestaurantAprroved$restaurant_by_pk.stub(_res);
}

const documentNodeQuerygetRestaurantAprroved = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getRestaurantAprroved'),
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
        name: NameNode(value: 'restaurant_by_pk'),
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
            name: NameNode(value: 'approved'),
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
Query$getRestaurantAprroved _parserFn$Query$getRestaurantAprroved(
        Map<String, dynamic> data) =>
    Query$getRestaurantAprroved.fromJson(data);

class Options$Query$getRestaurantAprroved
    extends graphql.QueryOptions<Query$getRestaurantAprroved> {
  Options$Query$getRestaurantAprroved({
    String? operationName,
    required Variables$Query$getRestaurantAprroved variables,
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
          document: documentNodeQuerygetRestaurantAprroved,
          parserFn: _parserFn$Query$getRestaurantAprroved,
        );
}

class WatchOptions$Query$getRestaurantAprroved
    extends graphql.WatchQueryOptions<Query$getRestaurantAprroved> {
  WatchOptions$Query$getRestaurantAprroved({
    String? operationName,
    required Variables$Query$getRestaurantAprroved variables,
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
          document: documentNodeQuerygetRestaurantAprroved,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getRestaurantAprroved,
        );
}

class FetchMoreOptions$Query$getRestaurantAprroved
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getRestaurantAprroved({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getRestaurantAprroved variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetRestaurantAprroved,
        );
}

extension ClientExtension$Query$getRestaurantAprroved on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getRestaurantAprroved>>
      query$getRestaurantAprroved(
              Options$Query$getRestaurantAprroved options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$getRestaurantAprroved>
      watchQuery$getRestaurantAprroved(
              WatchOptions$Query$getRestaurantAprroved options) =>
          this.watchQuery(options);
  void writeQuery$getRestaurantAprroved({
    required Query$getRestaurantAprroved data,
    required Variables$Query$getRestaurantAprroved variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQuerygetRestaurantAprroved),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getRestaurantAprroved? readQuery$getRestaurantAprroved({
    required Variables$Query$getRestaurantAprroved variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQuerygetRestaurantAprroved),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$getRestaurantAprroved.fromJson(result);
  }
}

class Query$getRestaurantAprroved$restaurant_by_pk {
  Query$getRestaurantAprroved$restaurant_by_pk({
    required this.approved,
    required this.$__typename,
  });

  factory Query$getRestaurantAprroved$restaurant_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$approved = json['approved'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurantAprroved$restaurant_by_pk(
      approved: (l$approved as bool),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final bool approved;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$approved = approved;
    _resultData['approved'] = l$approved;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$approved = approved;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$approved,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getRestaurantAprroved$restaurant_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$approved = approved;
    final lOther$approved = other.approved;
    if (l$approved != lOther$approved) {
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

extension UtilityExtension$Query$getRestaurantAprroved$restaurant_by_pk
    on Query$getRestaurantAprroved$restaurant_by_pk {
  CopyWith$Query$getRestaurantAprroved$restaurant_by_pk<
          Query$getRestaurantAprroved$restaurant_by_pk>
      get copyWith => CopyWith$Query$getRestaurantAprroved$restaurant_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurantAprroved$restaurant_by_pk<TRes> {
  factory CopyWith$Query$getRestaurantAprroved$restaurant_by_pk(
    Query$getRestaurantAprroved$restaurant_by_pk instance,
    TRes Function(Query$getRestaurantAprroved$restaurant_by_pk) then,
  ) = _CopyWithImpl$Query$getRestaurantAprroved$restaurant_by_pk;

  factory CopyWith$Query$getRestaurantAprroved$restaurant_by_pk.stub(TRes res) =
      _CopyWithStubImpl$Query$getRestaurantAprroved$restaurant_by_pk;

  TRes call({
    bool? approved,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getRestaurantAprroved$restaurant_by_pk<TRes>
    implements CopyWith$Query$getRestaurantAprroved$restaurant_by_pk<TRes> {
  _CopyWithImpl$Query$getRestaurantAprroved$restaurant_by_pk(
    this._instance,
    this._then,
  );

  final Query$getRestaurantAprroved$restaurant_by_pk _instance;

  final TRes Function(Query$getRestaurantAprroved$restaurant_by_pk) _then;

  static const _undefined = {};

  TRes call({
    Object? approved = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getRestaurantAprroved$restaurant_by_pk(
        approved: approved == _undefined || approved == null
            ? _instance.approved
            : (approved as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getRestaurantAprroved$restaurant_by_pk<TRes>
    implements CopyWith$Query$getRestaurantAprroved$restaurant_by_pk<TRes> {
  _CopyWithStubImpl$Query$getRestaurantAprroved$restaurant_by_pk(this._res);

  TRes _res;

  call({
    bool? approved,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$getRestaurantPaymentInfo {
  factory Variables$Query$getRestaurantPaymentInfo({required int id}) =>
      Variables$Query$getRestaurantPaymentInfo._({
        r'id': id,
      });

  Variables$Query$getRestaurantPaymentInfo._(this._$data);

  factory Variables$Query$getRestaurantPaymentInfo.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as int);
    return Variables$Query$getRestaurantPaymentInfo._(result$data);
  }

  Map<String, dynamic> _$data;

  int get id => (_$data['id'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$getRestaurantPaymentInfo<
          Variables$Query$getRestaurantPaymentInfo>
      get copyWith => CopyWith$Variables$Query$getRestaurantPaymentInfo(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getRestaurantPaymentInfo) ||
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

abstract class CopyWith$Variables$Query$getRestaurantPaymentInfo<TRes> {
  factory CopyWith$Variables$Query$getRestaurantPaymentInfo(
    Variables$Query$getRestaurantPaymentInfo instance,
    TRes Function(Variables$Query$getRestaurantPaymentInfo) then,
  ) = _CopyWithImpl$Variables$Query$getRestaurantPaymentInfo;

  factory CopyWith$Variables$Query$getRestaurantPaymentInfo.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getRestaurantPaymentInfo;

  TRes call({int? id});
}

class _CopyWithImpl$Variables$Query$getRestaurantPaymentInfo<TRes>
    implements CopyWith$Variables$Query$getRestaurantPaymentInfo<TRes> {
  _CopyWithImpl$Variables$Query$getRestaurantPaymentInfo(
    this._instance,
    this._then,
  );

  final Variables$Query$getRestaurantPaymentInfo _instance;

  final TRes Function(Variables$Query$getRestaurantPaymentInfo) _then;

  static const _undefined = {};

  TRes call({Object? id = _undefined}) =>
      _then(Variables$Query$getRestaurantPaymentInfo._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$getRestaurantPaymentInfo<TRes>
    implements CopyWith$Variables$Query$getRestaurantPaymentInfo<TRes> {
  _CopyWithStubImpl$Variables$Query$getRestaurantPaymentInfo(this._res);

  TRes _res;

  call({int? id}) => _res;
}

class Query$getRestaurantPaymentInfo {
  Query$getRestaurantPaymentInfo({
    this.restaurant_by_pk,
    required this.$__typename,
  });

  factory Query$getRestaurantPaymentInfo.fromJson(Map<String, dynamic> json) {
    final l$restaurant_by_pk = json['restaurant_by_pk'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurantPaymentInfo(
      restaurant_by_pk: l$restaurant_by_pk == null
          ? null
          : Query$getRestaurantPaymentInfo$restaurant_by_pk.fromJson(
              (l$restaurant_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getRestaurantPaymentInfo$restaurant_by_pk? restaurant_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$restaurant_by_pk = restaurant_by_pk;
    _resultData['restaurant_by_pk'] = l$restaurant_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$restaurant_by_pk = restaurant_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$restaurant_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getRestaurantPaymentInfo) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$restaurant_by_pk = restaurant_by_pk;
    final lOther$restaurant_by_pk = other.restaurant_by_pk;
    if (l$restaurant_by_pk != lOther$restaurant_by_pk) {
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

extension UtilityExtension$Query$getRestaurantPaymentInfo
    on Query$getRestaurantPaymentInfo {
  CopyWith$Query$getRestaurantPaymentInfo<Query$getRestaurantPaymentInfo>
      get copyWith => CopyWith$Query$getRestaurantPaymentInfo(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurantPaymentInfo<TRes> {
  factory CopyWith$Query$getRestaurantPaymentInfo(
    Query$getRestaurantPaymentInfo instance,
    TRes Function(Query$getRestaurantPaymentInfo) then,
  ) = _CopyWithImpl$Query$getRestaurantPaymentInfo;

  factory CopyWith$Query$getRestaurantPaymentInfo.stub(TRes res) =
      _CopyWithStubImpl$Query$getRestaurantPaymentInfo;

  TRes call({
    Query$getRestaurantPaymentInfo$restaurant_by_pk? restaurant_by_pk,
    String? $__typename,
  });
  CopyWith$Query$getRestaurantPaymentInfo$restaurant_by_pk<TRes>
      get restaurant_by_pk;
}

class _CopyWithImpl$Query$getRestaurantPaymentInfo<TRes>
    implements CopyWith$Query$getRestaurantPaymentInfo<TRes> {
  _CopyWithImpl$Query$getRestaurantPaymentInfo(
    this._instance,
    this._then,
  );

  final Query$getRestaurantPaymentInfo _instance;

  final TRes Function(Query$getRestaurantPaymentInfo) _then;

  static const _undefined = {};

  TRes call({
    Object? restaurant_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getRestaurantPaymentInfo(
        restaurant_by_pk: restaurant_by_pk == _undefined
            ? _instance.restaurant_by_pk
            : (restaurant_by_pk
                as Query$getRestaurantPaymentInfo$restaurant_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getRestaurantPaymentInfo$restaurant_by_pk<TRes>
      get restaurant_by_pk {
    final local$restaurant_by_pk = _instance.restaurant_by_pk;
    return local$restaurant_by_pk == null
        ? CopyWith$Query$getRestaurantPaymentInfo$restaurant_by_pk.stub(
            _then(_instance))
        : CopyWith$Query$getRestaurantPaymentInfo$restaurant_by_pk(
            local$restaurant_by_pk, (e) => call(restaurant_by_pk: e));
  }
}

class _CopyWithStubImpl$Query$getRestaurantPaymentInfo<TRes>
    implements CopyWith$Query$getRestaurantPaymentInfo<TRes> {
  _CopyWithStubImpl$Query$getRestaurantPaymentInfo(this._res);

  TRes _res;

  call({
    Query$getRestaurantPaymentInfo$restaurant_by_pk? restaurant_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getRestaurantPaymentInfo$restaurant_by_pk<TRes>
      get restaurant_by_pk =>
          CopyWith$Query$getRestaurantPaymentInfo$restaurant_by_pk.stub(_res);
}

const documentNodeQuerygetRestaurantPaymentInfo = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getRestaurantPaymentInfo'),
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
        name: NameNode(value: 'restaurant_by_pk'),
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
            name: NameNode(value: 'stripe_info'),
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
Query$getRestaurantPaymentInfo _parserFn$Query$getRestaurantPaymentInfo(
        Map<String, dynamic> data) =>
    Query$getRestaurantPaymentInfo.fromJson(data);

class Options$Query$getRestaurantPaymentInfo
    extends graphql.QueryOptions<Query$getRestaurantPaymentInfo> {
  Options$Query$getRestaurantPaymentInfo({
    String? operationName,
    required Variables$Query$getRestaurantPaymentInfo variables,
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
          document: documentNodeQuerygetRestaurantPaymentInfo,
          parserFn: _parserFn$Query$getRestaurantPaymentInfo,
        );
}

class WatchOptions$Query$getRestaurantPaymentInfo
    extends graphql.WatchQueryOptions<Query$getRestaurantPaymentInfo> {
  WatchOptions$Query$getRestaurantPaymentInfo({
    String? operationName,
    required Variables$Query$getRestaurantPaymentInfo variables,
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
          document: documentNodeQuerygetRestaurantPaymentInfo,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getRestaurantPaymentInfo,
        );
}

class FetchMoreOptions$Query$getRestaurantPaymentInfo
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getRestaurantPaymentInfo({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getRestaurantPaymentInfo variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetRestaurantPaymentInfo,
        );
}

extension ClientExtension$Query$getRestaurantPaymentInfo
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getRestaurantPaymentInfo>>
      query$getRestaurantPaymentInfo(
              Options$Query$getRestaurantPaymentInfo options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$getRestaurantPaymentInfo>
      watchQuery$getRestaurantPaymentInfo(
              WatchOptions$Query$getRestaurantPaymentInfo options) =>
          this.watchQuery(options);
  void writeQuery$getRestaurantPaymentInfo({
    required Query$getRestaurantPaymentInfo data,
    required Variables$Query$getRestaurantPaymentInfo variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQuerygetRestaurantPaymentInfo),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getRestaurantPaymentInfo? readQuery$getRestaurantPaymentInfo({
    required Variables$Query$getRestaurantPaymentInfo variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQuerygetRestaurantPaymentInfo),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$getRestaurantPaymentInfo.fromJson(result);
  }
}

class Query$getRestaurantPaymentInfo$restaurant_by_pk {
  Query$getRestaurantPaymentInfo$restaurant_by_pk({
    this.stripe_info,
    this.accepted_payments,
    required this.$__typename,
  });

  factory Query$getRestaurantPaymentInfo$restaurant_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$stripe_info = json['stripe_info'];
    final l$accepted_payments = json['accepted_payments'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurantPaymentInfo$restaurant_by_pk(
      stripe_info: l$stripe_info == null ? null : mapFromJson(l$stripe_info),
      accepted_payments:
          l$accepted_payments == null ? null : mapFromJson(l$accepted_payments),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final dynamic? stripe_info;

  final dynamic? accepted_payments;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$stripe_info = stripe_info;
    _resultData['stripe_info'] =
        l$stripe_info == null ? null : mapToJson(l$stripe_info);
    final l$accepted_payments = accepted_payments;
    _resultData['accepted_payments'] =
        l$accepted_payments == null ? null : mapToJson(l$accepted_payments);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$stripe_info = stripe_info;
    final l$accepted_payments = accepted_payments;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$stripe_info,
      l$accepted_payments,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getRestaurantPaymentInfo$restaurant_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$stripe_info = stripe_info;
    final lOther$stripe_info = other.stripe_info;
    if (l$stripe_info != lOther$stripe_info) {
      return false;
    }
    final l$accepted_payments = accepted_payments;
    final lOther$accepted_payments = other.accepted_payments;
    if (l$accepted_payments != lOther$accepted_payments) {
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

extension UtilityExtension$Query$getRestaurantPaymentInfo$restaurant_by_pk
    on Query$getRestaurantPaymentInfo$restaurant_by_pk {
  CopyWith$Query$getRestaurantPaymentInfo$restaurant_by_pk<
          Query$getRestaurantPaymentInfo$restaurant_by_pk>
      get copyWith => CopyWith$Query$getRestaurantPaymentInfo$restaurant_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurantPaymentInfo$restaurant_by_pk<TRes> {
  factory CopyWith$Query$getRestaurantPaymentInfo$restaurant_by_pk(
    Query$getRestaurantPaymentInfo$restaurant_by_pk instance,
    TRes Function(Query$getRestaurantPaymentInfo$restaurant_by_pk) then,
  ) = _CopyWithImpl$Query$getRestaurantPaymentInfo$restaurant_by_pk;

  factory CopyWith$Query$getRestaurantPaymentInfo$restaurant_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getRestaurantPaymentInfo$restaurant_by_pk;

  TRes call({
    dynamic? stripe_info,
    dynamic? accepted_payments,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getRestaurantPaymentInfo$restaurant_by_pk<TRes>
    implements CopyWith$Query$getRestaurantPaymentInfo$restaurant_by_pk<TRes> {
  _CopyWithImpl$Query$getRestaurantPaymentInfo$restaurant_by_pk(
    this._instance,
    this._then,
  );

  final Query$getRestaurantPaymentInfo$restaurant_by_pk _instance;

  final TRes Function(Query$getRestaurantPaymentInfo$restaurant_by_pk) _then;

  static const _undefined = {};

  TRes call({
    Object? stripe_info = _undefined,
    Object? accepted_payments = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getRestaurantPaymentInfo$restaurant_by_pk(
        stripe_info: stripe_info == _undefined
            ? _instance.stripe_info
            : (stripe_info as dynamic?),
        accepted_payments: accepted_payments == _undefined
            ? _instance.accepted_payments
            : (accepted_payments as dynamic?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getRestaurantPaymentInfo$restaurant_by_pk<TRes>
    implements CopyWith$Query$getRestaurantPaymentInfo$restaurant_by_pk<TRes> {
  _CopyWithStubImpl$Query$getRestaurantPaymentInfo$restaurant_by_pk(this._res);

  TRes _res;

  call({
    dynamic? stripe_info,
    dynamic? accepted_payments,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$updateRestaurantInfo {
  factory Variables$Mutation$updateRestaurantInfo({
    required int id,
    required Input$restaurant_set_input data,
  }) =>
      Variables$Mutation$updateRestaurantInfo._({
        r'id': id,
        r'data': data,
      });

  Variables$Mutation$updateRestaurantInfo._(this._$data);

  factory Variables$Mutation$updateRestaurantInfo.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as int);
    final l$data = data['data'];
    result$data['data'] =
        Input$restaurant_set_input.fromJson((l$data as Map<String, dynamic>));
    return Variables$Mutation$updateRestaurantInfo._(result$data);
  }

  Map<String, dynamic> _$data;

  int get id => (_$data['id'] as int);
  Input$restaurant_set_input get data =>
      (_$data['data'] as Input$restaurant_set_input);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    final l$data = data;
    result$data['data'] = l$data.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$updateRestaurantInfo<
          Variables$Mutation$updateRestaurantInfo>
      get copyWith => CopyWith$Variables$Mutation$updateRestaurantInfo(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$updateRestaurantInfo) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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
    final l$id = id;
    final l$data = data;
    return Object.hashAll([
      l$id,
      l$data,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$updateRestaurantInfo<TRes> {
  factory CopyWith$Variables$Mutation$updateRestaurantInfo(
    Variables$Mutation$updateRestaurantInfo instance,
    TRes Function(Variables$Mutation$updateRestaurantInfo) then,
  ) = _CopyWithImpl$Variables$Mutation$updateRestaurantInfo;

  factory CopyWith$Variables$Mutation$updateRestaurantInfo.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$updateRestaurantInfo;

  TRes call({
    int? id,
    Input$restaurant_set_input? data,
  });
}

class _CopyWithImpl$Variables$Mutation$updateRestaurantInfo<TRes>
    implements CopyWith$Variables$Mutation$updateRestaurantInfo<TRes> {
  _CopyWithImpl$Variables$Mutation$updateRestaurantInfo(
    this._instance,
    this._then,
  );

  final Variables$Mutation$updateRestaurantInfo _instance;

  final TRes Function(Variables$Mutation$updateRestaurantInfo) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? data = _undefined,
  }) =>
      _then(Variables$Mutation$updateRestaurantInfo._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as int),
        if (data != _undefined && data != null)
          'data': (data as Input$restaurant_set_input),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$updateRestaurantInfo<TRes>
    implements CopyWith$Variables$Mutation$updateRestaurantInfo<TRes> {
  _CopyWithStubImpl$Variables$Mutation$updateRestaurantInfo(this._res);

  TRes _res;

  call({
    int? id,
    Input$restaurant_set_input? data,
  }) =>
      _res;
}

class Mutation$updateRestaurantInfo {
  Mutation$updateRestaurantInfo({
    this.update_restaurant_by_pk,
    required this.$__typename,
  });

  factory Mutation$updateRestaurantInfo.fromJson(Map<String, dynamic> json) {
    final l$update_restaurant_by_pk = json['update_restaurant_by_pk'];
    final l$$__typename = json['__typename'];
    return Mutation$updateRestaurantInfo(
      update_restaurant_by_pk: l$update_restaurant_by_pk == null
          ? null
          : Mutation$updateRestaurantInfo$update_restaurant_by_pk.fromJson(
              (l$update_restaurant_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$updateRestaurantInfo$update_restaurant_by_pk?
      update_restaurant_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$update_restaurant_by_pk = update_restaurant_by_pk;
    _resultData['update_restaurant_by_pk'] =
        l$update_restaurant_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$update_restaurant_by_pk = update_restaurant_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$update_restaurant_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$updateRestaurantInfo) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$update_restaurant_by_pk = update_restaurant_by_pk;
    final lOther$update_restaurant_by_pk = other.update_restaurant_by_pk;
    if (l$update_restaurant_by_pk != lOther$update_restaurant_by_pk) {
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

extension UtilityExtension$Mutation$updateRestaurantInfo
    on Mutation$updateRestaurantInfo {
  CopyWith$Mutation$updateRestaurantInfo<Mutation$updateRestaurantInfo>
      get copyWith => CopyWith$Mutation$updateRestaurantInfo(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateRestaurantInfo<TRes> {
  factory CopyWith$Mutation$updateRestaurantInfo(
    Mutation$updateRestaurantInfo instance,
    TRes Function(Mutation$updateRestaurantInfo) then,
  ) = _CopyWithImpl$Mutation$updateRestaurantInfo;

  factory CopyWith$Mutation$updateRestaurantInfo.stub(TRes res) =
      _CopyWithStubImpl$Mutation$updateRestaurantInfo;

  TRes call({
    Mutation$updateRestaurantInfo$update_restaurant_by_pk?
        update_restaurant_by_pk,
    String? $__typename,
  });
  CopyWith$Mutation$updateRestaurantInfo$update_restaurant_by_pk<TRes>
      get update_restaurant_by_pk;
}

class _CopyWithImpl$Mutation$updateRestaurantInfo<TRes>
    implements CopyWith$Mutation$updateRestaurantInfo<TRes> {
  _CopyWithImpl$Mutation$updateRestaurantInfo(
    this._instance,
    this._then,
  );

  final Mutation$updateRestaurantInfo _instance;

  final TRes Function(Mutation$updateRestaurantInfo) _then;

  static const _undefined = {};

  TRes call({
    Object? update_restaurant_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$updateRestaurantInfo(
        update_restaurant_by_pk: update_restaurant_by_pk == _undefined
            ? _instance.update_restaurant_by_pk
            : (update_restaurant_by_pk
                as Mutation$updateRestaurantInfo$update_restaurant_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$updateRestaurantInfo$update_restaurant_by_pk<TRes>
      get update_restaurant_by_pk {
    final local$update_restaurant_by_pk = _instance.update_restaurant_by_pk;
    return local$update_restaurant_by_pk == null
        ? CopyWith$Mutation$updateRestaurantInfo$update_restaurant_by_pk.stub(
            _then(_instance))
        : CopyWith$Mutation$updateRestaurantInfo$update_restaurant_by_pk(
            local$update_restaurant_by_pk,
            (e) => call(update_restaurant_by_pk: e));
  }
}

class _CopyWithStubImpl$Mutation$updateRestaurantInfo<TRes>
    implements CopyWith$Mutation$updateRestaurantInfo<TRes> {
  _CopyWithStubImpl$Mutation$updateRestaurantInfo(this._res);

  TRes _res;

  call({
    Mutation$updateRestaurantInfo$update_restaurant_by_pk?
        update_restaurant_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$updateRestaurantInfo$update_restaurant_by_pk<TRes>
      get update_restaurant_by_pk =>
          CopyWith$Mutation$updateRestaurantInfo$update_restaurant_by_pk.stub(
              _res);
}

const documentNodeMutationupdateRestaurantInfo = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'updateRestaurantInfo'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
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
          name: NameNode(value: 'restaurant_set_input'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'update_restaurant_by_pk'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: '_set'),
            value: VariableNode(name: NameNode(value: 'data')),
          ),
          ArgumentNode(
            name: NameNode(value: 'pk_columns'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'id')),
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
            name: NameNode(value: 'language_id'),
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
            name: NameNode(value: 'name'),
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
            name: NameNode(value: 'approved'),
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
            name: NameNode(value: 'schedule'),
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
Mutation$updateRestaurantInfo _parserFn$Mutation$updateRestaurantInfo(
        Map<String, dynamic> data) =>
    Mutation$updateRestaurantInfo.fromJson(data);
typedef OnMutationCompleted$Mutation$updateRestaurantInfo = FutureOr<void>
    Function(
  dynamic,
  Mutation$updateRestaurantInfo?,
);

class Options$Mutation$updateRestaurantInfo
    extends graphql.MutationOptions<Mutation$updateRestaurantInfo> {
  Options$Mutation$updateRestaurantInfo({
    String? operationName,
    required Variables$Mutation$updateRestaurantInfo variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$updateRestaurantInfo? onCompleted,
    graphql.OnMutationUpdate<Mutation$updateRestaurantInfo>? update,
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
                        : _parserFn$Mutation$updateRestaurantInfo(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationupdateRestaurantInfo,
          parserFn: _parserFn$Mutation$updateRestaurantInfo,
        );

  final OnMutationCompleted$Mutation$updateRestaurantInfo?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$updateRestaurantInfo
    extends graphql.WatchQueryOptions<Mutation$updateRestaurantInfo> {
  WatchOptions$Mutation$updateRestaurantInfo({
    String? operationName,
    required Variables$Mutation$updateRestaurantInfo variables,
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
          document: documentNodeMutationupdateRestaurantInfo,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$updateRestaurantInfo,
        );
}

extension ClientExtension$Mutation$updateRestaurantInfo
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$updateRestaurantInfo>>
      mutate$updateRestaurantInfo(
              Options$Mutation$updateRestaurantInfo options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$updateRestaurantInfo>
      watchMutation$updateRestaurantInfo(
              WatchOptions$Mutation$updateRestaurantInfo options) =>
          this.watchMutation(options);
}

class Mutation$updateRestaurantInfo$update_restaurant_by_pk {
  Mutation$updateRestaurantInfo$update_restaurant_by_pk({
    required this.id,
    required this.$__typename,
    this.firebase_id,
    required this.image,
    required this.language_id,
    required this.location_gps,
    required this.location_text,
    required this.name,
    this.schedule,
    this.description,
    required this.approved,
    required this.open_status,
  });

  factory Mutation$updateRestaurantInfo$update_restaurant_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    final l$firebase_id = json['firebase_id'];
    final l$image = json['image'];
    final l$language_id = json['language_id'];
    final l$location_gps = json['location_gps'];
    final l$location_text = json['location_text'];
    final l$name = json['name'];
    final l$schedule = json['schedule'];
    final l$description = json['description'];
    final l$approved = json['approved'];
    final l$open_status = json['open_status'];
    return Mutation$updateRestaurantInfo$update_restaurant_by_pk(
      id: (l$id as int),
      $__typename: ((l$$__typename ?? "none") as String),
      firebase_id: (l$firebase_id as String?),
      image: (l$image as String),
      language_id: (l$language_id as String),
      location_gps: geographyFromJson(l$location_gps),
      location_text: (l$location_text as String),
      name: (l$name as String),
      schedule: l$schedule == null ? null : mapFromJson(l$schedule),
      description: l$description == null
          ? null
          : Mutation$updateRestaurantInfo$update_restaurant_by_pk$description
              .fromJson((l$description as Map<String, dynamic>)),
      approved: (l$approved as bool),
      open_status: (l$open_status as String),
    );
  }

  final int id;

  final String $__typename;

  final String? firebase_id;

  final String image;

  final String language_id;

  final Geography location_gps;

  final String location_text;

  final String name;

  final dynamic? schedule;

  final Mutation$updateRestaurantInfo$update_restaurant_by_pk$description?
      description;

  final bool approved;

  final String open_status;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$firebase_id = firebase_id;
    _resultData['firebase_id'] = l$firebase_id;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$language_id = language_id;
    _resultData['language_id'] = l$language_id;
    final l$location_gps = location_gps;
    _resultData['location_gps'] = geographyToJson(l$location_gps);
    final l$location_text = location_text;
    _resultData['location_text'] = l$location_text;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$schedule = schedule;
    _resultData['schedule'] = l$schedule == null ? null : mapToJson(l$schedule);
    final l$description = description;
    _resultData['description'] = l$description?.toJson();
    final l$approved = approved;
    _resultData['approved'] = l$approved;
    final l$open_status = open_status;
    _resultData['open_status'] = l$open_status;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$$__typename = $__typename;
    final l$firebase_id = firebase_id;
    final l$image = image;
    final l$language_id = language_id;
    final l$location_gps = location_gps;
    final l$location_text = location_text;
    final l$name = name;
    final l$schedule = schedule;
    final l$description = description;
    final l$approved = approved;
    final l$open_status = open_status;
    return Object.hashAll([
      l$id,
      l$$__typename,
      l$firebase_id,
      l$image,
      l$language_id,
      l$location_gps,
      l$location_text,
      l$name,
      l$schedule,
      l$description,
      l$approved,
      l$open_status,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$updateRestaurantInfo$update_restaurant_by_pk) ||
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
    final l$language_id = language_id;
    final lOther$language_id = other.language_id;
    if (l$language_id != lOther$language_id) {
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
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$schedule = schedule;
    final lOther$schedule = other.schedule;
    if (l$schedule != lOther$schedule) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
      return false;
    }
    final l$approved = approved;
    final lOther$approved = other.approved;
    if (l$approved != lOther$approved) {
      return false;
    }
    final l$open_status = open_status;
    final lOther$open_status = other.open_status;
    if (l$open_status != lOther$open_status) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$updateRestaurantInfo$update_restaurant_by_pk
    on Mutation$updateRestaurantInfo$update_restaurant_by_pk {
  CopyWith$Mutation$updateRestaurantInfo$update_restaurant_by_pk<
          Mutation$updateRestaurantInfo$update_restaurant_by_pk>
      get copyWith =>
          CopyWith$Mutation$updateRestaurantInfo$update_restaurant_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateRestaurantInfo$update_restaurant_by_pk<
    TRes> {
  factory CopyWith$Mutation$updateRestaurantInfo$update_restaurant_by_pk(
    Mutation$updateRestaurantInfo$update_restaurant_by_pk instance,
    TRes Function(Mutation$updateRestaurantInfo$update_restaurant_by_pk) then,
  ) = _CopyWithImpl$Mutation$updateRestaurantInfo$update_restaurant_by_pk;

  factory CopyWith$Mutation$updateRestaurantInfo$update_restaurant_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$updateRestaurantInfo$update_restaurant_by_pk;

  TRes call({
    int? id,
    String? $__typename,
    String? firebase_id,
    String? image,
    String? language_id,
    Geography? location_gps,
    String? location_text,
    String? name,
    dynamic? schedule,
    Mutation$updateRestaurantInfo$update_restaurant_by_pk$description?
        description,
    bool? approved,
    String? open_status,
  });
  CopyWith$Mutation$updateRestaurantInfo$update_restaurant_by_pk$description<
      TRes> get description;
}

class _CopyWithImpl$Mutation$updateRestaurantInfo$update_restaurant_by_pk<TRes>
    implements
        CopyWith$Mutation$updateRestaurantInfo$update_restaurant_by_pk<TRes> {
  _CopyWithImpl$Mutation$updateRestaurantInfo$update_restaurant_by_pk(
    this._instance,
    this._then,
  );

  final Mutation$updateRestaurantInfo$update_restaurant_by_pk _instance;

  final TRes Function(Mutation$updateRestaurantInfo$update_restaurant_by_pk)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
    Object? firebase_id = _undefined,
    Object? image = _undefined,
    Object? language_id = _undefined,
    Object? location_gps = _undefined,
    Object? location_text = _undefined,
    Object? name = _undefined,
    Object? schedule = _undefined,
    Object? description = _undefined,
    Object? approved = _undefined,
    Object? open_status = _undefined,
  }) =>
      _then(Mutation$updateRestaurantInfo$update_restaurant_by_pk(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
        firebase_id: firebase_id == _undefined
            ? _instance.firebase_id
            : (firebase_id as String?),
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        language_id: language_id == _undefined || language_id == null
            ? _instance.language_id
            : (language_id as String),
        location_gps: location_gps == _undefined || location_gps == null
            ? _instance.location_gps
            : (location_gps as Geography),
        location_text: location_text == _undefined || location_text == null
            ? _instance.location_text
            : (location_text as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        schedule: schedule == _undefined
            ? _instance.schedule
            : (schedule as dynamic?),
        description: description == _undefined
            ? _instance.description
            : (description
                as Mutation$updateRestaurantInfo$update_restaurant_by_pk$description?),
        approved: approved == _undefined || approved == null
            ? _instance.approved
            : (approved as bool),
        open_status: open_status == _undefined || open_status == null
            ? _instance.open_status
            : (open_status as String),
      ));
  CopyWith$Mutation$updateRestaurantInfo$update_restaurant_by_pk$description<
      TRes> get description {
    final local$description = _instance.description;
    return local$description == null
        ? CopyWith$Mutation$updateRestaurantInfo$update_restaurant_by_pk$description
            .stub(_then(_instance))
        : CopyWith$Mutation$updateRestaurantInfo$update_restaurant_by_pk$description(
            local$description, (e) => call(description: e));
  }
}

class _CopyWithStubImpl$Mutation$updateRestaurantInfo$update_restaurant_by_pk<
        TRes>
    implements
        CopyWith$Mutation$updateRestaurantInfo$update_restaurant_by_pk<TRes> {
  _CopyWithStubImpl$Mutation$updateRestaurantInfo$update_restaurant_by_pk(
      this._res);

  TRes _res;

  call({
    int? id,
    String? $__typename,
    String? firebase_id,
    String? image,
    String? language_id,
    Geography? location_gps,
    String? location_text,
    String? name,
    dynamic? schedule,
    Mutation$updateRestaurantInfo$update_restaurant_by_pk$description?
        description,
    bool? approved,
    String? open_status,
  }) =>
      _res;
  CopyWith$Mutation$updateRestaurantInfo$update_restaurant_by_pk$description<
          TRes>
      get description =>
          CopyWith$Mutation$updateRestaurantInfo$update_restaurant_by_pk$description
              .stub(_res);
}

class Variables$Mutation$switchRestaurantSelfDelivery {
  factory Variables$Mutation$switchRestaurantSelfDelivery({
    required int restauarntId,
    bool? value,
  }) =>
      Variables$Mutation$switchRestaurantSelfDelivery._({
        r'restauarntId': restauarntId,
        if (value != null) r'value': value,
      });

  Variables$Mutation$switchRestaurantSelfDelivery._(this._$data);

  factory Variables$Mutation$switchRestaurantSelfDelivery.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$restauarntId = data['restauarntId'];
    result$data['restauarntId'] = (l$restauarntId as int);
    if (data.containsKey('value')) {
      final l$value = data['value'];
      result$data['value'] = (l$value as bool?);
    }
    return Variables$Mutation$switchRestaurantSelfDelivery._(result$data);
  }

  Map<String, dynamic> _$data;

  int get restauarntId => (_$data['restauarntId'] as int);
  bool? get value => (_$data['value'] as bool?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$restauarntId = restauarntId;
    result$data['restauarntId'] = l$restauarntId;
    if (_$data.containsKey('value')) {
      final l$value = value;
      result$data['value'] = l$value;
    }
    return result$data;
  }

  CopyWith$Variables$Mutation$switchRestaurantSelfDelivery<
          Variables$Mutation$switchRestaurantSelfDelivery>
      get copyWith => CopyWith$Variables$Mutation$switchRestaurantSelfDelivery(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$switchRestaurantSelfDelivery) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$restauarntId = restauarntId;
    final lOther$restauarntId = other.restauarntId;
    if (l$restauarntId != lOther$restauarntId) {
      return false;
    }
    final l$value = value;
    final lOther$value = other.value;
    if (_$data.containsKey('value') != other._$data.containsKey('value')) {
      return false;
    }
    if (l$value != lOther$value) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$restauarntId = restauarntId;
    final l$value = value;
    return Object.hashAll([
      l$restauarntId,
      _$data.containsKey('value') ? l$value : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$switchRestaurantSelfDelivery<TRes> {
  factory CopyWith$Variables$Mutation$switchRestaurantSelfDelivery(
    Variables$Mutation$switchRestaurantSelfDelivery instance,
    TRes Function(Variables$Mutation$switchRestaurantSelfDelivery) then,
  ) = _CopyWithImpl$Variables$Mutation$switchRestaurantSelfDelivery;

  factory CopyWith$Variables$Mutation$switchRestaurantSelfDelivery.stub(
          TRes res) =
      _CopyWithStubImpl$Variables$Mutation$switchRestaurantSelfDelivery;

  TRes call({
    int? restauarntId,
    bool? value,
  });
}

class _CopyWithImpl$Variables$Mutation$switchRestaurantSelfDelivery<TRes>
    implements CopyWith$Variables$Mutation$switchRestaurantSelfDelivery<TRes> {
  _CopyWithImpl$Variables$Mutation$switchRestaurantSelfDelivery(
    this._instance,
    this._then,
  );

  final Variables$Mutation$switchRestaurantSelfDelivery _instance;

  final TRes Function(Variables$Mutation$switchRestaurantSelfDelivery) _then;

  static const _undefined = {};

  TRes call({
    Object? restauarntId = _undefined,
    Object? value = _undefined,
  }) =>
      _then(Variables$Mutation$switchRestaurantSelfDelivery._({
        ..._instance._$data,
        if (restauarntId != _undefined && restauarntId != null)
          'restauarntId': (restauarntId as int),
        if (value != _undefined) 'value': (value as bool?),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$switchRestaurantSelfDelivery<TRes>
    implements CopyWith$Variables$Mutation$switchRestaurantSelfDelivery<TRes> {
  _CopyWithStubImpl$Variables$Mutation$switchRestaurantSelfDelivery(this._res);

  TRes _res;

  call({
    int? restauarntId,
    bool? value,
  }) =>
      _res;
}

class Mutation$switchRestaurantSelfDelivery {
  Mutation$switchRestaurantSelfDelivery({
    this.update_restaurant_by_pk,
    required this.$__typename,
  });

  factory Mutation$switchRestaurantSelfDelivery.fromJson(
      Map<String, dynamic> json) {
    final l$update_restaurant_by_pk = json['update_restaurant_by_pk'];
    final l$$__typename = json['__typename'];
    return Mutation$switchRestaurantSelfDelivery(
      update_restaurant_by_pk: l$update_restaurant_by_pk == null
          ? null
          : Mutation$switchRestaurantSelfDelivery$update_restaurant_by_pk
              .fromJson((l$update_restaurant_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$switchRestaurantSelfDelivery$update_restaurant_by_pk?
      update_restaurant_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$update_restaurant_by_pk = update_restaurant_by_pk;
    _resultData['update_restaurant_by_pk'] =
        l$update_restaurant_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$update_restaurant_by_pk = update_restaurant_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$update_restaurant_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$switchRestaurantSelfDelivery) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$update_restaurant_by_pk = update_restaurant_by_pk;
    final lOther$update_restaurant_by_pk = other.update_restaurant_by_pk;
    if (l$update_restaurant_by_pk != lOther$update_restaurant_by_pk) {
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

extension UtilityExtension$Mutation$switchRestaurantSelfDelivery
    on Mutation$switchRestaurantSelfDelivery {
  CopyWith$Mutation$switchRestaurantSelfDelivery<
          Mutation$switchRestaurantSelfDelivery>
      get copyWith => CopyWith$Mutation$switchRestaurantSelfDelivery(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$switchRestaurantSelfDelivery<TRes> {
  factory CopyWith$Mutation$switchRestaurantSelfDelivery(
    Mutation$switchRestaurantSelfDelivery instance,
    TRes Function(Mutation$switchRestaurantSelfDelivery) then,
  ) = _CopyWithImpl$Mutation$switchRestaurantSelfDelivery;

  factory CopyWith$Mutation$switchRestaurantSelfDelivery.stub(TRes res) =
      _CopyWithStubImpl$Mutation$switchRestaurantSelfDelivery;

  TRes call({
    Mutation$switchRestaurantSelfDelivery$update_restaurant_by_pk?
        update_restaurant_by_pk,
    String? $__typename,
  });
  CopyWith$Mutation$switchRestaurantSelfDelivery$update_restaurant_by_pk<TRes>
      get update_restaurant_by_pk;
}

class _CopyWithImpl$Mutation$switchRestaurantSelfDelivery<TRes>
    implements CopyWith$Mutation$switchRestaurantSelfDelivery<TRes> {
  _CopyWithImpl$Mutation$switchRestaurantSelfDelivery(
    this._instance,
    this._then,
  );

  final Mutation$switchRestaurantSelfDelivery _instance;

  final TRes Function(Mutation$switchRestaurantSelfDelivery) _then;

  static const _undefined = {};

  TRes call({
    Object? update_restaurant_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$switchRestaurantSelfDelivery(
        update_restaurant_by_pk: update_restaurant_by_pk == _undefined
            ? _instance.update_restaurant_by_pk
            : (update_restaurant_by_pk
                as Mutation$switchRestaurantSelfDelivery$update_restaurant_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$switchRestaurantSelfDelivery$update_restaurant_by_pk<TRes>
      get update_restaurant_by_pk {
    final local$update_restaurant_by_pk = _instance.update_restaurant_by_pk;
    return local$update_restaurant_by_pk == null
        ? CopyWith$Mutation$switchRestaurantSelfDelivery$update_restaurant_by_pk
            .stub(_then(_instance))
        : CopyWith$Mutation$switchRestaurantSelfDelivery$update_restaurant_by_pk(
            local$update_restaurant_by_pk,
            (e) => call(update_restaurant_by_pk: e));
  }
}

class _CopyWithStubImpl$Mutation$switchRestaurantSelfDelivery<TRes>
    implements CopyWith$Mutation$switchRestaurantSelfDelivery<TRes> {
  _CopyWithStubImpl$Mutation$switchRestaurantSelfDelivery(this._res);

  TRes _res;

  call({
    Mutation$switchRestaurantSelfDelivery$update_restaurant_by_pk?
        update_restaurant_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$switchRestaurantSelfDelivery$update_restaurant_by_pk<TRes>
      get update_restaurant_by_pk =>
          CopyWith$Mutation$switchRestaurantSelfDelivery$update_restaurant_by_pk
              .stub(_res);
}

const documentNodeMutationswitchRestaurantSelfDelivery =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'switchRestaurantSelfDelivery'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'restauarntId')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'value')),
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
        name: NameNode(value: 'update_restaurant_by_pk'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'pk_columns'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'restauarntId')),
              )
            ]),
          ),
          ArgumentNode(
            name: NameNode(value: '_set'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'self_delivery'),
                value: VariableNode(name: NameNode(value: 'value')),
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
      
    ]),
  ),
]);
Mutation$switchRestaurantSelfDelivery
    _parserFn$Mutation$switchRestaurantSelfDelivery(
            Map<String, dynamic> data) =>
        Mutation$switchRestaurantSelfDelivery.fromJson(data);
typedef OnMutationCompleted$Mutation$switchRestaurantSelfDelivery
    = FutureOr<void> Function(
  dynamic,
  Mutation$switchRestaurantSelfDelivery?,
);

class Options$Mutation$switchRestaurantSelfDelivery
    extends graphql.MutationOptions<Mutation$switchRestaurantSelfDelivery> {
  Options$Mutation$switchRestaurantSelfDelivery({
    String? operationName,
    required Variables$Mutation$switchRestaurantSelfDelivery variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$switchRestaurantSelfDelivery? onCompleted,
    graphql.OnMutationUpdate<Mutation$switchRestaurantSelfDelivery>? update,
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
                        : _parserFn$Mutation$switchRestaurantSelfDelivery(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationswitchRestaurantSelfDelivery,
          parserFn: _parserFn$Mutation$switchRestaurantSelfDelivery,
        );

  final OnMutationCompleted$Mutation$switchRestaurantSelfDelivery?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$switchRestaurantSelfDelivery
    extends graphql.WatchQueryOptions<Mutation$switchRestaurantSelfDelivery> {
  WatchOptions$Mutation$switchRestaurantSelfDelivery({
    String? operationName,
    required Variables$Mutation$switchRestaurantSelfDelivery variables,
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
          document: documentNodeMutationswitchRestaurantSelfDelivery,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$switchRestaurantSelfDelivery,
        );
}

extension ClientExtension$Mutation$switchRestaurantSelfDelivery
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$switchRestaurantSelfDelivery>>
      mutate$switchRestaurantSelfDelivery(
              Options$Mutation$switchRestaurantSelfDelivery options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$switchRestaurantSelfDelivery>
      watchMutation$switchRestaurantSelfDelivery(
              WatchOptions$Mutation$switchRestaurantSelfDelivery options) =>
          this.watchMutation(options);
}

class Mutation$switchRestaurantSelfDelivery$update_restaurant_by_pk {
  Mutation$switchRestaurantSelfDelivery$update_restaurant_by_pk({
    required this.id,
    required this.self_delivery,
    required this.$__typename,
  });

  factory Mutation$switchRestaurantSelfDelivery$update_restaurant_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$self_delivery = json['self_delivery'];
    final l$$__typename = json['__typename'];
    return Mutation$switchRestaurantSelfDelivery$update_restaurant_by_pk(
      id: (l$id as int),
      self_delivery: (l$self_delivery as bool),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final bool self_delivery;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$self_delivery = self_delivery;
    _resultData['self_delivery'] = l$self_delivery;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$self_delivery = self_delivery;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
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
            is Mutation$switchRestaurantSelfDelivery$update_restaurant_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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

extension UtilityExtension$Mutation$switchRestaurantSelfDelivery$update_restaurant_by_pk
    on Mutation$switchRestaurantSelfDelivery$update_restaurant_by_pk {
  CopyWith$Mutation$switchRestaurantSelfDelivery$update_restaurant_by_pk<
          Mutation$switchRestaurantSelfDelivery$update_restaurant_by_pk>
      get copyWith =>
          CopyWith$Mutation$switchRestaurantSelfDelivery$update_restaurant_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$switchRestaurantSelfDelivery$update_restaurant_by_pk<
    TRes> {
  factory CopyWith$Mutation$switchRestaurantSelfDelivery$update_restaurant_by_pk(
    Mutation$switchRestaurantSelfDelivery$update_restaurant_by_pk instance,
    TRes Function(Mutation$switchRestaurantSelfDelivery$update_restaurant_by_pk)
        then,
  ) = _CopyWithImpl$Mutation$switchRestaurantSelfDelivery$update_restaurant_by_pk;

  factory CopyWith$Mutation$switchRestaurantSelfDelivery$update_restaurant_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$switchRestaurantSelfDelivery$update_restaurant_by_pk;

  TRes call({
    int? id,
    bool? self_delivery,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$switchRestaurantSelfDelivery$update_restaurant_by_pk<
        TRes>
    implements
        CopyWith$Mutation$switchRestaurantSelfDelivery$update_restaurant_by_pk<
            TRes> {
  _CopyWithImpl$Mutation$switchRestaurantSelfDelivery$update_restaurant_by_pk(
    this._instance,
    this._then,
  );

  final Mutation$switchRestaurantSelfDelivery$update_restaurant_by_pk _instance;

  final TRes Function(
      Mutation$switchRestaurantSelfDelivery$update_restaurant_by_pk) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? self_delivery = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$switchRestaurantSelfDelivery$update_restaurant_by_pk(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        self_delivery: self_delivery == _undefined || self_delivery == null
            ? _instance.self_delivery
            : (self_delivery as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$switchRestaurantSelfDelivery$update_restaurant_by_pk<
        TRes>
    implements
        CopyWith$Mutation$switchRestaurantSelfDelivery$update_restaurant_by_pk<
            TRes> {
  _CopyWithStubImpl$Mutation$switchRestaurantSelfDelivery$update_restaurant_by_pk(
      this._res);

  TRes _res;

  call({
    int? id,
    bool? self_delivery,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$switchRestaurantAvailability {
  factory Variables$Mutation$switchRestaurantAvailability({
    required int restauarntId,
    String? value,
  }) =>
      Variables$Mutation$switchRestaurantAvailability._({
        r'restauarntId': restauarntId,
        if (value != null) r'value': value,
      });

  Variables$Mutation$switchRestaurantAvailability._(this._$data);

  factory Variables$Mutation$switchRestaurantAvailability.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$restauarntId = data['restauarntId'];
    result$data['restauarntId'] = (l$restauarntId as int);
    if (data.containsKey('value')) {
      final l$value = data['value'];
      result$data['value'] = (l$value as String?);
    }
    return Variables$Mutation$switchRestaurantAvailability._(result$data);
  }

  Map<String, dynamic> _$data;

  int get restauarntId => (_$data['restauarntId'] as int);
  String? get value => (_$data['value'] as String?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$restauarntId = restauarntId;
    result$data['restauarntId'] = l$restauarntId;
    if (_$data.containsKey('value')) {
      final l$value = value;
      result$data['value'] = l$value;
    }
    return result$data;
  }

  CopyWith$Variables$Mutation$switchRestaurantAvailability<
          Variables$Mutation$switchRestaurantAvailability>
      get copyWith => CopyWith$Variables$Mutation$switchRestaurantAvailability(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$switchRestaurantAvailability) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$restauarntId = restauarntId;
    final lOther$restauarntId = other.restauarntId;
    if (l$restauarntId != lOther$restauarntId) {
      return false;
    }
    final l$value = value;
    final lOther$value = other.value;
    if (_$data.containsKey('value') != other._$data.containsKey('value')) {
      return false;
    }
    if (l$value != lOther$value) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$restauarntId = restauarntId;
    final l$value = value;
    return Object.hashAll([
      l$restauarntId,
      _$data.containsKey('value') ? l$value : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$switchRestaurantAvailability<TRes> {
  factory CopyWith$Variables$Mutation$switchRestaurantAvailability(
    Variables$Mutation$switchRestaurantAvailability instance,
    TRes Function(Variables$Mutation$switchRestaurantAvailability) then,
  ) = _CopyWithImpl$Variables$Mutation$switchRestaurantAvailability;

  factory CopyWith$Variables$Mutation$switchRestaurantAvailability.stub(
          TRes res) =
      _CopyWithStubImpl$Variables$Mutation$switchRestaurantAvailability;

  TRes call({
    int? restauarntId,
    String? value,
  });
}

class _CopyWithImpl$Variables$Mutation$switchRestaurantAvailability<TRes>
    implements CopyWith$Variables$Mutation$switchRestaurantAvailability<TRes> {
  _CopyWithImpl$Variables$Mutation$switchRestaurantAvailability(
    this._instance,
    this._then,
  );

  final Variables$Mutation$switchRestaurantAvailability _instance;

  final TRes Function(Variables$Mutation$switchRestaurantAvailability) _then;

  static const _undefined = {};

  TRes call({
    Object? restauarntId = _undefined,
    Object? value = _undefined,
  }) =>
      _then(Variables$Mutation$switchRestaurantAvailability._({
        ..._instance._$data,
        if (restauarntId != _undefined && restauarntId != null)
          'restauarntId': (restauarntId as int),
        if (value != _undefined) 'value': (value as String?),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$switchRestaurantAvailability<TRes>
    implements CopyWith$Variables$Mutation$switchRestaurantAvailability<TRes> {
  _CopyWithStubImpl$Variables$Mutation$switchRestaurantAvailability(this._res);

  TRes _res;

  call({
    int? restauarntId,
    String? value,
  }) =>
      _res;
}

class Mutation$switchRestaurantAvailability {
  Mutation$switchRestaurantAvailability({
    this.update_restaurant_by_pk,
    required this.$__typename,
  });

  factory Mutation$switchRestaurantAvailability.fromJson(
      Map<String, dynamic> json) {
    final l$update_restaurant_by_pk = json['update_restaurant_by_pk'];
    final l$$__typename = json['__typename'];
    return Mutation$switchRestaurantAvailability(
      update_restaurant_by_pk: l$update_restaurant_by_pk == null
          ? null
          : Mutation$switchRestaurantAvailability$update_restaurant_by_pk
              .fromJson((l$update_restaurant_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$switchRestaurantAvailability$update_restaurant_by_pk?
      update_restaurant_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$update_restaurant_by_pk = update_restaurant_by_pk;
    _resultData['update_restaurant_by_pk'] =
        l$update_restaurant_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$update_restaurant_by_pk = update_restaurant_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$update_restaurant_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$switchRestaurantAvailability) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$update_restaurant_by_pk = update_restaurant_by_pk;
    final lOther$update_restaurant_by_pk = other.update_restaurant_by_pk;
    if (l$update_restaurant_by_pk != lOther$update_restaurant_by_pk) {
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

extension UtilityExtension$Mutation$switchRestaurantAvailability
    on Mutation$switchRestaurantAvailability {
  CopyWith$Mutation$switchRestaurantAvailability<
          Mutation$switchRestaurantAvailability>
      get copyWith => CopyWith$Mutation$switchRestaurantAvailability(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$switchRestaurantAvailability<TRes> {
  factory CopyWith$Mutation$switchRestaurantAvailability(
    Mutation$switchRestaurantAvailability instance,
    TRes Function(Mutation$switchRestaurantAvailability) then,
  ) = _CopyWithImpl$Mutation$switchRestaurantAvailability;

  factory CopyWith$Mutation$switchRestaurantAvailability.stub(TRes res) =
      _CopyWithStubImpl$Mutation$switchRestaurantAvailability;

  TRes call({
    Mutation$switchRestaurantAvailability$update_restaurant_by_pk?
        update_restaurant_by_pk,
    String? $__typename,
  });
  CopyWith$Mutation$switchRestaurantAvailability$update_restaurant_by_pk<TRes>
      get update_restaurant_by_pk;
}

class _CopyWithImpl$Mutation$switchRestaurantAvailability<TRes>
    implements CopyWith$Mutation$switchRestaurantAvailability<TRes> {
  _CopyWithImpl$Mutation$switchRestaurantAvailability(
    this._instance,
    this._then,
  );

  final Mutation$switchRestaurantAvailability _instance;

  final TRes Function(Mutation$switchRestaurantAvailability) _then;

  static const _undefined = {};

  TRes call({
    Object? update_restaurant_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$switchRestaurantAvailability(
        update_restaurant_by_pk: update_restaurant_by_pk == _undefined
            ? _instance.update_restaurant_by_pk
            : (update_restaurant_by_pk
                as Mutation$switchRestaurantAvailability$update_restaurant_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$switchRestaurantAvailability$update_restaurant_by_pk<TRes>
      get update_restaurant_by_pk {
    final local$update_restaurant_by_pk = _instance.update_restaurant_by_pk;
    return local$update_restaurant_by_pk == null
        ? CopyWith$Mutation$switchRestaurantAvailability$update_restaurant_by_pk
            .stub(_then(_instance))
        : CopyWith$Mutation$switchRestaurantAvailability$update_restaurant_by_pk(
            local$update_restaurant_by_pk,
            (e) => call(update_restaurant_by_pk: e));
  }
}

class _CopyWithStubImpl$Mutation$switchRestaurantAvailability<TRes>
    implements CopyWith$Mutation$switchRestaurantAvailability<TRes> {
  _CopyWithStubImpl$Mutation$switchRestaurantAvailability(this._res);

  TRes _res;

  call({
    Mutation$switchRestaurantAvailability$update_restaurant_by_pk?
        update_restaurant_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$switchRestaurantAvailability$update_restaurant_by_pk<TRes>
      get update_restaurant_by_pk =>
          CopyWith$Mutation$switchRestaurantAvailability$update_restaurant_by_pk
              .stub(_res);
}

const documentNodeMutationswitchRestaurantAvailability =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'switchRestaurantAvailability'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'restauarntId')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'value')),
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
        name: NameNode(value: 'update_restaurant_by_pk'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'pk_columns'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'restauarntId')),
              )
            ]),
          ),
          ArgumentNode(
            name: NameNode(value: '_set'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'open_status'),
                value: VariableNode(name: NameNode(value: 'value')),
              )
            ]),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
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
      
    ]),
  ),
]);
Mutation$switchRestaurantAvailability
    _parserFn$Mutation$switchRestaurantAvailability(
            Map<String, dynamic> data) =>
        Mutation$switchRestaurantAvailability.fromJson(data);
typedef OnMutationCompleted$Mutation$switchRestaurantAvailability
    = FutureOr<void> Function(
  dynamic,
  Mutation$switchRestaurantAvailability?,
);

class Options$Mutation$switchRestaurantAvailability
    extends graphql.MutationOptions<Mutation$switchRestaurantAvailability> {
  Options$Mutation$switchRestaurantAvailability({
    String? operationName,
    required Variables$Mutation$switchRestaurantAvailability variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$switchRestaurantAvailability? onCompleted,
    graphql.OnMutationUpdate<Mutation$switchRestaurantAvailability>? update,
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
                        : _parserFn$Mutation$switchRestaurantAvailability(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationswitchRestaurantAvailability,
          parserFn: _parserFn$Mutation$switchRestaurantAvailability,
        );

  final OnMutationCompleted$Mutation$switchRestaurantAvailability?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$switchRestaurantAvailability
    extends graphql.WatchQueryOptions<Mutation$switchRestaurantAvailability> {
  WatchOptions$Mutation$switchRestaurantAvailability({
    String? operationName,
    required Variables$Mutation$switchRestaurantAvailability variables,
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
          document: documentNodeMutationswitchRestaurantAvailability,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$switchRestaurantAvailability,
        );
}

extension ClientExtension$Mutation$switchRestaurantAvailability
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$switchRestaurantAvailability>>
      mutate$switchRestaurantAvailability(
              Options$Mutation$switchRestaurantAvailability options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$switchRestaurantAvailability>
      watchMutation$switchRestaurantAvailability(
              WatchOptions$Mutation$switchRestaurantAvailability options) =>
          this.watchMutation(options);
}

class Mutation$switchRestaurantAvailability$update_restaurant_by_pk {
  Mutation$switchRestaurantAvailability$update_restaurant_by_pk({
    required this.open_status,
    required this.$__typename,
  });

  factory Mutation$switchRestaurantAvailability$update_restaurant_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$open_status = json['open_status'];
    final l$$__typename = json['__typename'];
    return Mutation$switchRestaurantAvailability$update_restaurant_by_pk(
      open_status: (l$open_status as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String open_status;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$open_status = open_status;
    _resultData['open_status'] = l$open_status;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$open_status = open_status;
    final l$$__typename = $__typename;
    return Object.hashAll([
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
            is Mutation$switchRestaurantAvailability$update_restaurant_by_pk) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Mutation$switchRestaurantAvailability$update_restaurant_by_pk
    on Mutation$switchRestaurantAvailability$update_restaurant_by_pk {
  CopyWith$Mutation$switchRestaurantAvailability$update_restaurant_by_pk<
          Mutation$switchRestaurantAvailability$update_restaurant_by_pk>
      get copyWith =>
          CopyWith$Mutation$switchRestaurantAvailability$update_restaurant_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$switchRestaurantAvailability$update_restaurant_by_pk<
    TRes> {
  factory CopyWith$Mutation$switchRestaurantAvailability$update_restaurant_by_pk(
    Mutation$switchRestaurantAvailability$update_restaurant_by_pk instance,
    TRes Function(Mutation$switchRestaurantAvailability$update_restaurant_by_pk)
        then,
  ) = _CopyWithImpl$Mutation$switchRestaurantAvailability$update_restaurant_by_pk;

  factory CopyWith$Mutation$switchRestaurantAvailability$update_restaurant_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$switchRestaurantAvailability$update_restaurant_by_pk;

  TRes call({
    String? open_status,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$switchRestaurantAvailability$update_restaurant_by_pk<
        TRes>
    implements
        CopyWith$Mutation$switchRestaurantAvailability$update_restaurant_by_pk<
            TRes> {
  _CopyWithImpl$Mutation$switchRestaurantAvailability$update_restaurant_by_pk(
    this._instance,
    this._then,
  );

  final Mutation$switchRestaurantAvailability$update_restaurant_by_pk _instance;

  final TRes Function(
      Mutation$switchRestaurantAvailability$update_restaurant_by_pk) _then;

  static const _undefined = {};

  TRes call({
    Object? open_status = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$switchRestaurantAvailability$update_restaurant_by_pk(
        open_status: open_status == _undefined || open_status == null
            ? _instance.open_status
            : (open_status as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$switchRestaurantAvailability$update_restaurant_by_pk<
        TRes>
    implements
        CopyWith$Mutation$switchRestaurantAvailability$update_restaurant_by_pk<
            TRes> {
  _CopyWithStubImpl$Mutation$switchRestaurantAvailability$update_restaurant_by_pk(
      this._res);

  TRes _res;

  call({
    String? open_status,
    String? $__typename,
  }) =>
      _res;
}

class Mutation$updateRestaurantInfo$update_restaurant_by_pk$description {
  Mutation$updateRestaurantInfo$update_restaurant_by_pk$description({
    required this.translations,
    required this.$__typename,
  });

  factory Mutation$updateRestaurantInfo$update_restaurant_by_pk$description.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Mutation$updateRestaurantInfo$update_restaurant_by_pk$description(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Mutation$updateRestaurantInfo$update_restaurant_by_pk$description$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Mutation$updateRestaurantInfo$update_restaurant_by_pk$description$translations>
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
            is Mutation$updateRestaurantInfo$update_restaurant_by_pk$description) ||
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

extension UtilityExtension$Mutation$updateRestaurantInfo$update_restaurant_by_pk$description
    on Mutation$updateRestaurantInfo$update_restaurant_by_pk$description {
  CopyWith$Mutation$updateRestaurantInfo$update_restaurant_by_pk$description<
          Mutation$updateRestaurantInfo$update_restaurant_by_pk$description>
      get copyWith =>
          CopyWith$Mutation$updateRestaurantInfo$update_restaurant_by_pk$description(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateRestaurantInfo$update_restaurant_by_pk$description<
    TRes> {
  factory CopyWith$Mutation$updateRestaurantInfo$update_restaurant_by_pk$description(
    Mutation$updateRestaurantInfo$update_restaurant_by_pk$description instance,
    TRes Function(
            Mutation$updateRestaurantInfo$update_restaurant_by_pk$description)
        then,
  ) = _CopyWithImpl$Mutation$updateRestaurantInfo$update_restaurant_by_pk$description;

  factory CopyWith$Mutation$updateRestaurantInfo$update_restaurant_by_pk$description.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$updateRestaurantInfo$update_restaurant_by_pk$description;

  TRes call({
    List<Mutation$updateRestaurantInfo$update_restaurant_by_pk$description$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Mutation$updateRestaurantInfo$update_restaurant_by_pk$description$translations> Function(
              Iterable<
                  CopyWith$Mutation$updateRestaurantInfo$update_restaurant_by_pk$description$translations<
                      Mutation$updateRestaurantInfo$update_restaurant_by_pk$description$translations>>)
          _fn);
}

class _CopyWithImpl$Mutation$updateRestaurantInfo$update_restaurant_by_pk$description<
        TRes>
    implements
        CopyWith$Mutation$updateRestaurantInfo$update_restaurant_by_pk$description<
            TRes> {
  _CopyWithImpl$Mutation$updateRestaurantInfo$update_restaurant_by_pk$description(
    this._instance,
    this._then,
  );

  final Mutation$updateRestaurantInfo$update_restaurant_by_pk$description
      _instance;

  final TRes Function(
      Mutation$updateRestaurantInfo$update_restaurant_by_pk$description) _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$updateRestaurantInfo$update_restaurant_by_pk$description(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Mutation$updateRestaurantInfo$update_restaurant_by_pk$description$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Mutation$updateRestaurantInfo$update_restaurant_by_pk$description$translations> Function(
                  Iterable<
                      CopyWith$Mutation$updateRestaurantInfo$update_restaurant_by_pk$description$translations<
                          Mutation$updateRestaurantInfo$update_restaurant_by_pk$description$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Mutation$updateRestaurantInfo$update_restaurant_by_pk$description$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Mutation$updateRestaurantInfo$update_restaurant_by_pk$description<
        TRes>
    implements
        CopyWith$Mutation$updateRestaurantInfo$update_restaurant_by_pk$description<
            TRes> {
  _CopyWithStubImpl$Mutation$updateRestaurantInfo$update_restaurant_by_pk$description(
      this._res);

  TRes _res;

  call({
    List<Mutation$updateRestaurantInfo$update_restaurant_by_pk$description$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Mutation$updateRestaurantInfo$update_restaurant_by_pk$description$translations {
  Mutation$updateRestaurantInfo$update_restaurant_by_pk$description$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Mutation$updateRestaurantInfo$update_restaurant_by_pk$description$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Mutation$updateRestaurantInfo$update_restaurant_by_pk$description$translations(
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
            is Mutation$updateRestaurantInfo$update_restaurant_by_pk$description$translations) ||
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

extension UtilityExtension$Mutation$updateRestaurantInfo$update_restaurant_by_pk$description$translations
    on Mutation$updateRestaurantInfo$update_restaurant_by_pk$description$translations {
  CopyWith$Mutation$updateRestaurantInfo$update_restaurant_by_pk$description$translations<
          Mutation$updateRestaurantInfo$update_restaurant_by_pk$description$translations>
      get copyWith =>
          CopyWith$Mutation$updateRestaurantInfo$update_restaurant_by_pk$description$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateRestaurantInfo$update_restaurant_by_pk$description$translations<
    TRes> {
  factory CopyWith$Mutation$updateRestaurantInfo$update_restaurant_by_pk$description$translations(
    Mutation$updateRestaurantInfo$update_restaurant_by_pk$description$translations
        instance,
    TRes Function(
            Mutation$updateRestaurantInfo$update_restaurant_by_pk$description$translations)
        then,
  ) = _CopyWithImpl$Mutation$updateRestaurantInfo$update_restaurant_by_pk$description$translations;

  factory CopyWith$Mutation$updateRestaurantInfo$update_restaurant_by_pk$description$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$updateRestaurantInfo$update_restaurant_by_pk$description$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$updateRestaurantInfo$update_restaurant_by_pk$description$translations<
        TRes>
    implements
        CopyWith$Mutation$updateRestaurantInfo$update_restaurant_by_pk$description$translations<
            TRes> {
  _CopyWithImpl$Mutation$updateRestaurantInfo$update_restaurant_by_pk$description$translations(
    this._instance,
    this._then,
  );

  final Mutation$updateRestaurantInfo$update_restaurant_by_pk$description$translations
      _instance;

  final TRes Function(
          Mutation$updateRestaurantInfo$update_restaurant_by_pk$description$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Mutation$updateRestaurantInfo$update_restaurant_by_pk$description$translations(
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

class _CopyWithStubImpl$Mutation$updateRestaurantInfo$update_restaurant_by_pk$description$translations<
        TRes>
    implements
        CopyWith$Mutation$updateRestaurantInfo$update_restaurant_by_pk$description$translations<
            TRes> {
  _CopyWithStubImpl$Mutation$updateRestaurantInfo$update_restaurant_by_pk$description$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$getRestaurantLang {
  factory Variables$Query$getRestaurantLang({required int id}) =>
      Variables$Query$getRestaurantLang._({
        r'id': id,
      });

  Variables$Query$getRestaurantLang._(this._$data);

  factory Variables$Query$getRestaurantLang.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as int);
    return Variables$Query$getRestaurantLang._(result$data);
  }

  Map<String, dynamic> _$data;

  int get id => (_$data['id'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$getRestaurantLang<Variables$Query$getRestaurantLang>
      get copyWith => CopyWith$Variables$Query$getRestaurantLang(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getRestaurantLang) ||
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

abstract class CopyWith$Variables$Query$getRestaurantLang<TRes> {
  factory CopyWith$Variables$Query$getRestaurantLang(
    Variables$Query$getRestaurantLang instance,
    TRes Function(Variables$Query$getRestaurantLang) then,
  ) = _CopyWithImpl$Variables$Query$getRestaurantLang;

  factory CopyWith$Variables$Query$getRestaurantLang.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getRestaurantLang;

  TRes call({int? id});
}

class _CopyWithImpl$Variables$Query$getRestaurantLang<TRes>
    implements CopyWith$Variables$Query$getRestaurantLang<TRes> {
  _CopyWithImpl$Variables$Query$getRestaurantLang(
    this._instance,
    this._then,
  );

  final Variables$Query$getRestaurantLang _instance;

  final TRes Function(Variables$Query$getRestaurantLang) _then;

  static const _undefined = {};

  TRes call({Object? id = _undefined}) =>
      _then(Variables$Query$getRestaurantLang._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$getRestaurantLang<TRes>
    implements CopyWith$Variables$Query$getRestaurantLang<TRes> {
  _CopyWithStubImpl$Variables$Query$getRestaurantLang(this._res);

  TRes _res;

  call({int? id}) => _res;
}

class Query$getRestaurantLang {
  Query$getRestaurantLang({
    this.restaurant_by_pk,
    required this.$__typename,
  });

  factory Query$getRestaurantLang.fromJson(Map<String, dynamic> json) {
    final l$restaurant_by_pk = json['restaurant_by_pk'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurantLang(
      restaurant_by_pk: l$restaurant_by_pk == null
          ? null
          : Query$getRestaurantLang$restaurant_by_pk.fromJson(
              (l$restaurant_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getRestaurantLang$restaurant_by_pk? restaurant_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$restaurant_by_pk = restaurant_by_pk;
    _resultData['restaurant_by_pk'] = l$restaurant_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$restaurant_by_pk = restaurant_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$restaurant_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getRestaurantLang) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$restaurant_by_pk = restaurant_by_pk;
    final lOther$restaurant_by_pk = other.restaurant_by_pk;
    if (l$restaurant_by_pk != lOther$restaurant_by_pk) {
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

extension UtilityExtension$Query$getRestaurantLang on Query$getRestaurantLang {
  CopyWith$Query$getRestaurantLang<Query$getRestaurantLang> get copyWith =>
      CopyWith$Query$getRestaurantLang(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$getRestaurantLang<TRes> {
  factory CopyWith$Query$getRestaurantLang(
    Query$getRestaurantLang instance,
    TRes Function(Query$getRestaurantLang) then,
  ) = _CopyWithImpl$Query$getRestaurantLang;

  factory CopyWith$Query$getRestaurantLang.stub(TRes res) =
      _CopyWithStubImpl$Query$getRestaurantLang;

  TRes call({
    Query$getRestaurantLang$restaurant_by_pk? restaurant_by_pk,
    String? $__typename,
  });
  CopyWith$Query$getRestaurantLang$restaurant_by_pk<TRes> get restaurant_by_pk;
}

class _CopyWithImpl$Query$getRestaurantLang<TRes>
    implements CopyWith$Query$getRestaurantLang<TRes> {
  _CopyWithImpl$Query$getRestaurantLang(
    this._instance,
    this._then,
  );

  final Query$getRestaurantLang _instance;

  final TRes Function(Query$getRestaurantLang) _then;

  static const _undefined = {};

  TRes call({
    Object? restaurant_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getRestaurantLang(
        restaurant_by_pk: restaurant_by_pk == _undefined
            ? _instance.restaurant_by_pk
            : (restaurant_by_pk as Query$getRestaurantLang$restaurant_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getRestaurantLang$restaurant_by_pk<TRes> get restaurant_by_pk {
    final local$restaurant_by_pk = _instance.restaurant_by_pk;
    return local$restaurant_by_pk == null
        ? CopyWith$Query$getRestaurantLang$restaurant_by_pk.stub(
            _then(_instance))
        : CopyWith$Query$getRestaurantLang$restaurant_by_pk(
            local$restaurant_by_pk, (e) => call(restaurant_by_pk: e));
  }
}

class _CopyWithStubImpl$Query$getRestaurantLang<TRes>
    implements CopyWith$Query$getRestaurantLang<TRes> {
  _CopyWithStubImpl$Query$getRestaurantLang(this._res);

  TRes _res;

  call({
    Query$getRestaurantLang$restaurant_by_pk? restaurant_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getRestaurantLang$restaurant_by_pk<TRes>
      get restaurant_by_pk =>
          CopyWith$Query$getRestaurantLang$restaurant_by_pk.stub(_res);
}

const documentNodeQuerygetRestaurantLang = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getRestaurantLang'),
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
        name: NameNode(value: 'restaurant_by_pk'),
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
      
    ]),
  ),
]);
Query$getRestaurantLang _parserFn$Query$getRestaurantLang(
        Map<String, dynamic> data) =>
    Query$getRestaurantLang.fromJson(data);

class Options$Query$getRestaurantLang
    extends graphql.QueryOptions<Query$getRestaurantLang> {
  Options$Query$getRestaurantLang({
    String? operationName,
    required Variables$Query$getRestaurantLang variables,
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
          document: documentNodeQuerygetRestaurantLang,
          parserFn: _parserFn$Query$getRestaurantLang,
        );
}

class WatchOptions$Query$getRestaurantLang
    extends graphql.WatchQueryOptions<Query$getRestaurantLang> {
  WatchOptions$Query$getRestaurantLang({
    String? operationName,
    required Variables$Query$getRestaurantLang variables,
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
          document: documentNodeQuerygetRestaurantLang,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getRestaurantLang,
        );
}

class FetchMoreOptions$Query$getRestaurantLang
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getRestaurantLang({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getRestaurantLang variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetRestaurantLang,
        );
}

extension ClientExtension$Query$getRestaurantLang on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getRestaurantLang>> query$getRestaurantLang(
          Options$Query$getRestaurantLang options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$getRestaurantLang> watchQuery$getRestaurantLang(
          WatchOptions$Query$getRestaurantLang options) =>
      this.watchQuery(options);
  void writeQuery$getRestaurantLang({
    required Query$getRestaurantLang data,
    required Variables$Query$getRestaurantLang variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQuerygetRestaurantLang),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getRestaurantLang? readQuery$getRestaurantLang({
    required Variables$Query$getRestaurantLang variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQuerygetRestaurantLang),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$getRestaurantLang.fromJson(result);
  }
}

class Query$getRestaurantLang$restaurant_by_pk {
  Query$getRestaurantLang$restaurant_by_pk({
    required this.language_id,
    required this.$__typename,
  });

  factory Query$getRestaurantLang$restaurant_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurantLang$restaurant_by_pk(
      language_id: (l$language_id as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String language_id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$language_id = language_id;
    _resultData['language_id'] = l$language_id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$language_id = language_id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$language_id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getRestaurantLang$restaurant_by_pk) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$getRestaurantLang$restaurant_by_pk
    on Query$getRestaurantLang$restaurant_by_pk {
  CopyWith$Query$getRestaurantLang$restaurant_by_pk<
          Query$getRestaurantLang$restaurant_by_pk>
      get copyWith => CopyWith$Query$getRestaurantLang$restaurant_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurantLang$restaurant_by_pk<TRes> {
  factory CopyWith$Query$getRestaurantLang$restaurant_by_pk(
    Query$getRestaurantLang$restaurant_by_pk instance,
    TRes Function(Query$getRestaurantLang$restaurant_by_pk) then,
  ) = _CopyWithImpl$Query$getRestaurantLang$restaurant_by_pk;

  factory CopyWith$Query$getRestaurantLang$restaurant_by_pk.stub(TRes res) =
      _CopyWithStubImpl$Query$getRestaurantLang$restaurant_by_pk;

  TRes call({
    String? language_id,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getRestaurantLang$restaurant_by_pk<TRes>
    implements CopyWith$Query$getRestaurantLang$restaurant_by_pk<TRes> {
  _CopyWithImpl$Query$getRestaurantLang$restaurant_by_pk(
    this._instance,
    this._then,
  );

  final Query$getRestaurantLang$restaurant_by_pk _instance;

  final TRes Function(Query$getRestaurantLang$restaurant_by_pk) _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getRestaurantLang$restaurant_by_pk(
        language_id: language_id == _undefined || language_id == null
            ? _instance.language_id
            : (language_id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getRestaurantLang$restaurant_by_pk<TRes>
    implements CopyWith$Query$getRestaurantLang$restaurant_by_pk<TRes> {
  _CopyWithStubImpl$Query$getRestaurantLang$restaurant_by_pk(this._res);

  TRes _res;

  call({
    String? language_id,
    String? $__typename,
  }) =>
      _res;
}

class Subscription$GetRestaurants {
  Subscription$GetRestaurants({
    required this.restaurant,
    required this.$__typename,
  });

  factory Subscription$GetRestaurants.fromJson(Map<String, dynamic> json) {
    final l$restaurant = json['restaurant'];
    final l$$__typename = json['__typename'];
    return Subscription$GetRestaurants(
      restaurant: (l$restaurant as List<dynamic>)
          .map((e) => Subscription$GetRestaurants$restaurant.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Subscription$GetRestaurants$restaurant> restaurant;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$restaurant = restaurant;
    _resultData['restaurant'] = l$restaurant.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$restaurant = restaurant;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$restaurant.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Subscription$GetRestaurants) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$restaurant = restaurant;
    final lOther$restaurant = other.restaurant;
    if (l$restaurant.length != lOther$restaurant.length) {
      return false;
    }
    for (int i = 0; i < l$restaurant.length; i++) {
      final l$restaurant$entry = l$restaurant[i];
      final lOther$restaurant$entry = lOther$restaurant[i];
      if (l$restaurant$entry != lOther$restaurant$entry) {
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

extension UtilityExtension$Subscription$GetRestaurants
    on Subscription$GetRestaurants {
  CopyWith$Subscription$GetRestaurants<Subscription$GetRestaurants>
      get copyWith => CopyWith$Subscription$GetRestaurants(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$GetRestaurants<TRes> {
  factory CopyWith$Subscription$GetRestaurants(
    Subscription$GetRestaurants instance,
    TRes Function(Subscription$GetRestaurants) then,
  ) = _CopyWithImpl$Subscription$GetRestaurants;

  factory CopyWith$Subscription$GetRestaurants.stub(TRes res) =
      _CopyWithStubImpl$Subscription$GetRestaurants;

  TRes call({
    List<Subscription$GetRestaurants$restaurant>? restaurant,
    String? $__typename,
  });
  TRes restaurant(
      Iterable<Subscription$GetRestaurants$restaurant> Function(
              Iterable<
                  CopyWith$Subscription$GetRestaurants$restaurant<
                      Subscription$GetRestaurants$restaurant>>)
          _fn);
}

class _CopyWithImpl$Subscription$GetRestaurants<TRes>
    implements CopyWith$Subscription$GetRestaurants<TRes> {
  _CopyWithImpl$Subscription$GetRestaurants(
    this._instance,
    this._then,
  );

  final Subscription$GetRestaurants _instance;

  final TRes Function(Subscription$GetRestaurants) _then;

  static const _undefined = {};

  TRes call({
    Object? restaurant = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$GetRestaurants(
        restaurant: restaurant == _undefined || restaurant == null
            ? _instance.restaurant
            : (restaurant as List<Subscription$GetRestaurants$restaurant>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes restaurant(
          Iterable<Subscription$GetRestaurants$restaurant> Function(
                  Iterable<
                      CopyWith$Subscription$GetRestaurants$restaurant<
                          Subscription$GetRestaurants$restaurant>>)
              _fn) =>
      call(
          restaurant: _fn(_instance.restaurant
              .map((e) => CopyWith$Subscription$GetRestaurants$restaurant(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Subscription$GetRestaurants<TRes>
    implements CopyWith$Subscription$GetRestaurants<TRes> {
  _CopyWithStubImpl$Subscription$GetRestaurants(this._res);

  TRes _res;

  call({
    List<Subscription$GetRestaurants$restaurant>? restaurant,
    String? $__typename,
  }) =>
      _res;
  restaurant(_fn) => _res;
}

const documentNodeSubscriptionGetRestaurants = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.subscription,
    name: NameNode(value: 'GetRestaurants'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
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
            name: NameNode(value: 'name'),
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
            name: NameNode(value: 'open_status'),
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
            name: NameNode(value: 'schedule'),
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
Subscription$GetRestaurants _parserFn$Subscription$GetRestaurants(
        Map<String, dynamic> data) =>
    Subscription$GetRestaurants.fromJson(data);

class Options$Subscription$GetRestaurants
    extends graphql.SubscriptionOptions<Subscription$GetRestaurants> {
  Options$Subscription$GetRestaurants({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
  }) : super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          context: context,
          document: documentNodeSubscriptionGetRestaurants,
          parserFn: _parserFn$Subscription$GetRestaurants,
        );
}

class WatchOptions$Subscription$GetRestaurants
    extends graphql.WatchQueryOptions<Subscription$GetRestaurants> {
  WatchOptions$Subscription$GetRestaurants({
    String? operationName,
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
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          context: context,
          document: documentNodeSubscriptionGetRestaurants,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Subscription$GetRestaurants,
        );
}

class FetchMoreOptions$Subscription$GetRestaurants
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Subscription$GetRestaurants(
      {required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeSubscriptionGetRestaurants,
        );
}

extension ClientExtension$Subscription$GetRestaurants on graphql.GraphQLClient {
  Stream<graphql.QueryResult<Subscription$GetRestaurants>>
      subscribe$GetRestaurants(
              [Options$Subscription$GetRestaurants? options]) =>
          this.subscribe(options ?? Options$Subscription$GetRestaurants());
  graphql.ObservableQuery<
      Subscription$GetRestaurants> watchSubscription$GetRestaurants(
          [WatchOptions$Subscription$GetRestaurants? options]) =>
      this.watchQuery(options ?? WatchOptions$Subscription$GetRestaurants());
}

class Subscription$GetRestaurants$restaurant {
  Subscription$GetRestaurants$restaurant({
    required this.id,
    required this.name,
    required this.location_text,
    required this.open_status,
    required this.approved,
    required this.image,
    this.schedule,
    this.description,
    required this.$__typename,
  });

  factory Subscription$GetRestaurants$restaurant.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$location_text = json['location_text'];
    final l$open_status = json['open_status'];
    final l$approved = json['approved'];
    final l$image = json['image'];
    final l$schedule = json['schedule'];
    final l$description = json['description'];
    final l$$__typename = json['__typename'];
    return Subscription$GetRestaurants$restaurant(
      id: (l$id as int),
      name: (l$name as String),
      location_text: (l$location_text as String),
      open_status: (l$open_status as String),
      approved: (l$approved as bool),
      image: (l$image as String),
      schedule: l$schedule == null ? null : mapFromJson(l$schedule),
      description: l$description == null
          ? null
          : Subscription$GetRestaurants$restaurant$description.fromJson(
              (l$description as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String name;

  final String location_text;

  final String open_status;

  final bool approved;

  final String image;

  final dynamic? schedule;

  final Subscription$GetRestaurants$restaurant$description? description;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$location_text = location_text;
    _resultData['location_text'] = l$location_text;
    final l$open_status = open_status;
    _resultData['open_status'] = l$open_status;
    final l$approved = approved;
    _resultData['approved'] = l$approved;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$schedule = schedule;
    _resultData['schedule'] = l$schedule == null ? null : mapToJson(l$schedule);
    final l$description = description;
    _resultData['description'] = l$description?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$location_text = location_text;
    final l$open_status = open_status;
    final l$approved = approved;
    final l$image = image;
    final l$schedule = schedule;
    final l$description = description;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$location_text,
      l$open_status,
      l$approved,
      l$image,
      l$schedule,
      l$description,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Subscription$GetRestaurants$restaurant) ||
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
    final l$location_text = location_text;
    final lOther$location_text = other.location_text;
    if (l$location_text != lOther$location_text) {
      return false;
    }
    final l$open_status = open_status;
    final lOther$open_status = other.open_status;
    if (l$open_status != lOther$open_status) {
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
    final l$schedule = schedule;
    final lOther$schedule = other.schedule;
    if (l$schedule != lOther$schedule) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
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

extension UtilityExtension$Subscription$GetRestaurants$restaurant
    on Subscription$GetRestaurants$restaurant {
  CopyWith$Subscription$GetRestaurants$restaurant<
          Subscription$GetRestaurants$restaurant>
      get copyWith => CopyWith$Subscription$GetRestaurants$restaurant(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$GetRestaurants$restaurant<TRes> {
  factory CopyWith$Subscription$GetRestaurants$restaurant(
    Subscription$GetRestaurants$restaurant instance,
    TRes Function(Subscription$GetRestaurants$restaurant) then,
  ) = _CopyWithImpl$Subscription$GetRestaurants$restaurant;

  factory CopyWith$Subscription$GetRestaurants$restaurant.stub(TRes res) =
      _CopyWithStubImpl$Subscription$GetRestaurants$restaurant;

  TRes call({
    int? id,
    String? name,
    String? location_text,
    String? open_status,
    bool? approved,
    String? image,
    dynamic? schedule,
    Subscription$GetRestaurants$restaurant$description? description,
    String? $__typename,
  });
  CopyWith$Subscription$GetRestaurants$restaurant$description<TRes>
      get description;
}

class _CopyWithImpl$Subscription$GetRestaurants$restaurant<TRes>
    implements CopyWith$Subscription$GetRestaurants$restaurant<TRes> {
  _CopyWithImpl$Subscription$GetRestaurants$restaurant(
    this._instance,
    this._then,
  );

  final Subscription$GetRestaurants$restaurant _instance;

  final TRes Function(Subscription$GetRestaurants$restaurant) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? location_text = _undefined,
    Object? open_status = _undefined,
    Object? approved = _undefined,
    Object? image = _undefined,
    Object? schedule = _undefined,
    Object? description = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$GetRestaurants$restaurant(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        location_text: location_text == _undefined || location_text == null
            ? _instance.location_text
            : (location_text as String),
        open_status: open_status == _undefined || open_status == null
            ? _instance.open_status
            : (open_status as String),
        approved: approved == _undefined || approved == null
            ? _instance.approved
            : (approved as bool),
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        schedule: schedule == _undefined
            ? _instance.schedule
            : (schedule as dynamic?),
        description: description == _undefined
            ? _instance.description
            : (description
                as Subscription$GetRestaurants$restaurant$description?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$GetRestaurants$restaurant$description<TRes>
      get description {
    final local$description = _instance.description;
    return local$description == null
        ? CopyWith$Subscription$GetRestaurants$restaurant$description.stub(
            _then(_instance))
        : CopyWith$Subscription$GetRestaurants$restaurant$description(
            local$description, (e) => call(description: e));
  }
}

class _CopyWithStubImpl$Subscription$GetRestaurants$restaurant<TRes>
    implements CopyWith$Subscription$GetRestaurants$restaurant<TRes> {
  _CopyWithStubImpl$Subscription$GetRestaurants$restaurant(this._res);

  TRes _res;

  call({
    int? id,
    String? name,
    String? location_text,
    String? open_status,
    bool? approved,
    String? image,
    dynamic? schedule,
    Subscription$GetRestaurants$restaurant$description? description,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$GetRestaurants$restaurant$description<TRes>
      get description =>
          CopyWith$Subscription$GetRestaurants$restaurant$description.stub(
              _res);
}

class Subscription$GetRestaurants$restaurant$description {
  Subscription$GetRestaurants$restaurant$description({
    required this.translations,
    required this.$__typename,
  });

  factory Subscription$GetRestaurants$restaurant$description.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Subscription$GetRestaurants$restaurant$description(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Subscription$GetRestaurants$restaurant$description$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Subscription$GetRestaurants$restaurant$description$translations>
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
    if (!(other is Subscription$GetRestaurants$restaurant$description) ||
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

extension UtilityExtension$Subscription$GetRestaurants$restaurant$description
    on Subscription$GetRestaurants$restaurant$description {
  CopyWith$Subscription$GetRestaurants$restaurant$description<
          Subscription$GetRestaurants$restaurant$description>
      get copyWith =>
          CopyWith$Subscription$GetRestaurants$restaurant$description(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$GetRestaurants$restaurant$description<
    TRes> {
  factory CopyWith$Subscription$GetRestaurants$restaurant$description(
    Subscription$GetRestaurants$restaurant$description instance,
    TRes Function(Subscription$GetRestaurants$restaurant$description) then,
  ) = _CopyWithImpl$Subscription$GetRestaurants$restaurant$description;

  factory CopyWith$Subscription$GetRestaurants$restaurant$description.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$GetRestaurants$restaurant$description;

  TRes call({
    List<Subscription$GetRestaurants$restaurant$description$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Subscription$GetRestaurants$restaurant$description$translations> Function(
              Iterable<
                  CopyWith$Subscription$GetRestaurants$restaurant$description$translations<
                      Subscription$GetRestaurants$restaurant$description$translations>>)
          _fn);
}

class _CopyWithImpl$Subscription$GetRestaurants$restaurant$description<TRes>
    implements
        CopyWith$Subscription$GetRestaurants$restaurant$description<TRes> {
  _CopyWithImpl$Subscription$GetRestaurants$restaurant$description(
    this._instance,
    this._then,
  );

  final Subscription$GetRestaurants$restaurant$description _instance;

  final TRes Function(Subscription$GetRestaurants$restaurant$description) _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$GetRestaurants$restaurant$description(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Subscription$GetRestaurants$restaurant$description$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Subscription$GetRestaurants$restaurant$description$translations> Function(
                  Iterable<
                      CopyWith$Subscription$GetRestaurants$restaurant$description$translations<
                          Subscription$GetRestaurants$restaurant$description$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Subscription$GetRestaurants$restaurant$description$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Subscription$GetRestaurants$restaurant$description<TRes>
    implements
        CopyWith$Subscription$GetRestaurants$restaurant$description<TRes> {
  _CopyWithStubImpl$Subscription$GetRestaurants$restaurant$description(
      this._res);

  TRes _res;

  call({
    List<Subscription$GetRestaurants$restaurant$description$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Subscription$GetRestaurants$restaurant$description$translations {
  Subscription$GetRestaurants$restaurant$description$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Subscription$GetRestaurants$restaurant$description$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Subscription$GetRestaurants$restaurant$description$translations(
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
            is Subscription$GetRestaurants$restaurant$description$translations) ||
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

extension UtilityExtension$Subscription$GetRestaurants$restaurant$description$translations
    on Subscription$GetRestaurants$restaurant$description$translations {
  CopyWith$Subscription$GetRestaurants$restaurant$description$translations<
          Subscription$GetRestaurants$restaurant$description$translations>
      get copyWith =>
          CopyWith$Subscription$GetRestaurants$restaurant$description$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$GetRestaurants$restaurant$description$translations<
    TRes> {
  factory CopyWith$Subscription$GetRestaurants$restaurant$description$translations(
    Subscription$GetRestaurants$restaurant$description$translations instance,
    TRes Function(
            Subscription$GetRestaurants$restaurant$description$translations)
        then,
  ) = _CopyWithImpl$Subscription$GetRestaurants$restaurant$description$translations;

  factory CopyWith$Subscription$GetRestaurants$restaurant$description$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$GetRestaurants$restaurant$description$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$GetRestaurants$restaurant$description$translations<
        TRes>
    implements
        CopyWith$Subscription$GetRestaurants$restaurant$description$translations<
            TRes> {
  _CopyWithImpl$Subscription$GetRestaurants$restaurant$description$translations(
    this._instance,
    this._then,
  );

  final Subscription$GetRestaurants$restaurant$description$translations
      _instance;

  final TRes Function(
      Subscription$GetRestaurants$restaurant$description$translations) _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$GetRestaurants$restaurant$description$translations(
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

class _CopyWithStubImpl$Subscription$GetRestaurants$restaurant$description$translations<
        TRes>
    implements
        CopyWith$Subscription$GetRestaurants$restaurant$description$translations<
            TRes> {
  _CopyWithStubImpl$Subscription$GetRestaurants$restaurant$description$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$getRestaurantItems {
  factory Variables$Query$getRestaurantItems({required int restaurant_id}) =>
      Variables$Query$getRestaurantItems._({
        r'restaurant_id': restaurant_id,
      });

  Variables$Query$getRestaurantItems._(this._$data);

  factory Variables$Query$getRestaurantItems.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$restaurant_id = data['restaurant_id'];
    result$data['restaurant_id'] = (l$restaurant_id as int);
    return Variables$Query$getRestaurantItems._(result$data);
  }

  Map<String, dynamic> _$data;

  int get restaurant_id => (_$data['restaurant_id'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$restaurant_id = restaurant_id;
    result$data['restaurant_id'] = l$restaurant_id;
    return result$data;
  }

  CopyWith$Variables$Query$getRestaurantItems<
          Variables$Query$getRestaurantItems>
      get copyWith => CopyWith$Variables$Query$getRestaurantItems(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getRestaurantItems) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$restaurant_id = restaurant_id;
    final lOther$restaurant_id = other.restaurant_id;
    if (l$restaurant_id != lOther$restaurant_id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$restaurant_id = restaurant_id;
    return Object.hashAll([l$restaurant_id]);
  }
}

abstract class CopyWith$Variables$Query$getRestaurantItems<TRes> {
  factory CopyWith$Variables$Query$getRestaurantItems(
    Variables$Query$getRestaurantItems instance,
    TRes Function(Variables$Query$getRestaurantItems) then,
  ) = _CopyWithImpl$Variables$Query$getRestaurantItems;

  factory CopyWith$Variables$Query$getRestaurantItems.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getRestaurantItems;

  TRes call({int? restaurant_id});
}

class _CopyWithImpl$Variables$Query$getRestaurantItems<TRes>
    implements CopyWith$Variables$Query$getRestaurantItems<TRes> {
  _CopyWithImpl$Variables$Query$getRestaurantItems(
    this._instance,
    this._then,
  );

  final Variables$Query$getRestaurantItems _instance;

  final TRes Function(Variables$Query$getRestaurantItems) _then;

  static const _undefined = {};

  TRes call({Object? restaurant_id = _undefined}) =>
      _then(Variables$Query$getRestaurantItems._({
        ..._instance._$data,
        if (restaurant_id != _undefined && restaurant_id != null)
          'restaurant_id': (restaurant_id as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$getRestaurantItems<TRes>
    implements CopyWith$Variables$Query$getRestaurantItems<TRes> {
  _CopyWithStubImpl$Variables$Query$getRestaurantItems(this._res);

  TRes _res;

  call({int? restaurant_id}) => _res;
}

class Query$getRestaurantItems {
  Query$getRestaurantItems({
    required this.restaurant_item,
    required this.$__typename,
  });

  factory Query$getRestaurantItems.fromJson(Map<String, dynamic> json) {
    final l$restaurant_item = json['restaurant_item'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurantItems(
      restaurant_item: (l$restaurant_item as List<dynamic>)
          .map((e) => Query$getRestaurantItems$restaurant_item.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$getRestaurantItems$restaurant_item> restaurant_item;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$restaurant_item = restaurant_item;
    _resultData['restaurant_item'] =
        l$restaurant_item.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$restaurant_item = restaurant_item;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$restaurant_item.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getRestaurantItems) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$restaurant_item = restaurant_item;
    final lOther$restaurant_item = other.restaurant_item;
    if (l$restaurant_item.length != lOther$restaurant_item.length) {
      return false;
    }
    for (int i = 0; i < l$restaurant_item.length; i++) {
      final l$restaurant_item$entry = l$restaurant_item[i];
      final lOther$restaurant_item$entry = lOther$restaurant_item[i];
      if (l$restaurant_item$entry != lOther$restaurant_item$entry) {
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

extension UtilityExtension$Query$getRestaurantItems
    on Query$getRestaurantItems {
  CopyWith$Query$getRestaurantItems<Query$getRestaurantItems> get copyWith =>
      CopyWith$Query$getRestaurantItems(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$getRestaurantItems<TRes> {
  factory CopyWith$Query$getRestaurantItems(
    Query$getRestaurantItems instance,
    TRes Function(Query$getRestaurantItems) then,
  ) = _CopyWithImpl$Query$getRestaurantItems;

  factory CopyWith$Query$getRestaurantItems.stub(TRes res) =
      _CopyWithStubImpl$Query$getRestaurantItems;

  TRes call({
    List<Query$getRestaurantItems$restaurant_item>? restaurant_item,
    String? $__typename,
  });
  TRes restaurant_item(
      Iterable<Query$getRestaurantItems$restaurant_item> Function(
              Iterable<
                  CopyWith$Query$getRestaurantItems$restaurant_item<
                      Query$getRestaurantItems$restaurant_item>>)
          _fn);
}

class _CopyWithImpl$Query$getRestaurantItems<TRes>
    implements CopyWith$Query$getRestaurantItems<TRes> {
  _CopyWithImpl$Query$getRestaurantItems(
    this._instance,
    this._then,
  );

  final Query$getRestaurantItems _instance;

  final TRes Function(Query$getRestaurantItems) _then;

  static const _undefined = {};

  TRes call({
    Object? restaurant_item = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getRestaurantItems(
        restaurant_item:
            restaurant_item == _undefined || restaurant_item == null
                ? _instance.restaurant_item
                : (restaurant_item
                    as List<Query$getRestaurantItems$restaurant_item>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes restaurant_item(
          Iterable<Query$getRestaurantItems$restaurant_item> Function(
                  Iterable<
                      CopyWith$Query$getRestaurantItems$restaurant_item<
                          Query$getRestaurantItems$restaurant_item>>)
              _fn) =>
      call(
          restaurant_item: _fn(_instance.restaurant_item
              .map((e) => CopyWith$Query$getRestaurantItems$restaurant_item(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$getRestaurantItems<TRes>
    implements CopyWith$Query$getRestaurantItems<TRes> {
  _CopyWithStubImpl$Query$getRestaurantItems(this._res);

  TRes _res;

  call({
    List<Query$getRestaurantItems$restaurant_item>? restaurant_item,
    String? $__typename,
  }) =>
      _res;
  restaurant_item(_fn) => _res;
}

const documentNodeQuerygetRestaurantItems = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getRestaurantItems'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'restaurant_id')),
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
        name: NameNode(value: 'restaurant_item'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'restaurant_id'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'restaurant_id')),
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
            name: NameNode(value: 'description'),
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
            name: NameNode(value: 'cost'),
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
            name: NameNode(value: 'category_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'item_type'),
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
            name: NameNode(value: 'restaurant_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'special_period_end'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'special_period_start'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'options'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'item_options'),
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
                    name: NameNode(value: 'free_choice'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'cost_per_extra'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'option_type'),
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
                    name: NameNode(value: 'maximum_choice'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'minimum_choice'),
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
                        name: NameNode(value: 'id'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
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
                    name: NameNode(value: 'choices'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                        name: NameNode(value: 'option_choices'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(selections: [
                          FieldNode(
                            name: NameNode(value: 'available'),
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
                                name: NameNode(value: 'id'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null,
                              ),
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
Query$getRestaurantItems _parserFn$Query$getRestaurantItems(
        Map<String, dynamic> data) =>
    Query$getRestaurantItems.fromJson(data);

class Options$Query$getRestaurantItems
    extends graphql.QueryOptions<Query$getRestaurantItems> {
  Options$Query$getRestaurantItems({
    String? operationName,
    required Variables$Query$getRestaurantItems variables,
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
          document: documentNodeQuerygetRestaurantItems,
          parserFn: _parserFn$Query$getRestaurantItems,
        );
}

class WatchOptions$Query$getRestaurantItems
    extends graphql.WatchQueryOptions<Query$getRestaurantItems> {
  WatchOptions$Query$getRestaurantItems({
    String? operationName,
    required Variables$Query$getRestaurantItems variables,
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
          document: documentNodeQuerygetRestaurantItems,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getRestaurantItems,
        );
}

class FetchMoreOptions$Query$getRestaurantItems
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getRestaurantItems({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getRestaurantItems variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetRestaurantItems,
        );
}

extension ClientExtension$Query$getRestaurantItems on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getRestaurantItems>>
      query$getRestaurantItems(
              Options$Query$getRestaurantItems options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$getRestaurantItems>
      watchQuery$getRestaurantItems(
              WatchOptions$Query$getRestaurantItems options) =>
          this.watchQuery(options);
  void writeQuery$getRestaurantItems({
    required Query$getRestaurantItems data,
    required Variables$Query$getRestaurantItems variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQuerygetRestaurantItems),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getRestaurantItems? readQuery$getRestaurantItems({
    required Variables$Query$getRestaurantItems variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQuerygetRestaurantItems),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$getRestaurantItems.fromJson(result);
  }
}

class Query$getRestaurantItems$restaurant_item {
  Query$getRestaurantItems$restaurant_item({
    required this.id,
    required this.name,
    this.description,
    required this.cost,
    required this.position,
    this.category_id,
    required this.item_type,
    required this.available,
    required this.restaurant_id,
    this.special_period_end,
    this.special_period_start,
    required this.options,
    required this.$__typename,
  });

  factory Query$getRestaurantItems$restaurant_item.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$description = json['description'];
    final l$cost = json['cost'];
    final l$position = json['position'];
    final l$category_id = json['category_id'];
    final l$item_type = json['item_type'];
    final l$available = json['available'];
    final l$restaurant_id = json['restaurant_id'];
    final l$special_period_end = json['special_period_end'];
    final l$special_period_start = json['special_period_start'];
    final l$options = json['options'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurantItems$restaurant_item(
      id: (l$id as int),
      name: Query$getRestaurantItems$restaurant_item$name.fromJson(
          (l$name as Map<String, dynamic>)),
      description: l$description == null
          ? null
          : Query$getRestaurantItems$restaurant_item$description.fromJson(
              (l$description as Map<String, dynamic>)),
      cost: moneyFromJson(l$cost),
      position: (l$position as int),
      category_id: (l$category_id as int?),
      item_type: (l$item_type as String),
      available: (l$available as bool),
      restaurant_id: (l$restaurant_id as int),
      special_period_end: (l$special_period_end as String?),
      special_period_start: (l$special_period_start as String?),
      options: (l$options as List<dynamic>)
          .map((e) => Query$getRestaurantItems$restaurant_item$options.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final Query$getRestaurantItems$restaurant_item$name name;

  final Query$getRestaurantItems$restaurant_item$description? description;

  final double cost;

  final int position;

  final int? category_id;

  final String item_type;

  final bool available;

  final int restaurant_id;

  final String? special_period_end;

  final String? special_period_start;

  final List<Query$getRestaurantItems$restaurant_item$options> options;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name.toJson();
    final l$description = description;
    _resultData['description'] = l$description?.toJson();
    final l$cost = cost;
    _resultData['cost'] = moneyToJson(l$cost);
    final l$position = position;
    _resultData['position'] = l$position;
    final l$category_id = category_id;
    _resultData['category_id'] = l$category_id;
    final l$item_type = item_type;
    _resultData['item_type'] = l$item_type;
    final l$available = available;
    _resultData['available'] = l$available;
    final l$restaurant_id = restaurant_id;
    _resultData['restaurant_id'] = l$restaurant_id;
    final l$special_period_end = special_period_end;
    _resultData['special_period_end'] = l$special_period_end;
    final l$special_period_start = special_period_start;
    _resultData['special_period_start'] = l$special_period_start;
    final l$options = options;
    _resultData['options'] = l$options.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$description = description;
    final l$cost = cost;
    final l$position = position;
    final l$category_id = category_id;
    final l$item_type = item_type;
    final l$available = available;
    final l$restaurant_id = restaurant_id;
    final l$special_period_end = special_period_end;
    final l$special_period_start = special_period_start;
    final l$options = options;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$description,
      l$cost,
      l$position,
      l$category_id,
      l$item_type,
      l$available,
      l$restaurant_id,
      l$special_period_end,
      l$special_period_start,
      Object.hashAll(l$options.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getRestaurantItems$restaurant_item) ||
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
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
      return false;
    }
    final l$cost = cost;
    final lOther$cost = other.cost;
    if (l$cost != lOther$cost) {
      return false;
    }
    final l$position = position;
    final lOther$position = other.position;
    if (l$position != lOther$position) {
      return false;
    }
    final l$category_id = category_id;
    final lOther$category_id = other.category_id;
    if (l$category_id != lOther$category_id) {
      return false;
    }
    final l$item_type = item_type;
    final lOther$item_type = other.item_type;
    if (l$item_type != lOther$item_type) {
      return false;
    }
    final l$available = available;
    final lOther$available = other.available;
    if (l$available != lOther$available) {
      return false;
    }
    final l$restaurant_id = restaurant_id;
    final lOther$restaurant_id = other.restaurant_id;
    if (l$restaurant_id != lOther$restaurant_id) {
      return false;
    }
    final l$special_period_end = special_period_end;
    final lOther$special_period_end = other.special_period_end;
    if (l$special_period_end != lOther$special_period_end) {
      return false;
    }
    final l$special_period_start = special_period_start;
    final lOther$special_period_start = other.special_period_start;
    if (l$special_period_start != lOther$special_period_start) {
      return false;
    }
    final l$options = options;
    final lOther$options = other.options;
    if (l$options.length != lOther$options.length) {
      return false;
    }
    for (int i = 0; i < l$options.length; i++) {
      final l$options$entry = l$options[i];
      final lOther$options$entry = lOther$options[i];
      if (l$options$entry != lOther$options$entry) {
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

extension UtilityExtension$Query$getRestaurantItems$restaurant_item
    on Query$getRestaurantItems$restaurant_item {
  CopyWith$Query$getRestaurantItems$restaurant_item<
          Query$getRestaurantItems$restaurant_item>
      get copyWith => CopyWith$Query$getRestaurantItems$restaurant_item(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurantItems$restaurant_item<TRes> {
  factory CopyWith$Query$getRestaurantItems$restaurant_item(
    Query$getRestaurantItems$restaurant_item instance,
    TRes Function(Query$getRestaurantItems$restaurant_item) then,
  ) = _CopyWithImpl$Query$getRestaurantItems$restaurant_item;

  factory CopyWith$Query$getRestaurantItems$restaurant_item.stub(TRes res) =
      _CopyWithStubImpl$Query$getRestaurantItems$restaurant_item;

  TRes call({
    int? id,
    Query$getRestaurantItems$restaurant_item$name? name,
    Query$getRestaurantItems$restaurant_item$description? description,
    double? cost,
    int? position,
    int? category_id,
    String? item_type,
    bool? available,
    int? restaurant_id,
    String? special_period_end,
    String? special_period_start,
    List<Query$getRestaurantItems$restaurant_item$options>? options,
    String? $__typename,
  });
  CopyWith$Query$getRestaurantItems$restaurant_item$name<TRes> get name;
  CopyWith$Query$getRestaurantItems$restaurant_item$description<TRes>
      get description;
  TRes options(
      Iterable<Query$getRestaurantItems$restaurant_item$options> Function(
              Iterable<
                  CopyWith$Query$getRestaurantItems$restaurant_item$options<
                      Query$getRestaurantItems$restaurant_item$options>>)
          _fn);
}

class _CopyWithImpl$Query$getRestaurantItems$restaurant_item<TRes>
    implements CopyWith$Query$getRestaurantItems$restaurant_item<TRes> {
  _CopyWithImpl$Query$getRestaurantItems$restaurant_item(
    this._instance,
    this._then,
  );

  final Query$getRestaurantItems$restaurant_item _instance;

  final TRes Function(Query$getRestaurantItems$restaurant_item) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? description = _undefined,
    Object? cost = _undefined,
    Object? position = _undefined,
    Object? category_id = _undefined,
    Object? item_type = _undefined,
    Object? available = _undefined,
    Object? restaurant_id = _undefined,
    Object? special_period_end = _undefined,
    Object? special_period_start = _undefined,
    Object? options = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getRestaurantItems$restaurant_item(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as Query$getRestaurantItems$restaurant_item$name),
        description: description == _undefined
            ? _instance.description
            : (description
                as Query$getRestaurantItems$restaurant_item$description?),
        cost: cost == _undefined || cost == null
            ? _instance.cost
            : (cost as double),
        position: position == _undefined || position == null
            ? _instance.position
            : (position as int),
        category_id: category_id == _undefined
            ? _instance.category_id
            : (category_id as int?),
        item_type: item_type == _undefined || item_type == null
            ? _instance.item_type
            : (item_type as String),
        available: available == _undefined || available == null
            ? _instance.available
            : (available as bool),
        restaurant_id: restaurant_id == _undefined || restaurant_id == null
            ? _instance.restaurant_id
            : (restaurant_id as int),
        special_period_end: special_period_end == _undefined
            ? _instance.special_period_end
            : (special_period_end as String?),
        special_period_start: special_period_start == _undefined
            ? _instance.special_period_start
            : (special_period_start as String?),
        options: options == _undefined || options == null
            ? _instance.options
            : (options
                as List<Query$getRestaurantItems$restaurant_item$options>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getRestaurantItems$restaurant_item$name<TRes> get name {
    final local$name = _instance.name;
    return CopyWith$Query$getRestaurantItems$restaurant_item$name(
        local$name, (e) => call(name: e));
  }

  CopyWith$Query$getRestaurantItems$restaurant_item$description<TRes>
      get description {
    final local$description = _instance.description;
    return local$description == null
        ? CopyWith$Query$getRestaurantItems$restaurant_item$description.stub(
            _then(_instance))
        : CopyWith$Query$getRestaurantItems$restaurant_item$description(
            local$description, (e) => call(description: e));
  }

  TRes options(
          Iterable<Query$getRestaurantItems$restaurant_item$options> Function(
                  Iterable<
                      CopyWith$Query$getRestaurantItems$restaurant_item$options<
                          Query$getRestaurantItems$restaurant_item$options>>)
              _fn) =>
      call(
          options: _fn(_instance.options.map(
              (e) => CopyWith$Query$getRestaurantItems$restaurant_item$options(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$getRestaurantItems$restaurant_item<TRes>
    implements CopyWith$Query$getRestaurantItems$restaurant_item<TRes> {
  _CopyWithStubImpl$Query$getRestaurantItems$restaurant_item(this._res);

  TRes _res;

  call({
    int? id,
    Query$getRestaurantItems$restaurant_item$name? name,
    Query$getRestaurantItems$restaurant_item$description? description,
    double? cost,
    int? position,
    int? category_id,
    String? item_type,
    bool? available,
    int? restaurant_id,
    String? special_period_end,
    String? special_period_start,
    List<Query$getRestaurantItems$restaurant_item$options>? options,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getRestaurantItems$restaurant_item$name<TRes> get name =>
      CopyWith$Query$getRestaurantItems$restaurant_item$name.stub(_res);
  CopyWith$Query$getRestaurantItems$restaurant_item$description<TRes>
      get description =>
          CopyWith$Query$getRestaurantItems$restaurant_item$description.stub(
              _res);
  options(_fn) => _res;
}

class Query$getRestaurantItems$restaurant_item$name {
  Query$getRestaurantItems$restaurant_item$name({
    required this.translations,
    required this.id,
    required this.$__typename,
  });

  factory Query$getRestaurantItems$restaurant_item$name.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurantItems$restaurant_item$name(
      translations: (l$translations as List<dynamic>)
          .map((e) => Query$getRestaurantItems$restaurant_item$name$translations
              .fromJson((e as Map<String, dynamic>)))
          .toList(),
      id: (l$id as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$getRestaurantItems$restaurant_item$name$translations>
      translations;

  final int id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$translations = translations;
    _resultData['translations'] =
        l$translations.map((e) => e.toJson()).toList();
    final l$id = id;
    _resultData['id'] = l$id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$translations = translations;
    final l$id = id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$translations.map((v) => v)),
      l$id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getRestaurantItems$restaurant_item$name) ||
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

extension UtilityExtension$Query$getRestaurantItems$restaurant_item$name
    on Query$getRestaurantItems$restaurant_item$name {
  CopyWith$Query$getRestaurantItems$restaurant_item$name<
          Query$getRestaurantItems$restaurant_item$name>
      get copyWith => CopyWith$Query$getRestaurantItems$restaurant_item$name(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurantItems$restaurant_item$name<TRes> {
  factory CopyWith$Query$getRestaurantItems$restaurant_item$name(
    Query$getRestaurantItems$restaurant_item$name instance,
    TRes Function(Query$getRestaurantItems$restaurant_item$name) then,
  ) = _CopyWithImpl$Query$getRestaurantItems$restaurant_item$name;

  factory CopyWith$Query$getRestaurantItems$restaurant_item$name.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getRestaurantItems$restaurant_item$name;

  TRes call({
    List<Query$getRestaurantItems$restaurant_item$name$translations>?
        translations,
    int? id,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$getRestaurantItems$restaurant_item$name$translations> Function(
              Iterable<
                  CopyWith$Query$getRestaurantItems$restaurant_item$name$translations<
                      Query$getRestaurantItems$restaurant_item$name$translations>>)
          _fn);
}

class _CopyWithImpl$Query$getRestaurantItems$restaurant_item$name<TRes>
    implements CopyWith$Query$getRestaurantItems$restaurant_item$name<TRes> {
  _CopyWithImpl$Query$getRestaurantItems$restaurant_item$name(
    this._instance,
    this._then,
  );

  final Query$getRestaurantItems$restaurant_item$name _instance;

  final TRes Function(Query$getRestaurantItems$restaurant_item$name) _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getRestaurantItems$restaurant_item$name(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$getRestaurantItems$restaurant_item$name$translations>),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$getRestaurantItems$restaurant_item$name$translations> Function(
                  Iterable<
                      CopyWith$Query$getRestaurantItems$restaurant_item$name$translations<
                          Query$getRestaurantItems$restaurant_item$name$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$getRestaurantItems$restaurant_item$name$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getRestaurantItems$restaurant_item$name<TRes>
    implements CopyWith$Query$getRestaurantItems$restaurant_item$name<TRes> {
  _CopyWithStubImpl$Query$getRestaurantItems$restaurant_item$name(this._res);

  TRes _res;

  call({
    List<Query$getRestaurantItems$restaurant_item$name$translations>?
        translations,
    int? id,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$getRestaurantItems$restaurant_item$name$translations {
  Query$getRestaurantItems$restaurant_item$name$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$getRestaurantItems$restaurant_item$name$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurantItems$restaurant_item$name$translations(
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
            is Query$getRestaurantItems$restaurant_item$name$translations) ||
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

extension UtilityExtension$Query$getRestaurantItems$restaurant_item$name$translations
    on Query$getRestaurantItems$restaurant_item$name$translations {
  CopyWith$Query$getRestaurantItems$restaurant_item$name$translations<
          Query$getRestaurantItems$restaurant_item$name$translations>
      get copyWith =>
          CopyWith$Query$getRestaurantItems$restaurant_item$name$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurantItems$restaurant_item$name$translations<
    TRes> {
  factory CopyWith$Query$getRestaurantItems$restaurant_item$name$translations(
    Query$getRestaurantItems$restaurant_item$name$translations instance,
    TRes Function(Query$getRestaurantItems$restaurant_item$name$translations)
        then,
  ) = _CopyWithImpl$Query$getRestaurantItems$restaurant_item$name$translations;

  factory CopyWith$Query$getRestaurantItems$restaurant_item$name$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getRestaurantItems$restaurant_item$name$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getRestaurantItems$restaurant_item$name$translations<
        TRes>
    implements
        CopyWith$Query$getRestaurantItems$restaurant_item$name$translations<
            TRes> {
  _CopyWithImpl$Query$getRestaurantItems$restaurant_item$name$translations(
    this._instance,
    this._then,
  );

  final Query$getRestaurantItems$restaurant_item$name$translations _instance;

  final TRes Function(
      Query$getRestaurantItems$restaurant_item$name$translations) _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getRestaurantItems$restaurant_item$name$translations(
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

class _CopyWithStubImpl$Query$getRestaurantItems$restaurant_item$name$translations<
        TRes>
    implements
        CopyWith$Query$getRestaurantItems$restaurant_item$name$translations<
            TRes> {
  _CopyWithStubImpl$Query$getRestaurantItems$restaurant_item$name$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Query$getRestaurantItems$restaurant_item$description {
  Query$getRestaurantItems$restaurant_item$description({
    required this.id,
    required this.translations,
    required this.$__typename,
  });

  factory Query$getRestaurantItems$restaurant_item$description.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurantItems$restaurant_item$description(
      id: (l$id as int),
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$getRestaurantItems$restaurant_item$description$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final List<Query$getRestaurantItems$restaurant_item$description$translations>
      translations;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$translations = translations;
    _resultData['translations'] =
        l$translations.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$translations = translations;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      Object.hashAll(l$translations.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getRestaurantItems$restaurant_item$description) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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

extension UtilityExtension$Query$getRestaurantItems$restaurant_item$description
    on Query$getRestaurantItems$restaurant_item$description {
  CopyWith$Query$getRestaurantItems$restaurant_item$description<
          Query$getRestaurantItems$restaurant_item$description>
      get copyWith =>
          CopyWith$Query$getRestaurantItems$restaurant_item$description(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurantItems$restaurant_item$description<
    TRes> {
  factory CopyWith$Query$getRestaurantItems$restaurant_item$description(
    Query$getRestaurantItems$restaurant_item$description instance,
    TRes Function(Query$getRestaurantItems$restaurant_item$description) then,
  ) = _CopyWithImpl$Query$getRestaurantItems$restaurant_item$description;

  factory CopyWith$Query$getRestaurantItems$restaurant_item$description.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getRestaurantItems$restaurant_item$description;

  TRes call({
    int? id,
    List<Query$getRestaurantItems$restaurant_item$description$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$getRestaurantItems$restaurant_item$description$translations> Function(
              Iterable<
                  CopyWith$Query$getRestaurantItems$restaurant_item$description$translations<
                      Query$getRestaurantItems$restaurant_item$description$translations>>)
          _fn);
}

class _CopyWithImpl$Query$getRestaurantItems$restaurant_item$description<TRes>
    implements
        CopyWith$Query$getRestaurantItems$restaurant_item$description<TRes> {
  _CopyWithImpl$Query$getRestaurantItems$restaurant_item$description(
    this._instance,
    this._then,
  );

  final Query$getRestaurantItems$restaurant_item$description _instance;

  final TRes Function(Query$getRestaurantItems$restaurant_item$description)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getRestaurantItems$restaurant_item$description(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$getRestaurantItems$restaurant_item$description$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$getRestaurantItems$restaurant_item$description$translations> Function(
                  Iterable<
                      CopyWith$Query$getRestaurantItems$restaurant_item$description$translations<
                          Query$getRestaurantItems$restaurant_item$description$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$getRestaurantItems$restaurant_item$description$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getRestaurantItems$restaurant_item$description<
        TRes>
    implements
        CopyWith$Query$getRestaurantItems$restaurant_item$description<TRes> {
  _CopyWithStubImpl$Query$getRestaurantItems$restaurant_item$description(
      this._res);

  TRes _res;

  call({
    int? id,
    List<Query$getRestaurantItems$restaurant_item$description$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$getRestaurantItems$restaurant_item$description$translations {
  Query$getRestaurantItems$restaurant_item$description$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$getRestaurantItems$restaurant_item$description$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurantItems$restaurant_item$description$translations(
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
            is Query$getRestaurantItems$restaurant_item$description$translations) ||
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

extension UtilityExtension$Query$getRestaurantItems$restaurant_item$description$translations
    on Query$getRestaurantItems$restaurant_item$description$translations {
  CopyWith$Query$getRestaurantItems$restaurant_item$description$translations<
          Query$getRestaurantItems$restaurant_item$description$translations>
      get copyWith =>
          CopyWith$Query$getRestaurantItems$restaurant_item$description$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurantItems$restaurant_item$description$translations<
    TRes> {
  factory CopyWith$Query$getRestaurantItems$restaurant_item$description$translations(
    Query$getRestaurantItems$restaurant_item$description$translations instance,
    TRes Function(
            Query$getRestaurantItems$restaurant_item$description$translations)
        then,
  ) = _CopyWithImpl$Query$getRestaurantItems$restaurant_item$description$translations;

  factory CopyWith$Query$getRestaurantItems$restaurant_item$description$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getRestaurantItems$restaurant_item$description$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getRestaurantItems$restaurant_item$description$translations<
        TRes>
    implements
        CopyWith$Query$getRestaurantItems$restaurant_item$description$translations<
            TRes> {
  _CopyWithImpl$Query$getRestaurantItems$restaurant_item$description$translations(
    this._instance,
    this._then,
  );

  final Query$getRestaurantItems$restaurant_item$description$translations
      _instance;

  final TRes Function(
      Query$getRestaurantItems$restaurant_item$description$translations) _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getRestaurantItems$restaurant_item$description$translations(
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

class _CopyWithStubImpl$Query$getRestaurantItems$restaurant_item$description$translations<
        TRes>
    implements
        CopyWith$Query$getRestaurantItems$restaurant_item$description$translations<
            TRes> {
  _CopyWithStubImpl$Query$getRestaurantItems$restaurant_item$description$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Query$getRestaurantItems$restaurant_item$options {
  Query$getRestaurantItems$restaurant_item$options({
    required this.item_options,
    required this.$__typename,
  });

  factory Query$getRestaurantItems$restaurant_item$options.fromJson(
      Map<String, dynamic> json) {
    final l$item_options = json['item_options'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurantItems$restaurant_item$options(
      item_options: (l$item_options as List<dynamic>)
          .map((e) =>
              Query$getRestaurantItems$restaurant_item$options$item_options
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$getRestaurantItems$restaurant_item$options$item_options>
      item_options;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$item_options = item_options;
    _resultData['item_options'] =
        l$item_options.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$item_options = item_options;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$item_options.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getRestaurantItems$restaurant_item$options) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$item_options = item_options;
    final lOther$item_options = other.item_options;
    if (l$item_options.length != lOther$item_options.length) {
      return false;
    }
    for (int i = 0; i < l$item_options.length; i++) {
      final l$item_options$entry = l$item_options[i];
      final lOther$item_options$entry = lOther$item_options[i];
      if (l$item_options$entry != lOther$item_options$entry) {
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

extension UtilityExtension$Query$getRestaurantItems$restaurant_item$options
    on Query$getRestaurantItems$restaurant_item$options {
  CopyWith$Query$getRestaurantItems$restaurant_item$options<
          Query$getRestaurantItems$restaurant_item$options>
      get copyWith => CopyWith$Query$getRestaurantItems$restaurant_item$options(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurantItems$restaurant_item$options<TRes> {
  factory CopyWith$Query$getRestaurantItems$restaurant_item$options(
    Query$getRestaurantItems$restaurant_item$options instance,
    TRes Function(Query$getRestaurantItems$restaurant_item$options) then,
  ) = _CopyWithImpl$Query$getRestaurantItems$restaurant_item$options;

  factory CopyWith$Query$getRestaurantItems$restaurant_item$options.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getRestaurantItems$restaurant_item$options;

  TRes call({
    List<Query$getRestaurantItems$restaurant_item$options$item_options>?
        item_options,
    String? $__typename,
  });
  TRes item_options(
      Iterable<Query$getRestaurantItems$restaurant_item$options$item_options> Function(
              Iterable<
                  CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options<
                      Query$getRestaurantItems$restaurant_item$options$item_options>>)
          _fn);
}

class _CopyWithImpl$Query$getRestaurantItems$restaurant_item$options<TRes>
    implements CopyWith$Query$getRestaurantItems$restaurant_item$options<TRes> {
  _CopyWithImpl$Query$getRestaurantItems$restaurant_item$options(
    this._instance,
    this._then,
  );

  final Query$getRestaurantItems$restaurant_item$options _instance;

  final TRes Function(Query$getRestaurantItems$restaurant_item$options) _then;

  static const _undefined = {};

  TRes call({
    Object? item_options = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getRestaurantItems$restaurant_item$options(
        item_options: item_options == _undefined || item_options == null
            ? _instance.item_options
            : (item_options as List<
                Query$getRestaurantItems$restaurant_item$options$item_options>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes item_options(
          Iterable<Query$getRestaurantItems$restaurant_item$options$item_options> Function(
                  Iterable<
                      CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options<
                          Query$getRestaurantItems$restaurant_item$options$item_options>>)
              _fn) =>
      call(
          item_options: _fn(_instance.item_options.map((e) =>
              CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getRestaurantItems$restaurant_item$options<TRes>
    implements CopyWith$Query$getRestaurantItems$restaurant_item$options<TRes> {
  _CopyWithStubImpl$Query$getRestaurantItems$restaurant_item$options(this._res);

  TRes _res;

  call({
    List<Query$getRestaurantItems$restaurant_item$options$item_options>?
        item_options,
    String? $__typename,
  }) =>
      _res;
  item_options(_fn) => _res;
}

class Query$getRestaurantItems$restaurant_item$options$item_options {
  Query$getRestaurantItems$restaurant_item$options$item_options({
    required this.id,
    required this.free_choice,
    required this.cost_per_extra,
    required this.option_type,
    required this.position,
    required this.maximum_choice,
    required this.minimum_choice,
    required this.name,
    required this.choices,
    required this.$__typename,
  });

  factory Query$getRestaurantItems$restaurant_item$options$item_options.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$free_choice = json['free_choice'];
    final l$cost_per_extra = json['cost_per_extra'];
    final l$option_type = json['option_type'];
    final l$position = json['position'];
    final l$maximum_choice = json['maximum_choice'];
    final l$minimum_choice = json['minimum_choice'];
    final l$name = json['name'];
    final l$choices = json['choices'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurantItems$restaurant_item$options$item_options(
      id: (l$id as int),
      free_choice: (l$free_choice as int),
      cost_per_extra: moneyFromJson(l$cost_per_extra),
      option_type: (l$option_type as String),
      position: (l$position as int),
      maximum_choice: (l$maximum_choice as int),
      minimum_choice: (l$minimum_choice as int),
      name: Query$getRestaurantItems$restaurant_item$options$item_options$name
          .fromJson((l$name as Map<String, dynamic>)),
      choices: (l$choices as List<dynamic>)
          .map((e) =>
              Query$getRestaurantItems$restaurant_item$options$item_options$choices
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final int free_choice;

  final double cost_per_extra;

  final String option_type;

  final int position;

  final int maximum_choice;

  final int minimum_choice;

  final Query$getRestaurantItems$restaurant_item$options$item_options$name name;

  final List<
          Query$getRestaurantItems$restaurant_item$options$item_options$choices>
      choices;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$free_choice = free_choice;
    _resultData['free_choice'] = l$free_choice;
    final l$cost_per_extra = cost_per_extra;
    _resultData['cost_per_extra'] = moneyToJson(l$cost_per_extra);
    final l$option_type = option_type;
    _resultData['option_type'] = l$option_type;
    final l$position = position;
    _resultData['position'] = l$position;
    final l$maximum_choice = maximum_choice;
    _resultData['maximum_choice'] = l$maximum_choice;
    final l$minimum_choice = minimum_choice;
    _resultData['minimum_choice'] = l$minimum_choice;
    final l$name = name;
    _resultData['name'] = l$name.toJson();
    final l$choices = choices;
    _resultData['choices'] = l$choices.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$free_choice = free_choice;
    final l$cost_per_extra = cost_per_extra;
    final l$option_type = option_type;
    final l$position = position;
    final l$maximum_choice = maximum_choice;
    final l$minimum_choice = minimum_choice;
    final l$name = name;
    final l$choices = choices;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$free_choice,
      l$cost_per_extra,
      l$option_type,
      l$position,
      l$maximum_choice,
      l$minimum_choice,
      l$name,
      Object.hashAll(l$choices.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$getRestaurantItems$restaurant_item$options$item_options) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$free_choice = free_choice;
    final lOther$free_choice = other.free_choice;
    if (l$free_choice != lOther$free_choice) {
      return false;
    }
    final l$cost_per_extra = cost_per_extra;
    final lOther$cost_per_extra = other.cost_per_extra;
    if (l$cost_per_extra != lOther$cost_per_extra) {
      return false;
    }
    final l$option_type = option_type;
    final lOther$option_type = other.option_type;
    if (l$option_type != lOther$option_type) {
      return false;
    }
    final l$position = position;
    final lOther$position = other.position;
    if (l$position != lOther$position) {
      return false;
    }
    final l$maximum_choice = maximum_choice;
    final lOther$maximum_choice = other.maximum_choice;
    if (l$maximum_choice != lOther$maximum_choice) {
      return false;
    }
    final l$minimum_choice = minimum_choice;
    final lOther$minimum_choice = other.minimum_choice;
    if (l$minimum_choice != lOther$minimum_choice) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$choices = choices;
    final lOther$choices = other.choices;
    if (l$choices.length != lOther$choices.length) {
      return false;
    }
    for (int i = 0; i < l$choices.length; i++) {
      final l$choices$entry = l$choices[i];
      final lOther$choices$entry = lOther$choices[i];
      if (l$choices$entry != lOther$choices$entry) {
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

extension UtilityExtension$Query$getRestaurantItems$restaurant_item$options$item_options
    on Query$getRestaurantItems$restaurant_item$options$item_options {
  CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options<
          Query$getRestaurantItems$restaurant_item$options$item_options>
      get copyWith =>
          CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options<
    TRes> {
  factory CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options(
    Query$getRestaurantItems$restaurant_item$options$item_options instance,
    TRes Function(Query$getRestaurantItems$restaurant_item$options$item_options)
        then,
  ) = _CopyWithImpl$Query$getRestaurantItems$restaurant_item$options$item_options;

  factory CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getRestaurantItems$restaurant_item$options$item_options;

  TRes call({
    int? id,
    int? free_choice,
    double? cost_per_extra,
    String? option_type,
    int? position,
    int? maximum_choice,
    int? minimum_choice,
    Query$getRestaurantItems$restaurant_item$options$item_options$name? name,
    List<Query$getRestaurantItems$restaurant_item$options$item_options$choices>?
        choices,
    String? $__typename,
  });
  CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$name<
      TRes> get name;
  TRes choices(
      Iterable<Query$getRestaurantItems$restaurant_item$options$item_options$choices> Function(
              Iterable<
                  CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$choices<
                      Query$getRestaurantItems$restaurant_item$options$item_options$choices>>)
          _fn);
}

class _CopyWithImpl$Query$getRestaurantItems$restaurant_item$options$item_options<
        TRes>
    implements
        CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options<
            TRes> {
  _CopyWithImpl$Query$getRestaurantItems$restaurant_item$options$item_options(
    this._instance,
    this._then,
  );

  final Query$getRestaurantItems$restaurant_item$options$item_options _instance;

  final TRes Function(
      Query$getRestaurantItems$restaurant_item$options$item_options) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? free_choice = _undefined,
    Object? cost_per_extra = _undefined,
    Object? option_type = _undefined,
    Object? position = _undefined,
    Object? maximum_choice = _undefined,
    Object? minimum_choice = _undefined,
    Object? name = _undefined,
    Object? choices = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getRestaurantItems$restaurant_item$options$item_options(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        free_choice: free_choice == _undefined || free_choice == null
            ? _instance.free_choice
            : (free_choice as int),
        cost_per_extra: cost_per_extra == _undefined || cost_per_extra == null
            ? _instance.cost_per_extra
            : (cost_per_extra as double),
        option_type: option_type == _undefined || option_type == null
            ? _instance.option_type
            : (option_type as String),
        position: position == _undefined || position == null
            ? _instance.position
            : (position as int),
        maximum_choice: maximum_choice == _undefined || maximum_choice == null
            ? _instance.maximum_choice
            : (maximum_choice as int),
        minimum_choice: minimum_choice == _undefined || minimum_choice == null
            ? _instance.minimum_choice
            : (minimum_choice as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name
                as Query$getRestaurantItems$restaurant_item$options$item_options$name),
        choices: choices == _undefined || choices == null
            ? _instance.choices
            : (choices as List<
                Query$getRestaurantItems$restaurant_item$options$item_options$choices>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$name<
      TRes> get name {
    final local$name = _instance.name;
    return CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$name(
        local$name, (e) => call(name: e));
  }

  TRes choices(
          Iterable<Query$getRestaurantItems$restaurant_item$options$item_options$choices> Function(
                  Iterable<
                      CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$choices<
                          Query$getRestaurantItems$restaurant_item$options$item_options$choices>>)
              _fn) =>
      call(
          choices: _fn(_instance.choices.map((e) =>
              CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$choices(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getRestaurantItems$restaurant_item$options$item_options<
        TRes>
    implements
        CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options<
            TRes> {
  _CopyWithStubImpl$Query$getRestaurantItems$restaurant_item$options$item_options(
      this._res);

  TRes _res;

  call({
    int? id,
    int? free_choice,
    double? cost_per_extra,
    String? option_type,
    int? position,
    int? maximum_choice,
    int? minimum_choice,
    Query$getRestaurantItems$restaurant_item$options$item_options$name? name,
    List<Query$getRestaurantItems$restaurant_item$options$item_options$choices>?
        choices,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$name<
          TRes>
      get name =>
          CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$name
              .stub(_res);
  choices(_fn) => _res;
}

class Query$getRestaurantItems$restaurant_item$options$item_options$name {
  Query$getRestaurantItems$restaurant_item$options$item_options$name({
    required this.id,
    required this.translations,
    required this.$__typename,
  });

  factory Query$getRestaurantItems$restaurant_item$options$item_options$name.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurantItems$restaurant_item$options$item_options$name(
      id: (l$id as int),
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$getRestaurantItems$restaurant_item$options$item_options$name$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final List<
          Query$getRestaurantItems$restaurant_item$options$item_options$name$translations>
      translations;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$translations = translations;
    _resultData['translations'] =
        l$translations.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$translations = translations;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
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
            is Query$getRestaurantItems$restaurant_item$options$item_options$name) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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

extension UtilityExtension$Query$getRestaurantItems$restaurant_item$options$item_options$name
    on Query$getRestaurantItems$restaurant_item$options$item_options$name {
  CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$name<
          Query$getRestaurantItems$restaurant_item$options$item_options$name>
      get copyWith =>
          CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$name(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$name<
    TRes> {
  factory CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$name(
    Query$getRestaurantItems$restaurant_item$options$item_options$name instance,
    TRes Function(
            Query$getRestaurantItems$restaurant_item$options$item_options$name)
        then,
  ) = _CopyWithImpl$Query$getRestaurantItems$restaurant_item$options$item_options$name;

  factory CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$name.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getRestaurantItems$restaurant_item$options$item_options$name;

  TRes call({
    int? id,
    List<Query$getRestaurantItems$restaurant_item$options$item_options$name$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$getRestaurantItems$restaurant_item$options$item_options$name$translations> Function(
              Iterable<
                  CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$name$translations<
                      Query$getRestaurantItems$restaurant_item$options$item_options$name$translations>>)
          _fn);
}

class _CopyWithImpl$Query$getRestaurantItems$restaurant_item$options$item_options$name<
        TRes>
    implements
        CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$name<
            TRes> {
  _CopyWithImpl$Query$getRestaurantItems$restaurant_item$options$item_options$name(
    this._instance,
    this._then,
  );

  final Query$getRestaurantItems$restaurant_item$options$item_options$name
      _instance;

  final TRes Function(
      Query$getRestaurantItems$restaurant_item$options$item_options$name) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getRestaurantItems$restaurant_item$options$item_options$name(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$getRestaurantItems$restaurant_item$options$item_options$name$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$getRestaurantItems$restaurant_item$options$item_options$name$translations> Function(
                  Iterable<
                      CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$name$translations<
                          Query$getRestaurantItems$restaurant_item$options$item_options$name$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$name$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getRestaurantItems$restaurant_item$options$item_options$name<
        TRes>
    implements
        CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$name<
            TRes> {
  _CopyWithStubImpl$Query$getRestaurantItems$restaurant_item$options$item_options$name(
      this._res);

  TRes _res;

  call({
    int? id,
    List<Query$getRestaurantItems$restaurant_item$options$item_options$name$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$getRestaurantItems$restaurant_item$options$item_options$name$translations {
  Query$getRestaurantItems$restaurant_item$options$item_options$name$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$getRestaurantItems$restaurant_item$options$item_options$name$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurantItems$restaurant_item$options$item_options$name$translations(
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
            is Query$getRestaurantItems$restaurant_item$options$item_options$name$translations) ||
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

extension UtilityExtension$Query$getRestaurantItems$restaurant_item$options$item_options$name$translations
    on Query$getRestaurantItems$restaurant_item$options$item_options$name$translations {
  CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$name$translations<
          Query$getRestaurantItems$restaurant_item$options$item_options$name$translations>
      get copyWith =>
          CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$name$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$name$translations<
    TRes> {
  factory CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$name$translations(
    Query$getRestaurantItems$restaurant_item$options$item_options$name$translations
        instance,
    TRes Function(
            Query$getRestaurantItems$restaurant_item$options$item_options$name$translations)
        then,
  ) = _CopyWithImpl$Query$getRestaurantItems$restaurant_item$options$item_options$name$translations;

  factory CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$name$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getRestaurantItems$restaurant_item$options$item_options$name$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getRestaurantItems$restaurant_item$options$item_options$name$translations<
        TRes>
    implements
        CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$name$translations<
            TRes> {
  _CopyWithImpl$Query$getRestaurantItems$restaurant_item$options$item_options$name$translations(
    this._instance,
    this._then,
  );

  final Query$getRestaurantItems$restaurant_item$options$item_options$name$translations
      _instance;

  final TRes Function(
          Query$getRestaurantItems$restaurant_item$options$item_options$name$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getRestaurantItems$restaurant_item$options$item_options$name$translations(
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

class _CopyWithStubImpl$Query$getRestaurantItems$restaurant_item$options$item_options$name$translations<
        TRes>
    implements
        CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$name$translations<
            TRes> {
  _CopyWithStubImpl$Query$getRestaurantItems$restaurant_item$options$item_options$name$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Query$getRestaurantItems$restaurant_item$options$item_options$choices {
  Query$getRestaurantItems$restaurant_item$options$item_options$choices({
    required this.option_choices,
    required this.$__typename,
  });

  factory Query$getRestaurantItems$restaurant_item$options$item_options$choices.fromJson(
      Map<String, dynamic> json) {
    final l$option_choices = json['option_choices'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurantItems$restaurant_item$options$item_options$choices(
      option_choices: (l$option_choices as List<dynamic>)
          .map((e) =>
              Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices>
      option_choices;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$option_choices = option_choices;
    _resultData['option_choices'] =
        l$option_choices.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$option_choices = option_choices;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$option_choices.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$getRestaurantItems$restaurant_item$options$item_options$choices) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$option_choices = option_choices;
    final lOther$option_choices = other.option_choices;
    if (l$option_choices.length != lOther$option_choices.length) {
      return false;
    }
    for (int i = 0; i < l$option_choices.length; i++) {
      final l$option_choices$entry = l$option_choices[i];
      final lOther$option_choices$entry = lOther$option_choices[i];
      if (l$option_choices$entry != lOther$option_choices$entry) {
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

extension UtilityExtension$Query$getRestaurantItems$restaurant_item$options$item_options$choices
    on Query$getRestaurantItems$restaurant_item$options$item_options$choices {
  CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$choices<
          Query$getRestaurantItems$restaurant_item$options$item_options$choices>
      get copyWith =>
          CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$choices(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$choices<
    TRes> {
  factory CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$choices(
    Query$getRestaurantItems$restaurant_item$options$item_options$choices
        instance,
    TRes Function(
            Query$getRestaurantItems$restaurant_item$options$item_options$choices)
        then,
  ) = _CopyWithImpl$Query$getRestaurantItems$restaurant_item$options$item_options$choices;

  factory CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$choices.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getRestaurantItems$restaurant_item$options$item_options$choices;

  TRes call({
    List<Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices>?
        option_choices,
    String? $__typename,
  });
  TRes option_choices(
      Iterable<Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices> Function(
              Iterable<
                  CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices<
                      Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices>>)
          _fn);
}

class _CopyWithImpl$Query$getRestaurantItems$restaurant_item$options$item_options$choices<
        TRes>
    implements
        CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$choices<
            TRes> {
  _CopyWithImpl$Query$getRestaurantItems$restaurant_item$options$item_options$choices(
    this._instance,
    this._then,
  );

  final Query$getRestaurantItems$restaurant_item$options$item_options$choices
      _instance;

  final TRes Function(
          Query$getRestaurantItems$restaurant_item$options$item_options$choices)
      _then;

  static const _undefined = {};

  TRes call({
    Object? option_choices = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getRestaurantItems$restaurant_item$options$item_options$choices(
        option_choices: option_choices == _undefined || option_choices == null
            ? _instance.option_choices
            : (option_choices as List<
                Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes option_choices(
          Iterable<Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices> Function(
                  Iterable<
                      CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices<
                          Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices>>)
              _fn) =>
      call(
          option_choices: _fn(_instance.option_choices.map((e) =>
              CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getRestaurantItems$restaurant_item$options$item_options$choices<
        TRes>
    implements
        CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$choices<
            TRes> {
  _CopyWithStubImpl$Query$getRestaurantItems$restaurant_item$options$item_options$choices(
      this._res);

  TRes _res;

  call({
    List<Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices>?
        option_choices,
    String? $__typename,
  }) =>
      _res;
  option_choices(_fn) => _res;
}

class Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices {
  Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices({
    required this.available,
    required this.cost,
    required this.id,
    required this.name,
    required this.$__typename,
  });

  factory Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices.fromJson(
      Map<String, dynamic> json) {
    final l$available = json['available'];
    final l$cost = json['cost'];
    final l$id = json['id'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices(
      available: (l$available as bool),
      cost: moneyFromJson(l$cost),
      id: (l$id as int),
      name:
          Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name
              .fromJson((l$name as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final bool available;

  final double cost;

  final int id;

  final Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name
      name;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$available = available;
    _resultData['available'] = l$available;
    final l$cost = cost;
    _resultData['cost'] = moneyToJson(l$cost);
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$available = available;
    final l$cost = cost;
    final l$id = id;
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$available,
      l$cost,
      l$id,
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
            is Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$available = available;
    final lOther$available = other.available;
    if (l$available != lOther$available) {
      return false;
    }
    final l$cost = cost;
    final lOther$cost = other.cost;
    if (l$cost != lOther$cost) {
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices
    on Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices {
  CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices<
          Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices>
      get copyWith =>
          CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices<
    TRes> {
  factory CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices(
    Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices
        instance,
    TRes Function(
            Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices)
        then,
  ) = _CopyWithImpl$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices;

  factory CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices;

  TRes call({
    bool? available,
    double? cost,
    int? id,
    Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name?
        name,
    String? $__typename,
  });
  CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name<
      TRes> get name;
}

class _CopyWithImpl$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices<
        TRes>
    implements
        CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices<
            TRes> {
  _CopyWithImpl$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices(
    this._instance,
    this._then,
  );

  final Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices
      _instance;

  final TRes Function(
          Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices)
      _then;

  static const _undefined = {};

  TRes call({
    Object? available = _undefined,
    Object? cost = _undefined,
    Object? id = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices(
        available: available == _undefined || available == null
            ? _instance.available
            : (available as bool),
        cost: cost == _undefined || cost == null
            ? _instance.cost
            : (cost as double),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name
                as Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name<
      TRes> get name {
    final local$name = _instance.name;
    return CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name(
        local$name, (e) => call(name: e));
  }
}

class _CopyWithStubImpl$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices<
        TRes>
    implements
        CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices<
            TRes> {
  _CopyWithStubImpl$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices(
      this._res);

  TRes _res;

  call({
    bool? available,
    double? cost,
    int? id,
    Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name?
        name,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name<
          TRes>
      get name =>
          CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name
              .stub(_res);
}

class Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name {
  Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name({
    required this.id,
    required this.translations,
    required this.$__typename,
  });

  factory Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name(
      id: (l$id as int),
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final List<
          Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name$translations>
      translations;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$translations = translations;
    _resultData['translations'] =
        l$translations.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$translations = translations;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
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
            is Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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

extension UtilityExtension$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name
    on Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name {
  CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name<
          Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name>
      get copyWith =>
          CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name<
    TRes> {
  factory CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name(
    Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name
        instance,
    TRes Function(
            Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name)
        then,
  ) = _CopyWithImpl$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name;

  factory CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name;

  TRes call({
    int? id,
    List<Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name$translations> Function(
              Iterable<
                  CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name$translations<
                      Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name$translations>>)
          _fn);
}

class _CopyWithImpl$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name<
        TRes>
    implements
        CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name<
            TRes> {
  _CopyWithImpl$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name(
    this._instance,
    this._then,
  );

  final Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name
      _instance;

  final TRes Function(
          Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name$translations> Function(
                  Iterable<
                      CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name$translations<
                          Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name<
        TRes>
    implements
        CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name<
            TRes> {
  _CopyWithStubImpl$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name(
      this._res);

  TRes _res;

  call({
    int? id,
    List<Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name$translations {
  Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name$translations(
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
            is Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name$translations) ||
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

extension UtilityExtension$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name$translations
    on Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name$translations {
  CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name$translations<
          Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name$translations>
      get copyWith =>
          CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name$translations<
    TRes> {
  factory CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name$translations(
    Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name$translations
        instance,
    TRes Function(
            Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name$translations)
        then,
  ) = _CopyWithImpl$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name$translations;

  factory CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name$translations<
        TRes>
    implements
        CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name$translations<
            TRes> {
  _CopyWithImpl$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name$translations(
    this._instance,
    this._then,
  );

  final Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name$translations
      _instance;

  final TRes Function(
          Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name$translations(
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

class _CopyWithStubImpl$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name$translations<
        TRes>
    implements
        CopyWith$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name$translations<
            TRes> {
  _CopyWithStubImpl$Query$getRestaurantItems$restaurant_item$options$item_options$choices$option_choices$name$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$getRestaurantOperators {
  factory Variables$Query$getRestaurantOperators({required int restaurantId}) =>
      Variables$Query$getRestaurantOperators._({
        r'restaurantId': restaurantId,
      });

  Variables$Query$getRestaurantOperators._(this._$data);

  factory Variables$Query$getRestaurantOperators.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$restaurantId = data['restaurantId'];
    result$data['restaurantId'] = (l$restaurantId as int);
    return Variables$Query$getRestaurantOperators._(result$data);
  }

  Map<String, dynamic> _$data;

  int get restaurantId => (_$data['restaurantId'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$restaurantId = restaurantId;
    result$data['restaurantId'] = l$restaurantId;
    return result$data;
  }

  CopyWith$Variables$Query$getRestaurantOperators<
          Variables$Query$getRestaurantOperators>
      get copyWith => CopyWith$Variables$Query$getRestaurantOperators(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getRestaurantOperators) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$restaurantId = restaurantId;
    final lOther$restaurantId = other.restaurantId;
    if (l$restaurantId != lOther$restaurantId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$restaurantId = restaurantId;
    return Object.hashAll([l$restaurantId]);
  }
}

abstract class CopyWith$Variables$Query$getRestaurantOperators<TRes> {
  factory CopyWith$Variables$Query$getRestaurantOperators(
    Variables$Query$getRestaurantOperators instance,
    TRes Function(Variables$Query$getRestaurantOperators) then,
  ) = _CopyWithImpl$Variables$Query$getRestaurantOperators;

  factory CopyWith$Variables$Query$getRestaurantOperators.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getRestaurantOperators;

  TRes call({int? restaurantId});
}

class _CopyWithImpl$Variables$Query$getRestaurantOperators<TRes>
    implements CopyWith$Variables$Query$getRestaurantOperators<TRes> {
  _CopyWithImpl$Variables$Query$getRestaurantOperators(
    this._instance,
    this._then,
  );

  final Variables$Query$getRestaurantOperators _instance;

  final TRes Function(Variables$Query$getRestaurantOperators) _then;

  static const _undefined = {};

  TRes call({Object? restaurantId = _undefined}) =>
      _then(Variables$Query$getRestaurantOperators._({
        ..._instance._$data,
        if (restaurantId != _undefined && restaurantId != null)
          'restaurantId': (restaurantId as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$getRestaurantOperators<TRes>
    implements CopyWith$Variables$Query$getRestaurantOperators<TRes> {
  _CopyWithStubImpl$Variables$Query$getRestaurantOperators(this._res);

  TRes _res;

  call({int? restaurantId}) => _res;
}

class Query$getRestaurantOperators {
  Query$getRestaurantOperators({
    this.restaurant_by_pk,
    required this.$__typename,
  });

  factory Query$getRestaurantOperators.fromJson(Map<String, dynamic> json) {
    final l$restaurant_by_pk = json['restaurant_by_pk'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurantOperators(
      restaurant_by_pk: l$restaurant_by_pk == null
          ? null
          : Query$getRestaurantOperators$restaurant_by_pk.fromJson(
              (l$restaurant_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getRestaurantOperators$restaurant_by_pk? restaurant_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$restaurant_by_pk = restaurant_by_pk;
    _resultData['restaurant_by_pk'] = l$restaurant_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$restaurant_by_pk = restaurant_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$restaurant_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getRestaurantOperators) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$restaurant_by_pk = restaurant_by_pk;
    final lOther$restaurant_by_pk = other.restaurant_by_pk;
    if (l$restaurant_by_pk != lOther$restaurant_by_pk) {
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

extension UtilityExtension$Query$getRestaurantOperators
    on Query$getRestaurantOperators {
  CopyWith$Query$getRestaurantOperators<Query$getRestaurantOperators>
      get copyWith => CopyWith$Query$getRestaurantOperators(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurantOperators<TRes> {
  factory CopyWith$Query$getRestaurantOperators(
    Query$getRestaurantOperators instance,
    TRes Function(Query$getRestaurantOperators) then,
  ) = _CopyWithImpl$Query$getRestaurantOperators;

  factory CopyWith$Query$getRestaurantOperators.stub(TRes res) =
      _CopyWithStubImpl$Query$getRestaurantOperators;

  TRes call({
    Query$getRestaurantOperators$restaurant_by_pk? restaurant_by_pk,
    String? $__typename,
  });
  CopyWith$Query$getRestaurantOperators$restaurant_by_pk<TRes>
      get restaurant_by_pk;
}

class _CopyWithImpl$Query$getRestaurantOperators<TRes>
    implements CopyWith$Query$getRestaurantOperators<TRes> {
  _CopyWithImpl$Query$getRestaurantOperators(
    this._instance,
    this._then,
  );

  final Query$getRestaurantOperators _instance;

  final TRes Function(Query$getRestaurantOperators) _then;

  static const _undefined = {};

  TRes call({
    Object? restaurant_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getRestaurantOperators(
        restaurant_by_pk: restaurant_by_pk == _undefined
            ? _instance.restaurant_by_pk
            : (restaurant_by_pk
                as Query$getRestaurantOperators$restaurant_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getRestaurantOperators$restaurant_by_pk<TRes>
      get restaurant_by_pk {
    final local$restaurant_by_pk = _instance.restaurant_by_pk;
    return local$restaurant_by_pk == null
        ? CopyWith$Query$getRestaurantOperators$restaurant_by_pk.stub(
            _then(_instance))
        : CopyWith$Query$getRestaurantOperators$restaurant_by_pk(
            local$restaurant_by_pk, (e) => call(restaurant_by_pk: e));
  }
}

class _CopyWithStubImpl$Query$getRestaurantOperators<TRes>
    implements CopyWith$Query$getRestaurantOperators<TRes> {
  _CopyWithStubImpl$Query$getRestaurantOperators(this._res);

  TRes _res;

  call({
    Query$getRestaurantOperators$restaurant_by_pk? restaurant_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getRestaurantOperators$restaurant_by_pk<TRes>
      get restaurant_by_pk =>
          CopyWith$Query$getRestaurantOperators$restaurant_by_pk.stub(_res);
}

const documentNodeQuerygetRestaurantOperators = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getRestaurantOperators'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'restaurantId')),
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
        name: NameNode(value: 'restaurant_by_pk'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'restaurantId')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'restaurant_operators'),
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
                name: NameNode(value: 'current_gps'),
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
                name: NameNode(value: 'restaurant_id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'owner'),
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
                    name: NameNode(value: 'phone'),
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
                    name: NameNode(value: 'language_id'),
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
                    name: NameNode(value: 'firebase_id'),
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
Query$getRestaurantOperators _parserFn$Query$getRestaurantOperators(
        Map<String, dynamic> data) =>
    Query$getRestaurantOperators.fromJson(data);

class Options$Query$getRestaurantOperators
    extends graphql.QueryOptions<Query$getRestaurantOperators> {
  Options$Query$getRestaurantOperators({
    String? operationName,
    required Variables$Query$getRestaurantOperators variables,
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
          document: documentNodeQuerygetRestaurantOperators,
          parserFn: _parserFn$Query$getRestaurantOperators,
        );
}

class WatchOptions$Query$getRestaurantOperators
    extends graphql.WatchQueryOptions<Query$getRestaurantOperators> {
  WatchOptions$Query$getRestaurantOperators({
    String? operationName,
    required Variables$Query$getRestaurantOperators variables,
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
          document: documentNodeQuerygetRestaurantOperators,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getRestaurantOperators,
        );
}

class FetchMoreOptions$Query$getRestaurantOperators
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getRestaurantOperators({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getRestaurantOperators variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetRestaurantOperators,
        );
}

extension ClientExtension$Query$getRestaurantOperators
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getRestaurantOperators>>
      query$getRestaurantOperators(
              Options$Query$getRestaurantOperators options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$getRestaurantOperators>
      watchQuery$getRestaurantOperators(
              WatchOptions$Query$getRestaurantOperators options) =>
          this.watchQuery(options);
  void writeQuery$getRestaurantOperators({
    required Query$getRestaurantOperators data,
    required Variables$Query$getRestaurantOperators variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQuerygetRestaurantOperators),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getRestaurantOperators? readQuery$getRestaurantOperators({
    required Variables$Query$getRestaurantOperators variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQuerygetRestaurantOperators),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$getRestaurantOperators.fromJson(result);
  }
}

class Query$getRestaurantOperators$restaurant_by_pk {
  Query$getRestaurantOperators$restaurant_by_pk({
    required this.restaurant_operators,
    required this.$__typename,
  });

  factory Query$getRestaurantOperators$restaurant_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$restaurant_operators = json['restaurant_operators'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurantOperators$restaurant_by_pk(
      restaurant_operators: (l$restaurant_operators as List<dynamic>)
          .map((e) =>
              Query$getRestaurantOperators$restaurant_by_pk$restaurant_operators
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$getRestaurantOperators$restaurant_by_pk$restaurant_operators>
      restaurant_operators;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$restaurant_operators = restaurant_operators;
    _resultData['restaurant_operators'] =
        l$restaurant_operators.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$restaurant_operators = restaurant_operators;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$restaurant_operators.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getRestaurantOperators$restaurant_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$restaurant_operators = restaurant_operators;
    final lOther$restaurant_operators = other.restaurant_operators;
    if (l$restaurant_operators.length != lOther$restaurant_operators.length) {
      return false;
    }
    for (int i = 0; i < l$restaurant_operators.length; i++) {
      final l$restaurant_operators$entry = l$restaurant_operators[i];
      final lOther$restaurant_operators$entry = lOther$restaurant_operators[i];
      if (l$restaurant_operators$entry != lOther$restaurant_operators$entry) {
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

extension UtilityExtension$Query$getRestaurantOperators$restaurant_by_pk
    on Query$getRestaurantOperators$restaurant_by_pk {
  CopyWith$Query$getRestaurantOperators$restaurant_by_pk<
          Query$getRestaurantOperators$restaurant_by_pk>
      get copyWith => CopyWith$Query$getRestaurantOperators$restaurant_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurantOperators$restaurant_by_pk<TRes> {
  factory CopyWith$Query$getRestaurantOperators$restaurant_by_pk(
    Query$getRestaurantOperators$restaurant_by_pk instance,
    TRes Function(Query$getRestaurantOperators$restaurant_by_pk) then,
  ) = _CopyWithImpl$Query$getRestaurantOperators$restaurant_by_pk;

  factory CopyWith$Query$getRestaurantOperators$restaurant_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getRestaurantOperators$restaurant_by_pk;

  TRes call({
    List<Query$getRestaurantOperators$restaurant_by_pk$restaurant_operators>?
        restaurant_operators,
    String? $__typename,
  });
  TRes restaurant_operators(
      Iterable<Query$getRestaurantOperators$restaurant_by_pk$restaurant_operators> Function(
              Iterable<
                  CopyWith$Query$getRestaurantOperators$restaurant_by_pk$restaurant_operators<
                      Query$getRestaurantOperators$restaurant_by_pk$restaurant_operators>>)
          _fn);
}

class _CopyWithImpl$Query$getRestaurantOperators$restaurant_by_pk<TRes>
    implements CopyWith$Query$getRestaurantOperators$restaurant_by_pk<TRes> {
  _CopyWithImpl$Query$getRestaurantOperators$restaurant_by_pk(
    this._instance,
    this._then,
  );

  final Query$getRestaurantOperators$restaurant_by_pk _instance;

  final TRes Function(Query$getRestaurantOperators$restaurant_by_pk) _then;

  static const _undefined = {};

  TRes call({
    Object? restaurant_operators = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getRestaurantOperators$restaurant_by_pk(
        restaurant_operators: restaurant_operators == _undefined ||
                restaurant_operators == null
            ? _instance.restaurant_operators
            : (restaurant_operators as List<
                Query$getRestaurantOperators$restaurant_by_pk$restaurant_operators>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes restaurant_operators(
          Iterable<Query$getRestaurantOperators$restaurant_by_pk$restaurant_operators> Function(
                  Iterable<
                      CopyWith$Query$getRestaurantOperators$restaurant_by_pk$restaurant_operators<
                          Query$getRestaurantOperators$restaurant_by_pk$restaurant_operators>>)
              _fn) =>
      call(
          restaurant_operators: _fn(_instance.restaurant_operators.map((e) =>
              CopyWith$Query$getRestaurantOperators$restaurant_by_pk$restaurant_operators(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getRestaurantOperators$restaurant_by_pk<TRes>
    implements CopyWith$Query$getRestaurantOperators$restaurant_by_pk<TRes> {
  _CopyWithStubImpl$Query$getRestaurantOperators$restaurant_by_pk(this._res);

  TRes _res;

  call({
    List<Query$getRestaurantOperators$restaurant_by_pk$restaurant_operators>?
        restaurant_operators,
    String? $__typename,
  }) =>
      _res;
  restaurant_operators(_fn) => _res;
}

class Query$getRestaurantOperators$restaurant_by_pk$restaurant_operators {
  Query$getRestaurantOperators$restaurant_by_pk$restaurant_operators({
    required this.id,
    this.current_gps,
    required this.status,
    required this.restaurant_id,
    required this.owner,
    required this.user,
    required this.$__typename,
  });

  factory Query$getRestaurantOperators$restaurant_by_pk$restaurant_operators.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$current_gps = json['current_gps'];
    final l$status = json['status'];
    final l$restaurant_id = json['restaurant_id'];
    final l$owner = json['owner'];
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurantOperators$restaurant_by_pk$restaurant_operators(
      id: (l$id as int),
      current_gps:
          l$current_gps == null ? null : geographyFromJson(l$current_gps),
      status: (l$status as String),
      restaurant_id: (l$restaurant_id as int),
      owner: (l$owner as bool),
      user:
          Query$getRestaurantOperators$restaurant_by_pk$restaurant_operators$user
              .fromJson((l$user as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final Geography? current_gps;

  final String status;

  final int restaurant_id;

  final bool owner;

  final Query$getRestaurantOperators$restaurant_by_pk$restaurant_operators$user
      user;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$current_gps = current_gps;
    _resultData['current_gps'] =
        l$current_gps == null ? null : geographyToJson(l$current_gps);
    final l$status = status;
    _resultData['status'] = l$status;
    final l$restaurant_id = restaurant_id;
    _resultData['restaurant_id'] = l$restaurant_id;
    final l$owner = owner;
    _resultData['owner'] = l$owner;
    final l$user = user;
    _resultData['user'] = l$user.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$current_gps = current_gps;
    final l$status = status;
    final l$restaurant_id = restaurant_id;
    final l$owner = owner;
    final l$user = user;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$current_gps,
      l$status,
      l$restaurant_id,
      l$owner,
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
            is Query$getRestaurantOperators$restaurant_by_pk$restaurant_operators) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$current_gps = current_gps;
    final lOther$current_gps = other.current_gps;
    if (l$current_gps != lOther$current_gps) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$restaurant_id = restaurant_id;
    final lOther$restaurant_id = other.restaurant_id;
    if (l$restaurant_id != lOther$restaurant_id) {
      return false;
    }
    final l$owner = owner;
    final lOther$owner = other.owner;
    if (l$owner != lOther$owner) {
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

extension UtilityExtension$Query$getRestaurantOperators$restaurant_by_pk$restaurant_operators
    on Query$getRestaurantOperators$restaurant_by_pk$restaurant_operators {
  CopyWith$Query$getRestaurantOperators$restaurant_by_pk$restaurant_operators<
          Query$getRestaurantOperators$restaurant_by_pk$restaurant_operators>
      get copyWith =>
          CopyWith$Query$getRestaurantOperators$restaurant_by_pk$restaurant_operators(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurantOperators$restaurant_by_pk$restaurant_operators<
    TRes> {
  factory CopyWith$Query$getRestaurantOperators$restaurant_by_pk$restaurant_operators(
    Query$getRestaurantOperators$restaurant_by_pk$restaurant_operators instance,
    TRes Function(
            Query$getRestaurantOperators$restaurant_by_pk$restaurant_operators)
        then,
  ) = _CopyWithImpl$Query$getRestaurantOperators$restaurant_by_pk$restaurant_operators;

  factory CopyWith$Query$getRestaurantOperators$restaurant_by_pk$restaurant_operators.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getRestaurantOperators$restaurant_by_pk$restaurant_operators;

  TRes call({
    int? id,
    Geography? current_gps,
    String? status,
    int? restaurant_id,
    bool? owner,
    Query$getRestaurantOperators$restaurant_by_pk$restaurant_operators$user?
        user,
    String? $__typename,
  });
  CopyWith$Query$getRestaurantOperators$restaurant_by_pk$restaurant_operators$user<
      TRes> get user;
}

class _CopyWithImpl$Query$getRestaurantOperators$restaurant_by_pk$restaurant_operators<
        TRes>
    implements
        CopyWith$Query$getRestaurantOperators$restaurant_by_pk$restaurant_operators<
            TRes> {
  _CopyWithImpl$Query$getRestaurantOperators$restaurant_by_pk$restaurant_operators(
    this._instance,
    this._then,
  );

  final Query$getRestaurantOperators$restaurant_by_pk$restaurant_operators
      _instance;

  final TRes Function(
      Query$getRestaurantOperators$restaurant_by_pk$restaurant_operators) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? current_gps = _undefined,
    Object? status = _undefined,
    Object? restaurant_id = _undefined,
    Object? owner = _undefined,
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getRestaurantOperators$restaurant_by_pk$restaurant_operators(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        current_gps: current_gps == _undefined
            ? _instance.current_gps
            : (current_gps as Geography?),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as String),
        restaurant_id: restaurant_id == _undefined || restaurant_id == null
            ? _instance.restaurant_id
            : (restaurant_id as int),
        owner: owner == _undefined || owner == null
            ? _instance.owner
            : (owner as bool),
        user: user == _undefined || user == null
            ? _instance.user
            : (user
                as Query$getRestaurantOperators$restaurant_by_pk$restaurant_operators$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getRestaurantOperators$restaurant_by_pk$restaurant_operators$user<
      TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Query$getRestaurantOperators$restaurant_by_pk$restaurant_operators$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Query$getRestaurantOperators$restaurant_by_pk$restaurant_operators<
        TRes>
    implements
        CopyWith$Query$getRestaurantOperators$restaurant_by_pk$restaurant_operators<
            TRes> {
  _CopyWithStubImpl$Query$getRestaurantOperators$restaurant_by_pk$restaurant_operators(
      this._res);

  TRes _res;

  call({
    int? id,
    Geography? current_gps,
    String? status,
    int? restaurant_id,
    bool? owner,
    Query$getRestaurantOperators$restaurant_by_pk$restaurant_operators$user?
        user,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getRestaurantOperators$restaurant_by_pk$restaurant_operators$user<
          TRes>
      get user =>
          CopyWith$Query$getRestaurantOperators$restaurant_by_pk$restaurant_operators$user
              .stub(_res);
}

class Query$getRestaurantOperators$restaurant_by_pk$restaurant_operators$user {
  Query$getRestaurantOperators$restaurant_by_pk$restaurant_operators$user({
    this.phone,
    this.name,
    this.image,
    required this.language_id,
    required this.id,
    required this.firebase_id,
    required this.$__typename,
  });

  factory Query$getRestaurantOperators$restaurant_by_pk$restaurant_operators$user.fromJson(
      Map<String, dynamic> json) {
    final l$phone = json['phone'];
    final l$name = json['name'];
    final l$image = json['image'];
    final l$language_id = json['language_id'];
    final l$id = json['id'];
    final l$firebase_id = json['firebase_id'];
    final l$$__typename = json['__typename'];
    return Query$getRestaurantOperators$restaurant_by_pk$restaurant_operators$user(
      phone: (l$phone as String?),
      name: (l$name as String?),
      image: (l$image as String?),
      language_id: (l$language_id as String),
      id: (l$id as int),
      firebase_id: (l$firebase_id as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String? phone;

  final String? name;

  final String? image;

  final String language_id;

  final int id;

  final String firebase_id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$phone = phone;
    _resultData['phone'] = l$phone;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$language_id = language_id;
    _resultData['language_id'] = l$language_id;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$firebase_id = firebase_id;
    _resultData['firebase_id'] = l$firebase_id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$phone = phone;
    final l$name = name;
    final l$image = image;
    final l$language_id = language_id;
    final l$id = id;
    final l$firebase_id = firebase_id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$phone,
      l$name,
      l$image,
      l$language_id,
      l$id,
      l$firebase_id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$getRestaurantOperators$restaurant_by_pk$restaurant_operators$user) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$phone = phone;
    final lOther$phone = other.phone;
    if (l$phone != lOther$phone) {
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
    final l$language_id = language_id;
    final lOther$language_id = other.language_id;
    if (l$language_id != lOther$language_id) {
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$getRestaurantOperators$restaurant_by_pk$restaurant_operators$user
    on Query$getRestaurantOperators$restaurant_by_pk$restaurant_operators$user {
  CopyWith$Query$getRestaurantOperators$restaurant_by_pk$restaurant_operators$user<
          Query$getRestaurantOperators$restaurant_by_pk$restaurant_operators$user>
      get copyWith =>
          CopyWith$Query$getRestaurantOperators$restaurant_by_pk$restaurant_operators$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getRestaurantOperators$restaurant_by_pk$restaurant_operators$user<
    TRes> {
  factory CopyWith$Query$getRestaurantOperators$restaurant_by_pk$restaurant_operators$user(
    Query$getRestaurantOperators$restaurant_by_pk$restaurant_operators$user
        instance,
    TRes Function(
            Query$getRestaurantOperators$restaurant_by_pk$restaurant_operators$user)
        then,
  ) = _CopyWithImpl$Query$getRestaurantOperators$restaurant_by_pk$restaurant_operators$user;

  factory CopyWith$Query$getRestaurantOperators$restaurant_by_pk$restaurant_operators$user.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getRestaurantOperators$restaurant_by_pk$restaurant_operators$user;

  TRes call({
    String? phone,
    String? name,
    String? image,
    String? language_id,
    int? id,
    String? firebase_id,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getRestaurantOperators$restaurant_by_pk$restaurant_operators$user<
        TRes>
    implements
        CopyWith$Query$getRestaurantOperators$restaurant_by_pk$restaurant_operators$user<
            TRes> {
  _CopyWithImpl$Query$getRestaurantOperators$restaurant_by_pk$restaurant_operators$user(
    this._instance,
    this._then,
  );

  final Query$getRestaurantOperators$restaurant_by_pk$restaurant_operators$user
      _instance;

  final TRes Function(
          Query$getRestaurantOperators$restaurant_by_pk$restaurant_operators$user)
      _then;

  static const _undefined = {};

  TRes call({
    Object? phone = _undefined,
    Object? name = _undefined,
    Object? image = _undefined,
    Object? language_id = _undefined,
    Object? id = _undefined,
    Object? firebase_id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getRestaurantOperators$restaurant_by_pk$restaurant_operators$user(
        phone: phone == _undefined ? _instance.phone : (phone as String?),
        name: name == _undefined ? _instance.name : (name as String?),
        image: image == _undefined ? _instance.image : (image as String?),
        language_id: language_id == _undefined || language_id == null
            ? _instance.language_id
            : (language_id as String),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        firebase_id: firebase_id == _undefined || firebase_id == null
            ? _instance.firebase_id
            : (firebase_id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getRestaurantOperators$restaurant_by_pk$restaurant_operators$user<
        TRes>
    implements
        CopyWith$Query$getRestaurantOperators$restaurant_by_pk$restaurant_operators$user<
            TRes> {
  _CopyWithStubImpl$Query$getRestaurantOperators$restaurant_by_pk$restaurant_operators$user(
      this._res);

  TRes _res;

  call({
    String? phone,
    String? name,
    String? image,
    String? language_id,
    int? id,
    String? firebase_id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$get_restaurant_review_average {
  factory Variables$Query$get_restaurant_review_average(
          {required int restaurantId}) =>
      Variables$Query$get_restaurant_review_average._({
        r'restaurantId': restaurantId,
      });

  Variables$Query$get_restaurant_review_average._(this._$data);

  factory Variables$Query$get_restaurant_review_average.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$restaurantId = data['restaurantId'];
    result$data['restaurantId'] = (l$restaurantId as int);
    return Variables$Query$get_restaurant_review_average._(result$data);
  }

  Map<String, dynamic> _$data;

  int get restaurantId => (_$data['restaurantId'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$restaurantId = restaurantId;
    result$data['restaurantId'] = l$restaurantId;
    return result$data;
  }

  CopyWith$Variables$Query$get_restaurant_review_average<
          Variables$Query$get_restaurant_review_average>
      get copyWith => CopyWith$Variables$Query$get_restaurant_review_average(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$get_restaurant_review_average) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$restaurantId = restaurantId;
    final lOther$restaurantId = other.restaurantId;
    if (l$restaurantId != lOther$restaurantId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$restaurantId = restaurantId;
    return Object.hashAll([l$restaurantId]);
  }
}

abstract class CopyWith$Variables$Query$get_restaurant_review_average<TRes> {
  factory CopyWith$Variables$Query$get_restaurant_review_average(
    Variables$Query$get_restaurant_review_average instance,
    TRes Function(Variables$Query$get_restaurant_review_average) then,
  ) = _CopyWithImpl$Variables$Query$get_restaurant_review_average;

  factory CopyWith$Variables$Query$get_restaurant_review_average.stub(
          TRes res) =
      _CopyWithStubImpl$Variables$Query$get_restaurant_review_average;

  TRes call({int? restaurantId});
}

class _CopyWithImpl$Variables$Query$get_restaurant_review_average<TRes>
    implements CopyWith$Variables$Query$get_restaurant_review_average<TRes> {
  _CopyWithImpl$Variables$Query$get_restaurant_review_average(
    this._instance,
    this._then,
  );

  final Variables$Query$get_restaurant_review_average _instance;

  final TRes Function(Variables$Query$get_restaurant_review_average) _then;

  static const _undefined = {};

  TRes call({Object? restaurantId = _undefined}) =>
      _then(Variables$Query$get_restaurant_review_average._({
        ..._instance._$data,
        if (restaurantId != _undefined && restaurantId != null)
          'restaurantId': (restaurantId as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$get_restaurant_review_average<TRes>
    implements CopyWith$Variables$Query$get_restaurant_review_average<TRes> {
  _CopyWithStubImpl$Variables$Query$get_restaurant_review_average(this._res);

  TRes _res;

  call({int? restaurantId}) => _res;
}

class Query$get_restaurant_review_average {
  Query$get_restaurant_review_average({
    this.restaurant_by_pk,
    required this.$__typename,
  });

  factory Query$get_restaurant_review_average.fromJson(
      Map<String, dynamic> json) {
    final l$restaurant_by_pk = json['restaurant_by_pk'];
    final l$$__typename = json['__typename'];
    return Query$get_restaurant_review_average(
      restaurant_by_pk: l$restaurant_by_pk == null
          ? null
          : Query$get_restaurant_review_average$restaurant_by_pk.fromJson(
              (l$restaurant_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$get_restaurant_review_average$restaurant_by_pk? restaurant_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$restaurant_by_pk = restaurant_by_pk;
    _resultData['restaurant_by_pk'] = l$restaurant_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$restaurant_by_pk = restaurant_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$restaurant_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_restaurant_review_average) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$restaurant_by_pk = restaurant_by_pk;
    final lOther$restaurant_by_pk = other.restaurant_by_pk;
    if (l$restaurant_by_pk != lOther$restaurant_by_pk) {
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

extension UtilityExtension$Query$get_restaurant_review_average
    on Query$get_restaurant_review_average {
  CopyWith$Query$get_restaurant_review_average<
          Query$get_restaurant_review_average>
      get copyWith => CopyWith$Query$get_restaurant_review_average(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_restaurant_review_average<TRes> {
  factory CopyWith$Query$get_restaurant_review_average(
    Query$get_restaurant_review_average instance,
    TRes Function(Query$get_restaurant_review_average) then,
  ) = _CopyWithImpl$Query$get_restaurant_review_average;

  factory CopyWith$Query$get_restaurant_review_average.stub(TRes res) =
      _CopyWithStubImpl$Query$get_restaurant_review_average;

  TRes call({
    Query$get_restaurant_review_average$restaurant_by_pk? restaurant_by_pk,
    String? $__typename,
  });
  CopyWith$Query$get_restaurant_review_average$restaurant_by_pk<TRes>
      get restaurant_by_pk;
}

class _CopyWithImpl$Query$get_restaurant_review_average<TRes>
    implements CopyWith$Query$get_restaurant_review_average<TRes> {
  _CopyWithImpl$Query$get_restaurant_review_average(
    this._instance,
    this._then,
  );

  final Query$get_restaurant_review_average _instance;

  final TRes Function(Query$get_restaurant_review_average) _then;

  static const _undefined = {};

  TRes call({
    Object? restaurant_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_restaurant_review_average(
        restaurant_by_pk: restaurant_by_pk == _undefined
            ? _instance.restaurant_by_pk
            : (restaurant_by_pk
                as Query$get_restaurant_review_average$restaurant_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_restaurant_review_average$restaurant_by_pk<TRes>
      get restaurant_by_pk {
    final local$restaurant_by_pk = _instance.restaurant_by_pk;
    return local$restaurant_by_pk == null
        ? CopyWith$Query$get_restaurant_review_average$restaurant_by_pk.stub(
            _then(_instance))
        : CopyWith$Query$get_restaurant_review_average$restaurant_by_pk(
            local$restaurant_by_pk, (e) => call(restaurant_by_pk: e));
  }
}

class _CopyWithStubImpl$Query$get_restaurant_review_average<TRes>
    implements CopyWith$Query$get_restaurant_review_average<TRes> {
  _CopyWithStubImpl$Query$get_restaurant_review_average(this._res);

  TRes _res;

  call({
    Query$get_restaurant_review_average$restaurant_by_pk? restaurant_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_restaurant_review_average$restaurant_by_pk<TRes>
      get restaurant_by_pk =>
          CopyWith$Query$get_restaurant_review_average$restaurant_by_pk.stub(
              _res);
}

const documentNodeQueryget_restaurant_review_average =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'get_restaurant_review_average'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'restaurantId')),
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
        name: NameNode(value: 'restaurant_by_pk'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'restaurantId')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'reviews_aggregate'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'where'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: 'from_entity_type'),
                    value: ObjectValueNode(fields: [
                      ObjectFieldNode(
                        name: NameNode(value: '_eq'),
                        value: StringValueNode(
                          value: 'customer',
                          isBlock: false,
                        ),
                      )
                    ]),
                  )
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
Query$get_restaurant_review_average
    _parserFn$Query$get_restaurant_review_average(Map<String, dynamic> data) =>
        Query$get_restaurant_review_average.fromJson(data);

class Options$Query$get_restaurant_review_average
    extends graphql.QueryOptions<Query$get_restaurant_review_average> {
  Options$Query$get_restaurant_review_average({
    String? operationName,
    required Variables$Query$get_restaurant_review_average variables,
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
          document: documentNodeQueryget_restaurant_review_average,
          parserFn: _parserFn$Query$get_restaurant_review_average,
        );
}

class WatchOptions$Query$get_restaurant_review_average
    extends graphql.WatchQueryOptions<Query$get_restaurant_review_average> {
  WatchOptions$Query$get_restaurant_review_average({
    String? operationName,
    required Variables$Query$get_restaurant_review_average variables,
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
          document: documentNodeQueryget_restaurant_review_average,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$get_restaurant_review_average,
        );
}

class FetchMoreOptions$Query$get_restaurant_review_average
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$get_restaurant_review_average({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$get_restaurant_review_average variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryget_restaurant_review_average,
        );
}

extension ClientExtension$Query$get_restaurant_review_average
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$get_restaurant_review_average>>
      query$get_restaurant_review_average(
              Options$Query$get_restaurant_review_average options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$get_restaurant_review_average>
      watchQuery$get_restaurant_review_average(
              WatchOptions$Query$get_restaurant_review_average options) =>
          this.watchQuery(options);
  void writeQuery$get_restaurant_review_average({
    required Query$get_restaurant_review_average data,
    required Variables$Query$get_restaurant_review_average variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryget_restaurant_review_average),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$get_restaurant_review_average? readQuery$get_restaurant_review_average({
    required Variables$Query$get_restaurant_review_average variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQueryget_restaurant_review_average),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$get_restaurant_review_average.fromJson(result);
  }
}

class Query$get_restaurant_review_average$restaurant_by_pk {
  Query$get_restaurant_review_average$restaurant_by_pk({
    required this.reviews_aggregate,
    required this.$__typename,
  });

  factory Query$get_restaurant_review_average$restaurant_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$reviews_aggregate = json['reviews_aggregate'];
    final l$$__typename = json['__typename'];
    return Query$get_restaurant_review_average$restaurant_by_pk(
      reviews_aggregate:
          Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate
              .fromJson((l$reviews_aggregate as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate
      reviews_aggregate;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$reviews_aggregate = reviews_aggregate;
    _resultData['reviews_aggregate'] = l$reviews_aggregate.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$reviews_aggregate = reviews_aggregate;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$reviews_aggregate,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_restaurant_review_average$restaurant_by_pk) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$get_restaurant_review_average$restaurant_by_pk
    on Query$get_restaurant_review_average$restaurant_by_pk {
  CopyWith$Query$get_restaurant_review_average$restaurant_by_pk<
          Query$get_restaurant_review_average$restaurant_by_pk>
      get copyWith =>
          CopyWith$Query$get_restaurant_review_average$restaurant_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_restaurant_review_average$restaurant_by_pk<
    TRes> {
  factory CopyWith$Query$get_restaurant_review_average$restaurant_by_pk(
    Query$get_restaurant_review_average$restaurant_by_pk instance,
    TRes Function(Query$get_restaurant_review_average$restaurant_by_pk) then,
  ) = _CopyWithImpl$Query$get_restaurant_review_average$restaurant_by_pk;

  factory CopyWith$Query$get_restaurant_review_average$restaurant_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_restaurant_review_average$restaurant_by_pk;

  TRes call({
    Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate?
        reviews_aggregate,
    String? $__typename,
  });
  CopyWith$Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate<
      TRes> get reviews_aggregate;
}

class _CopyWithImpl$Query$get_restaurant_review_average$restaurant_by_pk<TRes>
    implements
        CopyWith$Query$get_restaurant_review_average$restaurant_by_pk<TRes> {
  _CopyWithImpl$Query$get_restaurant_review_average$restaurant_by_pk(
    this._instance,
    this._then,
  );

  final Query$get_restaurant_review_average$restaurant_by_pk _instance;

  final TRes Function(Query$get_restaurant_review_average$restaurant_by_pk)
      _then;

  static const _undefined = {};

  TRes call({
    Object? reviews_aggregate = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_restaurant_review_average$restaurant_by_pk(
        reviews_aggregate: reviews_aggregate == _undefined ||
                reviews_aggregate == null
            ? _instance.reviews_aggregate
            : (reviews_aggregate
                as Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate<
      TRes> get reviews_aggregate {
    final local$reviews_aggregate = _instance.reviews_aggregate;
    return CopyWith$Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate(
        local$reviews_aggregate, (e) => call(reviews_aggregate: e));
  }
}

class _CopyWithStubImpl$Query$get_restaurant_review_average$restaurant_by_pk<
        TRes>
    implements
        CopyWith$Query$get_restaurant_review_average$restaurant_by_pk<TRes> {
  _CopyWithStubImpl$Query$get_restaurant_review_average$restaurant_by_pk(
      this._res);

  TRes _res;

  call({
    Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate?
        reviews_aggregate,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate<
          TRes>
      get reviews_aggregate =>
          CopyWith$Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate
              .stub(_res);
}

class Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate {
  Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate({
    this.aggregate,
    required this.$__typename,
  });

  factory Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate.fromJson(
      Map<String, dynamic> json) {
    final l$aggregate = json['aggregate'];
    final l$$__typename = json['__typename'];
    return Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate(
      aggregate: l$aggregate == null
          ? null
          : Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate$aggregate
              .fromJson((l$aggregate as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate$aggregate?
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
            is Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate) ||
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

extension UtilityExtension$Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate
    on Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate {
  CopyWith$Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate<
          Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate>
      get copyWith =>
          CopyWith$Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate<
    TRes> {
  factory CopyWith$Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate(
    Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate
        instance,
    TRes Function(
            Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate)
        then,
  ) = _CopyWithImpl$Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate;

  factory CopyWith$Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate;

  TRes call({
    Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate$aggregate?
        aggregate,
    String? $__typename,
  });
  CopyWith$Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate$aggregate<
      TRes> get aggregate;
}

class _CopyWithImpl$Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate<
        TRes>
    implements
        CopyWith$Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate<
            TRes> {
  _CopyWithImpl$Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate(
    this._instance,
    this._then,
  );

  final Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate
      _instance;

  final TRes Function(
          Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate)
      _then;

  static const _undefined = {};

  TRes call({
    Object? aggregate = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate(
        aggregate: aggregate == _undefined
            ? _instance.aggregate
            : (aggregate
                as Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate$aggregate?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate$aggregate<
      TRes> get aggregate {
    final local$aggregate = _instance.aggregate;
    return local$aggregate == null
        ? CopyWith$Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate$aggregate
            .stub(_then(_instance))
        : CopyWith$Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate$aggregate(
            local$aggregate, (e) => call(aggregate: e));
  }
}

class _CopyWithStubImpl$Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate<
        TRes>
    implements
        CopyWith$Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate<
            TRes> {
  _CopyWithStubImpl$Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate(
      this._res);

  TRes _res;

  call({
    Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate$aggregate?
        aggregate,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate$aggregate<
          TRes>
      get aggregate =>
          CopyWith$Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate$aggregate
              .stub(_res);
}

class Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate$aggregate {
  Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate$aggregate({
    this.avg,
    required this.$__typename,
  });

  factory Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate$aggregate.fromJson(
      Map<String, dynamic> json) {
    final l$avg = json['avg'];
    final l$$__typename = json['__typename'];
    return Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate$aggregate(
      avg: l$avg == null
          ? null
          : Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate$aggregate$avg
              .fromJson((l$avg as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate$aggregate$avg?
      avg;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$avg = avg;
    _resultData['avg'] = l$avg?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$avg = avg;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$avg,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate$aggregate) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$avg = avg;
    final lOther$avg = other.avg;
    if (l$avg != lOther$avg) {
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

extension UtilityExtension$Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate$aggregate
    on Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate$aggregate {
  CopyWith$Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate$aggregate<
          Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate$aggregate>
      get copyWith =>
          CopyWith$Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate$aggregate(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate$aggregate<
    TRes> {
  factory CopyWith$Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate$aggregate(
    Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate$aggregate
        instance,
    TRes Function(
            Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate$aggregate)
        then,
  ) = _CopyWithImpl$Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate$aggregate;

  factory CopyWith$Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate$aggregate.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate$aggregate;

  TRes call({
    Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate$aggregate$avg?
        avg,
    String? $__typename,
  });
  CopyWith$Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate$aggregate$avg<
      TRes> get avg;
}

class _CopyWithImpl$Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate$aggregate<
        TRes>
    implements
        CopyWith$Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate$aggregate<
            TRes> {
  _CopyWithImpl$Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate$aggregate(
    this._instance,
    this._then,
  );

  final Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate$aggregate
      _instance;

  final TRes Function(
          Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate$aggregate)
      _then;

  static const _undefined = {};

  TRes call({
    Object? avg = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate$aggregate(
        avg: avg == _undefined
            ? _instance.avg
            : (avg
                as Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate$aggregate$avg?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate$aggregate$avg<
      TRes> get avg {
    final local$avg = _instance.avg;
    return local$avg == null
        ? CopyWith$Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate$aggregate$avg
            .stub(_then(_instance))
        : CopyWith$Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate$aggregate$avg(
            local$avg, (e) => call(avg: e));
  }
}

class _CopyWithStubImpl$Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate$aggregate<
        TRes>
    implements
        CopyWith$Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate$aggregate<
            TRes> {
  _CopyWithStubImpl$Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate$aggregate(
      this._res);

  TRes _res;

  call({
    Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate$aggregate$avg?
        avg,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate$aggregate$avg<
          TRes>
      get avg =>
          CopyWith$Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate$aggregate$avg
              .stub(_res);
}

class Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate$aggregate$avg {
  Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate$aggregate$avg({
    this.rating,
    required this.$__typename,
  });

  factory Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate$aggregate$avg.fromJson(
      Map<String, dynamic> json) {
    final l$rating = json['rating'];
    final l$$__typename = json['__typename'];
    return Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate$aggregate$avg(
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
            is Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate$aggregate$avg) ||
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

extension UtilityExtension$Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate$aggregate$avg
    on Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate$aggregate$avg {
  CopyWith$Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate$aggregate$avg<
          Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate$aggregate$avg>
      get copyWith =>
          CopyWith$Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate$aggregate$avg(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate$aggregate$avg<
    TRes> {
  factory CopyWith$Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate$aggregate$avg(
    Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate$aggregate$avg
        instance,
    TRes Function(
            Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate$aggregate$avg)
        then,
  ) = _CopyWithImpl$Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate$aggregate$avg;

  factory CopyWith$Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate$aggregate$avg.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate$aggregate$avg;

  TRes call({
    double? rating,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate$aggregate$avg<
        TRes>
    implements
        CopyWith$Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate$aggregate$avg<
            TRes> {
  _CopyWithImpl$Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate$aggregate$avg(
    this._instance,
    this._then,
  );

  final Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate$aggregate$avg
      _instance;

  final TRes Function(
          Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate$aggregate$avg)
      _then;

  static const _undefined = {};

  TRes call({
    Object? rating = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate$aggregate$avg(
        rating: rating == _undefined ? _instance.rating : (rating as double?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate$aggregate$avg<
        TRes>
    implements
        CopyWith$Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate$aggregate$avg<
            TRes> {
  _CopyWithStubImpl$Query$get_restaurant_review_average$restaurant_by_pk$reviews_aggregate$aggregate$avg(
      this._res);

  TRes _res;

  call({
    double? rating,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$get_restaurant_reviews {
  factory Variables$Query$get_restaurant_reviews({required int restaurantId}) =>
      Variables$Query$get_restaurant_reviews._({
        r'restaurantId': restaurantId,
      });

  Variables$Query$get_restaurant_reviews._(this._$data);

  factory Variables$Query$get_restaurant_reviews.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$restaurantId = data['restaurantId'];
    result$data['restaurantId'] = (l$restaurantId as int);
    return Variables$Query$get_restaurant_reviews._(result$data);
  }

  Map<String, dynamic> _$data;

  int get restaurantId => (_$data['restaurantId'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$restaurantId = restaurantId;
    result$data['restaurantId'] = l$restaurantId;
    return result$data;
  }

  CopyWith$Variables$Query$get_restaurant_reviews<
          Variables$Query$get_restaurant_reviews>
      get copyWith => CopyWith$Variables$Query$get_restaurant_reviews(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$get_restaurant_reviews) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$restaurantId = restaurantId;
    final lOther$restaurantId = other.restaurantId;
    if (l$restaurantId != lOther$restaurantId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$restaurantId = restaurantId;
    return Object.hashAll([l$restaurantId]);
  }
}

abstract class CopyWith$Variables$Query$get_restaurant_reviews<TRes> {
  factory CopyWith$Variables$Query$get_restaurant_reviews(
    Variables$Query$get_restaurant_reviews instance,
    TRes Function(Variables$Query$get_restaurant_reviews) then,
  ) = _CopyWithImpl$Variables$Query$get_restaurant_reviews;

  factory CopyWith$Variables$Query$get_restaurant_reviews.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$get_restaurant_reviews;

  TRes call({int? restaurantId});
}

class _CopyWithImpl$Variables$Query$get_restaurant_reviews<TRes>
    implements CopyWith$Variables$Query$get_restaurant_reviews<TRes> {
  _CopyWithImpl$Variables$Query$get_restaurant_reviews(
    this._instance,
    this._then,
  );

  final Variables$Query$get_restaurant_reviews _instance;

  final TRes Function(Variables$Query$get_restaurant_reviews) _then;

  static const _undefined = {};

  TRes call({Object? restaurantId = _undefined}) =>
      _then(Variables$Query$get_restaurant_reviews._({
        ..._instance._$data,
        if (restaurantId != _undefined && restaurantId != null)
          'restaurantId': (restaurantId as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$get_restaurant_reviews<TRes>
    implements CopyWith$Variables$Query$get_restaurant_reviews<TRes> {
  _CopyWithStubImpl$Variables$Query$get_restaurant_reviews(this._res);

  TRes _res;

  call({int? restaurantId}) => _res;
}

class Query$get_restaurant_reviews {
  Query$get_restaurant_reviews({
    this.restaurant_by_pk,
    required this.$__typename,
  });

  factory Query$get_restaurant_reviews.fromJson(Map<String, dynamic> json) {
    final l$restaurant_by_pk = json['restaurant_by_pk'];
    final l$$__typename = json['__typename'];
    return Query$get_restaurant_reviews(
      restaurant_by_pk: l$restaurant_by_pk == null
          ? null
          : Query$get_restaurant_reviews$restaurant_by_pk.fromJson(
              (l$restaurant_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$get_restaurant_reviews$restaurant_by_pk? restaurant_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$restaurant_by_pk = restaurant_by_pk;
    _resultData['restaurant_by_pk'] = l$restaurant_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$restaurant_by_pk = restaurant_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$restaurant_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_restaurant_reviews) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$restaurant_by_pk = restaurant_by_pk;
    final lOther$restaurant_by_pk = other.restaurant_by_pk;
    if (l$restaurant_by_pk != lOther$restaurant_by_pk) {
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

extension UtilityExtension$Query$get_restaurant_reviews
    on Query$get_restaurant_reviews {
  CopyWith$Query$get_restaurant_reviews<Query$get_restaurant_reviews>
      get copyWith => CopyWith$Query$get_restaurant_reviews(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_restaurant_reviews<TRes> {
  factory CopyWith$Query$get_restaurant_reviews(
    Query$get_restaurant_reviews instance,
    TRes Function(Query$get_restaurant_reviews) then,
  ) = _CopyWithImpl$Query$get_restaurant_reviews;

  factory CopyWith$Query$get_restaurant_reviews.stub(TRes res) =
      _CopyWithStubImpl$Query$get_restaurant_reviews;

  TRes call({
    Query$get_restaurant_reviews$restaurant_by_pk? restaurant_by_pk,
    String? $__typename,
  });
  CopyWith$Query$get_restaurant_reviews$restaurant_by_pk<TRes>
      get restaurant_by_pk;
}

class _CopyWithImpl$Query$get_restaurant_reviews<TRes>
    implements CopyWith$Query$get_restaurant_reviews<TRes> {
  _CopyWithImpl$Query$get_restaurant_reviews(
    this._instance,
    this._then,
  );

  final Query$get_restaurant_reviews _instance;

  final TRes Function(Query$get_restaurant_reviews) _then;

  static const _undefined = {};

  TRes call({
    Object? restaurant_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_restaurant_reviews(
        restaurant_by_pk: restaurant_by_pk == _undefined
            ? _instance.restaurant_by_pk
            : (restaurant_by_pk
                as Query$get_restaurant_reviews$restaurant_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_restaurant_reviews$restaurant_by_pk<TRes>
      get restaurant_by_pk {
    final local$restaurant_by_pk = _instance.restaurant_by_pk;
    return local$restaurant_by_pk == null
        ? CopyWith$Query$get_restaurant_reviews$restaurant_by_pk.stub(
            _then(_instance))
        : CopyWith$Query$get_restaurant_reviews$restaurant_by_pk(
            local$restaurant_by_pk, (e) => call(restaurant_by_pk: e));
  }
}

class _CopyWithStubImpl$Query$get_restaurant_reviews<TRes>
    implements CopyWith$Query$get_restaurant_reviews<TRes> {
  _CopyWithStubImpl$Query$get_restaurant_reviews(this._res);

  TRes _res;

  call({
    Query$get_restaurant_reviews$restaurant_by_pk? restaurant_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_restaurant_reviews$restaurant_by_pk<TRes>
      get restaurant_by_pk =>
          CopyWith$Query$get_restaurant_reviews$restaurant_by_pk.stub(_res);
}

const documentNodeQueryget_restaurant_reviews = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'get_restaurant_reviews'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'restaurantId')),
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
        name: NameNode(value: 'restaurant_by_pk'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'restaurantId')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'reviews'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'where'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: 'from_entity_type'),
                    value: ObjectValueNode(fields: [
                      ObjectFieldNode(
                        name: NameNode(value: '_eq'),
                        value: StringValueNode(
                          value: 'customer',
                          isBlock: false,
                        ),
                      )
                    ]),
                  )
                ]),
              )
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'from_entity_id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'from_entity_type'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'rating'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'note'),
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
                name: NameNode(value: 'to_entity_id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'to_entity_type'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'created_at'),
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
Query$get_restaurant_reviews _parserFn$Query$get_restaurant_reviews(
        Map<String, dynamic> data) =>
    Query$get_restaurant_reviews.fromJson(data);

class Options$Query$get_restaurant_reviews
    extends graphql.QueryOptions<Query$get_restaurant_reviews> {
  Options$Query$get_restaurant_reviews({
    String? operationName,
    required Variables$Query$get_restaurant_reviews variables,
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
          document: documentNodeQueryget_restaurant_reviews,
          parserFn: _parserFn$Query$get_restaurant_reviews,
        );
}

class WatchOptions$Query$get_restaurant_reviews
    extends graphql.WatchQueryOptions<Query$get_restaurant_reviews> {
  WatchOptions$Query$get_restaurant_reviews({
    String? operationName,
    required Variables$Query$get_restaurant_reviews variables,
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
          document: documentNodeQueryget_restaurant_reviews,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$get_restaurant_reviews,
        );
}

class FetchMoreOptions$Query$get_restaurant_reviews
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$get_restaurant_reviews({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$get_restaurant_reviews variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryget_restaurant_reviews,
        );
}

extension ClientExtension$Query$get_restaurant_reviews
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$get_restaurant_reviews>>
      query$get_restaurant_reviews(
              Options$Query$get_restaurant_reviews options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$get_restaurant_reviews>
      watchQuery$get_restaurant_reviews(
              WatchOptions$Query$get_restaurant_reviews options) =>
          this.watchQuery(options);
  void writeQuery$get_restaurant_reviews({
    required Query$get_restaurant_reviews data,
    required Variables$Query$get_restaurant_reviews variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryget_restaurant_reviews),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$get_restaurant_reviews? readQuery$get_restaurant_reviews({
    required Variables$Query$get_restaurant_reviews variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQueryget_restaurant_reviews),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$get_restaurant_reviews.fromJson(result);
  }
}

class Query$get_restaurant_reviews$restaurant_by_pk {
  Query$get_restaurant_reviews$restaurant_by_pk({
    required this.reviews,
    required this.$__typename,
  });

  factory Query$get_restaurant_reviews$restaurant_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$reviews = json['reviews'];
    final l$$__typename = json['__typename'];
    return Query$get_restaurant_reviews$restaurant_by_pk(
      reviews: (l$reviews as List<dynamic>)
          .map((e) =>
              Query$get_restaurant_reviews$restaurant_by_pk$reviews.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$get_restaurant_reviews$restaurant_by_pk$reviews> reviews;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$reviews = reviews;
    _resultData['reviews'] = l$reviews.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$reviews = reviews;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$reviews.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_restaurant_reviews$restaurant_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$reviews = reviews;
    final lOther$reviews = other.reviews;
    if (l$reviews.length != lOther$reviews.length) {
      return false;
    }
    for (int i = 0; i < l$reviews.length; i++) {
      final l$reviews$entry = l$reviews[i];
      final lOther$reviews$entry = lOther$reviews[i];
      if (l$reviews$entry != lOther$reviews$entry) {
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

extension UtilityExtension$Query$get_restaurant_reviews$restaurant_by_pk
    on Query$get_restaurant_reviews$restaurant_by_pk {
  CopyWith$Query$get_restaurant_reviews$restaurant_by_pk<
          Query$get_restaurant_reviews$restaurant_by_pk>
      get copyWith => CopyWith$Query$get_restaurant_reviews$restaurant_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_restaurant_reviews$restaurant_by_pk<TRes> {
  factory CopyWith$Query$get_restaurant_reviews$restaurant_by_pk(
    Query$get_restaurant_reviews$restaurant_by_pk instance,
    TRes Function(Query$get_restaurant_reviews$restaurant_by_pk) then,
  ) = _CopyWithImpl$Query$get_restaurant_reviews$restaurant_by_pk;

  factory CopyWith$Query$get_restaurant_reviews$restaurant_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_restaurant_reviews$restaurant_by_pk;

  TRes call({
    List<Query$get_restaurant_reviews$restaurant_by_pk$reviews>? reviews,
    String? $__typename,
  });
  TRes reviews(
      Iterable<Query$get_restaurant_reviews$restaurant_by_pk$reviews> Function(
              Iterable<
                  CopyWith$Query$get_restaurant_reviews$restaurant_by_pk$reviews<
                      Query$get_restaurant_reviews$restaurant_by_pk$reviews>>)
          _fn);
}

class _CopyWithImpl$Query$get_restaurant_reviews$restaurant_by_pk<TRes>
    implements CopyWith$Query$get_restaurant_reviews$restaurant_by_pk<TRes> {
  _CopyWithImpl$Query$get_restaurant_reviews$restaurant_by_pk(
    this._instance,
    this._then,
  );

  final Query$get_restaurant_reviews$restaurant_by_pk _instance;

  final TRes Function(Query$get_restaurant_reviews$restaurant_by_pk) _then;

  static const _undefined = {};

  TRes call({
    Object? reviews = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_restaurant_reviews$restaurant_by_pk(
        reviews: reviews == _undefined || reviews == null
            ? _instance.reviews
            : (reviews
                as List<Query$get_restaurant_reviews$restaurant_by_pk$reviews>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes reviews(
          Iterable<Query$get_restaurant_reviews$restaurant_by_pk$reviews> Function(
                  Iterable<
                      CopyWith$Query$get_restaurant_reviews$restaurant_by_pk$reviews<
                          Query$get_restaurant_reviews$restaurant_by_pk$reviews>>)
              _fn) =>
      call(
          reviews: _fn(_instance.reviews.map((e) =>
              CopyWith$Query$get_restaurant_reviews$restaurant_by_pk$reviews(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$get_restaurant_reviews$restaurant_by_pk<TRes>
    implements CopyWith$Query$get_restaurant_reviews$restaurant_by_pk<TRes> {
  _CopyWithStubImpl$Query$get_restaurant_reviews$restaurant_by_pk(this._res);

  TRes _res;

  call({
    List<Query$get_restaurant_reviews$restaurant_by_pk$reviews>? reviews,
    String? $__typename,
  }) =>
      _res;
  reviews(_fn) => _res;
}

class Query$get_restaurant_reviews$restaurant_by_pk$reviews {
  Query$get_restaurant_reviews$restaurant_by_pk$reviews({
    required this.from_entity_id,
    required this.from_entity_type,
    required this.rating,
    this.note,
    required this.id,
    required this.to_entity_id,
    required this.to_entity_type,
    required this.created_at,
    required this.$__typename,
  });

  factory Query$get_restaurant_reviews$restaurant_by_pk$reviews.fromJson(
      Map<String, dynamic> json) {
    final l$from_entity_id = json['from_entity_id'];
    final l$from_entity_type = json['from_entity_type'];
    final l$rating = json['rating'];
    final l$note = json['note'];
    final l$id = json['id'];
    final l$to_entity_id = json['to_entity_id'];
    final l$to_entity_type = json['to_entity_type'];
    final l$created_at = json['created_at'];
    final l$$__typename = json['__typename'];
    return Query$get_restaurant_reviews$restaurant_by_pk$reviews(
      from_entity_id: (l$from_entity_id as int),
      from_entity_type: (l$from_entity_type as String),
      rating: (l$rating as int),
      note: (l$note as String?),
      id: (l$id as int),
      to_entity_id: (l$to_entity_id as int),
      to_entity_type: (l$to_entity_type as String),
      created_at: (l$created_at as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int from_entity_id;

  final String from_entity_type;

  final int rating;

  final String? note;

  final int id;

  final int to_entity_id;

  final String to_entity_type;

  final String created_at;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$from_entity_id = from_entity_id;
    _resultData['from_entity_id'] = l$from_entity_id;
    final l$from_entity_type = from_entity_type;
    _resultData['from_entity_type'] = l$from_entity_type;
    final l$rating = rating;
    _resultData['rating'] = l$rating;
    final l$note = note;
    _resultData['note'] = l$note;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$to_entity_id = to_entity_id;
    _resultData['to_entity_id'] = l$to_entity_id;
    final l$to_entity_type = to_entity_type;
    _resultData['to_entity_type'] = l$to_entity_type;
    final l$created_at = created_at;
    _resultData['created_at'] = l$created_at;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$from_entity_id = from_entity_id;
    final l$from_entity_type = from_entity_type;
    final l$rating = rating;
    final l$note = note;
    final l$id = id;
    final l$to_entity_id = to_entity_id;
    final l$to_entity_type = to_entity_type;
    final l$created_at = created_at;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$from_entity_id,
      l$from_entity_type,
      l$rating,
      l$note,
      l$id,
      l$to_entity_id,
      l$to_entity_type,
      l$created_at,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_restaurant_reviews$restaurant_by_pk$reviews) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$from_entity_id = from_entity_id;
    final lOther$from_entity_id = other.from_entity_id;
    if (l$from_entity_id != lOther$from_entity_id) {
      return false;
    }
    final l$from_entity_type = from_entity_type;
    final lOther$from_entity_type = other.from_entity_type;
    if (l$from_entity_type != lOther$from_entity_type) {
      return false;
    }
    final l$rating = rating;
    final lOther$rating = other.rating;
    if (l$rating != lOther$rating) {
      return false;
    }
    final l$note = note;
    final lOther$note = other.note;
    if (l$note != lOther$note) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$to_entity_id = to_entity_id;
    final lOther$to_entity_id = other.to_entity_id;
    if (l$to_entity_id != lOther$to_entity_id) {
      return false;
    }
    final l$to_entity_type = to_entity_type;
    final lOther$to_entity_type = other.to_entity_type;
    if (l$to_entity_type != lOther$to_entity_type) {
      return false;
    }
    final l$created_at = created_at;
    final lOther$created_at = other.created_at;
    if (l$created_at != lOther$created_at) {
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

extension UtilityExtension$Query$get_restaurant_reviews$restaurant_by_pk$reviews
    on Query$get_restaurant_reviews$restaurant_by_pk$reviews {
  CopyWith$Query$get_restaurant_reviews$restaurant_by_pk$reviews<
          Query$get_restaurant_reviews$restaurant_by_pk$reviews>
      get copyWith =>
          CopyWith$Query$get_restaurant_reviews$restaurant_by_pk$reviews(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_restaurant_reviews$restaurant_by_pk$reviews<
    TRes> {
  factory CopyWith$Query$get_restaurant_reviews$restaurant_by_pk$reviews(
    Query$get_restaurant_reviews$restaurant_by_pk$reviews instance,
    TRes Function(Query$get_restaurant_reviews$restaurant_by_pk$reviews) then,
  ) = _CopyWithImpl$Query$get_restaurant_reviews$restaurant_by_pk$reviews;

  factory CopyWith$Query$get_restaurant_reviews$restaurant_by_pk$reviews.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_restaurant_reviews$restaurant_by_pk$reviews;

  TRes call({
    int? from_entity_id,
    String? from_entity_type,
    int? rating,
    String? note,
    int? id,
    int? to_entity_id,
    String? to_entity_type,
    String? created_at,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_restaurant_reviews$restaurant_by_pk$reviews<TRes>
    implements
        CopyWith$Query$get_restaurant_reviews$restaurant_by_pk$reviews<TRes> {
  _CopyWithImpl$Query$get_restaurant_reviews$restaurant_by_pk$reviews(
    this._instance,
    this._then,
  );

  final Query$get_restaurant_reviews$restaurant_by_pk$reviews _instance;

  final TRes Function(Query$get_restaurant_reviews$restaurant_by_pk$reviews)
      _then;

  static const _undefined = {};

  TRes call({
    Object? from_entity_id = _undefined,
    Object? from_entity_type = _undefined,
    Object? rating = _undefined,
    Object? note = _undefined,
    Object? id = _undefined,
    Object? to_entity_id = _undefined,
    Object? to_entity_type = _undefined,
    Object? created_at = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_restaurant_reviews$restaurant_by_pk$reviews(
        from_entity_id: from_entity_id == _undefined || from_entity_id == null
            ? _instance.from_entity_id
            : (from_entity_id as int),
        from_entity_type:
            from_entity_type == _undefined || from_entity_type == null
                ? _instance.from_entity_type
                : (from_entity_type as String),
        rating: rating == _undefined || rating == null
            ? _instance.rating
            : (rating as int),
        note: note == _undefined ? _instance.note : (note as String?),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        to_entity_id: to_entity_id == _undefined || to_entity_id == null
            ? _instance.to_entity_id
            : (to_entity_id as int),
        to_entity_type: to_entity_type == _undefined || to_entity_type == null
            ? _instance.to_entity_type
            : (to_entity_type as String),
        created_at: created_at == _undefined || created_at == null
            ? _instance.created_at
            : (created_at as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$get_restaurant_reviews$restaurant_by_pk$reviews<
        TRes>
    implements
        CopyWith$Query$get_restaurant_reviews$restaurant_by_pk$reviews<TRes> {
  _CopyWithStubImpl$Query$get_restaurant_reviews$restaurant_by_pk$reviews(
      this._res);

  TRes _res;

  call({
    int? from_entity_id,
    String? from_entity_type,
    int? rating,
    String? note,
    int? id,
    int? to_entity_id,
    String? to_entity_type,
    String? created_at,
    String? $__typename,
  }) =>
      _res;
}
