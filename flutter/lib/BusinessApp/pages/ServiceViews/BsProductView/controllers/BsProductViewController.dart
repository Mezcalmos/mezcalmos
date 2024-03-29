import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/controllers/BusinessDetailsController.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/controllers/LanguagesTabsController.dart';
import 'package:mezcalmos/Shared/graphql/business_product/hsBusinessProduct.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';

class BsProductViewController {
  // instances //

  LanguageTabsController languageTabsController = LanguageTabsController();

  // streams //

  // variables //
  int? productId;

  // states variables //

  // methods //

  // instances //
  BusinessItemDetailsController detailsController =
      BusinessItemDetailsController();
  // vars //
  bool shouldRefetch = false;
  // state variables //
  Rxn<ProductWithBusinessCard> _product = Rxn<ProductWithBusinessCard>();
  ProductWithBusinessCard? get product => _product.value;
  bool get isEditing => _product.value != null;
  Rxn<ProductCategory1> productCategory = Rxn<ProductCategory1>();

  List<TimeUnit> get _possibleTimeUnits => List.unmodifiable([TimeUnit.Unit]);
  List<TimeUnit> get avalbleUnits => _possibleTimeUnits
      .where((TimeUnit element) =>
          detailsController.priceTimeUnitMap.keys.contains(element) == false)
      .toList();
  ServiceProviderLanguage? get languages => languageTabsController.language;
  bool get hasSecondaryLang => languages?.secondary != null;
  bool get hasData {
    if (productId != null) {
      return _product.value != null &&
          languageTabsController.tabController != null;
    } else
      return languageTabsController.tabController != null;
  }

  Future<void> init(
      {required TickerProvider thickerProvider,
      required int detailsId,
      required int businessId,
      int? productId}) async {
    this.productId = productId;
    await languageTabsController.init(
        vsync: thickerProvider, detailsId: detailsId);
    detailsController.initDetails(
        businessId: businessId,
        language: languages!,
        businessDetailsId: detailsId);
    detailsController.addPriceTimeUnit(timeUnit: avalbleUnits.first);
    if (productId != null) {
      this.productId = productId;
      await initEditMode(id: productId);
    }
  }

  Future<void> initEditMode({required int id}) async {
    _product.value = await get_product_by_id(id: id, withCache: false);
    mezDbgPrint(
        "product id : $id ${_product.value?.toFirebaseFormattedJson()}");
    if (product != null) {
      await detailsController.initEditMode(
          itemDetailsId: product!.details.id.toInt());
      productCategory.value = product!.category1;
    }
  }

  Future<void> saveItemDetails() async {
    await detailsController.updateItemDetails();
  }

  Future<Product> _constructProduct() async {
    final BusinessItemDetails details =
        await detailsController.contructDetails();
    final Product product = Product(
      category1: productCategory.value!,
      details: details,
    );
    return product;
  }

  Future<void> save() async {
    if (languageTabsController.validate()) {
      if (isEditing) {
        try {
          await saveItemDetails();
          if (productCategory.value != null) {
            await update_product_category1(
              id: product!.details.id.toInt(),
              productCategory: productCategory.value!,
            );
            showSavedSnackBar();
            shouldRefetch = true;
          }
        } catch (e, stk) {
          mezDbgPrint(
              " 🛑 ${product?.id?.toInt()}  OperationException : ${e.toString()}");
          mezDbgPrint(stk);
          showErrorSnackBar();
        }
        shouldRefetch = true;
      } else {
        final Product _product = await _constructProduct();
        mezDbgPrint("busniess id : ${_product.details.businessId}");
        await createItem(_product);
      }
    }
  }

  void dispose() {
   languageTabsController.dispose();
  }

  Future<void> createItem(Product product) async {
    mezDbgPrint(
        "Create product with this payload : ${product.toFirebaseFormattedJson()}");
    try {
      final int? res = await add_one_product(product: product);

      if (res != null) {
        showAddedSnackBar();
        shouldRefetch = true;
        detailsController.clearImages();
        await initEditMode(id: res);
      }
    } on OperationException catch (e) {
      mezDbgPrint(" 🛑  OperationException : ${e.graphqlErrors[0].message}");
    }
  }

  Future<void> deleteOffer() async {
    mezDbgPrint("prdouct id ============>$productId");
    try {
      await delete_business_product(productId: productId!);
      shouldRefetch = true;
    } catch (e, stk) {
      showErrorSnackBar();
      mezDbgPrint(e);
      mezDbgPrint(stk);
    }
  }
}
