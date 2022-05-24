import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/LaundryApp/controllers/laundryInfoController.dart';
import 'package:mezcalmos/LaundryApp/controllers/orderController.dart';
import 'package:mezcalmos/LaundryApp/pages/OrderView/components/LaundryOrderWeightSelector.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/ServerResponse.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';

//
dynamic _i18n() => Get.find<LanguageController>().strings['LaundryApp']['pages']
    ['OrderView']['Components']['LaundryOpSetCategoryComponent'];
//

class SetOrderWeightBottomSheet extends StatefulWidget {
  const SetOrderWeightBottomSheet({
    Key? key,
    this.editMode = false,
    this.oldItem,
    required this.order,
  }) : super(key: key);
  final bool editMode;
  final LaundryOrderCostLineItem? oldItem;

  final LaundryOrder order;

  @override
  State<SetOrderWeightBottomSheet> createState() =>
      _SetOrderWeightBottomSheetState();
}

class _SetOrderWeightBottomSheetState extends State<SetOrderWeightBottomSheet> {
  final LanguageType userLanguage =
      Get.find<LanguageController>().userLanguageKey;
  TextEditingController itemsWeightController = TextEditingController();

  OrderController orderController = Get.find<OrderController>();
  LaundryInfoController laundryInfoController =
      Get.find<LaundryInfoController>();

  Rxn<LaundryCostLineItem?> newCategory = Rxn();
  RxBool isLoading = RxBool(false);

  RxBool isClicked = RxBool(false);

  @override
  void initState() {
    if (widget.editMode && widget.oldItem != null) {
      newCategory.value = widget.oldItem;
      itemsWeightController.text = widget.oldItem!.weight.toString();
    }
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    itemsWeightController.dispose();
    newCategory.value = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (isLoading.isFalse) {
        return Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(8),
                  child: Text(
                    (widget.editMode && widget.oldItem != null)
                        ? widget.oldItem!.name[userLanguage]!
                        : "${_i18n()["newItemsWeight"]}",
                    style: Theme.of(context).textTheme.bodyText1,
                  )),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("${_i18n()["itemsCategory"]}"),
                  Spacer(),
                  if (widget.editMode)
                    InkWell(
                      onTap: () async {
                        bool isDeleted = false;
                        await showConfirmationDialog(context,
                            primaryButtonText: "Yes delete item",
                            helperText:
                                "Are you sure you want to delete this item",
                            title: "Delete item", onYesClick: () async {
                          await deleteItem(widget.oldItem!).whenComplete(() {
                            Get.back();
                            isDeleted = true;
                          });
                        }).whenComplete(() {
                          if (isDeleted == true) {
                            Get.back();
                          }
                        });
                      },
                      child: Ink(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          children: [
                            Icon(
                              Icons.delete_outline_outlined,
                              color: Colors.red,
                            ),
                            Text(
                              "Delete",
                              style: Get.textTheme.bodyText2?.copyWith(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                      ),
                    )
                ],
              ),
              //    Category selector
              LaundryOrderWeightSelector(
                newCategory: newCategory,
              ),

              SizedBox(
                height: 15,
              ),
              Text("${_i18n()["itemsWeight"]}"),
              TextFormField(
                controller: itemsWeightController,
                style: Theme.of(context).textTheme.bodyText1,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),
                ],
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (String? v) {
                  if (num.tryParse(v!) == null) {
                    return "${_i18n()["itemsWeightErrorText"]}";
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                    suffixText: "KG",
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    alignLabelWithHint: false,
                    fillColor: Colors.white,
                    filled: true),
              ),
              SizedBox(
                height: 10,
              ),
              Obx(
                () => InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: isClicked.value
                        ? null
                        : () {
                            saveItemsWeight();
                          },
                    child: Ink(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                              colors: [primaryBlueColor, Colors.purple])),
                      child: Center(
                        child: (isClicked.value)
                            ? SizedBox(
                                height: 30,
                                width: 30,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              )
                            : Text(
                                (widget.editMode)
                                    ? "Edit items "
                                    : "${_i18n()["saveItemsWeight"]}",
                                style: Get.textTheme.bodyText1
                                    ?.copyWith(color: Colors.white)),
                      ),
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  style: TextButton.styleFrom(backgroundColor: Colors.red),
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(5),
                    child: Text("${_i18n()["cancel"]}"),
                  )),
            ],
          ),
        );
      } else {
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
            ),
            Container(
                alignment: Alignment.center,
                child: CircularProgressIndicator()),
            SizedBox(
              height: 100,
            ),
          ],
        );
      }
    });
  }
  // delete item

  Future<void> deleteItem(LaundryOrderCostLineItem item) async {
    final LaundryOrderCosts? oldCosts = widget.order.costsByType;
    if (oldCosts != null) {
      if (oldCosts.lineItems.length > 1) {
        oldCosts.lineItems.removeWhere(
            (LaundryOrderCostLineItem element) => element.name == item.name);
        await orderController.setOrderWeight(widget.order.orderId, oldCosts);
      } else {
        Get.snackbar(
          "${_i18n()["error"]}",
          "Every laundry order must have at least one oder items weight",
          padding: EdgeInsets.all(16),
          backgroundColor: Colors.grey.shade800,
          colorText: Colors.white,
        );
      }
    }
  }

