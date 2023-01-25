import 'package:flutter/material.dart';

import 'package:tracker_app/service/habbits_service.dart';
import 'package:tracker_app/ui_component/activity_habbit_progress.dart';
import 'package:tracker_app/ui_component/progress_chart.dart';
import 'package:tracker_app/ui_component/time_switcher.dart';
import 'package:tracker_app/ui_component/water_habbit_progress.dart';
import 'package:tracker_app/util/color_util.dart';
import 'package:tracker_app/util/font_util.dart';

class StatisticsPage extends StatelessWidget {
  StatisticsPage({super.key});

  Widget buildWaterHabbitProgress() {
    return const SizedBox();
  }

  ValueNotifier<HabbitTimeSwitcherType> switcherType = ValueNotifier(HabbitTimeSwitcherType.week);
  @override
  Widget build(BuildContext context) {
    const String headerText = 'Goal Statistics';
    const EdgeInsets horizontalPadding = EdgeInsets.symmetric(horizontal: 20);
    return Scaffold(
      backgroundColor: ColorUtil.backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50),
          child: ValueListenableBuilder(
              valueListenable: switcherType,
              builder: (context, HabbitTimeSwitcherType switcher, widget) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                        padding: horizontalPadding.copyWith(bottom: 30),
                        child: Text(headerText, style: FontUtil.headerFont)),
                    const Padding(
                      padding: horizontalPadding,
                      child: TimeSwitcher(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: ProgressChart(),
                    ),
                    WaterHabbitProgress(switcherType: switcherType.value),
                    const ActivityHabbitProgress(switcherType: HabbitTimeSwitcherType.year),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
