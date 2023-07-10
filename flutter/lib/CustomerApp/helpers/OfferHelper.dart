// go through list of restaurant offers
// if an offer is a promotion, then check if it is valid
// if it is valid, then apply discount
// go through list of offers applied
// if an offer is a coupon, then check if it is valid
// if it is valid, then apply discount

import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/models/Cart.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart' as cModels;
import 'package:mezcalmos/Shared/graphql/customer/restaurantCart/hsRestaurantCart.dart';
import 'package:mezcalmos/Shared/graphql/order/hsRestaurantOrder.dart';
import 'package:mezcalmos/Shared/graphql/service_provider/hsServiceProvider.dart';

Future<void> apply_offers_to_item(
    {required int customerId,
    required Cart cart,
    required CartItem cartItem}) async {
  List<cModels.Offer> offers = await get_service_provider_offers(
      serviceProviderId: cartItem.restaurantId,
      serviceProviderType: cModels.ServiceProviderType.Restaurant);
  List<cModels.Offer> activePromotions = offers
      .where((cModels.Offer offer) =>
          offer.offerType == cModels.OfferType.Promotion &&
          offer.status == cModels.OfferStatus.Active)
      .toList();

  int numberOfCustomerRestaurantOrders = 0;
  for (cModels.Offer promo in activePromotions) {
    if (promo.details.offerForOrder == "firstOrder") {
      numberOfCustomerRestaurantOrders =
          await number_of_customer_restaurant_orders(
              customerId: customerId, restaurantId: cartItem.restaurantId);
      break;
    }
  }
  num discount = 0;
  // if (cart.cartItems.length == 1) {
  for (cModels.Offer promo in activePromotions) {
    if (promo.details.validityRangeStart != null &&
        promo.details.validityRangeEnd != null) {
      DateTime currentTime = DateTime.now();
      DateTime validityRangeStart =
          DateTime.parse(promo.details.validityRangeStart!);
      DateTime validityRangeEnd =
          DateTime.parse(promo.details.validityRangeEnd!);

      if (promo.details.weeklyRepeat) {
        if (currentTime.weekday < validityRangeStart.weekday ||
            currentTime.weekday > validityRangeEnd.weekday) {
          continue;
        } else if (currentTime.weekday == validityRangeStart.weekday) {
          if (currentTime.hour < validityRangeStart.hour) continue;
          if ((currentTime.hour == validityRangeStart.hour) &&
              (currentTime.minute < validityRangeStart.minute)) continue;
        } else if (currentTime.weekday == validityRangeEnd.weekday) {
          if (currentTime.hour > validityRangeEnd.hour) continue;
          if ((currentTime.hour == validityRangeEnd.hour) &&
              (currentTime.minute > validityRangeEnd.minute)) continue;
        }
      } else if (currentTime.isBefore(validityRangeStart) ||
          currentTime.isAfter(validityRangeEnd)) {
        continue;
      }
    }

    if (promo.details.offerForOrder == "firstOrder") {
      if (numberOfCustomerRestaurantOrders > 0) continue;
    }
    discount += calculateDiscount(cart, cartItem, promo);
  }
  // } else {
  //   for (num o in cart.offersApplied) {
  //     cModels.Offer? promo = activePromotions
  //         .firstWhereOrNull((cModels.Offer promo) => o == promo.id);
  //     if (promo != null) {
  //       discount += calculateDiscount(cart, cartItem, promo);
  //     }
  //   }
  // }
  List<cModels.Offer> activeCoupons = offers
      .where((cModels.Offer offer) =>
          offer.offerType == cModels.OfferType.Coupon &&
          offer.status == cModels.OfferStatus.Active)
      .toList();
  cart.offersApplied.forEach((o) {
    cModels.Offer? coupon = activeCoupons
        .firstWhereOrNull((cModels.Offer coupon) => o == coupon.id);
    if (coupon != null) {
      discount += calculateDiscount(cart, cartItem, coupon);
    }
  });
  cart.discountValue += discount;
  await update_cart_discount(
      customerId: customerId,
      appliedOffers: cart.offersApplied,
      discountValue: cart.discountValue);
}

num calculateDiscount(Cart cart, CartItem cartItem, cModels.Offer offer) {
  num discount = 0;

  switch (offer.details.discountType) {
    case cModels.DiscountType.StoreCredit:
      break;
    case cModels.DiscountType.FlatAmount:
      if (offer.details.offerForItems == "particularItems") {
        offer.details.items!.forEach((c) => {
              if (c == cartItem.item.id)
                {discount = offer.details.discountValue}
            });
      } else if (offer.details.offerForItems == "particularCategories") {
        offer.details.categories!.forEach((c) => {
              if (c == cartItem.item.categoryId)
                {discount = offer.details.discountValue}
            });
      } else {
        discount = offer.details.discountValue;
      }
      break;
    case cModels.DiscountType.Percentage:
      if (offer.details.offerForItems == "particularItems") {
        offer.details.items!.forEach((c) => {
              if (c == cartItem.item.id)
                {
                  discount =
                      cartItem.item.cost * offer.details.discountValue / 100
                }
            });
      } else if (offer.details.offerForItems == "particularCategories") {
        offer.details.categories!.forEach((c) => {
              if (c == cartItem.item.categoryId)
                {
                  discount =
                      cartItem.item.cost * offer.details.discountValue / 100
                }
            });
      } else {
        discount = cartItem.item.cost * offer.details.discountValue / 100;
      }
      break;
    case cModels.DiscountType.AnotherSameFlat:
      int sameItems = 0;
      if (offer.details.offerForItems == "particularItems") {
        for (num c in offer.details.items!) {
          if (c == cartItem.item.id) {
            cart.cartItems.forEach((i) {
              if (i.item.id == cartItem.item.id) {
                sameItems += i.quantity;
              }
            });
            if (sameItems % 2 == 0) {
              discount = offer.details.discountValue;
            }
            break;
          }
        }
      } else {
        for (num c in offer.details.categories!) {
          if (c == cartItem.item.categoryId) {
            cart.cartItems.forEach((i) {
              if (i.item.categoryId == cartItem.item.categoryId) {
                sameItems += i.quantity;
              }
            });
            if (sameItems % 2 == 0) {
              discount = offer.details.discountValue;
            }
            break;
          }
        }
      }
      break;
    case cModels.DiscountType.AnotherSamePercentage:
      int sameItems = 0;
      if (offer.details.offerForItems == "particularItems") {
        for (num c in offer.details.items!) {
          if (c == cartItem.item.id) {
            cart.cartItems.forEach((i) {
              if (i.item.id == cartItem.item.id) {
                sameItems += i.quantity;
              }
            });
            if (sameItems % 2 == 0) {
              discount = cartItem.item.cost * offer.details.discountValue / 100;
            }
            break;
          }
        }
      } else {
        for (num c in offer.details.categories!) {
          if (c == cartItem.item.categoryId) {
            cart.cartItems.forEach((i) {
              if (i.item.categoryId == cartItem.item.categoryId) {
                sameItems += i.quantity;
              }
            });
            if (sameItems % 2 == 0) {
              discount = cartItem.item.cost * offer.details.discountValue / 100;
            }
            break;
          }
        }
      }
      break;
  }
  if (discount > 0) {
    if (cart.offersApplied.firstWhereOrNull((o) => o == offer.id) == null) {
      cart.offersApplied.add(offer.id.toInt());
    }
  }
  return discount;
}
