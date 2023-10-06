import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart' as locPkg;
import 'package:mezcalmos/CustomerApp/pages/Businesses/Components/CustBusinessFilterSheet.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/locationController.dart';
import 'package:mezcalmos/Shared/graphql/business_service/hsBusinessService.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/ScrollHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';

class CustFoodListViewController {
  // variables //
  RxList<Service> _services = <Service>[].obs;
  RxList<BusinessCard> _businesses = <BusinessCard>[].obs;
  // RxList<BusinessCard> _filtredBusiness = <BusinessCard>[].obs;

  RxBool _isLoading = false.obs;
  RxBool showBusiness = false.obs;
  Location? _fromLocation;
  String searchQuery = "";

  List<ServiceCategory1> _filterCategories = <ServiceCategory1>[];

  RxList<ServiceCategory1> selectedCategories = <ServiceCategory1>[].obs;
  RxList<ServiceCategory1> previewCategories = <ServiceCategory1>[].obs;
  // scroll logic //
  /* SCROLL CONTROLLER */
  ScrollController get scrollController => showBusiness.isTrue
      ? _businessScrollController
      : _servicesScrollController;
  ScrollController _servicesScrollController = ScrollController();
  ScrollController _businessScrollController = ScrollController();
  int servicesFetchSize = 20;
  int _servicesCurrentOffset = 0;
  bool _servicesFetchingData = false;
  bool _servicesReachedEndOfData = false;
  final int businessFetchSize = 20;
  int _businessCurrentOffset = 0;
  bool _businessFetchingData = false;
  bool _businessReachedEndOfData = false;
  /* SCROLL CONTROLLER */
  // scroll logic //

  // getters //
  bool get isLoading => _isLoading.value;
  bool get isFiltering => selectedCategories.length != _filterCategories.length;
  List<ServiceCategory1> get filterCategories => _filterCategories;

  List<Service> get services => _services.value;
  List<BusinessCard> get businesses => _businesses.value;

  /// return current view rental category (Home, Surf, etc)
  List<ServiceCategory1> get serviceCategory => _currentServicesCategory;

  late List<ServiceCategory1> _currentServicesCategory;

  late FilterInput _filterInput;
  FilterInput get filterInput => _filterInput;

  FilterInput defaultFilters() {
    return {
      "categories": [],
      "schedule": [],
      "onlineOrder": ["false"],
    };
  }

// methods //
  Future<void> init({required ServiceCategory1 serviceCategory}) async {
    _filterInput = defaultFilters();
    _currentServicesCategory = [serviceCategory];

    filterCategories.add(
      serviceCategory,
    );
    selectedCategories.value = List.from(filterCategories);
    previewCategories.value = List.from(filterCategories);

    try {
      _isLoading.value = true;

      final locPkg.LocationData location =
          await Get.find<LocationController>().getCurrentLocation();
      if (location.latitude != null && location.longitude != null) {
        _fromLocation = Location(
          lat: location.latitude!,
          lng: location.longitude!,
          address: "",
        );
        await _fetchServices();
        await _fetchBusinesses();
        _servicesScrollController.onBottomReach(_fetchServices,
            sensitivity: 500);
        _businessScrollController.onBottomReach(_fetchBusinesses,
            sensitivity: 500);
      }
    } catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
    } finally {
      _isLoading.value = false;
    }
  }

  Future<void> _fetchServices() async {
    if (_servicesFetchingData || _servicesReachedEndOfData) {
      return;
    }
    try {
      _servicesFetchingData = true;
      mezDbgPrint(
          "👋 _fetchRentals called selected categories : $selectedCategories \n ferchSize : $servicesFetchSize \n offset: $_servicesCurrentOffset");
      List<ServiceCard> newList = await get_service_by_category(
        categories1: serviceCategory,
        distance: defaultDistance,
        fromLocation: _fromLocation!,
        tags: [],
        // scheduleType: [ScheduleType.Scheduled, ScheduleType.OneTime],
        withCache: false,
        offset: _servicesCurrentOffset,
        limit: servicesFetchSize,
        onlineOrdering:
            _filterInput["onlineOrder"]!.contains("true") ? true : null,
      );
      _services.value += newList;
      if (newList.length == 0) {
        _servicesReachedEndOfData = true;
      }
      _servicesCurrentOffset += servicesFetchSize;
    } catch (e) {
      mezDbgPrint(e);
    } finally {
      _servicesFetchingData = false;
    }
  }

  Future<void> _fetchBusinesses() async {
    // if (_businessFetchingData || _businessReachedEndOfData) {
    //   return;
    // }
    // try {
    //   mezDbgPrint(
    //       "👋 _fetchBusinesses called with ferchSize : $businessFetchSize offset: $_businessCurrentOffset");
    //   _businessFetchingData = true;
    //   List<BusinessCard> newList = await get_business_by_ser_category1(
    //       categories1: [_currentRentalCategory],
    //       distance: 1000000000000,
    //       fromLocation: _fromLocation!,
    //       offset: _businessCurrentOffset,
    //       limit: businessFetchSize,

    //       // scheduleType: [ScheduleType.Scheduled, ScheduleType.OneTime],
    //       withCache: false);
    //   _businesses.value += newList;
    //   if (newList.length == 0) {
    //     _businessReachedEndOfData = true;
    //   }

    //   _businessCurrentOffset += businessFetchSize;
    // } catch (e) {
    //   mezDbgPrint(e);
    // } finally {
    //   _businessFetchingData = false;
    // }
  }

  void filter(FilterInput newData) {
    _filterInput.clear();
    newData.forEach((String key, List<String> value) {
      _filterInput[key] = List.from(value);
    });
    mezDbgPrint("new data :::::::::=====>_filterInput $_filterInput");
    _fetchServices();
    _resetFilter();
  }

  void _resetFilter() {
    previewCategories.value = List.from(filterCategories);
    selectedCategories.value = List.from(filterCategories);
    _services.clear();
    _fetchServices();
  }

  void switchFilterCategory(bool? value, int index) {
    if (value == true) {
      previewCategories.add(filterCategories[index]);
    } else {
      previewCategories.remove(filterCategories[index]);
    }
  }
}