// first  function that get's triggred when clicking save/edit items weight , works as wrapper of sub functions
  void saveItemsWeight() {
    isClicked.value = true;

    if (newCategory.value == null) {
      handlingNoCategoryError();
    } else if (num.tryParse(itemsWeightController.text) == null) {
      handlingWeightNotValid();
    } else {
      handlingNewOrderWeight();
    }
  }

// handling when the weight and category is well formated and go throught the process of editing or adding new items weight
  void handlingNewOrderWeight() {
    final LanguageType primaryLangauge =
        laundryInfoController.laundry.value!.primaryLanguage;
    final LaundryOrderCostLineItem newCostLineItem = LaundryOrderCostLineItem(
        weight: num.parse(itemsWeightController.text),
        name: newCategory.value!.name,
        cost: newCategory.value!.cost);

    final LaundryOrderCostLineItem? _tempCatgeory = widget
        .order.costsByType?.lineItems
        .firstWhereOrNull((LaundryOrderCostLineItem element) =>
            element.name[primaryLangauge] ==
            newCostLineItem.name[primaryLangauge]);
    if (_tempCatgeory != null && !widget.editMode) {
      handlingCategroryAlreadySelected();
    } else if (_tempCatgeory != null &&
        widget.editMode &&
        _tempCatgeory.name != widget.oldItem!.name) {
      handlingCategroryAlreadySelected();
    } else {
      settingNewOrderWeight(newCostLineItem);
    }
  }

// final function that will trigger the order controller with setting the final order cost items
  void settingNewOrderWeight(LaundryOrderCostLineItem newCostLineItem) {
    final LanguageType primaryLangauge =
        laundryInfoController.laundry.value!.primaryLanguage;
    LaundryOrderCosts? oldCosts = widget.order.costsByType;
    if (oldCosts != null) {
      if (widget.editMode) {
        oldCosts.lineItems.removeWhere((LaundryOrderCostLineItem element) =>
            element.name[primaryLangauge] ==
            widget.oldItem!.name[primaryLangauge]);
      }
      oldCosts.lineItems.add(newCostLineItem);
    } else {
      oldCosts = LaundryOrderCosts();
      oldCosts.lineItems.add(newCostLineItem);
    }

    orderController
        .setOrderWeight(widget.order.orderId, oldCosts)
        .then((ServerResponse value) {
      mezDbgPrint("Done");

      Get.back();
      // disposeBottomSheet();
    }).whenComplete(() => isClicked.value = false);
  }

// Showing snackbar saying that the this category already selected
  void handlingCategroryAlreadySelected() {
    isClicked.value = false;
    Get.snackbar(
      "${_i18n()["error"]}",
      "${_i18n()["categoryExistError"]}",
      padding: EdgeInsets.all(16),
      backgroundColor: Colors.grey.shade800,
      colorText: Colors.white,
    );
  }

// Showing snackbar saying that the order weight is not valid
  void handlingWeightNotValid() {
    Get.snackbar(
      "${_i18n()["error"]}",
      "${_i18n()["itemsWeightError"]}",
      padding: EdgeInsets.all(16),
      backgroundColor: Colors.grey.shade800,
      colorText: Colors.white,
    );
    isClicked.value = false;
  }

// showing snackbar saying that no category is selected
  void handlingNoCategoryError() {
    Get.snackbar(
      "${_i18n()["error"]}",
      "${_i18n()["categoryError"]}",
      padding: EdgeInsets.all(16),
      backgroundColor: Colors.grey.shade800,
      colorText: Colors.white,
    );
    isClicked.value = false;
  }
}
