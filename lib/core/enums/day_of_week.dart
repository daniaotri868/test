import 'package:collection/collection.dart';

enum DayOfWeek {
  sunday(value: "Sunday"),
  monday(value: "Monday"),
  tuesday(value: "Tuesday"),
  wednesday(value: "Wednesday"),
  thursday(value: "Thursday"),
  friday(value: "Friday"),
  saturday(value: "Saturday");

  final String value;

  const DayOfWeek({required this.value});

  static DayOfWeek byValue(String name) {
    return DayOfWeek.values.firstWhereOrNull((element) => element.value == name) ?? DayOfWeek.sunday;
  }

  String get translatedName {
    switch (this) {
      case DayOfWeek.sunday:
        return "Sunday";
      case DayOfWeek.monday:
        return "Monday";
      case DayOfWeek.tuesday:
        return "Tuesday";
      case DayOfWeek.wednesday:
        return "Wednesday";
      case DayOfWeek.thursday:
        return "Thursday";
      case DayOfWeek.friday:
        return "Friday";
      case DayOfWeek.saturday:
        return "Saturday";
    }
  }

  DayOfWeek get nextDay {
    switch (this) {
      case DayOfWeek.sunday:
        return DayOfWeek.monday;
      case DayOfWeek.monday:
        return DayOfWeek.tuesday;
      case DayOfWeek.tuesday:
        return DayOfWeek.wednesday;
      case DayOfWeek.wednesday:
        return DayOfWeek.thursday;
      case DayOfWeek.thursday:
        return DayOfWeek.friday;
      case DayOfWeek.friday:
        return DayOfWeek.saturday;
      case DayOfWeek.saturday:
        return DayOfWeek.sunday;
    }
  }
}

final convertDayOfWeekToDay = {
  1: DayOfWeek.monday,
  2: DayOfWeek.tuesday,
  3: DayOfWeek.wednesday,
  4: DayOfWeek.thursday,
  5: DayOfWeek.friday,
  6: DayOfWeek.saturday,
  7: DayOfWeek.sunday
};

/// The day of the week [monday]..[sunday].
///
/// In accordance with ISO 8601
/// a week starts with Monday, which has the value 1.
