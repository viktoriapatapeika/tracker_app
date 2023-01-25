import 'package:flutter/material.dart';

import 'package:tracker_app/service/habbits_service.dart';
import 'package:tracker_app/ui_component/navigation_text.dart';
import 'package:tracker_app/util/color_util.dart';
import 'package:tracker_app/util/font_util.dart';

class ActivityHabbitProgress extends StatelessWidget {
  const ActivityHabbitProgress({super.key, required this.switcherType});
  final HabbitTimeSwitcherType switcherType;

  @override
  Widget build(BuildContext context) {
    const EdgeInsets horizontalPadding = EdgeInsets.symmetric(horizontal: 20);
    const String title = 'Activity Time';
    final String description = 'You were very active this ${switcherType.name}';
    final double maxHeight = MediaQuery.of(context).size.height * 0.2;
    final double maxWidth = MediaQuery.of(context).size.width;
    Map<String, double>? progress = HabbitsService.getActivityProgressByTime(switcherType);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: horizontalPadding,
          child: NavigationText(title: title, description: description),
        ),
        SizedBox(
          height: maxHeight,
          width: maxWidth,
          child: ListView.builder(
              shrinkWrap: false,
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: progress!.length,
              itemBuilder: (context, index) {
                debugPrint('progress length ${progress.length}');
                return ActivityHabbitProgressItem(
                  itemName: progress.keys.elementAt(index),
                  itemProgress: progress.values.elementAt(index),
                  maxHeight: maxHeight,
                  itemsNumber: progress.length,
                );
              }),
        ),
      ],
    );
  }
}

class ActivityHabbitProgressItem extends StatelessWidget {
  const ActivityHabbitProgressItem(
      {super.key,
      required this.itemName,
      required this.itemProgress,
      required this.maxHeight,
      required this.itemsNumber});
  final String? itemName;
  final double? itemProgress;
  final double maxHeight;
  final int itemsNumber;

  @override
  Widget build(BuildContext context) {
    final double maxWidth = MediaQuery.of(context).size.width - 10;
    double progress = itemProgress == null ? 0 : itemProgress!;
    return SizedBox(
      width: maxWidth / itemsNumber,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 2),
            child: Container(
              height: progress != 1 ? (maxHeight - 28) * (1 - progress) : (maxHeight - 28) * (1 - progress) - 2,
              width: 12,
              decoration: BoxDecoration(
                color: ColorUtil.elementsBaseColor,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          Container(
            height: (maxHeight - 28) * progress,
            width: 12,
            decoration: BoxDecoration(
              color: ColorUtil.semanticColorYellow,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(itemName!, style: FontUtil.defaultFont.copyWith(fontSize: 12, fontWeight: FontWeight.w500)),
          ),
        ],
      ),
    );
  }
}
