import 'package:firebase_database/firebase_database.dart';
import 'package:mezcalmos/CustomerApp/constants/databaseNodes.dart';
import 'package:mezcalmos/CustomerApp/models/cart.dart';
import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/ServerResponse.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/helpers/DatabaseHelper.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:get/get.dart';
import 'dart:async';

import 'package:mezcalmos/Shared/utilities/Extensions.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';

class RestaurantCartController extends GetxController {
  DatabaseHelper _databaseHelper = Get.find<DatabaseHelper>();
  AuthController _authController = Get.find<AuthController>();

  StreamSubscription? _cartListener;
  Restaurant? associatedRestaurant;
  Rx<Cart> cart = Cart().obs;
  @override
  void onInit() {
    super.onInit();
    print("--------------------> RestaurantsCartController Initialized !");

    _cartListener?.cancel();
    _cartListener = _databaseHelper.firebaseDatabase
        .reference()
        .child(customerCart(_authController.fireAuthUser!.uid))
        .onValue
        .listen((event) async {
      dynamic cartData = event.snapshot.value;
      // check if cart has data
      if (cartData != null) {
        // check if cart data is for restaurant
        if (cartData["orderType"] ==
            OrderType.Restaurant.toFirebaseFormatString()) {
          // check if already associated restaurant with cart is the same as current restaurant,
          // if not clear the old associated restaurant
          if (associatedRestaurant != null) {
            if (cartData["serviceProviderId"] != associatedRestaurant!.id) {
              associatedRestaurant = null;
            }
          }
          // if no associated restaurant data is saved, then fetch it from database
          if (associatedRestaurant == null) {
            associatedRestaurant =
                await getAssociatedRestaurant(cartData["serviceProviderId"]);
          }
          mezDbgPrint(" =====> $cartData");
          if (cartData == null) {
            cart.value = Cart();
          }
          cart.value = Cart.fromCartData(cartData, associatedRestaurant!);
        }
      } else {
        cart.value = Cart();
      }
    });
  }

  Future<Restaurant> getAssociatedRestaurant(String restaurantId) async {
    DataSnapshot snapshot = await _databaseHelper.firebaseDatabase
        .reference()
        .child('restaurants/info/${restaurantId}')
        .once();
    return Restaurant.fromRestaurantData(snapshot.value, id: restaurantId);
  }

  void addItem(CartItem cartItem) async {
    String restaurantId = cartItem.restaurantId;
    if (associatedRestaurant == null) {
      associatedRestaurant = await getAssociatedRestaurant(restaurantId);
      cart.value = Cart(restaurant: associatedRestaurant!);
    } else if (associatedRestaurant!.id != restaurantId) {
      // In future, throw items from another restaurant in cart error
      // for now clear cart and associate new restaurant
      associatedRestaurant = await getAssociatedRestaurant(restaurantId);
      cart.value = Cart(restaurant: associatedRestaurant!);
    }

    cart.value.addItem(cartItem);
    // print(customerCart(_authController.user!.uid));
    _databaseHelper.firebaseDatabase
        .reference()
        .child(customerCart(_authController.user!.uid))
        .set(cart.value.toFirebaseFormattedJson());
  }

  void deleteItemFromCart(String documentId) {
    mezDbgPrint(customerCart(_authController.user!.uid) + "/items/$documentId");
    _databaseHelper.firebaseDatabase
        .reference()
        .child(customerCart(_authController.user!.uid) + "/items/$documentId")
        .remove();
  }

  void clearCart() {
    _databaseHelper.firebaseDatabase
        .reference()
        .child(customerCart(_authController.user!.uid))
        .remove();
  }

  Future<ServerResponse> checkout() async {
    HttpsCallable checkoutRestaurantCart =
        FirebaseFunctions.instance.httpsCallable('checkoutRestaurantCart');
    try {
      // fake location, needs to be updated with real later
      // cart.value.toLocation = Location(<String, dynamic>{
      //   "address": "address",
      //   "latitude": 0,
      //   "longitude": 0
      // });
      mezDbgPrint(cart.value.toFirebaseFormattedJson());
      HttpsCallableResult response = await checkoutRestaurantCart
          .call(cart.value.toFirebaseFormattedJson());
      return ServerResponse.fromJson(response.data);
    } catch (e) {
      return ServerResponse(ResponseStatus.Error,
          errorMessage: "Server Error", errorCode: "serverError");
    }
  }

  @override
  void onClose() async {
    print("[+] RestaurantCartController::onClose ---------> Was invoked !");
    _cartListener?.cancel();
    _cartListener = null;
    super.onClose();
  }
}
