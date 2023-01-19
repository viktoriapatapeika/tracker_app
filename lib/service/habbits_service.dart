import 'package:flutter/material.dart';
import 'package:tracker_app/dto/habbits.dart';
import 'package:tracker_app/util/color_util.dart';

class HabbitsService {
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
}
