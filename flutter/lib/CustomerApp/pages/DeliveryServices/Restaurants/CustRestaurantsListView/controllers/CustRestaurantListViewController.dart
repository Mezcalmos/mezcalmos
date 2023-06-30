import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:location/location.dart' as locPkg;
import 'package:mezcalmos/CustomerApp/helpers/ServiceListHelper.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Components/OnMapRestaurantCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Components/CustBusinessFilterSheet.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart' as cModels;
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/constants/mapConstants.dart';
import 'package:mezcalmos/Shared/controllers/appLifeCycleController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/graphql/item/hsItem.dart';
import 'package:mezcalmos/Shared/graphql/restaurant/hsRestaurant.dart';
import 'package:mezcalmos/Shared/helpers/MarkerHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/thirdParty/MapHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Item.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Restaurant.dart';
import 'package:mezcalmos/Shared/models/Services/Service.dart';

enum UserInteraction { isSearching, isSorting, isSearchingAndSorting, Nothing }

enum SearchType { searchByRestaurantName, searchByItemName }

class CustRestaurantListViewController {
  RxList<Restaurant> filteredRestaurants = RxList<Restaurant>.empty();
  RxList<Item> filteredItems = RxList<Item>.empty();
  List<int> servicesIds = [];
  AppLifeCycleController appLifeCycleController =
      Get.find<AppLifeCycleController>();
  String? callbackId;

  List<Restaurant> _restaurants = List<Restaurant>.empty();
  Rx<SearchType> searchType = SearchType.searchByRestaurantName.obs;

  RxBool isLoading = RxBool(false);
  RxBool showOnlyOpen = RxBool(true);
  RxString searchQuery = RxString("");
  LocationData? customerLocation;

  // Map view //
  LatLng _currentLocation = LatLng(19.4326, -99.1332);
  LatLng get currentLocation => _currentLocation;

  RxBool _isMapView = false.obs;
  bool get isMapView => _isMapView.value;

  RxBool _showOnlyOpenOnMap = RxBool(true);
  bool get showOnlyOpenOnMap => _showOnlyOpenOnMap.value;

  GoogleMapController? _googleMapController;

  RxBool _showFetchButton = false.obs;
  RxBool get showFetchButton => _showFetchButton;

  LatLng? _screenToWorldPosition;

  RxList<Restaurant> _mapViewRestaurants = <Restaurant>[].obs;
  List<Restaurant> get mapViewRestaurants => _mapViewRestaurants;

  RxSet<Marker> _restaurantsMarkers = <Marker>{}.obs;
  RxSet<Marker> get restaurantsMarkers => _restaurantsMarkers;

  RxSet<Marker> _allMarkers = <Marker>{}.obs;
  RxSet<Marker> get allMarkers => _allMarkers;

  BuildContext? ctx;
  // Map view //

  late FilterInput _filterInput;

  FilterInput get filterInput => _filterInput;

  FilterInput defaultFilters() {
    return {
      "categories": [],
      "schedule": [],
      "onlineOrder": ["false"]
    };
  }

  final cModels.Language userLanguage =
      Get.find<LanguageController>().userLanguageKey;

  Future<void> init({required BuildContext context}) async {
    _filterInput = defaultFilters();
    ctx = context;

    await locPkg.Location().getLocation().then((LocationData location) {
      if (location.latitude != null && location.longitude != null)
        _currentLocation = LatLng(location.latitude!, location.longitude!);
    });

    await fetchRestaurants();
    callbackId = appLifeCycleController.attachCallback(
        AppLifecycleState.resumed, () => filter(filterInput));
  }

  Future<void> fetchRestaurants() async {
    isLoading.value = true;

    await fetch_restaurants(
            fromLocation: cModels.Location(
                lat: _currentLocation.latitude,
                lng: _currentLocation.longitude,
                address: ''),
            is_open: showOnlyOpen.value,
            withCache: false,
            online_ordering: _filterInput["onlineOrder"]!.last.contains("true")
                ? true
                : null,
            distance: getFetchDistance)
        .then((List<Restaurant> list) {
      _restaurants = list;

      _assignServiceIds();
      filter(_filterInput);
      _getCustomerCurrentLocation();
    }).whenComplete(() {
      isLoading.value = false;
    });
  }

  void _getCustomerCurrentLocation() {
    Location()
        .getLocation()
        .then((LocationData value) => customerLocation = value);
  }

  void changeAlwaysOpenSwitch(bool value) {
    showOnlyOpen.value = value;
    // fetchRestaurants();
    _fetchRestaurantsOnFilter();
  }

  void _assignServiceIds() {
    servicesIds = _restaurants
        // .where((Restaurant element) => element.isOpen)
        .map((Restaurant e) => e.info.hasuraId)
        .toList();
  }

  Future<void> _fetchRestaurantsOnFilter() async {
    isLoading.value = true;

    await fetch_restaurants(
            fromLocation: cModels.Location(
                lat: _currentLocation.latitude,
                lng: _currentLocation.longitude,
                address: ''),
            is_open: showOnlyOpen.value,
            withCache: false,
            online_ordering: _filterInput["onlineOrder"]!.last.contains("true")
                ? true
                : null,
            distance: getFetchDistance)
        .then((List<Restaurant> list) {
      _restaurants = list;

      _assignServiceIds();
      _getCustomerCurrentLocation();
    }).whenComplete(() {
      isLoading.value = false;
    });
  }

