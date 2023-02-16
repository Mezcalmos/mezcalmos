import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/ServiceProfileController.dart';
import 'package:mezcalmos/Shared/graphql/service_provider/hsServiceProvider.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Schedule.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';

class ServiceScheduleViewController {
  // instances //
  ServiceProfileController serviceProfileViewController =
      Get.find<ServiceProfileController>();

  final Rxn<Schedule> newSchedule = Rxn();
  final Rxn<Schedule> schedulePreview = Rxn();
  final Rxn<Schedule> oldSchedule = Rxn();
  // getters //
  int get _detailsId => serviceProfileViewController.detailsId;
  ServiceProviderType get serviceProviderType =>
      serviceProfileViewController.service.serviceProviderType!;

  Future<void> init() async {
    try {
      await fetchSchedule();
    } catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
    }
  }

  Future<void> fetchSchedule() async {
    if (serviceProfileViewController.service.schedule != null) {
      // final Schedule? schedule = await get_restaurant_schedule(
      //     restaurantId: restaurant.value!.restaurantId, withCache: false);
      mezDbgPrint(
          "Restaurant schedule ===================> ${serviceProfileViewController.service.schedule!.toFirebaseFormattedJson()}");
      oldSchedule.value =
          Schedule.clone(serviceProfileViewController.service.schedule!);
      newSchedule.value =
          Schedule.clone(serviceProfileViewController.service.schedule!);
      schedulePreview.value =
          Schedule.clone(serviceProfileViewController.service.schedule!);
    }
  }

  Future<bool> updateSchedule() async {
    try {
      await update_service_schedule(
          detailsId: _detailsId, schedule: newSchedule.value!);

      await fetchSchedule();
      return true;
    } catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
      return false;
    }
  }

  void dispose() {}
}