import 'dart:async';

import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/models/BusinessCartItem.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/CustHomeRentalView.dart';
import 'package:mezcalmos/Shared/helpers/BusinessHelpers/BusinessItemHelpers.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/graphql/customer/businessCart/hsBusinessCart.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/cloudFunctions/index.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';

class CustBusinessCartController extends GetxController {
// instances //
  HasuraDb _hasuraDb = Get.find<HasuraDb>();
  AuthController _auth = Get.find<AuthController>();
  //
  Rxn<CustBusinessCart> cart = Rxn<CustBusinessCart>();

  Rxn<CustBusinessCart> currentOrderInView = Rxn<CustBusinessCart>();
  Rxn<int> currentOrderIdInView = Rxn<int>();

  Rxn<List<CustBusinessCart>?> previousOrders = Rxn<List<CustBusinessCart>?>();
  // streams //
  StreamSubscription<List<CustBusinessCart>?>? cartStream;
  String? subscriptionId;

  @override
  Future<void> onInit() async {
    if (_auth.hasuraUserId != null) {
      mezDbgPrint(
          "[+] CustBusinessCartController::onInit hasuraUserId NOT NULL -> Callback Executed.");
      await _initCart();

      cart.refresh();
    }
    mezDbgPrint("[+] CustBusinessCartController::onInit -> Callback Executed.");
    super.onInit();
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
              "Stream triggred from cart controller ${_auth.hasuraUserId!} ✅✅✅✅✅✅✅✅✅ \n items length =====> ${event.length}");
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

  void setCurrentOrderInView(int orderId) {
    currentOrderIdInView.value = orderId;
    if (previousOrders.value != null) {
      final CustBusinessCart? order = previousOrders.value!
          .firstWhere((CustBusinessCart element) => element.id == orderId);
      if (order != null) {
        currentOrderInView.value = order;
        currentOrderInView.refresh();
      }
    }
  }

  Future<void> fetchCart() async {
    if (_auth.hasuraUserId != null) {
      final CustBusinessCart? value = await get_business_cart(
        customerId: _auth.hasuraUserId!,
      );
      mezDbgPrint("Cart value ============> $value");
      if (value != null && value.items.isNotEmpty && value.businessId != null) {
        cart.value = value;
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
    await setCartBusinessId(cartItem.businessId!.toInt());

    try {
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
    return null;
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
      if (cart.value != null && cart.value!.items.isNotEmpty) {
        var requestData = await CloudFunctions.business_requestOrder(
          businessId: cart.value!.businessId!.toInt(),
          customerAppType: CustomerAppType.Native,
        );
        mezDbgPrint("requestOrder: ${requestData.success}");
        if (requestData.success) {
          cart.value = null;
          cart.refresh();
          await MezRouter.back();
        }
        return requestData.success;
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  Future<void> acceptOrderRequest() async {
    await CloudFunctions.business_handleOrderRequestFromCustomer(
      orderRequestId: currentOrderIdInView.value!,
      newStatus: BusinessOrderRequestStatus.Confirmed,
    );
    showSavedSnackBar(
      title: "You have accepted the order request",
    );
  }

  Future<void> cancelOrderRequest() async {
    await CloudFunctions.business_handleOrderRequestFromCustomer(
      orderRequestId: currentOrderIdInView.value!,
      newStatus: BusinessOrderRequestStatus.CancelledByCustomer,
    );
    showSavedSnackBar(
      title: "You have cancelled the order request",
    );
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
      case OfferingType.Rental:
        if (item.rental!.category1 == RentalCategory1.Home) {
          await CustHomeRentalView.navigate(
            rentalId: item.rental!.id!.toInt(),
            cartId: item.id!.toInt(),
            timeCost: {
              item.parameters.timeUnit!:
                  item.rental!.details.cost[item.parameters.timeUnit!]!,
            },
            duration: item.parameters.numberOfUnits!.toInt(),
            guestCount: item.parameters.guests!.toInt(),
            startDate: DateTime.parse(item.time!),
          );
          return;
        }
        return;
      case OfferingType.Event:
        // TODO: Handle this case.
        break;
      case OfferingType.Service:
        // TODO: Handle this case.
        break;
      case OfferingType.Product:
        // TODO: Handle this case.
        break;
    }
  }
}