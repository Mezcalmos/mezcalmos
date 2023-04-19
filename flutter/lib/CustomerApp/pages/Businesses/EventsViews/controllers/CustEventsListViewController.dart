import 'package:get/get.dart';
import 'package:location/location.dart' as locPkg;
import 'package:mezcalmos/CustomerApp/helpers/BusinessListHelper.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/graphql/business/hsBusiness.dart';
import 'package:mezcalmos/Shared/graphql/business_event/hsBusinessEvent.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';

class CustEventsListViewController {
  // variables //
  RxList<EventCard> _events = <EventCard>[].obs;
  RxList<EventCard> _filtredEvents = <EventCard>[].obs;
  RxList<BusinessCard> _businesses = <BusinessCard>[].obs;
  RxList<BusinessCard> _filtredBusiness = <BusinessCard>[].obs;

  RxBool _isLoading = false.obs;
  RxBool showBusiness = false.obs;
  Location? _fromLocation;
  String searchQuery = "";

  List<EventCategory1> filterCategories = <EventCategory1>[
    EventCategory1.Dance,
    EventCategory1.Party,
    EventCategory1.Social,
  ];

  RxList<EventCategory1> selectedCategories = <EventCategory1>[].obs;

  // getters //
  bool get isLoading => _isLoading.value;
  List<EventCard> get events => _filtredEvents.value;
  List<BusinessCard> get businesses => _filtredBusiness.value;

  Future<void> init() async {
    try {
      _isLoading.value = true;
      selectedCategories.value = List.from(filterCategories);
      locPkg.LocationData location = await locPkg.Location().getLocation();
      if (location.latitude != null && location.longitude != null) {
        _fromLocation =
            Location(lat: location.latitude!, lng: location.longitude!);
        await _fetchEvents();
        await _fetchBusinesses();
        _filtredBusiness.value.addAll(_businesses.value);
        _filtredEvents.value.addAll(_events.value);
      }
    } catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
    } finally {
      _isLoading.value = false;
    }
  }

  Future<void> _fetchEvents() async {
    mezDbgPrint("Getting events  =====>${filterCategories.length}");
    _events.value.clear();
    _events.value = await get_event_by_category(
        categories1: selectedCategories,
        distance: 1000000000000,
        fromLocation: _fromLocation!,
        tags: [],
        scheduleType: [ScheduleType.Scheduled, ScheduleType.OneTime],
        withCache: false);
    mezDbgPrint(_events.value.length);
  }

  Future<void> _fetchBusinesses() async {
    mezDbgPrint("Getting events businesses  =====>$_fromLocation");
    _businesses.clear();
    _businesses.value = await get_business_by_event_category1(
        category1: filterCategories.first,
        distance: 1000000000000,
        fromLocation: _fromLocation!,

        // scheduleType: [ScheduleType.Scheduled, ScheduleType.OneTime],
        withCache: false);
  }

  void filter() {
    if (showBusiness.isFalse) {
      List<EventCard> newList = new List<EventCard>.from(_events);
      newList = newList
          .searchByName(searchQuery)
          .filterByCategory(selectedCategories);
      _filtredEvents.value = newList;
    } else {
      List<BusinessCard> newList = new List<BusinessCard>.from(_businesses);
      newList = newList.searchByName(searchQuery);

      _filtredBusiness.value = newList;
    }
  }

  void switchFilterCategory(bool? value, int index) {
    if (value == true) {
      selectedCategories.add(filterCategories[index]);
    } else {
      selectedCategories.remove(filterCategories[index]);
    }
  }
}
