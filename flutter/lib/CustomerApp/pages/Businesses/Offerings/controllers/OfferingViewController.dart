import 'package:get/get.dart';

import 'package:mezcalmos/CustomerApp/pages/CustCartView/CustCartView.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/graphql/business_event/hsBusinessEvent.dart';
import 'package:mezcalmos/Shared/graphql/business_product/hsBusinessProduct.dart';
import 'package:mezcalmos/Shared/graphql/business_rental/hsBusinessRental.dart';
import 'package:mezcalmos/Shared/graphql/business_service/hsBusinessService.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';
import 'package:mezcalmos/CustomerApp/controllers/custBusinessCartController.dart';
import 'package:mezcalmos/CustomerApp/models/BusinessCartItem.dart';

class CustServiceViewController {
  // state vars //
  Rxn<ServiceWithBusinessCard> _service = Rxn<ServiceWithBusinessCard>();

  // getters //
  ServiceWithBusinessCard? get service => _service.value;
  // methods //
  Future<void> fetchData({required int serviceId}) async {
    _service.value = await get_service_by_id(id: serviceId, withCache: false);
  }
}
//

class CustProductViewController {
  // state vars //
  Rxn<ProductWithBusinessCard> _product = Rxn<ProductWithBusinessCard>();

  // getters //
  ProductWithBusinessCard? get product => _product.value;
  // methods //
  Future<void> fetchData({required int productId}) async {
    _product.value = await get_product_by_id(id: productId, withCache: false);
  }
}

class CustEventViewController {
  // state vars //
  Rxn<EventWithBusinessCard> _event = Rxn<EventWithBusinessCard>();

  // getters //
  EventWithBusinessCard? get event => _event.value;
  // methods //
  Future<void> fetchData({required int eventId}) async {
    _event.value = await get_event_by_id(id: eventId, withCache: false);
  }
}

class CustHomeRentalViewController {
  final CustBusinessCartController custBusinessCartController =
      Get.find<CustBusinessCartController>();
  // state vars //
  Rxn<RentalWithBusinessCard> _homeRental = Rxn<RentalWithBusinessCard>();
  Rxn<DateTime> _startDate = Rxn();
  Rxn<Map<TimeUnit, num>> _timeCost = Rxn();
  Rx<int> _duration = Rx(1);
  Rx<int> _totalGuests = Rx(1);
  Rx<String> orderString = Rx("-");
  Rx<double> totalOrderCost = Rx(0);

  // getters //
  RentalWithBusinessCard? get homeRental => _homeRental.value;
  Rxn<DateTime> get startDate => _startDate;
  Rxn<Map<TimeUnit, num>> get timeCost => _timeCost;
  Rx<int> get duration => _duration;
  Rx<int> get totalGuests => _totalGuests;
  // methods //
  Future<void> fetchData({required int rentalId}) async {
    _homeRental.value = await get_rental_by_id(
      id: rentalId,
      withCache: true,
    );
    _setInitialTimeCost();
    _calcTotalOrderCost();
  }

  void _setInitialTimeCost() {
    final TimeUnit costKey = _homeRental.value!.details.cost.entries.first.key;
    final num costValue = _homeRental.value!.details.cost.entries.first.value;
    _timeCost.value = {
      costKey: costValue,
    };
  }

  void setTimeCost(Map<TimeUnit, num> value) {
    _timeCost.value = value;
    _calcTotalOrderCost();
  }

  void setDuration(int value) {
    _duration.value = value;
    _calcTotalOrderCost();
  }

  void setTotalGuests(int value) {
    _totalGuests.value = value;
    _calcTotalOrderCost();
  }

  void _calcTotalOrderCost() {
    double newCost = 0;
    newCost += _duration.value * (_timeCost.value!.values.first.toInt());
    totalOrderCost.value = newCost;
    orderString.value = "\$${totalOrderCost.value.toStringAsFixed(0)}";
  }

