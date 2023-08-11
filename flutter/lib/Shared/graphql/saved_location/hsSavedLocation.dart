// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/CustomerApp/models/Customer.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/__generated/schema.graphql.dart';
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';
import 'package:mezcalmos/Shared/graphql/saved_location/__generated/saved_location.graphql.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart' as LocModel;
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';

final HasuraDb _hasuraDb = Get.find<HasuraDb>();

/// Fetch all Customer's SavedLocations.
///
/// [customer_id] is the user's hasuraId
Future<List<SavedLocation>> get_customer_locations(
    {required int customer_id, bool withCache = true}) async {
  final QueryResult<Query$get_customer_locations> res = await _hasuraDb
      .graphQLClient
      .query$get_customer_locations(Options$Query$get_customer_locations(
          fetchPolicy:
              withCache ? FetchPolicy.cacheAndNetwork : FetchPolicy.networkOnly,
          variables: Variables$Query$get_customer_locations(
              customer_id: customer_id)));
  if (res.parsedData?.customer_saved_location == null) {
    throw Exception(
        "🛑 Exceptions getting saved locations ===> ${res.exception}");
  }
  final List<SavedLocation> locations = res.parsedData?.customer_saved_location
          .map(
            (Query$get_customer_locations$customer_saved_location location) =>
                SavedLocation(
              name: location.name,
              defaultLocation: location.$default,
              id: location.id,
              location: LocModel.MezLocation(
                location.location_text,
                location.location_gps.toLocationData(),
              ),
            ),
          )
          .toList() ??
      [];
  locations.sort((SavedLocation a, SavedLocation b) => a.id!.compareTo(b.id!));
  return locations;
}

Stream<List<SavedLocation>?> listen_on_customer_locations(
    {required int customer_id}) {
  return _hasuraDb.graphQLClient
      .subscribe$listen_on_saved_locations(
    Options$Subscription$listen_on_saved_locations(
      variables: Variables$Subscription$listen_on_saved_locations(
          customer_id: customer_id),
    ),
  )
      .map<List<SavedLocation>?>(
          (QueryResult<Subscription$listen_on_saved_locations> locations_res) {
    if (locations_res.hasException) {
      mezDbgPrint(
          "[+] listen_on_customer_locations :: exception :: ${locations_res.exception}");
      return null;
    } else {
      if (Get.find<HasuraDb>()
          .dataConsumption
          .containsKey("listen_on_saved_locations")) {
        Get.find<HasuraDb>().dataConsumption["listen_on_saved_locations"]![0] +=
            locations_res.data?.toString().length ?? 0;
        Get.find<HasuraDb>().dataConsumption["listen_on_saved_locations"]![1] +=
            1;
      } else {
        Get.find<HasuraDb>().dataConsumption["listen_on_saved_locations"] =
            <int>[locations_res.data?.toString().length ?? 0, 1];
      }
      final List<SavedLocation> ls = [];
      locations_res.parsedData?.customer_saved_location.forEach(
          (Subscription$listen_on_saved_locations$customer_saved_location
              location) {
        ls.add(
          SavedLocation(
            name: location.name,
            defaultLocation: location.$default,
            id: location.id,
            location: LocModel.MezLocation(
              location.location_text,
              location.location_gps.toLocationData(),
            ),
          ),
        );
      });
      ls.sort((SavedLocation a, SavedLocation b) => a.id!.compareTo(b.id!));

      return ls;
    }
  });
}

/// Get one Customer's specific SavedLocation using a location's pk.
Future<SavedLocation?> get_saved_location({required int location_id}) async {
  final Query$get_saved_location_by_id$customer_saved_location_by_pk?
      _saved_location = _hasuraDb.graphQLClient
          .readQuery$get_saved_location_by_id(
              variables: Variables$Query$get_saved_location_by_id(
                  location_id: location_id))
          ?.customer_saved_location_by_pk;

  return _saved_location != null
      ? SavedLocation(
          id: location_id,
          defaultLocation: _saved_location.$default,
          name: _saved_location.name,
          location: LocModel.MezLocation(
            _saved_location.location_text,
            _saved_location.location_gps.toLocationData(),
          ),
        )
      : null;
}

