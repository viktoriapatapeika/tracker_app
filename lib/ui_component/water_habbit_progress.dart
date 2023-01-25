import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter/material.dart';

import 'package:tracker_app/service/habbits_service.dart';
import 'package:tracker_app/ui_component/navigation_text.dart';
import 'package:tracker_app/util/color_util.dart';
import 'package:tracker_app/util/font_util.dart';

class WaterHabbitProgress extends StatelessWidget {
  const WaterHabbitProgress({super.key, required this.switcherType});
  final HabbitTimeSwitcherType switcherType;

  @override
  Widget build(BuildContext context) {
    const EdgeInsets horizontalPadding = EdgeInsets.symmetric(horizontal: 20);
    const String title = 'Water Drink';
    final double maxHeight = MediaQuery.of(context).size.height * 0.1;
    final double maxWidth = MediaQuery.of(context).size.width;
    final String descriptionTimePeriod = switcherType == HabbitTimeSwitcherType.week
        ? 'day'
        : switcherType == HabbitTimeSwitcherType.month
            ? 'week'
            : 'month';
    final String description = 'Water required per $descriptionTimePeriod';
    Map<String, bool>? progress = HabbitsService.getWaterProgressByTime(switcherType);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: horizontalPadding,
          child: NavigationText(title: title, description: description),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: SizedBox(
            height: maxHeight,
            width: maxWidth,
            child: ListView.builder(
                shrinkWrap: false,
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: progress!.length,
                itemBuilder: (context, index) {
                  debugPrint('progress length ${progress.length}');
                  return WaterHabbitProgressItem(
                    itemName: progress.keys.elementAt(index),
                    itemComplete: progress.values.elementAt(index),
                    itemsNumber: progress.length,
                  );
                }),
          ),
        ),
      ],
    );
  }
}

class WaterHabbitProgressItem extends StatelessWidget {
  const WaterHabbitProgressItem(
      {super.key, required this.itemName, required this.itemComplete, required this.itemsNumber});
  final String itemName;
  final bool itemComplete;
  final int itemsNumber;

  @override
  Widget build(BuildContext context) {
    const Size containerSize = Size(32, 32);
    final double maxWidth = MediaQuery.of(context).size.width - 10;
    return SizedBox(
      width: maxWidth / itemsNumber,
      child: Column(
        children: [
          Container(
            height: containerSize.height,
            width: containerSize.width,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: itemComplete ? ColorUtil.semanticColorBlue : ColorUtil.elementsBaseColor),
            child: itemComplete ? const Icon(FontAwesomeIcons.check, color: ColorUtil.backgroundColor, size: 16) : null,
          ),
          Text(itemName, style: FontUtil.defaultFont.copyWith(fontSize: 12, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
