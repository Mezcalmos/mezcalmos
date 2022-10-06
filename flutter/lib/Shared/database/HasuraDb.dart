import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:graphql/client.dart';
import 'package:gql/ast.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart' show mezDbgPrint;

class HasuraDb {
  late final GraphQLClient graphQLClient;
  AuthController _authController = Get.find<AuthController>();
  FirebaseDb _databaseHelper = Get.find<FirebaseDb>();
  HasuraDb() {
    initializeHasura();
  }

  Future<void> initializeHasura() async {
    mezDbgPrint("Inside Hasura Helper");
    mezDbgPrint(
        "Firebase auth user is ${_authController.fireAuthUser?.displayName}");
    if (_authController.fireAuthUser != null) {
      final String hasuraAuthToken =
          await _getAuthorizationToken(_authController.fireAuthUser!);

      final _httpLink = HttpLink(
        'https://mezcalmosv2.hasura.app/v1/graphql',
      );

      final WebSocketLink _wsLink = WebSocketLink(
        'wss://mezcalmosv2.hasura.app/v1/graphql',
        config: SocketClientConfig(
          autoReconnect: true,
          inactivityTimeout: Duration(seconds: 30),
          initialPayload: {
            'headers': {'Authorization': 'Bearer $hasuraAuthToken'},
          },
        ),
      );

      final _authLink =
          AuthLink(getToken: () async => 'Bearer $hasuraAuthToken');

      Link _link = _authLink.concat(_httpLink);

      _link = Link.split((request) => request.isSubscription, _wsLink, _link);

      graphQLClient = GraphQLClient(
        cache: GraphQLCache(),
        link: _link,
      );
    }
  }

  Future<QueryResult> get(
      DocumentNode documentNode, Map<String, dynamic> variables) {
    final QueryOptions options =
        QueryOptions(document: documentNode, variables: variables);

    return this.graphQLClient.query(options);
  }

  Stream<QueryResult> subscribe(
      DocumentNode documentNode, Map<String, dynamic> variables) {
    final SubscriptionOptions options =
        SubscriptionOptions(document: documentNode, variables: variables);

    return this.graphQLClient.subscribe(options);
  }

  Future<String> _getAuthorizationToken(User user) async {
    IdTokenResult? tokenResult = await user.getIdTokenResult();
    if (tokenResult.claims?['https://hasura.io/jwt/claims'] == null) {
      mezDbgPrint("No token, calling addHasuraClaims");
      await FirebaseFunctions.instance.httpsCallable('addHasuraClaims').call();
    } else if (await _checkIfAdminNeededButNotGiven(tokenResult)) {
      mezDbgPrint("Need admin priveleges, calling addHasuraClaims");
      await FirebaseFunctions.instance.httpsCallable('addHasuraClaims').call();
    }

    return await _authController.fireAuthUser!.getIdToken(true);
  }

  Future<bool> _checkIfAdminNeededButNotGiven(IdTokenResult tokenResult) async {
    bool isAdmin = false;
    try {
      (await _databaseHelper.firebaseDatabase
              .ref()
              .child("admins/${_authController.fireAuthUser!.uid}")
              .once())
          .snapshot
          .value;
      // If value is returned, then user is admin, make isAdmin be true;
      isAdmin = true;
    } catch (e) {
      // If error is permission denied, then user is not admin, let isAdmin be false;
      if ((e as dynamic).details != "Permission Denied") {
        throw e;
      }
    }

    return (isAdmin &&
        !tokenResult.claims!['https://hasura.io/jwt/claims']
                ['x-hasura-allowed-roles']
            .toString()
            .contains("admin"));
  }
}
