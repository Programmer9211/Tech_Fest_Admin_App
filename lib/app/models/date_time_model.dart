import 'package:flutter/material.dart';
import 'package:tech_fest_admin_app/const/app_const/app_keys.dart';

class DateTimeModel {
  late String day;
  late String month;
  late String time;
  late String year;

  DateTimeModel({
    required this.day,
    required this.month,
    required this.time,
    required this.year,
  });

  DateTimeModel.fromJson(Map<String, dynamic> json) {
    day = json[AppKeys.day];
    month = json[AppKeys.month];
    time = json[AppKeys.time];
    year = json[AppKeys.year];
  }
  DateTimeModel.init() {
    day = "0";
    month = "0";
    time = "00:00";
    year = "0000";
  }

  DateTimeModel.convertInReadableFormat(
      DateTime date, TimeOfDay time, BuildContext context) {
    final months = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec",
    ];

    day = date.day.toString();
    month = months[date.month - 1];
    this.time = time.format(context);
    year = date.year.toString();
  }

  Map<String, dynamic> toJson() => {
        AppKeys.day: day,
        AppKeys.month: month,
        AppKeys.time: time,
        AppKeys.year: year,
      };
}