/// Update a Customer's specific SavedLocation using it's pk.
Future<SavedLocation?> update_saved_location(
    {required SavedLocation savedLocation}) async {
  final QueryResult<Mutation$updateSavedLocation> res = await _hasuraDb
      .graphQLClient
      .mutate$updateSavedLocation(Options$Mutation$updateSavedLocation(
          variables: Variables$Mutation$updateSavedLocation(
              data: Input$customer_saved_location_set_input(
                $default: savedLocation.defaultLocation,
                name: savedLocation.name,
                location_gps: savedLocation.location.toGeography(),
                location_text: savedLocation.location.address,
              ),
              id: savedLocation.id!)));
  if (res.parsedData?.update_customer_saved_location_by_pk == null) {
    throwError(res.exception);
  } else {
    final Mutation$updateSavedLocation$update_customer_saved_location_by_pk
        data = res.parsedData!.update_customer_saved_location_by_pk!;
    return SavedLocation(
      name: data.name,
      id: data.id,
      defaultLocation: data.$default,
      location: LocModel.MezLocation(
        data.location_text,
        data.location_gps.toLocationData(),
      ),
    );
  }
  return null;
}

/// delete a specific Customer's SavedLocation using the location's pk.
Future<ServerResponse> delete_saved_location(
    {required int saved_location_id}) async {
  final QueryResult<Mutation$delete_saved_location> _location_delete =
      await _hasuraDb.graphQLClient.mutate$delete_saved_location(
    Options$Mutation$delete_saved_location(
      variables: Variables$Mutation$delete_saved_location(
        location_id: saved_location_id,
      ),
    ),
  );

  if (_location_delete.hasException) {
    return ServerResponse(
      ResponseStatus.Error,
      errorMessage:
          "QueryResult has errors ${_location_delete.exception?.toString()}",
    );
  }
  return ServerResponse(ResponseStatus.Success);
}

/// Add a new Customer's SavedLocation Entry.
///
/// [customer_id] is the user's hasuraId
Future<SavedLocation?> add_saved_location(
    {required SavedLocation saved_location, required int customer_id}) async {
  final Geography? _location_gps = Geography(
      saved_location.location.latitude, saved_location.location.longitude);
  if (_location_gps != null) {
    final QueryResult<Mutation$add_saved_location> resp =
        await _hasuraDb.graphQLClient.mutate$add_saved_location(
      Options$Mutation$add_saved_location(
        variables: Variables$Mutation$add_saved_location(
          saved_location: Input$customer_saved_location_insert_input(
            customer_id: customer_id,
            $default: saved_location.defaultLocation,
            location_gps: _location_gps,
            location_text: saved_location.location.address,
            name: saved_location.name,
          ),
        ),
      ),
    );

    if (resp.parsedData?.insert_customer_saved_location_one == null) {
      throwError(resp.exception);
    } else {
      final Mutation$add_saved_location$insert_customer_saved_location_one
          data = resp.parsedData!.insert_customer_saved_location_one!;
      return SavedLocation(
        name: data.name,
        id: data.id,
        defaultLocation: data.$default,
        location: LocModel.MezLocation(
          data.location_text,
          data.location_gps.toLocationData(),
        ),
      );
    }
  }
  return null;
}

Future<void> set_default_location(
    {required int userId, required int defaultLocationId}) async {
  final QueryResult<Mutation$setDefaultLocation> res = await _hasuraDb
      .graphQLClient
      .mutate$setDefaultLocation(Options$Mutation$setDefaultLocation(
          variables: Variables$Mutation$setDefaultLocation(
              userId: userId, defaultLocId: defaultLocationId)));
  if (res.parsedData?.update_customer_saved_location == null) {
    throw Exception(
        " 🛑 Setting default location exceptions ===> ${res.exception}");
  }
}
