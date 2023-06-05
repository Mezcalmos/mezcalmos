import '../../__generated/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';

class Variables$Query$get_rental_by_category {
  factory Variables$Query$get_rental_by_category({
    required double distance,
    required Geography from,
    int? limit,
    int? offset,
    String? category1,
    List<String>? categories2,
    List<String>? tags,
  }) =>
      Variables$Query$get_rental_by_category._({
        r'distance': distance,
        r'from': from,
        if (limit != null) r'limit': limit,
        if (offset != null) r'offset': offset,
        if (category1 != null) r'category1': category1,
        if (categories2 != null) r'categories2': categories2,
        if (tags != null) r'tags': tags,
      });

  Variables$Query$get_rental_by_category._(this._$data);

  factory Variables$Query$get_rental_by_category.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$distance = data['distance'];
    result$data['distance'] = (l$distance as num).toDouble();
    final l$from = data['from'];
    result$data['from'] = geographyFromJson(l$from);
    if (data.containsKey('limit')) {
      final l$limit = data['limit'];
      result$data['limit'] = (l$limit as int?);
    }
    if (data.containsKey('offset')) {
      final l$offset = data['offset'];
      result$data['offset'] = (l$offset as int?);
    }
    if (data.containsKey('category1')) {
      final l$category1 = data['category1'];
      result$data['category1'] = (l$category1 as String?);
    }
    if (data.containsKey('categories2')) {
      final l$categories2 = data['categories2'];
      result$data['categories2'] =
          (l$categories2 as List<dynamic>?)?.map((e) => (e as String)).toList();
    }
    if (data.containsKey('tags')) {
      final l$tags = data['tags'];
      result$data['tags'] =
          (l$tags as List<dynamic>?)?.map((e) => (e as String)).toList();
    }
    return Variables$Query$get_rental_by_category._(result$data);
  }

  Map<String, dynamic> _$data;

  double get distance => (_$data['distance'] as double);
  Geography get from => (_$data['from'] as Geography);
  int? get limit => (_$data['limit'] as int?);
  int? get offset => (_$data['offset'] as int?);
  String? get category1 => (_$data['category1'] as String?);
  List<String>? get categories2 => (_$data['categories2'] as List<String>?);
  List<String>? get tags => (_$data['tags'] as List<String>?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$distance = distance;
    result$data['distance'] = l$distance;
    final l$from = from;
    result$data['from'] = geographyToJson(l$from);
    if (_$data.containsKey('limit')) {
      final l$limit = limit;
      result$data['limit'] = l$limit;
    }
    if (_$data.containsKey('offset')) {
      final l$offset = offset;
      result$data['offset'] = l$offset;
    }
    if (_$data.containsKey('category1')) {
      final l$category1 = category1;
      result$data['category1'] = l$category1;
    }
    if (_$data.containsKey('categories2')) {
      final l$categories2 = categories2;
      result$data['categories2'] = l$categories2?.map((e) => e).toList();
    }
    if (_$data.containsKey('tags')) {
      final l$tags = tags;
      result$data['tags'] = l$tags?.map((e) => e).toList();
    }
    return result$data;
  }

  CopyWith$Variables$Query$get_rental_by_category<
          Variables$Query$get_rental_by_category>
      get copyWith => CopyWith$Variables$Query$get_rental_by_category(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$get_rental_by_category) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$distance = distance;
    final lOther$distance = other.distance;
    if (l$distance != lOther$distance) {
      return false;
    }
    final l$from = from;
    final lOther$from = other.from;
    if (l$from != lOther$from) {
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
    final l$category1 = category1;
    final lOther$category1 = other.category1;
    if (_$data.containsKey('category1') !=
        other._$data.containsKey('category1')) {
      return false;
    }
    if (l$category1 != lOther$category1) {
      return false;
    }
    final l$categories2 = categories2;
    final lOther$categories2 = other.categories2;
    if (_$data.containsKey('categories2') !=
        other._$data.containsKey('categories2')) {
      return false;
    }
    if (l$categories2 != null && lOther$categories2 != null) {
      if (l$categories2.length != lOther$categories2.length) {
        return false;
      }
      for (int i = 0; i < l$categories2.length; i++) {
        final l$categories2$entry = l$categories2[i];
        final lOther$categories2$entry = lOther$categories2[i];
        if (l$categories2$entry != lOther$categories2$entry) {
          return false;
        }
      }
    } else if (l$categories2 != lOther$categories2) {
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
    final l$distance = distance;
    final l$from = from;
    final l$limit = limit;
    final l$offset = offset;
    final l$category1 = category1;
    final l$categories2 = categories2;
    final l$tags = tags;
    return Object.hashAll([
      l$distance,
      l$from,
      _$data.containsKey('limit') ? l$limit : const {},
      _$data.containsKey('offset') ? l$offset : const {},
      _$data.containsKey('category1') ? l$category1 : const {},
      _$data.containsKey('categories2')
          ? l$categories2 == null
              ? null
              : Object.hashAll(l$categories2.map((v) => v))
          : const {},
      _$data.containsKey('tags')
          ? l$tags == null
              ? null
              : Object.hashAll(l$tags.map((v) => v))
          : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$get_rental_by_category<TRes> {
  factory CopyWith$Variables$Query$get_rental_by_category(
    Variables$Query$get_rental_by_category instance,
    TRes Function(Variables$Query$get_rental_by_category) then,
  ) = _CopyWithImpl$Variables$Query$get_rental_by_category;

  factory CopyWith$Variables$Query$get_rental_by_category.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$get_rental_by_category;

  TRes call({
    double? distance,
    Geography? from,
    int? limit,
    int? offset,
    String? category1,
    List<String>? categories2,
    List<String>? tags,
  });
}

class _CopyWithImpl$Variables$Query$get_rental_by_category<TRes>
    implements CopyWith$Variables$Query$get_rental_by_category<TRes> {
  _CopyWithImpl$Variables$Query$get_rental_by_category(
    this._instance,
    this._then,
  );

  final Variables$Query$get_rental_by_category _instance;

  final TRes Function(Variables$Query$get_rental_by_category) _then;

  static const _undefined = {};

  TRes call({
    Object? distance = _undefined,
    Object? from = _undefined,
    Object? limit = _undefined,
    Object? offset = _undefined,
    Object? category1 = _undefined,
    Object? categories2 = _undefined,
    Object? tags = _undefined,
  }) =>
      _then(Variables$Query$get_rental_by_category._({
        ..._instance._$data,
        if (distance != _undefined && distance != null)
          'distance': (distance as double),
        if (from != _undefined && from != null) 'from': (from as Geography),
        if (limit != _undefined) 'limit': (limit as int?),
        if (offset != _undefined) 'offset': (offset as int?),
        if (category1 != _undefined) 'category1': (category1 as String?),
        if (categories2 != _undefined)
          'categories2': (categories2 as List<String>?),
        if (tags != _undefined) 'tags': (tags as List<String>?),
      }));
}

class _CopyWithStubImpl$Variables$Query$get_rental_by_category<TRes>
    implements CopyWith$Variables$Query$get_rental_by_category<TRes> {
  _CopyWithStubImpl$Variables$Query$get_rental_by_category(this._res);

  TRes _res;

  call({
    double? distance,
    Geography? from,
    int? limit,
    int? offset,
    String? category1,
    List<String>? categories2,
    List<String>? tags,
  }) =>
      _res;
}

class Query$get_rental_by_category {
  Query$get_rental_by_category({
    required this.business_rental,
    required this.$__typename,
  });

  factory Query$get_rental_by_category.fromJson(Map<String, dynamic> json) {
    final l$business_rental = json['business_rental'];
    final l$$__typename = json['__typename'];
    return Query$get_rental_by_category(
      business_rental: (l$business_rental as List<dynamic>)
          .map((e) => Query$get_rental_by_category$business_rental.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$get_rental_by_category$business_rental> business_rental;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$business_rental = business_rental;
    _resultData['business_rental'] =
        l$business_rental.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$business_rental = business_rental;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$business_rental.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_rental_by_category) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$business_rental = business_rental;
    final lOther$business_rental = other.business_rental;
    if (l$business_rental.length != lOther$business_rental.length) {
      return false;
    }
    for (int i = 0; i < l$business_rental.length; i++) {
      final l$business_rental$entry = l$business_rental[i];
      final lOther$business_rental$entry = lOther$business_rental[i];
      if (l$business_rental$entry != lOther$business_rental$entry) {
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

extension UtilityExtension$Query$get_rental_by_category
    on Query$get_rental_by_category {
  CopyWith$Query$get_rental_by_category<Query$get_rental_by_category>
      get copyWith => CopyWith$Query$get_rental_by_category(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_rental_by_category<TRes> {
  factory CopyWith$Query$get_rental_by_category(
    Query$get_rental_by_category instance,
    TRes Function(Query$get_rental_by_category) then,
  ) = _CopyWithImpl$Query$get_rental_by_category;

  factory CopyWith$Query$get_rental_by_category.stub(TRes res) =
      _CopyWithStubImpl$Query$get_rental_by_category;

  TRes call({
    List<Query$get_rental_by_category$business_rental>? business_rental,
    String? $__typename,
  });
  TRes business_rental(
      Iterable<Query$get_rental_by_category$business_rental> Function(
              Iterable<
                  CopyWith$Query$get_rental_by_category$business_rental<
                      Query$get_rental_by_category$business_rental>>)
          _fn);
}

class _CopyWithImpl$Query$get_rental_by_category<TRes>
    implements CopyWith$Query$get_rental_by_category<TRes> {
  _CopyWithImpl$Query$get_rental_by_category(
    this._instance,
    this._then,
  );

  final Query$get_rental_by_category _instance;

  final TRes Function(Query$get_rental_by_category) _then;

  static const _undefined = {};

  TRes call({
    Object? business_rental = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_rental_by_category(
        business_rental:
            business_rental == _undefined || business_rental == null
                ? _instance.business_rental
                : (business_rental
                    as List<Query$get_rental_by_category$business_rental>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes business_rental(
          Iterable<Query$get_rental_by_category$business_rental> Function(
                  Iterable<
                      CopyWith$Query$get_rental_by_category$business_rental<
                          Query$get_rental_by_category$business_rental>>)
              _fn) =>
      call(
          business_rental: _fn(_instance.business_rental
              .map((e) => CopyWith$Query$get_rental_by_category$business_rental(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$get_rental_by_category<TRes>
    implements CopyWith$Query$get_rental_by_category<TRes> {
  _CopyWithStubImpl$Query$get_rental_by_category(this._res);

  TRes _res;

  call({
    List<Query$get_rental_by_category$business_rental>? business_rental,
    String? $__typename,
  }) =>
      _res;
  business_rental(_fn) => _res;
}

const documentNodeQueryget_rental_by_category = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'get_rental_by_category'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'distance')),
        type: NamedTypeNode(
          name: NameNode(value: 'Float'),
          isNonNull: true,
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
        variable: VariableNode(name: NameNode(value: 'category1')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'categories2')),
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
        name: NameNode(value: 'business_rental'),
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
                                name: NameNode(value: '_eq'),
                                value: VariableNode(
                                    name: NameNode(value: 'category1')),
                              )
                            ]),
                          ),
                          ObjectFieldNode(
                            name: NameNode(value: 'category2'),
                            value: ObjectValueNode(fields: [
                              ObjectFieldNode(
                                name: NameNode(value: '_in'),
                                value: VariableNode(
                                    name: NameNode(value: 'categories2')),
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
                                            name: NameNode(value: 'distance')),
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
                          ),
                          ObjectFieldNode(
                            name: NameNode(value: 'approved'),
                            value: ObjectValueNode(fields: [
                              ObjectFieldNode(
                                name: NameNode(value: '_eq'),
                                value: BooleanValueNode(value: true),
                              )
                            ]),
                          ),
                          ObjectFieldNode(
                            name: NameNode(value: 'open_status'),
                            value: ObjectValueNode(fields: [
                              ObjectFieldNode(
                                name: NameNode(value: '_neq'),
                                value: StringValueNode(
                                  value: 'closedIndefinitely',
                                  isBlock: false,
                                ),
                              )
                            ]),
                          ),
                        ]),
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
          ArgumentNode(
            name: NameNode(value: 'order_by'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'business'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: 'details'),
                    value: ObjectValueNode(fields: [
                      ObjectFieldNode(
                        name: NameNode(value: 'referral_points'),
                        value: EnumValueNode(
                            name: NameNode(value: 'desc_nulls_last')),
                      )
                    ]),
                  )
                ]),
              )
            ]),
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
                name: NameNode(value: 'name_id'),
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
                name: NameNode(value: 'category2'),
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
                name: NameNode(value: 'tags'),
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
            name: NameNode(value: 'category3'),
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
                    name: NameNode(value: 'currency'),
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
            name: NameNode(value: 'home_rental'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'bathrooms'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'bedrooms'),
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
                name: NameNode(value: 'home_type'),
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
      
    ]),
  ),
]);
Query$get_rental_by_category _parserFn$Query$get_rental_by_category(
        Map<String, dynamic> data) =>
    Query$get_rental_by_category.fromJson(data);

class Options$Query$get_rental_by_category
    extends graphql.QueryOptions<Query$get_rental_by_category> {
  Options$Query$get_rental_by_category({
    String? operationName,
    required Variables$Query$get_rental_by_category variables,
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
          document: documentNodeQueryget_rental_by_category,
          parserFn: _parserFn$Query$get_rental_by_category,
        );
}

class WatchOptions$Query$get_rental_by_category
    extends graphql.WatchQueryOptions<Query$get_rental_by_category> {
  WatchOptions$Query$get_rental_by_category({
    String? operationName,
    required Variables$Query$get_rental_by_category variables,
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
          document: documentNodeQueryget_rental_by_category,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$get_rental_by_category,
        );
}

class FetchMoreOptions$Query$get_rental_by_category
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$get_rental_by_category({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$get_rental_by_category variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryget_rental_by_category,
        );
}

extension ClientExtension$Query$get_rental_by_category
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$get_rental_by_category>>
      query$get_rental_by_category(
              Options$Query$get_rental_by_category options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$get_rental_by_category>
      watchQuery$get_rental_by_category(
              WatchOptions$Query$get_rental_by_category options) =>
          this.watchQuery(options);
  void writeQuery$get_rental_by_category({
    required Query$get_rental_by_category data,
    required Variables$Query$get_rental_by_category variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryget_rental_by_category),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$get_rental_by_category? readQuery$get_rental_by_category({
    required Variables$Query$get_rental_by_category variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQueryget_rental_by_category),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$get_rental_by_category.fromJson(result);
  }
}

class Query$get_rental_by_category$business_rental {
  Query$get_rental_by_category$business_rental({
    required this.details,
    required this.id,
    required this.category3,
    required this.business,
    this.home_rental,
    required this.$__typename,
  });

  factory Query$get_rental_by_category$business_rental.fromJson(
      Map<String, dynamic> json) {
    final l$details = json['details'];
    final l$id = json['id'];
    final l$category3 = json['category3'];
    final l$business = json['business'];
    final l$home_rental = json['home_rental'];
    final l$$__typename = json['__typename'];
    return Query$get_rental_by_category$business_rental(
      details: Query$get_rental_by_category$business_rental$details.fromJson(
          (l$details as Map<String, dynamic>)),
      id: (l$id as int),
      category3: (l$category3 as String),
      business: Query$get_rental_by_category$business_rental$business.fromJson(
          (l$business as Map<String, dynamic>)),
      home_rental: l$home_rental == null
          ? null
          : Query$get_rental_by_category$business_rental$home_rental.fromJson(
              (l$home_rental as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$get_rental_by_category$business_rental$details details;

  final int id;

  final String category3;

  final Query$get_rental_by_category$business_rental$business business;

  final Query$get_rental_by_category$business_rental$home_rental? home_rental;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$details = details;
    _resultData['details'] = l$details.toJson();
    final l$id = id;
    _resultData['id'] = l$id;
    final l$category3 = category3;
    _resultData['category3'] = l$category3;
    final l$business = business;
    _resultData['business'] = l$business.toJson();
    final l$home_rental = home_rental;
    _resultData['home_rental'] = l$home_rental?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$details = details;
    final l$id = id;
    final l$category3 = category3;
    final l$business = business;
    final l$home_rental = home_rental;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$details,
      l$id,
      l$category3,
      l$business,
      l$home_rental,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_rental_by_category$business_rental) ||
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
    final l$category3 = category3;
    final lOther$category3 = other.category3;
    if (l$category3 != lOther$category3) {
      return false;
    }
    final l$business = business;
    final lOther$business = other.business;
    if (l$business != lOther$business) {
      return false;
    }
    final l$home_rental = home_rental;
    final lOther$home_rental = other.home_rental;
    if (l$home_rental != lOther$home_rental) {
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

extension UtilityExtension$Query$get_rental_by_category$business_rental
    on Query$get_rental_by_category$business_rental {
  CopyWith$Query$get_rental_by_category$business_rental<
          Query$get_rental_by_category$business_rental>
      get copyWith => CopyWith$Query$get_rental_by_category$business_rental(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_rental_by_category$business_rental<TRes> {
  factory CopyWith$Query$get_rental_by_category$business_rental(
    Query$get_rental_by_category$business_rental instance,
    TRes Function(Query$get_rental_by_category$business_rental) then,
  ) = _CopyWithImpl$Query$get_rental_by_category$business_rental;

  factory CopyWith$Query$get_rental_by_category$business_rental.stub(TRes res) =
      _CopyWithStubImpl$Query$get_rental_by_category$business_rental;

  TRes call({
    Query$get_rental_by_category$business_rental$details? details,
    int? id,
    String? category3,
    Query$get_rental_by_category$business_rental$business? business,
    Query$get_rental_by_category$business_rental$home_rental? home_rental,
    String? $__typename,
  });
  CopyWith$Query$get_rental_by_category$business_rental$details<TRes>
      get details;
  CopyWith$Query$get_rental_by_category$business_rental$business<TRes>
      get business;
  CopyWith$Query$get_rental_by_category$business_rental$home_rental<TRes>
      get home_rental;
}

class _CopyWithImpl$Query$get_rental_by_category$business_rental<TRes>
    implements CopyWith$Query$get_rental_by_category$business_rental<TRes> {
  _CopyWithImpl$Query$get_rental_by_category$business_rental(
    this._instance,
    this._then,
  );

  final Query$get_rental_by_category$business_rental _instance;

  final TRes Function(Query$get_rental_by_category$business_rental) _then;

  static const _undefined = {};

  TRes call({
    Object? details = _undefined,
    Object? id = _undefined,
    Object? category3 = _undefined,
    Object? business = _undefined,
    Object? home_rental = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_rental_by_category$business_rental(
        details: details == _undefined || details == null
            ? _instance.details
            : (details as Query$get_rental_by_category$business_rental$details),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        category3: category3 == _undefined || category3 == null
            ? _instance.category3
            : (category3 as String),
        business: business == _undefined || business == null
            ? _instance.business
            : (business
                as Query$get_rental_by_category$business_rental$business),
        home_rental: home_rental == _undefined
            ? _instance.home_rental
            : (home_rental
                as Query$get_rental_by_category$business_rental$home_rental?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_rental_by_category$business_rental$details<TRes>
      get details {
    final local$details = _instance.details;
    return CopyWith$Query$get_rental_by_category$business_rental$details(
        local$details, (e) => call(details: e));
  }

  CopyWith$Query$get_rental_by_category$business_rental$business<TRes>
      get business {
    final local$business = _instance.business;
    return CopyWith$Query$get_rental_by_category$business_rental$business(
        local$business, (e) => call(business: e));
  }

  CopyWith$Query$get_rental_by_category$business_rental$home_rental<TRes>
      get home_rental {
    final local$home_rental = _instance.home_rental;
    return local$home_rental == null
        ? CopyWith$Query$get_rental_by_category$business_rental$home_rental
            .stub(_then(_instance))
        : CopyWith$Query$get_rental_by_category$business_rental$home_rental(
            local$home_rental, (e) => call(home_rental: e));
  }
}

class _CopyWithStubImpl$Query$get_rental_by_category$business_rental<TRes>
    implements CopyWith$Query$get_rental_by_category$business_rental<TRes> {
  _CopyWithStubImpl$Query$get_rental_by_category$business_rental(this._res);

  TRes _res;

  call({
    Query$get_rental_by_category$business_rental$details? details,
    int? id,
    String? category3,
    Query$get_rental_by_category$business_rental$business? business,
    Query$get_rental_by_category$business_rental$home_rental? home_rental,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_rental_by_category$business_rental$details<TRes>
      get details =>
          CopyWith$Query$get_rental_by_category$business_rental$details.stub(
              _res);
  CopyWith$Query$get_rental_by_category$business_rental$business<TRes>
      get business =>
          CopyWith$Query$get_rental_by_category$business_rental$business.stub(
              _res);
  CopyWith$Query$get_rental_by_category$business_rental$home_rental<TRes>
      get home_rental =>
          CopyWith$Query$get_rental_by_category$business_rental$home_rental
              .stub(_res);
}

class Query$get_rental_by_category$business_rental$details {
  Query$get_rental_by_category$business_rental$details({
    required this.name_id,
    this.description_id,
    required this.id,
    required this.name,
    this.additional_parameters,
    required this.available,
    required this.category1,
    required this.category2,
    required this.cost,
    this.image,
    required this.position,
    required this.tags,
    required this.$__typename,
  });

  factory Query$get_rental_by_category$business_rental$details.fromJson(
      Map<String, dynamic> json) {
    final l$name_id = json['name_id'];
    final l$description_id = json['description_id'];
    final l$id = json['id'];
    final l$name = json['name'];
    final l$additional_parameters = json['additional_parameters'];
    final l$available = json['available'];
    final l$category1 = json['category1'];
    final l$category2 = json['category2'];
    final l$cost = json['cost'];
    final l$image = json['image'];
    final l$position = json['position'];
    final l$tags = json['tags'];
    final l$$__typename = json['__typename'];
    return Query$get_rental_by_category$business_rental$details(
      name_id: (l$name_id as int),
      description_id: (l$description_id as int?),
      id: (l$id as int),
      name: Query$get_rental_by_category$business_rental$details$name.fromJson(
          (l$name as Map<String, dynamic>)),
      additional_parameters: l$additional_parameters == null
          ? null
          : mapFromJson(l$additional_parameters),
      available: (l$available as bool),
      category1: (l$category1 as String),
      category2: (l$category2 as String),
      cost: mapFromJson(l$cost),
      image: l$image == null ? null : mapFromJson(l$image),
      position: (l$position as int),
      tags: mapFromJson(l$tags),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int name_id;

  final int? description_id;

  final int id;

  final Query$get_rental_by_category$business_rental$details$name name;

  final dynamic? additional_parameters;

  final bool available;

  final String category1;

  final String category2;

  final dynamic cost;

  final dynamic? image;

  final int position;

  final dynamic tags;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name_id = name_id;
    _resultData['name_id'] = l$name_id;
    final l$description_id = description_id;
    _resultData['description_id'] = l$description_id;
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
    final l$category2 = category2;
    _resultData['category2'] = l$category2;
    final l$cost = cost;
    _resultData['cost'] = mapToJson(l$cost);
    final l$image = image;
    _resultData['image'] = l$image == null ? null : mapToJson(l$image);
    final l$position = position;
    _resultData['position'] = l$position;
    final l$tags = tags;
    _resultData['tags'] = mapToJson(l$tags);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$name_id = name_id;
    final l$description_id = description_id;
    final l$id = id;
    final l$name = name;
    final l$additional_parameters = additional_parameters;
    final l$available = available;
    final l$category1 = category1;
    final l$category2 = category2;
    final l$cost = cost;
    final l$image = image;
    final l$position = position;
    final l$tags = tags;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$name_id,
      l$description_id,
      l$id,
      l$name,
      l$additional_parameters,
      l$available,
      l$category1,
      l$category2,
      l$cost,
      l$image,
      l$position,
      l$tags,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_rental_by_category$business_rental$details) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name_id = name_id;
    final lOther$name_id = other.name_id;
    if (l$name_id != lOther$name_id) {
      return false;
    }
    final l$description_id = description_id;
    final lOther$description_id = other.description_id;
    if (l$description_id != lOther$description_id) {
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
    final l$category2 = category2;
    final lOther$category2 = other.category2;
    if (l$category2 != lOther$category2) {
      return false;
    }
    final l$cost = cost;
    final lOther$cost = other.cost;
    if (l$cost != lOther$cost) {
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
    final l$tags = tags;
    final lOther$tags = other.tags;
    if (l$tags != lOther$tags) {
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

extension UtilityExtension$Query$get_rental_by_category$business_rental$details
    on Query$get_rental_by_category$business_rental$details {
  CopyWith$Query$get_rental_by_category$business_rental$details<
          Query$get_rental_by_category$business_rental$details>
      get copyWith =>
          CopyWith$Query$get_rental_by_category$business_rental$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_rental_by_category$business_rental$details<
    TRes> {
  factory CopyWith$Query$get_rental_by_category$business_rental$details(
    Query$get_rental_by_category$business_rental$details instance,
    TRes Function(Query$get_rental_by_category$business_rental$details) then,
  ) = _CopyWithImpl$Query$get_rental_by_category$business_rental$details;

  factory CopyWith$Query$get_rental_by_category$business_rental$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_rental_by_category$business_rental$details;

  TRes call({
    int? name_id,
    int? description_id,
    int? id,
    Query$get_rental_by_category$business_rental$details$name? name,
    dynamic? additional_parameters,
    bool? available,
    String? category1,
    String? category2,
    dynamic? cost,
    dynamic? image,
    int? position,
    dynamic? tags,
    String? $__typename,
  });
  CopyWith$Query$get_rental_by_category$business_rental$details$name<TRes>
      get name;
}

class _CopyWithImpl$Query$get_rental_by_category$business_rental$details<TRes>
    implements
        CopyWith$Query$get_rental_by_category$business_rental$details<TRes> {
  _CopyWithImpl$Query$get_rental_by_category$business_rental$details(
    this._instance,
    this._then,
  );

  final Query$get_rental_by_category$business_rental$details _instance;

  final TRes Function(Query$get_rental_by_category$business_rental$details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? name_id = _undefined,
    Object? description_id = _undefined,
    Object? id = _undefined,
    Object? name = _undefined,
    Object? additional_parameters = _undefined,
    Object? available = _undefined,
    Object? category1 = _undefined,
    Object? category2 = _undefined,
    Object? cost = _undefined,
    Object? image = _undefined,
    Object? position = _undefined,
    Object? tags = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_rental_by_category$business_rental$details(
        name_id: name_id == _undefined || name_id == null
            ? _instance.name_id
            : (name_id as int),
        description_id: description_id == _undefined
            ? _instance.description_id
            : (description_id as int?),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name
                as Query$get_rental_by_category$business_rental$details$name),
        additional_parameters: additional_parameters == _undefined
            ? _instance.additional_parameters
            : (additional_parameters as dynamic?),
        available: available == _undefined || available == null
            ? _instance.available
            : (available as bool),
        category1: category1 == _undefined || category1 == null
            ? _instance.category1
            : (category1 as String),
        category2: category2 == _undefined || category2 == null
            ? _instance.category2
            : (category2 as String),
        cost: cost == _undefined || cost == null
            ? _instance.cost
            : (cost as dynamic),
        image: image == _undefined ? _instance.image : (image as dynamic?),
        position: position == _undefined || position == null
            ? _instance.position
            : (position as int),
        tags: tags == _undefined || tags == null
            ? _instance.tags
            : (tags as dynamic),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_rental_by_category$business_rental$details$name<TRes>
      get name {
    final local$name = _instance.name;
    return CopyWith$Query$get_rental_by_category$business_rental$details$name(
        local$name, (e) => call(name: e));
  }
}

class _CopyWithStubImpl$Query$get_rental_by_category$business_rental$details<
        TRes>
    implements
        CopyWith$Query$get_rental_by_category$business_rental$details<TRes> {
  _CopyWithStubImpl$Query$get_rental_by_category$business_rental$details(
      this._res);

  TRes _res;

  call({
    int? name_id,
    int? description_id,
    int? id,
    Query$get_rental_by_category$business_rental$details$name? name,
    dynamic? additional_parameters,
    bool? available,
    String? category1,
    String? category2,
    dynamic? cost,
    dynamic? image,
    int? position,
    dynamic? tags,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_rental_by_category$business_rental$details$name<TRes>
      get name =>
          CopyWith$Query$get_rental_by_category$business_rental$details$name
              .stub(_res);
}

class Query$get_rental_by_category$business_rental$details$name {
  Query$get_rental_by_category$business_rental$details$name({
    required this.translations,
    required this.$__typename,
  });

  factory Query$get_rental_by_category$business_rental$details$name.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$get_rental_by_category$business_rental$details$name(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$get_rental_by_category$business_rental$details$name$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Query$get_rental_by_category$business_rental$details$name$translations>
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
    if (!(other is Query$get_rental_by_category$business_rental$details$name) ||
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

extension UtilityExtension$Query$get_rental_by_category$business_rental$details$name
    on Query$get_rental_by_category$business_rental$details$name {
  CopyWith$Query$get_rental_by_category$business_rental$details$name<
          Query$get_rental_by_category$business_rental$details$name>
      get copyWith =>
          CopyWith$Query$get_rental_by_category$business_rental$details$name(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_rental_by_category$business_rental$details$name<
    TRes> {
  factory CopyWith$Query$get_rental_by_category$business_rental$details$name(
    Query$get_rental_by_category$business_rental$details$name instance,
    TRes Function(Query$get_rental_by_category$business_rental$details$name)
        then,
  ) = _CopyWithImpl$Query$get_rental_by_category$business_rental$details$name;

  factory CopyWith$Query$get_rental_by_category$business_rental$details$name.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_rental_by_category$business_rental$details$name;

  TRes call({
    List<Query$get_rental_by_category$business_rental$details$name$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$get_rental_by_category$business_rental$details$name$translations> Function(
              Iterable<
                  CopyWith$Query$get_rental_by_category$business_rental$details$name$translations<
                      Query$get_rental_by_category$business_rental$details$name$translations>>)
          _fn);
}

class _CopyWithImpl$Query$get_rental_by_category$business_rental$details$name<
        TRes>
    implements
        CopyWith$Query$get_rental_by_category$business_rental$details$name<
            TRes> {
  _CopyWithImpl$Query$get_rental_by_category$business_rental$details$name(
    this._instance,
    this._then,
  );

  final Query$get_rental_by_category$business_rental$details$name _instance;

  final TRes Function(Query$get_rental_by_category$business_rental$details$name)
      _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_rental_by_category$business_rental$details$name(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$get_rental_by_category$business_rental$details$name$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$get_rental_by_category$business_rental$details$name$translations> Function(
                  Iterable<
                      CopyWith$Query$get_rental_by_category$business_rental$details$name$translations<
                          Query$get_rental_by_category$business_rental$details$name$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$get_rental_by_category$business_rental$details$name$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$get_rental_by_category$business_rental$details$name<
        TRes>
    implements
        CopyWith$Query$get_rental_by_category$business_rental$details$name<
            TRes> {
  _CopyWithStubImpl$Query$get_rental_by_category$business_rental$details$name(
      this._res);

  TRes _res;

  call({
    List<Query$get_rental_by_category$business_rental$details$name$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$get_rental_by_category$business_rental$details$name$translations {
  Query$get_rental_by_category$business_rental$details$name$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$get_rental_by_category$business_rental$details$name$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$get_rental_by_category$business_rental$details$name$translations(
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
            is Query$get_rental_by_category$business_rental$details$name$translations) ||
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

extension UtilityExtension$Query$get_rental_by_category$business_rental$details$name$translations
    on Query$get_rental_by_category$business_rental$details$name$translations {
  CopyWith$Query$get_rental_by_category$business_rental$details$name$translations<
          Query$get_rental_by_category$business_rental$details$name$translations>
      get copyWith =>
          CopyWith$Query$get_rental_by_category$business_rental$details$name$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_rental_by_category$business_rental$details$name$translations<
    TRes> {
  factory CopyWith$Query$get_rental_by_category$business_rental$details$name$translations(
    Query$get_rental_by_category$business_rental$details$name$translations
        instance,
    TRes Function(
            Query$get_rental_by_category$business_rental$details$name$translations)
        then,
  ) = _CopyWithImpl$Query$get_rental_by_category$business_rental$details$name$translations;

  factory CopyWith$Query$get_rental_by_category$business_rental$details$name$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_rental_by_category$business_rental$details$name$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_rental_by_category$business_rental$details$name$translations<
        TRes>
    implements
        CopyWith$Query$get_rental_by_category$business_rental$details$name$translations<
            TRes> {
  _CopyWithImpl$Query$get_rental_by_category$business_rental$details$name$translations(
    this._instance,
    this._then,
  );

  final Query$get_rental_by_category$business_rental$details$name$translations
      _instance;

  final TRes Function(
          Query$get_rental_by_category$business_rental$details$name$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_rental_by_category$business_rental$details$name$translations(
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

class _CopyWithStubImpl$Query$get_rental_by_category$business_rental$details$name$translations<
        TRes>
    implements
        CopyWith$Query$get_rental_by_category$business_rental$details$name$translations<
            TRes> {
  _CopyWithStubImpl$Query$get_rental_by_category$business_rental$details$name$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Query$get_rental_by_category$business_rental$business {
  Query$get_rental_by_category$business_rental$business({
    required this.id,
    required this.details,
    required this.$__typename,
  });

  factory Query$get_rental_by_category$business_rental$business.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Query$get_rental_by_category$business_rental$business(
      id: (l$id as int),
      details: Query$get_rental_by_category$business_rental$business$details
          .fromJson((l$details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final Query$get_rental_by_category$business_rental$business$details details;

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
    if (!(other is Query$get_rental_by_category$business_rental$business) ||
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

extension UtilityExtension$Query$get_rental_by_category$business_rental$business
    on Query$get_rental_by_category$business_rental$business {
  CopyWith$Query$get_rental_by_category$business_rental$business<
          Query$get_rental_by_category$business_rental$business>
      get copyWith =>
          CopyWith$Query$get_rental_by_category$business_rental$business(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_rental_by_category$business_rental$business<
    TRes> {
  factory CopyWith$Query$get_rental_by_category$business_rental$business(
    Query$get_rental_by_category$business_rental$business instance,
    TRes Function(Query$get_rental_by_category$business_rental$business) then,
  ) = _CopyWithImpl$Query$get_rental_by_category$business_rental$business;

  factory CopyWith$Query$get_rental_by_category$business_rental$business.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_rental_by_category$business_rental$business;

  TRes call({
    int? id,
    Query$get_rental_by_category$business_rental$business$details? details,
    String? $__typename,
  });
  CopyWith$Query$get_rental_by_category$business_rental$business$details<TRes>
      get details;
}

class _CopyWithImpl$Query$get_rental_by_category$business_rental$business<TRes>
    implements
        CopyWith$Query$get_rental_by_category$business_rental$business<TRes> {
  _CopyWithImpl$Query$get_rental_by_category$business_rental$business(
    this._instance,
    this._then,
  );

  final Query$get_rental_by_category$business_rental$business _instance;

  final TRes Function(Query$get_rental_by_category$business_rental$business)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_rental_by_category$business_rental$business(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        details: details == _undefined || details == null
            ? _instance.details
            : (details
                as Query$get_rental_by_category$business_rental$business$details),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_rental_by_category$business_rental$business$details<TRes>
      get details {
    final local$details = _instance.details;
    return CopyWith$Query$get_rental_by_category$business_rental$business$details(
        local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Query$get_rental_by_category$business_rental$business<
        TRes>
    implements
        CopyWith$Query$get_rental_by_category$business_rental$business<TRes> {
  _CopyWithStubImpl$Query$get_rental_by_category$business_rental$business(
      this._res);

  TRes _res;

  call({
    int? id,
    Query$get_rental_by_category$business_rental$business$details? details,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_rental_by_category$business_rental$business$details<TRes>
      get details =>
          CopyWith$Query$get_rental_by_category$business_rental$business$details
              .stub(_res);
}

class Query$get_rental_by_category$business_rental$business$details {
  Query$get_rental_by_category$business_rental$business$details({
    required this.id,
    required this.name,
    required this.currency,
    required this.location,
    required this.$__typename,
  });

  factory Query$get_rental_by_category$business_rental$business$details.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$currency = json['currency'];
    final l$location = json['location'];
    final l$$__typename = json['__typename'];
    return Query$get_rental_by_category$business_rental$business$details(
      id: (l$id as int),
      name: (l$name as String),
      currency: (l$currency as String),
      location:
          Query$get_rental_by_category$business_rental$business$details$location
              .fromJson((l$location as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String name;

  final String currency;

  final Query$get_rental_by_category$business_rental$business$details$location
      location;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$currency = currency;
    _resultData['currency'] = l$currency;
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
    final l$currency = currency;
    final l$location = location;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$currency,
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
            is Query$get_rental_by_category$business_rental$business$details) ||
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
    final l$currency = currency;
    final lOther$currency = other.currency;
    if (l$currency != lOther$currency) {
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

extension UtilityExtension$Query$get_rental_by_category$business_rental$business$details
    on Query$get_rental_by_category$business_rental$business$details {
  CopyWith$Query$get_rental_by_category$business_rental$business$details<
          Query$get_rental_by_category$business_rental$business$details>
      get copyWith =>
          CopyWith$Query$get_rental_by_category$business_rental$business$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_rental_by_category$business_rental$business$details<
    TRes> {
  factory CopyWith$Query$get_rental_by_category$business_rental$business$details(
    Query$get_rental_by_category$business_rental$business$details instance,
    TRes Function(Query$get_rental_by_category$business_rental$business$details)
        then,
  ) = _CopyWithImpl$Query$get_rental_by_category$business_rental$business$details;

  factory CopyWith$Query$get_rental_by_category$business_rental$business$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_rental_by_category$business_rental$business$details;

  TRes call({
    int? id,
    String? name,
    String? currency,
    Query$get_rental_by_category$business_rental$business$details$location?
        location,
    String? $__typename,
  });
  CopyWith$Query$get_rental_by_category$business_rental$business$details$location<
      TRes> get location;
}

class _CopyWithImpl$Query$get_rental_by_category$business_rental$business$details<
        TRes>
    implements
        CopyWith$Query$get_rental_by_category$business_rental$business$details<
            TRes> {
  _CopyWithImpl$Query$get_rental_by_category$business_rental$business$details(
    this._instance,
    this._then,
  );

  final Query$get_rental_by_category$business_rental$business$details _instance;

  final TRes Function(
      Query$get_rental_by_category$business_rental$business$details) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? currency = _undefined,
    Object? location = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_rental_by_category$business_rental$business$details(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        currency: currency == _undefined || currency == null
            ? _instance.currency
            : (currency as String),
        location: location == _undefined || location == null
            ? _instance.location
            : (location
                as Query$get_rental_by_category$business_rental$business$details$location),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_rental_by_category$business_rental$business$details$location<
      TRes> get location {
    final local$location = _instance.location;
    return CopyWith$Query$get_rental_by_category$business_rental$business$details$location(
        local$location, (e) => call(location: e));
  }
}

class _CopyWithStubImpl$Query$get_rental_by_category$business_rental$business$details<
        TRes>
    implements
        CopyWith$Query$get_rental_by_category$business_rental$business$details<
            TRes> {
  _CopyWithStubImpl$Query$get_rental_by_category$business_rental$business$details(
      this._res);

  TRes _res;

  call({
    int? id,
    String? name,
    String? currency,
    Query$get_rental_by_category$business_rental$business$details$location?
        location,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_rental_by_category$business_rental$business$details$location<
          TRes>
      get location =>
          CopyWith$Query$get_rental_by_category$business_rental$business$details$location
              .stub(_res);
}

class Query$get_rental_by_category$business_rental$business$details$location {
  Query$get_rental_by_category$business_rental$business$details$location({
    required this.gps,
    required this.address,
    required this.$__typename,
  });

  factory Query$get_rental_by_category$business_rental$business$details$location.fromJson(
      Map<String, dynamic> json) {
    final l$gps = json['gps'];
    final l$address = json['address'];
    final l$$__typename = json['__typename'];
    return Query$get_rental_by_category$business_rental$business$details$location(
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
            is Query$get_rental_by_category$business_rental$business$details$location) ||
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

extension UtilityExtension$Query$get_rental_by_category$business_rental$business$details$location
    on Query$get_rental_by_category$business_rental$business$details$location {
  CopyWith$Query$get_rental_by_category$business_rental$business$details$location<
          Query$get_rental_by_category$business_rental$business$details$location>
      get copyWith =>
          CopyWith$Query$get_rental_by_category$business_rental$business$details$location(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_rental_by_category$business_rental$business$details$location<
    TRes> {
  factory CopyWith$Query$get_rental_by_category$business_rental$business$details$location(
    Query$get_rental_by_category$business_rental$business$details$location
        instance,
    TRes Function(
            Query$get_rental_by_category$business_rental$business$details$location)
        then,
  ) = _CopyWithImpl$Query$get_rental_by_category$business_rental$business$details$location;

  factory CopyWith$Query$get_rental_by_category$business_rental$business$details$location.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_rental_by_category$business_rental$business$details$location;

  TRes call({
    Geography? gps,
    String? address,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_rental_by_category$business_rental$business$details$location<
        TRes>
    implements
        CopyWith$Query$get_rental_by_category$business_rental$business$details$location<
            TRes> {
  _CopyWithImpl$Query$get_rental_by_category$business_rental$business$details$location(
    this._instance,
    this._then,
  );

  final Query$get_rental_by_category$business_rental$business$details$location
      _instance;

  final TRes Function(
          Query$get_rental_by_category$business_rental$business$details$location)
      _then;

  static const _undefined = {};

  TRes call({
    Object? gps = _undefined,
    Object? address = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_rental_by_category$business_rental$business$details$location(
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

class _CopyWithStubImpl$Query$get_rental_by_category$business_rental$business$details$location<
        TRes>
    implements
        CopyWith$Query$get_rental_by_category$business_rental$business$details$location<
            TRes> {
  _CopyWithStubImpl$Query$get_rental_by_category$business_rental$business$details$location(
      this._res);

  TRes _res;

  call({
    Geography? gps,
    String? address,
    String? $__typename,
  }) =>
      _res;
}

class Query$get_rental_by_category$business_rental$home_rental {
  Query$get_rental_by_category$business_rental$home_rental({
    required this.bathrooms,
    required this.bedrooms,
    required this.gps_location,
    required this.home_type,
    required this.address,
    required this.$__typename,
  });

  factory Query$get_rental_by_category$business_rental$home_rental.fromJson(
      Map<String, dynamic> json) {
    final l$bathrooms = json['bathrooms'];
    final l$bedrooms = json['bedrooms'];
    final l$gps_location = json['gps_location'];
    final l$home_type = json['home_type'];
    final l$address = json['address'];
    final l$$__typename = json['__typename'];
    return Query$get_rental_by_category$business_rental$home_rental(
      bathrooms: (l$bathrooms as int),
      bedrooms: (l$bedrooms as int),
      gps_location: geographyFromJson(l$gps_location),
      home_type: (l$home_type as String),
      address: (l$address as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int bathrooms;

  final int bedrooms;

  final Geography gps_location;

  final String home_type;

  final String address;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$bathrooms = bathrooms;
    _resultData['bathrooms'] = l$bathrooms;
    final l$bedrooms = bedrooms;
    _resultData['bedrooms'] = l$bedrooms;
    final l$gps_location = gps_location;
    _resultData['gps_location'] = geographyToJson(l$gps_location);
    final l$home_type = home_type;
    _resultData['home_type'] = l$home_type;
    final l$address = address;
    _resultData['address'] = l$address;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$bathrooms = bathrooms;
    final l$bedrooms = bedrooms;
    final l$gps_location = gps_location;
    final l$home_type = home_type;
    final l$address = address;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$bathrooms,
      l$bedrooms,
      l$gps_location,
      l$home_type,
      l$address,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_rental_by_category$business_rental$home_rental) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$bathrooms = bathrooms;
    final lOther$bathrooms = other.bathrooms;
    if (l$bathrooms != lOther$bathrooms) {
      return false;
    }
    final l$bedrooms = bedrooms;
    final lOther$bedrooms = other.bedrooms;
    if (l$bedrooms != lOther$bedrooms) {
      return false;
    }
    final l$gps_location = gps_location;
    final lOther$gps_location = other.gps_location;
    if (l$gps_location != lOther$gps_location) {
      return false;
    }
    final l$home_type = home_type;
    final lOther$home_type = other.home_type;
    if (l$home_type != lOther$home_type) {
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

extension UtilityExtension$Query$get_rental_by_category$business_rental$home_rental
    on Query$get_rental_by_category$business_rental$home_rental {
  CopyWith$Query$get_rental_by_category$business_rental$home_rental<
          Query$get_rental_by_category$business_rental$home_rental>
      get copyWith =>
          CopyWith$Query$get_rental_by_category$business_rental$home_rental(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_rental_by_category$business_rental$home_rental<
    TRes> {
  factory CopyWith$Query$get_rental_by_category$business_rental$home_rental(
    Query$get_rental_by_category$business_rental$home_rental instance,
    TRes Function(Query$get_rental_by_category$business_rental$home_rental)
        then,
  ) = _CopyWithImpl$Query$get_rental_by_category$business_rental$home_rental;

  factory CopyWith$Query$get_rental_by_category$business_rental$home_rental.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_rental_by_category$business_rental$home_rental;

  TRes call({
    int? bathrooms,
    int? bedrooms,
    Geography? gps_location,
    String? home_type,
    String? address,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_rental_by_category$business_rental$home_rental<
        TRes>
    implements
        CopyWith$Query$get_rental_by_category$business_rental$home_rental<
            TRes> {
  _CopyWithImpl$Query$get_rental_by_category$business_rental$home_rental(
    this._instance,
    this._then,
  );

  final Query$get_rental_by_category$business_rental$home_rental _instance;

  final TRes Function(Query$get_rental_by_category$business_rental$home_rental)
      _then;

  static const _undefined = {};

  TRes call({
    Object? bathrooms = _undefined,
    Object? bedrooms = _undefined,
    Object? gps_location = _undefined,
    Object? home_type = _undefined,
    Object? address = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_rental_by_category$business_rental$home_rental(
        bathrooms: bathrooms == _undefined || bathrooms == null
            ? _instance.bathrooms
            : (bathrooms as int),
        bedrooms: bedrooms == _undefined || bedrooms == null
            ? _instance.bedrooms
            : (bedrooms as int),
        gps_location: gps_location == _undefined || gps_location == null
            ? _instance.gps_location
            : (gps_location as Geography),
        home_type: home_type == _undefined || home_type == null
            ? _instance.home_type
            : (home_type as String),
        address: address == _undefined || address == null
            ? _instance.address
            : (address as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$get_rental_by_category$business_rental$home_rental<
        TRes>
    implements
        CopyWith$Query$get_rental_by_category$business_rental$home_rental<
            TRes> {
  _CopyWithStubImpl$Query$get_rental_by_category$business_rental$home_rental(
      this._res);

  TRes _res;

  call({
    int? bathrooms,
    int? bedrooms,
    Geography? gps_location,
    String? home_type,
    String? address,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$get_rental_by_id {
  factory Variables$Query$get_rental_by_id({required int id}) =>
      Variables$Query$get_rental_by_id._({
        r'id': id,
      });

  Variables$Query$get_rental_by_id._(this._$data);

  factory Variables$Query$get_rental_by_id.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as int);
    return Variables$Query$get_rental_by_id._(result$data);
  }

  Map<String, dynamic> _$data;

  int get id => (_$data['id'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$get_rental_by_id<Variables$Query$get_rental_by_id>
      get copyWith => CopyWith$Variables$Query$get_rental_by_id(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$get_rental_by_id) ||
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

abstract class CopyWith$Variables$Query$get_rental_by_id<TRes> {
  factory CopyWith$Variables$Query$get_rental_by_id(
    Variables$Query$get_rental_by_id instance,
    TRes Function(Variables$Query$get_rental_by_id) then,
  ) = _CopyWithImpl$Variables$Query$get_rental_by_id;

  factory CopyWith$Variables$Query$get_rental_by_id.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$get_rental_by_id;

  TRes call({int? id});
}

class _CopyWithImpl$Variables$Query$get_rental_by_id<TRes>
    implements CopyWith$Variables$Query$get_rental_by_id<TRes> {
  _CopyWithImpl$Variables$Query$get_rental_by_id(
    this._instance,
    this._then,
  );

  final Variables$Query$get_rental_by_id _instance;

  final TRes Function(Variables$Query$get_rental_by_id) _then;

  static const _undefined = {};

  TRes call({Object? id = _undefined}) =>
      _then(Variables$Query$get_rental_by_id._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$get_rental_by_id<TRes>
    implements CopyWith$Variables$Query$get_rental_by_id<TRes> {
  _CopyWithStubImpl$Variables$Query$get_rental_by_id(this._res);

  TRes _res;

  call({int? id}) => _res;
}

class Query$get_rental_by_id {
  Query$get_rental_by_id({
    this.business_rental_by_pk,
    required this.$__typename,
  });

  factory Query$get_rental_by_id.fromJson(Map<String, dynamic> json) {
    final l$business_rental_by_pk = json['business_rental_by_pk'];
    final l$$__typename = json['__typename'];
    return Query$get_rental_by_id(
      business_rental_by_pk: l$business_rental_by_pk == null
          ? null
          : Query$get_rental_by_id$business_rental_by_pk.fromJson(
              (l$business_rental_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$get_rental_by_id$business_rental_by_pk? business_rental_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$business_rental_by_pk = business_rental_by_pk;
    _resultData['business_rental_by_pk'] = l$business_rental_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$business_rental_by_pk = business_rental_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$business_rental_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_rental_by_id) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$business_rental_by_pk = business_rental_by_pk;
    final lOther$business_rental_by_pk = other.business_rental_by_pk;
    if (l$business_rental_by_pk != lOther$business_rental_by_pk) {
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

extension UtilityExtension$Query$get_rental_by_id on Query$get_rental_by_id {
  CopyWith$Query$get_rental_by_id<Query$get_rental_by_id> get copyWith =>
      CopyWith$Query$get_rental_by_id(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$get_rental_by_id<TRes> {
  factory CopyWith$Query$get_rental_by_id(
    Query$get_rental_by_id instance,
    TRes Function(Query$get_rental_by_id) then,
  ) = _CopyWithImpl$Query$get_rental_by_id;

  factory CopyWith$Query$get_rental_by_id.stub(TRes res) =
      _CopyWithStubImpl$Query$get_rental_by_id;

  TRes call({
    Query$get_rental_by_id$business_rental_by_pk? business_rental_by_pk,
    String? $__typename,
  });
  CopyWith$Query$get_rental_by_id$business_rental_by_pk<TRes>
      get business_rental_by_pk;
}

class _CopyWithImpl$Query$get_rental_by_id<TRes>
    implements CopyWith$Query$get_rental_by_id<TRes> {
  _CopyWithImpl$Query$get_rental_by_id(
    this._instance,
    this._then,
  );

  final Query$get_rental_by_id _instance;

  final TRes Function(Query$get_rental_by_id) _then;

  static const _undefined = {};

  TRes call({
    Object? business_rental_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_rental_by_id(
        business_rental_by_pk: business_rental_by_pk == _undefined
            ? _instance.business_rental_by_pk
            : (business_rental_by_pk
                as Query$get_rental_by_id$business_rental_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_rental_by_id$business_rental_by_pk<TRes>
      get business_rental_by_pk {
    final local$business_rental_by_pk = _instance.business_rental_by_pk;
    return local$business_rental_by_pk == null
        ? CopyWith$Query$get_rental_by_id$business_rental_by_pk.stub(
            _then(_instance))
        : CopyWith$Query$get_rental_by_id$business_rental_by_pk(
            local$business_rental_by_pk, (e) => call(business_rental_by_pk: e));
  }
}

class _CopyWithStubImpl$Query$get_rental_by_id<TRes>
    implements CopyWith$Query$get_rental_by_id<TRes> {
  _CopyWithStubImpl$Query$get_rental_by_id(this._res);

  TRes _res;

  call({
    Query$get_rental_by_id$business_rental_by_pk? business_rental_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_rental_by_id$business_rental_by_pk<TRes>
      get business_rental_by_pk =>
          CopyWith$Query$get_rental_by_id$business_rental_by_pk.stub(_res);
}

const documentNodeQueryget_rental_by_id = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'get_rental_by_id'),
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
        name: NameNode(value: 'business_rental_by_pk'),
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
                    name: NameNode(value: 'currency'),
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
                name: NameNode(value: 'tags'),
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
                name: NameNode(value: 'category2'),
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
                name: NameNode(value: 'name_id'),
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
            name: NameNode(value: 'category3'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'home_rental'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'bathrooms'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'bedrooms'),
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
                name: NameNode(value: 'home_type'),
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
      
    ]),
  ),
]);
Query$get_rental_by_id _parserFn$Query$get_rental_by_id(
        Map<String, dynamic> data) =>
    Query$get_rental_by_id.fromJson(data);

class Options$Query$get_rental_by_id
    extends graphql.QueryOptions<Query$get_rental_by_id> {
  Options$Query$get_rental_by_id({
    String? operationName,
    required Variables$Query$get_rental_by_id variables,
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
          document: documentNodeQueryget_rental_by_id,
          parserFn: _parserFn$Query$get_rental_by_id,
        );
}

class WatchOptions$Query$get_rental_by_id
    extends graphql.WatchQueryOptions<Query$get_rental_by_id> {
  WatchOptions$Query$get_rental_by_id({
    String? operationName,
    required Variables$Query$get_rental_by_id variables,
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
          document: documentNodeQueryget_rental_by_id,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$get_rental_by_id,
        );
}

class FetchMoreOptions$Query$get_rental_by_id extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$get_rental_by_id({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$get_rental_by_id variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryget_rental_by_id,
        );
}

extension ClientExtension$Query$get_rental_by_id on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$get_rental_by_id>> query$get_rental_by_id(
          Options$Query$get_rental_by_id options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$get_rental_by_id> watchQuery$get_rental_by_id(
          WatchOptions$Query$get_rental_by_id options) =>
      this.watchQuery(options);
  void writeQuery$get_rental_by_id({
    required Query$get_rental_by_id data,
    required Variables$Query$get_rental_by_id variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryget_rental_by_id),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$get_rental_by_id? readQuery$get_rental_by_id({
    required Variables$Query$get_rental_by_id variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQueryget_rental_by_id),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$get_rental_by_id.fromJson(result);
  }
}

class Query$get_rental_by_id$business_rental_by_pk {
  Query$get_rental_by_id$business_rental_by_pk({
    required this.id,
    required this.business,
    required this.details,
    required this.category3,
    this.home_rental,
    required this.$__typename,
  });

  factory Query$get_rental_by_id$business_rental_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$business = json['business'];
    final l$details = json['details'];
    final l$category3 = json['category3'];
    final l$home_rental = json['home_rental'];
    final l$$__typename = json['__typename'];
    return Query$get_rental_by_id$business_rental_by_pk(
      id: (l$id as int),
      business: Query$get_rental_by_id$business_rental_by_pk$business.fromJson(
          (l$business as Map<String, dynamic>)),
      details: Query$get_rental_by_id$business_rental_by_pk$details.fromJson(
          (l$details as Map<String, dynamic>)),
      category3: (l$category3 as String),
      home_rental: l$home_rental == null
          ? null
          : Query$get_rental_by_id$business_rental_by_pk$home_rental.fromJson(
              (l$home_rental as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final Query$get_rental_by_id$business_rental_by_pk$business business;

  final Query$get_rental_by_id$business_rental_by_pk$details details;

  final String category3;

  final Query$get_rental_by_id$business_rental_by_pk$home_rental? home_rental;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$business = business;
    _resultData['business'] = l$business.toJson();
    final l$details = details;
    _resultData['details'] = l$details.toJson();
    final l$category3 = category3;
    _resultData['category3'] = l$category3;
    final l$home_rental = home_rental;
    _resultData['home_rental'] = l$home_rental?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$business = business;
    final l$details = details;
    final l$category3 = category3;
    final l$home_rental = home_rental;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$business,
      l$details,
      l$category3,
      l$home_rental,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_rental_by_id$business_rental_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$business = business;
    final lOther$business = other.business;
    if (l$business != lOther$business) {
      return false;
    }
    final l$details = details;
    final lOther$details = other.details;
    if (l$details != lOther$details) {
      return false;
    }
    final l$category3 = category3;
    final lOther$category3 = other.category3;
    if (l$category3 != lOther$category3) {
      return false;
    }
    final l$home_rental = home_rental;
    final lOther$home_rental = other.home_rental;
    if (l$home_rental != lOther$home_rental) {
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

extension UtilityExtension$Query$get_rental_by_id$business_rental_by_pk
    on Query$get_rental_by_id$business_rental_by_pk {
  CopyWith$Query$get_rental_by_id$business_rental_by_pk<
          Query$get_rental_by_id$business_rental_by_pk>
      get copyWith => CopyWith$Query$get_rental_by_id$business_rental_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_rental_by_id$business_rental_by_pk<TRes> {
  factory CopyWith$Query$get_rental_by_id$business_rental_by_pk(
    Query$get_rental_by_id$business_rental_by_pk instance,
    TRes Function(Query$get_rental_by_id$business_rental_by_pk) then,
  ) = _CopyWithImpl$Query$get_rental_by_id$business_rental_by_pk;

  factory CopyWith$Query$get_rental_by_id$business_rental_by_pk.stub(TRes res) =
      _CopyWithStubImpl$Query$get_rental_by_id$business_rental_by_pk;

  TRes call({
    int? id,
    Query$get_rental_by_id$business_rental_by_pk$business? business,
    Query$get_rental_by_id$business_rental_by_pk$details? details,
    String? category3,
    Query$get_rental_by_id$business_rental_by_pk$home_rental? home_rental,
    String? $__typename,
  });
  CopyWith$Query$get_rental_by_id$business_rental_by_pk$business<TRes>
      get business;
  CopyWith$Query$get_rental_by_id$business_rental_by_pk$details<TRes>
      get details;
  CopyWith$Query$get_rental_by_id$business_rental_by_pk$home_rental<TRes>
      get home_rental;
}

class _CopyWithImpl$Query$get_rental_by_id$business_rental_by_pk<TRes>
    implements CopyWith$Query$get_rental_by_id$business_rental_by_pk<TRes> {
  _CopyWithImpl$Query$get_rental_by_id$business_rental_by_pk(
    this._instance,
    this._then,
  );

  final Query$get_rental_by_id$business_rental_by_pk _instance;

  final TRes Function(Query$get_rental_by_id$business_rental_by_pk) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? business = _undefined,
    Object? details = _undefined,
    Object? category3 = _undefined,
    Object? home_rental = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_rental_by_id$business_rental_by_pk(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        business: business == _undefined || business == null
            ? _instance.business
            : (business
                as Query$get_rental_by_id$business_rental_by_pk$business),
        details: details == _undefined || details == null
            ? _instance.details
            : (details as Query$get_rental_by_id$business_rental_by_pk$details),
        category3: category3 == _undefined || category3 == null
            ? _instance.category3
            : (category3 as String),
        home_rental: home_rental == _undefined
            ? _instance.home_rental
            : (home_rental
                as Query$get_rental_by_id$business_rental_by_pk$home_rental?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_rental_by_id$business_rental_by_pk$business<TRes>
      get business {
    final local$business = _instance.business;
    return CopyWith$Query$get_rental_by_id$business_rental_by_pk$business(
        local$business, (e) => call(business: e));
  }

  CopyWith$Query$get_rental_by_id$business_rental_by_pk$details<TRes>
      get details {
    final local$details = _instance.details;
    return CopyWith$Query$get_rental_by_id$business_rental_by_pk$details(
        local$details, (e) => call(details: e));
  }

  CopyWith$Query$get_rental_by_id$business_rental_by_pk$home_rental<TRes>
      get home_rental {
    final local$home_rental = _instance.home_rental;
    return local$home_rental == null
        ? CopyWith$Query$get_rental_by_id$business_rental_by_pk$home_rental
            .stub(_then(_instance))
        : CopyWith$Query$get_rental_by_id$business_rental_by_pk$home_rental(
            local$home_rental, (e) => call(home_rental: e));
  }
}

class _CopyWithStubImpl$Query$get_rental_by_id$business_rental_by_pk<TRes>
    implements CopyWith$Query$get_rental_by_id$business_rental_by_pk<TRes> {
  _CopyWithStubImpl$Query$get_rental_by_id$business_rental_by_pk(this._res);

  TRes _res;

  call({
    int? id,
    Query$get_rental_by_id$business_rental_by_pk$business? business,
    Query$get_rental_by_id$business_rental_by_pk$details? details,
    String? category3,
    Query$get_rental_by_id$business_rental_by_pk$home_rental? home_rental,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_rental_by_id$business_rental_by_pk$business<TRes>
      get business =>
          CopyWith$Query$get_rental_by_id$business_rental_by_pk$business.stub(
              _res);
  CopyWith$Query$get_rental_by_id$business_rental_by_pk$details<TRes>
      get details =>
          CopyWith$Query$get_rental_by_id$business_rental_by_pk$details.stub(
              _res);
  CopyWith$Query$get_rental_by_id$business_rental_by_pk$home_rental<TRes>
      get home_rental =>
          CopyWith$Query$get_rental_by_id$business_rental_by_pk$home_rental
              .stub(_res);
}

class Query$get_rental_by_id$business_rental_by_pk$business {
  Query$get_rental_by_id$business_rental_by_pk$business({
    required this.id,
    required this.details,
    required this.reviews_aggregate,
    required this.$__typename,
  });

  factory Query$get_rental_by_id$business_rental_by_pk$business.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$details = json['details'];
    final l$reviews_aggregate = json['reviews_aggregate'];
    final l$$__typename = json['__typename'];
    return Query$get_rental_by_id$business_rental_by_pk$business(
      id: (l$id as int),
      details: Query$get_rental_by_id$business_rental_by_pk$business$details
          .fromJson((l$details as Map<String, dynamic>)),
      reviews_aggregate:
          Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate
              .fromJson((l$reviews_aggregate as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final Query$get_rental_by_id$business_rental_by_pk$business$details details;

  final Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate
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
    if (!(other is Query$get_rental_by_id$business_rental_by_pk$business) ||
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

extension UtilityExtension$Query$get_rental_by_id$business_rental_by_pk$business
    on Query$get_rental_by_id$business_rental_by_pk$business {
  CopyWith$Query$get_rental_by_id$business_rental_by_pk$business<
          Query$get_rental_by_id$business_rental_by_pk$business>
      get copyWith =>
          CopyWith$Query$get_rental_by_id$business_rental_by_pk$business(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_rental_by_id$business_rental_by_pk$business<
    TRes> {
  factory CopyWith$Query$get_rental_by_id$business_rental_by_pk$business(
    Query$get_rental_by_id$business_rental_by_pk$business instance,
    TRes Function(Query$get_rental_by_id$business_rental_by_pk$business) then,
  ) = _CopyWithImpl$Query$get_rental_by_id$business_rental_by_pk$business;

  factory CopyWith$Query$get_rental_by_id$business_rental_by_pk$business.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_rental_by_id$business_rental_by_pk$business;

  TRes call({
    int? id,
    Query$get_rental_by_id$business_rental_by_pk$business$details? details,
    Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate?
        reviews_aggregate,
    String? $__typename,
  });
  CopyWith$Query$get_rental_by_id$business_rental_by_pk$business$details<TRes>
      get details;
  CopyWith$Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate<
      TRes> get reviews_aggregate;
}

class _CopyWithImpl$Query$get_rental_by_id$business_rental_by_pk$business<TRes>
    implements
        CopyWith$Query$get_rental_by_id$business_rental_by_pk$business<TRes> {
  _CopyWithImpl$Query$get_rental_by_id$business_rental_by_pk$business(
    this._instance,
    this._then,
  );

  final Query$get_rental_by_id$business_rental_by_pk$business _instance;

  final TRes Function(Query$get_rental_by_id$business_rental_by_pk$business)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? details = _undefined,
    Object? reviews_aggregate = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_rental_by_id$business_rental_by_pk$business(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        details: details == _undefined || details == null
            ? _instance.details
            : (details
                as Query$get_rental_by_id$business_rental_by_pk$business$details),
        reviews_aggregate: reviews_aggregate == _undefined ||
                reviews_aggregate == null
            ? _instance.reviews_aggregate
            : (reviews_aggregate
                as Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_rental_by_id$business_rental_by_pk$business$details<TRes>
      get details {
    final local$details = _instance.details;
    return CopyWith$Query$get_rental_by_id$business_rental_by_pk$business$details(
        local$details, (e) => call(details: e));
  }

  CopyWith$Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate<
      TRes> get reviews_aggregate {
    final local$reviews_aggregate = _instance.reviews_aggregate;
    return CopyWith$Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate(
        local$reviews_aggregate, (e) => call(reviews_aggregate: e));
  }
}

class _CopyWithStubImpl$Query$get_rental_by_id$business_rental_by_pk$business<
        TRes>
    implements
        CopyWith$Query$get_rental_by_id$business_rental_by_pk$business<TRes> {
  _CopyWithStubImpl$Query$get_rental_by_id$business_rental_by_pk$business(
      this._res);

  TRes _res;

  call({
    int? id,
    Query$get_rental_by_id$business_rental_by_pk$business$details? details,
    Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate?
        reviews_aggregate,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_rental_by_id$business_rental_by_pk$business$details<TRes>
      get details =>
          CopyWith$Query$get_rental_by_id$business_rental_by_pk$business$details
              .stub(_res);
  CopyWith$Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate<
          TRes>
      get reviews_aggregate =>
          CopyWith$Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate
              .stub(_res);
}

class Query$get_rental_by_id$business_rental_by_pk$business$details {
  Query$get_rental_by_id$business_rental_by_pk$business$details({
    required this.id,
    required this.name,
    required this.currency,
    required this.image,
    required this.location,
    required this.accepted_payments,
    required this.$__typename,
  });

  factory Query$get_rental_by_id$business_rental_by_pk$business$details.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$currency = json['currency'];
    final l$image = json['image'];
    final l$location = json['location'];
    final l$accepted_payments = json['accepted_payments'];
    final l$$__typename = json['__typename'];
    return Query$get_rental_by_id$business_rental_by_pk$business$details(
      id: (l$id as int),
      name: (l$name as String),
      currency: (l$currency as String),
      image: (l$image as String),
      location:
          Query$get_rental_by_id$business_rental_by_pk$business$details$location
              .fromJson((l$location as Map<String, dynamic>)),
      accepted_payments: mapFromJson(l$accepted_payments),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String name;

  final String currency;

  final String image;

  final Query$get_rental_by_id$business_rental_by_pk$business$details$location
      location;

  final dynamic accepted_payments;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$currency = currency;
    _resultData['currency'] = l$currency;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$location = location;
    _resultData['location'] = l$location.toJson();
    final l$accepted_payments = accepted_payments;
    _resultData['accepted_payments'] = mapToJson(l$accepted_payments);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$currency = currency;
    final l$image = image;
    final l$location = location;
    final l$accepted_payments = accepted_payments;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$currency,
      l$image,
      l$location,
      l$accepted_payments,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$get_rental_by_id$business_rental_by_pk$business$details) ||
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
    final l$currency = currency;
    final lOther$currency = other.currency;
    if (l$currency != lOther$currency) {
      return false;
    }
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) {
      return false;
    }
    final l$location = location;
    final lOther$location = other.location;
    if (l$location != lOther$location) {
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

extension UtilityExtension$Query$get_rental_by_id$business_rental_by_pk$business$details
    on Query$get_rental_by_id$business_rental_by_pk$business$details {
  CopyWith$Query$get_rental_by_id$business_rental_by_pk$business$details<
          Query$get_rental_by_id$business_rental_by_pk$business$details>
      get copyWith =>
          CopyWith$Query$get_rental_by_id$business_rental_by_pk$business$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_rental_by_id$business_rental_by_pk$business$details<
    TRes> {
  factory CopyWith$Query$get_rental_by_id$business_rental_by_pk$business$details(
    Query$get_rental_by_id$business_rental_by_pk$business$details instance,
    TRes Function(Query$get_rental_by_id$business_rental_by_pk$business$details)
        then,
  ) = _CopyWithImpl$Query$get_rental_by_id$business_rental_by_pk$business$details;

  factory CopyWith$Query$get_rental_by_id$business_rental_by_pk$business$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_rental_by_id$business_rental_by_pk$business$details;

  TRes call({
    int? id,
    String? name,
    String? currency,
    String? image,
    Query$get_rental_by_id$business_rental_by_pk$business$details$location?
        location,
    dynamic? accepted_payments,
    String? $__typename,
  });
  CopyWith$Query$get_rental_by_id$business_rental_by_pk$business$details$location<
      TRes> get location;
}

class _CopyWithImpl$Query$get_rental_by_id$business_rental_by_pk$business$details<
        TRes>
    implements
        CopyWith$Query$get_rental_by_id$business_rental_by_pk$business$details<
            TRes> {
  _CopyWithImpl$Query$get_rental_by_id$business_rental_by_pk$business$details(
    this._instance,
    this._then,
  );

  final Query$get_rental_by_id$business_rental_by_pk$business$details _instance;

  final TRes Function(
      Query$get_rental_by_id$business_rental_by_pk$business$details) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? currency = _undefined,
    Object? image = _undefined,
    Object? location = _undefined,
    Object? accepted_payments = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_rental_by_id$business_rental_by_pk$business$details(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        currency: currency == _undefined || currency == null
            ? _instance.currency
            : (currency as String),
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        location: location == _undefined || location == null
            ? _instance.location
            : (location
                as Query$get_rental_by_id$business_rental_by_pk$business$details$location),
        accepted_payments:
            accepted_payments == _undefined || accepted_payments == null
                ? _instance.accepted_payments
                : (accepted_payments as dynamic),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_rental_by_id$business_rental_by_pk$business$details$location<
      TRes> get location {
    final local$location = _instance.location;
    return CopyWith$Query$get_rental_by_id$business_rental_by_pk$business$details$location(
        local$location, (e) => call(location: e));
  }
}

class _CopyWithStubImpl$Query$get_rental_by_id$business_rental_by_pk$business$details<
        TRes>
    implements
        CopyWith$Query$get_rental_by_id$business_rental_by_pk$business$details<
            TRes> {
  _CopyWithStubImpl$Query$get_rental_by_id$business_rental_by_pk$business$details(
      this._res);

  TRes _res;

  call({
    int? id,
    String? name,
    String? currency,
    String? image,
    Query$get_rental_by_id$business_rental_by_pk$business$details$location?
        location,
    dynamic? accepted_payments,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_rental_by_id$business_rental_by_pk$business$details$location<
          TRes>
      get location =>
          CopyWith$Query$get_rental_by_id$business_rental_by_pk$business$details$location
              .stub(_res);
}

class Query$get_rental_by_id$business_rental_by_pk$business$details$location {
  Query$get_rental_by_id$business_rental_by_pk$business$details$location({
    required this.gps,
    required this.address,
    required this.$__typename,
  });

  factory Query$get_rental_by_id$business_rental_by_pk$business$details$location.fromJson(
      Map<String, dynamic> json) {
    final l$gps = json['gps'];
    final l$address = json['address'];
    final l$$__typename = json['__typename'];
    return Query$get_rental_by_id$business_rental_by_pk$business$details$location(
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
            is Query$get_rental_by_id$business_rental_by_pk$business$details$location) ||
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

extension UtilityExtension$Query$get_rental_by_id$business_rental_by_pk$business$details$location
    on Query$get_rental_by_id$business_rental_by_pk$business$details$location {
  CopyWith$Query$get_rental_by_id$business_rental_by_pk$business$details$location<
          Query$get_rental_by_id$business_rental_by_pk$business$details$location>
      get copyWith =>
          CopyWith$Query$get_rental_by_id$business_rental_by_pk$business$details$location(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_rental_by_id$business_rental_by_pk$business$details$location<
    TRes> {
  factory CopyWith$Query$get_rental_by_id$business_rental_by_pk$business$details$location(
    Query$get_rental_by_id$business_rental_by_pk$business$details$location
        instance,
    TRes Function(
            Query$get_rental_by_id$business_rental_by_pk$business$details$location)
        then,
  ) = _CopyWithImpl$Query$get_rental_by_id$business_rental_by_pk$business$details$location;

  factory CopyWith$Query$get_rental_by_id$business_rental_by_pk$business$details$location.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_rental_by_id$business_rental_by_pk$business$details$location;

  TRes call({
    Geography? gps,
    String? address,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_rental_by_id$business_rental_by_pk$business$details$location<
        TRes>
    implements
        CopyWith$Query$get_rental_by_id$business_rental_by_pk$business$details$location<
            TRes> {
  _CopyWithImpl$Query$get_rental_by_id$business_rental_by_pk$business$details$location(
    this._instance,
    this._then,
  );

  final Query$get_rental_by_id$business_rental_by_pk$business$details$location
      _instance;

  final TRes Function(
          Query$get_rental_by_id$business_rental_by_pk$business$details$location)
      _then;

  static const _undefined = {};

  TRes call({
    Object? gps = _undefined,
    Object? address = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_rental_by_id$business_rental_by_pk$business$details$location(
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

class _CopyWithStubImpl$Query$get_rental_by_id$business_rental_by_pk$business$details$location<
        TRes>
    implements
        CopyWith$Query$get_rental_by_id$business_rental_by_pk$business$details$location<
            TRes> {
  _CopyWithStubImpl$Query$get_rental_by_id$business_rental_by_pk$business$details$location(
      this._res);

  TRes _res;

  call({
    Geography? gps,
    String? address,
    String? $__typename,
  }) =>
      _res;
}

class Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate {
  Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate({
    this.aggregate,
    required this.$__typename,
  });

  factory Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate.fromJson(
      Map<String, dynamic> json) {
    final l$aggregate = json['aggregate'];
    final l$$__typename = json['__typename'];
    return Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate(
      aggregate: l$aggregate == null
          ? null
          : Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate$aggregate
              .fromJson((l$aggregate as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate$aggregate?
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
            is Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate) ||
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

extension UtilityExtension$Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate
    on Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate {
  CopyWith$Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate<
          Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate>
      get copyWith =>
          CopyWith$Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate<
    TRes> {
  factory CopyWith$Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate(
    Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate
        instance,
    TRes Function(
            Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate)
        then,
  ) = _CopyWithImpl$Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate;

  factory CopyWith$Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate;

  TRes call({
    Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate$aggregate?
        aggregate,
    String? $__typename,
  });
  CopyWith$Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate$aggregate<
      TRes> get aggregate;
}

class _CopyWithImpl$Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate<
        TRes>
    implements
        CopyWith$Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate<
            TRes> {
  _CopyWithImpl$Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate(
    this._instance,
    this._then,
  );

  final Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate
      _instance;

  final TRes Function(
          Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate)
      _then;

  static const _undefined = {};

  TRes call({
    Object? aggregate = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate(
        aggregate: aggregate == _undefined
            ? _instance.aggregate
            : (aggregate
                as Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate$aggregate?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate$aggregate<
      TRes> get aggregate {
    final local$aggregate = _instance.aggregate;
    return local$aggregate == null
        ? CopyWith$Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate$aggregate
            .stub(_then(_instance))
        : CopyWith$Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate$aggregate(
            local$aggregate, (e) => call(aggregate: e));
  }
}

class _CopyWithStubImpl$Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate<
        TRes>
    implements
        CopyWith$Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate<
            TRes> {
  _CopyWithStubImpl$Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate(
      this._res);

  TRes _res;

  call({
    Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate$aggregate?
        aggregate,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate$aggregate<
          TRes>
      get aggregate =>
          CopyWith$Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate$aggregate
              .stub(_res);
}

class Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate$aggregate {
  Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate$aggregate({
    this.avg,
    required this.count,
    required this.$__typename,
  });

  factory Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate$aggregate.fromJson(
      Map<String, dynamic> json) {
    final l$avg = json['avg'];
    final l$count = json['count'];
    final l$$__typename = json['__typename'];
    return Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate$aggregate(
      avg: l$avg == null
          ? null
          : Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate$aggregate$avg
              .fromJson((l$avg as Map<String, dynamic>)),
      count: (l$count as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate$aggregate$avg?
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
            is Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate$aggregate) ||
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

extension UtilityExtension$Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate$aggregate
    on Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate$aggregate {
  CopyWith$Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate$aggregate<
          Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate$aggregate>
      get copyWith =>
          CopyWith$Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate$aggregate(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate$aggregate<
    TRes> {
  factory CopyWith$Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate$aggregate(
    Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate$aggregate
        instance,
    TRes Function(
            Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate$aggregate)
        then,
  ) = _CopyWithImpl$Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate$aggregate;

  factory CopyWith$Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate$aggregate.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate$aggregate;

  TRes call({
    Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate$aggregate$avg?
        avg,
    int? count,
    String? $__typename,
  });
  CopyWith$Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate$aggregate$avg<
      TRes> get avg;
}

class _CopyWithImpl$Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate$aggregate<
        TRes>
    implements
        CopyWith$Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate$aggregate<
            TRes> {
  _CopyWithImpl$Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate$aggregate(
    this._instance,
    this._then,
  );

  final Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate$aggregate
      _instance;

  final TRes Function(
          Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate$aggregate)
      _then;

  static const _undefined = {};

  TRes call({
    Object? avg = _undefined,
    Object? count = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate$aggregate(
        avg: avg == _undefined
            ? _instance.avg
            : (avg
                as Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate$aggregate$avg?),
        count: count == _undefined || count == null
            ? _instance.count
            : (count as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate$aggregate$avg<
      TRes> get avg {
    final local$avg = _instance.avg;
    return local$avg == null
        ? CopyWith$Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate$aggregate$avg
            .stub(_then(_instance))
        : CopyWith$Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate$aggregate$avg(
            local$avg, (e) => call(avg: e));
  }
}

class _CopyWithStubImpl$Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate$aggregate<
        TRes>
    implements
        CopyWith$Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate$aggregate<
            TRes> {
  _CopyWithStubImpl$Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate$aggregate(
      this._res);

  TRes _res;

  call({
    Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate$aggregate$avg?
        avg,
    int? count,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate$aggregate$avg<
          TRes>
      get avg =>
          CopyWith$Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate$aggregate$avg
              .stub(_res);
}

class Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate$aggregate$avg {
  Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate$aggregate$avg({
    this.rating,
    required this.$__typename,
  });

  factory Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate$aggregate$avg.fromJson(
      Map<String, dynamic> json) {
    final l$rating = json['rating'];
    final l$$__typename = json['__typename'];
    return Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate$aggregate$avg(
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
            is Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate$aggregate$avg) ||
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

extension UtilityExtension$Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate$aggregate$avg
    on Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate$aggregate$avg {
  CopyWith$Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate$aggregate$avg<
          Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate$aggregate$avg>
      get copyWith =>
          CopyWith$Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate$aggregate$avg(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate$aggregate$avg<
    TRes> {
  factory CopyWith$Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate$aggregate$avg(
    Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate$aggregate$avg
        instance,
    TRes Function(
            Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate$aggregate$avg)
        then,
  ) = _CopyWithImpl$Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate$aggregate$avg;

  factory CopyWith$Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate$aggregate$avg.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate$aggregate$avg;

  TRes call({
    double? rating,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate$aggregate$avg<
        TRes>
    implements
        CopyWith$Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate$aggregate$avg<
            TRes> {
  _CopyWithImpl$Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate$aggregate$avg(
    this._instance,
    this._then,
  );

  final Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate$aggregate$avg
      _instance;

  final TRes Function(
          Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate$aggregate$avg)
      _then;

  static const _undefined = {};

  TRes call({
    Object? rating = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate$aggregate$avg(
        rating: rating == _undefined ? _instance.rating : (rating as double?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate$aggregate$avg<
        TRes>
    implements
        CopyWith$Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate$aggregate$avg<
            TRes> {
  _CopyWithStubImpl$Query$get_rental_by_id$business_rental_by_pk$business$reviews_aggregate$aggregate$avg(
      this._res);

  TRes _res;

  call({
    double? rating,
    String? $__typename,
  }) =>
      _res;
}

class Query$get_rental_by_id$business_rental_by_pk$details {
  Query$get_rental_by_id$business_rental_by_pk$details({
    this.additional_parameters,
    required this.available,
    required this.tags,
    required this.category1,
    required this.category2,
    required this.cost,
    this.description,
    required this.name_id,
    this.description_id,
    required this.id,
    this.image,
    required this.name,
    required this.position,
    required this.$__typename,
  });

  factory Query$get_rental_by_id$business_rental_by_pk$details.fromJson(
      Map<String, dynamic> json) {
    final l$additional_parameters = json['additional_parameters'];
    final l$available = json['available'];
    final l$tags = json['tags'];
    final l$category1 = json['category1'];
    final l$category2 = json['category2'];
    final l$cost = json['cost'];
    final l$description = json['description'];
    final l$name_id = json['name_id'];
    final l$description_id = json['description_id'];
    final l$id = json['id'];
    final l$image = json['image'];
    final l$name = json['name'];
    final l$position = json['position'];
    final l$$__typename = json['__typename'];
    return Query$get_rental_by_id$business_rental_by_pk$details(
      additional_parameters: l$additional_parameters == null
          ? null
          : mapFromJson(l$additional_parameters),
      available: (l$available as bool),
      tags: mapFromJson(l$tags),
      category1: (l$category1 as String),
      category2: (l$category2 as String),
      cost: mapFromJson(l$cost),
      description: l$description == null
          ? null
          : Query$get_rental_by_id$business_rental_by_pk$details$description
              .fromJson((l$description as Map<String, dynamic>)),
      name_id: (l$name_id as int),
      description_id: (l$description_id as int?),
      id: (l$id as int),
      image: l$image == null ? null : mapFromJson(l$image),
      name: Query$get_rental_by_id$business_rental_by_pk$details$name.fromJson(
          (l$name as Map<String, dynamic>)),
      position: (l$position as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final dynamic? additional_parameters;

  final bool available;

  final dynamic tags;

  final String category1;

  final String category2;

  final dynamic cost;

  final Query$get_rental_by_id$business_rental_by_pk$details$description?
      description;

  final int name_id;

  final int? description_id;

  final int id;

  final dynamic? image;

  final Query$get_rental_by_id$business_rental_by_pk$details$name name;

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
    final l$tags = tags;
    _resultData['tags'] = mapToJson(l$tags);
    final l$category1 = category1;
    _resultData['category1'] = l$category1;
    final l$category2 = category2;
    _resultData['category2'] = l$category2;
    final l$cost = cost;
    _resultData['cost'] = mapToJson(l$cost);
    final l$description = description;
    _resultData['description'] = l$description?.toJson();
    final l$name_id = name_id;
    _resultData['name_id'] = l$name_id;
    final l$description_id = description_id;
    _resultData['description_id'] = l$description_id;
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
    final l$tags = tags;
    final l$category1 = category1;
    final l$category2 = category2;
    final l$cost = cost;
    final l$description = description;
    final l$name_id = name_id;
    final l$description_id = description_id;
    final l$id = id;
    final l$image = image;
    final l$name = name;
    final l$position = position;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$additional_parameters,
      l$available,
      l$tags,
      l$category1,
      l$category2,
      l$cost,
      l$description,
      l$name_id,
      l$description_id,
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
    if (!(other is Query$get_rental_by_id$business_rental_by_pk$details) ||
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
    final l$tags = tags;
    final lOther$tags = other.tags;
    if (l$tags != lOther$tags) {
      return false;
    }
    final l$category1 = category1;
    final lOther$category1 = other.category1;
    if (l$category1 != lOther$category1) {
      return false;
    }
    final l$category2 = category2;
    final lOther$category2 = other.category2;
    if (l$category2 != lOther$category2) {
      return false;
    }
    final l$cost = cost;
    final lOther$cost = other.cost;
    if (l$cost != lOther$cost) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
      return false;
    }
    final l$name_id = name_id;
    final lOther$name_id = other.name_id;
    if (l$name_id != lOther$name_id) {
      return false;
    }
    final l$description_id = description_id;
    final lOther$description_id = other.description_id;
    if (l$description_id != lOther$description_id) {
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

extension UtilityExtension$Query$get_rental_by_id$business_rental_by_pk$details
    on Query$get_rental_by_id$business_rental_by_pk$details {
  CopyWith$Query$get_rental_by_id$business_rental_by_pk$details<
          Query$get_rental_by_id$business_rental_by_pk$details>
      get copyWith =>
          CopyWith$Query$get_rental_by_id$business_rental_by_pk$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_rental_by_id$business_rental_by_pk$details<
    TRes> {
  factory CopyWith$Query$get_rental_by_id$business_rental_by_pk$details(
    Query$get_rental_by_id$business_rental_by_pk$details instance,
    TRes Function(Query$get_rental_by_id$business_rental_by_pk$details) then,
  ) = _CopyWithImpl$Query$get_rental_by_id$business_rental_by_pk$details;

  factory CopyWith$Query$get_rental_by_id$business_rental_by_pk$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_rental_by_id$business_rental_by_pk$details;

  TRes call({
    dynamic? additional_parameters,
    bool? available,
    dynamic? tags,
    String? category1,
    String? category2,
    dynamic? cost,
    Query$get_rental_by_id$business_rental_by_pk$details$description?
        description,
    int? name_id,
    int? description_id,
    int? id,
    dynamic? image,
    Query$get_rental_by_id$business_rental_by_pk$details$name? name,
    int? position,
    String? $__typename,
  });
  CopyWith$Query$get_rental_by_id$business_rental_by_pk$details$description<
      TRes> get description;
  CopyWith$Query$get_rental_by_id$business_rental_by_pk$details$name<TRes>
      get name;
}

class _CopyWithImpl$Query$get_rental_by_id$business_rental_by_pk$details<TRes>
    implements
        CopyWith$Query$get_rental_by_id$business_rental_by_pk$details<TRes> {
  _CopyWithImpl$Query$get_rental_by_id$business_rental_by_pk$details(
    this._instance,
    this._then,
  );

  final Query$get_rental_by_id$business_rental_by_pk$details _instance;

  final TRes Function(Query$get_rental_by_id$business_rental_by_pk$details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? additional_parameters = _undefined,
    Object? available = _undefined,
    Object? tags = _undefined,
    Object? category1 = _undefined,
    Object? category2 = _undefined,
    Object? cost = _undefined,
    Object? description = _undefined,
    Object? name_id = _undefined,
    Object? description_id = _undefined,
    Object? id = _undefined,
    Object? image = _undefined,
    Object? name = _undefined,
    Object? position = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_rental_by_id$business_rental_by_pk$details(
        additional_parameters: additional_parameters == _undefined
            ? _instance.additional_parameters
            : (additional_parameters as dynamic?),
        available: available == _undefined || available == null
            ? _instance.available
            : (available as bool),
        tags: tags == _undefined || tags == null
            ? _instance.tags
            : (tags as dynamic),
        category1: category1 == _undefined || category1 == null
            ? _instance.category1
            : (category1 as String),
        category2: category2 == _undefined || category2 == null
            ? _instance.category2
            : (category2 as String),
        cost: cost == _undefined || cost == null
            ? _instance.cost
            : (cost as dynamic),
        description: description == _undefined
            ? _instance.description
            : (description
                as Query$get_rental_by_id$business_rental_by_pk$details$description?),
        name_id: name_id == _undefined || name_id == null
            ? _instance.name_id
            : (name_id as int),
        description_id: description_id == _undefined
            ? _instance.description_id
            : (description_id as int?),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        image: image == _undefined ? _instance.image : (image as dynamic?),
        name: name == _undefined || name == null
            ? _instance.name
            : (name
                as Query$get_rental_by_id$business_rental_by_pk$details$name),
        position: position == _undefined || position == null
            ? _instance.position
            : (position as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_rental_by_id$business_rental_by_pk$details$description<
      TRes> get description {
    final local$description = _instance.description;
    return local$description == null
        ? CopyWith$Query$get_rental_by_id$business_rental_by_pk$details$description
            .stub(_then(_instance))
        : CopyWith$Query$get_rental_by_id$business_rental_by_pk$details$description(
            local$description, (e) => call(description: e));
  }

  CopyWith$Query$get_rental_by_id$business_rental_by_pk$details$name<TRes>
      get name {
    final local$name = _instance.name;
    return CopyWith$Query$get_rental_by_id$business_rental_by_pk$details$name(
        local$name, (e) => call(name: e));
  }
}

class _CopyWithStubImpl$Query$get_rental_by_id$business_rental_by_pk$details<
        TRes>
    implements
        CopyWith$Query$get_rental_by_id$business_rental_by_pk$details<TRes> {
  _CopyWithStubImpl$Query$get_rental_by_id$business_rental_by_pk$details(
      this._res);

  TRes _res;

  call({
    dynamic? additional_parameters,
    bool? available,
    dynamic? tags,
    String? category1,
    String? category2,
    dynamic? cost,
    Query$get_rental_by_id$business_rental_by_pk$details$description?
        description,
    int? name_id,
    int? description_id,
    int? id,
    dynamic? image,
    Query$get_rental_by_id$business_rental_by_pk$details$name? name,
    int? position,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_rental_by_id$business_rental_by_pk$details$description<
          TRes>
      get description =>
          CopyWith$Query$get_rental_by_id$business_rental_by_pk$details$description
              .stub(_res);
  CopyWith$Query$get_rental_by_id$business_rental_by_pk$details$name<TRes>
      get name =>
          CopyWith$Query$get_rental_by_id$business_rental_by_pk$details$name
              .stub(_res);
}

class Query$get_rental_by_id$business_rental_by_pk$details$description {
  Query$get_rental_by_id$business_rental_by_pk$details$description({
    required this.translations,
    required this.$__typename,
  });

  factory Query$get_rental_by_id$business_rental_by_pk$details$description.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$get_rental_by_id$business_rental_by_pk$details$description(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$get_rental_by_id$business_rental_by_pk$details$description$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Query$get_rental_by_id$business_rental_by_pk$details$description$translations>
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
            is Query$get_rental_by_id$business_rental_by_pk$details$description) ||
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

extension UtilityExtension$Query$get_rental_by_id$business_rental_by_pk$details$description
    on Query$get_rental_by_id$business_rental_by_pk$details$description {
  CopyWith$Query$get_rental_by_id$business_rental_by_pk$details$description<
          Query$get_rental_by_id$business_rental_by_pk$details$description>
      get copyWith =>
          CopyWith$Query$get_rental_by_id$business_rental_by_pk$details$description(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_rental_by_id$business_rental_by_pk$details$description<
    TRes> {
  factory CopyWith$Query$get_rental_by_id$business_rental_by_pk$details$description(
    Query$get_rental_by_id$business_rental_by_pk$details$description instance,
    TRes Function(
            Query$get_rental_by_id$business_rental_by_pk$details$description)
        then,
  ) = _CopyWithImpl$Query$get_rental_by_id$business_rental_by_pk$details$description;

  factory CopyWith$Query$get_rental_by_id$business_rental_by_pk$details$description.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_rental_by_id$business_rental_by_pk$details$description;

  TRes call({
    List<Query$get_rental_by_id$business_rental_by_pk$details$description$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$get_rental_by_id$business_rental_by_pk$details$description$translations> Function(
              Iterable<
                  CopyWith$Query$get_rental_by_id$business_rental_by_pk$details$description$translations<
                      Query$get_rental_by_id$business_rental_by_pk$details$description$translations>>)
          _fn);
}

class _CopyWithImpl$Query$get_rental_by_id$business_rental_by_pk$details$description<
        TRes>
    implements
        CopyWith$Query$get_rental_by_id$business_rental_by_pk$details$description<
            TRes> {
  _CopyWithImpl$Query$get_rental_by_id$business_rental_by_pk$details$description(
    this._instance,
    this._then,
  );

  final Query$get_rental_by_id$business_rental_by_pk$details$description
      _instance;

  final TRes Function(
      Query$get_rental_by_id$business_rental_by_pk$details$description) _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_rental_by_id$business_rental_by_pk$details$description(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$get_rental_by_id$business_rental_by_pk$details$description$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$get_rental_by_id$business_rental_by_pk$details$description$translations> Function(
                  Iterable<
                      CopyWith$Query$get_rental_by_id$business_rental_by_pk$details$description$translations<
                          Query$get_rental_by_id$business_rental_by_pk$details$description$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$get_rental_by_id$business_rental_by_pk$details$description$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$get_rental_by_id$business_rental_by_pk$details$description<
        TRes>
    implements
        CopyWith$Query$get_rental_by_id$business_rental_by_pk$details$description<
            TRes> {
  _CopyWithStubImpl$Query$get_rental_by_id$business_rental_by_pk$details$description(
      this._res);

  TRes _res;

  call({
    List<Query$get_rental_by_id$business_rental_by_pk$details$description$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$get_rental_by_id$business_rental_by_pk$details$description$translations {
  Query$get_rental_by_id$business_rental_by_pk$details$description$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$get_rental_by_id$business_rental_by_pk$details$description$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$get_rental_by_id$business_rental_by_pk$details$description$translations(
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
            is Query$get_rental_by_id$business_rental_by_pk$details$description$translations) ||
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

extension UtilityExtension$Query$get_rental_by_id$business_rental_by_pk$details$description$translations
    on Query$get_rental_by_id$business_rental_by_pk$details$description$translations {
  CopyWith$Query$get_rental_by_id$business_rental_by_pk$details$description$translations<
          Query$get_rental_by_id$business_rental_by_pk$details$description$translations>
      get copyWith =>
          CopyWith$Query$get_rental_by_id$business_rental_by_pk$details$description$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_rental_by_id$business_rental_by_pk$details$description$translations<
    TRes> {
  factory CopyWith$Query$get_rental_by_id$business_rental_by_pk$details$description$translations(
    Query$get_rental_by_id$business_rental_by_pk$details$description$translations
        instance,
    TRes Function(
            Query$get_rental_by_id$business_rental_by_pk$details$description$translations)
        then,
  ) = _CopyWithImpl$Query$get_rental_by_id$business_rental_by_pk$details$description$translations;

  factory CopyWith$Query$get_rental_by_id$business_rental_by_pk$details$description$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_rental_by_id$business_rental_by_pk$details$description$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_rental_by_id$business_rental_by_pk$details$description$translations<
        TRes>
    implements
        CopyWith$Query$get_rental_by_id$business_rental_by_pk$details$description$translations<
            TRes> {
  _CopyWithImpl$Query$get_rental_by_id$business_rental_by_pk$details$description$translations(
    this._instance,
    this._then,
  );

  final Query$get_rental_by_id$business_rental_by_pk$details$description$translations
      _instance;

  final TRes Function(
          Query$get_rental_by_id$business_rental_by_pk$details$description$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_rental_by_id$business_rental_by_pk$details$description$translations(
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

class _CopyWithStubImpl$Query$get_rental_by_id$business_rental_by_pk$details$description$translations<
        TRes>
    implements
        CopyWith$Query$get_rental_by_id$business_rental_by_pk$details$description$translations<
            TRes> {
  _CopyWithStubImpl$Query$get_rental_by_id$business_rental_by_pk$details$description$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Query$get_rental_by_id$business_rental_by_pk$details$name {
  Query$get_rental_by_id$business_rental_by_pk$details$name({
    required this.translations,
    required this.$__typename,
  });

  factory Query$get_rental_by_id$business_rental_by_pk$details$name.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$get_rental_by_id$business_rental_by_pk$details$name(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$get_rental_by_id$business_rental_by_pk$details$name$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Query$get_rental_by_id$business_rental_by_pk$details$name$translations>
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
    if (!(other is Query$get_rental_by_id$business_rental_by_pk$details$name) ||
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

extension UtilityExtension$Query$get_rental_by_id$business_rental_by_pk$details$name
    on Query$get_rental_by_id$business_rental_by_pk$details$name {
  CopyWith$Query$get_rental_by_id$business_rental_by_pk$details$name<
          Query$get_rental_by_id$business_rental_by_pk$details$name>
      get copyWith =>
          CopyWith$Query$get_rental_by_id$business_rental_by_pk$details$name(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_rental_by_id$business_rental_by_pk$details$name<
    TRes> {
  factory CopyWith$Query$get_rental_by_id$business_rental_by_pk$details$name(
    Query$get_rental_by_id$business_rental_by_pk$details$name instance,
    TRes Function(Query$get_rental_by_id$business_rental_by_pk$details$name)
        then,
  ) = _CopyWithImpl$Query$get_rental_by_id$business_rental_by_pk$details$name;

  factory CopyWith$Query$get_rental_by_id$business_rental_by_pk$details$name.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_rental_by_id$business_rental_by_pk$details$name;

  TRes call({
    List<Query$get_rental_by_id$business_rental_by_pk$details$name$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$get_rental_by_id$business_rental_by_pk$details$name$translations> Function(
              Iterable<
                  CopyWith$Query$get_rental_by_id$business_rental_by_pk$details$name$translations<
                      Query$get_rental_by_id$business_rental_by_pk$details$name$translations>>)
          _fn);
}

class _CopyWithImpl$Query$get_rental_by_id$business_rental_by_pk$details$name<
        TRes>
    implements
        CopyWith$Query$get_rental_by_id$business_rental_by_pk$details$name<
            TRes> {
  _CopyWithImpl$Query$get_rental_by_id$business_rental_by_pk$details$name(
    this._instance,
    this._then,
  );

  final Query$get_rental_by_id$business_rental_by_pk$details$name _instance;

  final TRes Function(Query$get_rental_by_id$business_rental_by_pk$details$name)
      _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_rental_by_id$business_rental_by_pk$details$name(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$get_rental_by_id$business_rental_by_pk$details$name$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$get_rental_by_id$business_rental_by_pk$details$name$translations> Function(
                  Iterable<
                      CopyWith$Query$get_rental_by_id$business_rental_by_pk$details$name$translations<
                          Query$get_rental_by_id$business_rental_by_pk$details$name$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$get_rental_by_id$business_rental_by_pk$details$name$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$get_rental_by_id$business_rental_by_pk$details$name<
        TRes>
    implements
        CopyWith$Query$get_rental_by_id$business_rental_by_pk$details$name<
            TRes> {
  _CopyWithStubImpl$Query$get_rental_by_id$business_rental_by_pk$details$name(
      this._res);

  TRes _res;

  call({
    List<Query$get_rental_by_id$business_rental_by_pk$details$name$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$get_rental_by_id$business_rental_by_pk$details$name$translations {
  Query$get_rental_by_id$business_rental_by_pk$details$name$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$get_rental_by_id$business_rental_by_pk$details$name$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$get_rental_by_id$business_rental_by_pk$details$name$translations(
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
            is Query$get_rental_by_id$business_rental_by_pk$details$name$translations) ||
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

extension UtilityExtension$Query$get_rental_by_id$business_rental_by_pk$details$name$translations
    on Query$get_rental_by_id$business_rental_by_pk$details$name$translations {
  CopyWith$Query$get_rental_by_id$business_rental_by_pk$details$name$translations<
          Query$get_rental_by_id$business_rental_by_pk$details$name$translations>
      get copyWith =>
          CopyWith$Query$get_rental_by_id$business_rental_by_pk$details$name$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_rental_by_id$business_rental_by_pk$details$name$translations<
    TRes> {
  factory CopyWith$Query$get_rental_by_id$business_rental_by_pk$details$name$translations(
    Query$get_rental_by_id$business_rental_by_pk$details$name$translations
        instance,
    TRes Function(
            Query$get_rental_by_id$business_rental_by_pk$details$name$translations)
        then,
  ) = _CopyWithImpl$Query$get_rental_by_id$business_rental_by_pk$details$name$translations;

  factory CopyWith$Query$get_rental_by_id$business_rental_by_pk$details$name$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_rental_by_id$business_rental_by_pk$details$name$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_rental_by_id$business_rental_by_pk$details$name$translations<
        TRes>
    implements
        CopyWith$Query$get_rental_by_id$business_rental_by_pk$details$name$translations<
            TRes> {
  _CopyWithImpl$Query$get_rental_by_id$business_rental_by_pk$details$name$translations(
    this._instance,
    this._then,
  );

  final Query$get_rental_by_id$business_rental_by_pk$details$name$translations
      _instance;

  final TRes Function(
          Query$get_rental_by_id$business_rental_by_pk$details$name$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_rental_by_id$business_rental_by_pk$details$name$translations(
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

class _CopyWithStubImpl$Query$get_rental_by_id$business_rental_by_pk$details$name$translations<
        TRes>
    implements
        CopyWith$Query$get_rental_by_id$business_rental_by_pk$details$name$translations<
            TRes> {
  _CopyWithStubImpl$Query$get_rental_by_id$business_rental_by_pk$details$name$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Query$get_rental_by_id$business_rental_by_pk$home_rental {
  Query$get_rental_by_id$business_rental_by_pk$home_rental({
    required this.bathrooms,
    required this.bedrooms,
    required this.gps_location,
    required this.home_type,
    required this.address,
    required this.$__typename,
  });

  factory Query$get_rental_by_id$business_rental_by_pk$home_rental.fromJson(
      Map<String, dynamic> json) {
    final l$bathrooms = json['bathrooms'];
    final l$bedrooms = json['bedrooms'];
    final l$gps_location = json['gps_location'];
    final l$home_type = json['home_type'];
    final l$address = json['address'];
    final l$$__typename = json['__typename'];
    return Query$get_rental_by_id$business_rental_by_pk$home_rental(
      bathrooms: (l$bathrooms as int),
      bedrooms: (l$bedrooms as int),
      gps_location: geographyFromJson(l$gps_location),
      home_type: (l$home_type as String),
      address: (l$address as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int bathrooms;

  final int bedrooms;

  final Geography gps_location;

  final String home_type;

  final String address;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$bathrooms = bathrooms;
    _resultData['bathrooms'] = l$bathrooms;
    final l$bedrooms = bedrooms;
    _resultData['bedrooms'] = l$bedrooms;
    final l$gps_location = gps_location;
    _resultData['gps_location'] = geographyToJson(l$gps_location);
    final l$home_type = home_type;
    _resultData['home_type'] = l$home_type;
    final l$address = address;
    _resultData['address'] = l$address;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$bathrooms = bathrooms;
    final l$bedrooms = bedrooms;
    final l$gps_location = gps_location;
    final l$home_type = home_type;
    final l$address = address;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$bathrooms,
      l$bedrooms,
      l$gps_location,
      l$home_type,
      l$address,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_rental_by_id$business_rental_by_pk$home_rental) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$bathrooms = bathrooms;
    final lOther$bathrooms = other.bathrooms;
    if (l$bathrooms != lOther$bathrooms) {
      return false;
    }
    final l$bedrooms = bedrooms;
    final lOther$bedrooms = other.bedrooms;
    if (l$bedrooms != lOther$bedrooms) {
      return false;
    }
    final l$gps_location = gps_location;
    final lOther$gps_location = other.gps_location;
    if (l$gps_location != lOther$gps_location) {
      return false;
    }
    final l$home_type = home_type;
    final lOther$home_type = other.home_type;
    if (l$home_type != lOther$home_type) {
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

extension UtilityExtension$Query$get_rental_by_id$business_rental_by_pk$home_rental
    on Query$get_rental_by_id$business_rental_by_pk$home_rental {
  CopyWith$Query$get_rental_by_id$business_rental_by_pk$home_rental<
          Query$get_rental_by_id$business_rental_by_pk$home_rental>
      get copyWith =>
          CopyWith$Query$get_rental_by_id$business_rental_by_pk$home_rental(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_rental_by_id$business_rental_by_pk$home_rental<
    TRes> {
  factory CopyWith$Query$get_rental_by_id$business_rental_by_pk$home_rental(
    Query$get_rental_by_id$business_rental_by_pk$home_rental instance,
    TRes Function(Query$get_rental_by_id$business_rental_by_pk$home_rental)
        then,
  ) = _CopyWithImpl$Query$get_rental_by_id$business_rental_by_pk$home_rental;

  factory CopyWith$Query$get_rental_by_id$business_rental_by_pk$home_rental.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_rental_by_id$business_rental_by_pk$home_rental;

  TRes call({
    int? bathrooms,
    int? bedrooms,
    Geography? gps_location,
    String? home_type,
    String? address,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_rental_by_id$business_rental_by_pk$home_rental<
        TRes>
    implements
        CopyWith$Query$get_rental_by_id$business_rental_by_pk$home_rental<
            TRes> {
  _CopyWithImpl$Query$get_rental_by_id$business_rental_by_pk$home_rental(
    this._instance,
    this._then,
  );

  final Query$get_rental_by_id$business_rental_by_pk$home_rental _instance;

  final TRes Function(Query$get_rental_by_id$business_rental_by_pk$home_rental)
      _then;

  static const _undefined = {};

  TRes call({
    Object? bathrooms = _undefined,
    Object? bedrooms = _undefined,
    Object? gps_location = _undefined,
    Object? home_type = _undefined,
    Object? address = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_rental_by_id$business_rental_by_pk$home_rental(
        bathrooms: bathrooms == _undefined || bathrooms == null
            ? _instance.bathrooms
            : (bathrooms as int),
        bedrooms: bedrooms == _undefined || bedrooms == null
            ? _instance.bedrooms
            : (bedrooms as int),
        gps_location: gps_location == _undefined || gps_location == null
            ? _instance.gps_location
            : (gps_location as Geography),
        home_type: home_type == _undefined || home_type == null
            ? _instance.home_type
            : (home_type as String),
        address: address == _undefined || address == null
            ? _instance.address
            : (address as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$get_rental_by_id$business_rental_by_pk$home_rental<
        TRes>
    implements
        CopyWith$Query$get_rental_by_id$business_rental_by_pk$home_rental<
            TRes> {
  _CopyWithStubImpl$Query$get_rental_by_id$business_rental_by_pk$home_rental(
      this._res);

  TRes _res;

  call({
    int? bathrooms,
    int? bedrooms,
    Geography? gps_location,
    String? home_type,
    String? address,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$get_home_rentals {
  factory Variables$Query$get_home_rentals({
    required double distance,
    required Geography from,
    int? limit,
    int? offset,
  }) =>
      Variables$Query$get_home_rentals._({
        r'distance': distance,
        r'from': from,
        if (limit != null) r'limit': limit,
        if (offset != null) r'offset': offset,
      });

  Variables$Query$get_home_rentals._(this._$data);

  factory Variables$Query$get_home_rentals.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$distance = data['distance'];
    result$data['distance'] = (l$distance as num).toDouble();
    final l$from = data['from'];
    result$data['from'] = geographyFromJson(l$from);
    if (data.containsKey('limit')) {
      final l$limit = data['limit'];
      result$data['limit'] = (l$limit as int?);
    }
    if (data.containsKey('offset')) {
      final l$offset = data['offset'];
      result$data['offset'] = (l$offset as int?);
    }
    return Variables$Query$get_home_rentals._(result$data);
  }

  Map<String, dynamic> _$data;

  double get distance => (_$data['distance'] as double);
  Geography get from => (_$data['from'] as Geography);
  int? get limit => (_$data['limit'] as int?);
  int? get offset => (_$data['offset'] as int?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$distance = distance;
    result$data['distance'] = l$distance;
    final l$from = from;
    result$data['from'] = geographyToJson(l$from);
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

  CopyWith$Variables$Query$get_home_rentals<Variables$Query$get_home_rentals>
      get copyWith => CopyWith$Variables$Query$get_home_rentals(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$get_home_rentals) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$distance = distance;
    final lOther$distance = other.distance;
    if (l$distance != lOther$distance) {
      return false;
    }
    final l$from = from;
    final lOther$from = other.from;
    if (l$from != lOther$from) {
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
    final l$distance = distance;
    final l$from = from;
    final l$limit = limit;
    final l$offset = offset;
    return Object.hashAll([
      l$distance,
      l$from,
      _$data.containsKey('limit') ? l$limit : const {},
      _$data.containsKey('offset') ? l$offset : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$get_home_rentals<TRes> {
  factory CopyWith$Variables$Query$get_home_rentals(
    Variables$Query$get_home_rentals instance,
    TRes Function(Variables$Query$get_home_rentals) then,
  ) = _CopyWithImpl$Variables$Query$get_home_rentals;

  factory CopyWith$Variables$Query$get_home_rentals.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$get_home_rentals;

  TRes call({
    double? distance,
    Geography? from,
    int? limit,
    int? offset,
  });
}

class _CopyWithImpl$Variables$Query$get_home_rentals<TRes>
    implements CopyWith$Variables$Query$get_home_rentals<TRes> {
  _CopyWithImpl$Variables$Query$get_home_rentals(
    this._instance,
    this._then,
  );

  final Variables$Query$get_home_rentals _instance;

  final TRes Function(Variables$Query$get_home_rentals) _then;

  static const _undefined = {};

  TRes call({
    Object? distance = _undefined,
    Object? from = _undefined,
    Object? limit = _undefined,
    Object? offset = _undefined,
  }) =>
      _then(Variables$Query$get_home_rentals._({
        ..._instance._$data,
        if (distance != _undefined && distance != null)
          'distance': (distance as double),
        if (from != _undefined && from != null) 'from': (from as Geography),
        if (limit != _undefined) 'limit': (limit as int?),
        if (offset != _undefined) 'offset': (offset as int?),
      }));
}

class _CopyWithStubImpl$Variables$Query$get_home_rentals<TRes>
    implements CopyWith$Variables$Query$get_home_rentals<TRes> {
  _CopyWithStubImpl$Variables$Query$get_home_rentals(this._res);

  TRes _res;

  call({
    double? distance,
    Geography? from,
    int? limit,
    int? offset,
  }) =>
      _res;
}

class Query$get_home_rentals {
  Query$get_home_rentals({
    required this.business_home_rental,
    required this.$__typename,
  });

  factory Query$get_home_rentals.fromJson(Map<String, dynamic> json) {
    final l$business_home_rental = json['business_home_rental'];
    final l$$__typename = json['__typename'];
    return Query$get_home_rentals(
      business_home_rental: (l$business_home_rental as List<dynamic>)
          .map((e) => Query$get_home_rentals$business_home_rental.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$get_home_rentals$business_home_rental> business_home_rental;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$business_home_rental = business_home_rental;
    _resultData['business_home_rental'] =
        l$business_home_rental.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$business_home_rental = business_home_rental;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$business_home_rental.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_home_rentals) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$business_home_rental = business_home_rental;
    final lOther$business_home_rental = other.business_home_rental;
    if (l$business_home_rental.length != lOther$business_home_rental.length) {
      return false;
    }
    for (int i = 0; i < l$business_home_rental.length; i++) {
      final l$business_home_rental$entry = l$business_home_rental[i];
      final lOther$business_home_rental$entry = lOther$business_home_rental[i];
      if (l$business_home_rental$entry != lOther$business_home_rental$entry) {
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

extension UtilityExtension$Query$get_home_rentals on Query$get_home_rentals {
  CopyWith$Query$get_home_rentals<Query$get_home_rentals> get copyWith =>
      CopyWith$Query$get_home_rentals(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$get_home_rentals<TRes> {
  factory CopyWith$Query$get_home_rentals(
    Query$get_home_rentals instance,
    TRes Function(Query$get_home_rentals) then,
  ) = _CopyWithImpl$Query$get_home_rentals;

  factory CopyWith$Query$get_home_rentals.stub(TRes res) =
      _CopyWithStubImpl$Query$get_home_rentals;

  TRes call({
    List<Query$get_home_rentals$business_home_rental>? business_home_rental,
    String? $__typename,
  });
  TRes business_home_rental(
      Iterable<Query$get_home_rentals$business_home_rental> Function(
              Iterable<
                  CopyWith$Query$get_home_rentals$business_home_rental<
                      Query$get_home_rentals$business_home_rental>>)
          _fn);
}

class _CopyWithImpl$Query$get_home_rentals<TRes>
    implements CopyWith$Query$get_home_rentals<TRes> {
  _CopyWithImpl$Query$get_home_rentals(
    this._instance,
    this._then,
  );

  final Query$get_home_rentals _instance;

  final TRes Function(Query$get_home_rentals) _then;

  static const _undefined = {};

  TRes call({
    Object? business_home_rental = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_home_rentals(
        business_home_rental:
            business_home_rental == _undefined || business_home_rental == null
                ? _instance.business_home_rental
                : (business_home_rental
                    as List<Query$get_home_rentals$business_home_rental>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes business_home_rental(
          Iterable<Query$get_home_rentals$business_home_rental> Function(
                  Iterable<
                      CopyWith$Query$get_home_rentals$business_home_rental<
                          Query$get_home_rentals$business_home_rental>>)
              _fn) =>
      call(
          business_home_rental: _fn(_instance.business_home_rental
              .map((e) => CopyWith$Query$get_home_rentals$business_home_rental(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$get_home_rentals<TRes>
    implements CopyWith$Query$get_home_rentals<TRes> {
  _CopyWithStubImpl$Query$get_home_rentals(this._res);

  TRes _res;

  call({
    List<Query$get_home_rentals$business_home_rental>? business_home_rental,
    String? $__typename,
  }) =>
      _res;
  business_home_rental(_fn) => _res;
}

const documentNodeQueryget_home_rentals = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'get_home_rentals'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'distance')),
        type: NamedTypeNode(
          name: NameNode(value: 'Float'),
          isNonNull: true,
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
        name: NameNode(value: 'business_home_rental'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'gps_location'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_st_d_within'),
                    value: ObjectValueNode(fields: [
                      ObjectFieldNode(
                        name: NameNode(value: 'distance'),
                        value: VariableNode(name: NameNode(value: 'distance')),
                      ),
                      ObjectFieldNode(
                        name: NameNode(value: 'from'),
                        value: VariableNode(name: NameNode(value: 'from')),
                      ),
                    ]),
                  )
                ]),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'rental'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: 'business'),
                    value: ObjectValueNode(fields: [
                      ObjectFieldNode(
                        name: NameNode(value: 'details'),
                        value: ObjectValueNode(fields: [
                          ObjectFieldNode(
                            name: NameNode(value: 'approved'),
                            value: ObjectValueNode(fields: [
                              ObjectFieldNode(
                                name: NameNode(value: '_eq'),
                                value: BooleanValueNode(value: true),
                              )
                            ]),
                          ),
                          ObjectFieldNode(
                            name: NameNode(value: 'open_status'),
                            value: ObjectValueNode(fields: [
                              ObjectFieldNode(
                                name: NameNode(value: '_neq'),
                                value: StringValueNode(
                                  value: 'closedIndefinitely',
                                  isBlock: false,
                                ),
                              )
                            ]),
                          ),
                        ]),
                      )
                    ]),
                  )
                ]),
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
          ArgumentNode(
            name: NameNode(value: 'order_by'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'rental'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: 'business'),
                    value: ObjectValueNode(fields: [
                      ObjectFieldNode(
                        name: NameNode(value: 'details'),
                        value: ObjectValueNode(fields: [
                          ObjectFieldNode(
                            name: NameNode(value: 'referral_points'),
                            value: EnumValueNode(
                                name: NameNode(value: 'desc_nulls_last')),
                          )
                        ]),
                      )
                    ]),
                  )
                ]),
              )
            ]),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'bathrooms'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'bedrooms'),
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
            name: NameNode(value: 'home_type'),
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
            name: NameNode(value: 'rental'),
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
                name: NameNode(value: 'category3'),
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
                    name: NameNode(value: 'name_id'),
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
                    name: NameNode(value: 'tags'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
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
                    name: NameNode(value: 'category2'),
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
                        name: NameNode(value: 'currency'),
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
Query$get_home_rentals _parserFn$Query$get_home_rentals(
        Map<String, dynamic> data) =>
    Query$get_home_rentals.fromJson(data);

class Options$Query$get_home_rentals
    extends graphql.QueryOptions<Query$get_home_rentals> {
  Options$Query$get_home_rentals({
    String? operationName,
    required Variables$Query$get_home_rentals variables,
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
          document: documentNodeQueryget_home_rentals,
          parserFn: _parserFn$Query$get_home_rentals,
        );
}

class WatchOptions$Query$get_home_rentals
    extends graphql.WatchQueryOptions<Query$get_home_rentals> {
  WatchOptions$Query$get_home_rentals({
    String? operationName,
    required Variables$Query$get_home_rentals variables,
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
          document: documentNodeQueryget_home_rentals,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$get_home_rentals,
        );
}

class FetchMoreOptions$Query$get_home_rentals extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$get_home_rentals({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$get_home_rentals variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryget_home_rentals,
        );
}

extension ClientExtension$Query$get_home_rentals on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$get_home_rentals>> query$get_home_rentals(
          Options$Query$get_home_rentals options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$get_home_rentals> watchQuery$get_home_rentals(
          WatchOptions$Query$get_home_rentals options) =>
      this.watchQuery(options);
  void writeQuery$get_home_rentals({
    required Query$get_home_rentals data,
    required Variables$Query$get_home_rentals variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryget_home_rentals),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$get_home_rentals? readQuery$get_home_rentals({
    required Variables$Query$get_home_rentals variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQueryget_home_rentals),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$get_home_rentals.fromJson(result);
  }
}

class Query$get_home_rentals$business_home_rental {
  Query$get_home_rentals$business_home_rental({
    required this.bathrooms,
    required this.bedrooms,
    required this.gps_location,
    required this.home_type,
    required this.address,
    required this.rental,
    required this.$__typename,
  });

  factory Query$get_home_rentals$business_home_rental.fromJson(
      Map<String, dynamic> json) {
    final l$bathrooms = json['bathrooms'];
    final l$bedrooms = json['bedrooms'];
    final l$gps_location = json['gps_location'];
    final l$home_type = json['home_type'];
    final l$address = json['address'];
    final l$rental = json['rental'];
    final l$$__typename = json['__typename'];
    return Query$get_home_rentals$business_home_rental(
      bathrooms: (l$bathrooms as int),
      bedrooms: (l$bedrooms as int),
      gps_location: geographyFromJson(l$gps_location),
      home_type: (l$home_type as String),
      address: (l$address as String),
      rental: Query$get_home_rentals$business_home_rental$rental.fromJson(
          (l$rental as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int bathrooms;

  final int bedrooms;

  final Geography gps_location;

  final String home_type;

  final String address;

  final Query$get_home_rentals$business_home_rental$rental rental;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$bathrooms = bathrooms;
    _resultData['bathrooms'] = l$bathrooms;
    final l$bedrooms = bedrooms;
    _resultData['bedrooms'] = l$bedrooms;
    final l$gps_location = gps_location;
    _resultData['gps_location'] = geographyToJson(l$gps_location);
    final l$home_type = home_type;
    _resultData['home_type'] = l$home_type;
    final l$address = address;
    _resultData['address'] = l$address;
    final l$rental = rental;
    _resultData['rental'] = l$rental.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$bathrooms = bathrooms;
    final l$bedrooms = bedrooms;
    final l$gps_location = gps_location;
    final l$home_type = home_type;
    final l$address = address;
    final l$rental = rental;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$bathrooms,
      l$bedrooms,
      l$gps_location,
      l$home_type,
      l$address,
      l$rental,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_home_rentals$business_home_rental) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$bathrooms = bathrooms;
    final lOther$bathrooms = other.bathrooms;
    if (l$bathrooms != lOther$bathrooms) {
      return false;
    }
    final l$bedrooms = bedrooms;
    final lOther$bedrooms = other.bedrooms;
    if (l$bedrooms != lOther$bedrooms) {
      return false;
    }
    final l$gps_location = gps_location;
    final lOther$gps_location = other.gps_location;
    if (l$gps_location != lOther$gps_location) {
      return false;
    }
    final l$home_type = home_type;
    final lOther$home_type = other.home_type;
    if (l$home_type != lOther$home_type) {
      return false;
    }
    final l$address = address;
    final lOther$address = other.address;
    if (l$address != lOther$address) {
      return false;
    }
    final l$rental = rental;
    final lOther$rental = other.rental;
    if (l$rental != lOther$rental) {
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

extension UtilityExtension$Query$get_home_rentals$business_home_rental
    on Query$get_home_rentals$business_home_rental {
  CopyWith$Query$get_home_rentals$business_home_rental<
          Query$get_home_rentals$business_home_rental>
      get copyWith => CopyWith$Query$get_home_rentals$business_home_rental(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_home_rentals$business_home_rental<TRes> {
  factory CopyWith$Query$get_home_rentals$business_home_rental(
    Query$get_home_rentals$business_home_rental instance,
    TRes Function(Query$get_home_rentals$business_home_rental) then,
  ) = _CopyWithImpl$Query$get_home_rentals$business_home_rental;

  factory CopyWith$Query$get_home_rentals$business_home_rental.stub(TRes res) =
      _CopyWithStubImpl$Query$get_home_rentals$business_home_rental;

  TRes call({
    int? bathrooms,
    int? bedrooms,
    Geography? gps_location,
    String? home_type,
    String? address,
    Query$get_home_rentals$business_home_rental$rental? rental,
    String? $__typename,
  });
  CopyWith$Query$get_home_rentals$business_home_rental$rental<TRes> get rental;
}

class _CopyWithImpl$Query$get_home_rentals$business_home_rental<TRes>
    implements CopyWith$Query$get_home_rentals$business_home_rental<TRes> {
  _CopyWithImpl$Query$get_home_rentals$business_home_rental(
    this._instance,
    this._then,
  );

  final Query$get_home_rentals$business_home_rental _instance;

  final TRes Function(Query$get_home_rentals$business_home_rental) _then;

  static const _undefined = {};

  TRes call({
    Object? bathrooms = _undefined,
    Object? bedrooms = _undefined,
    Object? gps_location = _undefined,
    Object? home_type = _undefined,
    Object? address = _undefined,
    Object? rental = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_home_rentals$business_home_rental(
        bathrooms: bathrooms == _undefined || bathrooms == null
            ? _instance.bathrooms
            : (bathrooms as int),
        bedrooms: bedrooms == _undefined || bedrooms == null
            ? _instance.bedrooms
            : (bedrooms as int),
        gps_location: gps_location == _undefined || gps_location == null
            ? _instance.gps_location
            : (gps_location as Geography),
        home_type: home_type == _undefined || home_type == null
            ? _instance.home_type
            : (home_type as String),
        address: address == _undefined || address == null
            ? _instance.address
            : (address as String),
        rental: rental == _undefined || rental == null
            ? _instance.rental
            : (rental as Query$get_home_rentals$business_home_rental$rental),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_home_rentals$business_home_rental$rental<TRes> get rental {
    final local$rental = _instance.rental;
    return CopyWith$Query$get_home_rentals$business_home_rental$rental(
        local$rental, (e) => call(rental: e));
  }
}

class _CopyWithStubImpl$Query$get_home_rentals$business_home_rental<TRes>
    implements CopyWith$Query$get_home_rentals$business_home_rental<TRes> {
  _CopyWithStubImpl$Query$get_home_rentals$business_home_rental(this._res);

  TRes _res;

  call({
    int? bathrooms,
    int? bedrooms,
    Geography? gps_location,
    String? home_type,
    String? address,
    Query$get_home_rentals$business_home_rental$rental? rental,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_home_rentals$business_home_rental$rental<TRes>
      get rental =>
          CopyWith$Query$get_home_rentals$business_home_rental$rental.stub(
              _res);
}

class Query$get_home_rentals$business_home_rental$rental {
  Query$get_home_rentals$business_home_rental$rental({
    required this.id,
    required this.category3,
    required this.details,
    required this.business,
    required this.$__typename,
  });

  factory Query$get_home_rentals$business_home_rental$rental.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$category3 = json['category3'];
    final l$details = json['details'];
    final l$business = json['business'];
    final l$$__typename = json['__typename'];
    return Query$get_home_rentals$business_home_rental$rental(
      id: (l$id as int),
      category3: (l$category3 as String),
      details:
          Query$get_home_rentals$business_home_rental$rental$details.fromJson(
              (l$details as Map<String, dynamic>)),
      business:
          Query$get_home_rentals$business_home_rental$rental$business.fromJson(
              (l$business as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String category3;

  final Query$get_home_rentals$business_home_rental$rental$details details;

  final Query$get_home_rentals$business_home_rental$rental$business business;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$category3 = category3;
    _resultData['category3'] = l$category3;
    final l$details = details;
    _resultData['details'] = l$details.toJson();
    final l$business = business;
    _resultData['business'] = l$business.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$category3 = category3;
    final l$details = details;
    final l$business = business;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$category3,
      l$details,
      l$business,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_home_rentals$business_home_rental$rental) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$category3 = category3;
    final lOther$category3 = other.category3;
    if (l$category3 != lOther$category3) {
      return false;
    }
    final l$details = details;
    final lOther$details = other.details;
    if (l$details != lOther$details) {
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

extension UtilityExtension$Query$get_home_rentals$business_home_rental$rental
    on Query$get_home_rentals$business_home_rental$rental {
  CopyWith$Query$get_home_rentals$business_home_rental$rental<
          Query$get_home_rentals$business_home_rental$rental>
      get copyWith =>
          CopyWith$Query$get_home_rentals$business_home_rental$rental(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_home_rentals$business_home_rental$rental<
    TRes> {
  factory CopyWith$Query$get_home_rentals$business_home_rental$rental(
    Query$get_home_rentals$business_home_rental$rental instance,
    TRes Function(Query$get_home_rentals$business_home_rental$rental) then,
  ) = _CopyWithImpl$Query$get_home_rentals$business_home_rental$rental;

  factory CopyWith$Query$get_home_rentals$business_home_rental$rental.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_home_rentals$business_home_rental$rental;

  TRes call({
    int? id,
    String? category3,
    Query$get_home_rentals$business_home_rental$rental$details? details,
    Query$get_home_rentals$business_home_rental$rental$business? business,
    String? $__typename,
  });
  CopyWith$Query$get_home_rentals$business_home_rental$rental$details<TRes>
      get details;
  CopyWith$Query$get_home_rentals$business_home_rental$rental$business<TRes>
      get business;
}

class _CopyWithImpl$Query$get_home_rentals$business_home_rental$rental<TRes>
    implements
        CopyWith$Query$get_home_rentals$business_home_rental$rental<TRes> {
  _CopyWithImpl$Query$get_home_rentals$business_home_rental$rental(
    this._instance,
    this._then,
  );

  final Query$get_home_rentals$business_home_rental$rental _instance;

  final TRes Function(Query$get_home_rentals$business_home_rental$rental) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? category3 = _undefined,
    Object? details = _undefined,
    Object? business = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_home_rentals$business_home_rental$rental(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        category3: category3 == _undefined || category3 == null
            ? _instance.category3
            : (category3 as String),
        details: details == _undefined || details == null
            ? _instance.details
            : (details
                as Query$get_home_rentals$business_home_rental$rental$details),
        business: business == _undefined || business == null
            ? _instance.business
            : (business
                as Query$get_home_rentals$business_home_rental$rental$business),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_home_rentals$business_home_rental$rental$details<TRes>
      get details {
    final local$details = _instance.details;
    return CopyWith$Query$get_home_rentals$business_home_rental$rental$details(
        local$details, (e) => call(details: e));
  }

  CopyWith$Query$get_home_rentals$business_home_rental$rental$business<TRes>
      get business {
    final local$business = _instance.business;
    return CopyWith$Query$get_home_rentals$business_home_rental$rental$business(
        local$business, (e) => call(business: e));
  }
}

class _CopyWithStubImpl$Query$get_home_rentals$business_home_rental$rental<TRes>
    implements
        CopyWith$Query$get_home_rentals$business_home_rental$rental<TRes> {
  _CopyWithStubImpl$Query$get_home_rentals$business_home_rental$rental(
      this._res);

  TRes _res;

  call({
    int? id,
    String? category3,
    Query$get_home_rentals$business_home_rental$rental$details? details,
    Query$get_home_rentals$business_home_rental$rental$business? business,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_home_rentals$business_home_rental$rental$details<TRes>
      get details =>
          CopyWith$Query$get_home_rentals$business_home_rental$rental$details
              .stub(_res);
  CopyWith$Query$get_home_rentals$business_home_rental$rental$business<TRes>
      get business =>
          CopyWith$Query$get_home_rentals$business_home_rental$rental$business
              .stub(_res);
}

class Query$get_home_rentals$business_home_rental$rental$details {
  Query$get_home_rentals$business_home_rental$rental$details({
    required this.name_id,
    this.description_id,
    required this.id,
    required this.name,
    this.description,
    required this.tags,
    this.additional_parameters,
    required this.available,
    required this.category1,
    required this.category2,
    required this.cost,
    this.image,
    required this.position,
    required this.$__typename,
  });

  factory Query$get_home_rentals$business_home_rental$rental$details.fromJson(
      Map<String, dynamic> json) {
    final l$name_id = json['name_id'];
    final l$description_id = json['description_id'];
    final l$id = json['id'];
    final l$name = json['name'];
    final l$description = json['description'];
    final l$tags = json['tags'];
    final l$additional_parameters = json['additional_parameters'];
    final l$available = json['available'];
    final l$category1 = json['category1'];
    final l$category2 = json['category2'];
    final l$cost = json['cost'];
    final l$image = json['image'];
    final l$position = json['position'];
    final l$$__typename = json['__typename'];
    return Query$get_home_rentals$business_home_rental$rental$details(
      name_id: (l$name_id as int),
      description_id: (l$description_id as int?),
      id: (l$id as int),
      name: Query$get_home_rentals$business_home_rental$rental$details$name
          .fromJson((l$name as Map<String, dynamic>)),
      description: l$description == null
          ? null
          : Query$get_home_rentals$business_home_rental$rental$details$description
              .fromJson((l$description as Map<String, dynamic>)),
      tags: mapFromJson(l$tags),
      additional_parameters: l$additional_parameters == null
          ? null
          : mapFromJson(l$additional_parameters),
      available: (l$available as bool),
      category1: (l$category1 as String),
      category2: (l$category2 as String),
      cost: mapFromJson(l$cost),
      image: l$image == null ? null : mapFromJson(l$image),
      position: (l$position as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int name_id;

  final int? description_id;

  final int id;

  final Query$get_home_rentals$business_home_rental$rental$details$name name;

  final Query$get_home_rentals$business_home_rental$rental$details$description?
      description;

  final dynamic tags;

  final dynamic? additional_parameters;

  final bool available;

  final String category1;

  final String category2;

  final dynamic cost;

  final dynamic? image;

  final int position;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name_id = name_id;
    _resultData['name_id'] = l$name_id;
    final l$description_id = description_id;
    _resultData['description_id'] = l$description_id;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name.toJson();
    final l$description = description;
    _resultData['description'] = l$description?.toJson();
    final l$tags = tags;
    _resultData['tags'] = mapToJson(l$tags);
    final l$additional_parameters = additional_parameters;
    _resultData['additional_parameters'] = l$additional_parameters == null
        ? null
        : mapToJson(l$additional_parameters);
    final l$available = available;
    _resultData['available'] = l$available;
    final l$category1 = category1;
    _resultData['category1'] = l$category1;
    final l$category2 = category2;
    _resultData['category2'] = l$category2;
    final l$cost = cost;
    _resultData['cost'] = mapToJson(l$cost);
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
    final l$name_id = name_id;
    final l$description_id = description_id;
    final l$id = id;
    final l$name = name;
    final l$description = description;
    final l$tags = tags;
    final l$additional_parameters = additional_parameters;
    final l$available = available;
    final l$category1 = category1;
    final l$category2 = category2;
    final l$cost = cost;
    final l$image = image;
    final l$position = position;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$name_id,
      l$description_id,
      l$id,
      l$name,
      l$description,
      l$tags,
      l$additional_parameters,
      l$available,
      l$category1,
      l$category2,
      l$cost,
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
    if (!(other
            is Query$get_home_rentals$business_home_rental$rental$details) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name_id = name_id;
    final lOther$name_id = other.name_id;
    if (l$name_id != lOther$name_id) {
      return false;
    }
    final l$description_id = description_id;
    final lOther$description_id = other.description_id;
    if (l$description_id != lOther$description_id) {
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
    final l$tags = tags;
    final lOther$tags = other.tags;
    if (l$tags != lOther$tags) {
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
    final l$category2 = category2;
    final lOther$category2 = other.category2;
    if (l$category2 != lOther$category2) {
      return false;
    }
    final l$cost = cost;
    final lOther$cost = other.cost;
    if (l$cost != lOther$cost) {
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

extension UtilityExtension$Query$get_home_rentals$business_home_rental$rental$details
    on Query$get_home_rentals$business_home_rental$rental$details {
  CopyWith$Query$get_home_rentals$business_home_rental$rental$details<
          Query$get_home_rentals$business_home_rental$rental$details>
      get copyWith =>
          CopyWith$Query$get_home_rentals$business_home_rental$rental$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_home_rentals$business_home_rental$rental$details<
    TRes> {
  factory CopyWith$Query$get_home_rentals$business_home_rental$rental$details(
    Query$get_home_rentals$business_home_rental$rental$details instance,
    TRes Function(Query$get_home_rentals$business_home_rental$rental$details)
        then,
  ) = _CopyWithImpl$Query$get_home_rentals$business_home_rental$rental$details;

  factory CopyWith$Query$get_home_rentals$business_home_rental$rental$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_home_rentals$business_home_rental$rental$details;

  TRes call({
    int? name_id,
    int? description_id,
    int? id,
    Query$get_home_rentals$business_home_rental$rental$details$name? name,
    Query$get_home_rentals$business_home_rental$rental$details$description?
        description,
    dynamic? tags,
    dynamic? additional_parameters,
    bool? available,
    String? category1,
    String? category2,
    dynamic? cost,
    dynamic? image,
    int? position,
    String? $__typename,
  });
  CopyWith$Query$get_home_rentals$business_home_rental$rental$details$name<TRes>
      get name;
  CopyWith$Query$get_home_rentals$business_home_rental$rental$details$description<
      TRes> get description;
}

class _CopyWithImpl$Query$get_home_rentals$business_home_rental$rental$details<
        TRes>
    implements
        CopyWith$Query$get_home_rentals$business_home_rental$rental$details<
            TRes> {
  _CopyWithImpl$Query$get_home_rentals$business_home_rental$rental$details(
    this._instance,
    this._then,
  );

  final Query$get_home_rentals$business_home_rental$rental$details _instance;

  final TRes Function(
      Query$get_home_rentals$business_home_rental$rental$details) _then;

  static const _undefined = {};

  TRes call({
    Object? name_id = _undefined,
    Object? description_id = _undefined,
    Object? id = _undefined,
    Object? name = _undefined,
    Object? description = _undefined,
    Object? tags = _undefined,
    Object? additional_parameters = _undefined,
    Object? available = _undefined,
    Object? category1 = _undefined,
    Object? category2 = _undefined,
    Object? cost = _undefined,
    Object? image = _undefined,
    Object? position = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_home_rentals$business_home_rental$rental$details(
        name_id: name_id == _undefined || name_id == null
            ? _instance.name_id
            : (name_id as int),
        description_id: description_id == _undefined
            ? _instance.description_id
            : (description_id as int?),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name
                as Query$get_home_rentals$business_home_rental$rental$details$name),
        description: description == _undefined
            ? _instance.description
            : (description
                as Query$get_home_rentals$business_home_rental$rental$details$description?),
        tags: tags == _undefined || tags == null
            ? _instance.tags
            : (tags as dynamic),
        additional_parameters: additional_parameters == _undefined
            ? _instance.additional_parameters
            : (additional_parameters as dynamic?),
        available: available == _undefined || available == null
            ? _instance.available
            : (available as bool),
        category1: category1 == _undefined || category1 == null
            ? _instance.category1
            : (category1 as String),
        category2: category2 == _undefined || category2 == null
            ? _instance.category2
            : (category2 as String),
        cost: cost == _undefined || cost == null
            ? _instance.cost
            : (cost as dynamic),
        image: image == _undefined ? _instance.image : (image as dynamic?),
        position: position == _undefined || position == null
            ? _instance.position
            : (position as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_home_rentals$business_home_rental$rental$details$name<TRes>
      get name {
    final local$name = _instance.name;
    return CopyWith$Query$get_home_rentals$business_home_rental$rental$details$name(
        local$name, (e) => call(name: e));
  }

  CopyWith$Query$get_home_rentals$business_home_rental$rental$details$description<
      TRes> get description {
    final local$description = _instance.description;
    return local$description == null
        ? CopyWith$Query$get_home_rentals$business_home_rental$rental$details$description
            .stub(_then(_instance))
        : CopyWith$Query$get_home_rentals$business_home_rental$rental$details$description(
            local$description, (e) => call(description: e));
  }
}

class _CopyWithStubImpl$Query$get_home_rentals$business_home_rental$rental$details<
        TRes>
    implements
        CopyWith$Query$get_home_rentals$business_home_rental$rental$details<
            TRes> {
  _CopyWithStubImpl$Query$get_home_rentals$business_home_rental$rental$details(
      this._res);

  TRes _res;

  call({
    int? name_id,
    int? description_id,
    int? id,
    Query$get_home_rentals$business_home_rental$rental$details$name? name,
    Query$get_home_rentals$business_home_rental$rental$details$description?
        description,
    dynamic? tags,
    dynamic? additional_parameters,
    bool? available,
    String? category1,
    String? category2,
    dynamic? cost,
    dynamic? image,
    int? position,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_home_rentals$business_home_rental$rental$details$name<TRes>
      get name =>
          CopyWith$Query$get_home_rentals$business_home_rental$rental$details$name
              .stub(_res);
  CopyWith$Query$get_home_rentals$business_home_rental$rental$details$description<
          TRes>
      get description =>
          CopyWith$Query$get_home_rentals$business_home_rental$rental$details$description
              .stub(_res);
}

class Query$get_home_rentals$business_home_rental$rental$details$name {
  Query$get_home_rentals$business_home_rental$rental$details$name({
    required this.translations,
    required this.$__typename,
  });

  factory Query$get_home_rentals$business_home_rental$rental$details$name.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$get_home_rentals$business_home_rental$rental$details$name(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$get_home_rentals$business_home_rental$rental$details$name$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Query$get_home_rentals$business_home_rental$rental$details$name$translations>
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
            is Query$get_home_rentals$business_home_rental$rental$details$name) ||
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

extension UtilityExtension$Query$get_home_rentals$business_home_rental$rental$details$name
    on Query$get_home_rentals$business_home_rental$rental$details$name {
  CopyWith$Query$get_home_rentals$business_home_rental$rental$details$name<
          Query$get_home_rentals$business_home_rental$rental$details$name>
      get copyWith =>
          CopyWith$Query$get_home_rentals$business_home_rental$rental$details$name(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_home_rentals$business_home_rental$rental$details$name<
    TRes> {
  factory CopyWith$Query$get_home_rentals$business_home_rental$rental$details$name(
    Query$get_home_rentals$business_home_rental$rental$details$name instance,
    TRes Function(
            Query$get_home_rentals$business_home_rental$rental$details$name)
        then,
  ) = _CopyWithImpl$Query$get_home_rentals$business_home_rental$rental$details$name;

  factory CopyWith$Query$get_home_rentals$business_home_rental$rental$details$name.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_home_rentals$business_home_rental$rental$details$name;

  TRes call({
    List<Query$get_home_rentals$business_home_rental$rental$details$name$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$get_home_rentals$business_home_rental$rental$details$name$translations> Function(
              Iterable<
                  CopyWith$Query$get_home_rentals$business_home_rental$rental$details$name$translations<
                      Query$get_home_rentals$business_home_rental$rental$details$name$translations>>)
          _fn);
}

class _CopyWithImpl$Query$get_home_rentals$business_home_rental$rental$details$name<
        TRes>
    implements
        CopyWith$Query$get_home_rentals$business_home_rental$rental$details$name<
            TRes> {
  _CopyWithImpl$Query$get_home_rentals$business_home_rental$rental$details$name(
    this._instance,
    this._then,
  );

  final Query$get_home_rentals$business_home_rental$rental$details$name
      _instance;

  final TRes Function(
      Query$get_home_rentals$business_home_rental$rental$details$name) _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_home_rentals$business_home_rental$rental$details$name(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$get_home_rentals$business_home_rental$rental$details$name$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$get_home_rentals$business_home_rental$rental$details$name$translations> Function(
                  Iterable<
                      CopyWith$Query$get_home_rentals$business_home_rental$rental$details$name$translations<
                          Query$get_home_rentals$business_home_rental$rental$details$name$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$get_home_rentals$business_home_rental$rental$details$name$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$get_home_rentals$business_home_rental$rental$details$name<
        TRes>
    implements
        CopyWith$Query$get_home_rentals$business_home_rental$rental$details$name<
            TRes> {
  _CopyWithStubImpl$Query$get_home_rentals$business_home_rental$rental$details$name(
      this._res);

  TRes _res;

  call({
    List<Query$get_home_rentals$business_home_rental$rental$details$name$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$get_home_rentals$business_home_rental$rental$details$name$translations {
  Query$get_home_rentals$business_home_rental$rental$details$name$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$get_home_rentals$business_home_rental$rental$details$name$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$get_home_rentals$business_home_rental$rental$details$name$translations(
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
            is Query$get_home_rentals$business_home_rental$rental$details$name$translations) ||
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

extension UtilityExtension$Query$get_home_rentals$business_home_rental$rental$details$name$translations
    on Query$get_home_rentals$business_home_rental$rental$details$name$translations {
  CopyWith$Query$get_home_rentals$business_home_rental$rental$details$name$translations<
          Query$get_home_rentals$business_home_rental$rental$details$name$translations>
      get copyWith =>
          CopyWith$Query$get_home_rentals$business_home_rental$rental$details$name$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_home_rentals$business_home_rental$rental$details$name$translations<
    TRes> {
  factory CopyWith$Query$get_home_rentals$business_home_rental$rental$details$name$translations(
    Query$get_home_rentals$business_home_rental$rental$details$name$translations
        instance,
    TRes Function(
            Query$get_home_rentals$business_home_rental$rental$details$name$translations)
        then,
  ) = _CopyWithImpl$Query$get_home_rentals$business_home_rental$rental$details$name$translations;

  factory CopyWith$Query$get_home_rentals$business_home_rental$rental$details$name$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_home_rentals$business_home_rental$rental$details$name$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_home_rentals$business_home_rental$rental$details$name$translations<
        TRes>
    implements
        CopyWith$Query$get_home_rentals$business_home_rental$rental$details$name$translations<
            TRes> {
  _CopyWithImpl$Query$get_home_rentals$business_home_rental$rental$details$name$translations(
    this._instance,
    this._then,
  );

  final Query$get_home_rentals$business_home_rental$rental$details$name$translations
      _instance;

  final TRes Function(
          Query$get_home_rentals$business_home_rental$rental$details$name$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_home_rentals$business_home_rental$rental$details$name$translations(
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

class _CopyWithStubImpl$Query$get_home_rentals$business_home_rental$rental$details$name$translations<
        TRes>
    implements
        CopyWith$Query$get_home_rentals$business_home_rental$rental$details$name$translations<
            TRes> {
  _CopyWithStubImpl$Query$get_home_rentals$business_home_rental$rental$details$name$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Query$get_home_rentals$business_home_rental$rental$details$description {
  Query$get_home_rentals$business_home_rental$rental$details$description({
    required this.translations,
    required this.$__typename,
  });

  factory Query$get_home_rentals$business_home_rental$rental$details$description.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$get_home_rentals$business_home_rental$rental$details$description(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$get_home_rentals$business_home_rental$rental$details$description$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Query$get_home_rentals$business_home_rental$rental$details$description$translations>
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
            is Query$get_home_rentals$business_home_rental$rental$details$description) ||
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

extension UtilityExtension$Query$get_home_rentals$business_home_rental$rental$details$description
    on Query$get_home_rentals$business_home_rental$rental$details$description {
  CopyWith$Query$get_home_rentals$business_home_rental$rental$details$description<
          Query$get_home_rentals$business_home_rental$rental$details$description>
      get copyWith =>
          CopyWith$Query$get_home_rentals$business_home_rental$rental$details$description(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_home_rentals$business_home_rental$rental$details$description<
    TRes> {
  factory CopyWith$Query$get_home_rentals$business_home_rental$rental$details$description(
    Query$get_home_rentals$business_home_rental$rental$details$description
        instance,
    TRes Function(
            Query$get_home_rentals$business_home_rental$rental$details$description)
        then,
  ) = _CopyWithImpl$Query$get_home_rentals$business_home_rental$rental$details$description;

  factory CopyWith$Query$get_home_rentals$business_home_rental$rental$details$description.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_home_rentals$business_home_rental$rental$details$description;

  TRes call({
    List<Query$get_home_rentals$business_home_rental$rental$details$description$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$get_home_rentals$business_home_rental$rental$details$description$translations> Function(
              Iterable<
                  CopyWith$Query$get_home_rentals$business_home_rental$rental$details$description$translations<
                      Query$get_home_rentals$business_home_rental$rental$details$description$translations>>)
          _fn);
}

class _CopyWithImpl$Query$get_home_rentals$business_home_rental$rental$details$description<
        TRes>
    implements
        CopyWith$Query$get_home_rentals$business_home_rental$rental$details$description<
            TRes> {
  _CopyWithImpl$Query$get_home_rentals$business_home_rental$rental$details$description(
    this._instance,
    this._then,
  );

  final Query$get_home_rentals$business_home_rental$rental$details$description
      _instance;

  final TRes Function(
          Query$get_home_rentals$business_home_rental$rental$details$description)
      _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_home_rentals$business_home_rental$rental$details$description(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$get_home_rentals$business_home_rental$rental$details$description$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$get_home_rentals$business_home_rental$rental$details$description$translations> Function(
                  Iterable<
                      CopyWith$Query$get_home_rentals$business_home_rental$rental$details$description$translations<
                          Query$get_home_rentals$business_home_rental$rental$details$description$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$get_home_rentals$business_home_rental$rental$details$description$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$get_home_rentals$business_home_rental$rental$details$description<
        TRes>
    implements
        CopyWith$Query$get_home_rentals$business_home_rental$rental$details$description<
            TRes> {
  _CopyWithStubImpl$Query$get_home_rentals$business_home_rental$rental$details$description(
      this._res);

  TRes _res;

  call({
    List<Query$get_home_rentals$business_home_rental$rental$details$description$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$get_home_rentals$business_home_rental$rental$details$description$translations {
  Query$get_home_rentals$business_home_rental$rental$details$description$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$get_home_rentals$business_home_rental$rental$details$description$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$get_home_rentals$business_home_rental$rental$details$description$translations(
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
            is Query$get_home_rentals$business_home_rental$rental$details$description$translations) ||
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

extension UtilityExtension$Query$get_home_rentals$business_home_rental$rental$details$description$translations
    on Query$get_home_rentals$business_home_rental$rental$details$description$translations {
  CopyWith$Query$get_home_rentals$business_home_rental$rental$details$description$translations<
          Query$get_home_rentals$business_home_rental$rental$details$description$translations>
      get copyWith =>
          CopyWith$Query$get_home_rentals$business_home_rental$rental$details$description$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_home_rentals$business_home_rental$rental$details$description$translations<
    TRes> {
  factory CopyWith$Query$get_home_rentals$business_home_rental$rental$details$description$translations(
    Query$get_home_rentals$business_home_rental$rental$details$description$translations
        instance,
    TRes Function(
            Query$get_home_rentals$business_home_rental$rental$details$description$translations)
        then,
  ) = _CopyWithImpl$Query$get_home_rentals$business_home_rental$rental$details$description$translations;

  factory CopyWith$Query$get_home_rentals$business_home_rental$rental$details$description$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_home_rentals$business_home_rental$rental$details$description$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_home_rentals$business_home_rental$rental$details$description$translations<
        TRes>
    implements
        CopyWith$Query$get_home_rentals$business_home_rental$rental$details$description$translations<
            TRes> {
  _CopyWithImpl$Query$get_home_rentals$business_home_rental$rental$details$description$translations(
    this._instance,
    this._then,
  );

  final Query$get_home_rentals$business_home_rental$rental$details$description$translations
      _instance;

  final TRes Function(
          Query$get_home_rentals$business_home_rental$rental$details$description$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_home_rentals$business_home_rental$rental$details$description$translations(
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

class _CopyWithStubImpl$Query$get_home_rentals$business_home_rental$rental$details$description$translations<
        TRes>
    implements
        CopyWith$Query$get_home_rentals$business_home_rental$rental$details$description$translations<
            TRes> {
  _CopyWithStubImpl$Query$get_home_rentals$business_home_rental$rental$details$description$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Query$get_home_rentals$business_home_rental$rental$business {
  Query$get_home_rentals$business_home_rental$rental$business({
    required this.id,
    required this.details,
    required this.$__typename,
  });

  factory Query$get_home_rentals$business_home_rental$rental$business.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Query$get_home_rentals$business_home_rental$rental$business(
      id: (l$id as int),
      details:
          Query$get_home_rentals$business_home_rental$rental$business$details
              .fromJson((l$details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final Query$get_home_rentals$business_home_rental$rental$business$details
      details;

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
    if (!(other
            is Query$get_home_rentals$business_home_rental$rental$business) ||
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

extension UtilityExtension$Query$get_home_rentals$business_home_rental$rental$business
    on Query$get_home_rentals$business_home_rental$rental$business {
  CopyWith$Query$get_home_rentals$business_home_rental$rental$business<
          Query$get_home_rentals$business_home_rental$rental$business>
      get copyWith =>
          CopyWith$Query$get_home_rentals$business_home_rental$rental$business(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_home_rentals$business_home_rental$rental$business<
    TRes> {
  factory CopyWith$Query$get_home_rentals$business_home_rental$rental$business(
    Query$get_home_rentals$business_home_rental$rental$business instance,
    TRes Function(Query$get_home_rentals$business_home_rental$rental$business)
        then,
  ) = _CopyWithImpl$Query$get_home_rentals$business_home_rental$rental$business;

  factory CopyWith$Query$get_home_rentals$business_home_rental$rental$business.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_home_rentals$business_home_rental$rental$business;

  TRes call({
    int? id,
    Query$get_home_rentals$business_home_rental$rental$business$details?
        details,
    String? $__typename,
  });
  CopyWith$Query$get_home_rentals$business_home_rental$rental$business$details<
      TRes> get details;
}

class _CopyWithImpl$Query$get_home_rentals$business_home_rental$rental$business<
        TRes>
    implements
        CopyWith$Query$get_home_rentals$business_home_rental$rental$business<
            TRes> {
  _CopyWithImpl$Query$get_home_rentals$business_home_rental$rental$business(
    this._instance,
    this._then,
  );

  final Query$get_home_rentals$business_home_rental$rental$business _instance;

  final TRes Function(
      Query$get_home_rentals$business_home_rental$rental$business) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_home_rentals$business_home_rental$rental$business(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        details: details == _undefined || details == null
            ? _instance.details
            : (details
                as Query$get_home_rentals$business_home_rental$rental$business$details),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_home_rentals$business_home_rental$rental$business$details<
      TRes> get details {
    final local$details = _instance.details;
    return CopyWith$Query$get_home_rentals$business_home_rental$rental$business$details(
        local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Query$get_home_rentals$business_home_rental$rental$business<
        TRes>
    implements
        CopyWith$Query$get_home_rentals$business_home_rental$rental$business<
            TRes> {
  _CopyWithStubImpl$Query$get_home_rentals$business_home_rental$rental$business(
      this._res);

  TRes _res;

  call({
    int? id,
    Query$get_home_rentals$business_home_rental$rental$business$details?
        details,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_home_rentals$business_home_rental$rental$business$details<
          TRes>
      get details =>
          CopyWith$Query$get_home_rentals$business_home_rental$rental$business$details
              .stub(_res);
}

class Query$get_home_rentals$business_home_rental$rental$business$details {
  Query$get_home_rentals$business_home_rental$rental$business$details({
    required this.id,
    required this.name,
    required this.currency,
    required this.$__typename,
  });

  factory Query$get_home_rentals$business_home_rental$rental$business$details.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$currency = json['currency'];
    final l$$__typename = json['__typename'];
    return Query$get_home_rentals$business_home_rental$rental$business$details(
      id: (l$id as int),
      name: (l$name as String),
      currency: (l$currency as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String name;

  final String currency;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$currency = currency;
    _resultData['currency'] = l$currency;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$currency = currency;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$currency,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$get_home_rentals$business_home_rental$rental$business$details) ||
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
    final l$currency = currency;
    final lOther$currency = other.currency;
    if (l$currency != lOther$currency) {
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

extension UtilityExtension$Query$get_home_rentals$business_home_rental$rental$business$details
    on Query$get_home_rentals$business_home_rental$rental$business$details {
  CopyWith$Query$get_home_rentals$business_home_rental$rental$business$details<
          Query$get_home_rentals$business_home_rental$rental$business$details>
      get copyWith =>
          CopyWith$Query$get_home_rentals$business_home_rental$rental$business$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_home_rentals$business_home_rental$rental$business$details<
    TRes> {
  factory CopyWith$Query$get_home_rentals$business_home_rental$rental$business$details(
    Query$get_home_rentals$business_home_rental$rental$business$details
        instance,
    TRes Function(
            Query$get_home_rentals$business_home_rental$rental$business$details)
        then,
  ) = _CopyWithImpl$Query$get_home_rentals$business_home_rental$rental$business$details;

  factory CopyWith$Query$get_home_rentals$business_home_rental$rental$business$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_home_rentals$business_home_rental$rental$business$details;

  TRes call({
    int? id,
    String? name,
    String? currency,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_home_rentals$business_home_rental$rental$business$details<
        TRes>
    implements
        CopyWith$Query$get_home_rentals$business_home_rental$rental$business$details<
            TRes> {
  _CopyWithImpl$Query$get_home_rentals$business_home_rental$rental$business$details(
    this._instance,
    this._then,
  );

  final Query$get_home_rentals$business_home_rental$rental$business$details
      _instance;

  final TRes Function(
          Query$get_home_rentals$business_home_rental$rental$business$details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? currency = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_home_rentals$business_home_rental$rental$business$details(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        currency: currency == _undefined || currency == null
            ? _instance.currency
            : (currency as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$get_home_rentals$business_home_rental$rental$business$details<
        TRes>
    implements
        CopyWith$Query$get_home_rentals$business_home_rental$rental$business$details<
            TRes> {
  _CopyWithStubImpl$Query$get_home_rentals$business_home_rental$rental$business$details(
      this._res);

  TRes _res;

  call({
    int? id,
    String? name,
    String? currency,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$get_business_home_rentals {
  factory Variables$Query$get_business_home_rentals({
    required int businessId,
    int? limit,
    int? offset,
  }) =>
      Variables$Query$get_business_home_rentals._({
        r'businessId': businessId,
        if (limit != null) r'limit': limit,
        if (offset != null) r'offset': offset,
      });

  Variables$Query$get_business_home_rentals._(this._$data);

  factory Variables$Query$get_business_home_rentals.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$businessId = data['businessId'];
    result$data['businessId'] = (l$businessId as int);
    if (data.containsKey('limit')) {
      final l$limit = data['limit'];
      result$data['limit'] = (l$limit as int?);
    }
    if (data.containsKey('offset')) {
      final l$offset = data['offset'];
      result$data['offset'] = (l$offset as int?);
    }
    return Variables$Query$get_business_home_rentals._(result$data);
  }

  Map<String, dynamic> _$data;

  int get businessId => (_$data['businessId'] as int);
  int? get limit => (_$data['limit'] as int?);
  int? get offset => (_$data['offset'] as int?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$businessId = businessId;
    result$data['businessId'] = l$businessId;
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

  CopyWith$Variables$Query$get_business_home_rentals<
          Variables$Query$get_business_home_rentals>
      get copyWith => CopyWith$Variables$Query$get_business_home_rentals(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$get_business_home_rentals) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$businessId = businessId;
    final lOther$businessId = other.businessId;
    if (l$businessId != lOther$businessId) {
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
    final l$businessId = businessId;
    final l$limit = limit;
    final l$offset = offset;
    return Object.hashAll([
      l$businessId,
      _$data.containsKey('limit') ? l$limit : const {},
      _$data.containsKey('offset') ? l$offset : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$get_business_home_rentals<TRes> {
  factory CopyWith$Variables$Query$get_business_home_rentals(
    Variables$Query$get_business_home_rentals instance,
    TRes Function(Variables$Query$get_business_home_rentals) then,
  ) = _CopyWithImpl$Variables$Query$get_business_home_rentals;

  factory CopyWith$Variables$Query$get_business_home_rentals.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$get_business_home_rentals;

  TRes call({
    int? businessId,
    int? limit,
    int? offset,
  });
}

class _CopyWithImpl$Variables$Query$get_business_home_rentals<TRes>
    implements CopyWith$Variables$Query$get_business_home_rentals<TRes> {
  _CopyWithImpl$Variables$Query$get_business_home_rentals(
    this._instance,
    this._then,
  );

  final Variables$Query$get_business_home_rentals _instance;

  final TRes Function(Variables$Query$get_business_home_rentals) _then;

  static const _undefined = {};

  TRes call({
    Object? businessId = _undefined,
    Object? limit = _undefined,
    Object? offset = _undefined,
  }) =>
      _then(Variables$Query$get_business_home_rentals._({
        ..._instance._$data,
        if (businessId != _undefined && businessId != null)
          'businessId': (businessId as int),
        if (limit != _undefined) 'limit': (limit as int?),
        if (offset != _undefined) 'offset': (offset as int?),
      }));
}

class _CopyWithStubImpl$Variables$Query$get_business_home_rentals<TRes>
    implements CopyWith$Variables$Query$get_business_home_rentals<TRes> {
  _CopyWithStubImpl$Variables$Query$get_business_home_rentals(this._res);

  TRes _res;

  call({
    int? businessId,
    int? limit,
    int? offset,
  }) =>
      _res;
}

class Query$get_business_home_rentals {
  Query$get_business_home_rentals({
    required this.business_home_rental,
    required this.$__typename,
  });

  factory Query$get_business_home_rentals.fromJson(Map<String, dynamic> json) {
    final l$business_home_rental = json['business_home_rental'];
    final l$$__typename = json['__typename'];
    return Query$get_business_home_rentals(
      business_home_rental: (l$business_home_rental as List<dynamic>)
          .map((e) =>
              Query$get_business_home_rentals$business_home_rental.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$get_business_home_rentals$business_home_rental>
      business_home_rental;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$business_home_rental = business_home_rental;
    _resultData['business_home_rental'] =
        l$business_home_rental.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$business_home_rental = business_home_rental;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$business_home_rental.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_business_home_rentals) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$business_home_rental = business_home_rental;
    final lOther$business_home_rental = other.business_home_rental;
    if (l$business_home_rental.length != lOther$business_home_rental.length) {
      return false;
    }
    for (int i = 0; i < l$business_home_rental.length; i++) {
      final l$business_home_rental$entry = l$business_home_rental[i];
      final lOther$business_home_rental$entry = lOther$business_home_rental[i];
      if (l$business_home_rental$entry != lOther$business_home_rental$entry) {
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

extension UtilityExtension$Query$get_business_home_rentals
    on Query$get_business_home_rentals {
  CopyWith$Query$get_business_home_rentals<Query$get_business_home_rentals>
      get copyWith => CopyWith$Query$get_business_home_rentals(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_business_home_rentals<TRes> {
  factory CopyWith$Query$get_business_home_rentals(
    Query$get_business_home_rentals instance,
    TRes Function(Query$get_business_home_rentals) then,
  ) = _CopyWithImpl$Query$get_business_home_rentals;

  factory CopyWith$Query$get_business_home_rentals.stub(TRes res) =
      _CopyWithStubImpl$Query$get_business_home_rentals;

  TRes call({
    List<Query$get_business_home_rentals$business_home_rental>?
        business_home_rental,
    String? $__typename,
  });
  TRes business_home_rental(
      Iterable<Query$get_business_home_rentals$business_home_rental> Function(
              Iterable<
                  CopyWith$Query$get_business_home_rentals$business_home_rental<
                      Query$get_business_home_rentals$business_home_rental>>)
          _fn);
}

class _CopyWithImpl$Query$get_business_home_rentals<TRes>
    implements CopyWith$Query$get_business_home_rentals<TRes> {
  _CopyWithImpl$Query$get_business_home_rentals(
    this._instance,
    this._then,
  );

  final Query$get_business_home_rentals _instance;

  final TRes Function(Query$get_business_home_rentals) _then;

  static const _undefined = {};

  TRes call({
    Object? business_home_rental = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_business_home_rentals(
        business_home_rental: business_home_rental == _undefined ||
                business_home_rental == null
            ? _instance.business_home_rental
            : (business_home_rental
                as List<Query$get_business_home_rentals$business_home_rental>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes business_home_rental(
          Iterable<Query$get_business_home_rentals$business_home_rental> Function(
                  Iterable<
                      CopyWith$Query$get_business_home_rentals$business_home_rental<
                          Query$get_business_home_rentals$business_home_rental>>)
              _fn) =>
      call(
          business_home_rental: _fn(_instance.business_home_rental.map((e) =>
              CopyWith$Query$get_business_home_rentals$business_home_rental(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$get_business_home_rentals<TRes>
    implements CopyWith$Query$get_business_home_rentals<TRes> {
  _CopyWithStubImpl$Query$get_business_home_rentals(this._res);

  TRes _res;

  call({
    List<Query$get_business_home_rentals$business_home_rental>?
        business_home_rental,
    String? $__typename,
  }) =>
      _res;
  business_home_rental(_fn) => _res;
}

const documentNodeQueryget_business_home_rentals = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'get_business_home_rentals'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'businessId')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
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
        name: NameNode(value: 'business_home_rental'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'rental'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: 'business_id'),
                    value: ObjectValueNode(fields: [
                      ObjectFieldNode(
                        name: NameNode(value: '_eq'),
                        value:
                            VariableNode(name: NameNode(value: 'businessId')),
                      )
                    ]),
                  )
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
            name: NameNode(value: 'bathrooms'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'bedrooms'),
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
            name: NameNode(value: 'home_type'),
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
            name: NameNode(value: 'rental'),
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
                name: NameNode(value: 'category3'),
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
                    name: NameNode(value: 'name_id'),
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
                    name: NameNode(value: 'tags'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
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
                    name: NameNode(value: 'category2'),
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
                        name: NameNode(value: 'currency'),
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
Query$get_business_home_rentals _parserFn$Query$get_business_home_rentals(
        Map<String, dynamic> data) =>
    Query$get_business_home_rentals.fromJson(data);

class Options$Query$get_business_home_rentals
    extends graphql.QueryOptions<Query$get_business_home_rentals> {
  Options$Query$get_business_home_rentals({
    String? operationName,
    required Variables$Query$get_business_home_rentals variables,
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
          document: documentNodeQueryget_business_home_rentals,
          parserFn: _parserFn$Query$get_business_home_rentals,
        );
}

class WatchOptions$Query$get_business_home_rentals
    extends graphql.WatchQueryOptions<Query$get_business_home_rentals> {
  WatchOptions$Query$get_business_home_rentals({
    String? operationName,
    required Variables$Query$get_business_home_rentals variables,
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
          document: documentNodeQueryget_business_home_rentals,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$get_business_home_rentals,
        );
}

class FetchMoreOptions$Query$get_business_home_rentals
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$get_business_home_rentals({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$get_business_home_rentals variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryget_business_home_rentals,
        );
}

extension ClientExtension$Query$get_business_home_rentals
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$get_business_home_rentals>>
      query$get_business_home_rentals(
              Options$Query$get_business_home_rentals options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$get_business_home_rentals>
      watchQuery$get_business_home_rentals(
              WatchOptions$Query$get_business_home_rentals options) =>
          this.watchQuery(options);
  void writeQuery$get_business_home_rentals({
    required Query$get_business_home_rentals data,
    required Variables$Query$get_business_home_rentals variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryget_business_home_rentals),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$get_business_home_rentals? readQuery$get_business_home_rentals({
    required Variables$Query$get_business_home_rentals variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQueryget_business_home_rentals),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$get_business_home_rentals.fromJson(result);
  }
}

class Query$get_business_home_rentals$business_home_rental {
  Query$get_business_home_rentals$business_home_rental({
    required this.bathrooms,
    required this.bedrooms,
    required this.gps_location,
    required this.home_type,
    required this.address,
    required this.rental,
    required this.$__typename,
  });

  factory Query$get_business_home_rentals$business_home_rental.fromJson(
      Map<String, dynamic> json) {
    final l$bathrooms = json['bathrooms'];
    final l$bedrooms = json['bedrooms'];
    final l$gps_location = json['gps_location'];
    final l$home_type = json['home_type'];
    final l$address = json['address'];
    final l$rental = json['rental'];
    final l$$__typename = json['__typename'];
    return Query$get_business_home_rentals$business_home_rental(
      bathrooms: (l$bathrooms as int),
      bedrooms: (l$bedrooms as int),
      gps_location: geographyFromJson(l$gps_location),
      home_type: (l$home_type as String),
      address: (l$address as String),
      rental:
          Query$get_business_home_rentals$business_home_rental$rental.fromJson(
              (l$rental as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int bathrooms;

  final int bedrooms;

  final Geography gps_location;

  final String home_type;

  final String address;

  final Query$get_business_home_rentals$business_home_rental$rental rental;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$bathrooms = bathrooms;
    _resultData['bathrooms'] = l$bathrooms;
    final l$bedrooms = bedrooms;
    _resultData['bedrooms'] = l$bedrooms;
    final l$gps_location = gps_location;
    _resultData['gps_location'] = geographyToJson(l$gps_location);
    final l$home_type = home_type;
    _resultData['home_type'] = l$home_type;
    final l$address = address;
    _resultData['address'] = l$address;
    final l$rental = rental;
    _resultData['rental'] = l$rental.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$bathrooms = bathrooms;
    final l$bedrooms = bedrooms;
    final l$gps_location = gps_location;
    final l$home_type = home_type;
    final l$address = address;
    final l$rental = rental;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$bathrooms,
      l$bedrooms,
      l$gps_location,
      l$home_type,
      l$address,
      l$rental,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_business_home_rentals$business_home_rental) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$bathrooms = bathrooms;
    final lOther$bathrooms = other.bathrooms;
    if (l$bathrooms != lOther$bathrooms) {
      return false;
    }
    final l$bedrooms = bedrooms;
    final lOther$bedrooms = other.bedrooms;
    if (l$bedrooms != lOther$bedrooms) {
      return false;
    }
    final l$gps_location = gps_location;
    final lOther$gps_location = other.gps_location;
    if (l$gps_location != lOther$gps_location) {
      return false;
    }
    final l$home_type = home_type;
    final lOther$home_type = other.home_type;
    if (l$home_type != lOther$home_type) {
      return false;
    }
    final l$address = address;
    final lOther$address = other.address;
    if (l$address != lOther$address) {
      return false;
    }
    final l$rental = rental;
    final lOther$rental = other.rental;
    if (l$rental != lOther$rental) {
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

extension UtilityExtension$Query$get_business_home_rentals$business_home_rental
    on Query$get_business_home_rentals$business_home_rental {
  CopyWith$Query$get_business_home_rentals$business_home_rental<
          Query$get_business_home_rentals$business_home_rental>
      get copyWith =>
          CopyWith$Query$get_business_home_rentals$business_home_rental(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_business_home_rentals$business_home_rental<
    TRes> {
  factory CopyWith$Query$get_business_home_rentals$business_home_rental(
    Query$get_business_home_rentals$business_home_rental instance,
    TRes Function(Query$get_business_home_rentals$business_home_rental) then,
  ) = _CopyWithImpl$Query$get_business_home_rentals$business_home_rental;

  factory CopyWith$Query$get_business_home_rentals$business_home_rental.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_business_home_rentals$business_home_rental;

  TRes call({
    int? bathrooms,
    int? bedrooms,
    Geography? gps_location,
    String? home_type,
    String? address,
    Query$get_business_home_rentals$business_home_rental$rental? rental,
    String? $__typename,
  });
  CopyWith$Query$get_business_home_rentals$business_home_rental$rental<TRes>
      get rental;
}

class _CopyWithImpl$Query$get_business_home_rentals$business_home_rental<TRes>
    implements
        CopyWith$Query$get_business_home_rentals$business_home_rental<TRes> {
  _CopyWithImpl$Query$get_business_home_rentals$business_home_rental(
    this._instance,
    this._then,
  );

  final Query$get_business_home_rentals$business_home_rental _instance;

  final TRes Function(Query$get_business_home_rentals$business_home_rental)
      _then;

  static const _undefined = {};

  TRes call({
    Object? bathrooms = _undefined,
    Object? bedrooms = _undefined,
    Object? gps_location = _undefined,
    Object? home_type = _undefined,
    Object? address = _undefined,
    Object? rental = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_business_home_rentals$business_home_rental(
        bathrooms: bathrooms == _undefined || bathrooms == null
            ? _instance.bathrooms
            : (bathrooms as int),
        bedrooms: bedrooms == _undefined || bedrooms == null
            ? _instance.bedrooms
            : (bedrooms as int),
        gps_location: gps_location == _undefined || gps_location == null
            ? _instance.gps_location
            : (gps_location as Geography),
        home_type: home_type == _undefined || home_type == null
            ? _instance.home_type
            : (home_type as String),
        address: address == _undefined || address == null
            ? _instance.address
            : (address as String),
        rental: rental == _undefined || rental == null
            ? _instance.rental
            : (rental
                as Query$get_business_home_rentals$business_home_rental$rental),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_business_home_rentals$business_home_rental$rental<TRes>
      get rental {
    final local$rental = _instance.rental;
    return CopyWith$Query$get_business_home_rentals$business_home_rental$rental(
        local$rental, (e) => call(rental: e));
  }
}

class _CopyWithStubImpl$Query$get_business_home_rentals$business_home_rental<
        TRes>
    implements
        CopyWith$Query$get_business_home_rentals$business_home_rental<TRes> {
  _CopyWithStubImpl$Query$get_business_home_rentals$business_home_rental(
      this._res);

  TRes _res;

  call({
    int? bathrooms,
    int? bedrooms,
    Geography? gps_location,
    String? home_type,
    String? address,
    Query$get_business_home_rentals$business_home_rental$rental? rental,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_business_home_rentals$business_home_rental$rental<TRes>
      get rental =>
          CopyWith$Query$get_business_home_rentals$business_home_rental$rental
              .stub(_res);
}

class Query$get_business_home_rentals$business_home_rental$rental {
  Query$get_business_home_rentals$business_home_rental$rental({
    required this.id,
    required this.category3,
    required this.details,
    required this.business,
    required this.$__typename,
  });

  factory Query$get_business_home_rentals$business_home_rental$rental.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$category3 = json['category3'];
    final l$details = json['details'];
    final l$business = json['business'];
    final l$$__typename = json['__typename'];
    return Query$get_business_home_rentals$business_home_rental$rental(
      id: (l$id as int),
      category3: (l$category3 as String),
      details:
          Query$get_business_home_rentals$business_home_rental$rental$details
              .fromJson((l$details as Map<String, dynamic>)),
      business:
          Query$get_business_home_rentals$business_home_rental$rental$business
              .fromJson((l$business as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String category3;

  final Query$get_business_home_rentals$business_home_rental$rental$details
      details;

  final Query$get_business_home_rentals$business_home_rental$rental$business
      business;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$category3 = category3;
    _resultData['category3'] = l$category3;
    final l$details = details;
    _resultData['details'] = l$details.toJson();
    final l$business = business;
    _resultData['business'] = l$business.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$category3 = category3;
    final l$details = details;
    final l$business = business;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$category3,
      l$details,
      l$business,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$get_business_home_rentals$business_home_rental$rental) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$category3 = category3;
    final lOther$category3 = other.category3;
    if (l$category3 != lOther$category3) {
      return false;
    }
    final l$details = details;
    final lOther$details = other.details;
    if (l$details != lOther$details) {
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

extension UtilityExtension$Query$get_business_home_rentals$business_home_rental$rental
    on Query$get_business_home_rentals$business_home_rental$rental {
  CopyWith$Query$get_business_home_rentals$business_home_rental$rental<
          Query$get_business_home_rentals$business_home_rental$rental>
      get copyWith =>
          CopyWith$Query$get_business_home_rentals$business_home_rental$rental(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_business_home_rentals$business_home_rental$rental<
    TRes> {
  factory CopyWith$Query$get_business_home_rentals$business_home_rental$rental(
    Query$get_business_home_rentals$business_home_rental$rental instance,
    TRes Function(Query$get_business_home_rentals$business_home_rental$rental)
        then,
  ) = _CopyWithImpl$Query$get_business_home_rentals$business_home_rental$rental;

  factory CopyWith$Query$get_business_home_rentals$business_home_rental$rental.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_business_home_rentals$business_home_rental$rental;

  TRes call({
    int? id,
    String? category3,
    Query$get_business_home_rentals$business_home_rental$rental$details?
        details,
    Query$get_business_home_rentals$business_home_rental$rental$business?
        business,
    String? $__typename,
  });
  CopyWith$Query$get_business_home_rentals$business_home_rental$rental$details<
      TRes> get details;
  CopyWith$Query$get_business_home_rentals$business_home_rental$rental$business<
      TRes> get business;
}

class _CopyWithImpl$Query$get_business_home_rentals$business_home_rental$rental<
        TRes>
    implements
        CopyWith$Query$get_business_home_rentals$business_home_rental$rental<
            TRes> {
  _CopyWithImpl$Query$get_business_home_rentals$business_home_rental$rental(
    this._instance,
    this._then,
  );

  final Query$get_business_home_rentals$business_home_rental$rental _instance;

  final TRes Function(
      Query$get_business_home_rentals$business_home_rental$rental) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? category3 = _undefined,
    Object? details = _undefined,
    Object? business = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_business_home_rentals$business_home_rental$rental(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        category3: category3 == _undefined || category3 == null
            ? _instance.category3
            : (category3 as String),
        details: details == _undefined || details == null
            ? _instance.details
            : (details
                as Query$get_business_home_rentals$business_home_rental$rental$details),
        business: business == _undefined || business == null
            ? _instance.business
            : (business
                as Query$get_business_home_rentals$business_home_rental$rental$business),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_business_home_rentals$business_home_rental$rental$details<
      TRes> get details {
    final local$details = _instance.details;
    return CopyWith$Query$get_business_home_rentals$business_home_rental$rental$details(
        local$details, (e) => call(details: e));
  }

  CopyWith$Query$get_business_home_rentals$business_home_rental$rental$business<
      TRes> get business {
    final local$business = _instance.business;
    return CopyWith$Query$get_business_home_rentals$business_home_rental$rental$business(
        local$business, (e) => call(business: e));
  }
}

class _CopyWithStubImpl$Query$get_business_home_rentals$business_home_rental$rental<
        TRes>
    implements
        CopyWith$Query$get_business_home_rentals$business_home_rental$rental<
            TRes> {
  _CopyWithStubImpl$Query$get_business_home_rentals$business_home_rental$rental(
      this._res);

  TRes _res;

  call({
    int? id,
    String? category3,
    Query$get_business_home_rentals$business_home_rental$rental$details?
        details,
    Query$get_business_home_rentals$business_home_rental$rental$business?
        business,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_business_home_rentals$business_home_rental$rental$details<
          TRes>
      get details =>
          CopyWith$Query$get_business_home_rentals$business_home_rental$rental$details
              .stub(_res);
  CopyWith$Query$get_business_home_rentals$business_home_rental$rental$business<
          TRes>
      get business =>
          CopyWith$Query$get_business_home_rentals$business_home_rental$rental$business
              .stub(_res);
}

class Query$get_business_home_rentals$business_home_rental$rental$details {
  Query$get_business_home_rentals$business_home_rental$rental$details({
    required this.name_id,
    this.description_id,
    required this.id,
    required this.name,
    this.description,
    required this.tags,
    this.additional_parameters,
    required this.available,
    required this.category1,
    required this.category2,
    required this.cost,
    this.image,
    required this.position,
    required this.$__typename,
  });

  factory Query$get_business_home_rentals$business_home_rental$rental$details.fromJson(
      Map<String, dynamic> json) {
    final l$name_id = json['name_id'];
    final l$description_id = json['description_id'];
    final l$id = json['id'];
    final l$name = json['name'];
    final l$description = json['description'];
    final l$tags = json['tags'];
    final l$additional_parameters = json['additional_parameters'];
    final l$available = json['available'];
    final l$category1 = json['category1'];
    final l$category2 = json['category2'];
    final l$cost = json['cost'];
    final l$image = json['image'];
    final l$position = json['position'];
    final l$$__typename = json['__typename'];
    return Query$get_business_home_rentals$business_home_rental$rental$details(
      name_id: (l$name_id as int),
      description_id: (l$description_id as int?),
      id: (l$id as int),
      name:
          Query$get_business_home_rentals$business_home_rental$rental$details$name
              .fromJson((l$name as Map<String, dynamic>)),
      description: l$description == null
          ? null
          : Query$get_business_home_rentals$business_home_rental$rental$details$description
              .fromJson((l$description as Map<String, dynamic>)),
      tags: mapFromJson(l$tags),
      additional_parameters: l$additional_parameters == null
          ? null
          : mapFromJson(l$additional_parameters),
      available: (l$available as bool),
      category1: (l$category1 as String),
      category2: (l$category2 as String),
      cost: mapFromJson(l$cost),
      image: l$image == null ? null : mapFromJson(l$image),
      position: (l$position as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int name_id;

  final int? description_id;

  final int id;

  final Query$get_business_home_rentals$business_home_rental$rental$details$name
      name;

  final Query$get_business_home_rentals$business_home_rental$rental$details$description?
      description;

  final dynamic tags;

  final dynamic? additional_parameters;

  final bool available;

  final String category1;

  final String category2;

  final dynamic cost;

  final dynamic? image;

  final int position;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name_id = name_id;
    _resultData['name_id'] = l$name_id;
    final l$description_id = description_id;
    _resultData['description_id'] = l$description_id;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name.toJson();
    final l$description = description;
    _resultData['description'] = l$description?.toJson();
    final l$tags = tags;
    _resultData['tags'] = mapToJson(l$tags);
    final l$additional_parameters = additional_parameters;
    _resultData['additional_parameters'] = l$additional_parameters == null
        ? null
        : mapToJson(l$additional_parameters);
    final l$available = available;
    _resultData['available'] = l$available;
    final l$category1 = category1;
    _resultData['category1'] = l$category1;
    final l$category2 = category2;
    _resultData['category2'] = l$category2;
    final l$cost = cost;
    _resultData['cost'] = mapToJson(l$cost);
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
    final l$name_id = name_id;
    final l$description_id = description_id;
    final l$id = id;
    final l$name = name;
    final l$description = description;
    final l$tags = tags;
    final l$additional_parameters = additional_parameters;
    final l$available = available;
    final l$category1 = category1;
    final l$category2 = category2;
    final l$cost = cost;
    final l$image = image;
    final l$position = position;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$name_id,
      l$description_id,
      l$id,
      l$name,
      l$description,
      l$tags,
      l$additional_parameters,
      l$available,
      l$category1,
      l$category2,
      l$cost,
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
    if (!(other
            is Query$get_business_home_rentals$business_home_rental$rental$details) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name_id = name_id;
    final lOther$name_id = other.name_id;
    if (l$name_id != lOther$name_id) {
      return false;
    }
    final l$description_id = description_id;
    final lOther$description_id = other.description_id;
    if (l$description_id != lOther$description_id) {
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
    final l$tags = tags;
    final lOther$tags = other.tags;
    if (l$tags != lOther$tags) {
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
    final l$category2 = category2;
    final lOther$category2 = other.category2;
    if (l$category2 != lOther$category2) {
      return false;
    }
    final l$cost = cost;
    final lOther$cost = other.cost;
    if (l$cost != lOther$cost) {
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

extension UtilityExtension$Query$get_business_home_rentals$business_home_rental$rental$details
    on Query$get_business_home_rentals$business_home_rental$rental$details {
  CopyWith$Query$get_business_home_rentals$business_home_rental$rental$details<
          Query$get_business_home_rentals$business_home_rental$rental$details>
      get copyWith =>
          CopyWith$Query$get_business_home_rentals$business_home_rental$rental$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_business_home_rentals$business_home_rental$rental$details<
    TRes> {
  factory CopyWith$Query$get_business_home_rentals$business_home_rental$rental$details(
    Query$get_business_home_rentals$business_home_rental$rental$details
        instance,
    TRes Function(
            Query$get_business_home_rentals$business_home_rental$rental$details)
        then,
  ) = _CopyWithImpl$Query$get_business_home_rentals$business_home_rental$rental$details;

  factory CopyWith$Query$get_business_home_rentals$business_home_rental$rental$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_business_home_rentals$business_home_rental$rental$details;

  TRes call({
    int? name_id,
    int? description_id,
    int? id,
    Query$get_business_home_rentals$business_home_rental$rental$details$name?
        name,
    Query$get_business_home_rentals$business_home_rental$rental$details$description?
        description,
    dynamic? tags,
    dynamic? additional_parameters,
    bool? available,
    String? category1,
    String? category2,
    dynamic? cost,
    dynamic? image,
    int? position,
    String? $__typename,
  });
  CopyWith$Query$get_business_home_rentals$business_home_rental$rental$details$name<
      TRes> get name;
  CopyWith$Query$get_business_home_rentals$business_home_rental$rental$details$description<
      TRes> get description;
}

class _CopyWithImpl$Query$get_business_home_rentals$business_home_rental$rental$details<
        TRes>
    implements
        CopyWith$Query$get_business_home_rentals$business_home_rental$rental$details<
            TRes> {
  _CopyWithImpl$Query$get_business_home_rentals$business_home_rental$rental$details(
    this._instance,
    this._then,
  );

  final Query$get_business_home_rentals$business_home_rental$rental$details
      _instance;

  final TRes Function(
          Query$get_business_home_rentals$business_home_rental$rental$details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? name_id = _undefined,
    Object? description_id = _undefined,
    Object? id = _undefined,
    Object? name = _undefined,
    Object? description = _undefined,
    Object? tags = _undefined,
    Object? additional_parameters = _undefined,
    Object? available = _undefined,
    Object? category1 = _undefined,
    Object? category2 = _undefined,
    Object? cost = _undefined,
    Object? image = _undefined,
    Object? position = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_business_home_rentals$business_home_rental$rental$details(
        name_id: name_id == _undefined || name_id == null
            ? _instance.name_id
            : (name_id as int),
        description_id: description_id == _undefined
            ? _instance.description_id
            : (description_id as int?),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name
                as Query$get_business_home_rentals$business_home_rental$rental$details$name),
        description: description == _undefined
            ? _instance.description
            : (description
                as Query$get_business_home_rentals$business_home_rental$rental$details$description?),
        tags: tags == _undefined || tags == null
            ? _instance.tags
            : (tags as dynamic),
        additional_parameters: additional_parameters == _undefined
            ? _instance.additional_parameters
            : (additional_parameters as dynamic?),
        available: available == _undefined || available == null
            ? _instance.available
            : (available as bool),
        category1: category1 == _undefined || category1 == null
            ? _instance.category1
            : (category1 as String),
        category2: category2 == _undefined || category2 == null
            ? _instance.category2
            : (category2 as String),
        cost: cost == _undefined || cost == null
            ? _instance.cost
            : (cost as dynamic),
        image: image == _undefined ? _instance.image : (image as dynamic?),
        position: position == _undefined || position == null
            ? _instance.position
            : (position as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_business_home_rentals$business_home_rental$rental$details$name<
      TRes> get name {
    final local$name = _instance.name;
    return CopyWith$Query$get_business_home_rentals$business_home_rental$rental$details$name(
        local$name, (e) => call(name: e));
  }

  CopyWith$Query$get_business_home_rentals$business_home_rental$rental$details$description<
      TRes> get description {
    final local$description = _instance.description;
    return local$description == null
        ? CopyWith$Query$get_business_home_rentals$business_home_rental$rental$details$description
            .stub(_then(_instance))
        : CopyWith$Query$get_business_home_rentals$business_home_rental$rental$details$description(
            local$description, (e) => call(description: e));
  }
}

class _CopyWithStubImpl$Query$get_business_home_rentals$business_home_rental$rental$details<
        TRes>
    implements
        CopyWith$Query$get_business_home_rentals$business_home_rental$rental$details<
            TRes> {
  _CopyWithStubImpl$Query$get_business_home_rentals$business_home_rental$rental$details(
      this._res);

  TRes _res;

  call({
    int? name_id,
    int? description_id,
    int? id,
    Query$get_business_home_rentals$business_home_rental$rental$details$name?
        name,
    Query$get_business_home_rentals$business_home_rental$rental$details$description?
        description,
    dynamic? tags,
    dynamic? additional_parameters,
    bool? available,
    String? category1,
    String? category2,
    dynamic? cost,
    dynamic? image,
    int? position,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_business_home_rentals$business_home_rental$rental$details$name<
          TRes>
      get name =>
          CopyWith$Query$get_business_home_rentals$business_home_rental$rental$details$name
              .stub(_res);
  CopyWith$Query$get_business_home_rentals$business_home_rental$rental$details$description<
          TRes>
      get description =>
          CopyWith$Query$get_business_home_rentals$business_home_rental$rental$details$description
              .stub(_res);
}

class Query$get_business_home_rentals$business_home_rental$rental$details$name {
  Query$get_business_home_rentals$business_home_rental$rental$details$name({
    required this.translations,
    required this.$__typename,
  });

  factory Query$get_business_home_rentals$business_home_rental$rental$details$name.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$get_business_home_rentals$business_home_rental$rental$details$name(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$get_business_home_rentals$business_home_rental$rental$details$name$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Query$get_business_home_rentals$business_home_rental$rental$details$name$translations>
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
            is Query$get_business_home_rentals$business_home_rental$rental$details$name) ||
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

extension UtilityExtension$Query$get_business_home_rentals$business_home_rental$rental$details$name
    on Query$get_business_home_rentals$business_home_rental$rental$details$name {
  CopyWith$Query$get_business_home_rentals$business_home_rental$rental$details$name<
          Query$get_business_home_rentals$business_home_rental$rental$details$name>
      get copyWith =>
          CopyWith$Query$get_business_home_rentals$business_home_rental$rental$details$name(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_business_home_rentals$business_home_rental$rental$details$name<
    TRes> {
  factory CopyWith$Query$get_business_home_rentals$business_home_rental$rental$details$name(
    Query$get_business_home_rentals$business_home_rental$rental$details$name
        instance,
    TRes Function(
            Query$get_business_home_rentals$business_home_rental$rental$details$name)
        then,
  ) = _CopyWithImpl$Query$get_business_home_rentals$business_home_rental$rental$details$name;

  factory CopyWith$Query$get_business_home_rentals$business_home_rental$rental$details$name.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_business_home_rentals$business_home_rental$rental$details$name;

  TRes call({
    List<Query$get_business_home_rentals$business_home_rental$rental$details$name$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$get_business_home_rentals$business_home_rental$rental$details$name$translations> Function(
              Iterable<
                  CopyWith$Query$get_business_home_rentals$business_home_rental$rental$details$name$translations<
                      Query$get_business_home_rentals$business_home_rental$rental$details$name$translations>>)
          _fn);
}

class _CopyWithImpl$Query$get_business_home_rentals$business_home_rental$rental$details$name<
        TRes>
    implements
        CopyWith$Query$get_business_home_rentals$business_home_rental$rental$details$name<
            TRes> {
  _CopyWithImpl$Query$get_business_home_rentals$business_home_rental$rental$details$name(
    this._instance,
    this._then,
  );

  final Query$get_business_home_rentals$business_home_rental$rental$details$name
      _instance;

  final TRes Function(
          Query$get_business_home_rentals$business_home_rental$rental$details$name)
      _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_business_home_rentals$business_home_rental$rental$details$name(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$get_business_home_rentals$business_home_rental$rental$details$name$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$get_business_home_rentals$business_home_rental$rental$details$name$translations> Function(
                  Iterable<
                      CopyWith$Query$get_business_home_rentals$business_home_rental$rental$details$name$translations<
                          Query$get_business_home_rentals$business_home_rental$rental$details$name$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$get_business_home_rentals$business_home_rental$rental$details$name$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$get_business_home_rentals$business_home_rental$rental$details$name<
        TRes>
    implements
        CopyWith$Query$get_business_home_rentals$business_home_rental$rental$details$name<
            TRes> {
  _CopyWithStubImpl$Query$get_business_home_rentals$business_home_rental$rental$details$name(
      this._res);

  TRes _res;

  call({
    List<Query$get_business_home_rentals$business_home_rental$rental$details$name$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$get_business_home_rentals$business_home_rental$rental$details$name$translations {
  Query$get_business_home_rentals$business_home_rental$rental$details$name$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$get_business_home_rentals$business_home_rental$rental$details$name$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$get_business_home_rentals$business_home_rental$rental$details$name$translations(
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
            is Query$get_business_home_rentals$business_home_rental$rental$details$name$translations) ||
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

extension UtilityExtension$Query$get_business_home_rentals$business_home_rental$rental$details$name$translations
    on Query$get_business_home_rentals$business_home_rental$rental$details$name$translations {
  CopyWith$Query$get_business_home_rentals$business_home_rental$rental$details$name$translations<
          Query$get_business_home_rentals$business_home_rental$rental$details$name$translations>
      get copyWith =>
          CopyWith$Query$get_business_home_rentals$business_home_rental$rental$details$name$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_business_home_rentals$business_home_rental$rental$details$name$translations<
    TRes> {
  factory CopyWith$Query$get_business_home_rentals$business_home_rental$rental$details$name$translations(
    Query$get_business_home_rentals$business_home_rental$rental$details$name$translations
        instance,
    TRes Function(
            Query$get_business_home_rentals$business_home_rental$rental$details$name$translations)
        then,
  ) = _CopyWithImpl$Query$get_business_home_rentals$business_home_rental$rental$details$name$translations;

  factory CopyWith$Query$get_business_home_rentals$business_home_rental$rental$details$name$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_business_home_rentals$business_home_rental$rental$details$name$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_business_home_rentals$business_home_rental$rental$details$name$translations<
        TRes>
    implements
        CopyWith$Query$get_business_home_rentals$business_home_rental$rental$details$name$translations<
            TRes> {
  _CopyWithImpl$Query$get_business_home_rentals$business_home_rental$rental$details$name$translations(
    this._instance,
    this._then,
  );

  final Query$get_business_home_rentals$business_home_rental$rental$details$name$translations
      _instance;

  final TRes Function(
          Query$get_business_home_rentals$business_home_rental$rental$details$name$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_business_home_rentals$business_home_rental$rental$details$name$translations(
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

class _CopyWithStubImpl$Query$get_business_home_rentals$business_home_rental$rental$details$name$translations<
        TRes>
    implements
        CopyWith$Query$get_business_home_rentals$business_home_rental$rental$details$name$translations<
            TRes> {
  _CopyWithStubImpl$Query$get_business_home_rentals$business_home_rental$rental$details$name$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Query$get_business_home_rentals$business_home_rental$rental$details$description {
  Query$get_business_home_rentals$business_home_rental$rental$details$description({
    required this.translations,
    required this.$__typename,
  });

  factory Query$get_business_home_rentals$business_home_rental$rental$details$description.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$get_business_home_rentals$business_home_rental$rental$details$description(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$get_business_home_rentals$business_home_rental$rental$details$description$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Query$get_business_home_rentals$business_home_rental$rental$details$description$translations>
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
            is Query$get_business_home_rentals$business_home_rental$rental$details$description) ||
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

extension UtilityExtension$Query$get_business_home_rentals$business_home_rental$rental$details$description
    on Query$get_business_home_rentals$business_home_rental$rental$details$description {
  CopyWith$Query$get_business_home_rentals$business_home_rental$rental$details$description<
          Query$get_business_home_rentals$business_home_rental$rental$details$description>
      get copyWith =>
          CopyWith$Query$get_business_home_rentals$business_home_rental$rental$details$description(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_business_home_rentals$business_home_rental$rental$details$description<
    TRes> {
  factory CopyWith$Query$get_business_home_rentals$business_home_rental$rental$details$description(
    Query$get_business_home_rentals$business_home_rental$rental$details$description
        instance,
    TRes Function(
            Query$get_business_home_rentals$business_home_rental$rental$details$description)
        then,
  ) = _CopyWithImpl$Query$get_business_home_rentals$business_home_rental$rental$details$description;

  factory CopyWith$Query$get_business_home_rentals$business_home_rental$rental$details$description.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_business_home_rentals$business_home_rental$rental$details$description;

  TRes call({
    List<Query$get_business_home_rentals$business_home_rental$rental$details$description$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$get_business_home_rentals$business_home_rental$rental$details$description$translations> Function(
              Iterable<
                  CopyWith$Query$get_business_home_rentals$business_home_rental$rental$details$description$translations<
                      Query$get_business_home_rentals$business_home_rental$rental$details$description$translations>>)
          _fn);
}

class _CopyWithImpl$Query$get_business_home_rentals$business_home_rental$rental$details$description<
        TRes>
    implements
        CopyWith$Query$get_business_home_rentals$business_home_rental$rental$details$description<
            TRes> {
  _CopyWithImpl$Query$get_business_home_rentals$business_home_rental$rental$details$description(
    this._instance,
    this._then,
  );

  final Query$get_business_home_rentals$business_home_rental$rental$details$description
      _instance;

  final TRes Function(
          Query$get_business_home_rentals$business_home_rental$rental$details$description)
      _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_business_home_rentals$business_home_rental$rental$details$description(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$get_business_home_rentals$business_home_rental$rental$details$description$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$get_business_home_rentals$business_home_rental$rental$details$description$translations> Function(
                  Iterable<
                      CopyWith$Query$get_business_home_rentals$business_home_rental$rental$details$description$translations<
                          Query$get_business_home_rentals$business_home_rental$rental$details$description$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$get_business_home_rentals$business_home_rental$rental$details$description$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$get_business_home_rentals$business_home_rental$rental$details$description<
        TRes>
    implements
        CopyWith$Query$get_business_home_rentals$business_home_rental$rental$details$description<
            TRes> {
  _CopyWithStubImpl$Query$get_business_home_rentals$business_home_rental$rental$details$description(
      this._res);

  TRes _res;

  call({
    List<Query$get_business_home_rentals$business_home_rental$rental$details$description$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$get_business_home_rentals$business_home_rental$rental$details$description$translations {
  Query$get_business_home_rentals$business_home_rental$rental$details$description$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$get_business_home_rentals$business_home_rental$rental$details$description$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$get_business_home_rentals$business_home_rental$rental$details$description$translations(
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
            is Query$get_business_home_rentals$business_home_rental$rental$details$description$translations) ||
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

extension UtilityExtension$Query$get_business_home_rentals$business_home_rental$rental$details$description$translations
    on Query$get_business_home_rentals$business_home_rental$rental$details$description$translations {
  CopyWith$Query$get_business_home_rentals$business_home_rental$rental$details$description$translations<
          Query$get_business_home_rentals$business_home_rental$rental$details$description$translations>
      get copyWith =>
          CopyWith$Query$get_business_home_rentals$business_home_rental$rental$details$description$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_business_home_rentals$business_home_rental$rental$details$description$translations<
    TRes> {
  factory CopyWith$Query$get_business_home_rentals$business_home_rental$rental$details$description$translations(
    Query$get_business_home_rentals$business_home_rental$rental$details$description$translations
        instance,
    TRes Function(
            Query$get_business_home_rentals$business_home_rental$rental$details$description$translations)
        then,
  ) = _CopyWithImpl$Query$get_business_home_rentals$business_home_rental$rental$details$description$translations;

  factory CopyWith$Query$get_business_home_rentals$business_home_rental$rental$details$description$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_business_home_rentals$business_home_rental$rental$details$description$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_business_home_rentals$business_home_rental$rental$details$description$translations<
        TRes>
    implements
        CopyWith$Query$get_business_home_rentals$business_home_rental$rental$details$description$translations<
            TRes> {
  _CopyWithImpl$Query$get_business_home_rentals$business_home_rental$rental$details$description$translations(
    this._instance,
    this._then,
  );

  final Query$get_business_home_rentals$business_home_rental$rental$details$description$translations
      _instance;

  final TRes Function(
          Query$get_business_home_rentals$business_home_rental$rental$details$description$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_business_home_rentals$business_home_rental$rental$details$description$translations(
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

class _CopyWithStubImpl$Query$get_business_home_rentals$business_home_rental$rental$details$description$translations<
        TRes>
    implements
        CopyWith$Query$get_business_home_rentals$business_home_rental$rental$details$description$translations<
            TRes> {
  _CopyWithStubImpl$Query$get_business_home_rentals$business_home_rental$rental$details$description$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Query$get_business_home_rentals$business_home_rental$rental$business {
  Query$get_business_home_rentals$business_home_rental$rental$business({
    required this.id,
    required this.details,
    required this.$__typename,
  });

  factory Query$get_business_home_rentals$business_home_rental$rental$business.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Query$get_business_home_rentals$business_home_rental$rental$business(
      id: (l$id as int),
      details:
          Query$get_business_home_rentals$business_home_rental$rental$business$details
              .fromJson((l$details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final Query$get_business_home_rentals$business_home_rental$rental$business$details
      details;

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
    if (!(other
            is Query$get_business_home_rentals$business_home_rental$rental$business) ||
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

extension UtilityExtension$Query$get_business_home_rentals$business_home_rental$rental$business
    on Query$get_business_home_rentals$business_home_rental$rental$business {
  CopyWith$Query$get_business_home_rentals$business_home_rental$rental$business<
          Query$get_business_home_rentals$business_home_rental$rental$business>
      get copyWith =>
          CopyWith$Query$get_business_home_rentals$business_home_rental$rental$business(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_business_home_rentals$business_home_rental$rental$business<
    TRes> {
  factory CopyWith$Query$get_business_home_rentals$business_home_rental$rental$business(
    Query$get_business_home_rentals$business_home_rental$rental$business
        instance,
    TRes Function(
            Query$get_business_home_rentals$business_home_rental$rental$business)
        then,
  ) = _CopyWithImpl$Query$get_business_home_rentals$business_home_rental$rental$business;

  factory CopyWith$Query$get_business_home_rentals$business_home_rental$rental$business.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_business_home_rentals$business_home_rental$rental$business;

  TRes call({
    int? id,
    Query$get_business_home_rentals$business_home_rental$rental$business$details?
        details,
    String? $__typename,
  });
  CopyWith$Query$get_business_home_rentals$business_home_rental$rental$business$details<
      TRes> get details;
}

class _CopyWithImpl$Query$get_business_home_rentals$business_home_rental$rental$business<
        TRes>
    implements
        CopyWith$Query$get_business_home_rentals$business_home_rental$rental$business<
            TRes> {
  _CopyWithImpl$Query$get_business_home_rentals$business_home_rental$rental$business(
    this._instance,
    this._then,
  );

  final Query$get_business_home_rentals$business_home_rental$rental$business
      _instance;

  final TRes Function(
          Query$get_business_home_rentals$business_home_rental$rental$business)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_business_home_rentals$business_home_rental$rental$business(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        details: details == _undefined || details == null
            ? _instance.details
            : (details
                as Query$get_business_home_rentals$business_home_rental$rental$business$details),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_business_home_rentals$business_home_rental$rental$business$details<
      TRes> get details {
    final local$details = _instance.details;
    return CopyWith$Query$get_business_home_rentals$business_home_rental$rental$business$details(
        local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Query$get_business_home_rentals$business_home_rental$rental$business<
        TRes>
    implements
        CopyWith$Query$get_business_home_rentals$business_home_rental$rental$business<
            TRes> {
  _CopyWithStubImpl$Query$get_business_home_rentals$business_home_rental$rental$business(
      this._res);

  TRes _res;

  call({
    int? id,
    Query$get_business_home_rentals$business_home_rental$rental$business$details?
        details,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_business_home_rentals$business_home_rental$rental$business$details<
          TRes>
      get details =>
          CopyWith$Query$get_business_home_rentals$business_home_rental$rental$business$details
              .stub(_res);
}

class Query$get_business_home_rentals$business_home_rental$rental$business$details {
  Query$get_business_home_rentals$business_home_rental$rental$business$details({
    required this.id,
    required this.name,
    required this.currency,
    required this.$__typename,
  });

  factory Query$get_business_home_rentals$business_home_rental$rental$business$details.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$currency = json['currency'];
    final l$$__typename = json['__typename'];
    return Query$get_business_home_rentals$business_home_rental$rental$business$details(
      id: (l$id as int),
      name: (l$name as String),
      currency: (l$currency as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String name;

  final String currency;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$currency = currency;
    _resultData['currency'] = l$currency;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$currency = currency;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$currency,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$get_business_home_rentals$business_home_rental$rental$business$details) ||
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
    final l$currency = currency;
    final lOther$currency = other.currency;
    if (l$currency != lOther$currency) {
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

extension UtilityExtension$Query$get_business_home_rentals$business_home_rental$rental$business$details
    on Query$get_business_home_rentals$business_home_rental$rental$business$details {
  CopyWith$Query$get_business_home_rentals$business_home_rental$rental$business$details<
          Query$get_business_home_rentals$business_home_rental$rental$business$details>
      get copyWith =>
          CopyWith$Query$get_business_home_rentals$business_home_rental$rental$business$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_business_home_rentals$business_home_rental$rental$business$details<
    TRes> {
  factory CopyWith$Query$get_business_home_rentals$business_home_rental$rental$business$details(
    Query$get_business_home_rentals$business_home_rental$rental$business$details
        instance,
    TRes Function(
            Query$get_business_home_rentals$business_home_rental$rental$business$details)
        then,
  ) = _CopyWithImpl$Query$get_business_home_rentals$business_home_rental$rental$business$details;

  factory CopyWith$Query$get_business_home_rentals$business_home_rental$rental$business$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_business_home_rentals$business_home_rental$rental$business$details;

  TRes call({
    int? id,
    String? name,
    String? currency,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_business_home_rentals$business_home_rental$rental$business$details<
        TRes>
    implements
        CopyWith$Query$get_business_home_rentals$business_home_rental$rental$business$details<
            TRes> {
  _CopyWithImpl$Query$get_business_home_rentals$business_home_rental$rental$business$details(
    this._instance,
    this._then,
  );

  final Query$get_business_home_rentals$business_home_rental$rental$business$details
      _instance;

  final TRes Function(
          Query$get_business_home_rentals$business_home_rental$rental$business$details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? currency = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_business_home_rentals$business_home_rental$rental$business$details(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        currency: currency == _undefined || currency == null
            ? _instance.currency
            : (currency as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$get_business_home_rentals$business_home_rental$rental$business$details<
        TRes>
    implements
        CopyWith$Query$get_business_home_rentals$business_home_rental$rental$business$details<
            TRes> {
  _CopyWithStubImpl$Query$get_business_home_rentals$business_home_rental$rental$business$details(
      this._res);

  TRes _res;

  call({
    int? id,
    String? name,
    String? currency,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$number_of_rentals {
  factory Variables$Query$number_of_rentals({
    required double distance,
    required Geography from,
  }) =>
      Variables$Query$number_of_rentals._({
        r'distance': distance,
        r'from': from,
      });

  Variables$Query$number_of_rentals._(this._$data);

  factory Variables$Query$number_of_rentals.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$distance = data['distance'];
    result$data['distance'] = (l$distance as num).toDouble();
    final l$from = data['from'];
    result$data['from'] = geographyFromJson(l$from);
    return Variables$Query$number_of_rentals._(result$data);
  }

  Map<String, dynamic> _$data;

  double get distance => (_$data['distance'] as double);
  Geography get from => (_$data['from'] as Geography);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$distance = distance;
    result$data['distance'] = l$distance;
    final l$from = from;
    result$data['from'] = geographyToJson(l$from);
    return result$data;
  }

  CopyWith$Variables$Query$number_of_rentals<Variables$Query$number_of_rentals>
      get copyWith => CopyWith$Variables$Query$number_of_rentals(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$number_of_rentals) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$distance = distance;
    final lOther$distance = other.distance;
    if (l$distance != lOther$distance) {
      return false;
    }
    final l$from = from;
    final lOther$from = other.from;
    if (l$from != lOther$from) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$distance = distance;
    final l$from = from;
    return Object.hashAll([
      l$distance,
      l$from,
    ]);
  }
}

abstract class CopyWith$Variables$Query$number_of_rentals<TRes> {
  factory CopyWith$Variables$Query$number_of_rentals(
    Variables$Query$number_of_rentals instance,
    TRes Function(Variables$Query$number_of_rentals) then,
  ) = _CopyWithImpl$Variables$Query$number_of_rentals;

  factory CopyWith$Variables$Query$number_of_rentals.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$number_of_rentals;

  TRes call({
    double? distance,
    Geography? from,
  });
}

class _CopyWithImpl$Variables$Query$number_of_rentals<TRes>
    implements CopyWith$Variables$Query$number_of_rentals<TRes> {
  _CopyWithImpl$Variables$Query$number_of_rentals(
    this._instance,
    this._then,
  );

  final Variables$Query$number_of_rentals _instance;

  final TRes Function(Variables$Query$number_of_rentals) _then;

  static const _undefined = {};

  TRes call({
    Object? distance = _undefined,
    Object? from = _undefined,
  }) =>
      _then(Variables$Query$number_of_rentals._({
        ..._instance._$data,
        if (distance != _undefined && distance != null)
          'distance': (distance as double),
        if (from != _undefined && from != null) 'from': (from as Geography),
      }));
}

class _CopyWithStubImpl$Variables$Query$number_of_rentals<TRes>
    implements CopyWith$Variables$Query$number_of_rentals<TRes> {
  _CopyWithStubImpl$Variables$Query$number_of_rentals(this._res);

  TRes _res;

  call({
    double? distance,
    Geography? from,
  }) =>
      _res;
}

class Query$number_of_rentals {
  Query$number_of_rentals({
    required this.business_rental_aggregate,
    required this.$__typename,
  });

  factory Query$number_of_rentals.fromJson(Map<String, dynamic> json) {
    final l$business_rental_aggregate = json['business_rental_aggregate'];
    final l$$__typename = json['__typename'];
    return Query$number_of_rentals(
      business_rental_aggregate:
          Query$number_of_rentals$business_rental_aggregate.fromJson(
              (l$business_rental_aggregate as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$number_of_rentals$business_rental_aggregate
      business_rental_aggregate;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$business_rental_aggregate = business_rental_aggregate;
    _resultData['business_rental_aggregate'] =
        l$business_rental_aggregate.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$business_rental_aggregate = business_rental_aggregate;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$business_rental_aggregate,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$number_of_rentals) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$business_rental_aggregate = business_rental_aggregate;
    final lOther$business_rental_aggregate = other.business_rental_aggregate;
    if (l$business_rental_aggregate != lOther$business_rental_aggregate) {
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

extension UtilityExtension$Query$number_of_rentals on Query$number_of_rentals {
  CopyWith$Query$number_of_rentals<Query$number_of_rentals> get copyWith =>
      CopyWith$Query$number_of_rentals(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$number_of_rentals<TRes> {
  factory CopyWith$Query$number_of_rentals(
    Query$number_of_rentals instance,
    TRes Function(Query$number_of_rentals) then,
  ) = _CopyWithImpl$Query$number_of_rentals;

  factory CopyWith$Query$number_of_rentals.stub(TRes res) =
      _CopyWithStubImpl$Query$number_of_rentals;

  TRes call({
    Query$number_of_rentals$business_rental_aggregate?
        business_rental_aggregate,
    String? $__typename,
  });
  CopyWith$Query$number_of_rentals$business_rental_aggregate<TRes>
      get business_rental_aggregate;
}

class _CopyWithImpl$Query$number_of_rentals<TRes>
    implements CopyWith$Query$number_of_rentals<TRes> {
  _CopyWithImpl$Query$number_of_rentals(
    this._instance,
    this._then,
  );

  final Query$number_of_rentals _instance;

  final TRes Function(Query$number_of_rentals) _then;

  static const _undefined = {};

  TRes call({
    Object? business_rental_aggregate = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$number_of_rentals(
        business_rental_aggregate: business_rental_aggregate == _undefined ||
                business_rental_aggregate == null
            ? _instance.business_rental_aggregate
            : (business_rental_aggregate
                as Query$number_of_rentals$business_rental_aggregate),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$number_of_rentals$business_rental_aggregate<TRes>
      get business_rental_aggregate {
    final local$business_rental_aggregate = _instance.business_rental_aggregate;
    return CopyWith$Query$number_of_rentals$business_rental_aggregate(
        local$business_rental_aggregate,
        (e) => call(business_rental_aggregate: e));
  }
}

class _CopyWithStubImpl$Query$number_of_rentals<TRes>
    implements CopyWith$Query$number_of_rentals<TRes> {
  _CopyWithStubImpl$Query$number_of_rentals(this._res);

  TRes _res;

  call({
    Query$number_of_rentals$business_rental_aggregate?
        business_rental_aggregate,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$number_of_rentals$business_rental_aggregate<TRes>
      get business_rental_aggregate =>
          CopyWith$Query$number_of_rentals$business_rental_aggregate.stub(_res);
}

const documentNodeQuerynumber_of_rentals = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'number_of_rentals'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'distance')),
        type: NamedTypeNode(
          name: NameNode(value: 'Float'),
          isNonNull: true,
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
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'business_rental_aggregate'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
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
                                        name: NameNode(value: 'distance')),
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
Query$number_of_rentals _parserFn$Query$number_of_rentals(
        Map<String, dynamic> data) =>
    Query$number_of_rentals.fromJson(data);

class Options$Query$number_of_rentals
    extends graphql.QueryOptions<Query$number_of_rentals> {
  Options$Query$number_of_rentals({
    String? operationName,
    required Variables$Query$number_of_rentals variables,
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
          document: documentNodeQuerynumber_of_rentals,
          parserFn: _parserFn$Query$number_of_rentals,
        );
}

class WatchOptions$Query$number_of_rentals
    extends graphql.WatchQueryOptions<Query$number_of_rentals> {
  WatchOptions$Query$number_of_rentals({
    String? operationName,
    required Variables$Query$number_of_rentals variables,
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
          document: documentNodeQuerynumber_of_rentals,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$number_of_rentals,
        );
}

class FetchMoreOptions$Query$number_of_rentals
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$number_of_rentals({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$number_of_rentals variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerynumber_of_rentals,
        );
}

extension ClientExtension$Query$number_of_rentals on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$number_of_rentals>> query$number_of_rentals(
          Options$Query$number_of_rentals options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$number_of_rentals> watchQuery$number_of_rentals(
          WatchOptions$Query$number_of_rentals options) =>
      this.watchQuery(options);
  void writeQuery$number_of_rentals({
    required Query$number_of_rentals data,
    required Variables$Query$number_of_rentals variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQuerynumber_of_rentals),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$number_of_rentals? readQuery$number_of_rentals({
    required Variables$Query$number_of_rentals variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQuerynumber_of_rentals),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$number_of_rentals.fromJson(result);
  }
}

class Query$number_of_rentals$business_rental_aggregate {
  Query$number_of_rentals$business_rental_aggregate({
    this.aggregate,
    required this.$__typename,
  });

  factory Query$number_of_rentals$business_rental_aggregate.fromJson(
      Map<String, dynamic> json) {
    final l$aggregate = json['aggregate'];
    final l$$__typename = json['__typename'];
    return Query$number_of_rentals$business_rental_aggregate(
      aggregate: l$aggregate == null
          ? null
          : Query$number_of_rentals$business_rental_aggregate$aggregate
              .fromJson((l$aggregate as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$number_of_rentals$business_rental_aggregate$aggregate? aggregate;

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
    if (!(other is Query$number_of_rentals$business_rental_aggregate) ||
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

extension UtilityExtension$Query$number_of_rentals$business_rental_aggregate
    on Query$number_of_rentals$business_rental_aggregate {
  CopyWith$Query$number_of_rentals$business_rental_aggregate<
          Query$number_of_rentals$business_rental_aggregate>
      get copyWith =>
          CopyWith$Query$number_of_rentals$business_rental_aggregate(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$number_of_rentals$business_rental_aggregate<
    TRes> {
  factory CopyWith$Query$number_of_rentals$business_rental_aggregate(
    Query$number_of_rentals$business_rental_aggregate instance,
    TRes Function(Query$number_of_rentals$business_rental_aggregate) then,
  ) = _CopyWithImpl$Query$number_of_rentals$business_rental_aggregate;

  factory CopyWith$Query$number_of_rentals$business_rental_aggregate.stub(
          TRes res) =
      _CopyWithStubImpl$Query$number_of_rentals$business_rental_aggregate;

  TRes call({
    Query$number_of_rentals$business_rental_aggregate$aggregate? aggregate,
    String? $__typename,
  });
  CopyWith$Query$number_of_rentals$business_rental_aggregate$aggregate<TRes>
      get aggregate;
}

class _CopyWithImpl$Query$number_of_rentals$business_rental_aggregate<TRes>
    implements
        CopyWith$Query$number_of_rentals$business_rental_aggregate<TRes> {
  _CopyWithImpl$Query$number_of_rentals$business_rental_aggregate(
    this._instance,
    this._then,
  );

  final Query$number_of_rentals$business_rental_aggregate _instance;

  final TRes Function(Query$number_of_rentals$business_rental_aggregate) _then;

  static const _undefined = {};

  TRes call({
    Object? aggregate = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$number_of_rentals$business_rental_aggregate(
        aggregate: aggregate == _undefined
            ? _instance.aggregate
            : (aggregate
                as Query$number_of_rentals$business_rental_aggregate$aggregate?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$number_of_rentals$business_rental_aggregate$aggregate<TRes>
      get aggregate {
    final local$aggregate = _instance.aggregate;
    return local$aggregate == null
        ? CopyWith$Query$number_of_rentals$business_rental_aggregate$aggregate
            .stub(_then(_instance))
        : CopyWith$Query$number_of_rentals$business_rental_aggregate$aggregate(
            local$aggregate, (e) => call(aggregate: e));
  }
}

class _CopyWithStubImpl$Query$number_of_rentals$business_rental_aggregate<TRes>
    implements
        CopyWith$Query$number_of_rentals$business_rental_aggregate<TRes> {
  _CopyWithStubImpl$Query$number_of_rentals$business_rental_aggregate(
      this._res);

  TRes _res;

  call({
    Query$number_of_rentals$business_rental_aggregate$aggregate? aggregate,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$number_of_rentals$business_rental_aggregate$aggregate<TRes>
      get aggregate =>
          CopyWith$Query$number_of_rentals$business_rental_aggregate$aggregate
              .stub(_res);
}

class Query$number_of_rentals$business_rental_aggregate$aggregate {
  Query$number_of_rentals$business_rental_aggregate$aggregate({
    required this.count,
    required this.$__typename,
  });

  factory Query$number_of_rentals$business_rental_aggregate$aggregate.fromJson(
      Map<String, dynamic> json) {
    final l$count = json['count'];
    final l$$__typename = json['__typename'];
    return Query$number_of_rentals$business_rental_aggregate$aggregate(
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
            is Query$number_of_rentals$business_rental_aggregate$aggregate) ||
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

extension UtilityExtension$Query$number_of_rentals$business_rental_aggregate$aggregate
    on Query$number_of_rentals$business_rental_aggregate$aggregate {
  CopyWith$Query$number_of_rentals$business_rental_aggregate$aggregate<
          Query$number_of_rentals$business_rental_aggregate$aggregate>
      get copyWith =>
          CopyWith$Query$number_of_rentals$business_rental_aggregate$aggregate(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$number_of_rentals$business_rental_aggregate$aggregate<
    TRes> {
  factory CopyWith$Query$number_of_rentals$business_rental_aggregate$aggregate(
    Query$number_of_rentals$business_rental_aggregate$aggregate instance,
    TRes Function(Query$number_of_rentals$business_rental_aggregate$aggregate)
        then,
  ) = _CopyWithImpl$Query$number_of_rentals$business_rental_aggregate$aggregate;

  factory CopyWith$Query$number_of_rentals$business_rental_aggregate$aggregate.stub(
          TRes res) =
      _CopyWithStubImpl$Query$number_of_rentals$business_rental_aggregate$aggregate;

  TRes call({
    int? count,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$number_of_rentals$business_rental_aggregate$aggregate<
        TRes>
    implements
        CopyWith$Query$number_of_rentals$business_rental_aggregate$aggregate<
            TRes> {
  _CopyWithImpl$Query$number_of_rentals$business_rental_aggregate$aggregate(
    this._instance,
    this._then,
  );

  final Query$number_of_rentals$business_rental_aggregate$aggregate _instance;

  final TRes Function(
      Query$number_of_rentals$business_rental_aggregate$aggregate) _then;

  static const _undefined = {};

  TRes call({
    Object? count = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$number_of_rentals$business_rental_aggregate$aggregate(
        count: count == _undefined || count == null
            ? _instance.count
            : (count as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$number_of_rentals$business_rental_aggregate$aggregate<
        TRes>
    implements
        CopyWith$Query$number_of_rentals$business_rental_aggregate$aggregate<
            TRes> {
  _CopyWithStubImpl$Query$number_of_rentals$business_rental_aggregate$aggregate(
      this._res);

  TRes _res;

  call({
    int? count,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$number_of_rentals_by_category {
  factory Variables$Query$number_of_rentals_by_category({
    required double distance,
    required Geography from,
    String? category1,
  }) =>
      Variables$Query$number_of_rentals_by_category._({
        r'distance': distance,
        r'from': from,
        if (category1 != null) r'category1': category1,
      });

  Variables$Query$number_of_rentals_by_category._(this._$data);

  factory Variables$Query$number_of_rentals_by_category.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$distance = data['distance'];
    result$data['distance'] = (l$distance as num).toDouble();
    final l$from = data['from'];
    result$data['from'] = geographyFromJson(l$from);
    if (data.containsKey('category1')) {
      final l$category1 = data['category1'];
      result$data['category1'] = (l$category1 as String?);
    }
    return Variables$Query$number_of_rentals_by_category._(result$data);
  }

  Map<String, dynamic> _$data;

  double get distance => (_$data['distance'] as double);
  Geography get from => (_$data['from'] as Geography);
  String? get category1 => (_$data['category1'] as String?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$distance = distance;
    result$data['distance'] = l$distance;
    final l$from = from;
    result$data['from'] = geographyToJson(l$from);
    if (_$data.containsKey('category1')) {
      final l$category1 = category1;
      result$data['category1'] = l$category1;
    }
    return result$data;
  }

  CopyWith$Variables$Query$number_of_rentals_by_category<
          Variables$Query$number_of_rentals_by_category>
      get copyWith => CopyWith$Variables$Query$number_of_rentals_by_category(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$number_of_rentals_by_category) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$distance = distance;
    final lOther$distance = other.distance;
    if (l$distance != lOther$distance) {
      return false;
    }
    final l$from = from;
    final lOther$from = other.from;
    if (l$from != lOther$from) {
      return false;
    }
    final l$category1 = category1;
    final lOther$category1 = other.category1;
    if (_$data.containsKey('category1') !=
        other._$data.containsKey('category1')) {
      return false;
    }
    if (l$category1 != lOther$category1) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$distance = distance;
    final l$from = from;
    final l$category1 = category1;
    return Object.hashAll([
      l$distance,
      l$from,
      _$data.containsKey('category1') ? l$category1 : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$number_of_rentals_by_category<TRes> {
  factory CopyWith$Variables$Query$number_of_rentals_by_category(
    Variables$Query$number_of_rentals_by_category instance,
    TRes Function(Variables$Query$number_of_rentals_by_category) then,
  ) = _CopyWithImpl$Variables$Query$number_of_rentals_by_category;

  factory CopyWith$Variables$Query$number_of_rentals_by_category.stub(
          TRes res) =
      _CopyWithStubImpl$Variables$Query$number_of_rentals_by_category;

  TRes call({
    double? distance,
    Geography? from,
    String? category1,
  });
}

class _CopyWithImpl$Variables$Query$number_of_rentals_by_category<TRes>
    implements CopyWith$Variables$Query$number_of_rentals_by_category<TRes> {
  _CopyWithImpl$Variables$Query$number_of_rentals_by_category(
    this._instance,
    this._then,
  );

  final Variables$Query$number_of_rentals_by_category _instance;

  final TRes Function(Variables$Query$number_of_rentals_by_category) _then;

  static const _undefined = {};

  TRes call({
    Object? distance = _undefined,
    Object? from = _undefined,
    Object? category1 = _undefined,
  }) =>
      _then(Variables$Query$number_of_rentals_by_category._({
        ..._instance._$data,
        if (distance != _undefined && distance != null)
          'distance': (distance as double),
        if (from != _undefined && from != null) 'from': (from as Geography),
        if (category1 != _undefined) 'category1': (category1 as String?),
      }));
}

class _CopyWithStubImpl$Variables$Query$number_of_rentals_by_category<TRes>
    implements CopyWith$Variables$Query$number_of_rentals_by_category<TRes> {
  _CopyWithStubImpl$Variables$Query$number_of_rentals_by_category(this._res);

  TRes _res;

  call({
    double? distance,
    Geography? from,
    String? category1,
  }) =>
      _res;
}

class Query$number_of_rentals_by_category {
  Query$number_of_rentals_by_category({
    required this.business_rental_aggregate,
    required this.$__typename,
  });

  factory Query$number_of_rentals_by_category.fromJson(
      Map<String, dynamic> json) {
    final l$business_rental_aggregate = json['business_rental_aggregate'];
    final l$$__typename = json['__typename'];
    return Query$number_of_rentals_by_category(
      business_rental_aggregate:
          Query$number_of_rentals_by_category$business_rental_aggregate
              .fromJson((l$business_rental_aggregate as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$number_of_rentals_by_category$business_rental_aggregate
      business_rental_aggregate;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$business_rental_aggregate = business_rental_aggregate;
    _resultData['business_rental_aggregate'] =
        l$business_rental_aggregate.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$business_rental_aggregate = business_rental_aggregate;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$business_rental_aggregate,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$number_of_rentals_by_category) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$business_rental_aggregate = business_rental_aggregate;
    final lOther$business_rental_aggregate = other.business_rental_aggregate;
    if (l$business_rental_aggregate != lOther$business_rental_aggregate) {
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

extension UtilityExtension$Query$number_of_rentals_by_category
    on Query$number_of_rentals_by_category {
  CopyWith$Query$number_of_rentals_by_category<
          Query$number_of_rentals_by_category>
      get copyWith => CopyWith$Query$number_of_rentals_by_category(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$number_of_rentals_by_category<TRes> {
  factory CopyWith$Query$number_of_rentals_by_category(
    Query$number_of_rentals_by_category instance,
    TRes Function(Query$number_of_rentals_by_category) then,
  ) = _CopyWithImpl$Query$number_of_rentals_by_category;

  factory CopyWith$Query$number_of_rentals_by_category.stub(TRes res) =
      _CopyWithStubImpl$Query$number_of_rentals_by_category;

  TRes call({
    Query$number_of_rentals_by_category$business_rental_aggregate?
        business_rental_aggregate,
    String? $__typename,
  });
  CopyWith$Query$number_of_rentals_by_category$business_rental_aggregate<TRes>
      get business_rental_aggregate;
}

class _CopyWithImpl$Query$number_of_rentals_by_category<TRes>
    implements CopyWith$Query$number_of_rentals_by_category<TRes> {
  _CopyWithImpl$Query$number_of_rentals_by_category(
    this._instance,
    this._then,
  );

  final Query$number_of_rentals_by_category _instance;

  final TRes Function(Query$number_of_rentals_by_category) _then;

  static const _undefined = {};

  TRes call({
    Object? business_rental_aggregate = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$number_of_rentals_by_category(
        business_rental_aggregate: business_rental_aggregate == _undefined ||
                business_rental_aggregate == null
            ? _instance.business_rental_aggregate
            : (business_rental_aggregate
                as Query$number_of_rentals_by_category$business_rental_aggregate),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$number_of_rentals_by_category$business_rental_aggregate<TRes>
      get business_rental_aggregate {
    final local$business_rental_aggregate = _instance.business_rental_aggregate;
    return CopyWith$Query$number_of_rentals_by_category$business_rental_aggregate(
        local$business_rental_aggregate,
        (e) => call(business_rental_aggregate: e));
  }
}

class _CopyWithStubImpl$Query$number_of_rentals_by_category<TRes>
    implements CopyWith$Query$number_of_rentals_by_category<TRes> {
  _CopyWithStubImpl$Query$number_of_rentals_by_category(this._res);

  TRes _res;

  call({
    Query$number_of_rentals_by_category$business_rental_aggregate?
        business_rental_aggregate,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$number_of_rentals_by_category$business_rental_aggregate<TRes>
      get business_rental_aggregate =>
          CopyWith$Query$number_of_rentals_by_category$business_rental_aggregate
              .stub(_res);
}

const documentNodeQuerynumber_of_rentals_by_category =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'number_of_rentals_by_category'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'distance')),
        type: NamedTypeNode(
          name: NameNode(value: 'Float'),
          isNonNull: true,
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
        variable: VariableNode(name: NameNode(value: 'category1')),
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
        name: NameNode(value: 'business_rental_aggregate'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
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
                                        name: NameNode(value: 'distance')),
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
                      ),
                      ObjectFieldNode(
                        name: NameNode(value: 'approved'),
                        value: ObjectValueNode(fields: [
                          ObjectFieldNode(
                            name: NameNode(value: '_eq'),
                            value: BooleanValueNode(value: true),
                          )
                        ]),
                      ),
                      ObjectFieldNode(
                        name: NameNode(value: 'open_status'),
                        value: ObjectValueNode(fields: [
                          ObjectFieldNode(
                            name: NameNode(value: '_neq'),
                            value: StringValueNode(
                              value: 'closedIndefinitely',
                              isBlock: false,
                            ),
                          )
                        ]),
                      ),
                    ]),
                  )
                ]),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'details'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: 'category1'),
                    value: ObjectValueNode(fields: [
                      ObjectFieldNode(
                        name: NameNode(value: '_eq'),
                        value: VariableNode(name: NameNode(value: 'category1')),
                      )
                    ]),
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
Query$number_of_rentals_by_category
    _parserFn$Query$number_of_rentals_by_category(Map<String, dynamic> data) =>
        Query$number_of_rentals_by_category.fromJson(data);

class Options$Query$number_of_rentals_by_category
    extends graphql.QueryOptions<Query$number_of_rentals_by_category> {
  Options$Query$number_of_rentals_by_category({
    String? operationName,
    required Variables$Query$number_of_rentals_by_category variables,
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
          document: documentNodeQuerynumber_of_rentals_by_category,
          parserFn: _parserFn$Query$number_of_rentals_by_category,
        );
}

class WatchOptions$Query$number_of_rentals_by_category
    extends graphql.WatchQueryOptions<Query$number_of_rentals_by_category> {
  WatchOptions$Query$number_of_rentals_by_category({
    String? operationName,
    required Variables$Query$number_of_rentals_by_category variables,
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
          document: documentNodeQuerynumber_of_rentals_by_category,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$number_of_rentals_by_category,
        );
}

class FetchMoreOptions$Query$number_of_rentals_by_category
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$number_of_rentals_by_category({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$number_of_rentals_by_category variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerynumber_of_rentals_by_category,
        );
}

extension ClientExtension$Query$number_of_rentals_by_category
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$number_of_rentals_by_category>>
      query$number_of_rentals_by_category(
              Options$Query$number_of_rentals_by_category options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$number_of_rentals_by_category>
      watchQuery$number_of_rentals_by_category(
              WatchOptions$Query$number_of_rentals_by_category options) =>
          this.watchQuery(options);
  void writeQuery$number_of_rentals_by_category({
    required Query$number_of_rentals_by_category data,
    required Variables$Query$number_of_rentals_by_category variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQuerynumber_of_rentals_by_category),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$number_of_rentals_by_category? readQuery$number_of_rentals_by_category({
    required Variables$Query$number_of_rentals_by_category variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQuerynumber_of_rentals_by_category),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$number_of_rentals_by_category.fromJson(result);
  }
}

class Query$number_of_rentals_by_category$business_rental_aggregate {
  Query$number_of_rentals_by_category$business_rental_aggregate({
    this.aggregate,
    required this.$__typename,
  });

  factory Query$number_of_rentals_by_category$business_rental_aggregate.fromJson(
      Map<String, dynamic> json) {
    final l$aggregate = json['aggregate'];
    final l$$__typename = json['__typename'];
    return Query$number_of_rentals_by_category$business_rental_aggregate(
      aggregate: l$aggregate == null
          ? null
          : Query$number_of_rentals_by_category$business_rental_aggregate$aggregate
              .fromJson((l$aggregate as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$number_of_rentals_by_category$business_rental_aggregate$aggregate?
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
            is Query$number_of_rentals_by_category$business_rental_aggregate) ||
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

extension UtilityExtension$Query$number_of_rentals_by_category$business_rental_aggregate
    on Query$number_of_rentals_by_category$business_rental_aggregate {
  CopyWith$Query$number_of_rentals_by_category$business_rental_aggregate<
          Query$number_of_rentals_by_category$business_rental_aggregate>
      get copyWith =>
          CopyWith$Query$number_of_rentals_by_category$business_rental_aggregate(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$number_of_rentals_by_category$business_rental_aggregate<
    TRes> {
  factory CopyWith$Query$number_of_rentals_by_category$business_rental_aggregate(
    Query$number_of_rentals_by_category$business_rental_aggregate instance,
    TRes Function(Query$number_of_rentals_by_category$business_rental_aggregate)
        then,
  ) = _CopyWithImpl$Query$number_of_rentals_by_category$business_rental_aggregate;

  factory CopyWith$Query$number_of_rentals_by_category$business_rental_aggregate.stub(
          TRes res) =
      _CopyWithStubImpl$Query$number_of_rentals_by_category$business_rental_aggregate;

  TRes call({
    Query$number_of_rentals_by_category$business_rental_aggregate$aggregate?
        aggregate,
    String? $__typename,
  });
  CopyWith$Query$number_of_rentals_by_category$business_rental_aggregate$aggregate<
      TRes> get aggregate;
}

class _CopyWithImpl$Query$number_of_rentals_by_category$business_rental_aggregate<
        TRes>
    implements
        CopyWith$Query$number_of_rentals_by_category$business_rental_aggregate<
            TRes> {
  _CopyWithImpl$Query$number_of_rentals_by_category$business_rental_aggregate(
    this._instance,
    this._then,
  );

  final Query$number_of_rentals_by_category$business_rental_aggregate _instance;

  final TRes Function(
      Query$number_of_rentals_by_category$business_rental_aggregate) _then;

  static const _undefined = {};

  TRes call({
    Object? aggregate = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$number_of_rentals_by_category$business_rental_aggregate(
        aggregate: aggregate == _undefined
            ? _instance.aggregate
            : (aggregate
                as Query$number_of_rentals_by_category$business_rental_aggregate$aggregate?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$number_of_rentals_by_category$business_rental_aggregate$aggregate<
      TRes> get aggregate {
    final local$aggregate = _instance.aggregate;
    return local$aggregate == null
        ? CopyWith$Query$number_of_rentals_by_category$business_rental_aggregate$aggregate
            .stub(_then(_instance))
        : CopyWith$Query$number_of_rentals_by_category$business_rental_aggregate$aggregate(
            local$aggregate, (e) => call(aggregate: e));
  }
}

class _CopyWithStubImpl$Query$number_of_rentals_by_category$business_rental_aggregate<
        TRes>
    implements
        CopyWith$Query$number_of_rentals_by_category$business_rental_aggregate<
            TRes> {
  _CopyWithStubImpl$Query$number_of_rentals_by_category$business_rental_aggregate(
      this._res);

  TRes _res;

  call({
    Query$number_of_rentals_by_category$business_rental_aggregate$aggregate?
        aggregate,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$number_of_rentals_by_category$business_rental_aggregate$aggregate<
          TRes>
      get aggregate =>
          CopyWith$Query$number_of_rentals_by_category$business_rental_aggregate$aggregate
              .stub(_res);
}

class Query$number_of_rentals_by_category$business_rental_aggregate$aggregate {
  Query$number_of_rentals_by_category$business_rental_aggregate$aggregate({
    required this.count,
    required this.$__typename,
  });

  factory Query$number_of_rentals_by_category$business_rental_aggregate$aggregate.fromJson(
      Map<String, dynamic> json) {
    final l$count = json['count'];
    final l$$__typename = json['__typename'];
    return Query$number_of_rentals_by_category$business_rental_aggregate$aggregate(
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
            is Query$number_of_rentals_by_category$business_rental_aggregate$aggregate) ||
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

extension UtilityExtension$Query$number_of_rentals_by_category$business_rental_aggregate$aggregate
    on Query$number_of_rentals_by_category$business_rental_aggregate$aggregate {
  CopyWith$Query$number_of_rentals_by_category$business_rental_aggregate$aggregate<
          Query$number_of_rentals_by_category$business_rental_aggregate$aggregate>
      get copyWith =>
          CopyWith$Query$number_of_rentals_by_category$business_rental_aggregate$aggregate(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$number_of_rentals_by_category$business_rental_aggregate$aggregate<
    TRes> {
  factory CopyWith$Query$number_of_rentals_by_category$business_rental_aggregate$aggregate(
    Query$number_of_rentals_by_category$business_rental_aggregate$aggregate
        instance,
    TRes Function(
            Query$number_of_rentals_by_category$business_rental_aggregate$aggregate)
        then,
  ) = _CopyWithImpl$Query$number_of_rentals_by_category$business_rental_aggregate$aggregate;

  factory CopyWith$Query$number_of_rentals_by_category$business_rental_aggregate$aggregate.stub(
          TRes res) =
      _CopyWithStubImpl$Query$number_of_rentals_by_category$business_rental_aggregate$aggregate;

  TRes call({
    int? count,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$number_of_rentals_by_category$business_rental_aggregate$aggregate<
        TRes>
    implements
        CopyWith$Query$number_of_rentals_by_category$business_rental_aggregate$aggregate<
            TRes> {
  _CopyWithImpl$Query$number_of_rentals_by_category$business_rental_aggregate$aggregate(
    this._instance,
    this._then,
  );

  final Query$number_of_rentals_by_category$business_rental_aggregate$aggregate
      _instance;

  final TRes Function(
          Query$number_of_rentals_by_category$business_rental_aggregate$aggregate)
      _then;

  static const _undefined = {};

  TRes call({
    Object? count = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$number_of_rentals_by_category$business_rental_aggregate$aggregate(
        count: count == _undefined || count == null
            ? _instance.count
            : (count as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$number_of_rentals_by_category$business_rental_aggregate$aggregate<
        TRes>
    implements
        CopyWith$Query$number_of_rentals_by_category$business_rental_aggregate$aggregate<
            TRes> {
  _CopyWithStubImpl$Query$number_of_rentals_by_category$business_rental_aggregate$aggregate(
      this._res);

  TRes _res;

  call({
    int? count,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$create_rental {
  factory Variables$Mutation$create_rental(
          {required Input$business_rental_insert_input object}) =>
      Variables$Mutation$create_rental._({
        r'object': object,
      });

  Variables$Mutation$create_rental._(this._$data);

  factory Variables$Mutation$create_rental.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$object = data['object'];
    result$data['object'] = Input$business_rental_insert_input.fromJson(
        (l$object as Map<String, dynamic>));
    return Variables$Mutation$create_rental._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$business_rental_insert_input get object =>
      (_$data['object'] as Input$business_rental_insert_input);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$object = object;
    result$data['object'] = l$object.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$create_rental<Variables$Mutation$create_rental>
      get copyWith => CopyWith$Variables$Mutation$create_rental(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$create_rental) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$object = object;
    final lOther$object = other.object;
    if (l$object != lOther$object) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$object = object;
    return Object.hashAll([l$object]);
  }
}

abstract class CopyWith$Variables$Mutation$create_rental<TRes> {
  factory CopyWith$Variables$Mutation$create_rental(
    Variables$Mutation$create_rental instance,
    TRes Function(Variables$Mutation$create_rental) then,
  ) = _CopyWithImpl$Variables$Mutation$create_rental;

  factory CopyWith$Variables$Mutation$create_rental.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$create_rental;

  TRes call({Input$business_rental_insert_input? object});
}

class _CopyWithImpl$Variables$Mutation$create_rental<TRes>
    implements CopyWith$Variables$Mutation$create_rental<TRes> {
  _CopyWithImpl$Variables$Mutation$create_rental(
    this._instance,
    this._then,
  );

  final Variables$Mutation$create_rental _instance;

  final TRes Function(Variables$Mutation$create_rental) _then;

  static const _undefined = {};

  TRes call({Object? object = _undefined}) =>
      _then(Variables$Mutation$create_rental._({
        ..._instance._$data,
        if (object != _undefined && object != null)
          'object': (object as Input$business_rental_insert_input),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$create_rental<TRes>
    implements CopyWith$Variables$Mutation$create_rental<TRes> {
  _CopyWithStubImpl$Variables$Mutation$create_rental(this._res);

  TRes _res;

  call({Input$business_rental_insert_input? object}) => _res;
}

class Mutation$create_rental {
  Mutation$create_rental({
    this.insert_business_rental_one,
    required this.$__typename,
  });

  factory Mutation$create_rental.fromJson(Map<String, dynamic> json) {
    final l$insert_business_rental_one = json['insert_business_rental_one'];
    final l$$__typename = json['__typename'];
    return Mutation$create_rental(
      insert_business_rental_one: l$insert_business_rental_one == null
          ? null
          : Mutation$create_rental$insert_business_rental_one.fromJson(
              (l$insert_business_rental_one as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$create_rental$insert_business_rental_one?
      insert_business_rental_one;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$insert_business_rental_one = insert_business_rental_one;
    _resultData['insert_business_rental_one'] =
        l$insert_business_rental_one?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$insert_business_rental_one = insert_business_rental_one;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$insert_business_rental_one,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$create_rental) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$insert_business_rental_one = insert_business_rental_one;
    final lOther$insert_business_rental_one = other.insert_business_rental_one;
    if (l$insert_business_rental_one != lOther$insert_business_rental_one) {
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

extension UtilityExtension$Mutation$create_rental on Mutation$create_rental {
  CopyWith$Mutation$create_rental<Mutation$create_rental> get copyWith =>
      CopyWith$Mutation$create_rental(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$create_rental<TRes> {
  factory CopyWith$Mutation$create_rental(
    Mutation$create_rental instance,
    TRes Function(Mutation$create_rental) then,
  ) = _CopyWithImpl$Mutation$create_rental;

  factory CopyWith$Mutation$create_rental.stub(TRes res) =
      _CopyWithStubImpl$Mutation$create_rental;

  TRes call({
    Mutation$create_rental$insert_business_rental_one?
        insert_business_rental_one,
    String? $__typename,
  });
  CopyWith$Mutation$create_rental$insert_business_rental_one<TRes>
      get insert_business_rental_one;
}

class _CopyWithImpl$Mutation$create_rental<TRes>
    implements CopyWith$Mutation$create_rental<TRes> {
  _CopyWithImpl$Mutation$create_rental(
    this._instance,
    this._then,
  );

  final Mutation$create_rental _instance;

  final TRes Function(Mutation$create_rental) _then;

  static const _undefined = {};

  TRes call({
    Object? insert_business_rental_one = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$create_rental(
        insert_business_rental_one: insert_business_rental_one == _undefined
            ? _instance.insert_business_rental_one
            : (insert_business_rental_one
                as Mutation$create_rental$insert_business_rental_one?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$create_rental$insert_business_rental_one<TRes>
      get insert_business_rental_one {
    final local$insert_business_rental_one =
        _instance.insert_business_rental_one;
    return local$insert_business_rental_one == null
        ? CopyWith$Mutation$create_rental$insert_business_rental_one.stub(
            _then(_instance))
        : CopyWith$Mutation$create_rental$insert_business_rental_one(
            local$insert_business_rental_one,
            (e) => call(insert_business_rental_one: e));
  }
}

class _CopyWithStubImpl$Mutation$create_rental<TRes>
    implements CopyWith$Mutation$create_rental<TRes> {
  _CopyWithStubImpl$Mutation$create_rental(this._res);

  TRes _res;

  call({
    Mutation$create_rental$insert_business_rental_one?
        insert_business_rental_one,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$create_rental$insert_business_rental_one<TRes>
      get insert_business_rental_one =>
          CopyWith$Mutation$create_rental$insert_business_rental_one.stub(_res);
}

const documentNodeMutationcreate_rental = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'create_rental'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'object')),
        type: NamedTypeNode(
          name: NameNode(value: 'business_rental_insert_input'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'insert_business_rental_one'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'object'),
            value: VariableNode(name: NameNode(value: 'object')),
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
            name: NameNode(value: 'details_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'business_id'),
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
Mutation$create_rental _parserFn$Mutation$create_rental(
        Map<String, dynamic> data) =>
    Mutation$create_rental.fromJson(data);
typedef OnMutationCompleted$Mutation$create_rental = FutureOr<void> Function(
  dynamic,
  Mutation$create_rental?,
);

class Options$Mutation$create_rental
    extends graphql.MutationOptions<Mutation$create_rental> {
  Options$Mutation$create_rental({
    String? operationName,
    required Variables$Mutation$create_rental variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$create_rental? onCompleted,
    graphql.OnMutationUpdate<Mutation$create_rental>? update,
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
                        : _parserFn$Mutation$create_rental(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationcreate_rental,
          parserFn: _parserFn$Mutation$create_rental,
        );

  final OnMutationCompleted$Mutation$create_rental? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$create_rental
    extends graphql.WatchQueryOptions<Mutation$create_rental> {
  WatchOptions$Mutation$create_rental({
    String? operationName,
    required Variables$Mutation$create_rental variables,
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
          document: documentNodeMutationcreate_rental,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$create_rental,
        );
}

extension ClientExtension$Mutation$create_rental on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$create_rental>> mutate$create_rental(
          Options$Mutation$create_rental options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$create_rental> watchMutation$create_rental(
          WatchOptions$Mutation$create_rental options) =>
      this.watchMutation(options);
}

class Mutation$create_rental$insert_business_rental_one {
  Mutation$create_rental$insert_business_rental_one({
    required this.id,
    required this.details_id,
    required this.business_id,
    required this.$__typename,
  });

  factory Mutation$create_rental$insert_business_rental_one.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$details_id = json['details_id'];
    final l$business_id = json['business_id'];
    final l$$__typename = json['__typename'];
    return Mutation$create_rental$insert_business_rental_one(
      id: (l$id as int),
      details_id: (l$details_id as int),
      business_id: (l$business_id as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final int details_id;

  final int business_id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$details_id = details_id;
    _resultData['details_id'] = l$details_id;
    final l$business_id = business_id;
    _resultData['business_id'] = l$business_id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$details_id = details_id;
    final l$business_id = business_id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$details_id,
      l$business_id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$create_rental$insert_business_rental_one) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$details_id = details_id;
    final lOther$details_id = other.details_id;
    if (l$details_id != lOther$details_id) {
      return false;
    }
    final l$business_id = business_id;
    final lOther$business_id = other.business_id;
    if (l$business_id != lOther$business_id) {
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

extension UtilityExtension$Mutation$create_rental$insert_business_rental_one
    on Mutation$create_rental$insert_business_rental_one {
  CopyWith$Mutation$create_rental$insert_business_rental_one<
          Mutation$create_rental$insert_business_rental_one>
      get copyWith =>
          CopyWith$Mutation$create_rental$insert_business_rental_one(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$create_rental$insert_business_rental_one<
    TRes> {
  factory CopyWith$Mutation$create_rental$insert_business_rental_one(
    Mutation$create_rental$insert_business_rental_one instance,
    TRes Function(Mutation$create_rental$insert_business_rental_one) then,
  ) = _CopyWithImpl$Mutation$create_rental$insert_business_rental_one;

  factory CopyWith$Mutation$create_rental$insert_business_rental_one.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$create_rental$insert_business_rental_one;

  TRes call({
    int? id,
    int? details_id,
    int? business_id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$create_rental$insert_business_rental_one<TRes>
    implements
        CopyWith$Mutation$create_rental$insert_business_rental_one<TRes> {
  _CopyWithImpl$Mutation$create_rental$insert_business_rental_one(
    this._instance,
    this._then,
  );

  final Mutation$create_rental$insert_business_rental_one _instance;

  final TRes Function(Mutation$create_rental$insert_business_rental_one) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? details_id = _undefined,
    Object? business_id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$create_rental$insert_business_rental_one(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        details_id: details_id == _undefined || details_id == null
            ? _instance.details_id
            : (details_id as int),
        business_id: business_id == _undefined || business_id == null
            ? _instance.business_id
            : (business_id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$create_rental$insert_business_rental_one<TRes>
    implements
        CopyWith$Mutation$create_rental$insert_business_rental_one<TRes> {
  _CopyWithStubImpl$Mutation$create_rental$insert_business_rental_one(
      this._res);

  TRes _res;

  call({
    int? id,
    int? details_id,
    int? business_id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$add_home_rental {
  factory Variables$Mutation$add_home_rental(
          {required Input$business_home_rental_insert_input object}) =>
      Variables$Mutation$add_home_rental._({
        r'object': object,
      });

  Variables$Mutation$add_home_rental._(this._$data);

  factory Variables$Mutation$add_home_rental.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$object = data['object'];
    result$data['object'] = Input$business_home_rental_insert_input.fromJson(
        (l$object as Map<String, dynamic>));
    return Variables$Mutation$add_home_rental._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$business_home_rental_insert_input get object =>
      (_$data['object'] as Input$business_home_rental_insert_input);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$object = object;
    result$data['object'] = l$object.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$add_home_rental<
          Variables$Mutation$add_home_rental>
      get copyWith => CopyWith$Variables$Mutation$add_home_rental(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$add_home_rental) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$object = object;
    final lOther$object = other.object;
    if (l$object != lOther$object) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$object = object;
    return Object.hashAll([l$object]);
  }
}

abstract class CopyWith$Variables$Mutation$add_home_rental<TRes> {
  factory CopyWith$Variables$Mutation$add_home_rental(
    Variables$Mutation$add_home_rental instance,
    TRes Function(Variables$Mutation$add_home_rental) then,
  ) = _CopyWithImpl$Variables$Mutation$add_home_rental;

  factory CopyWith$Variables$Mutation$add_home_rental.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$add_home_rental;

  TRes call({Input$business_home_rental_insert_input? object});
}

class _CopyWithImpl$Variables$Mutation$add_home_rental<TRes>
    implements CopyWith$Variables$Mutation$add_home_rental<TRes> {
  _CopyWithImpl$Variables$Mutation$add_home_rental(
    this._instance,
    this._then,
  );

  final Variables$Mutation$add_home_rental _instance;

  final TRes Function(Variables$Mutation$add_home_rental) _then;

  static const _undefined = {};

  TRes call({Object? object = _undefined}) =>
      _then(Variables$Mutation$add_home_rental._({
        ..._instance._$data,
        if (object != _undefined && object != null)
          'object': (object as Input$business_home_rental_insert_input),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$add_home_rental<TRes>
    implements CopyWith$Variables$Mutation$add_home_rental<TRes> {
  _CopyWithStubImpl$Variables$Mutation$add_home_rental(this._res);

  TRes _res;

  call({Input$business_home_rental_insert_input? object}) => _res;
}

class Mutation$add_home_rental {
  Mutation$add_home_rental({
    this.insert_business_home_rental_one,
    required this.$__typename,
  });

  factory Mutation$add_home_rental.fromJson(Map<String, dynamic> json) {
    final l$insert_business_home_rental_one =
        json['insert_business_home_rental_one'];
    final l$$__typename = json['__typename'];
    return Mutation$add_home_rental(
      insert_business_home_rental_one: l$insert_business_home_rental_one == null
          ? null
          : Mutation$add_home_rental$insert_business_home_rental_one.fromJson(
              (l$insert_business_home_rental_one as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$add_home_rental$insert_business_home_rental_one?
      insert_business_home_rental_one;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$insert_business_home_rental_one = insert_business_home_rental_one;
    _resultData['insert_business_home_rental_one'] =
        l$insert_business_home_rental_one?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$insert_business_home_rental_one = insert_business_home_rental_one;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$insert_business_home_rental_one,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$add_home_rental) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$insert_business_home_rental_one = insert_business_home_rental_one;
    final lOther$insert_business_home_rental_one =
        other.insert_business_home_rental_one;
    if (l$insert_business_home_rental_one !=
        lOther$insert_business_home_rental_one) {
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

extension UtilityExtension$Mutation$add_home_rental
    on Mutation$add_home_rental {
  CopyWith$Mutation$add_home_rental<Mutation$add_home_rental> get copyWith =>
      CopyWith$Mutation$add_home_rental(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$add_home_rental<TRes> {
  factory CopyWith$Mutation$add_home_rental(
    Mutation$add_home_rental instance,
    TRes Function(Mutation$add_home_rental) then,
  ) = _CopyWithImpl$Mutation$add_home_rental;

  factory CopyWith$Mutation$add_home_rental.stub(TRes res) =
      _CopyWithStubImpl$Mutation$add_home_rental;

  TRes call({
    Mutation$add_home_rental$insert_business_home_rental_one?
        insert_business_home_rental_one,
    String? $__typename,
  });
  CopyWith$Mutation$add_home_rental$insert_business_home_rental_one<TRes>
      get insert_business_home_rental_one;
}

class _CopyWithImpl$Mutation$add_home_rental<TRes>
    implements CopyWith$Mutation$add_home_rental<TRes> {
  _CopyWithImpl$Mutation$add_home_rental(
    this._instance,
    this._then,
  );

  final Mutation$add_home_rental _instance;

  final TRes Function(Mutation$add_home_rental) _then;

  static const _undefined = {};

  TRes call({
    Object? insert_business_home_rental_one = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$add_home_rental(
        insert_business_home_rental_one: insert_business_home_rental_one ==
                _undefined
            ? _instance.insert_business_home_rental_one
            : (insert_business_home_rental_one
                as Mutation$add_home_rental$insert_business_home_rental_one?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$add_home_rental$insert_business_home_rental_one<TRes>
      get insert_business_home_rental_one {
    final local$insert_business_home_rental_one =
        _instance.insert_business_home_rental_one;
    return local$insert_business_home_rental_one == null
        ? CopyWith$Mutation$add_home_rental$insert_business_home_rental_one
            .stub(_then(_instance))
        : CopyWith$Mutation$add_home_rental$insert_business_home_rental_one(
            local$insert_business_home_rental_one,
            (e) => call(insert_business_home_rental_one: e));
  }
}

class _CopyWithStubImpl$Mutation$add_home_rental<TRes>
    implements CopyWith$Mutation$add_home_rental<TRes> {
  _CopyWithStubImpl$Mutation$add_home_rental(this._res);

  TRes _res;

  call({
    Mutation$add_home_rental$insert_business_home_rental_one?
        insert_business_home_rental_one,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$add_home_rental$insert_business_home_rental_one<TRes>
      get insert_business_home_rental_one =>
          CopyWith$Mutation$add_home_rental$insert_business_home_rental_one
              .stub(_res);
}

const documentNodeMutationadd_home_rental = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'add_home_rental'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'object')),
        type: NamedTypeNode(
          name: NameNode(value: 'business_home_rental_insert_input'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'insert_business_home_rental_one'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'object'),
            value: VariableNode(name: NameNode(value: 'object')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'rental_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'rental'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'details_id'),
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
Mutation$add_home_rental _parserFn$Mutation$add_home_rental(
        Map<String, dynamic> data) =>
    Mutation$add_home_rental.fromJson(data);
typedef OnMutationCompleted$Mutation$add_home_rental = FutureOr<void> Function(
  dynamic,
  Mutation$add_home_rental?,
);

class Options$Mutation$add_home_rental
    extends graphql.MutationOptions<Mutation$add_home_rental> {
  Options$Mutation$add_home_rental({
    String? operationName,
    required Variables$Mutation$add_home_rental variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$add_home_rental? onCompleted,
    graphql.OnMutationUpdate<Mutation$add_home_rental>? update,
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
                        : _parserFn$Mutation$add_home_rental(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationadd_home_rental,
          parserFn: _parserFn$Mutation$add_home_rental,
        );

  final OnMutationCompleted$Mutation$add_home_rental? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$add_home_rental
    extends graphql.WatchQueryOptions<Mutation$add_home_rental> {
  WatchOptions$Mutation$add_home_rental({
    String? operationName,
    required Variables$Mutation$add_home_rental variables,
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
          document: documentNodeMutationadd_home_rental,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$add_home_rental,
        );
}

extension ClientExtension$Mutation$add_home_rental on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$add_home_rental>> mutate$add_home_rental(
          Options$Mutation$add_home_rental options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$add_home_rental>
      watchMutation$add_home_rental(
              WatchOptions$Mutation$add_home_rental options) =>
          this.watchMutation(options);
}

class Mutation$add_home_rental$insert_business_home_rental_one {
  Mutation$add_home_rental$insert_business_home_rental_one({
    required this.rental_id,
    required this.rental,
    required this.$__typename,
  });

  factory Mutation$add_home_rental$insert_business_home_rental_one.fromJson(
      Map<String, dynamic> json) {
    final l$rental_id = json['rental_id'];
    final l$rental = json['rental'];
    final l$$__typename = json['__typename'];
    return Mutation$add_home_rental$insert_business_home_rental_one(
      rental_id: (l$rental_id as int),
      rental: Mutation$add_home_rental$insert_business_home_rental_one$rental
          .fromJson((l$rental as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int rental_id;

  final Mutation$add_home_rental$insert_business_home_rental_one$rental rental;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$rental_id = rental_id;
    _resultData['rental_id'] = l$rental_id;
    final l$rental = rental;
    _resultData['rental'] = l$rental.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$rental_id = rental_id;
    final l$rental = rental;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$rental_id,
      l$rental,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$add_home_rental$insert_business_home_rental_one) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$rental_id = rental_id;
    final lOther$rental_id = other.rental_id;
    if (l$rental_id != lOther$rental_id) {
      return false;
    }
    final l$rental = rental;
    final lOther$rental = other.rental;
    if (l$rental != lOther$rental) {
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

extension UtilityExtension$Mutation$add_home_rental$insert_business_home_rental_one
    on Mutation$add_home_rental$insert_business_home_rental_one {
  CopyWith$Mutation$add_home_rental$insert_business_home_rental_one<
          Mutation$add_home_rental$insert_business_home_rental_one>
      get copyWith =>
          CopyWith$Mutation$add_home_rental$insert_business_home_rental_one(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$add_home_rental$insert_business_home_rental_one<
    TRes> {
  factory CopyWith$Mutation$add_home_rental$insert_business_home_rental_one(
    Mutation$add_home_rental$insert_business_home_rental_one instance,
    TRes Function(Mutation$add_home_rental$insert_business_home_rental_one)
        then,
  ) = _CopyWithImpl$Mutation$add_home_rental$insert_business_home_rental_one;

  factory CopyWith$Mutation$add_home_rental$insert_business_home_rental_one.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$add_home_rental$insert_business_home_rental_one;

  TRes call({
    int? rental_id,
    Mutation$add_home_rental$insert_business_home_rental_one$rental? rental,
    String? $__typename,
  });
  CopyWith$Mutation$add_home_rental$insert_business_home_rental_one$rental<TRes>
      get rental;
}

class _CopyWithImpl$Mutation$add_home_rental$insert_business_home_rental_one<
        TRes>
    implements
        CopyWith$Mutation$add_home_rental$insert_business_home_rental_one<
            TRes> {
  _CopyWithImpl$Mutation$add_home_rental$insert_business_home_rental_one(
    this._instance,
    this._then,
  );

  final Mutation$add_home_rental$insert_business_home_rental_one _instance;

  final TRes Function(Mutation$add_home_rental$insert_business_home_rental_one)
      _then;

  static const _undefined = {};

  TRes call({
    Object? rental_id = _undefined,
    Object? rental = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$add_home_rental$insert_business_home_rental_one(
        rental_id: rental_id == _undefined || rental_id == null
            ? _instance.rental_id
            : (rental_id as int),
        rental: rental == _undefined || rental == null
            ? _instance.rental
            : (rental
                as Mutation$add_home_rental$insert_business_home_rental_one$rental),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$add_home_rental$insert_business_home_rental_one$rental<TRes>
      get rental {
    final local$rental = _instance.rental;
    return CopyWith$Mutation$add_home_rental$insert_business_home_rental_one$rental(
        local$rental, (e) => call(rental: e));
  }
}

class _CopyWithStubImpl$Mutation$add_home_rental$insert_business_home_rental_one<
        TRes>
    implements
        CopyWith$Mutation$add_home_rental$insert_business_home_rental_one<
            TRes> {
  _CopyWithStubImpl$Mutation$add_home_rental$insert_business_home_rental_one(
      this._res);

  TRes _res;

  call({
    int? rental_id,
    Mutation$add_home_rental$insert_business_home_rental_one$rental? rental,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$add_home_rental$insert_business_home_rental_one$rental<TRes>
      get rental =>
          CopyWith$Mutation$add_home_rental$insert_business_home_rental_one$rental
              .stub(_res);
}

class Mutation$add_home_rental$insert_business_home_rental_one$rental {
  Mutation$add_home_rental$insert_business_home_rental_one$rental({
    required this.details_id,
    required this.$__typename,
  });

  factory Mutation$add_home_rental$insert_business_home_rental_one$rental.fromJson(
      Map<String, dynamic> json) {
    final l$details_id = json['details_id'];
    final l$$__typename = json['__typename'];
    return Mutation$add_home_rental$insert_business_home_rental_one$rental(
      details_id: (l$details_id as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int details_id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$details_id = details_id;
    _resultData['details_id'] = l$details_id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$details_id = details_id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$details_id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Mutation$add_home_rental$insert_business_home_rental_one$rental) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$details_id = details_id;
    final lOther$details_id = other.details_id;
    if (l$details_id != lOther$details_id) {
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

extension UtilityExtension$Mutation$add_home_rental$insert_business_home_rental_one$rental
    on Mutation$add_home_rental$insert_business_home_rental_one$rental {
  CopyWith$Mutation$add_home_rental$insert_business_home_rental_one$rental<
          Mutation$add_home_rental$insert_business_home_rental_one$rental>
      get copyWith =>
          CopyWith$Mutation$add_home_rental$insert_business_home_rental_one$rental(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$add_home_rental$insert_business_home_rental_one$rental<
    TRes> {
  factory CopyWith$Mutation$add_home_rental$insert_business_home_rental_one$rental(
    Mutation$add_home_rental$insert_business_home_rental_one$rental instance,
    TRes Function(
            Mutation$add_home_rental$insert_business_home_rental_one$rental)
        then,
  ) = _CopyWithImpl$Mutation$add_home_rental$insert_business_home_rental_one$rental;

  factory CopyWith$Mutation$add_home_rental$insert_business_home_rental_one$rental.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$add_home_rental$insert_business_home_rental_one$rental;

  TRes call({
    int? details_id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$add_home_rental$insert_business_home_rental_one$rental<
        TRes>
    implements
        CopyWith$Mutation$add_home_rental$insert_business_home_rental_one$rental<
            TRes> {
  _CopyWithImpl$Mutation$add_home_rental$insert_business_home_rental_one$rental(
    this._instance,
    this._then,
  );

  final Mutation$add_home_rental$insert_business_home_rental_one$rental
      _instance;

  final TRes Function(
      Mutation$add_home_rental$insert_business_home_rental_one$rental) _then;

  static const _undefined = {};

  TRes call({
    Object? details_id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$add_home_rental$insert_business_home_rental_one$rental(
        details_id: details_id == _undefined || details_id == null
            ? _instance.details_id
            : (details_id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$add_home_rental$insert_business_home_rental_one$rental<
        TRes>
    implements
        CopyWith$Mutation$add_home_rental$insert_business_home_rental_one$rental<
            TRes> {
  _CopyWithStubImpl$Mutation$add_home_rental$insert_business_home_rental_one$rental(
      this._res);

  TRes _res;

  call({
    int? details_id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$update_home_rental_by_id {
  factory Variables$Mutation$update_home_rental_by_id({
    required int id,
    Input$business_home_rental_set_input? object,
  }) =>
      Variables$Mutation$update_home_rental_by_id._({
        r'id': id,
        if (object != null) r'object': object,
      });

  Variables$Mutation$update_home_rental_by_id._(this._$data);

  factory Variables$Mutation$update_home_rental_by_id.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as int);
    if (data.containsKey('object')) {
      final l$object = data['object'];
      result$data['object'] = l$object == null
          ? null
          : Input$business_home_rental_set_input.fromJson(
              (l$object as Map<String, dynamic>));
    }
    return Variables$Mutation$update_home_rental_by_id._(result$data);
  }

  Map<String, dynamic> _$data;

  int get id => (_$data['id'] as int);
  Input$business_home_rental_set_input? get object =>
      (_$data['object'] as Input$business_home_rental_set_input?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    if (_$data.containsKey('object')) {
      final l$object = object;
      result$data['object'] = l$object?.toJson();
    }
    return result$data;
  }

  CopyWith$Variables$Mutation$update_home_rental_by_id<
          Variables$Mutation$update_home_rental_by_id>
      get copyWith => CopyWith$Variables$Mutation$update_home_rental_by_id(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$update_home_rental_by_id) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$object = object;
    final lOther$object = other.object;
    if (_$data.containsKey('object') != other._$data.containsKey('object')) {
      return false;
    }
    if (l$object != lOther$object) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$object = object;
    return Object.hashAll([
      l$id,
      _$data.containsKey('object') ? l$object : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$update_home_rental_by_id<TRes> {
  factory CopyWith$Variables$Mutation$update_home_rental_by_id(
    Variables$Mutation$update_home_rental_by_id instance,
    TRes Function(Variables$Mutation$update_home_rental_by_id) then,
  ) = _CopyWithImpl$Variables$Mutation$update_home_rental_by_id;

  factory CopyWith$Variables$Mutation$update_home_rental_by_id.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$update_home_rental_by_id;

  TRes call({
    int? id,
    Input$business_home_rental_set_input? object,
  });
}

class _CopyWithImpl$Variables$Mutation$update_home_rental_by_id<TRes>
    implements CopyWith$Variables$Mutation$update_home_rental_by_id<TRes> {
  _CopyWithImpl$Variables$Mutation$update_home_rental_by_id(
    this._instance,
    this._then,
  );

  final Variables$Mutation$update_home_rental_by_id _instance;

  final TRes Function(Variables$Mutation$update_home_rental_by_id) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? object = _undefined,
  }) =>
      _then(Variables$Mutation$update_home_rental_by_id._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as int),
        if (object != _undefined)
          'object': (object as Input$business_home_rental_set_input?),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$update_home_rental_by_id<TRes>
    implements CopyWith$Variables$Mutation$update_home_rental_by_id<TRes> {
  _CopyWithStubImpl$Variables$Mutation$update_home_rental_by_id(this._res);

  TRes _res;

  call({
    int? id,
    Input$business_home_rental_set_input? object,
  }) =>
      _res;
}

class Mutation$update_home_rental_by_id {
  Mutation$update_home_rental_by_id({
    this.update_business_home_rental_by_pk,
    required this.$__typename,
  });

  factory Mutation$update_home_rental_by_id.fromJson(
      Map<String, dynamic> json) {
    final l$update_business_home_rental_by_pk =
        json['update_business_home_rental_by_pk'];
    final l$$__typename = json['__typename'];
    return Mutation$update_home_rental_by_id(
      update_business_home_rental_by_pk: l$update_business_home_rental_by_pk ==
              null
          ? null
          : Mutation$update_home_rental_by_id$update_business_home_rental_by_pk
              .fromJson((l$update_business_home_rental_by_pk
                  as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$update_home_rental_by_id$update_business_home_rental_by_pk?
      update_business_home_rental_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$update_business_home_rental_by_pk =
        update_business_home_rental_by_pk;
    _resultData['update_business_home_rental_by_pk'] =
        l$update_business_home_rental_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$update_business_home_rental_by_pk =
        update_business_home_rental_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$update_business_home_rental_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$update_home_rental_by_id) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$update_business_home_rental_by_pk =
        update_business_home_rental_by_pk;
    final lOther$update_business_home_rental_by_pk =
        other.update_business_home_rental_by_pk;
    if (l$update_business_home_rental_by_pk !=
        lOther$update_business_home_rental_by_pk) {
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

extension UtilityExtension$Mutation$update_home_rental_by_id
    on Mutation$update_home_rental_by_id {
  CopyWith$Mutation$update_home_rental_by_id<Mutation$update_home_rental_by_id>
      get copyWith => CopyWith$Mutation$update_home_rental_by_id(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$update_home_rental_by_id<TRes> {
  factory CopyWith$Mutation$update_home_rental_by_id(
    Mutation$update_home_rental_by_id instance,
    TRes Function(Mutation$update_home_rental_by_id) then,
  ) = _CopyWithImpl$Mutation$update_home_rental_by_id;

  factory CopyWith$Mutation$update_home_rental_by_id.stub(TRes res) =
      _CopyWithStubImpl$Mutation$update_home_rental_by_id;

  TRes call({
    Mutation$update_home_rental_by_id$update_business_home_rental_by_pk?
        update_business_home_rental_by_pk,
    String? $__typename,
  });
  CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk<
      TRes> get update_business_home_rental_by_pk;
}

class _CopyWithImpl$Mutation$update_home_rental_by_id<TRes>
    implements CopyWith$Mutation$update_home_rental_by_id<TRes> {
  _CopyWithImpl$Mutation$update_home_rental_by_id(
    this._instance,
    this._then,
  );

  final Mutation$update_home_rental_by_id _instance;

  final TRes Function(Mutation$update_home_rental_by_id) _then;

  static const _undefined = {};

  TRes call({
    Object? update_business_home_rental_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$update_home_rental_by_id(
        update_business_home_rental_by_pk: update_business_home_rental_by_pk ==
                _undefined
            ? _instance.update_business_home_rental_by_pk
            : (update_business_home_rental_by_pk
                as Mutation$update_home_rental_by_id$update_business_home_rental_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk<
      TRes> get update_business_home_rental_by_pk {
    final local$update_business_home_rental_by_pk =
        _instance.update_business_home_rental_by_pk;
    return local$update_business_home_rental_by_pk == null
        ? CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk
            .stub(_then(_instance))
        : CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk(
            local$update_business_home_rental_by_pk,
            (e) => call(update_business_home_rental_by_pk: e));
  }
}

class _CopyWithStubImpl$Mutation$update_home_rental_by_id<TRes>
    implements CopyWith$Mutation$update_home_rental_by_id<TRes> {
  _CopyWithStubImpl$Mutation$update_home_rental_by_id(this._res);

  TRes _res;

  call({
    Mutation$update_home_rental_by_id$update_business_home_rental_by_pk?
        update_business_home_rental_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk<
          TRes>
      get update_business_home_rental_by_pk =>
          CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk
              .stub(_res);
}

const documentNodeMutationupdate_home_rental_by_id = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'update_home_rental_by_id'),
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
        variable: VariableNode(name: NameNode(value: 'object')),
        type: NamedTypeNode(
          name: NameNode(value: 'business_home_rental_set_input'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'update_business_home_rental_by_pk'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'pk_columns'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'rental_id'),
                value: VariableNode(name: NameNode(value: 'id')),
              )
            ]),
          ),
          ArgumentNode(
            name: NameNode(value: '_set'),
            value: VariableNode(name: NameNode(value: 'object')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'bathrooms'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'bedrooms'),
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
            name: NameNode(value: 'home_type'),
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
            name: NameNode(value: 'rental'),
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
                name: NameNode(value: 'category3'),
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
                    name: NameNode(value: 'name_id'),
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
                    name: NameNode(value: 'tags'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
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
                    name: NameNode(value: 'category2'),
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
Mutation$update_home_rental_by_id _parserFn$Mutation$update_home_rental_by_id(
        Map<String, dynamic> data) =>
    Mutation$update_home_rental_by_id.fromJson(data);
typedef OnMutationCompleted$Mutation$update_home_rental_by_id = FutureOr<void>
    Function(
  dynamic,
  Mutation$update_home_rental_by_id?,
);

class Options$Mutation$update_home_rental_by_id
    extends graphql.MutationOptions<Mutation$update_home_rental_by_id> {
  Options$Mutation$update_home_rental_by_id({
    String? operationName,
    required Variables$Mutation$update_home_rental_by_id variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$update_home_rental_by_id? onCompleted,
    graphql.OnMutationUpdate<Mutation$update_home_rental_by_id>? update,
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
                        : _parserFn$Mutation$update_home_rental_by_id(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationupdate_home_rental_by_id,
          parserFn: _parserFn$Mutation$update_home_rental_by_id,
        );

  final OnMutationCompleted$Mutation$update_home_rental_by_id?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$update_home_rental_by_id
    extends graphql.WatchQueryOptions<Mutation$update_home_rental_by_id> {
  WatchOptions$Mutation$update_home_rental_by_id({
    String? operationName,
    required Variables$Mutation$update_home_rental_by_id variables,
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
          document: documentNodeMutationupdate_home_rental_by_id,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$update_home_rental_by_id,
        );
}

extension ClientExtension$Mutation$update_home_rental_by_id
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$update_home_rental_by_id>>
      mutate$update_home_rental_by_id(
              Options$Mutation$update_home_rental_by_id options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$update_home_rental_by_id>
      watchMutation$update_home_rental_by_id(
              WatchOptions$Mutation$update_home_rental_by_id options) =>
          this.watchMutation(options);
}

class Mutation$update_home_rental_by_id$update_business_home_rental_by_pk {
  Mutation$update_home_rental_by_id$update_business_home_rental_by_pk({
    required this.bathrooms,
    required this.bedrooms,
    required this.gps_location,
    required this.home_type,
    required this.address,
    required this.rental,
    required this.$__typename,
  });

  factory Mutation$update_home_rental_by_id$update_business_home_rental_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$bathrooms = json['bathrooms'];
    final l$bedrooms = json['bedrooms'];
    final l$gps_location = json['gps_location'];
    final l$home_type = json['home_type'];
    final l$address = json['address'];
    final l$rental = json['rental'];
    final l$$__typename = json['__typename'];
    return Mutation$update_home_rental_by_id$update_business_home_rental_by_pk(
      bathrooms: (l$bathrooms as int),
      bedrooms: (l$bedrooms as int),
      gps_location: geographyFromJson(l$gps_location),
      home_type: (l$home_type as String),
      address: (l$address as String),
      rental:
          Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental
              .fromJson((l$rental as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int bathrooms;

  final int bedrooms;

  final Geography gps_location;

  final String home_type;

  final String address;

  final Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental
      rental;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$bathrooms = bathrooms;
    _resultData['bathrooms'] = l$bathrooms;
    final l$bedrooms = bedrooms;
    _resultData['bedrooms'] = l$bedrooms;
    final l$gps_location = gps_location;
    _resultData['gps_location'] = geographyToJson(l$gps_location);
    final l$home_type = home_type;
    _resultData['home_type'] = l$home_type;
    final l$address = address;
    _resultData['address'] = l$address;
    final l$rental = rental;
    _resultData['rental'] = l$rental.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$bathrooms = bathrooms;
    final l$bedrooms = bedrooms;
    final l$gps_location = gps_location;
    final l$home_type = home_type;
    final l$address = address;
    final l$rental = rental;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$bathrooms,
      l$bedrooms,
      l$gps_location,
      l$home_type,
      l$address,
      l$rental,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Mutation$update_home_rental_by_id$update_business_home_rental_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$bathrooms = bathrooms;
    final lOther$bathrooms = other.bathrooms;
    if (l$bathrooms != lOther$bathrooms) {
      return false;
    }
    final l$bedrooms = bedrooms;
    final lOther$bedrooms = other.bedrooms;
    if (l$bedrooms != lOther$bedrooms) {
      return false;
    }
    final l$gps_location = gps_location;
    final lOther$gps_location = other.gps_location;
    if (l$gps_location != lOther$gps_location) {
      return false;
    }
    final l$home_type = home_type;
    final lOther$home_type = other.home_type;
    if (l$home_type != lOther$home_type) {
      return false;
    }
    final l$address = address;
    final lOther$address = other.address;
    if (l$address != lOther$address) {
      return false;
    }
    final l$rental = rental;
    final lOther$rental = other.rental;
    if (l$rental != lOther$rental) {
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

extension UtilityExtension$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk
    on Mutation$update_home_rental_by_id$update_business_home_rental_by_pk {
  CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk<
          Mutation$update_home_rental_by_id$update_business_home_rental_by_pk>
      get copyWith =>
          CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk<
    TRes> {
  factory CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk(
    Mutation$update_home_rental_by_id$update_business_home_rental_by_pk
        instance,
    TRes Function(
            Mutation$update_home_rental_by_id$update_business_home_rental_by_pk)
        then,
  ) = _CopyWithImpl$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk;

  factory CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk;

  TRes call({
    int? bathrooms,
    int? bedrooms,
    Geography? gps_location,
    String? home_type,
    String? address,
    Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental?
        rental,
    String? $__typename,
  });
  CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental<
      TRes> get rental;
}

class _CopyWithImpl$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk<
        TRes>
    implements
        CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk<
            TRes> {
  _CopyWithImpl$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk(
    this._instance,
    this._then,
  );

  final Mutation$update_home_rental_by_id$update_business_home_rental_by_pk
      _instance;

  final TRes Function(
          Mutation$update_home_rental_by_id$update_business_home_rental_by_pk)
      _then;

  static const _undefined = {};

  TRes call({
    Object? bathrooms = _undefined,
    Object? bedrooms = _undefined,
    Object? gps_location = _undefined,
    Object? home_type = _undefined,
    Object? address = _undefined,
    Object? rental = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$update_home_rental_by_id$update_business_home_rental_by_pk(
        bathrooms: bathrooms == _undefined || bathrooms == null
            ? _instance.bathrooms
            : (bathrooms as int),
        bedrooms: bedrooms == _undefined || bedrooms == null
            ? _instance.bedrooms
            : (bedrooms as int),
        gps_location: gps_location == _undefined || gps_location == null
            ? _instance.gps_location
            : (gps_location as Geography),
        home_type: home_type == _undefined || home_type == null
            ? _instance.home_type
            : (home_type as String),
        address: address == _undefined || address == null
            ? _instance.address
            : (address as String),
        rental: rental == _undefined || rental == null
            ? _instance.rental
            : (rental
                as Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental<
      TRes> get rental {
    final local$rental = _instance.rental;
    return CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental(
        local$rental, (e) => call(rental: e));
  }
}

class _CopyWithStubImpl$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk<
        TRes>
    implements
        CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk<
            TRes> {
  _CopyWithStubImpl$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk(
      this._res);

  TRes _res;

  call({
    int? bathrooms,
    int? bedrooms,
    Geography? gps_location,
    String? home_type,
    String? address,
    Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental?
        rental,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental<
          TRes>
      get rental =>
          CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental
              .stub(_res);
}

class Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental {
  Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental({
    required this.id,
    required this.category3,
    required this.details,
    required this.business,
    required this.$__typename,
  });

  factory Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$category3 = json['category3'];
    final l$details = json['details'];
    final l$business = json['business'];
    final l$$__typename = json['__typename'];
    return Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental(
      id: (l$id as int),
      category3: (l$category3 as String),
      details:
          Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details
              .fromJson((l$details as Map<String, dynamic>)),
      business:
          Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$business
              .fromJson((l$business as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String category3;

  final Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details
      details;

  final Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$business
      business;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$category3 = category3;
    _resultData['category3'] = l$category3;
    final l$details = details;
    _resultData['details'] = l$details.toJson();
    final l$business = business;
    _resultData['business'] = l$business.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$category3 = category3;
    final l$details = details;
    final l$business = business;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$category3,
      l$details,
      l$business,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$category3 = category3;
    final lOther$category3 = other.category3;
    if (l$category3 != lOther$category3) {
      return false;
    }
    final l$details = details;
    final lOther$details = other.details;
    if (l$details != lOther$details) {
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

extension UtilityExtension$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental
    on Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental {
  CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental<
          Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental>
      get copyWith =>
          CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental<
    TRes> {
  factory CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental(
    Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental
        instance,
    TRes Function(
            Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental)
        then,
  ) = _CopyWithImpl$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental;

  factory CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental;

  TRes call({
    int? id,
    String? category3,
    Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details?
        details,
    Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$business?
        business,
    String? $__typename,
  });
  CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details<
      TRes> get details;
  CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$business<
      TRes> get business;
}

class _CopyWithImpl$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental<
        TRes>
    implements
        CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental<
            TRes> {
  _CopyWithImpl$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental(
    this._instance,
    this._then,
  );

  final Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental
      _instance;

  final TRes Function(
          Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? category3 = _undefined,
    Object? details = _undefined,
    Object? business = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        category3: category3 == _undefined || category3 == null
            ? _instance.category3
            : (category3 as String),
        details: details == _undefined || details == null
            ? _instance.details
            : (details
                as Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details),
        business: business == _undefined || business == null
            ? _instance.business
            : (business
                as Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$business),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details<
      TRes> get details {
    final local$details = _instance.details;
    return CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details(
        local$details, (e) => call(details: e));
  }

  CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$business<
      TRes> get business {
    final local$business = _instance.business;
    return CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$business(
        local$business, (e) => call(business: e));
  }
}

class _CopyWithStubImpl$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental<
        TRes>
    implements
        CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental<
            TRes> {
  _CopyWithStubImpl$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental(
      this._res);

  TRes _res;

  call({
    int? id,
    String? category3,
    Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details?
        details,
    Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$business?
        business,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details<
          TRes>
      get details =>
          CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details
              .stub(_res);
  CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$business<
          TRes>
      get business =>
          CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$business
              .stub(_res);
}

class Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details {
  Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details({
    required this.name_id,
    this.description_id,
    required this.id,
    required this.name,
    this.description,
    required this.tags,
    this.additional_parameters,
    required this.available,
    required this.category1,
    required this.category2,
    required this.cost,
    this.image,
    required this.position,
    required this.$__typename,
  });

  factory Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details.fromJson(
      Map<String, dynamic> json) {
    final l$name_id = json['name_id'];
    final l$description_id = json['description_id'];
    final l$id = json['id'];
    final l$name = json['name'];
    final l$description = json['description'];
    final l$tags = json['tags'];
    final l$additional_parameters = json['additional_parameters'];
    final l$available = json['available'];
    final l$category1 = json['category1'];
    final l$category2 = json['category2'];
    final l$cost = json['cost'];
    final l$image = json['image'];
    final l$position = json['position'];
    final l$$__typename = json['__typename'];
    return Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details(
      name_id: (l$name_id as int),
      description_id: (l$description_id as int?),
      id: (l$id as int),
      name:
          Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$name
              .fromJson((l$name as Map<String, dynamic>)),
      description: l$description == null
          ? null
          : Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$description
              .fromJson((l$description as Map<String, dynamic>)),
      tags: mapFromJson(l$tags),
      additional_parameters: l$additional_parameters == null
          ? null
          : mapFromJson(l$additional_parameters),
      available: (l$available as bool),
      category1: (l$category1 as String),
      category2: (l$category2 as String),
      cost: mapFromJson(l$cost),
      image: l$image == null ? null : mapFromJson(l$image),
      position: (l$position as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int name_id;

  final int? description_id;

  final int id;

  final Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$name
      name;

  final Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$description?
      description;

  final dynamic tags;

  final dynamic? additional_parameters;

  final bool available;

  final String category1;

  final String category2;

  final dynamic cost;

  final dynamic? image;

  final int position;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name_id = name_id;
    _resultData['name_id'] = l$name_id;
    final l$description_id = description_id;
    _resultData['description_id'] = l$description_id;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name.toJson();
    final l$description = description;
    _resultData['description'] = l$description?.toJson();
    final l$tags = tags;
    _resultData['tags'] = mapToJson(l$tags);
    final l$additional_parameters = additional_parameters;
    _resultData['additional_parameters'] = l$additional_parameters == null
        ? null
        : mapToJson(l$additional_parameters);
    final l$available = available;
    _resultData['available'] = l$available;
    final l$category1 = category1;
    _resultData['category1'] = l$category1;
    final l$category2 = category2;
    _resultData['category2'] = l$category2;
    final l$cost = cost;
    _resultData['cost'] = mapToJson(l$cost);
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
    final l$name_id = name_id;
    final l$description_id = description_id;
    final l$id = id;
    final l$name = name;
    final l$description = description;
    final l$tags = tags;
    final l$additional_parameters = additional_parameters;
    final l$available = available;
    final l$category1 = category1;
    final l$category2 = category2;
    final l$cost = cost;
    final l$image = image;
    final l$position = position;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$name_id,
      l$description_id,
      l$id,
      l$name,
      l$description,
      l$tags,
      l$additional_parameters,
      l$available,
      l$category1,
      l$category2,
      l$cost,
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
    if (!(other
            is Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name_id = name_id;
    final lOther$name_id = other.name_id;
    if (l$name_id != lOther$name_id) {
      return false;
    }
    final l$description_id = description_id;
    final lOther$description_id = other.description_id;
    if (l$description_id != lOther$description_id) {
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
    final l$tags = tags;
    final lOther$tags = other.tags;
    if (l$tags != lOther$tags) {
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
    final l$category2 = category2;
    final lOther$category2 = other.category2;
    if (l$category2 != lOther$category2) {
      return false;
    }
    final l$cost = cost;
    final lOther$cost = other.cost;
    if (l$cost != lOther$cost) {
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

extension UtilityExtension$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details
    on Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details {
  CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details<
          Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details>
      get copyWith =>
          CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details<
    TRes> {
  factory CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details(
    Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details
        instance,
    TRes Function(
            Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details)
        then,
  ) = _CopyWithImpl$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details;

  factory CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details;

  TRes call({
    int? name_id,
    int? description_id,
    int? id,
    Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$name?
        name,
    Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$description?
        description,
    dynamic? tags,
    dynamic? additional_parameters,
    bool? available,
    String? category1,
    String? category2,
    dynamic? cost,
    dynamic? image,
    int? position,
    String? $__typename,
  });
  CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$name<
      TRes> get name;
  CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$description<
      TRes> get description;
}

class _CopyWithImpl$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details<
        TRes>
    implements
        CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details<
            TRes> {
  _CopyWithImpl$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details(
    this._instance,
    this._then,
  );

  final Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details
      _instance;

  final TRes Function(
          Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? name_id = _undefined,
    Object? description_id = _undefined,
    Object? id = _undefined,
    Object? name = _undefined,
    Object? description = _undefined,
    Object? tags = _undefined,
    Object? additional_parameters = _undefined,
    Object? available = _undefined,
    Object? category1 = _undefined,
    Object? category2 = _undefined,
    Object? cost = _undefined,
    Object? image = _undefined,
    Object? position = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details(
        name_id: name_id == _undefined || name_id == null
            ? _instance.name_id
            : (name_id as int),
        description_id: description_id == _undefined
            ? _instance.description_id
            : (description_id as int?),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name
                as Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$name),
        description: description == _undefined
            ? _instance.description
            : (description
                as Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$description?),
        tags: tags == _undefined || tags == null
            ? _instance.tags
            : (tags as dynamic),
        additional_parameters: additional_parameters == _undefined
            ? _instance.additional_parameters
            : (additional_parameters as dynamic?),
        available: available == _undefined || available == null
            ? _instance.available
            : (available as bool),
        category1: category1 == _undefined || category1 == null
            ? _instance.category1
            : (category1 as String),
        category2: category2 == _undefined || category2 == null
            ? _instance.category2
            : (category2 as String),
        cost: cost == _undefined || cost == null
            ? _instance.cost
            : (cost as dynamic),
        image: image == _undefined ? _instance.image : (image as dynamic?),
        position: position == _undefined || position == null
            ? _instance.position
            : (position as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$name<
      TRes> get name {
    final local$name = _instance.name;
    return CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$name(
        local$name, (e) => call(name: e));
  }

  CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$description<
      TRes> get description {
    final local$description = _instance.description;
    return local$description == null
        ? CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$description
            .stub(_then(_instance))
        : CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$description(
            local$description, (e) => call(description: e));
  }
}

class _CopyWithStubImpl$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details<
        TRes>
    implements
        CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details<
            TRes> {
  _CopyWithStubImpl$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details(
      this._res);

  TRes _res;

  call({
    int? name_id,
    int? description_id,
    int? id,
    Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$name?
        name,
    Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$description?
        description,
    dynamic? tags,
    dynamic? additional_parameters,
    bool? available,
    String? category1,
    String? category2,
    dynamic? cost,
    dynamic? image,
    int? position,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$name<
          TRes>
      get name =>
          CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$name
              .stub(_res);
  CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$description<
          TRes>
      get description =>
          CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$description
              .stub(_res);
}

class Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$name {
  Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$name({
    required this.translations,
    required this.$__typename,
  });

  factory Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$name.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$name(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$name$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$name$translations>
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
            is Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$name) ||
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

extension UtilityExtension$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$name
    on Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$name {
  CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$name<
          Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$name>
      get copyWith =>
          CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$name(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$name<
    TRes> {
  factory CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$name(
    Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$name
        instance,
    TRes Function(
            Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$name)
        then,
  ) = _CopyWithImpl$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$name;

  factory CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$name.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$name;

  TRes call({
    List<Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$name$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$name$translations> Function(
              Iterable<
                  CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$name$translations<
                      Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$name$translations>>)
          _fn);
}

class _CopyWithImpl$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$name<
        TRes>
    implements
        CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$name<
            TRes> {
  _CopyWithImpl$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$name(
    this._instance,
    this._then,
  );

  final Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$name
      _instance;

  final TRes Function(
          Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$name)
      _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$name(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$name$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$name$translations> Function(
                  Iterable<
                      CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$name$translations<
                          Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$name$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$name$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$name<
        TRes>
    implements
        CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$name<
            TRes> {
  _CopyWithStubImpl$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$name(
      this._res);

  TRes _res;

  call({
    List<Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$name$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$name$translations {
  Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$name$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$name$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$name$translations(
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
            is Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$name$translations) ||
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

extension UtilityExtension$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$name$translations
    on Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$name$translations {
  CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$name$translations<
          Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$name$translations>
      get copyWith =>
          CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$name$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$name$translations<
    TRes> {
  factory CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$name$translations(
    Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$name$translations
        instance,
    TRes Function(
            Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$name$translations)
        then,
  ) = _CopyWithImpl$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$name$translations;

  factory CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$name$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$name$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$name$translations<
        TRes>
    implements
        CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$name$translations<
            TRes> {
  _CopyWithImpl$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$name$translations(
    this._instance,
    this._then,
  );

  final Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$name$translations
      _instance;

  final TRes Function(
          Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$name$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$name$translations(
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

class _CopyWithStubImpl$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$name$translations<
        TRes>
    implements
        CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$name$translations<
            TRes> {
  _CopyWithStubImpl$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$name$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$description {
  Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$description({
    required this.translations,
    required this.$__typename,
  });

  factory Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$description.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$description(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$description$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$description$translations>
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
            is Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$description) ||
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

extension UtilityExtension$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$description
    on Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$description {
  CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$description<
          Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$description>
      get copyWith =>
          CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$description(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$description<
    TRes> {
  factory CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$description(
    Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$description
        instance,
    TRes Function(
            Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$description)
        then,
  ) = _CopyWithImpl$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$description;

  factory CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$description.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$description;

  TRes call({
    List<Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$description$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$description$translations> Function(
              Iterable<
                  CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$description$translations<
                      Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$description$translations>>)
          _fn);
}

class _CopyWithImpl$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$description<
        TRes>
    implements
        CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$description<
            TRes> {
  _CopyWithImpl$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$description(
    this._instance,
    this._then,
  );

  final Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$description
      _instance;

  final TRes Function(
          Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$description)
      _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$description(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$description$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$description$translations> Function(
                  Iterable<
                      CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$description$translations<
                          Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$description$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$description$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$description<
        TRes>
    implements
        CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$description<
            TRes> {
  _CopyWithStubImpl$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$description(
      this._res);

  TRes _res;

  call({
    List<Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$description$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$description$translations {
  Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$description$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$description$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$description$translations(
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
            is Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$description$translations) ||
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

extension UtilityExtension$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$description$translations
    on Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$description$translations {
  CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$description$translations<
          Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$description$translations>
      get copyWith =>
          CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$description$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$description$translations<
    TRes> {
  factory CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$description$translations(
    Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$description$translations
        instance,
    TRes Function(
            Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$description$translations)
        then,
  ) = _CopyWithImpl$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$description$translations;

  factory CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$description$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$description$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$description$translations<
        TRes>
    implements
        CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$description$translations<
            TRes> {
  _CopyWithImpl$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$description$translations(
    this._instance,
    this._then,
  );

  final Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$description$translations
      _instance;

  final TRes Function(
          Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$description$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$description$translations(
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

class _CopyWithStubImpl$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$description$translations<
        TRes>
    implements
        CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$description$translations<
            TRes> {
  _CopyWithStubImpl$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$details$description$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$business {
  Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$business({
    required this.id,
    required this.details,
    required this.$__typename,
  });

  factory Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$business.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$business(
      id: (l$id as int),
      details:
          Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$business$details
              .fromJson((l$details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$business$details
      details;

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
    if (!(other
            is Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$business) ||
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

extension UtilityExtension$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$business
    on Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$business {
  CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$business<
          Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$business>
      get copyWith =>
          CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$business(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$business<
    TRes> {
  factory CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$business(
    Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$business
        instance,
    TRes Function(
            Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$business)
        then,
  ) = _CopyWithImpl$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$business;

  factory CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$business.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$business;

  TRes call({
    int? id,
    Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$business$details?
        details,
    String? $__typename,
  });
  CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$business$details<
      TRes> get details;
}

class _CopyWithImpl$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$business<
        TRes>
    implements
        CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$business<
            TRes> {
  _CopyWithImpl$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$business(
    this._instance,
    this._then,
  );

  final Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$business
      _instance;

  final TRes Function(
          Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$business)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$business(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        details: details == _undefined || details == null
            ? _instance.details
            : (details
                as Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$business$details),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$business$details<
      TRes> get details {
    final local$details = _instance.details;
    return CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$business$details(
        local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$business<
        TRes>
    implements
        CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$business<
            TRes> {
  _CopyWithStubImpl$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$business(
      this._res);

  TRes _res;

  call({
    int? id,
    Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$business$details?
        details,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$business$details<
          TRes>
      get details =>
          CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$business$details
              .stub(_res);
}

class Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$business$details {
  Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$business$details({
    required this.id,
    required this.name,
    required this.$__typename,
  });

  factory Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$business$details.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$business$details(
      id: (l$id as int),
      name: (l$name as String),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String name;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([
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
            is Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$business$details) ||
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$business$details
    on Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$business$details {
  CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$business$details<
          Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$business$details>
      get copyWith =>
          CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$business$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$business$details<
    TRes> {
  factory CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$business$details(
    Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$business$details
        instance,
    TRes Function(
            Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$business$details)
        then,
  ) = _CopyWithImpl$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$business$details;

  factory CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$business$details.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$business$details;

  TRes call({
    int? id,
    String? name,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$business$details<
        TRes>
    implements
        CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$business$details<
            TRes> {
  _CopyWithImpl$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$business$details(
    this._instance,
    this._then,
  );

  final Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$business$details
      _instance;

  final TRes Function(
          Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$business$details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$business$details(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$business$details<
        TRes>
    implements
        CopyWith$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$business$details<
            TRes> {
  _CopyWithStubImpl$Mutation$update_home_rental_by_id$update_business_home_rental_by_pk$rental$business$details(
      this._res);

  TRes _res;

  call({
    int? id,
    String? name,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$get_business_rentals {
  factory Variables$Query$get_business_rentals({
    int? limit,
    int? offset,
    required int businessId,
  }) =>
      Variables$Query$get_business_rentals._({
        if (limit != null) r'limit': limit,
        if (offset != null) r'offset': offset,
        r'businessId': businessId,
      });

  Variables$Query$get_business_rentals._(this._$data);

  factory Variables$Query$get_business_rentals.fromJson(
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
    final l$businessId = data['businessId'];
    result$data['businessId'] = (l$businessId as int);
    return Variables$Query$get_business_rentals._(result$data);
  }

  Map<String, dynamic> _$data;

  int? get limit => (_$data['limit'] as int?);
  int? get offset => (_$data['offset'] as int?);
  int get businessId => (_$data['businessId'] as int);
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
    final l$businessId = businessId;
    result$data['businessId'] = l$businessId;
    return result$data;
  }

  CopyWith$Variables$Query$get_business_rentals<
          Variables$Query$get_business_rentals>
      get copyWith => CopyWith$Variables$Query$get_business_rentals(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$get_business_rentals) ||
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
    final l$businessId = businessId;
    final lOther$businessId = other.businessId;
    if (l$businessId != lOther$businessId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$limit = limit;
    final l$offset = offset;
    final l$businessId = businessId;
    return Object.hashAll([
      _$data.containsKey('limit') ? l$limit : const {},
      _$data.containsKey('offset') ? l$offset : const {},
      l$businessId,
    ]);
  }
}

abstract class CopyWith$Variables$Query$get_business_rentals<TRes> {
  factory CopyWith$Variables$Query$get_business_rentals(
    Variables$Query$get_business_rentals instance,
    TRes Function(Variables$Query$get_business_rentals) then,
  ) = _CopyWithImpl$Variables$Query$get_business_rentals;

  factory CopyWith$Variables$Query$get_business_rentals.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$get_business_rentals;

  TRes call({
    int? limit,
    int? offset,
    int? businessId,
  });
}

class _CopyWithImpl$Variables$Query$get_business_rentals<TRes>
    implements CopyWith$Variables$Query$get_business_rentals<TRes> {
  _CopyWithImpl$Variables$Query$get_business_rentals(
    this._instance,
    this._then,
  );

  final Variables$Query$get_business_rentals _instance;

  final TRes Function(Variables$Query$get_business_rentals) _then;

  static const _undefined = {};

  TRes call({
    Object? limit = _undefined,
    Object? offset = _undefined,
    Object? businessId = _undefined,
  }) =>
      _then(Variables$Query$get_business_rentals._({
        ..._instance._$data,
        if (limit != _undefined) 'limit': (limit as int?),
        if (offset != _undefined) 'offset': (offset as int?),
        if (businessId != _undefined && businessId != null)
          'businessId': (businessId as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$get_business_rentals<TRes>
    implements CopyWith$Variables$Query$get_business_rentals<TRes> {
  _CopyWithStubImpl$Variables$Query$get_business_rentals(this._res);

  TRes _res;

  call({
    int? limit,
    int? offset,
    int? businessId,
  }) =>
      _res;
}

class Query$get_business_rentals {
  Query$get_business_rentals({
    required this.business_rental,
    required this.$__typename,
  });

  factory Query$get_business_rentals.fromJson(Map<String, dynamic> json) {
    final l$business_rental = json['business_rental'];
    final l$$__typename = json['__typename'];
    return Query$get_business_rentals(
      business_rental: (l$business_rental as List<dynamic>)
          .map((e) => Query$get_business_rentals$business_rental.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<Query$get_business_rentals$business_rental> business_rental;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$business_rental = business_rental;
    _resultData['business_rental'] =
        l$business_rental.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$business_rental = business_rental;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$business_rental.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_business_rentals) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$business_rental = business_rental;
    final lOther$business_rental = other.business_rental;
    if (l$business_rental.length != lOther$business_rental.length) {
      return false;
    }
    for (int i = 0; i < l$business_rental.length; i++) {
      final l$business_rental$entry = l$business_rental[i];
      final lOther$business_rental$entry = lOther$business_rental[i];
      if (l$business_rental$entry != lOther$business_rental$entry) {
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

extension UtilityExtension$Query$get_business_rentals
    on Query$get_business_rentals {
  CopyWith$Query$get_business_rentals<Query$get_business_rentals>
      get copyWith => CopyWith$Query$get_business_rentals(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_business_rentals<TRes> {
  factory CopyWith$Query$get_business_rentals(
    Query$get_business_rentals instance,
    TRes Function(Query$get_business_rentals) then,
  ) = _CopyWithImpl$Query$get_business_rentals;

  factory CopyWith$Query$get_business_rentals.stub(TRes res) =
      _CopyWithStubImpl$Query$get_business_rentals;

  TRes call({
    List<Query$get_business_rentals$business_rental>? business_rental,
    String? $__typename,
  });
  TRes business_rental(
      Iterable<Query$get_business_rentals$business_rental> Function(
              Iterable<
                  CopyWith$Query$get_business_rentals$business_rental<
                      Query$get_business_rentals$business_rental>>)
          _fn);
}

class _CopyWithImpl$Query$get_business_rentals<TRes>
    implements CopyWith$Query$get_business_rentals<TRes> {
  _CopyWithImpl$Query$get_business_rentals(
    this._instance,
    this._then,
  );

  final Query$get_business_rentals _instance;

  final TRes Function(Query$get_business_rentals) _then;

  static const _undefined = {};

  TRes call({
    Object? business_rental = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_business_rentals(
        business_rental:
            business_rental == _undefined || business_rental == null
                ? _instance.business_rental
                : (business_rental
                    as List<Query$get_business_rentals$business_rental>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes business_rental(
          Iterable<Query$get_business_rentals$business_rental> Function(
                  Iterable<
                      CopyWith$Query$get_business_rentals$business_rental<
                          Query$get_business_rentals$business_rental>>)
              _fn) =>
      call(
          business_rental: _fn(_instance.business_rental
              .map((e) => CopyWith$Query$get_business_rentals$business_rental(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$get_business_rentals<TRes>
    implements CopyWith$Query$get_business_rentals<TRes> {
  _CopyWithStubImpl$Query$get_business_rentals(this._res);

  TRes _res;

  call({
    List<Query$get_business_rentals$business_rental>? business_rental,
    String? $__typename,
  }) =>
      _res;
  business_rental(_fn) => _res;
}

const documentNodeQueryget_business_rentals = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'get_business_rentals'),
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
        variable: VariableNode(name: NameNode(value: 'businessId')),
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
        name: NameNode(value: 'business_rental'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: '_and'),
                value: ListValueNode(values: [
                  ObjectValueNode(fields: [
                    ObjectFieldNode(
                      name: NameNode(value: '_or'),
                      value: ListValueNode(values: [
                        ObjectValueNode(fields: [
                          ObjectFieldNode(
                            name: NameNode(value: 'details'),
                            value: ObjectValueNode(fields: [
                              ObjectFieldNode(
                                name: NameNode(value: 'category1'),
                                value: ObjectValueNode(fields: [
                                  ObjectFieldNode(
                                    name: NameNode(value: '_eq'),
                                    value: StringValueNode(
                                      value: 'surf',
                                      isBlock: false,
                                    ),
                                  )
                                ]),
                              )
                            ]),
                          )
                        ]),
                        ObjectValueNode(fields: [
                          ObjectFieldNode(
                            name: NameNode(value: 'details'),
                            value: ObjectValueNode(fields: [
                              ObjectFieldNode(
                                name: NameNode(value: 'category1'),
                                value: ObjectValueNode(fields: [
                                  ObjectFieldNode(
                                    name: NameNode(value: '_eq'),
                                    value: StringValueNode(
                                      value: 'vehicle',
                                      isBlock: false,
                                    ),
                                  )
                                ]),
                              )
                            ]),
                          )
                        ]),
                      ]),
                    )
                  ]),
                  ObjectValueNode(fields: [
                    ObjectFieldNode(
                      name: NameNode(value: 'details'),
                      value: ObjectValueNode(fields: [
                        ObjectFieldNode(
                          name: NameNode(value: 'tags'),
                          value: ObjectValueNode(fields: [
                            ObjectFieldNode(
                              name: NameNode(value: '_has_keys_all'),
                              value: ListValueNode(values: []),
                            )
                          ]),
                        )
                      ]),
                    )
                  ]),
                  ObjectValueNode(fields: [
                    ObjectFieldNode(
                      name: NameNode(value: 'business_id'),
                      value: ObjectValueNode(fields: [
                        ObjectFieldNode(
                          name: NameNode(value: '_eq'),
                          value:
                              VariableNode(name: NameNode(value: 'businessId')),
                        )
                      ]),
                    )
                  ]),
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
                name: NameNode(value: 'name_id'),
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
                name: NameNode(value: 'category2'),
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
                name: NameNode(value: 'tags'),
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
            name: NameNode(value: 'category3'),
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
                    name: NameNode(value: 'currency'),
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
Query$get_business_rentals _parserFn$Query$get_business_rentals(
        Map<String, dynamic> data) =>
    Query$get_business_rentals.fromJson(data);

class Options$Query$get_business_rentals
    extends graphql.QueryOptions<Query$get_business_rentals> {
  Options$Query$get_business_rentals({
    String? operationName,
    required Variables$Query$get_business_rentals variables,
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
          document: documentNodeQueryget_business_rentals,
          parserFn: _parserFn$Query$get_business_rentals,
        );
}

class WatchOptions$Query$get_business_rentals
    extends graphql.WatchQueryOptions<Query$get_business_rentals> {
  WatchOptions$Query$get_business_rentals({
    String? operationName,
    required Variables$Query$get_business_rentals variables,
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
          document: documentNodeQueryget_business_rentals,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$get_business_rentals,
        );
}

class FetchMoreOptions$Query$get_business_rentals
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$get_business_rentals({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$get_business_rentals variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryget_business_rentals,
        );
}

extension ClientExtension$Query$get_business_rentals on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$get_business_rentals>>
      query$get_business_rentals(
              Options$Query$get_business_rentals options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$get_business_rentals>
      watchQuery$get_business_rentals(
              WatchOptions$Query$get_business_rentals options) =>
          this.watchQuery(options);
  void writeQuery$get_business_rentals({
    required Query$get_business_rentals data,
    required Variables$Query$get_business_rentals variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryget_business_rentals),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$get_business_rentals? readQuery$get_business_rentals({
    required Variables$Query$get_business_rentals variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQueryget_business_rentals),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$get_business_rentals.fromJson(result);
  }
}

class Query$get_business_rentals$business_rental {
  Query$get_business_rentals$business_rental({
    required this.details,
    required this.id,
    required this.category3,
    required this.business,
    required this.$__typename,
  });

  factory Query$get_business_rentals$business_rental.fromJson(
      Map<String, dynamic> json) {
    final l$details = json['details'];
    final l$id = json['id'];
    final l$category3 = json['category3'];
    final l$business = json['business'];
    final l$$__typename = json['__typename'];
    return Query$get_business_rentals$business_rental(
      details: Query$get_business_rentals$business_rental$details.fromJson(
          (l$details as Map<String, dynamic>)),
      id: (l$id as int),
      category3: (l$category3 as String),
      business: Query$get_business_rentals$business_rental$business.fromJson(
          (l$business as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$get_business_rentals$business_rental$details details;

  final int id;

  final String category3;

  final Query$get_business_rentals$business_rental$business business;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$details = details;
    _resultData['details'] = l$details.toJson();
    final l$id = id;
    _resultData['id'] = l$id;
    final l$category3 = category3;
    _resultData['category3'] = l$category3;
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
    final l$category3 = category3;
    final l$business = business;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$details,
      l$id,
      l$category3,
      l$business,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_business_rentals$business_rental) ||
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
    final l$category3 = category3;
    final lOther$category3 = other.category3;
    if (l$category3 != lOther$category3) {
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

extension UtilityExtension$Query$get_business_rentals$business_rental
    on Query$get_business_rentals$business_rental {
  CopyWith$Query$get_business_rentals$business_rental<
          Query$get_business_rentals$business_rental>
      get copyWith => CopyWith$Query$get_business_rentals$business_rental(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_business_rentals$business_rental<TRes> {
  factory CopyWith$Query$get_business_rentals$business_rental(
    Query$get_business_rentals$business_rental instance,
    TRes Function(Query$get_business_rentals$business_rental) then,
  ) = _CopyWithImpl$Query$get_business_rentals$business_rental;

  factory CopyWith$Query$get_business_rentals$business_rental.stub(TRes res) =
      _CopyWithStubImpl$Query$get_business_rentals$business_rental;

  TRes call({
    Query$get_business_rentals$business_rental$details? details,
    int? id,
    String? category3,
    Query$get_business_rentals$business_rental$business? business,
    String? $__typename,
  });
  CopyWith$Query$get_business_rentals$business_rental$details<TRes> get details;
  CopyWith$Query$get_business_rentals$business_rental$business<TRes>
      get business;
}

class _CopyWithImpl$Query$get_business_rentals$business_rental<TRes>
    implements CopyWith$Query$get_business_rentals$business_rental<TRes> {
  _CopyWithImpl$Query$get_business_rentals$business_rental(
    this._instance,
    this._then,
  );

  final Query$get_business_rentals$business_rental _instance;

  final TRes Function(Query$get_business_rentals$business_rental) _then;

  static const _undefined = {};

  TRes call({
    Object? details = _undefined,
    Object? id = _undefined,
    Object? category3 = _undefined,
    Object? business = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_business_rentals$business_rental(
        details: details == _undefined || details == null
            ? _instance.details
            : (details as Query$get_business_rentals$business_rental$details),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        category3: category3 == _undefined || category3 == null
            ? _instance.category3
            : (category3 as String),
        business: business == _undefined || business == null
            ? _instance.business
            : (business as Query$get_business_rentals$business_rental$business),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_business_rentals$business_rental$details<TRes>
      get details {
    final local$details = _instance.details;
    return CopyWith$Query$get_business_rentals$business_rental$details(
        local$details, (e) => call(details: e));
  }

  CopyWith$Query$get_business_rentals$business_rental$business<TRes>
      get business {
    final local$business = _instance.business;
    return CopyWith$Query$get_business_rentals$business_rental$business(
        local$business, (e) => call(business: e));
  }
}

class _CopyWithStubImpl$Query$get_business_rentals$business_rental<TRes>
    implements CopyWith$Query$get_business_rentals$business_rental<TRes> {
  _CopyWithStubImpl$Query$get_business_rentals$business_rental(this._res);

  TRes _res;

  call({
    Query$get_business_rentals$business_rental$details? details,
    int? id,
    String? category3,
    Query$get_business_rentals$business_rental$business? business,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_business_rentals$business_rental$details<TRes>
      get details =>
          CopyWith$Query$get_business_rentals$business_rental$details.stub(
              _res);
  CopyWith$Query$get_business_rentals$business_rental$business<TRes>
      get business =>
          CopyWith$Query$get_business_rentals$business_rental$business.stub(
              _res);
}

class Query$get_business_rentals$business_rental$details {
  Query$get_business_rentals$business_rental$details({
    required this.name_id,
    this.description_id,
    required this.id,
    required this.name,
    this.additional_parameters,
    required this.available,
    required this.category1,
    required this.category2,
    required this.cost,
    this.image,
    required this.position,
    required this.tags,
    required this.$__typename,
  });

  factory Query$get_business_rentals$business_rental$details.fromJson(
      Map<String, dynamic> json) {
    final l$name_id = json['name_id'];
    final l$description_id = json['description_id'];
    final l$id = json['id'];
    final l$name = json['name'];
    final l$additional_parameters = json['additional_parameters'];
    final l$available = json['available'];
    final l$category1 = json['category1'];
    final l$category2 = json['category2'];
    final l$cost = json['cost'];
    final l$image = json['image'];
    final l$position = json['position'];
    final l$tags = json['tags'];
    final l$$__typename = json['__typename'];
    return Query$get_business_rentals$business_rental$details(
      name_id: (l$name_id as int),
      description_id: (l$description_id as int?),
      id: (l$id as int),
      name: Query$get_business_rentals$business_rental$details$name.fromJson(
          (l$name as Map<String, dynamic>)),
      additional_parameters: l$additional_parameters == null
          ? null
          : mapFromJson(l$additional_parameters),
      available: (l$available as bool),
      category1: (l$category1 as String),
      category2: (l$category2 as String),
      cost: mapFromJson(l$cost),
      image: l$image == null ? null : mapFromJson(l$image),
      position: (l$position as int),
      tags: mapFromJson(l$tags),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int name_id;

  final int? description_id;

  final int id;

  final Query$get_business_rentals$business_rental$details$name name;

  final dynamic? additional_parameters;

  final bool available;

  final String category1;

  final String category2;

  final dynamic cost;

  final dynamic? image;

  final int position;

  final dynamic tags;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name_id = name_id;
    _resultData['name_id'] = l$name_id;
    final l$description_id = description_id;
    _resultData['description_id'] = l$description_id;
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
    final l$category2 = category2;
    _resultData['category2'] = l$category2;
    final l$cost = cost;
    _resultData['cost'] = mapToJson(l$cost);
    final l$image = image;
    _resultData['image'] = l$image == null ? null : mapToJson(l$image);
    final l$position = position;
    _resultData['position'] = l$position;
    final l$tags = tags;
    _resultData['tags'] = mapToJson(l$tags);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$name_id = name_id;
    final l$description_id = description_id;
    final l$id = id;
    final l$name = name;
    final l$additional_parameters = additional_parameters;
    final l$available = available;
    final l$category1 = category1;
    final l$category2 = category2;
    final l$cost = cost;
    final l$image = image;
    final l$position = position;
    final l$tags = tags;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$name_id,
      l$description_id,
      l$id,
      l$name,
      l$additional_parameters,
      l$available,
      l$category1,
      l$category2,
      l$cost,
      l$image,
      l$position,
      l$tags,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$get_business_rentals$business_rental$details) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name_id = name_id;
    final lOther$name_id = other.name_id;
    if (l$name_id != lOther$name_id) {
      return false;
    }
    final l$description_id = description_id;
    final lOther$description_id = other.description_id;
    if (l$description_id != lOther$description_id) {
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
    final l$category2 = category2;
    final lOther$category2 = other.category2;
    if (l$category2 != lOther$category2) {
      return false;
    }
    final l$cost = cost;
    final lOther$cost = other.cost;
    if (l$cost != lOther$cost) {
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
    final l$tags = tags;
    final lOther$tags = other.tags;
    if (l$tags != lOther$tags) {
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

extension UtilityExtension$Query$get_business_rentals$business_rental$details
    on Query$get_business_rentals$business_rental$details {
  CopyWith$Query$get_business_rentals$business_rental$details<
          Query$get_business_rentals$business_rental$details>
      get copyWith =>
          CopyWith$Query$get_business_rentals$business_rental$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_business_rentals$business_rental$details<
    TRes> {
  factory CopyWith$Query$get_business_rentals$business_rental$details(
    Query$get_business_rentals$business_rental$details instance,
    TRes Function(Query$get_business_rentals$business_rental$details) then,
  ) = _CopyWithImpl$Query$get_business_rentals$business_rental$details;

  factory CopyWith$Query$get_business_rentals$business_rental$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_business_rentals$business_rental$details;

  TRes call({
    int? name_id,
    int? description_id,
    int? id,
    Query$get_business_rentals$business_rental$details$name? name,
    dynamic? additional_parameters,
    bool? available,
    String? category1,
    String? category2,
    dynamic? cost,
    dynamic? image,
    int? position,
    dynamic? tags,
    String? $__typename,
  });
  CopyWith$Query$get_business_rentals$business_rental$details$name<TRes>
      get name;
}

class _CopyWithImpl$Query$get_business_rentals$business_rental$details<TRes>
    implements
        CopyWith$Query$get_business_rentals$business_rental$details<TRes> {
  _CopyWithImpl$Query$get_business_rentals$business_rental$details(
    this._instance,
    this._then,
  );

  final Query$get_business_rentals$business_rental$details _instance;

  final TRes Function(Query$get_business_rentals$business_rental$details) _then;

  static const _undefined = {};

  TRes call({
    Object? name_id = _undefined,
    Object? description_id = _undefined,
    Object? id = _undefined,
    Object? name = _undefined,
    Object? additional_parameters = _undefined,
    Object? available = _undefined,
    Object? category1 = _undefined,
    Object? category2 = _undefined,
    Object? cost = _undefined,
    Object? image = _undefined,
    Object? position = _undefined,
    Object? tags = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_business_rentals$business_rental$details(
        name_id: name_id == _undefined || name_id == null
            ? _instance.name_id
            : (name_id as int),
        description_id: description_id == _undefined
            ? _instance.description_id
            : (description_id as int?),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as Query$get_business_rentals$business_rental$details$name),
        additional_parameters: additional_parameters == _undefined
            ? _instance.additional_parameters
            : (additional_parameters as dynamic?),
        available: available == _undefined || available == null
            ? _instance.available
            : (available as bool),
        category1: category1 == _undefined || category1 == null
            ? _instance.category1
            : (category1 as String),
        category2: category2 == _undefined || category2 == null
            ? _instance.category2
            : (category2 as String),
        cost: cost == _undefined || cost == null
            ? _instance.cost
            : (cost as dynamic),
        image: image == _undefined ? _instance.image : (image as dynamic?),
        position: position == _undefined || position == null
            ? _instance.position
            : (position as int),
        tags: tags == _undefined || tags == null
            ? _instance.tags
            : (tags as dynamic),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_business_rentals$business_rental$details$name<TRes>
      get name {
    final local$name = _instance.name;
    return CopyWith$Query$get_business_rentals$business_rental$details$name(
        local$name, (e) => call(name: e));
  }
}

class _CopyWithStubImpl$Query$get_business_rentals$business_rental$details<TRes>
    implements
        CopyWith$Query$get_business_rentals$business_rental$details<TRes> {
  _CopyWithStubImpl$Query$get_business_rentals$business_rental$details(
      this._res);

  TRes _res;

  call({
    int? name_id,
    int? description_id,
    int? id,
    Query$get_business_rentals$business_rental$details$name? name,
    dynamic? additional_parameters,
    bool? available,
    String? category1,
    String? category2,
    dynamic? cost,
    dynamic? image,
    int? position,
    dynamic? tags,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_business_rentals$business_rental$details$name<TRes>
      get name =>
          CopyWith$Query$get_business_rentals$business_rental$details$name.stub(
              _res);
}

class Query$get_business_rentals$business_rental$details$name {
  Query$get_business_rentals$business_rental$details$name({
    required this.translations,
    required this.$__typename,
  });

  factory Query$get_business_rentals$business_rental$details$name.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$get_business_rentals$business_rental$details$name(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$get_business_rentals$business_rental$details$name$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Query$get_business_rentals$business_rental$details$name$translations>
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
    if (!(other is Query$get_business_rentals$business_rental$details$name) ||
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

extension UtilityExtension$Query$get_business_rentals$business_rental$details$name
    on Query$get_business_rentals$business_rental$details$name {
  CopyWith$Query$get_business_rentals$business_rental$details$name<
          Query$get_business_rentals$business_rental$details$name>
      get copyWith =>
          CopyWith$Query$get_business_rentals$business_rental$details$name(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_business_rentals$business_rental$details$name<
    TRes> {
  factory CopyWith$Query$get_business_rentals$business_rental$details$name(
    Query$get_business_rentals$business_rental$details$name instance,
    TRes Function(Query$get_business_rentals$business_rental$details$name) then,
  ) = _CopyWithImpl$Query$get_business_rentals$business_rental$details$name;

  factory CopyWith$Query$get_business_rentals$business_rental$details$name.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_business_rentals$business_rental$details$name;

  TRes call({
    List<Query$get_business_rentals$business_rental$details$name$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$get_business_rentals$business_rental$details$name$translations> Function(
              Iterable<
                  CopyWith$Query$get_business_rentals$business_rental$details$name$translations<
                      Query$get_business_rentals$business_rental$details$name$translations>>)
          _fn);
}

class _CopyWithImpl$Query$get_business_rentals$business_rental$details$name<
        TRes>
    implements
        CopyWith$Query$get_business_rentals$business_rental$details$name<TRes> {
  _CopyWithImpl$Query$get_business_rentals$business_rental$details$name(
    this._instance,
    this._then,
  );

  final Query$get_business_rentals$business_rental$details$name _instance;

  final TRes Function(Query$get_business_rentals$business_rental$details$name)
      _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_business_rentals$business_rental$details$name(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$get_business_rentals$business_rental$details$name$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$get_business_rentals$business_rental$details$name$translations> Function(
                  Iterable<
                      CopyWith$Query$get_business_rentals$business_rental$details$name$translations<
                          Query$get_business_rentals$business_rental$details$name$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$get_business_rentals$business_rental$details$name$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$get_business_rentals$business_rental$details$name<
        TRes>
    implements
        CopyWith$Query$get_business_rentals$business_rental$details$name<TRes> {
  _CopyWithStubImpl$Query$get_business_rentals$business_rental$details$name(
      this._res);

  TRes _res;

  call({
    List<Query$get_business_rentals$business_rental$details$name$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$get_business_rentals$business_rental$details$name$translations {
  Query$get_business_rentals$business_rental$details$name$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$get_business_rentals$business_rental$details$name$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$get_business_rentals$business_rental$details$name$translations(
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
            is Query$get_business_rentals$business_rental$details$name$translations) ||
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

extension UtilityExtension$Query$get_business_rentals$business_rental$details$name$translations
    on Query$get_business_rentals$business_rental$details$name$translations {
  CopyWith$Query$get_business_rentals$business_rental$details$name$translations<
          Query$get_business_rentals$business_rental$details$name$translations>
      get copyWith =>
          CopyWith$Query$get_business_rentals$business_rental$details$name$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_business_rentals$business_rental$details$name$translations<
    TRes> {
  factory CopyWith$Query$get_business_rentals$business_rental$details$name$translations(
    Query$get_business_rentals$business_rental$details$name$translations
        instance,
    TRes Function(
            Query$get_business_rentals$business_rental$details$name$translations)
        then,
  ) = _CopyWithImpl$Query$get_business_rentals$business_rental$details$name$translations;

  factory CopyWith$Query$get_business_rentals$business_rental$details$name$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_business_rentals$business_rental$details$name$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_business_rentals$business_rental$details$name$translations<
        TRes>
    implements
        CopyWith$Query$get_business_rentals$business_rental$details$name$translations<
            TRes> {
  _CopyWithImpl$Query$get_business_rentals$business_rental$details$name$translations(
    this._instance,
    this._then,
  );

  final Query$get_business_rentals$business_rental$details$name$translations
      _instance;

  final TRes Function(
          Query$get_business_rentals$business_rental$details$name$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_business_rentals$business_rental$details$name$translations(
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

class _CopyWithStubImpl$Query$get_business_rentals$business_rental$details$name$translations<
        TRes>
    implements
        CopyWith$Query$get_business_rentals$business_rental$details$name$translations<
            TRes> {
  _CopyWithStubImpl$Query$get_business_rentals$business_rental$details$name$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Query$get_business_rentals$business_rental$business {
  Query$get_business_rentals$business_rental$business({
    required this.id,
    required this.details,
    required this.$__typename,
  });

  factory Query$get_business_rentals$business_rental$business.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Query$get_business_rentals$business_rental$business(
      id: (l$id as int),
      details:
          Query$get_business_rentals$business_rental$business$details.fromJson(
              (l$details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final Query$get_business_rentals$business_rental$business$details details;

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
    if (!(other is Query$get_business_rentals$business_rental$business) ||
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

extension UtilityExtension$Query$get_business_rentals$business_rental$business
    on Query$get_business_rentals$business_rental$business {
  CopyWith$Query$get_business_rentals$business_rental$business<
          Query$get_business_rentals$business_rental$business>
      get copyWith =>
          CopyWith$Query$get_business_rentals$business_rental$business(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_business_rentals$business_rental$business<
    TRes> {
  factory CopyWith$Query$get_business_rentals$business_rental$business(
    Query$get_business_rentals$business_rental$business instance,
    TRes Function(Query$get_business_rentals$business_rental$business) then,
  ) = _CopyWithImpl$Query$get_business_rentals$business_rental$business;

  factory CopyWith$Query$get_business_rentals$business_rental$business.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_business_rentals$business_rental$business;

  TRes call({
    int? id,
    Query$get_business_rentals$business_rental$business$details? details,
    String? $__typename,
  });
  CopyWith$Query$get_business_rentals$business_rental$business$details<TRes>
      get details;
}

class _CopyWithImpl$Query$get_business_rentals$business_rental$business<TRes>
    implements
        CopyWith$Query$get_business_rentals$business_rental$business<TRes> {
  _CopyWithImpl$Query$get_business_rentals$business_rental$business(
    this._instance,
    this._then,
  );

  final Query$get_business_rentals$business_rental$business _instance;

  final TRes Function(Query$get_business_rentals$business_rental$business)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_business_rentals$business_rental$business(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        details: details == _undefined || details == null
            ? _instance.details
            : (details
                as Query$get_business_rentals$business_rental$business$details),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_business_rentals$business_rental$business$details<TRes>
      get details {
    final local$details = _instance.details;
    return CopyWith$Query$get_business_rentals$business_rental$business$details(
        local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Query$get_business_rentals$business_rental$business<
        TRes>
    implements
        CopyWith$Query$get_business_rentals$business_rental$business<TRes> {
  _CopyWithStubImpl$Query$get_business_rentals$business_rental$business(
      this._res);

  TRes _res;

  call({
    int? id,
    Query$get_business_rentals$business_rental$business$details? details,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_business_rentals$business_rental$business$details<TRes>
      get details =>
          CopyWith$Query$get_business_rentals$business_rental$business$details
              .stub(_res);
}

class Query$get_business_rentals$business_rental$business$details {
  Query$get_business_rentals$business_rental$business$details({
    required this.id,
    required this.name,
    required this.currency,
    required this.image,
    required this.location,
    required this.accepted_payments,
    required this.$__typename,
  });

  factory Query$get_business_rentals$business_rental$business$details.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$currency = json['currency'];
    final l$image = json['image'];
    final l$location = json['location'];
    final l$accepted_payments = json['accepted_payments'];
    final l$$__typename = json['__typename'];
    return Query$get_business_rentals$business_rental$business$details(
      id: (l$id as int),
      name: (l$name as String),
      currency: (l$currency as String),
      image: (l$image as String),
      location:
          Query$get_business_rentals$business_rental$business$details$location
              .fromJson((l$location as Map<String, dynamic>)),
      accepted_payments: mapFromJson(l$accepted_payments),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final String name;

  final String currency;

  final String image;

  final Query$get_business_rentals$business_rental$business$details$location
      location;

  final dynamic accepted_payments;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$currency = currency;
    _resultData['currency'] = l$currency;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$location = location;
    _resultData['location'] = l$location.toJson();
    final l$accepted_payments = accepted_payments;
    _resultData['accepted_payments'] = mapToJson(l$accepted_payments);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$currency = currency;
    final l$image = image;
    final l$location = location;
    final l$accepted_payments = accepted_payments;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$currency,
      l$image,
      l$location,
      l$accepted_payments,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$get_business_rentals$business_rental$business$details) ||
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
    final l$currency = currency;
    final lOther$currency = other.currency;
    if (l$currency != lOther$currency) {
      return false;
    }
    final l$image = image;
    final lOther$image = other.image;
    if (l$image != lOther$image) {
      return false;
    }
    final l$location = location;
    final lOther$location = other.location;
    if (l$location != lOther$location) {
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

extension UtilityExtension$Query$get_business_rentals$business_rental$business$details
    on Query$get_business_rentals$business_rental$business$details {
  CopyWith$Query$get_business_rentals$business_rental$business$details<
          Query$get_business_rentals$business_rental$business$details>
      get copyWith =>
          CopyWith$Query$get_business_rentals$business_rental$business$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_business_rentals$business_rental$business$details<
    TRes> {
  factory CopyWith$Query$get_business_rentals$business_rental$business$details(
    Query$get_business_rentals$business_rental$business$details instance,
    TRes Function(Query$get_business_rentals$business_rental$business$details)
        then,
  ) = _CopyWithImpl$Query$get_business_rentals$business_rental$business$details;

  factory CopyWith$Query$get_business_rentals$business_rental$business$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_business_rentals$business_rental$business$details;

  TRes call({
    int? id,
    String? name,
    String? currency,
    String? image,
    Query$get_business_rentals$business_rental$business$details$location?
        location,
    dynamic? accepted_payments,
    String? $__typename,
  });
  CopyWith$Query$get_business_rentals$business_rental$business$details$location<
      TRes> get location;
}

class _CopyWithImpl$Query$get_business_rentals$business_rental$business$details<
        TRes>
    implements
        CopyWith$Query$get_business_rentals$business_rental$business$details<
            TRes> {
  _CopyWithImpl$Query$get_business_rentals$business_rental$business$details(
    this._instance,
    this._then,
  );

  final Query$get_business_rentals$business_rental$business$details _instance;

  final TRes Function(
      Query$get_business_rentals$business_rental$business$details) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? currency = _undefined,
    Object? image = _undefined,
    Object? location = _undefined,
    Object? accepted_payments = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$get_business_rentals$business_rental$business$details(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        currency: currency == _undefined || currency == null
            ? _instance.currency
            : (currency as String),
        image: image == _undefined || image == null
            ? _instance.image
            : (image as String),
        location: location == _undefined || location == null
            ? _instance.location
            : (location
                as Query$get_business_rentals$business_rental$business$details$location),
        accepted_payments:
            accepted_payments == _undefined || accepted_payments == null
                ? _instance.accepted_payments
                : (accepted_payments as dynamic),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$get_business_rentals$business_rental$business$details$location<
      TRes> get location {
    final local$location = _instance.location;
    return CopyWith$Query$get_business_rentals$business_rental$business$details$location(
        local$location, (e) => call(location: e));
  }
}

class _CopyWithStubImpl$Query$get_business_rentals$business_rental$business$details<
        TRes>
    implements
        CopyWith$Query$get_business_rentals$business_rental$business$details<
            TRes> {
  _CopyWithStubImpl$Query$get_business_rentals$business_rental$business$details(
      this._res);

  TRes _res;

  call({
    int? id,
    String? name,
    String? currency,
    String? image,
    Query$get_business_rentals$business_rental$business$details$location?
        location,
    dynamic? accepted_payments,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$get_business_rentals$business_rental$business$details$location<
          TRes>
      get location =>
          CopyWith$Query$get_business_rentals$business_rental$business$details$location
              .stub(_res);
}

class Query$get_business_rentals$business_rental$business$details$location {
  Query$get_business_rentals$business_rental$business$details$location({
    required this.gps,
    required this.address,
    required this.$__typename,
  });

  factory Query$get_business_rentals$business_rental$business$details$location.fromJson(
      Map<String, dynamic> json) {
    final l$gps = json['gps'];
    final l$address = json['address'];
    final l$$__typename = json['__typename'];
    return Query$get_business_rentals$business_rental$business$details$location(
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
            is Query$get_business_rentals$business_rental$business$details$location) ||
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

extension UtilityExtension$Query$get_business_rentals$business_rental$business$details$location
    on Query$get_business_rentals$business_rental$business$details$location {
  CopyWith$Query$get_business_rentals$business_rental$business$details$location<
          Query$get_business_rentals$business_rental$business$details$location>
      get copyWith =>
          CopyWith$Query$get_business_rentals$business_rental$business$details$location(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$get_business_rentals$business_rental$business$details$location<
    TRes> {
  factory CopyWith$Query$get_business_rentals$business_rental$business$details$location(
    Query$get_business_rentals$business_rental$business$details$location
        instance,
    TRes Function(
            Query$get_business_rentals$business_rental$business$details$location)
        then,
  ) = _CopyWithImpl$Query$get_business_rentals$business_rental$business$details$location;

  factory CopyWith$Query$get_business_rentals$business_rental$business$details$location.stub(
          TRes res) =
      _CopyWithStubImpl$Query$get_business_rentals$business_rental$business$details$location;

  TRes call({
    Geography? gps,
    String? address,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$get_business_rentals$business_rental$business$details$location<
        TRes>
    implements
        CopyWith$Query$get_business_rentals$business_rental$business$details$location<
            TRes> {
  _CopyWithImpl$Query$get_business_rentals$business_rental$business$details$location(
    this._instance,
    this._then,
  );

  final Query$get_business_rentals$business_rental$business$details$location
      _instance;

  final TRes Function(
          Query$get_business_rentals$business_rental$business$details$location)
      _then;

  static const _undefined = {};

  TRes call({
    Object? gps = _undefined,
    Object? address = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$get_business_rentals$business_rental$business$details$location(
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

class _CopyWithStubImpl$Query$get_business_rentals$business_rental$business$details$location<
        TRes>
    implements
        CopyWith$Query$get_business_rentals$business_rental$business$details$location<
            TRes> {
  _CopyWithStubImpl$Query$get_business_rentals$business_rental$business$details$location(
      this._res);

  TRes _res;

  call({
    Geography? gps,
    String? address,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$update_rental_category2 {
  factory Variables$Mutation$update_rental_category2({
    required int id,
    required String category2,
  }) =>
      Variables$Mutation$update_rental_category2._({
        r'id': id,
        r'category2': category2,
      });

  Variables$Mutation$update_rental_category2._(this._$data);

  factory Variables$Mutation$update_rental_category2.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as int);
    final l$category2 = data['category2'];
    result$data['category2'] = (l$category2 as String);
    return Variables$Mutation$update_rental_category2._(result$data);
  }

  Map<String, dynamic> _$data;

  int get id => (_$data['id'] as int);
  String get category2 => (_$data['category2'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    final l$category2 = category2;
    result$data['category2'] = l$category2;
    return result$data;
  }

  CopyWith$Variables$Mutation$update_rental_category2<
          Variables$Mutation$update_rental_category2>
      get copyWith => CopyWith$Variables$Mutation$update_rental_category2(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$update_rental_category2) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$category2 = category2;
    final lOther$category2 = other.category2;
    if (l$category2 != lOther$category2) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$category2 = category2;
    return Object.hashAll([
      l$id,
      l$category2,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$update_rental_category2<TRes> {
  factory CopyWith$Variables$Mutation$update_rental_category2(
    Variables$Mutation$update_rental_category2 instance,
    TRes Function(Variables$Mutation$update_rental_category2) then,
  ) = _CopyWithImpl$Variables$Mutation$update_rental_category2;

  factory CopyWith$Variables$Mutation$update_rental_category2.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$update_rental_category2;

  TRes call({
    int? id,
    String? category2,
  });
}

class _CopyWithImpl$Variables$Mutation$update_rental_category2<TRes>
    implements CopyWith$Variables$Mutation$update_rental_category2<TRes> {
  _CopyWithImpl$Variables$Mutation$update_rental_category2(
    this._instance,
    this._then,
  );

  final Variables$Mutation$update_rental_category2 _instance;

  final TRes Function(Variables$Mutation$update_rental_category2) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? category2 = _undefined,
  }) =>
      _then(Variables$Mutation$update_rental_category2._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as int),
        if (category2 != _undefined && category2 != null)
          'category2': (category2 as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$update_rental_category2<TRes>
    implements CopyWith$Variables$Mutation$update_rental_category2<TRes> {
  _CopyWithStubImpl$Variables$Mutation$update_rental_category2(this._res);

  TRes _res;

  call({
    int? id,
    String? category2,
  }) =>
      _res;
}

class Mutation$update_rental_category2 {
  Mutation$update_rental_category2({
    this.update_business_item_details,
    required this.$__typename,
  });

  factory Mutation$update_rental_category2.fromJson(Map<String, dynamic> json) {
    final l$update_business_item_details = json['update_business_item_details'];
    final l$$__typename = json['__typename'];
    return Mutation$update_rental_category2(
      update_business_item_details: l$update_business_item_details == null
          ? null
          : Mutation$update_rental_category2$update_business_item_details
              .fromJson(
                  (l$update_business_item_details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$update_rental_category2$update_business_item_details?
      update_business_item_details;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$update_business_item_details = update_business_item_details;
    _resultData['update_business_item_details'] =
        l$update_business_item_details?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$update_business_item_details = update_business_item_details;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$update_business_item_details,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$update_rental_category2) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$update_business_item_details = update_business_item_details;
    final lOther$update_business_item_details =
        other.update_business_item_details;
    if (l$update_business_item_details != lOther$update_business_item_details) {
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

extension UtilityExtension$Mutation$update_rental_category2
    on Mutation$update_rental_category2 {
  CopyWith$Mutation$update_rental_category2<Mutation$update_rental_category2>
      get copyWith => CopyWith$Mutation$update_rental_category2(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$update_rental_category2<TRes> {
  factory CopyWith$Mutation$update_rental_category2(
    Mutation$update_rental_category2 instance,
    TRes Function(Mutation$update_rental_category2) then,
  ) = _CopyWithImpl$Mutation$update_rental_category2;

  factory CopyWith$Mutation$update_rental_category2.stub(TRes res) =
      _CopyWithStubImpl$Mutation$update_rental_category2;

  TRes call({
    Mutation$update_rental_category2$update_business_item_details?
        update_business_item_details,
    String? $__typename,
  });
  CopyWith$Mutation$update_rental_category2$update_business_item_details<TRes>
      get update_business_item_details;
}

class _CopyWithImpl$Mutation$update_rental_category2<TRes>
    implements CopyWith$Mutation$update_rental_category2<TRes> {
  _CopyWithImpl$Mutation$update_rental_category2(
    this._instance,
    this._then,
  );

  final Mutation$update_rental_category2 _instance;

  final TRes Function(Mutation$update_rental_category2) _then;

  static const _undefined = {};

  TRes call({
    Object? update_business_item_details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$update_rental_category2(
        update_business_item_details: update_business_item_details == _undefined
            ? _instance.update_business_item_details
            : (update_business_item_details
                as Mutation$update_rental_category2$update_business_item_details?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$update_rental_category2$update_business_item_details<TRes>
      get update_business_item_details {
    final local$update_business_item_details =
        _instance.update_business_item_details;
    return local$update_business_item_details == null
        ? CopyWith$Mutation$update_rental_category2$update_business_item_details
            .stub(_then(_instance))
        : CopyWith$Mutation$update_rental_category2$update_business_item_details(
            local$update_business_item_details,
            (e) => call(update_business_item_details: e));
  }
}

class _CopyWithStubImpl$Mutation$update_rental_category2<TRes>
    implements CopyWith$Mutation$update_rental_category2<TRes> {
  _CopyWithStubImpl$Mutation$update_rental_category2(this._res);

  TRes _res;

  call({
    Mutation$update_rental_category2$update_business_item_details?
        update_business_item_details,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$update_rental_category2$update_business_item_details<TRes>
      get update_business_item_details =>
          CopyWith$Mutation$update_rental_category2$update_business_item_details
              .stub(_res);
}

const documentNodeMutationupdate_rental_category2 = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'update_rental_category2'),
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
        variable: VariableNode(name: NameNode(value: 'category2')),
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
        name: NameNode(value: 'update_business_item_details'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'id'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'id')),
                  )
                ]),
              )
            ]),
          ),
          ArgumentNode(
            name: NameNode(value: '_set'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'category2'),
                value: VariableNode(name: NameNode(value: 'category2')),
              )
            ]),
          ),
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
Mutation$update_rental_category2 _parserFn$Mutation$update_rental_category2(
        Map<String, dynamic> data) =>
    Mutation$update_rental_category2.fromJson(data);
typedef OnMutationCompleted$Mutation$update_rental_category2 = FutureOr<void>
    Function(
  dynamic,
  Mutation$update_rental_category2?,
);

class Options$Mutation$update_rental_category2
    extends graphql.MutationOptions<Mutation$update_rental_category2> {
  Options$Mutation$update_rental_category2({
    String? operationName,
    required Variables$Mutation$update_rental_category2 variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$update_rental_category2? onCompleted,
    graphql.OnMutationUpdate<Mutation$update_rental_category2>? update,
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
                        : _parserFn$Mutation$update_rental_category2(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationupdate_rental_category2,
          parserFn: _parserFn$Mutation$update_rental_category2,
        );

  final OnMutationCompleted$Mutation$update_rental_category2?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$update_rental_category2
    extends graphql.WatchQueryOptions<Mutation$update_rental_category2> {
  WatchOptions$Mutation$update_rental_category2({
    String? operationName,
    required Variables$Mutation$update_rental_category2 variables,
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
          document: documentNodeMutationupdate_rental_category2,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$update_rental_category2,
        );
}

extension ClientExtension$Mutation$update_rental_category2
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$update_rental_category2>>
      mutate$update_rental_category2(
              Options$Mutation$update_rental_category2 options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$update_rental_category2>
      watchMutation$update_rental_category2(
              WatchOptions$Mutation$update_rental_category2 options) =>
          this.watchMutation(options);
}

class Mutation$update_rental_category2$update_business_item_details {
  Mutation$update_rental_category2$update_business_item_details({
    required this.affected_rows,
    required this.$__typename,
  });

  factory Mutation$update_rental_category2$update_business_item_details.fromJson(
      Map<String, dynamic> json) {
    final l$affected_rows = json['affected_rows'];
    final l$$__typename = json['__typename'];
    return Mutation$update_rental_category2$update_business_item_details(
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
            is Mutation$update_rental_category2$update_business_item_details) ||
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

extension UtilityExtension$Mutation$update_rental_category2$update_business_item_details
    on Mutation$update_rental_category2$update_business_item_details {
  CopyWith$Mutation$update_rental_category2$update_business_item_details<
          Mutation$update_rental_category2$update_business_item_details>
      get copyWith =>
          CopyWith$Mutation$update_rental_category2$update_business_item_details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$update_rental_category2$update_business_item_details<
    TRes> {
  factory CopyWith$Mutation$update_rental_category2$update_business_item_details(
    Mutation$update_rental_category2$update_business_item_details instance,
    TRes Function(Mutation$update_rental_category2$update_business_item_details)
        then,
  ) = _CopyWithImpl$Mutation$update_rental_category2$update_business_item_details;

  factory CopyWith$Mutation$update_rental_category2$update_business_item_details.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$update_rental_category2$update_business_item_details;

  TRes call({
    int? affected_rows,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$update_rental_category2$update_business_item_details<
        TRes>
    implements
        CopyWith$Mutation$update_rental_category2$update_business_item_details<
            TRes> {
  _CopyWithImpl$Mutation$update_rental_category2$update_business_item_details(
    this._instance,
    this._then,
  );

  final Mutation$update_rental_category2$update_business_item_details _instance;

  final TRes Function(
      Mutation$update_rental_category2$update_business_item_details) _then;

  static const _undefined = {};

  TRes call({
    Object? affected_rows = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$update_rental_category2$update_business_item_details(
        affected_rows: affected_rows == _undefined || affected_rows == null
            ? _instance.affected_rows
            : (affected_rows as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$update_rental_category2$update_business_item_details<
        TRes>
    implements
        CopyWith$Mutation$update_rental_category2$update_business_item_details<
            TRes> {
  _CopyWithStubImpl$Mutation$update_rental_category2$update_business_item_details(
      this._res);

  TRes _res;

  call({
    int? affected_rows,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$update_rental_category3 {
  factory Variables$Mutation$update_rental_category3({
    required int id,
    required String category3,
  }) =>
      Variables$Mutation$update_rental_category3._({
        r'id': id,
        r'category3': category3,
      });

  Variables$Mutation$update_rental_category3._(this._$data);

  factory Variables$Mutation$update_rental_category3.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as int);
    final l$category3 = data['category3'];
    result$data['category3'] = (l$category3 as String);
    return Variables$Mutation$update_rental_category3._(result$data);
  }

  Map<String, dynamic> _$data;

  int get id => (_$data['id'] as int);
  String get category3 => (_$data['category3'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    final l$category3 = category3;
    result$data['category3'] = l$category3;
    return result$data;
  }

  CopyWith$Variables$Mutation$update_rental_category3<
          Variables$Mutation$update_rental_category3>
      get copyWith => CopyWith$Variables$Mutation$update_rental_category3(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$update_rental_category3) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$category3 = category3;
    final lOther$category3 = other.category3;
    if (l$category3 != lOther$category3) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$category3 = category3;
    return Object.hashAll([
      l$id,
      l$category3,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$update_rental_category3<TRes> {
  factory CopyWith$Variables$Mutation$update_rental_category3(
    Variables$Mutation$update_rental_category3 instance,
    TRes Function(Variables$Mutation$update_rental_category3) then,
  ) = _CopyWithImpl$Variables$Mutation$update_rental_category3;

  factory CopyWith$Variables$Mutation$update_rental_category3.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$update_rental_category3;

  TRes call({
    int? id,
    String? category3,
  });
}

class _CopyWithImpl$Variables$Mutation$update_rental_category3<TRes>
    implements CopyWith$Variables$Mutation$update_rental_category3<TRes> {
  _CopyWithImpl$Variables$Mutation$update_rental_category3(
    this._instance,
    this._then,
  );

  final Variables$Mutation$update_rental_category3 _instance;

  final TRes Function(Variables$Mutation$update_rental_category3) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? category3 = _undefined,
  }) =>
      _then(Variables$Mutation$update_rental_category3._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as int),
        if (category3 != _undefined && category3 != null)
          'category3': (category3 as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$update_rental_category3<TRes>
    implements CopyWith$Variables$Mutation$update_rental_category3<TRes> {
  _CopyWithStubImpl$Variables$Mutation$update_rental_category3(this._res);

  TRes _res;

  call({
    int? id,
    String? category3,
  }) =>
      _res;
}

class Mutation$update_rental_category3 {
  Mutation$update_rental_category3({
    this.update_business_rental,
    required this.$__typename,
  });

  factory Mutation$update_rental_category3.fromJson(Map<String, dynamic> json) {
    final l$update_business_rental = json['update_business_rental'];
    final l$$__typename = json['__typename'];
    return Mutation$update_rental_category3(
      update_business_rental: l$update_business_rental == null
          ? null
          : Mutation$update_rental_category3$update_business_rental.fromJson(
              (l$update_business_rental as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$update_rental_category3$update_business_rental?
      update_business_rental;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$update_business_rental = update_business_rental;
    _resultData['update_business_rental'] = l$update_business_rental?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$update_business_rental = update_business_rental;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$update_business_rental,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$update_rental_category3) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$update_business_rental = update_business_rental;
    final lOther$update_business_rental = other.update_business_rental;
    if (l$update_business_rental != lOther$update_business_rental) {
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

extension UtilityExtension$Mutation$update_rental_category3
    on Mutation$update_rental_category3 {
  CopyWith$Mutation$update_rental_category3<Mutation$update_rental_category3>
      get copyWith => CopyWith$Mutation$update_rental_category3(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$update_rental_category3<TRes> {
  factory CopyWith$Mutation$update_rental_category3(
    Mutation$update_rental_category3 instance,
    TRes Function(Mutation$update_rental_category3) then,
  ) = _CopyWithImpl$Mutation$update_rental_category3;

  factory CopyWith$Mutation$update_rental_category3.stub(TRes res) =
      _CopyWithStubImpl$Mutation$update_rental_category3;

  TRes call({
    Mutation$update_rental_category3$update_business_rental?
        update_business_rental,
    String? $__typename,
  });
  CopyWith$Mutation$update_rental_category3$update_business_rental<TRes>
      get update_business_rental;
}

class _CopyWithImpl$Mutation$update_rental_category3<TRes>
    implements CopyWith$Mutation$update_rental_category3<TRes> {
  _CopyWithImpl$Mutation$update_rental_category3(
    this._instance,
    this._then,
  );

  final Mutation$update_rental_category3 _instance;

  final TRes Function(Mutation$update_rental_category3) _then;

  static const _undefined = {};

  TRes call({
    Object? update_business_rental = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$update_rental_category3(
        update_business_rental: update_business_rental == _undefined
            ? _instance.update_business_rental
            : (update_business_rental
                as Mutation$update_rental_category3$update_business_rental?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$update_rental_category3$update_business_rental<TRes>
      get update_business_rental {
    final local$update_business_rental = _instance.update_business_rental;
    return local$update_business_rental == null
        ? CopyWith$Mutation$update_rental_category3$update_business_rental.stub(
            _then(_instance))
        : CopyWith$Mutation$update_rental_category3$update_business_rental(
            local$update_business_rental,
            (e) => call(update_business_rental: e));
  }
}

class _CopyWithStubImpl$Mutation$update_rental_category3<TRes>
    implements CopyWith$Mutation$update_rental_category3<TRes> {
  _CopyWithStubImpl$Mutation$update_rental_category3(this._res);

  TRes _res;

  call({
    Mutation$update_rental_category3$update_business_rental?
        update_business_rental,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$update_rental_category3$update_business_rental<TRes>
      get update_business_rental =>
          CopyWith$Mutation$update_rental_category3$update_business_rental.stub(
              _res);
}

const documentNodeMutationupdate_rental_category3 = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'update_rental_category3'),
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
        variable: VariableNode(name: NameNode(value: 'category3')),
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
        name: NameNode(value: 'update_business_rental'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'details_id'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: '_eq'),
                    value: VariableNode(name: NameNode(value: 'id')),
                  )
                ]),
              )
            ]),
          ),
          ArgumentNode(
            name: NameNode(value: '_set'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'category3'),
                value: VariableNode(name: NameNode(value: 'category3')),
              )
            ]),
          ),
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
Mutation$update_rental_category3 _parserFn$Mutation$update_rental_category3(
        Map<String, dynamic> data) =>
    Mutation$update_rental_category3.fromJson(data);
typedef OnMutationCompleted$Mutation$update_rental_category3 = FutureOr<void>
    Function(
  dynamic,
  Mutation$update_rental_category3?,
);

class Options$Mutation$update_rental_category3
    extends graphql.MutationOptions<Mutation$update_rental_category3> {
  Options$Mutation$update_rental_category3({
    String? operationName,
    required Variables$Mutation$update_rental_category3 variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$update_rental_category3? onCompleted,
    graphql.OnMutationUpdate<Mutation$update_rental_category3>? update,
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
                        : _parserFn$Mutation$update_rental_category3(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationupdate_rental_category3,
          parserFn: _parserFn$Mutation$update_rental_category3,
        );

  final OnMutationCompleted$Mutation$update_rental_category3?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$update_rental_category3
    extends graphql.WatchQueryOptions<Mutation$update_rental_category3> {
  WatchOptions$Mutation$update_rental_category3({
    String? operationName,
    required Variables$Mutation$update_rental_category3 variables,
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
          document: documentNodeMutationupdate_rental_category3,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$update_rental_category3,
        );
}

extension ClientExtension$Mutation$update_rental_category3
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$update_rental_category3>>
      mutate$update_rental_category3(
              Options$Mutation$update_rental_category3 options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$update_rental_category3>
      watchMutation$update_rental_category3(
              WatchOptions$Mutation$update_rental_category3 options) =>
          this.watchMutation(options);
}

class Mutation$update_rental_category3$update_business_rental {
  Mutation$update_rental_category3$update_business_rental({
    required this.affected_rows,
    required this.$__typename,
  });

  factory Mutation$update_rental_category3$update_business_rental.fromJson(
      Map<String, dynamic> json) {
    final l$affected_rows = json['affected_rows'];
    final l$$__typename = json['__typename'];
    return Mutation$update_rental_category3$update_business_rental(
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
    if (!(other is Mutation$update_rental_category3$update_business_rental) ||
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

extension UtilityExtension$Mutation$update_rental_category3$update_business_rental
    on Mutation$update_rental_category3$update_business_rental {
  CopyWith$Mutation$update_rental_category3$update_business_rental<
          Mutation$update_rental_category3$update_business_rental>
      get copyWith =>
          CopyWith$Mutation$update_rental_category3$update_business_rental(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$update_rental_category3$update_business_rental<
    TRes> {
  factory CopyWith$Mutation$update_rental_category3$update_business_rental(
    Mutation$update_rental_category3$update_business_rental instance,
    TRes Function(Mutation$update_rental_category3$update_business_rental) then,
  ) = _CopyWithImpl$Mutation$update_rental_category3$update_business_rental;

  factory CopyWith$Mutation$update_rental_category3$update_business_rental.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$update_rental_category3$update_business_rental;

  TRes call({
    int? affected_rows,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$update_rental_category3$update_business_rental<
        TRes>
    implements
        CopyWith$Mutation$update_rental_category3$update_business_rental<TRes> {
  _CopyWithImpl$Mutation$update_rental_category3$update_business_rental(
    this._instance,
    this._then,
  );

  final Mutation$update_rental_category3$update_business_rental _instance;

  final TRes Function(Mutation$update_rental_category3$update_business_rental)
      _then;

  static const _undefined = {};

  TRes call({
    Object? affected_rows = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$update_rental_category3$update_business_rental(
        affected_rows: affected_rows == _undefined || affected_rows == null
            ? _instance.affected_rows
            : (affected_rows as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$update_rental_category3$update_business_rental<
        TRes>
    implements
        CopyWith$Mutation$update_rental_category3$update_business_rental<TRes> {
  _CopyWithStubImpl$Mutation$update_rental_category3$update_business_rental(
      this._res);

  TRes _res;

  call({
    int? affected_rows,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$delete_business_rental {
  factory Variables$Mutation$delete_business_rental({required int id}) =>
      Variables$Mutation$delete_business_rental._({
        r'id': id,
      });

  Variables$Mutation$delete_business_rental._(this._$data);

  factory Variables$Mutation$delete_business_rental.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as int);
    return Variables$Mutation$delete_business_rental._(result$data);
  }

  Map<String, dynamic> _$data;

  int get id => (_$data['id'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Mutation$delete_business_rental<
          Variables$Mutation$delete_business_rental>
      get copyWith => CopyWith$Variables$Mutation$delete_business_rental(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$delete_business_rental) ||
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

abstract class CopyWith$Variables$Mutation$delete_business_rental<TRes> {
  factory CopyWith$Variables$Mutation$delete_business_rental(
    Variables$Mutation$delete_business_rental instance,
    TRes Function(Variables$Mutation$delete_business_rental) then,
  ) = _CopyWithImpl$Variables$Mutation$delete_business_rental;

  factory CopyWith$Variables$Mutation$delete_business_rental.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$delete_business_rental;

  TRes call({int? id});
}

class _CopyWithImpl$Variables$Mutation$delete_business_rental<TRes>
    implements CopyWith$Variables$Mutation$delete_business_rental<TRes> {
  _CopyWithImpl$Variables$Mutation$delete_business_rental(
    this._instance,
    this._then,
  );

  final Variables$Mutation$delete_business_rental _instance;

  final TRes Function(Variables$Mutation$delete_business_rental) _then;

  static const _undefined = {};

  TRes call({Object? id = _undefined}) =>
      _then(Variables$Mutation$delete_business_rental._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as int),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$delete_business_rental<TRes>
    implements CopyWith$Variables$Mutation$delete_business_rental<TRes> {
  _CopyWithStubImpl$Variables$Mutation$delete_business_rental(this._res);

  TRes _res;

  call({int? id}) => _res;
}

class Mutation$delete_business_rental {
  Mutation$delete_business_rental({
    this.delete_business_rental_by_pk,
    required this.$__typename,
  });

  factory Mutation$delete_business_rental.fromJson(Map<String, dynamic> json) {
    final l$delete_business_rental_by_pk = json['delete_business_rental_by_pk'];
    final l$$__typename = json['__typename'];
    return Mutation$delete_business_rental(
      delete_business_rental_by_pk: l$delete_business_rental_by_pk == null
          ? null
          : Mutation$delete_business_rental$delete_business_rental_by_pk
              .fromJson(
                  (l$delete_business_rental_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Mutation$delete_business_rental$delete_business_rental_by_pk?
      delete_business_rental_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$delete_business_rental_by_pk = delete_business_rental_by_pk;
    _resultData['delete_business_rental_by_pk'] =
        l$delete_business_rental_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$delete_business_rental_by_pk = delete_business_rental_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$delete_business_rental_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$delete_business_rental) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$delete_business_rental_by_pk = delete_business_rental_by_pk;
    final lOther$delete_business_rental_by_pk =
        other.delete_business_rental_by_pk;
    if (l$delete_business_rental_by_pk != lOther$delete_business_rental_by_pk) {
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

extension UtilityExtension$Mutation$delete_business_rental
    on Mutation$delete_business_rental {
  CopyWith$Mutation$delete_business_rental<Mutation$delete_business_rental>
      get copyWith => CopyWith$Mutation$delete_business_rental(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$delete_business_rental<TRes> {
  factory CopyWith$Mutation$delete_business_rental(
    Mutation$delete_business_rental instance,
    TRes Function(Mutation$delete_business_rental) then,
  ) = _CopyWithImpl$Mutation$delete_business_rental;

  factory CopyWith$Mutation$delete_business_rental.stub(TRes res) =
      _CopyWithStubImpl$Mutation$delete_business_rental;

  TRes call({
    Mutation$delete_business_rental$delete_business_rental_by_pk?
        delete_business_rental_by_pk,
    String? $__typename,
  });
  CopyWith$Mutation$delete_business_rental$delete_business_rental_by_pk<TRes>
      get delete_business_rental_by_pk;
}

class _CopyWithImpl$Mutation$delete_business_rental<TRes>
    implements CopyWith$Mutation$delete_business_rental<TRes> {
  _CopyWithImpl$Mutation$delete_business_rental(
    this._instance,
    this._then,
  );

  final Mutation$delete_business_rental _instance;

  final TRes Function(Mutation$delete_business_rental) _then;

  static const _undefined = {};

  TRes call({
    Object? delete_business_rental_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$delete_business_rental(
        delete_business_rental_by_pk: delete_business_rental_by_pk == _undefined
            ? _instance.delete_business_rental_by_pk
            : (delete_business_rental_by_pk
                as Mutation$delete_business_rental$delete_business_rental_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$delete_business_rental$delete_business_rental_by_pk<TRes>
      get delete_business_rental_by_pk {
    final local$delete_business_rental_by_pk =
        _instance.delete_business_rental_by_pk;
    return local$delete_business_rental_by_pk == null
        ? CopyWith$Mutation$delete_business_rental$delete_business_rental_by_pk
            .stub(_then(_instance))
        : CopyWith$Mutation$delete_business_rental$delete_business_rental_by_pk(
            local$delete_business_rental_by_pk,
            (e) => call(delete_business_rental_by_pk: e));
  }
}

class _CopyWithStubImpl$Mutation$delete_business_rental<TRes>
    implements CopyWith$Mutation$delete_business_rental<TRes> {
  _CopyWithStubImpl$Mutation$delete_business_rental(this._res);

  TRes _res;

  call({
    Mutation$delete_business_rental$delete_business_rental_by_pk?
        delete_business_rental_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$delete_business_rental$delete_business_rental_by_pk<TRes>
      get delete_business_rental_by_pk =>
          CopyWith$Mutation$delete_business_rental$delete_business_rental_by_pk
              .stub(_res);
}

const documentNodeMutationdelete_business_rental = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'delete_business_rental'),
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
        name: NameNode(value: 'delete_business_rental_by_pk'),
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
Mutation$delete_business_rental _parserFn$Mutation$delete_business_rental(
        Map<String, dynamic> data) =>
    Mutation$delete_business_rental.fromJson(data);
typedef OnMutationCompleted$Mutation$delete_business_rental = FutureOr<void>
    Function(
  dynamic,
  Mutation$delete_business_rental?,
);

class Options$Mutation$delete_business_rental
    extends graphql.MutationOptions<Mutation$delete_business_rental> {
  Options$Mutation$delete_business_rental({
    String? operationName,
    required Variables$Mutation$delete_business_rental variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$delete_business_rental? onCompleted,
    graphql.OnMutationUpdate<Mutation$delete_business_rental>? update,
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
                        : _parserFn$Mutation$delete_business_rental(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationdelete_business_rental,
          parserFn: _parserFn$Mutation$delete_business_rental,
        );

  final OnMutationCompleted$Mutation$delete_business_rental?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$delete_business_rental
    extends graphql.WatchQueryOptions<Mutation$delete_business_rental> {
  WatchOptions$Mutation$delete_business_rental({
    String? operationName,
    required Variables$Mutation$delete_business_rental variables,
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
          document: documentNodeMutationdelete_business_rental,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$delete_business_rental,
        );
}

extension ClientExtension$Mutation$delete_business_rental
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$delete_business_rental>>
      mutate$delete_business_rental(
              Options$Mutation$delete_business_rental options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$delete_business_rental>
      watchMutation$delete_business_rental(
              WatchOptions$Mutation$delete_business_rental options) =>
          this.watchMutation(options);
}

class Mutation$delete_business_rental$delete_business_rental_by_pk {
  Mutation$delete_business_rental$delete_business_rental_by_pk({
    required this.id,
    required this.$__typename,
  });

  factory Mutation$delete_business_rental$delete_business_rental_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Mutation$delete_business_rental$delete_business_rental_by_pk(
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
            is Mutation$delete_business_rental$delete_business_rental_by_pk) ||
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

extension UtilityExtension$Mutation$delete_business_rental$delete_business_rental_by_pk
    on Mutation$delete_business_rental$delete_business_rental_by_pk {
  CopyWith$Mutation$delete_business_rental$delete_business_rental_by_pk<
          Mutation$delete_business_rental$delete_business_rental_by_pk>
      get copyWith =>
          CopyWith$Mutation$delete_business_rental$delete_business_rental_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$delete_business_rental$delete_business_rental_by_pk<
    TRes> {
  factory CopyWith$Mutation$delete_business_rental$delete_business_rental_by_pk(
    Mutation$delete_business_rental$delete_business_rental_by_pk instance,
    TRes Function(Mutation$delete_business_rental$delete_business_rental_by_pk)
        then,
  ) = _CopyWithImpl$Mutation$delete_business_rental$delete_business_rental_by_pk;

  factory CopyWith$Mutation$delete_business_rental$delete_business_rental_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$delete_business_rental$delete_business_rental_by_pk;

  TRes call({
    int? id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$delete_business_rental$delete_business_rental_by_pk<
        TRes>
    implements
        CopyWith$Mutation$delete_business_rental$delete_business_rental_by_pk<
            TRes> {
  _CopyWithImpl$Mutation$delete_business_rental$delete_business_rental_by_pk(
    this._instance,
    this._then,
  );

  final Mutation$delete_business_rental$delete_business_rental_by_pk _instance;

  final TRes Function(
      Mutation$delete_business_rental$delete_business_rental_by_pk) _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$delete_business_rental$delete_business_rental_by_pk(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$delete_business_rental$delete_business_rental_by_pk<
        TRes>
    implements
        CopyWith$Mutation$delete_business_rental$delete_business_rental_by_pk<
            TRes> {
  _CopyWithStubImpl$Mutation$delete_business_rental$delete_business_rental_by_pk(
      this._res);

  TRes _res;

  call({
    int? id,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$getHomeRentalOrderRequest {
  factory Variables$Query$getHomeRentalOrderRequest({required int orderId}) =>
      Variables$Query$getHomeRentalOrderRequest._({
        r'orderId': orderId,
      });

  Variables$Query$getHomeRentalOrderRequest._(this._$data);

  factory Variables$Query$getHomeRentalOrderRequest.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$orderId = data['orderId'];
    result$data['orderId'] = (l$orderId as int);
    return Variables$Query$getHomeRentalOrderRequest._(result$data);
  }

  Map<String, dynamic> _$data;

  int get orderId => (_$data['orderId'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$orderId = orderId;
    result$data['orderId'] = l$orderId;
    return result$data;
  }

  CopyWith$Variables$Query$getHomeRentalOrderRequest<
          Variables$Query$getHomeRentalOrderRequest>
      get copyWith => CopyWith$Variables$Query$getHomeRentalOrderRequest(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getHomeRentalOrderRequest) ||
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

abstract class CopyWith$Variables$Query$getHomeRentalOrderRequest<TRes> {
  factory CopyWith$Variables$Query$getHomeRentalOrderRequest(
    Variables$Query$getHomeRentalOrderRequest instance,
    TRes Function(Variables$Query$getHomeRentalOrderRequest) then,
  ) = _CopyWithImpl$Variables$Query$getHomeRentalOrderRequest;

  factory CopyWith$Variables$Query$getHomeRentalOrderRequest.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getHomeRentalOrderRequest;

  TRes call({int? orderId});
}

class _CopyWithImpl$Variables$Query$getHomeRentalOrderRequest<TRes>
    implements CopyWith$Variables$Query$getHomeRentalOrderRequest<TRes> {
  _CopyWithImpl$Variables$Query$getHomeRentalOrderRequest(
    this._instance,
    this._then,
  );

  final Variables$Query$getHomeRentalOrderRequest _instance;

  final TRes Function(Variables$Query$getHomeRentalOrderRequest) _then;

  static const _undefined = {};

  TRes call({Object? orderId = _undefined}) =>
      _then(Variables$Query$getHomeRentalOrderRequest._({
        ..._instance._$data,
        if (orderId != _undefined && orderId != null)
          'orderId': (orderId as int),
      }));
}

class _CopyWithStubImpl$Variables$Query$getHomeRentalOrderRequest<TRes>
    implements CopyWith$Variables$Query$getHomeRentalOrderRequest<TRes> {
  _CopyWithStubImpl$Variables$Query$getHomeRentalOrderRequest(this._res);

  TRes _res;

  call({int? orderId}) => _res;
}

class Query$getHomeRentalOrderRequest {
  Query$getHomeRentalOrderRequest({
    this.business_order_request_by_pk,
    required this.$__typename,
  });

  factory Query$getHomeRentalOrderRequest.fromJson(Map<String, dynamic> json) {
    final l$business_order_request_by_pk = json['business_order_request_by_pk'];
    final l$$__typename = json['__typename'];
    return Query$getHomeRentalOrderRequest(
      business_order_request_by_pk: l$business_order_request_by_pk == null
          ? null
          : Query$getHomeRentalOrderRequest$business_order_request_by_pk
              .fromJson(
                  (l$business_order_request_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Query$getHomeRentalOrderRequest$business_order_request_by_pk?
      business_order_request_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$business_order_request_by_pk = business_order_request_by_pk;
    _resultData['business_order_request_by_pk'] =
        l$business_order_request_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$business_order_request_by_pk = business_order_request_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$business_order_request_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getHomeRentalOrderRequest) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$business_order_request_by_pk = business_order_request_by_pk;
    final lOther$business_order_request_by_pk =
        other.business_order_request_by_pk;
    if (l$business_order_request_by_pk != lOther$business_order_request_by_pk) {
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

extension UtilityExtension$Query$getHomeRentalOrderRequest
    on Query$getHomeRentalOrderRequest {
  CopyWith$Query$getHomeRentalOrderRequest<Query$getHomeRentalOrderRequest>
      get copyWith => CopyWith$Query$getHomeRentalOrderRequest(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getHomeRentalOrderRequest<TRes> {
  factory CopyWith$Query$getHomeRentalOrderRequest(
    Query$getHomeRentalOrderRequest instance,
    TRes Function(Query$getHomeRentalOrderRequest) then,
  ) = _CopyWithImpl$Query$getHomeRentalOrderRequest;

  factory CopyWith$Query$getHomeRentalOrderRequest.stub(TRes res) =
      _CopyWithStubImpl$Query$getHomeRentalOrderRequest;

  TRes call({
    Query$getHomeRentalOrderRequest$business_order_request_by_pk?
        business_order_request_by_pk,
    String? $__typename,
  });
  CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk<TRes>
      get business_order_request_by_pk;
}

class _CopyWithImpl$Query$getHomeRentalOrderRequest<TRes>
    implements CopyWith$Query$getHomeRentalOrderRequest<TRes> {
  _CopyWithImpl$Query$getHomeRentalOrderRequest(
    this._instance,
    this._then,
  );

  final Query$getHomeRentalOrderRequest _instance;

  final TRes Function(Query$getHomeRentalOrderRequest) _then;

  static const _undefined = {};

  TRes call({
    Object? business_order_request_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getHomeRentalOrderRequest(
        business_order_request_by_pk: business_order_request_by_pk == _undefined
            ? _instance.business_order_request_by_pk
            : (business_order_request_by_pk
                as Query$getHomeRentalOrderRequest$business_order_request_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk<TRes>
      get business_order_request_by_pk {
    final local$business_order_request_by_pk =
        _instance.business_order_request_by_pk;
    return local$business_order_request_by_pk == null
        ? CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk
            .stub(_then(_instance))
        : CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk(
            local$business_order_request_by_pk,
            (e) => call(business_order_request_by_pk: e));
  }
}

class _CopyWithStubImpl$Query$getHomeRentalOrderRequest<TRes>
    implements CopyWith$Query$getHomeRentalOrderRequest<TRes> {
  _CopyWithStubImpl$Query$getHomeRentalOrderRequest(this._res);

  TRes _res;

  call({
    Query$getHomeRentalOrderRequest$business_order_request_by_pk?
        business_order_request_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk<TRes>
      get business_order_request_by_pk =>
          CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk
              .stub(_res);
}

const documentNodeQuerygetHomeRentalOrderRequest = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getHomeRentalOrderRequest'),
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
        name: NameNode(value: 'business_order_request_by_pk'),
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
            name: NameNode(value: 'business_id'),
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
            name: NameNode(value: 'customer_app_type'),
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
                name: NameNode(value: 'details_id'),
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
            name: NameNode(value: 'customer'),
            alias: null,
            arguments: [],
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
            name: NameNode(value: 'chat_id'),
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
            name: NameNode(value: 'status'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'review_id'),
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
            name: NameNode(value: 'notes'),
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
            name: NameNode(value: 'items'),
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
                name: NameNode(value: 'order_request_id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'offering_type'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'item_id'),
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
                name: NameNode(value: 'parameters'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'rental'),
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
                        name: NameNode(value: 'category1'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'category2'),
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
                        name: NameNode(value: 'tags'),
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
                name: NameNode(value: 'time'),
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
Query$getHomeRentalOrderRequest _parserFn$Query$getHomeRentalOrderRequest(
        Map<String, dynamic> data) =>
    Query$getHomeRentalOrderRequest.fromJson(data);

class Options$Query$getHomeRentalOrderRequest
    extends graphql.QueryOptions<Query$getHomeRentalOrderRequest> {
  Options$Query$getHomeRentalOrderRequest({
    String? operationName,
    required Variables$Query$getHomeRentalOrderRequest variables,
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
          document: documentNodeQuerygetHomeRentalOrderRequest,
          parserFn: _parserFn$Query$getHomeRentalOrderRequest,
        );
}

class WatchOptions$Query$getHomeRentalOrderRequest
    extends graphql.WatchQueryOptions<Query$getHomeRentalOrderRequest> {
  WatchOptions$Query$getHomeRentalOrderRequest({
    String? operationName,
    required Variables$Query$getHomeRentalOrderRequest variables,
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
          document: documentNodeQuerygetHomeRentalOrderRequest,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getHomeRentalOrderRequest,
        );
}

class FetchMoreOptions$Query$getHomeRentalOrderRequest
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getHomeRentalOrderRequest({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getHomeRentalOrderRequest variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetHomeRentalOrderRequest,
        );
}

extension ClientExtension$Query$getHomeRentalOrderRequest
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getHomeRentalOrderRequest>>
      query$getHomeRentalOrderRequest(
              Options$Query$getHomeRentalOrderRequest options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$getHomeRentalOrderRequest>
      watchQuery$getHomeRentalOrderRequest(
              WatchOptions$Query$getHomeRentalOrderRequest options) =>
          this.watchQuery(options);
  void writeQuery$getHomeRentalOrderRequest({
    required Query$getHomeRentalOrderRequest data,
    required Variables$Query$getHomeRentalOrderRequest variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQuerygetHomeRentalOrderRequest),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getHomeRentalOrderRequest? readQuery$getHomeRentalOrderRequest({
    required Variables$Query$getHomeRentalOrderRequest variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQuerygetHomeRentalOrderRequest),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$getHomeRentalOrderRequest.fromJson(result);
  }
}

class Query$getHomeRentalOrderRequest$business_order_request_by_pk {
  Query$getHomeRentalOrderRequest$business_order_request_by_pk({
    required this.business_id,
    required this.customer_id,
    required this.customer_app_type,
    required this.business,
    required this.customer,
    this.chat_id,
    this.cost,
    required this.status,
    this.review_id,
    required this.order_time,
    this.notes,
    required this.id,
    required this.items,
    required this.$__typename,
  });

  factory Query$getHomeRentalOrderRequest$business_order_request_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$business_id = json['business_id'];
    final l$customer_id = json['customer_id'];
    final l$customer_app_type = json['customer_app_type'];
    final l$business = json['business'];
    final l$customer = json['customer'];
    final l$chat_id = json['chat_id'];
    final l$cost = json['cost'];
    final l$status = json['status'];
    final l$review_id = json['review_id'];
    final l$order_time = json['order_time'];
    final l$notes = json['notes'];
    final l$id = json['id'];
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Query$getHomeRentalOrderRequest$business_order_request_by_pk(
      business_id: (l$business_id as int),
      customer_id: (l$customer_id as int),
      customer_app_type: (l$customer_app_type as String),
      business:
          Query$getHomeRentalOrderRequest$business_order_request_by_pk$business
              .fromJson((l$business as Map<String, dynamic>)),
      customer:
          Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer
              .fromJson((l$customer as Map<String, dynamic>)),
      chat_id: (l$chat_id as int?),
      cost: l$cost == null ? null : moneyFromJson(l$cost),
      status: (l$status as String),
      review_id: (l$review_id as int?),
      order_time: (l$order_time as String),
      notes: (l$notes as String?),
      id: (l$id as int),
      items: (l$items as List<dynamic>)
          .map((e) =>
              Query$getHomeRentalOrderRequest$business_order_request_by_pk$items
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int business_id;

  final int customer_id;

  final String customer_app_type;

  final Query$getHomeRentalOrderRequest$business_order_request_by_pk$business
      business;

  final Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer
      customer;

  final int? chat_id;

  final double? cost;

  final String status;

  final int? review_id;

  final String order_time;

  final String? notes;

  final int id;

  final List<Query$getHomeRentalOrderRequest$business_order_request_by_pk$items>
      items;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$business_id = business_id;
    _resultData['business_id'] = l$business_id;
    final l$customer_id = customer_id;
    _resultData['customer_id'] = l$customer_id;
    final l$customer_app_type = customer_app_type;
    _resultData['customer_app_type'] = l$customer_app_type;
    final l$business = business;
    _resultData['business'] = l$business.toJson();
    final l$customer = customer;
    _resultData['customer'] = l$customer.toJson();
    final l$chat_id = chat_id;
    _resultData['chat_id'] = l$chat_id;
    final l$cost = cost;
    _resultData['cost'] = l$cost == null ? null : moneyToJson(l$cost);
    final l$status = status;
    _resultData['status'] = l$status;
    final l$review_id = review_id;
    _resultData['review_id'] = l$review_id;
    final l$order_time = order_time;
    _resultData['order_time'] = l$order_time;
    final l$notes = notes;
    _resultData['notes'] = l$notes;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$items = items;
    _resultData['items'] = l$items.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$business_id = business_id;
    final l$customer_id = customer_id;
    final l$customer_app_type = customer_app_type;
    final l$business = business;
    final l$customer = customer;
    final l$chat_id = chat_id;
    final l$cost = cost;
    final l$status = status;
    final l$review_id = review_id;
    final l$order_time = order_time;
    final l$notes = notes;
    final l$id = id;
    final l$items = items;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$business_id,
      l$customer_id,
      l$customer_app_type,
      l$business,
      l$customer,
      l$chat_id,
      l$cost,
      l$status,
      l$review_id,
      l$order_time,
      l$notes,
      l$id,
      Object.hashAll(l$items.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$getHomeRentalOrderRequest$business_order_request_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$business_id = business_id;
    final lOther$business_id = other.business_id;
    if (l$business_id != lOther$business_id) {
      return false;
    }
    final l$customer_id = customer_id;
    final lOther$customer_id = other.customer_id;
    if (l$customer_id != lOther$customer_id) {
      return false;
    }
    final l$customer_app_type = customer_app_type;
    final lOther$customer_app_type = other.customer_app_type;
    if (l$customer_app_type != lOther$customer_app_type) {
      return false;
    }
    final l$business = business;
    final lOther$business = other.business;
    if (l$business != lOther$business) {
      return false;
    }
    final l$customer = customer;
    final lOther$customer = other.customer;
    if (l$customer != lOther$customer) {
      return false;
    }
    final l$chat_id = chat_id;
    final lOther$chat_id = other.chat_id;
    if (l$chat_id != lOther$chat_id) {
      return false;
    }
    final l$cost = cost;
    final lOther$cost = other.cost;
    if (l$cost != lOther$cost) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$review_id = review_id;
    final lOther$review_id = other.review_id;
    if (l$review_id != lOther$review_id) {
      return false;
    }
    final l$order_time = order_time;
    final lOther$order_time = other.order_time;
    if (l$order_time != lOther$order_time) {
      return false;
    }
    final l$notes = notes;
    final lOther$notes = other.notes;
    if (l$notes != lOther$notes) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$items = items;
    final lOther$items = other.items;
    if (l$items.length != lOther$items.length) {
      return false;
    }
    for (int i = 0; i < l$items.length; i++) {
      final l$items$entry = l$items[i];
      final lOther$items$entry = lOther$items[i];
      if (l$items$entry != lOther$items$entry) {
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

extension UtilityExtension$Query$getHomeRentalOrderRequest$business_order_request_by_pk
    on Query$getHomeRentalOrderRequest$business_order_request_by_pk {
  CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk<
          Query$getHomeRentalOrderRequest$business_order_request_by_pk>
      get copyWith =>
          CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk<
    TRes> {
  factory CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk(
    Query$getHomeRentalOrderRequest$business_order_request_by_pk instance,
    TRes Function(Query$getHomeRentalOrderRequest$business_order_request_by_pk)
        then,
  ) = _CopyWithImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk;

  factory CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk;

  TRes call({
    int? business_id,
    int? customer_id,
    String? customer_app_type,
    Query$getHomeRentalOrderRequest$business_order_request_by_pk$business?
        business,
    Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer?
        customer,
    int? chat_id,
    double? cost,
    String? status,
    int? review_id,
    String? order_time,
    String? notes,
    int? id,
    List<Query$getHomeRentalOrderRequest$business_order_request_by_pk$items>?
        items,
    String? $__typename,
  });
  CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$business<
      TRes> get business;
  CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer<
      TRes> get customer;
  TRes items(
      Iterable<Query$getHomeRentalOrderRequest$business_order_request_by_pk$items> Function(
              Iterable<
                  CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items<
                      Query$getHomeRentalOrderRequest$business_order_request_by_pk$items>>)
          _fn);
}

class _CopyWithImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk<
        TRes>
    implements
        CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk<
            TRes> {
  _CopyWithImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk(
    this._instance,
    this._then,
  );

  final Query$getHomeRentalOrderRequest$business_order_request_by_pk _instance;

  final TRes Function(
      Query$getHomeRentalOrderRequest$business_order_request_by_pk) _then;

  static const _undefined = {};

  TRes call({
    Object? business_id = _undefined,
    Object? customer_id = _undefined,
    Object? customer_app_type = _undefined,
    Object? business = _undefined,
    Object? customer = _undefined,
    Object? chat_id = _undefined,
    Object? cost = _undefined,
    Object? status = _undefined,
    Object? review_id = _undefined,
    Object? order_time = _undefined,
    Object? notes = _undefined,
    Object? id = _undefined,
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getHomeRentalOrderRequest$business_order_request_by_pk(
        business_id: business_id == _undefined || business_id == null
            ? _instance.business_id
            : (business_id as int),
        customer_id: customer_id == _undefined || customer_id == null
            ? _instance.customer_id
            : (customer_id as int),
        customer_app_type:
            customer_app_type == _undefined || customer_app_type == null
                ? _instance.customer_app_type
                : (customer_app_type as String),
        business: business == _undefined || business == null
            ? _instance.business
            : (business
                as Query$getHomeRentalOrderRequest$business_order_request_by_pk$business),
        customer: customer == _undefined || customer == null
            ? _instance.customer
            : (customer
                as Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer),
        chat_id: chat_id == _undefined ? _instance.chat_id : (chat_id as int?),
        cost: cost == _undefined ? _instance.cost : (cost as double?),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as String),
        review_id:
            review_id == _undefined ? _instance.review_id : (review_id as int?),
        order_time: order_time == _undefined || order_time == null
            ? _instance.order_time
            : (order_time as String),
        notes: notes == _undefined ? _instance.notes : (notes as String?),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<
                Query$getHomeRentalOrderRequest$business_order_request_by_pk$items>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$business<
      TRes> get business {
    final local$business = _instance.business;
    return CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$business(
        local$business, (e) => call(business: e));
  }

  CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer<
      TRes> get customer {
    final local$customer = _instance.customer;
    return CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer(
        local$customer, (e) => call(customer: e));
  }

  TRes items(
          Iterable<Query$getHomeRentalOrderRequest$business_order_request_by_pk$items> Function(
                  Iterable<
                      CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items<
                          Query$getHomeRentalOrderRequest$business_order_request_by_pk$items>>)
              _fn) =>
      call(
          items: _fn(_instance.items.map((e) =>
              CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk<
        TRes>
    implements
        CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk<
            TRes> {
  _CopyWithStubImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk(
      this._res);

  TRes _res;

  call({
    int? business_id,
    int? customer_id,
    String? customer_app_type,
    Query$getHomeRentalOrderRequest$business_order_request_by_pk$business?
        business,
    Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer?
        customer,
    int? chat_id,
    double? cost,
    String? status,
    int? review_id,
    String? order_time,
    String? notes,
    int? id,
    List<Query$getHomeRentalOrderRequest$business_order_request_by_pk$items>?
        items,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$business<
          TRes>
      get business =>
          CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$business
              .stub(_res);
  CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer<
          TRes>
      get customer =>
          CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer
              .stub(_res);
  items(_fn) => _res;
}

class Query$getHomeRentalOrderRequest$business_order_request_by_pk$business {
  Query$getHomeRentalOrderRequest$business_order_request_by_pk$business({
    required this.details_id,
    required this.$__typename,
  });

  factory Query$getHomeRentalOrderRequest$business_order_request_by_pk$business.fromJson(
      Map<String, dynamic> json) {
    final l$details_id = json['details_id'];
    final l$$__typename = json['__typename'];
    return Query$getHomeRentalOrderRequest$business_order_request_by_pk$business(
      details_id: (l$details_id as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int details_id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$details_id = details_id;
    _resultData['details_id'] = l$details_id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$details_id = details_id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$details_id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$getHomeRentalOrderRequest$business_order_request_by_pk$business) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$details_id = details_id;
    final lOther$details_id = other.details_id;
    if (l$details_id != lOther$details_id) {
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

extension UtilityExtension$Query$getHomeRentalOrderRequest$business_order_request_by_pk$business
    on Query$getHomeRentalOrderRequest$business_order_request_by_pk$business {
  CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$business<
          Query$getHomeRentalOrderRequest$business_order_request_by_pk$business>
      get copyWith =>
          CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$business(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$business<
    TRes> {
  factory CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$business(
    Query$getHomeRentalOrderRequest$business_order_request_by_pk$business
        instance,
    TRes Function(
            Query$getHomeRentalOrderRequest$business_order_request_by_pk$business)
        then,
  ) = _CopyWithImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$business;

  factory CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$business.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$business;

  TRes call({
    int? details_id,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$business<
        TRes>
    implements
        CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$business<
            TRes> {
  _CopyWithImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$business(
    this._instance,
    this._then,
  );

  final Query$getHomeRentalOrderRequest$business_order_request_by_pk$business
      _instance;

  final TRes Function(
          Query$getHomeRentalOrderRequest$business_order_request_by_pk$business)
      _then;

  static const _undefined = {};

  TRes call({
    Object? details_id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getHomeRentalOrderRequest$business_order_request_by_pk$business(
        details_id: details_id == _undefined || details_id == null
            ? _instance.details_id
            : (details_id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$business<
        TRes>
    implements
        CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$business<
            TRes> {
  _CopyWithStubImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$business(
      this._res);

  TRes _res;

  call({
    int? details_id,
    String? $__typename,
  }) =>
      _res;
}

class Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer {
  Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer({
    required this.user_id,
    required this.user,
    required this.$__typename,
  });

  factory Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer.fromJson(
      Map<String, dynamic> json) {
    final l$user_id = json['user_id'];
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer(
      user_id: (l$user_id as int),
      user:
          Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer$user
              .fromJson((l$user as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int user_id;

  final Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer$user
      user;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$user_id = user_id;
    _resultData['user_id'] = l$user_id;
    final l$user = user;
    _resultData['user'] = l$user.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$user_id = user_id;
    final l$user = user;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$user_id,
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
            is Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$user_id = user_id;
    final lOther$user_id = other.user_id;
    if (l$user_id != lOther$user_id) {
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

extension UtilityExtension$Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer
    on Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer {
  CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer<
          Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer>
      get copyWith =>
          CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer<
    TRes> {
  factory CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer(
    Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer
        instance,
    TRes Function(
            Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer)
        then,
  ) = _CopyWithImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer;

  factory CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer;

  TRes call({
    int? user_id,
    Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer$user?
        user,
    String? $__typename,
  });
  CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer$user<
      TRes> get user;
}

class _CopyWithImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer<
        TRes>
    implements
        CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer<
            TRes> {
  _CopyWithImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer(
    this._instance,
    this._then,
  );

  final Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer
      _instance;

  final TRes Function(
          Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer)
      _then;

  static const _undefined = {};

  TRes call({
    Object? user_id = _undefined,
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer(
        user_id: user_id == _undefined || user_id == null
            ? _instance.user_id
            : (user_id as int),
        user: user == _undefined || user == null
            ? _instance.user
            : (user
                as Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer$user<
      TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer<
        TRes>
    implements
        CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer<
            TRes> {
  _CopyWithStubImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer(
      this._res);

  TRes _res;

  call({
    int? user_id,
    Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer$user?
        user,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer$user<
          TRes>
      get user =>
          CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer$user
              .stub(_res);
}

class Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer$user {
  Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer$user({
    this.name,
    required this.firebase_id,
    this.image,
    required this.$__typename,
  });

  factory Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer$user.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$firebase_id = json['firebase_id'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer$user(
      name: (l$name as String?),
      firebase_id: (l$firebase_id as String),
      image: (l$image as String?),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String? name;

  final String firebase_id;

  final String? image;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name = name;
    _resultData['name'] = l$name;
    final l$firebase_id = firebase_id;
    _resultData['firebase_id'] = l$firebase_id;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$firebase_id = firebase_id;
    final l$image = image;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$name,
      l$firebase_id,
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
            is Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer$user) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer$user
    on Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer$user {
  CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer$user<
          Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer$user>
      get copyWith =>
          CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer$user<
    TRes> {
  factory CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer$user(
    Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer$user
        instance,
    TRes Function(
            Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer$user)
        then,
  ) = _CopyWithImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer$user;

  factory CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer$user.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer$user;

  TRes call({
    String? name,
    String? firebase_id,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer$user<
        TRes>
    implements
        CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer$user<
            TRes> {
  _CopyWithImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer$user(
    this._instance,
    this._then,
  );

  final Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer$user
      _instance;

  final TRes Function(
          Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer$user)
      _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? firebase_id = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer$user(
        name: name == _undefined ? _instance.name : (name as String?),
        firebase_id: firebase_id == _undefined || firebase_id == null
            ? _instance.firebase_id
            : (firebase_id as String),
        image: image == _undefined ? _instance.image : (image as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer$user<
        TRes>
    implements
        CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer$user<
            TRes> {
  _CopyWithStubImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$customer$user(
      this._res);

  TRes _res;

  call({
    String? name,
    String? firebase_id,
    String? image,
    String? $__typename,
  }) =>
      _res;
}

class Query$getHomeRentalOrderRequest$business_order_request_by_pk$items {
  Query$getHomeRentalOrderRequest$business_order_request_by_pk$items({
    required this.available,
    required this.cost,
    required this.order_request_id,
    required this.offering_type,
    required this.item_id,
    required this.id,
    required this.parameters,
    this.rental,
    this.time,
    required this.$__typename,
  });

  factory Query$getHomeRentalOrderRequest$business_order_request_by_pk$items.fromJson(
      Map<String, dynamic> json) {
    final l$available = json['available'];
    final l$cost = json['cost'];
    final l$order_request_id = json['order_request_id'];
    final l$offering_type = json['offering_type'];
    final l$item_id = json['item_id'];
    final l$id = json['id'];
    final l$parameters = json['parameters'];
    final l$rental = json['rental'];
    final l$time = json['time'];
    final l$$__typename = json['__typename'];
    return Query$getHomeRentalOrderRequest$business_order_request_by_pk$items(
      available: (l$available as bool),
      cost: moneyFromJson(l$cost),
      order_request_id: (l$order_request_id as int),
      offering_type: (l$offering_type as String),
      item_id: (l$item_id as int),
      id: (l$id as int),
      parameters: mapFromJson(l$parameters),
      rental: l$rental == null
          ? null
          : Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental
              .fromJson((l$rental as Map<String, dynamic>)),
      time: (l$time as String?),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final bool available;

  final double cost;

  final int order_request_id;

  final String offering_type;

  final int item_id;

  final int id;

  final dynamic parameters;

  final Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental?
      rental;

  final String? time;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$available = available;
    _resultData['available'] = l$available;
    final l$cost = cost;
    _resultData['cost'] = moneyToJson(l$cost);
    final l$order_request_id = order_request_id;
    _resultData['order_request_id'] = l$order_request_id;
    final l$offering_type = offering_type;
    _resultData['offering_type'] = l$offering_type;
    final l$item_id = item_id;
    _resultData['item_id'] = l$item_id;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$parameters = parameters;
    _resultData['parameters'] = mapToJson(l$parameters);
    final l$rental = rental;
    _resultData['rental'] = l$rental?.toJson();
    final l$time = time;
    _resultData['time'] = l$time;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$available = available;
    final l$cost = cost;
    final l$order_request_id = order_request_id;
    final l$offering_type = offering_type;
    final l$item_id = item_id;
    final l$id = id;
    final l$parameters = parameters;
    final l$rental = rental;
    final l$time = time;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$available,
      l$cost,
      l$order_request_id,
      l$offering_type,
      l$item_id,
      l$id,
      l$parameters,
      l$rental,
      l$time,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$getHomeRentalOrderRequest$business_order_request_by_pk$items) ||
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
    final l$order_request_id = order_request_id;
    final lOther$order_request_id = other.order_request_id;
    if (l$order_request_id != lOther$order_request_id) {
      return false;
    }
    final l$offering_type = offering_type;
    final lOther$offering_type = other.offering_type;
    if (l$offering_type != lOther$offering_type) {
      return false;
    }
    final l$item_id = item_id;
    final lOther$item_id = other.item_id;
    if (l$item_id != lOther$item_id) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$parameters = parameters;
    final lOther$parameters = other.parameters;
    if (l$parameters != lOther$parameters) {
      return false;
    }
    final l$rental = rental;
    final lOther$rental = other.rental;
    if (l$rental != lOther$rental) {
      return false;
    }
    final l$time = time;
    final lOther$time = other.time;
    if (l$time != lOther$time) {
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

extension UtilityExtension$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items
    on Query$getHomeRentalOrderRequest$business_order_request_by_pk$items {
  CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items<
          Query$getHomeRentalOrderRequest$business_order_request_by_pk$items>
      get copyWith =>
          CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items<
    TRes> {
  factory CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items(
    Query$getHomeRentalOrderRequest$business_order_request_by_pk$items instance,
    TRes Function(
            Query$getHomeRentalOrderRequest$business_order_request_by_pk$items)
        then,
  ) = _CopyWithImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items;

  factory CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items;

  TRes call({
    bool? available,
    double? cost,
    int? order_request_id,
    String? offering_type,
    int? item_id,
    int? id,
    dynamic? parameters,
    Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental?
        rental,
    String? time,
    String? $__typename,
  });
  CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental<
      TRes> get rental;
}

class _CopyWithImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items<
        TRes>
    implements
        CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items<
            TRes> {
  _CopyWithImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items(
    this._instance,
    this._then,
  );

  final Query$getHomeRentalOrderRequest$business_order_request_by_pk$items
      _instance;

  final TRes Function(
      Query$getHomeRentalOrderRequest$business_order_request_by_pk$items) _then;

  static const _undefined = {};

  TRes call({
    Object? available = _undefined,
    Object? cost = _undefined,
    Object? order_request_id = _undefined,
    Object? offering_type = _undefined,
    Object? item_id = _undefined,
    Object? id = _undefined,
    Object? parameters = _undefined,
    Object? rental = _undefined,
    Object? time = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getHomeRentalOrderRequest$business_order_request_by_pk$items(
        available: available == _undefined || available == null
            ? _instance.available
            : (available as bool),
        cost: cost == _undefined || cost == null
            ? _instance.cost
            : (cost as double),
        order_request_id:
            order_request_id == _undefined || order_request_id == null
                ? _instance.order_request_id
                : (order_request_id as int),
        offering_type: offering_type == _undefined || offering_type == null
            ? _instance.offering_type
            : (offering_type as String),
        item_id: item_id == _undefined || item_id == null
            ? _instance.item_id
            : (item_id as int),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        parameters: parameters == _undefined || parameters == null
            ? _instance.parameters
            : (parameters as dynamic),
        rental: rental == _undefined
            ? _instance.rental
            : (rental
                as Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental?),
        time: time == _undefined ? _instance.time : (time as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental<
      TRes> get rental {
    final local$rental = _instance.rental;
    return local$rental == null
        ? CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental
            .stub(_then(_instance))
        : CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental(
            local$rental, (e) => call(rental: e));
  }
}

class _CopyWithStubImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items<
        TRes>
    implements
        CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items<
            TRes> {
  _CopyWithStubImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items(
      this._res);

  TRes _res;

  call({
    bool? available,
    double? cost,
    int? order_request_id,
    String? offering_type,
    int? item_id,
    int? id,
    dynamic? parameters,
    Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental?
        rental,
    String? time,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental<
          TRes>
      get rental =>
          CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental
              .stub(_res);
}

class Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental {
  Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental({
    required this.id,
    required this.details,
    required this.$__typename,
  });

  factory Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental(
      id: (l$id as int),
      details:
          Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details
              .fromJson((l$details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details
      details;

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
    if (!(other
            is Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental) ||
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

extension UtilityExtension$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental
    on Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental {
  CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental<
          Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental>
      get copyWith =>
          CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental<
    TRes> {
  factory CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental(
    Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental
        instance,
    TRes Function(
            Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental)
        then,
  ) = _CopyWithImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental;

  factory CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental;

  TRes call({
    int? id,
    Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details?
        details,
    String? $__typename,
  });
  CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details<
      TRes> get details;
}

class _CopyWithImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental<
        TRes>
    implements
        CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental<
            TRes> {
  _CopyWithImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental(
    this._instance,
    this._then,
  );

  final Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental
      _instance;

  final TRes Function(
          Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        details: details == _undefined || details == null
            ? _instance.details
            : (details
                as Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details<
      TRes> get details {
    final local$details = _instance.details;
    return CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details(
        local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental<
        TRes>
    implements
        CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental<
            TRes> {
  _CopyWithStubImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental(
      this._res);

  TRes _res;

  call({
    int? id,
    Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details?
        details,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details<
          TRes>
      get details =>
          CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details
              .stub(_res);
}

class Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details {
  Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details({
    required this.id,
    required this.name,
    this.additional_parameters,
    required this.category1,
    required this.category2,
    required this.cost,
    this.image,
    required this.position,
    required this.tags,
    required this.$__typename,
  });

  factory Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$additional_parameters = json['additional_parameters'];
    final l$category1 = json['category1'];
    final l$category2 = json['category2'];
    final l$cost = json['cost'];
    final l$image = json['image'];
    final l$position = json['position'];
    final l$tags = json['tags'];
    final l$$__typename = json['__typename'];
    return Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details(
      id: (l$id as int),
      name:
          Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name
              .fromJson((l$name as Map<String, dynamic>)),
      additional_parameters: l$additional_parameters == null
          ? null
          : mapFromJson(l$additional_parameters),
      category1: (l$category1 as String),
      category2: (l$category2 as String),
      cost: mapFromJson(l$cost),
      image: l$image == null ? null : mapFromJson(l$image),
      position: (l$position as int),
      tags: mapFromJson(l$tags),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name
      name;

  final dynamic? additional_parameters;

  final String category1;

  final String category2;

  final dynamic cost;

  final dynamic? image;

  final int position;

  final dynamic tags;

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
    final l$category1 = category1;
    _resultData['category1'] = l$category1;
    final l$category2 = category2;
    _resultData['category2'] = l$category2;
    final l$cost = cost;
    _resultData['cost'] = mapToJson(l$cost);
    final l$image = image;
    _resultData['image'] = l$image == null ? null : mapToJson(l$image);
    final l$position = position;
    _resultData['position'] = l$position;
    final l$tags = tags;
    _resultData['tags'] = mapToJson(l$tags);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$additional_parameters = additional_parameters;
    final l$category1 = category1;
    final l$category2 = category2;
    final l$cost = cost;
    final l$image = image;
    final l$position = position;
    final l$tags = tags;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$additional_parameters,
      l$category1,
      l$category2,
      l$cost,
      l$image,
      l$position,
      l$tags,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details) ||
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
    final l$category1 = category1;
    final lOther$category1 = other.category1;
    if (l$category1 != lOther$category1) {
      return false;
    }
    final l$category2 = category2;
    final lOther$category2 = other.category2;
    if (l$category2 != lOther$category2) {
      return false;
    }
    final l$cost = cost;
    final lOther$cost = other.cost;
    if (l$cost != lOther$cost) {
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
    final l$tags = tags;
    final lOther$tags = other.tags;
    if (l$tags != lOther$tags) {
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

extension UtilityExtension$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details
    on Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details {
  CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details<
          Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details>
      get copyWith =>
          CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details<
    TRes> {
  factory CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details(
    Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details
        instance,
    TRes Function(
            Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details)
        then,
  ) = _CopyWithImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details;

  factory CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details;

  TRes call({
    int? id,
    Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name?
        name,
    dynamic? additional_parameters,
    String? category1,
    String? category2,
    dynamic? cost,
    dynamic? image,
    int? position,
    dynamic? tags,
    String? $__typename,
  });
  CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name<
      TRes> get name;
}

class _CopyWithImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details<
        TRes>
    implements
        CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details<
            TRes> {
  _CopyWithImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details(
    this._instance,
    this._then,
  );

  final Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details
      _instance;

  final TRes Function(
          Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? additional_parameters = _undefined,
    Object? category1 = _undefined,
    Object? category2 = _undefined,
    Object? cost = _undefined,
    Object? image = _undefined,
    Object? position = _undefined,
    Object? tags = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name
                as Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name),
        additional_parameters: additional_parameters == _undefined
            ? _instance.additional_parameters
            : (additional_parameters as dynamic?),
        category1: category1 == _undefined || category1 == null
            ? _instance.category1
            : (category1 as String),
        category2: category2 == _undefined || category2 == null
            ? _instance.category2
            : (category2 as String),
        cost: cost == _undefined || cost == null
            ? _instance.cost
            : (cost as dynamic),
        image: image == _undefined ? _instance.image : (image as dynamic?),
        position: position == _undefined || position == null
            ? _instance.position
            : (position as int),
        tags: tags == _undefined || tags == null
            ? _instance.tags
            : (tags as dynamic),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name<
      TRes> get name {
    final local$name = _instance.name;
    return CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name(
        local$name, (e) => call(name: e));
  }
}

class _CopyWithStubImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details<
        TRes>
    implements
        CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details<
            TRes> {
  _CopyWithStubImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details(
      this._res);

  TRes _res;

  call({
    int? id,
    Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name?
        name,
    dynamic? additional_parameters,
    String? category1,
    String? category2,
    dynamic? cost,
    dynamic? image,
    int? position,
    dynamic? tags,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name<
          TRes>
      get name =>
          CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name
              .stub(_res);
}

class Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name {
  Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name({
    required this.translations,
    required this.$__typename,
  });

  factory Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations>
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
            is Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name) ||
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

extension UtilityExtension$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name
    on Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name {
  CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name<
          Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name>
      get copyWith =>
          CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name<
    TRes> {
  factory CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name(
    Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name
        instance,
    TRes Function(
            Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name)
        then,
  ) = _CopyWithImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name;

  factory CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name;

  TRes call({
    List<Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations> Function(
              Iterable<
                  CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations<
                      Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations>>)
          _fn);
}

class _CopyWithImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name<
        TRes>
    implements
        CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name<
            TRes> {
  _CopyWithImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name(
    this._instance,
    this._then,
  );

  final Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name
      _instance;

  final TRes Function(
          Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name)
      _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations> Function(
                  Iterable<
                      CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations<
                          Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name<
        TRes>
    implements
        CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name<
            TRes> {
  _CopyWithStubImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name(
      this._res);

  TRes _res;

  call({
    List<Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations {
  Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations(
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
            is Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations) ||
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

extension UtilityExtension$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations
    on Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations {
  CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations<
          Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations>
      get copyWith =>
          CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations<
    TRes> {
  factory CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations(
    Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations
        instance,
    TRes Function(
            Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations)
        then,
  ) = _CopyWithImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations;

  factory CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations<
        TRes>
    implements
        CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations<
            TRes> {
  _CopyWithImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations(
    this._instance,
    this._then,
  );

  final Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations
      _instance;

  final TRes Function(
          Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations(
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

class _CopyWithStubImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations<
        TRes>
    implements
        CopyWith$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations<
            TRes> {
  _CopyWithStubImpl$Query$getHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Subscription$listenHomeRentalOrderRequest {
  factory Variables$Subscription$listenHomeRentalOrderRequest(
          {required int orderId}) =>
      Variables$Subscription$listenHomeRentalOrderRequest._({
        r'orderId': orderId,
      });

  Variables$Subscription$listenHomeRentalOrderRequest._(this._$data);

  factory Variables$Subscription$listenHomeRentalOrderRequest.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$orderId = data['orderId'];
    result$data['orderId'] = (l$orderId as int);
    return Variables$Subscription$listenHomeRentalOrderRequest._(result$data);
  }

  Map<String, dynamic> _$data;

  int get orderId => (_$data['orderId'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$orderId = orderId;
    result$data['orderId'] = l$orderId;
    return result$data;
  }

  CopyWith$Variables$Subscription$listenHomeRentalOrderRequest<
          Variables$Subscription$listenHomeRentalOrderRequest>
      get copyWith =>
          CopyWith$Variables$Subscription$listenHomeRentalOrderRequest(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Subscription$listenHomeRentalOrderRequest) ||
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

abstract class CopyWith$Variables$Subscription$listenHomeRentalOrderRequest<
    TRes> {
  factory CopyWith$Variables$Subscription$listenHomeRentalOrderRequest(
    Variables$Subscription$listenHomeRentalOrderRequest instance,
    TRes Function(Variables$Subscription$listenHomeRentalOrderRequest) then,
  ) = _CopyWithImpl$Variables$Subscription$listenHomeRentalOrderRequest;

  factory CopyWith$Variables$Subscription$listenHomeRentalOrderRequest.stub(
          TRes res) =
      _CopyWithStubImpl$Variables$Subscription$listenHomeRentalOrderRequest;

  TRes call({int? orderId});
}

class _CopyWithImpl$Variables$Subscription$listenHomeRentalOrderRequest<TRes>
    implements
        CopyWith$Variables$Subscription$listenHomeRentalOrderRequest<TRes> {
  _CopyWithImpl$Variables$Subscription$listenHomeRentalOrderRequest(
    this._instance,
    this._then,
  );

  final Variables$Subscription$listenHomeRentalOrderRequest _instance;

  final TRes Function(Variables$Subscription$listenHomeRentalOrderRequest)
      _then;

  static const _undefined = {};

  TRes call({Object? orderId = _undefined}) =>
      _then(Variables$Subscription$listenHomeRentalOrderRequest._({
        ..._instance._$data,
        if (orderId != _undefined && orderId != null)
          'orderId': (orderId as int),
      }));
}

class _CopyWithStubImpl$Variables$Subscription$listenHomeRentalOrderRequest<
        TRes>
    implements
        CopyWith$Variables$Subscription$listenHomeRentalOrderRequest<TRes> {
  _CopyWithStubImpl$Variables$Subscription$listenHomeRentalOrderRequest(
      this._res);

  TRes _res;

  call({int? orderId}) => _res;
}

class Subscription$listenHomeRentalOrderRequest {
  Subscription$listenHomeRentalOrderRequest({
    this.business_order_request_by_pk,
    required this.$__typename,
  });

  factory Subscription$listenHomeRentalOrderRequest.fromJson(
      Map<String, dynamic> json) {
    final l$business_order_request_by_pk = json['business_order_request_by_pk'];
    final l$$__typename = json['__typename'];
    return Subscription$listenHomeRentalOrderRequest(
      business_order_request_by_pk: l$business_order_request_by_pk == null
          ? null
          : Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk
              .fromJson(
                  (l$business_order_request_by_pk as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk?
      business_order_request_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$business_order_request_by_pk = business_order_request_by_pk;
    _resultData['business_order_request_by_pk'] =
        l$business_order_request_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$business_order_request_by_pk = business_order_request_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$business_order_request_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Subscription$listenHomeRentalOrderRequest) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$business_order_request_by_pk = business_order_request_by_pk;
    final lOther$business_order_request_by_pk =
        other.business_order_request_by_pk;
    if (l$business_order_request_by_pk != lOther$business_order_request_by_pk) {
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

extension UtilityExtension$Subscription$listenHomeRentalOrderRequest
    on Subscription$listenHomeRentalOrderRequest {
  CopyWith$Subscription$listenHomeRentalOrderRequest<
          Subscription$listenHomeRentalOrderRequest>
      get copyWith => CopyWith$Subscription$listenHomeRentalOrderRequest(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listenHomeRentalOrderRequest<TRes> {
  factory CopyWith$Subscription$listenHomeRentalOrderRequest(
    Subscription$listenHomeRentalOrderRequest instance,
    TRes Function(Subscription$listenHomeRentalOrderRequest) then,
  ) = _CopyWithImpl$Subscription$listenHomeRentalOrderRequest;

  factory CopyWith$Subscription$listenHomeRentalOrderRequest.stub(TRes res) =
      _CopyWithStubImpl$Subscription$listenHomeRentalOrderRequest;

  TRes call({
    Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk?
        business_order_request_by_pk,
    String? $__typename,
  });
  CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk<
      TRes> get business_order_request_by_pk;
}

class _CopyWithImpl$Subscription$listenHomeRentalOrderRequest<TRes>
    implements CopyWith$Subscription$listenHomeRentalOrderRequest<TRes> {
  _CopyWithImpl$Subscription$listenHomeRentalOrderRequest(
    this._instance,
    this._then,
  );

  final Subscription$listenHomeRentalOrderRequest _instance;

  final TRes Function(Subscription$listenHomeRentalOrderRequest) _then;

  static const _undefined = {};

  TRes call({
    Object? business_order_request_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Subscription$listenHomeRentalOrderRequest(
        business_order_request_by_pk: business_order_request_by_pk == _undefined
            ? _instance.business_order_request_by_pk
            : (business_order_request_by_pk
                as Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk<
      TRes> get business_order_request_by_pk {
    final local$business_order_request_by_pk =
        _instance.business_order_request_by_pk;
    return local$business_order_request_by_pk == null
        ? CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk
            .stub(_then(_instance))
        : CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk(
            local$business_order_request_by_pk,
            (e) => call(business_order_request_by_pk: e));
  }
}

class _CopyWithStubImpl$Subscription$listenHomeRentalOrderRequest<TRes>
    implements CopyWith$Subscription$listenHomeRentalOrderRequest<TRes> {
  _CopyWithStubImpl$Subscription$listenHomeRentalOrderRequest(this._res);

  TRes _res;

  call({
    Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk?
        business_order_request_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk<
          TRes>
      get business_order_request_by_pk =>
          CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk
              .stub(_res);
}

const documentNodeSubscriptionlistenHomeRentalOrderRequest =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.subscription,
    name: NameNode(value: 'listenHomeRentalOrderRequest'),
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
        name: NameNode(value: 'business_order_request_by_pk'),
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
            name: NameNode(value: 'business_id'),
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
            name: NameNode(value: 'customer_app_type'),
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
                name: NameNode(value: 'details_id'),
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
            name: NameNode(value: 'customer'),
            alias: null,
            arguments: [],
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
            name: NameNode(value: 'chat_id'),
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
            name: NameNode(value: 'status'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'review_id'),
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
            name: NameNode(value: 'notes'),
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
            name: NameNode(value: 'items'),
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
                name: NameNode(value: 'order_request_id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'offering_type'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'item_id'),
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
                name: NameNode(value: 'parameters'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'rental'),
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
                        name: NameNode(value: 'category1'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'category2'),
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
                        name: NameNode(value: 'tags'),
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
                name: NameNode(value: 'time'),
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
Subscription$listenHomeRentalOrderRequest
    _parserFn$Subscription$listenHomeRentalOrderRequest(
            Map<String, dynamic> data) =>
        Subscription$listenHomeRentalOrderRequest.fromJson(data);

class Options$Subscription$listenHomeRentalOrderRequest extends graphql
    .SubscriptionOptions<Subscription$listenHomeRentalOrderRequest> {
  Options$Subscription$listenHomeRentalOrderRequest({
    String? operationName,
    required Variables$Subscription$listenHomeRentalOrderRequest variables,
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
          document: documentNodeSubscriptionlistenHomeRentalOrderRequest,
          parserFn: _parserFn$Subscription$listenHomeRentalOrderRequest,
        );
}

class WatchOptions$Subscription$listenHomeRentalOrderRequest extends graphql
    .WatchQueryOptions<Subscription$listenHomeRentalOrderRequest> {
  WatchOptions$Subscription$listenHomeRentalOrderRequest({
    String? operationName,
    required Variables$Subscription$listenHomeRentalOrderRequest variables,
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
          document: documentNodeSubscriptionlistenHomeRentalOrderRequest,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Subscription$listenHomeRentalOrderRequest,
        );
}

class FetchMoreOptions$Subscription$listenHomeRentalOrderRequest
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Subscription$listenHomeRentalOrderRequest({
    required graphql.UpdateQuery updateQuery,
    required Variables$Subscription$listenHomeRentalOrderRequest variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeSubscriptionlistenHomeRentalOrderRequest,
        );
}

extension ClientExtension$Subscription$listenHomeRentalOrderRequest
    on graphql.GraphQLClient {
  Stream<graphql.QueryResult<Subscription$listenHomeRentalOrderRequest>>
      subscribe$listenHomeRentalOrderRequest(
              Options$Subscription$listenHomeRentalOrderRequest options) =>
          this.subscribe(options);
  graphql.ObservableQuery<Subscription$listenHomeRentalOrderRequest>
      watchSubscription$listenHomeRentalOrderRequest(
              WatchOptions$Subscription$listenHomeRentalOrderRequest options) =>
          this.watchQuery(options);
}

class Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk {
  Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk({
    required this.business_id,
    required this.customer_id,
    required this.customer_app_type,
    required this.business,
    required this.customer,
    this.chat_id,
    this.cost,
    required this.status,
    this.review_id,
    required this.order_time,
    this.notes,
    required this.id,
    required this.items,
    required this.$__typename,
  });

  factory Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$business_id = json['business_id'];
    final l$customer_id = json['customer_id'];
    final l$customer_app_type = json['customer_app_type'];
    final l$business = json['business'];
    final l$customer = json['customer'];
    final l$chat_id = json['chat_id'];
    final l$cost = json['cost'];
    final l$status = json['status'];
    final l$review_id = json['review_id'];
    final l$order_time = json['order_time'];
    final l$notes = json['notes'];
    final l$id = json['id'];
    final l$items = json['items'];
    final l$$__typename = json['__typename'];
    return Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk(
      business_id: (l$business_id as int),
      customer_id: (l$customer_id as int),
      customer_app_type: (l$customer_app_type as String),
      business:
          Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$business
              .fromJson((l$business as Map<String, dynamic>)),
      customer:
          Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$customer
              .fromJson((l$customer as Map<String, dynamic>)),
      chat_id: (l$chat_id as int?),
      cost: l$cost == null ? null : moneyFromJson(l$cost),
      status: (l$status as String),
      review_id: (l$review_id as int?),
      order_time: (l$order_time as String),
      notes: (l$notes as String?),
      id: (l$id as int),
      items: (l$items as List<dynamic>)
          .map((e) =>
              Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int business_id;

  final int customer_id;

  final String customer_app_type;

  final Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$business
      business;

  final Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$customer
      customer;

  final int? chat_id;

  final double? cost;

  final String status;

  final int? review_id;

  final String order_time;

  final String? notes;

  final int id;

  final List<
          Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items>
      items;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$business_id = business_id;
    _resultData['business_id'] = l$business_id;
    final l$customer_id = customer_id;
    _resultData['customer_id'] = l$customer_id;
    final l$customer_app_type = customer_app_type;
    _resultData['customer_app_type'] = l$customer_app_type;
    final l$business = business;
    _resultData['business'] = l$business.toJson();
    final l$customer = customer;
    _resultData['customer'] = l$customer.toJson();
    final l$chat_id = chat_id;
    _resultData['chat_id'] = l$chat_id;
    final l$cost = cost;
    _resultData['cost'] = l$cost == null ? null : moneyToJson(l$cost);
    final l$status = status;
    _resultData['status'] = l$status;
    final l$review_id = review_id;
    _resultData['review_id'] = l$review_id;
    final l$order_time = order_time;
    _resultData['order_time'] = l$order_time;
    final l$notes = notes;
    _resultData['notes'] = l$notes;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$items = items;
    _resultData['items'] = l$items.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$business_id = business_id;
    final l$customer_id = customer_id;
    final l$customer_app_type = customer_app_type;
    final l$business = business;
    final l$customer = customer;
    final l$chat_id = chat_id;
    final l$cost = cost;
    final l$status = status;
    final l$review_id = review_id;
    final l$order_time = order_time;
    final l$notes = notes;
    final l$id = id;
    final l$items = items;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$business_id,
      l$customer_id,
      l$customer_app_type,
      l$business,
      l$customer,
      l$chat_id,
      l$cost,
      l$status,
      l$review_id,
      l$order_time,
      l$notes,
      l$id,
      Object.hashAll(l$items.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$business_id = business_id;
    final lOther$business_id = other.business_id;
    if (l$business_id != lOther$business_id) {
      return false;
    }
    final l$customer_id = customer_id;
    final lOther$customer_id = other.customer_id;
    if (l$customer_id != lOther$customer_id) {
      return false;
    }
    final l$customer_app_type = customer_app_type;
    final lOther$customer_app_type = other.customer_app_type;
    if (l$customer_app_type != lOther$customer_app_type) {
      return false;
    }
    final l$business = business;
    final lOther$business = other.business;
    if (l$business != lOther$business) {
      return false;
    }
    final l$customer = customer;
    final lOther$customer = other.customer;
    if (l$customer != lOther$customer) {
      return false;
    }
    final l$chat_id = chat_id;
    final lOther$chat_id = other.chat_id;
    if (l$chat_id != lOther$chat_id) {
      return false;
    }
    final l$cost = cost;
    final lOther$cost = other.cost;
    if (l$cost != lOther$cost) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$review_id = review_id;
    final lOther$review_id = other.review_id;
    if (l$review_id != lOther$review_id) {
      return false;
    }
    final l$order_time = order_time;
    final lOther$order_time = other.order_time;
    if (l$order_time != lOther$order_time) {
      return false;
    }
    final l$notes = notes;
    final lOther$notes = other.notes;
    if (l$notes != lOther$notes) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$items = items;
    final lOther$items = other.items;
    if (l$items.length != lOther$items.length) {
      return false;
    }
    for (int i = 0; i < l$items.length; i++) {
      final l$items$entry = l$items[i];
      final lOther$items$entry = lOther$items[i];
      if (l$items$entry != lOther$items$entry) {
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

extension UtilityExtension$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk
    on Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk {
  CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk<
          Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk>
      get copyWith =>
          CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk<
    TRes> {
  factory CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk(
    Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk
        instance,
    TRes Function(
            Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk)
        then,
  ) = _CopyWithImpl$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk;

  factory CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk;

  TRes call({
    int? business_id,
    int? customer_id,
    String? customer_app_type,
    Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$business?
        business,
    Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$customer?
        customer,
    int? chat_id,
    double? cost,
    String? status,
    int? review_id,
    String? order_time,
    String? notes,
    int? id,
    List<Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items>?
        items,
    String? $__typename,
  });
  CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$business<
      TRes> get business;
  CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$customer<
      TRes> get customer;
  TRes items(
      Iterable<Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items> Function(
              Iterable<
                  CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items<
                      Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items>>)
          _fn);
}

class _CopyWithImpl$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk<
        TRes>
    implements
        CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk<
            TRes> {
  _CopyWithImpl$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk(
    this._instance,
    this._then,
  );

  final Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk
      _instance;

  final TRes Function(
          Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk)
      _then;

  static const _undefined = {};

  TRes call({
    Object? business_id = _undefined,
    Object? customer_id = _undefined,
    Object? customer_app_type = _undefined,
    Object? business = _undefined,
    Object? customer = _undefined,
    Object? chat_id = _undefined,
    Object? cost = _undefined,
    Object? status = _undefined,
    Object? review_id = _undefined,
    Object? order_time = _undefined,
    Object? notes = _undefined,
    Object? id = _undefined,
    Object? items = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk(
        business_id: business_id == _undefined || business_id == null
            ? _instance.business_id
            : (business_id as int),
        customer_id: customer_id == _undefined || customer_id == null
            ? _instance.customer_id
            : (customer_id as int),
        customer_app_type:
            customer_app_type == _undefined || customer_app_type == null
                ? _instance.customer_app_type
                : (customer_app_type as String),
        business: business == _undefined || business == null
            ? _instance.business
            : (business
                as Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$business),
        customer: customer == _undefined || customer == null
            ? _instance.customer
            : (customer
                as Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$customer),
        chat_id: chat_id == _undefined ? _instance.chat_id : (chat_id as int?),
        cost: cost == _undefined ? _instance.cost : (cost as double?),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as String),
        review_id:
            review_id == _undefined ? _instance.review_id : (review_id as int?),
        order_time: order_time == _undefined || order_time == null
            ? _instance.order_time
            : (order_time as String),
        notes: notes == _undefined ? _instance.notes : (notes as String?),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        items: items == _undefined || items == null
            ? _instance.items
            : (items as List<
                Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$business<
      TRes> get business {
    final local$business = _instance.business;
    return CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$business(
        local$business, (e) => call(business: e));
  }

  CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$customer<
      TRes> get customer {
    final local$customer = _instance.customer;
    return CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$customer(
        local$customer, (e) => call(customer: e));
  }

  TRes items(
          Iterable<Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items> Function(
                  Iterable<
                      CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items<
                          Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items>>)
              _fn) =>
      call(
          items: _fn(_instance.items.map((e) =>
              CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk<
        TRes>
    implements
        CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk<
            TRes> {
  _CopyWithStubImpl$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk(
      this._res);

  TRes _res;

  call({
    int? business_id,
    int? customer_id,
    String? customer_app_type,
    Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$business?
        business,
    Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$customer?
        customer,
    int? chat_id,
    double? cost,
    String? status,
    int? review_id,
    String? order_time,
    String? notes,
    int? id,
    List<Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items>?
        items,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$business<
          TRes>
      get business =>
          CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$business
              .stub(_res);
  CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$customer<
          TRes>
      get customer =>
          CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$customer
              .stub(_res);
  items(_fn) => _res;
}

class Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$business {
  Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$business({
    required this.details_id,
    required this.$__typename,
  });

  factory Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$business.fromJson(
      Map<String, dynamic> json) {
    final l$details_id = json['details_id'];
    final l$$__typename = json['__typename'];
    return Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$business(
      details_id: (l$details_id as int),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int details_id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$details_id = details_id;
    _resultData['details_id'] = l$details_id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$details_id = details_id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$details_id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$business) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$details_id = details_id;
    final lOther$details_id = other.details_id;
    if (l$details_id != lOther$details_id) {
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

extension UtilityExtension$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$business
    on Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$business {
  CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$business<
          Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$business>
      get copyWith =>
          CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$business(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$business<
    TRes> {
  factory CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$business(
    Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$business
        instance,
    TRes Function(
            Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$business)
        then,
  ) = _CopyWithImpl$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$business;

  factory CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$business.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$business;

  TRes call({
    int? details_id,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$business<
        TRes>
    implements
        CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$business<
            TRes> {
  _CopyWithImpl$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$business(
    this._instance,
    this._then,
  );

  final Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$business
      _instance;

  final TRes Function(
          Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$business)
      _then;

  static const _undefined = {};

  TRes call({
    Object? details_id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$business(
        details_id: details_id == _undefined || details_id == null
            ? _instance.details_id
            : (details_id as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$business<
        TRes>
    implements
        CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$business<
            TRes> {
  _CopyWithStubImpl$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$business(
      this._res);

  TRes _res;

  call({
    int? details_id,
    String? $__typename,
  }) =>
      _res;
}

class Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$customer {
  Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$customer({
    required this.user_id,
    required this.user,
    required this.$__typename,
  });

  factory Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$customer.fromJson(
      Map<String, dynamic> json) {
    final l$user_id = json['user_id'];
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$customer(
      user_id: (l$user_id as int),
      user:
          Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$customer$user
              .fromJson((l$user as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int user_id;

  final Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$customer$user
      user;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$user_id = user_id;
    _resultData['user_id'] = l$user_id;
    final l$user = user;
    _resultData['user'] = l$user.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$user_id = user_id;
    final l$user = user;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$user_id,
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
            is Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$customer) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$user_id = user_id;
    final lOther$user_id = other.user_id;
    if (l$user_id != lOther$user_id) {
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

extension UtilityExtension$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$customer
    on Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$customer {
  CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$customer<
          Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$customer>
      get copyWith =>
          CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$customer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$customer<
    TRes> {
  factory CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$customer(
    Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$customer
        instance,
    TRes Function(
            Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$customer)
        then,
  ) = _CopyWithImpl$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$customer;

  factory CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$customer.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$customer;

  TRes call({
    int? user_id,
    Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$customer$user?
        user,
    String? $__typename,
  });
  CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$customer$user<
      TRes> get user;
}

class _CopyWithImpl$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$customer<
        TRes>
    implements
        CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$customer<
            TRes> {
  _CopyWithImpl$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$customer(
    this._instance,
    this._then,
  );

  final Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$customer
      _instance;

  final TRes Function(
          Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$customer)
      _then;

  static const _undefined = {};

  TRes call({
    Object? user_id = _undefined,
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$customer(
        user_id: user_id == _undefined || user_id == null
            ? _instance.user_id
            : (user_id as int),
        user: user == _undefined || user == null
            ? _instance.user
            : (user
                as Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$customer$user),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$customer$user<
      TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$customer$user(
        local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$customer<
        TRes>
    implements
        CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$customer<
            TRes> {
  _CopyWithStubImpl$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$customer(
      this._res);

  TRes _res;

  call({
    int? user_id,
    Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$customer$user?
        user,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$customer$user<
          TRes>
      get user =>
          CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$customer$user
              .stub(_res);
}

class Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$customer$user {
  Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$customer$user({
    this.name,
    required this.firebase_id,
    this.image,
    required this.$__typename,
  });

  factory Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$customer$user.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$firebase_id = json['firebase_id'];
    final l$image = json['image'];
    final l$$__typename = json['__typename'];
    return Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$customer$user(
      name: (l$name as String?),
      firebase_id: (l$firebase_id as String),
      image: (l$image as String?),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final String? name;

  final String firebase_id;

  final String? image;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name = name;
    _resultData['name'] = l$name;
    final l$firebase_id = firebase_id;
    _resultData['firebase_id'] = l$firebase_id;
    final l$image = image;
    _resultData['image'] = l$image;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$firebase_id = firebase_id;
    final l$image = image;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$name,
      l$firebase_id,
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
            is Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$customer$user) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$customer$user
    on Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$customer$user {
  CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$customer$user<
          Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$customer$user>
      get copyWith =>
          CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$customer$user(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$customer$user<
    TRes> {
  factory CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$customer$user(
    Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$customer$user
        instance,
    TRes Function(
            Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$customer$user)
        then,
  ) = _CopyWithImpl$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$customer$user;

  factory CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$customer$user.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$customer$user;

  TRes call({
    String? name,
    String? firebase_id,
    String? image,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$customer$user<
        TRes>
    implements
        CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$customer$user<
            TRes> {
  _CopyWithImpl$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$customer$user(
    this._instance,
    this._then,
  );

  final Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$customer$user
      _instance;

  final TRes Function(
          Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$customer$user)
      _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? firebase_id = _undefined,
    Object? image = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$customer$user(
        name: name == _undefined ? _instance.name : (name as String?),
        firebase_id: firebase_id == _undefined || firebase_id == null
            ? _instance.firebase_id
            : (firebase_id as String),
        image: image == _undefined ? _instance.image : (image as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$customer$user<
        TRes>
    implements
        CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$customer$user<
            TRes> {
  _CopyWithStubImpl$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$customer$user(
      this._res);

  TRes _res;

  call({
    String? name,
    String? firebase_id,
    String? image,
    String? $__typename,
  }) =>
      _res;
}

class Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items {
  Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items({
    required this.available,
    required this.cost,
    required this.order_request_id,
    required this.offering_type,
    required this.item_id,
    required this.id,
    required this.parameters,
    this.rental,
    this.time,
    required this.$__typename,
  });

  factory Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items.fromJson(
      Map<String, dynamic> json) {
    final l$available = json['available'];
    final l$cost = json['cost'];
    final l$order_request_id = json['order_request_id'];
    final l$offering_type = json['offering_type'];
    final l$item_id = json['item_id'];
    final l$id = json['id'];
    final l$parameters = json['parameters'];
    final l$rental = json['rental'];
    final l$time = json['time'];
    final l$$__typename = json['__typename'];
    return Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items(
      available: (l$available as bool),
      cost: moneyFromJson(l$cost),
      order_request_id: (l$order_request_id as int),
      offering_type: (l$offering_type as String),
      item_id: (l$item_id as int),
      id: (l$id as int),
      parameters: mapFromJson(l$parameters),
      rental: l$rental == null
          ? null
          : Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental
              .fromJson((l$rental as Map<String, dynamic>)),
      time: (l$time as String?),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final bool available;

  final double cost;

  final int order_request_id;

  final String offering_type;

  final int item_id;

  final int id;

  final dynamic parameters;

  final Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental?
      rental;

  final String? time;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$available = available;
    _resultData['available'] = l$available;
    final l$cost = cost;
    _resultData['cost'] = moneyToJson(l$cost);
    final l$order_request_id = order_request_id;
    _resultData['order_request_id'] = l$order_request_id;
    final l$offering_type = offering_type;
    _resultData['offering_type'] = l$offering_type;
    final l$item_id = item_id;
    _resultData['item_id'] = l$item_id;
    final l$id = id;
    _resultData['id'] = l$id;
    final l$parameters = parameters;
    _resultData['parameters'] = mapToJson(l$parameters);
    final l$rental = rental;
    _resultData['rental'] = l$rental?.toJson();
    final l$time = time;
    _resultData['time'] = l$time;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$available = available;
    final l$cost = cost;
    final l$order_request_id = order_request_id;
    final l$offering_type = offering_type;
    final l$item_id = item_id;
    final l$id = id;
    final l$parameters = parameters;
    final l$rental = rental;
    final l$time = time;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$available,
      l$cost,
      l$order_request_id,
      l$offering_type,
      l$item_id,
      l$id,
      l$parameters,
      l$rental,
      l$time,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items) ||
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
    final l$order_request_id = order_request_id;
    final lOther$order_request_id = other.order_request_id;
    if (l$order_request_id != lOther$order_request_id) {
      return false;
    }
    final l$offering_type = offering_type;
    final lOther$offering_type = other.offering_type;
    if (l$offering_type != lOther$offering_type) {
      return false;
    }
    final l$item_id = item_id;
    final lOther$item_id = other.item_id;
    if (l$item_id != lOther$item_id) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$parameters = parameters;
    final lOther$parameters = other.parameters;
    if (l$parameters != lOther$parameters) {
      return false;
    }
    final l$rental = rental;
    final lOther$rental = other.rental;
    if (l$rental != lOther$rental) {
      return false;
    }
    final l$time = time;
    final lOther$time = other.time;
    if (l$time != lOther$time) {
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

extension UtilityExtension$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items
    on Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items {
  CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items<
          Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items>
      get copyWith =>
          CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items<
    TRes> {
  factory CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items(
    Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items
        instance,
    TRes Function(
            Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items)
        then,
  ) = _CopyWithImpl$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items;

  factory CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items;

  TRes call({
    bool? available,
    double? cost,
    int? order_request_id,
    String? offering_type,
    int? item_id,
    int? id,
    dynamic? parameters,
    Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental?
        rental,
    String? time,
    String? $__typename,
  });
  CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental<
      TRes> get rental;
}

class _CopyWithImpl$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items<
        TRes>
    implements
        CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items<
            TRes> {
  _CopyWithImpl$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items(
    this._instance,
    this._then,
  );

  final Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items
      _instance;

  final TRes Function(
          Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items)
      _then;

  static const _undefined = {};

  TRes call({
    Object? available = _undefined,
    Object? cost = _undefined,
    Object? order_request_id = _undefined,
    Object? offering_type = _undefined,
    Object? item_id = _undefined,
    Object? id = _undefined,
    Object? parameters = _undefined,
    Object? rental = _undefined,
    Object? time = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items(
        available: available == _undefined || available == null
            ? _instance.available
            : (available as bool),
        cost: cost == _undefined || cost == null
            ? _instance.cost
            : (cost as double),
        order_request_id:
            order_request_id == _undefined || order_request_id == null
                ? _instance.order_request_id
                : (order_request_id as int),
        offering_type: offering_type == _undefined || offering_type == null
            ? _instance.offering_type
            : (offering_type as String),
        item_id: item_id == _undefined || item_id == null
            ? _instance.item_id
            : (item_id as int),
        id: id == _undefined || id == null ? _instance.id : (id as int),
        parameters: parameters == _undefined || parameters == null
            ? _instance.parameters
            : (parameters as dynamic),
        rental: rental == _undefined
            ? _instance.rental
            : (rental
                as Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental?),
        time: time == _undefined ? _instance.time : (time as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental<
      TRes> get rental {
    final local$rental = _instance.rental;
    return local$rental == null
        ? CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental
            .stub(_then(_instance))
        : CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental(
            local$rental, (e) => call(rental: e));
  }
}

class _CopyWithStubImpl$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items<
        TRes>
    implements
        CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items<
            TRes> {
  _CopyWithStubImpl$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items(
      this._res);

  TRes _res;

  call({
    bool? available,
    double? cost,
    int? order_request_id,
    String? offering_type,
    int? item_id,
    int? id,
    dynamic? parameters,
    Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental?
        rental,
    String? time,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental<
          TRes>
      get rental =>
          CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental
              .stub(_res);
}

class Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental {
  Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental({
    required this.id,
    required this.details,
    required this.$__typename,
  });

  factory Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$details = json['details'];
    final l$$__typename = json['__typename'];
    return Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental(
      id: (l$id as int),
      details:
          Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details
              .fromJson((l$details as Map<String, dynamic>)),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details
      details;

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
    if (!(other
            is Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental) ||
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

extension UtilityExtension$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental
    on Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental {
  CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental<
          Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental>
      get copyWith =>
          CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental<
    TRes> {
  factory CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental(
    Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental
        instance,
    TRes Function(
            Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental)
        then,
  ) = _CopyWithImpl$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental;

  factory CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental;

  TRes call({
    int? id,
    Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details?
        details,
    String? $__typename,
  });
  CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details<
      TRes> get details;
}

class _CopyWithImpl$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental<
        TRes>
    implements
        CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental<
            TRes> {
  _CopyWithImpl$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental(
    this._instance,
    this._then,
  );

  final Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental
      _instance;

  final TRes Function(
          Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? details = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        details: details == _undefined || details == null
            ? _instance.details
            : (details
                as Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details<
      TRes> get details {
    final local$details = _instance.details;
    return CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details(
        local$details, (e) => call(details: e));
  }
}

class _CopyWithStubImpl$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental<
        TRes>
    implements
        CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental<
            TRes> {
  _CopyWithStubImpl$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental(
      this._res);

  TRes _res;

  call({
    int? id,
    Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details?
        details,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details<
          TRes>
      get details =>
          CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details
              .stub(_res);
}

class Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details {
  Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details({
    required this.id,
    required this.name,
    this.additional_parameters,
    required this.category1,
    required this.category2,
    required this.cost,
    this.image,
    required this.position,
    required this.tags,
    required this.$__typename,
  });

  factory Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$additional_parameters = json['additional_parameters'];
    final l$category1 = json['category1'];
    final l$category2 = json['category2'];
    final l$cost = json['cost'];
    final l$image = json['image'];
    final l$position = json['position'];
    final l$tags = json['tags'];
    final l$$__typename = json['__typename'];
    return Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details(
      id: (l$id as int),
      name:
          Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name
              .fromJson((l$name as Map<String, dynamic>)),
      additional_parameters: l$additional_parameters == null
          ? null
          : mapFromJson(l$additional_parameters),
      category1: (l$category1 as String),
      category2: (l$category2 as String),
      cost: mapFromJson(l$cost),
      image: l$image == null ? null : mapFromJson(l$image),
      position: (l$position as int),
      tags: mapFromJson(l$tags),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final int id;

  final Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name
      name;

  final dynamic? additional_parameters;

  final String category1;

  final String category2;

  final dynamic cost;

  final dynamic? image;

  final int position;

  final dynamic tags;

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
    final l$category1 = category1;
    _resultData['category1'] = l$category1;
    final l$category2 = category2;
    _resultData['category2'] = l$category2;
    final l$cost = cost;
    _resultData['cost'] = mapToJson(l$cost);
    final l$image = image;
    _resultData['image'] = l$image == null ? null : mapToJson(l$image);
    final l$position = position;
    _resultData['position'] = l$position;
    final l$tags = tags;
    _resultData['tags'] = mapToJson(l$tags);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$additional_parameters = additional_parameters;
    final l$category1 = category1;
    final l$category2 = category2;
    final l$cost = cost;
    final l$image = image;
    final l$position = position;
    final l$tags = tags;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$additional_parameters,
      l$category1,
      l$category2,
      l$cost,
      l$image,
      l$position,
      l$tags,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details) ||
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
    final l$category1 = category1;
    final lOther$category1 = other.category1;
    if (l$category1 != lOther$category1) {
      return false;
    }
    final l$category2 = category2;
    final lOther$category2 = other.category2;
    if (l$category2 != lOther$category2) {
      return false;
    }
    final l$cost = cost;
    final lOther$cost = other.cost;
    if (l$cost != lOther$cost) {
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
    final l$tags = tags;
    final lOther$tags = other.tags;
    if (l$tags != lOther$tags) {
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

extension UtilityExtension$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details
    on Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details {
  CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details<
          Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details>
      get copyWith =>
          CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details<
    TRes> {
  factory CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details(
    Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details
        instance,
    TRes Function(
            Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details)
        then,
  ) = _CopyWithImpl$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details;

  factory CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details;

  TRes call({
    int? id,
    Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name?
        name,
    dynamic? additional_parameters,
    String? category1,
    String? category2,
    dynamic? cost,
    dynamic? image,
    int? position,
    dynamic? tags,
    String? $__typename,
  });
  CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name<
      TRes> get name;
}

class _CopyWithImpl$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details<
        TRes>
    implements
        CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details<
            TRes> {
  _CopyWithImpl$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details(
    this._instance,
    this._then,
  );

  final Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details
      _instance;

  final TRes Function(
          Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details)
      _then;

  static const _undefined = {};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? additional_parameters = _undefined,
    Object? category1 = _undefined,
    Object? category2 = _undefined,
    Object? cost = _undefined,
    Object? image = _undefined,
    Object? position = _undefined,
    Object? tags = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details(
        id: id == _undefined || id == null ? _instance.id : (id as int),
        name: name == _undefined || name == null
            ? _instance.name
            : (name
                as Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name),
        additional_parameters: additional_parameters == _undefined
            ? _instance.additional_parameters
            : (additional_parameters as dynamic?),
        category1: category1 == _undefined || category1 == null
            ? _instance.category1
            : (category1 as String),
        category2: category2 == _undefined || category2 == null
            ? _instance.category2
            : (category2 as String),
        cost: cost == _undefined || cost == null
            ? _instance.cost
            : (cost as dynamic),
        image: image == _undefined ? _instance.image : (image as dynamic?),
        position: position == _undefined || position == null
            ? _instance.position
            : (position as int),
        tags: tags == _undefined || tags == null
            ? _instance.tags
            : (tags as dynamic),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name<
      TRes> get name {
    final local$name = _instance.name;
    return CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name(
        local$name, (e) => call(name: e));
  }
}

class _CopyWithStubImpl$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details<
        TRes>
    implements
        CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details<
            TRes> {
  _CopyWithStubImpl$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details(
      this._res);

  TRes _res;

  call({
    int? id,
    Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name?
        name,
    dynamic? additional_parameters,
    String? category1,
    String? category2,
    dynamic? cost,
    dynamic? image,
    int? position,
    dynamic? tags,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name<
          TRes>
      get name =>
          CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name
              .stub(_res);
}

class Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name {
  Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name({
    required this.translations,
    required this.$__typename,
  });

  factory Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name.fromJson(
      Map<String, dynamic> json) {
    final l$translations = json['translations'];
    final l$$__typename = json['__typename'];
    return Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name(
      translations: (l$translations as List<dynamic>)
          .map((e) =>
              Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: ((l$$__typename ?? "none") as String),
    );
  }

  final List<
          Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations>
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
            is Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name) ||
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

extension UtilityExtension$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name
    on Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name {
  CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name<
          Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name>
      get copyWith =>
          CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name<
    TRes> {
  factory CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name(
    Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name
        instance,
    TRes Function(
            Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name)
        then,
  ) = _CopyWithImpl$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name;

  factory CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name;

  TRes call({
    List<Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations>?
        translations,
    String? $__typename,
  });
  TRes translations(
      Iterable<Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations> Function(
              Iterable<
                  CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations<
                      Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations>>)
          _fn);
}

class _CopyWithImpl$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name<
        TRes>
    implements
        CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name<
            TRes> {
  _CopyWithImpl$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name(
    this._instance,
    this._then,
  );

  final Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name
      _instance;

  final TRes Function(
          Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name)
      _then;

  static const _undefined = {};

  TRes call({
    Object? translations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name(
        translations: translations == _undefined || translations == null
            ? _instance.translations
            : (translations as List<
                Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes translations(
          Iterable<Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations> Function(
                  Iterable<
                      CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations<
                          Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations>>)
              _fn) =>
      call(
          translations: _fn(_instance.translations.map((e) =>
              CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name<
        TRes>
    implements
        CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name<
            TRes> {
  _CopyWithStubImpl$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name(
      this._res);

  TRes _res;

  call({
    List<Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations>?
        translations,
    String? $__typename,
  }) =>
      _res;
  translations(_fn) => _res;
}

class Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations {
  Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations({
    required this.language_id,
    required this.value,
    required this.$__typename,
  });

  factory Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations.fromJson(
      Map<String, dynamic> json) {
    final l$language_id = json['language_id'];
    final l$value = json['value'];
    final l$$__typename = json['__typename'];
    return Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations(
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
            is Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations) ||
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

extension UtilityExtension$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations
    on Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations {
  CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations<
          Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations>
      get copyWith =>
          CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations<
    TRes> {
  factory CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations(
    Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations
        instance,
    TRes Function(
            Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations)
        then,
  ) = _CopyWithImpl$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations;

  factory CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations;

  TRes call({
    String? language_id,
    String? value,
    String? $__typename,
  });
}

class _CopyWithImpl$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations<
        TRes>
    implements
        CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations<
            TRes> {
  _CopyWithImpl$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations(
    this._instance,
    this._then,
  );

  final Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations
      _instance;

  final TRes Function(
          Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations)
      _then;

  static const _undefined = {};

  TRes call({
    Object? language_id = _undefined,
    Object? value = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations(
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

class _CopyWithStubImpl$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations<
        TRes>
    implements
        CopyWith$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations<
            TRes> {
  _CopyWithStubImpl$Subscription$listenHomeRentalOrderRequest$business_order_request_by_pk$items$rental$details$name$translations(
      this._res);

  TRes _res;

  call({
    String? language_id,
    String? value,
    String? $__typename,
  }) =>
      _res;
}