  void filter(Map<String, List<String>> newData) {
    // _filterInput.clear();
    newData.forEach((String key, List<String> value) {
      _filterInput[key] = List.from(value);
    });

    changeAlwaysOpenSwitch(
        newData['restaurantOpened']?.contains('true') ?? false);
    mezDbgPrint("_filterInput $_filterInput $newData");
    _fetchRestaurantsOnFilter();
    List<Restaurant> newList = new List<Restaurant>.from(_restaurants);
    if (searchType.value == SearchType.searchByRestaurantName) {
      newList = newList.searchByName(searchQuery.value) as List<Restaurant>;
      newList.sortByOpen();
      filteredRestaurants.value = newList;
    } else {
      servicesIds = newList
          .map(
            (Service e) => e.info.hasuraId,
          )
          .toList();
      _searchItem();
    }
  }

  void switchSearchType(SearchType value) {
    searchType.value = value;
    filter(filterInput);
  }

  bool get showFilters {
    return searchQuery.value.length > 0 ||
        searchType.value == SearchType.searchByItemName;
  }

  bool get byRestaurants {
    return searchType.value == SearchType.searchByRestaurantName;
  }

  Future<void> _searchItem() async {
    filteredItems.value = await search_items(
        servicesIds: servicesIds,
        keyword: searchQuery.value,
        lang: userLanguage,
        onlineOrdering:
            _filterInput["onlineOrder"]!.last.contains("true") ? true : null,
        withCache: false);
  }

  // Map view //
  void switchView() => _isMapView.value = !_isMapView.value;

  Future<void> _fetchMapViewRentals({bool currentPostitionBased = true}) async {
    try {
      if (currentPostitionBased) {
        _mapViewRestaurants.value = await fetch_restaurants(
            fromLocation: cModels.Location(
                lat: _currentLocation.latitude,
                lng: _currentLocation.longitude,
                address: ''),
            is_open: showOnlyOpen.value,
            withCache: false,
            online_ordering: _filterInput["onlineOrder"]!.last.contains("true")
                ? true
                : null,
            distance: getFetchDistance);
      } else {
        _mapViewRestaurants.value = await fetch_restaurants(
            distance: _calculateDistance(
                await _googleMapController!.getVisibleRegion()),
            fromLocation: cModels.Location(
                lat: _screenToWorldPosition!.latitude,
                lng: _screenToWorldPosition!.longitude,
                address: ''),
            is_open: showOnlyOpen.value,
            online_ordering: _filterInput["onlineOrder"]!.last.contains("true")
                ? true
                : null,
            withCache: false);
      }
    } catch (e) {
      mezDbgPrint(e);
    } finally {
      await _fillMapsMarkers();
    }
  }

  Future<void> _fillMapsMarkers() async {
    _restaurantsMarkers = <Marker>{}.obs;

    for (Restaurant restaurant in _mapViewRestaurants) {
      await _allMarkers.addLabelMarker(LabelMarker(
        flat: true,
        label: null,
        altIconPath: mezRestaurantIcon,
        markerId: MarkerId(restaurant.info.hasuraId.toString()),
        backgroundColor: Colors.white,
        onTap: () => _onSelectRentalTag(restaurant),
        position: LatLng(restaurant.info.location.position.latitude!,
            restaurant.info.location.position.longitude!),
      ));
      await _restaurantsMarkers.addLabelMarker(LabelMarker(
        flat: true,
        label: null,
        altIconPath: mezRestaurantIcon,
        markerId: MarkerId(restaurant.info.hasuraId.toString()),
        backgroundColor: Colors.white,
        onTap: () => _onSelectRentalTag(restaurant),
        position: LatLng(restaurant.info.location.position.latitude!,
            restaurant.info.location.position.longitude!),
      ));
    }
  }

  void fetchMapViewRentals() {
    _fetchMapViewRentals(currentPostitionBased: false);
    _showFetchButton.value = false;
  }

  void recenterMap() {
    _googleMapController?.moveCamera(CameraUpdate.newLatLng(_currentLocation));
  }

  void setOnlyOpenOnMap() =>
      _showOnlyOpenOnMap.value = !_showOnlyOpenOnMap.value;

  Future<void> onMapCreated(GoogleMapController? gMapController) async {
    _googleMapController = gMapController;
    await _googleMapController?.setMapStyle(mezMapStyle);
    await _fetchMapViewRentals();
  }

  void onCameraMove(CameraPosition cameraPosition) {
    _screenToWorldPosition = cameraPosition.target;
    _showFetchButton.value = true;
  }

  void _onSelectRentalTag(Restaurant restaurant) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        barrierColor: Colors.transparent,
        context: ctx!,
        builder: (BuildContext context) {
          return OnMapRestaurantCard(restaurant: restaurant);
        });
  }

  double _calculateDistance(LatLngBounds bounds) {
    final double centerLat =
        (bounds.northeast.latitude + bounds.southwest.latitude) / 2;
    final double centerLng =
        (bounds.northeast.longitude + bounds.southwest.longitude) / 2;
    final LatLng center = LatLng(centerLat, centerLng);

    final double p = 0.017453292519943295;
    final double a = 0.5 -
        cos((bounds.northeast.latitude - center.latitude) * p) / 2 +
        cos(center.latitude * p) *
            cos(bounds.northeast.latitude * p) *
            (1 - cos((bounds.northeast.longitude - center.longitude) * p)) /
            2;

    return (12742 * asin(sqrt(a))) * 1000;
  }

  // Map view //

  void dispose() {
    isLoading.value = false;
    appLifeCycleController.removeCallbackIdOfState(
        AppLifecycleState.resumed, callbackId);
  }
}
