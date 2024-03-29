import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/graphql/delivery_cost/hsDeliveryCost.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/DeliveryCost.dart';

class DeliveryCostSettingViewController {
  // text inputs //
  TextEditingController freeKmRange = TextEditingController();
  TextEditingController minCost = TextEditingController();
  TextEditingController costPerKmFromBase = TextEditingController();
  TextEditingController radius = TextEditingController();
  TextEditingController costPerKm = TextEditingController();
  TextEditingController distancePreview = TextEditingController();

  // obs //
  Rxn<DeliveryCost> deliveryCost = Rxn();
  RxBool isEditing = RxBool(false);
  RxnNum previewCost = RxnNum();
  late int deliveryDetailsId;

  // inti //
  Future<void> init({
    required int deliveryDetailsId,
  }) async {
    this.deliveryDetailsId = deliveryDetailsId;
    try {
      await fetchDeliveryCost();
    } on Exception catch (e, stk) {
      // TODO
      mezDbgPrint(e);
      mezDbgPrint(stk);
    }
  }

  Future<void> fetchDeliveryCost() async {
    deliveryCost.value = await get_delivery_cost(
      deliveryDetailsId: deliveryDetailsId,
      withCache: false,
    );
    if (deliveryCost.value != null) {
      isEditing.value = true;
      radius.text = (deliveryCost.value?.radius != null)
          ? (deliveryCost.value!.radius! / 1000).toString()
          : "";
      costPerKmFromBase.text = deliveryCost.value!.costPerKmFromBase.toString();
      freeKmRange.text =
          deliveryCost.value!.freeDeliveryKmRange?.toString() ?? "";
      minCost.text = deliveryCost.value!.minimumCost.toString();
      costPerKm.text = deliveryCost.value!.costPerKm.toString();
    }
  }

  Future<bool?> saveDeliveryCost() async {
    final bool? resp =
        isEditing.isTrue ? await _editDeliveryCost() : await _addDeliveryCost();
    return resp;
  }

  DeliveryCost _constructDeliveryCost() {
    mezDbgPrint("freeKmRange.text =====> [BBB] ===> ${freeKmRange.text}");
    return DeliveryCost(
        id: null,
        selfDelivery: false,
        costPerKmFromBase: double.parse(costPerKmFromBase.text),
        radius: (double.parse(radius.text) * 1000),
        minimumCost: double.parse(minCost.text),
        freeDeliveryKmRange: double.tryParse(freeKmRange.text),
        costPerKm: double.parse(costPerKm.text));
  }

  Future<bool?> _addDeliveryCost() async {
    try {
      final int? res =
          await add_delivery_cost(deliveryCost: _constructDeliveryCost());
      return res != null;
    } catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
    }
    return null;
  }

  Future<bool?> _editDeliveryCost() async {
    try {
      final bool? res = await update_delivery_cost(
          deliveryCostId: deliveryCost.value!.id!,
          deliveryCost: _constructDeliveryCost());
      if (res == true) {}
      return res == true;
    } catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
    }
    return null;
  }

  void calculatePreview() {
    final double dist = double.parse(distancePreview.text);
    final double kmCost = double.parse(costPerKm.text);
    final double min = double.parse(costPerKm.text);
    final double cost = dist * kmCost;
    previewCost.value = cost > min ? cost : min;
  }

  bool get canCalculate {
    return double.tryParse(costPerKm.text) != null &&
        double.tryParse(minCost.text) != null &&
        double.tryParse(costPerKm.text) != null;
  }

  void dispose() {
    costPerKm.clear();
    minCost.clear();
    freeKmRange.clear();
    distancePreview.clear();
    previewCost.close();
    deliveryCost.close();
  }
}
