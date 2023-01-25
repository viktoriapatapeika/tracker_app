import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tracker_app/dto/habbits.dart';
import 'package:tracker_app/util/color_util.dart';

enum HabbitTimeSwitcherType { week, month, year }

class HabbitsService {
  static List<HabbitTimeSwitcherType> switcherTypes = [
    HabbitTimeSwitcherType.week,
    HabbitTimeSwitcherType.month,
    HabbitTimeSwitcherType.year
  ];

  static List<HabbitType> habbitTypes = [HabbitType.water, HabbitType.activity, HabbitType.heartRate, HabbitType.sleep];
  static Color getHabbitColor(HabbitType habbitType) {
    switch (habbitType) {
      case HabbitType.water:
        return ColorUtil.semanticColorBlue;
      case HabbitType.activity:
        return ColorUtil.semanticColorYellow;
      case HabbitType.heartRate:
        return ColorUtil.semanticColorRed;
      case HabbitType.sleep:
        return ColorUtil.semanticColorPurple;
    }
  }

  static double getHeightOccupated(BuildContext context, HabbitType habbitType) {
    switch (habbitType) {
      case HabbitType.water:
        return 0.45;
      case HabbitType.activity:
        return 0.65;
      case HabbitType.heartRate:
        return 0.55;
      case HabbitType.sleep:
        return 0.35;
    }
  }

  static double getRandomProgress() {
    return Random().nextDouble();
  }

  static bool getRandomBool() {
    return Random().nextDouble() <= 0.7;
  }

  static const List<String> weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  static const List<String> months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Apr',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];
  static final DateTime today = DateTime.now();
  static final int todaysWeekdayNumber = today.weekday - 1;
  static final int todaysDate = today.day;

  static Map<String, bool>? getWaterProgressByTime(HabbitTimeSwitcherType switcherType) {
    Map<String, bool> progress = {};
    if (switcherType == HabbitTimeSwitcherType.week) {
      for (int i = 0; i <= todaysWeekdayNumber; i++) {
        progress.addAll({weekdays[i]: true});
      }
      for (int i = todaysWeekdayNumber + 1; i < 7; i++) {
        progress.addAll({weekdays[i]: false});
      }
    }
    return progress;
  }

  static Map<String, double>? getActivityProgressByTime(HabbitTimeSwitcherType switcherType) {
    int thisWeek = (todaysDate / 7).round();
    //int thisMonth = today.month;
    int thisMonth = 4;
    int thisMonthDaysNumber = DateTime(today.year, today.month + 1, 0).day;
    Map<String, double> progress = {};

    if (switcherType == HabbitTimeSwitcherType.week) {
      for (int i = 0; i < todaysWeekdayNumber; i++) {
        progress.addAll({weekdays[i]: getRandomProgress()});
      }
      for (int i = todaysWeekdayNumber; i < 7; i++) {
        progress.addAll({weekdays[i]: 0});
      }
    } else if (switcherType == HabbitTimeSwitcherType.month) {
      // debugPrint('$todaysDate / $thisMonthDaysNumber days');
      // for (int i = 1; i < todaysDate + 1; i++) {
      //   progress.addAll({'Week $i': getRandomProgress()});
      // }
      // if (todaysDate < 4) {
      //   for (int i = todaysDate + 1; i < thisMonthDaysNumber + 1; i++) {
      //     progress.addAll({'Week $i': 0});
      //   }
      // }
    } else if (switcherType == HabbitTimeSwitcherType.year) {
      debugPrint('$thisMonth / 12 months');
      for (int i = 1; i <= thisMonth; i++) {
        progress.addAll({months[i - 1]: getRandomProgress()});
      }
      if (thisMonth < 12) {
        for (int i = thisMonth + 1; i <= 12; i++) {
          progress.addAll({months[i - 1]: 0});
        }
      }
    }
    debugPrint('service progress length ${progress.length}');
    return progress;
  }
}
