import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';

class MezWorkingHoursController {
  final Rxn<Schedule> _workingHours = Rxn<Schedule>();
  Schedule get workingHours => _workingHours.value!;

  void initialize({required Schedule schedule}) {
    _workingHours.value = schedule;
  }

  void updateWorkingHours(
      {required Weekday day, required WorkingDay workingDay}) {
    _workingHours.value!.openHours[day] = workingDay;
    _workingHours.refresh();
  }
}
