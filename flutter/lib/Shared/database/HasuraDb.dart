import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart' as fireAuth;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql/client.dart' as gqClient;
import 'package:jaguar_jwt/jaguar_jwt.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/appLifeCycleController.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/settingsController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart'
    show logLongString, logToken, mezDbgPrint;

class MyParser extends gqClient.ResponseParser {
  @override
  gqClient.ErrorLocation parseLocation(Map<String, dynamic> location) {
    mezDbgPrint("[parseLocation] ==> $location");
    return super.parseLocation(location);
  }

  @override
  gqClient.Response parseResponse(Map<String, dynamic> body) {
    mezDbgPrint("[parseResponse] ==> $body");
    return super.parseResponse(body);
  }

  @override
  gqClient.GraphQLError parseError(Map<String, dynamic> error) {
    mezDbgPrint("[parseError] ===> $error");
    return super.parseError(error);
  }
}

class HasuraDb {
  late gqClient.GraphQLClient _graphQLClient;
  gqClient.GraphQLClient get graphQLClient => _graphQLClient;
  String? tokenSnapshot;
  gqClient.WebSocketLink? _wsLink;
  AppLaunchMode appLaunchMode;
  // FirebaseDb _databaseHelper = Get.find<FirebaseDb>();
  HasuraDb(this.appLaunchMode) {
    _appLifeCycleController.attachCallback(AppLifecycleState.paused, () {
      cancelJWTExpirationCheckTimer();
      pauseAllSubscriptions();
    });

    _appLifeCycleController.attachCallback(AppLifecycleState.resumed, () async {
      if (expirationTime != null) {
        if (checkIfJWTExpired()) {
          await setupClient();
        } else {
          startJWTExpirationCheckTimer();
        }
      }
      resumeAllSubscriptions();
    });
    mezDbgPrint("Hasura DB initalized 👌🏻👌🏻👌🏻👌🏻👌🏻👌🏻👌🏻👌🏻👌🏻");
  }

  Map<String, HasuraSubscription> hasuraSubscriptions =
      <String, HasuraSubscription>{};
  final AppLifeCycleController _appLifeCycleController =
      Get.find<AppLifeCycleController>();
  Timer? expirationCheckTimer;
  num? expirationTime;

  Future<void> initializeHasura() async {
    cancelAllSubscriptions();
    await setupClient();
  }

  Future<void> setupClient() async {
    mezDbgPrint("Inside initializeHasura");
    late String hasuraDbLink;
    late String hasuraDbSocketLink;

    switch (appLaunchMode) {
      case AppLaunchMode.prod:
        hasuraDbLink = hasuraProdLink;
        hasuraDbSocketLink =
            hasuraProdLink.replaceAll("https", "wss"); // hasuraSta
        break;
      case AppLaunchMode.stage:
        hasuraDbLink = hasuraStageLink;
        hasuraDbSocketLink =
            hasuraStageLink.replaceAll("https", "wss"); // hasuraStageLink;
        break;
      case AppLaunchMode.dev:
        hasuraDbLink = hasuraDevLink;
        hasuraDbSocketLink = hasuraDevLink.replaceAll("http", "ws"); //
        break;
    }
    mezDbgPrint(
        "🥶🥶🥶 Hasura DB Links 🥶🥶🥶 \n hasuraDbLink : $hasuraDbLink \n hasuraDbSocketLink : $hasuraDbSocketLink ");
    Map<String, String> headers = <String, String>{
      //"x-hasura-admin-secret": "myadminsecretkey"
    };
    gqClient.HttpLink _httpLink =
        gqClient.HttpLink(hasuraDbLink, defaultHeaders: headers);
    gqClient.Link _link = _httpLink;

    if (fireAuth.FirebaseAuth.instance.currentUser != null) {
      mezDbgPrint("[777] USER-> ${fireAuth.FirebaseAuth.instance.currentUser}");
      final String hasuraAuthToken = await _getAuthorizationToken(
        fireAuth.FirebaseAuth.instance.currentUser!,
        appLaunchMode == AppLaunchMode.dev,
      );
      tokenSnapshot = hasuraAuthToken;
      // logToken(hasuraAuthToken);

      // mezDbgPrint("ROLE ${_getRoleBasedOnApp()}");
      // mezDbgPrint("✅ TOKKEN ✅: \n $hasuraAuthToken");

      headers = <String, String>{
        'Authorization': 'Bearer $hasuraAuthToken',
        'x-hasura-role': _getRoleBasedOnApp()
      };
      // mezDbgPrint("[AAA] TOKEN ==> $hasuraAuthToken");
      // logLongString("headers ===> ${headers.toString()}");
      final gqClient.AuthLink _authLink =
          gqClient.AuthLink(getToken: () async => 'Bearer $hasuraAuthToken');
      _httpLink = gqClient.HttpLink(hasuraDbLink, defaultHeaders: headers);
      _link = _authLink.concat(_httpLink);

      expirationTime = JwtDecoder.decode(hasuraAuthToken)["exp"];
      startJWTExpirationCheckTimer();
    } else {
      expirationTime = null;
      cancelJWTExpirationCheckTimer();
    }

    if (_wsLink == null) {
      _wsLink = gqClient.WebSocketLink(hasuraDbSocketLink,
          config: gqClient.SocketClientConfig(
            autoReconnect: true,
            parser: MyParser(),
            inactivityTimeout: Duration(seconds: 30),
            initialPayload: () async {
              return {
                'headers': headers,
              };
            },
          ));
    } else {
      _wsLink!.config = gqClient.SocketClientConfig(
        autoReconnect: true,
        parser: MyParser(),
        inactivityTimeout: Duration(seconds: 30),
        initialPayload: () async {
          return {
            'headers': headers,
          };
        },
      );
      // _wsLink?.config.connect(uri: hasuraDbSocketLink, headers: headers);
      _wsLink?.connectOrReconnect();
    }

    _link = gqClient.Link.split(
        (gqClient.Request request) => request.isSubscription, _wsLink!, _link);

    _graphQLClient = gqClient.GraphQLClient(
      cache: gqClient.GraphQLCache(),
      link: _link,
    );

    // final DateTime dateTime = new DateTime.fromMillisecondsSinceEpoch(
    //     JwtDecoder.decode(headers['Authorization']!.split(" ")[1])['exp'] *
    //         1000);
    // mezDbgPrint(
    //     "🤬🤬🤬🤬🤬🤬 hashcode of gql client from hasuradb link:${_graphQLClient?.link.hashCode} client:${_graphQLClient.hashCode}");

    // mezDbgPrint("🌭🌭🌭🌭🌭🌭");
    // mezDbgPrint(dateTime.toLocal().toString());
    // mezDbgPrint((graphQLClient.link as WebSocketLink ).config.headers)
  }

