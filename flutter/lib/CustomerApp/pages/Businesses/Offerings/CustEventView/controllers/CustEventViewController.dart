import 'package:get/get.dart';

import 'package:mezcalmos/CustomerApp/pages/CustCartView/CustCartView.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/graphql/business_event/hsBusinessEvent.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';
import 'package:mezcalmos/CustomerApp/controllers/custBusinessCartController.dart';
import 'package:mezcalmos/CustomerApp/models/BusinessCartItem.dart';

class CustEventViewController {
  final CustBusinessCartController custBusinessCartController =
      Get.find<CustBusinessCartController>();
  // state vars //
  Rxn<EventWithBusinessCard> _event = Rxn<EventWithBusinessCard>();
  Rxn<DateTime> _startDate = Rxn();
  Rx<String> orderString = Rx("-");
  Rxn<Map<TimeUnit, num>> _timeCost = Rxn();
  Rx<double> totalOrderCost = Rx(0);
  Rx<int> _totalHours = Rx(1);
  Rx<bool> isEditingMode = Rx<bool>(false);
  Rxn<int> _cartId = Rxn<int>();
  Rxn<bool> isOnlineOrdering = Rxn<bool>(false);
  Rx<bool> get isValidated {
    switch (_event.value!.scheduleType) {
      case ScheduleType.Scheduled:
        return _startDate.value != null ? Rx(true) : Rx(false);
      case ScheduleType.OneTime:
        return Rx(true);
      case ScheduleType.OnDemand:
        return _startDate.value != null ? Rx(true) : Rx(false);
    }
  }

  // getters //
  EventWithBusinessCard? get event => _event.value;
  Rxn<DateTime> get startDate => _startDate;
  Rxn<Map<TimeUnit, num>> get timeCost => _timeCost;
  Rx<int> get totalHours => _totalHours;
  // methods //
  Future<void> init({
    required int eventId,
    int? cartId,
    DateTime? startDate,
    Map<TimeUnit, num>? timeCost,
    int? duration,
  }) async {
    await fetchData(eventId: eventId);
    isOnlineOrdering.value = event!.business.onlineOrdering;
    if (startDate != null && duration != null) {
      _startDate.value = startDate;
      _timeCost.value = timeCost;
      _totalHours.value = duration;
      isEditingMode.value = true;
      _cartId.value = cartId;
    }
    _calcTotalOrderCost();
  }

  Future<void> fetchData({required int eventId}) async {
    _event.value = await get_event_by_id(id: eventId, withCache: false);
    _setInitialTimeCost();
    _calcTotalOrderCost();
  }

  void _setInitialTimeCost() {
    final TimeUnit costKey = _event.value!.details.cost.entries.first.key;
    final num costValue = _event.value!.details.cost.entries.first.value;
    _timeCost.value = {
      costKey: costValue,
    };
  }

  void _calcTotalOrderCost() {
    double newCost = 0;
    newCost += (totalHours.value) * (_timeCost.value!.values.first.toInt());
    totalOrderCost.value = newCost;
    if (totalOrderCost.value == 0.0) {
      orderString.value = "Free";
      return;
    }
    if (_event.value!.scheduleType == ScheduleType.OnDemand) {
      orderString.value =
          "\$${_timeCost.value!.values.first.toInt()} x $totalHours = \$${totalOrderCost.value.toStringAsFixed(0)}";
    } else {
      orderString.value = "\$${totalOrderCost.value.toStringAsFixed(0)}";
    }
  }

  void setTotalHours(int value) {
    totalHours.value = value;
    _calcTotalOrderCost();
  }

  Future<void> bookOffering() async {
    if (isEditingMode.value) {
      await custBusinessCartController.updateCartItem(
        BusinessCartItem(
          id: _cartId.value,
          businessId: _event.value!.business.id,
          itemId: _event.value!.id!,
          offeringType: OfferingType.Event,
          time: _event.value!.scheduleType == ScheduleType.OneTime
              ? _event.value!.startsAt
              : startDate.value!.toString(),
          parameters: BusinessItemParameters(
            numberOfUnits: totalHours.value,
            timeUnit: timeCost.value!.keys.first,
          ),
          cost: totalOrderCost.value,
          event: _event.value,
        ),
      );
    } else {
      await custBusinessCartController.addCartItem(
        BusinessCartItem(
          businessId: _event.value!.business.id,
          itemId: _event.value!.id!,
          offeringType: OfferingType.Event,
          time: _event.value!.scheduleType == ScheduleType.OneTime
              ? _event.value!.startsAt
              : startDate.value!.toString(),
          parameters: BusinessItemParameters(
            numberOfUnits: totalHours.value,
            timeUnit: timeCost.value!.keys.first,
          ),
          cost: totalOrderCost.value,
          event: _event.value,
        ),
      );
    }
    await CustCartView.navigate();
    startDate.value = null;
    startDate.refresh();
    orderString.value = "-";
    totalOrderCost.value = 0;
    _setInitialTimeCost();
    _calcTotalOrderCost();
  }
}
