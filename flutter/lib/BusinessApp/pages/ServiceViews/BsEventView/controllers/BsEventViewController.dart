// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/BsEventView/components/BsOpPeriodPicker.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/components/BsOpScheduleSelector.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/controllers/BusinessDetailsController.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/controllers/LanguagesTabsController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/graphql/business_event/hsBusinessEvent.dart';
import 'package:mezcalmos/Shared/graphql/service_provider/hsServiceProvider.dart';
import 'package:mezcalmos/Shared/helpers/BusinessHelpers/EventHelper.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';
import 'package:mezcalmos/Shared/models/Utilities/Period.dart';

dynamic _i18n() =>
    Get.find<LanguageController>().strings['BusinessApp']['pages']['services'];

class BsEventViewController {
  // instances //

  LanguageTabsController languageTabsController = LanguageTabsController();
  bool firstFormValid = false;
  bool secondFormValid = false;
  BusinessItemDetailsController detailsController =
      BusinessItemDetailsController();
  // vars //
  late BusinessProfile businessProfile;
  bool shouldRefetch = false;
  bool get isClass => _isClass.value;
  RxBool _isClass = false.obs;
  // state variables //
  Rxn<Schedule> serviceSchedule = Rxn();
  Rxn<EventWithBusinessCard> _event = Rxn<EventWithBusinessCard>();
  Rxn<ScheduleType> scheduleType = Rxn<ScheduleType>();
  Rxn<Schedule> avalaibilty = Rxn<Schedule>();
  Rxn<PeriodOfTime> oneTimePeriod = Rxn<PeriodOfTime>();
  Rxn<Location> location = Rxn<Location>();
  // getters //
  ServiceProviderLanguage? get languages => languageTabsController.language;
  bool get hasSecondaryLang => languages?.secondary != null;
  bool get hasData {
    if (isEditing) {
      return _event.value != null &&
          languageTabsController.tabController != null;
    } else
      return languageTabsController.tabController != null;
  }

  EventWithBusinessCard? get event => _event.value;
  bool get isEditing => _event.value != null;
  List<TimeUnit> get _possibleTimeUnits => List.unmodifiable([
        TimeUnit.PerPerson,
      ]);
  List<TimeUnit> get avalbleUnits => _possibleTimeUnits
      .where((TimeUnit element) =>
          detailsController.priceTimeUnitMap.keys.contains(element) == false)
      .toList();
  bool get showLocation {
    switch (businessProfile) {
      case BusinessProfile.SurfShop:
        return scheduleType.value == ScheduleType.OneTime;
      case BusinessProfile.TourAgency:
      case BusinessProfile.Volunteer:
      case BusinessProfile.Entertainment:
        return true;

      case BusinessProfile.WellnessPractitioner:
        return scheduleType.value != ScheduleType.OnDemand;
      case BusinessProfile.YogaStudio:
        return scheduleType.value == ScheduleType.OneTime;
      default:
        return false;
    }
  }
  // RxBool _hasData = RxBool(false);

// methods //

  Future<void> init(
      {required TickerProvider thickerProvider,
      required bool isClass,
      required int detailsId,
      required int businessId,
      int? eventId,
      required BusinessProfile profile}) async {
    _isClass.value = isClass;
    businessProfile = profile;
    await languageTabsController.init(
        vsync: thickerProvider, detailsId: detailsId);
    detailsController.initDetails(
        businessId: businessId,
        language: languages!,
        businessDetailsId: detailsId);

    mezDbgPrint("Is class ================>$isClass");
    setPrices();
    if (eventId != null) {
      await initEditMode(id: eventId);
    }
    unawaited(
        get_service_schedule(serviceDetailsId: detailsId, withCache: false)
            .then((Schedule? value) => serviceSchedule.value = value));
  }

  Future<void> initEditMode({required int id}) async {
    _event.value = await get_event_by_id(id: id, withCache: false);

    mezDbgPrint("event id : $id");
    if (event != null) {
      detailsController.clearPrices();
      await detailsController.initEditMode(
          itemDetailsId: event!.details.id.toInt());

      _isClass.value = event!.tags?.contains(EventTag.Class) == true;

      location.value = event!.gpsLocation;
      scheduleType.value = event!.scheduleType;
      avalaibilty.value = event!.schedule;
      oneTimePeriod.value = event!.period;
    }
  }

