import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/helpers/OffersHelpers/OfferHelper.dart';
import 'package:mezcalmos/CustomerApp/models/BusinessCartItem.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/CustEventView/CustEventView.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/CustHomeRentalView/CustHomeRentalView.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/CustRentalView/CustRentalView.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/CustServiceView/CustServiceView.dart';
import 'package:mezcalmos/CustomerApp/pages/CustOrderView/CustBusinessOrderView.dart';
import 'package:mezcalmos/Shared/cloudFunctions/index.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/customer/businessCart/hsBusinessCart.dart';
import 'package:mezcalmos/Shared/graphql/customer/hsCustomer.dart';
import 'package:mezcalmos/Shared/helpers/BusinessHelpers/BusinessItemHelpers.dart';
import 'package:mezcalmos/Shared/helpers/BusinessHelpers/BusinessOrderHelper.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

class CustBusinessCartController extends GetxController {
// instances //
  HasuraDb _hasuraDb = Get.find<HasuraDb>();
  AuthController _auth = Get.find<AuthController>();
  //
  Rxn<CustBusinessCart> cart = Rxn<CustBusinessCart>();

  Rxn<CustBusinessCart> currentOrderInView = Rxn<CustBusinessCart>();
  Rxn<int> currentOrderIdInView = Rxn<int>();

  Rxn<List<CustBusinessCart>?> previousOrders = Rxn<List<CustBusinessCart>?>();
  RxBool get hasPendingOrder => previousOrders.value != null
      ? previousOrders.value!
          .any((CustBusinessCart element) => element.status!.isPending)
          .obs
      : false.obs;
  RxBool get hasPastOrder => previousOrders.value != null
      ? previousOrders.value!
          .any((CustBusinessCart element) => element.status!.isPast)
          .obs
      : false.obs;
  RxList<CustBusinessCart>? get pastOrders => previousOrders.value != null
      ? previousOrders.value!
          .where((CustBusinessCart element) => element.status!.isPast)
          .toList()
          .obs
      : <CustBusinessCart>[].obs;
  // streams //
  StreamSubscription<List<CustBusinessCart>?>? cartStream;
  String? subscriptionId;
  int _numberOfOldBusinessOrders = 0;

  TextEditingController couponController = TextEditingController();

  @override
  Future<void> onInit() async {
    if (_auth.hasuraUserId != null) {
      mezDbgPrint(
          "[+] CustBusinessCartController::onInit hasuraUserId NOT NULL -> Callback Executed.");
      await _initCart();

      cart.refresh();
    }
    unawaited(_getPastBusinessOrdersCount());
    mezDbgPrint("[+] CustBusinessCartController::onInit -> Callback Executed.");
    super.onInit();
  }

  Future<void> _getPastBusinessOrdersCount() async {
    await get_customer_orders_count(
            customerId: _auth.hasuraUserId!, orderType: OrderType.Business)
        .then((int? value) {
      if (value != null) {
        _numberOfOldBusinessOrders = value;
      }
    });
  }

  @override
  void onClose() {
    if (subscriptionId != null) _hasuraDb.cancelSubscription(subscriptionId!);
    super.onClose();
  }

  Future<void> _initCart() async {
    await fetchCart();
    await _handlerBusinessId();
    subscriptionId = _hasuraDb.createSubscription(start: () {
      cartStream =
          listen_on_business_order_request(customerId: _auth.hasuraUserId!)
              .listen((List<CustBusinessCart>? event) {
        if (event != null) {
          mezDbgPrint(
              "Stream triggred from business cart controller ${_auth.hasuraUserId!} ✅✅✅✅✅✅✅✅✅ \n items length =====> ${event.length}");
          if (previousOrders.value != null) {
            previousOrders.value?.clear();
            previousOrders.value?.addAll(event);

            if (currentOrderIdInView.value != null) {
              setCurrentOrderInView(currentOrderIdInView.value!);
            }

            previousOrders.value = event;
          } else {
            previousOrders.value = event;
          }

          _handlerBusinessId();
          mezDbgPrint(
              "Cart items lenght in object ===========>${previousOrders.value?.length}");
          previousOrders.refresh();
        } else {
          previousOrders.value = null;
          previousOrders.refresh();
        }
      });
    }, cancel: () {
      cartStream?.cancel();
      cartStream = null;
    });
  }

  Future<bool> showDisclaimerPopup() async {
    final int? numberOfOrders = await get_customer_orders_count(
        customerId: _auth.hasuraUserId!, orderType: OrderType.Business);

    print('dddddddddddddddddddddddd $numberOfOrders');
    return numberOfOrders == null || _numberOfOldBusinessOrders < 5;
  }

  void setCurrentOrderInView(int orderId) {
    currentOrderIdInView.value = orderId;
    if (previousOrders.value != null) {
      final CustBusinessCart? order = previousOrders.value?.firstWhereOrNull(
          (CustBusinessCart element) => element.id == orderId);
      if (order != null) {
        currentOrderInView.value = order;
        currentOrderInView.refresh();
      }
    }
  }

  Future<void> clearCart() async {
    cart.value!.items = [];
    cart.refresh();
    await clear_business_cart(
      customer_id: _auth.hasuraUserId!,
    );
  }

  Future<void> fetchCart() async {
    if (_auth.hasuraUserId != null) {
      final CustBusinessCart? value = await get_business_cart(
        customerId: _auth.hasuraUserId!,
      );
      mezDbgPrint("Cart value ============> $value");
      if (value != null && value.items.isNotEmpty && value.businessId != null) {
        cart.value = value;
        await applyOffersToBusinessCart(
            cart: cart.value!, customerId: _auth.hasuraUserId!);
        cart.refresh();
      } else {
        cart.value = value;
        cart.refresh();
        await create_business_cart(businessId: value?.businessId?.toInt());
      }
    }
  }