  Future<void> bookOffering() async {
    await custBusinessCartController.addCartItem(
      BusinessCartItem(
        itemId: _homeRental.value!.details.id,
        offeringType: OfferingType.Rental,
        parameters: BusinessItemParameters(
          guests: _totalGuests.value,
          numberOfUnits: _duration.value,
          timeUnit: timeCost.value!.keys.first.toFirebaseFormatString(),
        ),
        cost: totalOrderCost.value,
        rental: _homeRental.value,
      ),
    );
    await CustCartView.navigate(
      cartInfo: CartInfo(
        duration: _duration.value,
        itemName: _homeRental.value!.details.name,
        unitPrice: _timeCost.value!.values.first.toDouble(),
        totalPrice: totalOrderCost.value,
        startTime: startDate.value ?? DateTime.now(),
        totalPeople: _totalGuests.value,
        image: _homeRental.value!.details.image?.first ?? defaultUserImgUrl,
        unitDuration: _timeCost.value!.keys.first.toFirebaseFormatString(),
      ),
    );
    _duration.value = 1;
    _totalGuests.value = 1;
    orderString.value = "-";
    totalOrderCost.value = 0;
    _setInitialTimeCost();
    _calcTotalOrderCost();
  }
}

class CustRentalViewController {
  // state vars //
  Rxn<RentalWithBusinessCard> _rental = Rxn<RentalWithBusinessCard>();
  Rxn<DateTime> _startDate = Rxn();
  Rxn<Map<TimeUnit, num>> _timeCost = Rxn();
  Rx<int> _duration = Rx(1);
  Rx<int> _totalGuests = Rx(1);
  Rx<String> orderString = Rx("-");
  Rx<double> totalOrderCost = Rx(0);

  // getters //
  RentalWithBusinessCard? get rental => _rental.value;
  Rxn<DateTime> get startDate => _startDate;
  Rxn<Map<TimeUnit, num>> get timeCost => _timeCost;
  Rx<int> get duration => _duration;
  Rx<int> get totalGuests => _totalGuests;
  // methods //
  Future<void> fetchData({required int rentalId}) async {
    _rental.value = await get_rental_by_id(
      id: rentalId,
      withCache: true,
    );
    _setInitialTimeCost();
    _calcTotalOrderCost();
  }

  void _setInitialTimeCost() {
    final TimeUnit costKey = _rental.value!.details.cost.entries.first.key;
    final num costValue = _rental.value!.details.cost.entries.first.value;
    _timeCost.value = {
      costKey: costValue,
    };
  }

  void setTimeCost(Map<TimeUnit, num> value) {
    _timeCost.value = value;
    _calcTotalOrderCost();
  }

  void setDuration(int value) {
    _duration.value = value;
    _calcTotalOrderCost();
  }

  void setTotalGuests(int value) {
    _totalGuests.value = value;
    _calcTotalOrderCost();
  }

  void _calcTotalOrderCost() {
    double newCost = 0;
    newCost += _duration.value * (_timeCost.value!.values.first.toInt());
    totalOrderCost.value = newCost;
    orderString.value = "\$${totalOrderCost.value.toStringAsFixed(0)}";
  }

  Future<void> bookOffering() async {
    _duration.value = 1;
    _totalGuests.value = 1;
    orderString.value = "-";
    totalOrderCost.value = 0;
    _setInitialTimeCost();
    _calcTotalOrderCost();
  }
}

class CartInfo {
  final Map<Language, String> itemName;
  final int totalPeople;
  final double unitPrice;
  final double totalPrice;
  final int duration;
  final String unitDuration;
  final DateTime startTime;
  final String image;
  CartInfo({
    required this.itemName,
    required this.totalPeople,
    required this.unitPrice,
    required this.totalPrice,
    required this.duration,
    required this.unitDuration,
    required this.startTime,
    required this.image,
  });
}
