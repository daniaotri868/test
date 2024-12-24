import 'package:flutter/material.dart';

extension TimeOfDayEX on TimeOfDay {
  DateTime get toDateNow {
    final now = DateTime.now();
    return DateTime(now.year,now.month,now.day,this.hour,this.minute);
  }
}

extension DateTimeEX on DateTime {
  DateTime get toDateNow {
    final now = DateTime.now();
    return DateTime(now.year,now.month,now.day,this.hour,this.minute);
  }
}