  Future<void> _handlerBusinessId() async {
    if (cart.value != null &&
        cart.value?.businessId == null &&
        cart.value!.items.isNotEmpty) {
      await setCartBusinessId(cart.value!.businessId?.toInt() ?? null);
    }
  }

  Future<int?> setCartBusinessId(int? businessId) async {
    try {
      final int res = await set_cart_business_id(
        customer_id: _auth.hasuraUserId!,
        business_id: businessId,
      );
      return res;
    } catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
    }
    return null;
  }

  Future<int?> addCartItem(BusinessCartItem cartItem) async {
    try {
      final CustBusinessCart? cartData = await get_business_cart(
        customerId: _auth.hasuraUserId!,
      );
      if (cartData == null) {
        await create_business_cart(businessId: cartItem.businessId!.toInt());
      } else if (cartData.businessId == null) {
        await setCartBusinessId(cartItem.businessId!.toInt());
      }
      final int res = await add_item_to_business_cart(
        cartItem: cartItem,
      );
      await fetchCart();
      return res;
    } catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
    }
    return null;
  }

  Future<void> updateCartItem(BusinessCartItem cartItem) async {
    try {
      await update_item_to_business_cart(
        cartItem: cartItem,
      );
      await fetchCart();
    } catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
    }
    return;
  }

  Future<bool?> deleteCartItem(int cartItemId) async {
    final BusinessCartItem? cartItem = cart.value!.items.firstWhereOrNull(
        (BusinessCartItem element) => element.id == cartItemId);
    if (cartItem != null) {
      await delete_item_to_business_cart(itemId: cartItemId);
      await fetchCart();
      showSavedSnackBar(
        title: "Item removed",
      );
      return true;
    } else
      return false;
  }

  Future<bool?> requestOrder() async {
    try {
      final CustBusinessCart? cartData = await get_business_cart(
        customerId: _auth.hasuraUserId!,
      );
      if (cartData != null &&
          cartData.businessId == null &&
          cartData.businessId != cart.value!.businessId) {
        await setCartBusinessId(cart.value!.businessId!.toInt());
      }
      if (cartData != null &&
          cartData.businessId == null &&
          cart.value!.businessId == null) {
        await setCartBusinessId(cart.value!.businessId!.toInt());
      }
      if (cart.value != null && cart.value!.items.isNotEmpty) {
        final OrderReqResponse requestData =
            await CloudFunctions.business_requestOrder(
          customerAppType: CustomerAppType.Native,
        );
        mezDbgPrint(
            "requestOrder: ${requestData.success} ${requestData.orderId}");
        if (requestData.success) {
          cart.value?.items = [];
          cart.refresh();
          // await MezRouter.back();
          await CustBusinessOrderView.navigate(
              orderId: requestData.orderId!.toInt());
        }
        return requestData.success;
      }
    } catch (e) {
      mezDbgPrint("requestOrder ===> $e");
      return null;
    }
    return null;
  }

  Future<void> updateProductItemCount({
    required BusinessCartItem item,
    required int count,
  }) async {
    await update_product_item_count(
      id: item.id!.toInt(),
      parameters: item.parameters.copyWith(numberOfUnits: count),
      cost: item.product!.details.cost.entries.first.value.toDouble() * count,
    );
    await fetchCart();
  }

  Future<void> editCartItem(BusinessCartItem item) async {
    switch (item.offeringType) {
      case OfferingType.Home:
        await CustHomeRentalView.navigate(
          rentalId: item.home!.id!.toInt(),
          cartId: item.id!.toInt(),
          timeCost: {
            item.parameters.timeUnit!:
                item.home!.details.cost[item.parameters.timeUnit!]!,
          },
          duration: item.parameters.numberOfUnits!.toInt(),
          guestCount: item.parameters.guests!.toInt(),
          startDate: DateTime.parse(item.time!),
          roomType: item.parameters.roomType,
        );
        return;
      case OfferingType.Rental:
        await CustRentalView.navigate(
          rentalId: item.rental!.id!.toInt(),
          cartId: item.id!.toInt(),
          timeCost: {
            item.parameters.timeUnit!:
                item.rental!.details.cost[item.parameters.timeUnit!]!,
          },
          duration: item.parameters.numberOfUnits!.toInt(),
          startDate: DateTime.parse(item.time!),
        );
        return;
      case OfferingType.Event:
        await CustEventView.navigate(
          eventId: item.event!.id!.toInt(),
          cartId: item.id!.toInt(),
          timeCost: {
            item.parameters.timeUnit!:
                item.event!.details.cost[item.parameters.timeUnit!]!,
          },
          duration: item.parameters.numberOfUnits!.toInt(),
          startDate: DateTime.parse(item.time!),
        );
        return;
      case OfferingType.Service:
        await CustServiceView.navigate(
          serviceId: item.service!.id!.toInt(),
          cartId: item.id!.toInt(),
          timeCost: {
            item.parameters.timeUnit!:
                item.service!.details.cost[item.parameters.timeUnit!]!,
          },
          duration: item.parameters.numberOfUnits!.toInt(),
          startDate: DateTime.parse(item.time!),
        );
        return;
      case OfferingType.Product:
        return;
    }
  }

  Future<void> applyCoupon() async {
    CouponError? response = await applyBusinessCoupon(
      cart: cart.value!,
      customerId: _auth.hasuraUserId!,
      couponCode: couponController.text.trim(),
    );
    mezDbgPrint("response: ${response?.name}");
  }
}