  Future<void> save() async {
    if (languageTabsController.validate()) {
      if (isEditing) {
        try {
          await saveItemDetails();
          _event.value = await update_event_by_id(
              eventId: event!.id!.toInt(), event: _constructEvent());
          showSavedSnackBar();
          shouldRefetch = true;
        } catch (e, stk) {
          mezDbgPrint(
              " 🛑 ${event?.id?.toInt()}  OperationException : ${e.toString()}");
          mezDbgPrint(stk);
          showErrorSnackBar();
        }
        shouldRefetch = true;
      } else {
        Event _event = await _constructEventWithDetails();
        await createItem(_event);
      }
    }
  }

  Future<void> saveItemDetails() async {
    await detailsController.updateItemDetails();
  }

  void dispose() {
    // TODO: implement dispose
  }

  Future<void> createItem(Event event) async {
    mezDbgPrint(
        "Create rental with this payload : ${event.toFirebaseFormattedJson()}");
    try {
      int? res = isClass
          ? await add_one_class(event: event)
          : await add_one_event(event: event);

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

  Future<Event> _constructEventWithDetails() async {
    BusinessItemDetails details = await detailsController.contructDetails();
    EventCategory1 category1 = _getCategory1();
    Event event = Event(
        category1: category1,
        scheduleType: scheduleType.value!,
        startsAt: oneTimePeriod.value?.start.toUtc().toString(),
        endsAt: oneTimePeriod.value?.end.toUtc().toString(),
        schedule: avalaibilty.value,
        gpsLocation: location.value,
        tags: isClass ? [EventTag.Class] : [],
        // time: oneTimePeriod.value.,
        details: details);
    return event;
  }

  Event _constructEvent() {
    EventCategory1 category1 = _getCategory1();
    Event event = Event(
        category1: category1,
        scheduleType: scheduleType.value!,
        startsAt: oneTimePeriod.value?.start.toUtc().toString(),
        endsAt: oneTimePeriod.value?.end.toUtc().toString(),
        schedule: avalaibilty.value,
        gpsLocation: location.value,
        tags: isClass ? [EventTag.Class] : [],
        // time: oneTimePeriod.value.,
        details: detailsController.details!);
    return event;
  }

  EventCategory1 _getCategory1() {
    EventCategory1 category1 = EventCategory1.Uncategorized;
    switch (businessProfile) {
      case BusinessProfile.YogaStudio:
        category1 = EventCategory1.Yoga;
        break;
      case BusinessProfile.SurfShop:
        category1 = EventCategory1.Surf;
        break;
      // case BusinessProfile.MartialArt:
      //   category1 = EventCategory1.MartialArt;
      //   break;
      // case BusinessProfile.:
      //   category1 = EventCategory1.Party;
      //   break;
      // case BusinessProfile.:
      //   category1 = EventCategory1.Dance;
      //   break;
      case BusinessProfile.Entertainment:
        category1 = EventCategory1.Social;
        break;
      case BusinessProfile.WellnessPractitioner:
        category1 = EventCategory1.Therapy;
        break;
      // case BusinessProfile.:
      //   category1 = EventCategory1.Fitness;
      //   break;
      case BusinessProfile.TourAgency:
        category1 = EventCategory1.Adventure;
        break;
      case BusinessProfile.Volunteer:
        category1 = EventCategory1.Volunteer;
        break;
    }
    return category1;
  }

  // special methods //
  void switchScheduleType(ScheduleType type) {
    scheduleType.value = type;
    setPrices();
  }

  List<ScheduleTypeInput> getScheduleType() {
    final String businessFB = businessProfile.toFirebaseFormatString();
    switch (businessProfile) {
      case BusinessProfile.Entertainment:
        return [
          ScheduleTypeInput(
              title: _i18n()[businessFB]["weeklyEvent"],
              subtitle: _i18n()[businessFB]["weeklyEventLabel"],
              type: ScheduleType.Scheduled),
          ScheduleTypeInput(
              title: _i18n()[businessFB]["oneTimeEvent"],
              subtitle: _i18n()[businessFB]["oneTimeEventLabel"],
              type: ScheduleType.OneTime),
        ];
      case BusinessProfile.Volunteer:
        return [
          ScheduleTypeInput(
              title: _i18n()[businessFB]["weeklyEvent"],
              subtitle: _i18n()[businessFB]["weeklyEventLabel"],
              type: ScheduleType.Scheduled),
          ScheduleTypeInput(
              title: _i18n()[businessFB]["oneTimeEvent"],
              subtitle: _i18n()[businessFB]["oneTimeEventLabel"],
              type: ScheduleType.OneTime),
        ];
      case BusinessProfile.WellnessPractitioner:
        return [
          ScheduleTypeInput(
              title: _i18n()[businessFB]["onDemand"],
              subtitle: _i18n()[businessFB]["onDemandLabel"],
              type: ScheduleType.OnDemand),
          ScheduleTypeInput(
              title: _i18n()[businessFB]["weeklyEvent"],
              subtitle: _i18n()[businessFB]["weeklyEventLabel"],
              type: ScheduleType.Scheduled),
          ScheduleTypeInput(
              title: _i18n()[businessFB]["oneTimeEvent"],
              subtitle: _i18n()[businessFB]["oneTimeEventLabel"],
              type: ScheduleType.OneTime),
        ];
      case BusinessProfile.TourAgency:
        return [
          ScheduleTypeInput(
              title: _i18n()[businessFB]["onDemand"],
              subtitle: _i18n()[businessFB]["onDemandLabel"],
              type: ScheduleType.OnDemand),
          ScheduleTypeInput(
              title: _i18n()[businessFB]["weeklyEvent"],
              subtitle: _i18n()[businessFB]["weeklyEventLabel"],
              type: ScheduleType.Scheduled),
          ScheduleTypeInput(
              title: _i18n()[businessFB]["oneTimeEvent"],
              subtitle: _i18n()[businessFB]["oneTimeEventLabel"],
              type: ScheduleType.OneTime),
        ];
      case BusinessProfile.YogaStudio:
        return isClass
            ? [
                ScheduleTypeInput(
                    title: _i18n()[businessFB]["onDemandClass"],
                    subtitle: _i18n()[businessFB]["onDemandClassLabel"],
                    type: ScheduleType.OnDemand),
                ScheduleTypeInput(
                    title: _i18n()[businessFB]["weeklyClass"],
                    subtitle: _i18n()[businessFB]["weeklyClassLabel"],
                    type: ScheduleType.Scheduled),
                ScheduleTypeInput(
                    title: _i18n()[businessFB]["oneTimeClass"],
                    subtitle: _i18n()[businessFB]["oneTimeClassLabel"],
                    type: ScheduleType.OneTime),
              ]
            : [
                ScheduleTypeInput(
                    title: _i18n()[businessFB]["weeklyEvent"],
                    subtitle: _i18n()[businessFB]["weeklyEventLabel"],
                    type: ScheduleType.Scheduled),
                ScheduleTypeInput(
                    title: _i18n()[businessFB]["oneTimeEvent"],
                    subtitle: _i18n()[businessFB]["oneTimeEventLabel"],
                    type: ScheduleType.OneTime),
              ];
      case BusinessProfile.PetSitting:
        return [
          ScheduleTypeInput(
              title: _i18n()[businessFB]["weeklyEvent"],
              subtitle: _i18n()[businessFB]["weeklyEventLabel"],
              type: ScheduleType.Scheduled),
          ScheduleTypeInput(
              title: _i18n()[businessFB]["oneTimeEvent"],
              subtitle: _i18n()[businessFB]["oneTimeEventLabel"],
              type: ScheduleType.OneTime),
        ];
      case BusinessProfile.LanguageSchool:
        return isClass
            ? [
                ScheduleTypeInput(
                    title: _i18n()[businessFB]["onDemandClass"],
                    subtitle: _i18n()[businessFB]["onDemandClassLabel"],
                    type: ScheduleType.OnDemand),
                ScheduleTypeInput(
                    title: _i18n()[businessFB]["weeklyClass"],
                    subtitle: _i18n()[businessFB]["weeklyClassLabel"],
                    type: ScheduleType.Scheduled),
                ScheduleTypeInput(
                    title: _i18n()[businessFB]["oneTimeClass"],
                    subtitle: _i18n()[businessFB]["oneTimeClassLabel"],
                    type: ScheduleType.OneTime),
              ]
            : [
                ScheduleTypeInput(
                    title: _i18n()[businessFB]["weeklyEvent"],
                    subtitle: _i18n()[businessFB]["weeklyEventLabel"],
                    type: ScheduleType.Scheduled),
                ScheduleTypeInput(
                    title: _i18n()[businessFB]["oneTimeEvent"],
                    subtitle: _i18n()[businessFB]["oneTimeEventLabel"],
                    type: ScheduleType.OneTime),
              ];
      case BusinessProfile.SurfShop:
        return isClass
            ? [
                ScheduleTypeInput(
                    title: _i18n()[businessFB]["onDemandClass"],
                    subtitle: _i18n()[businessFB]["onDemandClassLabel"],
                    type: ScheduleType.OnDemand),
                ScheduleTypeInput(
                    title: _i18n()[businessFB]["weeklyClass"],
                    subtitle: _i18n()[businessFB]["weeklyClassLabel"],
                    type: ScheduleType.Scheduled),
                ScheduleTypeInput(
                    title: _i18n()[businessFB]["oneTimeClass"],
                    subtitle: _i18n()[businessFB]["oneTimeClassLabel"],
                    type: ScheduleType.OneTime),
              ]
            : [
                ScheduleTypeInput(
                    title: _i18n()[businessFB]["weeklyEvent"],
                    subtitle: _i18n()[businessFB]["weeklyEventLabel"],
                    type: ScheduleType.Scheduled),
                ScheduleTypeInput(
                    title: _i18n()[businessFB]["oneTimeEvent"],
                    subtitle: _i18n()[businessFB]["oneTimeEventLabel"],
                    type: ScheduleType.OneTime),
              ];
      default:
        throw StateError(
            "BusinessProfile ${businessProfile.name} not supported");
    }
  }

  Widget getScheduleWidget() {
    switch (scheduleType.value) {
      case ScheduleType.Scheduled:
      case ScheduleType.OnDemand:
        return Obx(
          () => BsOpScheduleSelector(
            onScheduleSelected: (Schedule? v) {
              avalaibilty.value = v;
            },
            scheduleType: scheduleType.value!,
            schedule: avalaibilty.value,
          ),
        );
      case ScheduleType.OneTime:
        return Obx(
          () {
            if (serviceSchedule.value != null) {
              return BsOpPeriodPicker(
                onNewPeriodSelected: (PeriodOfTime v) {
                  oneTimePeriod.value = v;
                },
                serviceSchedule: serviceSchedule.value!,
                timePeriod: oneTimePeriod.value,
              );
            } else
              return Container(
                child: Text("Business schedule not found"),
              );
          },
        );
      case null:
        return Container();

      default:
        throw StateError("unhandled schedule type ${scheduleType.value}");
    }
  }

  void setPrices() {
    detailsController.clearPrices();
    mezDbgPrint("setPrices : ${scheduleType.value}");
    if (scheduleType == ScheduleType.OnDemand) {
      detailsController.addPriceTimeUnit(
        timeUnit: TimeUnit.PerHour,
      );
    } else {
      detailsController.addPriceTimeUnit(timeUnit: TimeUnit.PerPerson);
    }
  }

  void setLocation(Location v) {
    location.value = v;
  }

  Future<void> deleteOffer() async {
    try {
      await delete_business_event(eventId: event!.id!.toInt());
      shouldRefetch = true;
    } catch (e, stk) {
      showErrorSnackBar();
      mezDbgPrint(e);
      mezDbgPrint(stk);
    }
  }
}

class ScheduleTypeInput {
  String title;
  String subtitle;
  ScheduleType type;
  ScheduleTypeInput({
    required this.title,
    required this.subtitle,
    required this.type,
  });

  @override
  bool operator ==(covariant ScheduleTypeInput other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.subtitle == subtitle &&
        other.type == type;
  }

  @override
  int get hashCode => title.hashCode ^ subtitle.hashCode ^ type.hashCode;
}
