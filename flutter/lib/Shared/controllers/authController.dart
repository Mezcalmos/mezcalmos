import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart' as fireAuth;
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/user/hsUser.dart';
import 'package:mezcalmos/Shared/helpers/ConnectivityHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['Shared']
    ['controllers']['authController'];

class AuthController extends GetxController {
  fireAuth.FirebaseAuth _auth = fireAuth.FirebaseAuth.instance;
  Function _onSignOutCallback;
  Function _onSignInCallback;

  RxnInt _hasuraUserId = RxnInt();
  int? get hasuraUserId => _hasuraUserId.value;
  RxBool isUserSetted = RxBool(false);

  Rxn<UserInfo> _userInfo = Rxn();
  UserInfo? get user => _userInfo.value;
  void set setUserInfo(UserInfo? _u) => _userInfo.value = _u;

  StreamController<fireAuth.User?> _authStateStreamController =
      StreamController<fireAuth.User?>.broadcast();

  Stream<fireAuth.User?> get authStateStream =>
      _authStateStreamController.stream;

  bool get isUserSignedIn => _auth.currentUser != null;
  fireAuth.User? get fireAuthUser => fireAuth.FirebaseAuth.instance.currentUser;
  final HasuraDb hasuraDb = Get.find<HasuraDb>();

  AuthController(this._onSignInCallback, this._onSignOutCallback);
  String? _previousUserValue = "init";
  bool userRedirectFinish = false;
  @override
  void onInit() {
    super.onInit();
    // _authStateStream.addStream(_auth.authStateChanges());

    _auth.authStateChanges().listen((fireAuth.User? user) async {
      mezDbgPrint('Auth controller init! 👋👋👋👋👋');
      userRedirectFinish = false;
      if (user?.toString() == _previousUserValue) {
        mezDbgPrint(
            'Authcontroller:: same sign in event fired again, skipping it');
        return;
      }
      _previousUserValue = user?.toString();

      mezDbgPrint('Authcontroller:: Auth state change!');
      mezDbgPrint(user?.hashCode);
      mezDbgPrint(user ?? "empty");

      if (user == null) {
        _hasuraUserId.value = null;
        await hasuraDb.initializeHasura();
        await _onSignOutCallback();
        mezDbgPrint('AuthController: User is currently signed out!');
      } else {
        mezDbgPrint('AuthController: User is currently signed in!');
        final InternetStatus internetStatus =
            await ConnectivityHelper.instance.checkForInternet();
        if (internetStatus != InternetStatus.Offline) {
          fireAuth.IdTokenResult? tokenResult =
              await user.getIdTokenResult(true);
          mezDbgPrint(tokenResult.claims);

          if (tokenResult.claims?['https://hasura.io/jwt/claims'] == null ||
              roleMissing(tokenResult.claims!['https://hasura.io/jwt/claims']
                  ['x-hasura-allowed-roles'])) {
            mezDbgPrint("No token, calling addHasuraClaims");

            await FirebaseFunctions.instance
                .httpsCallable('user2-addHasuraClaim')
                .call();

            tokenResult = await user.getIdTokenResult(true);
          }
          _hasuraUserId.value = int.parse(tokenResult
              .claims!['https://hasura.io/jwt/claims']['x-hasura-user-id']);

          mezDbgPrint(_hasuraUserId.value);

          await hasuraDb.initializeHasura();
          await fetchUserInfoFromHasura();
          _setLAppLanguage();
          await _onSignInCallback();
        } else {
          unawaited(fireAuth.FirebaseAuth.instance.signOut());
          user = null;
        }
      }

      _authStateStreamController.add(user);
    });

    super.onInit();
  }

  bool roleMissing(List<Object?> actualRoles) {
    List<String> expectedRoles = <String>[
      'anonymous',
      'restaurant_operator',
      'customer',
      'mez_admin',
      'deliverer',
      'delivery_operator',
      'delivery_driver',
      'laundry_operator'
    ];

    final List<String> difference =
        expectedRoles.toSet().difference(actualRoles.toSet()).toList();
    // return false;
    return difference.length > 0;
  }

  Future<void> fetchUserInfoFromHasura() async {
    mezDbgPrint(
        "[777] fetchingUser Info from hasure using firebaseid : ${fireAuthUser?.uid} \n hasura id : $hasuraUserId ");

    _userInfo.value =
        await get_user_by_hasura_id(hasuraId: _hasuraUserId.value!);
    mezDbgPrint(
        "[77] =====> fetchUserInfoFromHasura:: userInfo ===> ${_userInfo.value?.toFirebaseFormatJson()}");
  }

  bool isDisplayNameSet() {
    return user?.isNameSet ?? false;
  }

  bool isUserImgSet() {
    return user?.isImageSet ?? false;
  }

  DateTime? getUserCreationDate() {
    return fireAuth.FirebaseAuth.instance.currentUser!.metadata.creationTime;
  }

  Future<ServerResponse> deleteAccount() async {
    final HttpsCallable deleteUserFunction =
        FirebaseFunctions.instance.httpsCallable('user-deleteUserAccount');
    try {
      final HttpsCallableResult<Map<String, dynamic>> response =
          await deleteUserFunction.call({});
      mezDbgPrint("Responso ===> $response");
      final ServerResponse _resp = ServerResponse.fromJson(response.data);

      if (_resp.success) {
        await signOut();
      }
      return _resp;
    } catch (e, st) {
      mezDbgPrint("Error $e | StackTrace $st");
      return ServerResponse(ResponseStatus.Error,
          errorMessage: "Server Error", errorCode: "serverError");
    }
  }

  /// this is for setting the Original size of the image that was picked by the user,
  ///
  /// Made as a seprated function and not along with [editUserProfile]'s parameteres,
  ///
  /// because that was we won't need to wait for them both to get uploaded.
  Future<void> setOriginalUserImage(String? originalImageUrl) async {
    if (originalImageUrl != null) {
      // TODO: set hasura image
      // await _databaseHelper.firebaseDatabase
      //     .ref()
      //     .child(userInfoNode(fireAuthUser!.uid))
      //     .child('bigImage')
      //     .set(originalImageUrl);
      await change_user_img(
        userId: user!.hasuraId,
        img: originalImageUrl,
        isBigImg: true,
      );
    }
  }

  Future<void> editUserProfile(String? name, String? compressedImageUrl) async {
    if (name != null) {
      await change_username(userId: user!.hasuraId, name: name);
    }
    if (compressedImageUrl != null && compressedImageUrl.isURL) {
      // TODO: set hasura compressed_image

      await change_user_img(userId: user!.hasuraId, img: compressedImageUrl);
    }
  }

  Future<void> updateUserProfile() async {
    mezDbgPrint(
        "👋 updating user info payload ==>${_userInfo.value?.toFirebaseFormatJson()}");
    _userInfo.value = await update_user_info(
        userId: hasuraUserId!, userInfo: _userInfo.value!);
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<LanguageType> changeLanguage(LanguageType newLanguage) async {
    return await change_user_language(
        userId: user!.hasuraId, language: newLanguage);
  }

  void _setLAppLanguage() {
    if (_userInfo.value != null) {
      Get.find<LanguageController>().changeUserLanguage(
          language: _userInfo.value?.language, saveToDatabase: false);
    }
  }

  @override
  void dispose() {
    super.dispose();
    mezDbgPrint("--------------------> AuthController Auto Disposed !");
  }
}
