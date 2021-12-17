import 'package:firebase_database/firebase_database.dart';
import 'package:mezcalmos/Shared/firebaseNodes/customerNodes.dart';
import 'package:mezcalmos/CustomerApp/models/Cart.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/ServerResponse.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:get/get.dart';
import 'dart:async';

import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

class RestaurantController extends GetxController {
  FirebaseDb _databaseHelper = Get.find<FirebaseDb>();
  AuthController _authController = Get.find<AuthController>();

  StreamSubscription? _cartListener;
  Restaurant? associatedRestaurant;
  Rx<Cart> cart = Cart().obs;
  @override
  void onInit() {
    super.onInit();
    print("--------------------> RestaurantsCartController Initialized !");
    if (_authController.fireAuthUser != null) {
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
            mezDbgPrint(" =====> $cartData \n");

            // if no associated restaurant data is saved, then fetch it from database
            if (associatedRestaurant == null) {
              associatedRestaurant =
                  await getAssociatedRestaurant(cartData["serviceProviderId"]);
            }
            if (cartData == null) {
              cart.value = Cart();
            }
            cart.value = Cart.fromCartData(cartData, associatedRestaurant!);
          }
        } else {
          cart.value = Cart();
          associatedRestaurant = null;
        }
      });
    }
  }

  Future<Restaurant> getAssociatedRestaurant(String restaurantId) async {
    DataSnapshot snapshot = await _databaseHelper.firebaseDatabase
        .reference()
        .child('restaurants/info/${restaurantId}')
        .once();
    return Restaurant.fromRestaurantData(
        restaurantId: restaurantId, restaurantData: snapshot.value);
  }

  void saveCart() {
    _databaseHelper.firebaseDatabase
        .reference()
        .child(customerCart(_authController.fireAuthUser!.uid))
        .set(cart.value.toFirebaseFormattedJson());
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
    saveCart();
  }

  void incrementItem(String itemId, int quantity) {
    cart.value.incrementItem(itemId, quantity);
    saveCart();
  }

  void deleteItem(String itemId) {
    cart.value.deleteItem(itemId);
    saveCart();
  }

  void clearCart() {
    _databaseHelper.firebaseDatabase
        .reference()
        .child(customerCart(_authController.user!.uid))
        .remove();
  }

  Future<ServerResponse> checkout() async {
    HttpsCallable checkoutRestaurantCart =
        FirebaseFunctions.instance.httpsCallable("restaurant-checkoutCart");
    try {
      mezDbgPrint(cart.value.notes);
      mezDbgPrint(cart.value.toFirebaseFormattedJson());
      HttpsCallableResult response = await checkoutRestaurantCart
          .call(cart.value.toFirebaseFormattedJson());
      return ServerResponse.fromJson(response.data);
    } catch (e) {
      return ServerResponse(ResponseStatus.Error,
          errorMessage: "Server Error", errorCode: "serverError");
    }
  }

  Future<ServerResponse> cancelOrder(String orderId) async {
    HttpsCallable cancelOrder = FirebaseFunctions.instance
        .httpsCallable('restaurant-cancelOrderFromCustomer');
    try {
      HttpsCallableResult response =
          await cancelOrder.call({"orderId": orderId});
      mezDbgPrint(response.toString());
      print(response.data);
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