  Future<String> _getAuthorizationToken(User user, bool testMode) async {
    final String token = await user.getIdToken(true);
    if (testMode) {
      final Map<String, dynamic> decoded = JwtDecoder.decode(token);
      // mezDbgPrint(decoded);
      // decoded["exp"] = decoded["exp"] - 3580;
      // mezDbgPrint(decoded);
      final JwtClaim claims = JwtClaim.fromMap(decoded, defaultIatExp: false);
      return issueJwtHS256(claims, 'secret-for-testing-locally-with-emulator');
    }
    return token;
  }

  void startJWTExpirationCheckTimer() {
    mezDbgPrint("startJWTExpirationCheckTimer");
    expirationCheckTimer?.cancel();
    expirationCheckTimer =
        Timer.periodic(new Duration(seconds: 300), (Timer timer) async {
      if (expirationTime != null && checkIfJWTExpired()) {
        expirationCheckTimer?.cancel();
        expirationCheckTimer = null;
        pauseAllSubscriptions();
        await setupClient();
        resumeAllSubscriptions();
      }
    });
  }

  void cancelJWTExpirationCheckTimer() {
    expirationCheckTimer?.cancel();
    expirationCheckTimer = null;
  }

  bool checkIfJWTExpired() {
    final num timeToExpire =
        expirationTime! - (DateTime.now().millisecondsSinceEpoch / 1000).ceil();
    mezDbgPrint("♥️♥️♥️♥️♥️♥️♥️ Time left: $timeToExpire");
    return timeToExpire < 600;
  }

  /// this return by default customer we are not handling all app types
  String _getRoleBasedOnApp() {
    final AppType appType = Get.find<SettingsController>().appType;
    switch (appType) {
      case AppType.CustomerApp:
        return "customer";
      // case AppType.DeliveryAdminApp:
      //   return "mez_admin";
      case AppType.DeliveryApp:
        return "delivery_driver";
      case AppType.RestaurantApp:
        return "restaurant_operator";
      case AppType.DeliveryAdminApp:
        return "delivery_operator";
      case AppType.MezAdminApp:
        return "mez_admin";
      case AppType.LaundryApp:
        return "laundry_operator";
      default:
        return "customer";
    }
  }

  String createSubscription(
      {required Function start, required Function cancel}) {
    if (Get.find<AuthController>().isUserSignedIn == false) {
      mezDbgPrint(
          "🚨🚨🚨🚨🚨 Subscription called While SIGNED OUT 🚨🚨🚨🚨🚨 ");
    }
    final String subscriptionId = getRandomString(10);
    hasuraSubscriptions[subscriptionId] = HasuraSubscription(start, cancel);
    start();
    return subscriptionId;
  }

  void resumeSubscription(String subscriptionId) {
    hasuraSubscriptions[subscriptionId]?.start();
  }

  void pauseSubscription(String subscriptionId) {
    hasuraSubscriptions[subscriptionId]?.cancel();
  }

  void cancelSubscription(String subscriptionId) {
    hasuraSubscriptions[subscriptionId]?.cancel();
    hasuraSubscriptions.remove(subscriptionId);
  }

  void pauseAllSubscriptions() {
    mezDbgPrint("Pausing all subscriptions");
    hasuraSubscriptions.forEach(
        (String subscriptionId, HasuraSubscription hasuraSubscription) {
      pauseSubscription(subscriptionId);
    });
  }

  void resumeAllSubscriptions() {
    mezDbgPrint("Resuming all subscriptions");
    hasuraSubscriptions.forEach(
        (String subscriptionId, HasuraSubscription hasuraSubscription) {
      resumeSubscription(subscriptionId);
    });
  }

  void cancelAllSubscriptions() {
    final List<String> keysToRemove = hasuraSubscriptions.keys.toList();
    keysToRemove.forEach((String subId) {
      cancelSubscription(subId);
    });
  }
}

class HasuraSubscription {
  Function start;
  Function cancel;
  HasuraSubscription(this.start, this.cancel);
}
