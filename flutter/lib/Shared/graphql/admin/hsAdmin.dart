import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/MezAdminApp/models/MezAdmin.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/admin/__generated/admin.graphql.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

final GraphQLClient _graphClient = Get.find<HasuraDb>().graphQLClient;

Future<MezAdmin?> get_admin({required int user_id}) async {
  QueryResult<Query$get_admin_info> admin_info =
      await _graphClient.query$get_admin_info(
    Options$Query$get_admin_info(
      fetchPolicy: FetchPolicy.noCache,
      variables: Variables$Query$get_admin_info(admin_id: user_id),
    ),
  );

  if (admin_info.hasException) {
    mezDbgPrint(
        "[tt] Called :: get_customer_info :: exception :: ${admin_info.exception}");
  }

  final List<Query$get_admin_info$mez_admin>? _admin =
      admin_info.parsedData?.mez_admin;

  if (_admin != null && _admin.isNotEmpty) {
    mezDbgPrint(
        "[tt] Called :: get_customer_info :: SUCCESS :: got_customer(${_admin[0].user?.name})");

    return MezAdmin(
      appVersion: _admin[0].version,
      notificationInfo: _admin[0].notification_token,
    );
  } else {
    mezDbgPrint("[tt] No such customer exists :: id($user_id)");
  }
  return null;
}

Future set_service_status({required String status, required int id}) async {
  QueryResult<Mutation$set_service_status> _res =
      await _graphClient.mutate$set_service_status(
    Options$Mutation$set_service_status(
      fetchPolicy: FetchPolicy.noCache,
      variables: Variables$Mutation$set_service_status(id: id, status: status),
    ),
  );

  if (_res.hasException) {
    mezDbgPrint(
        "[tt] Called :: set_service_status :: exception :: ${_res.exception}");
  } else {
    mezDbgPrint("[tt] Called :: set_service_status :: SUCCESS!");
  }
}