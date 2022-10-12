import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';

class PeriodOfTime {
  DateTime start;
  DateTime end;
  PeriodOfTime({
    required this.start,
    required this.end,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PeriodOfTime &&
        other.start.year == start.year &&
        other.start.month == start.month &&
        other.start.day == start.day &&
        other.start.hour == start.hour &&
        other.start.minute == start.minute &&
        other.end.year == end.year &&
        other.end.month == end.month &&
        other.end.day == end.day &&
        other.end.hour == end.hour &&
        other.end.minute == end.minute;
  }

  bool include(PeriodOfTime p2) {
    return (p2.start.isAfter(start) || p2.start.isAtSameMomentAs(start)) &&
        (p2.end.isBefore(end) || p2.end.isAtSameMomentAs(end));
  }

  PeriodOfTime? merge(PeriodOfTime p2) {
    if (include(p2)) {
      return p2;
    }
    return null;
  }

  PeriodOfTime toLocal() {
    final PeriodOfTime data =
        PeriodOfTime(start: start.toLocal(), end: end.toLocal());

    return this;
  }

  @override
  int get hashCode => start.hashCode ^ end.hashCode;

  @override
  String toString() {
    return '${DateFormat.MMMEd(userLangCode).format(start.toLocal())}, ${DateFormat("hh:mm a").format(start.toLocal())} ${Get.find<LanguageController>().strings["General"]["to"].toString().toLowerCase()} ${DateFormat("hh:mm a").format(end.toLocal())}'
        .replaceAll(".", "");
  }

  String toNormalString({bool removeDay = false, DateFormat? format}) {
    final DateFormat df = format ?? DateFormat.MMMEd(userLangCode);

    return '${(removeDay) ? "" : df.format(start.toLocal()) + ","} ${DateFormat("hh:mm a").format(start.toLocal())} ${Get.find<LanguageController>().strings["General"]["to"].toString().toLowerCase()} ${DateFormat("hh:mm a").format(end.toLocal())}'
        .replaceAll(".", "");
  }
}
