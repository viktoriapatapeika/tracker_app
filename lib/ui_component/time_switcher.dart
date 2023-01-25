import 'package:flutter/material.dart';

import 'package:tracker_app/service/habbits_service.dart';
import 'package:tracker_app/util/color_util.dart';
import 'package:tracker_app/util/font_util.dart';
import 'package:tracker_app/util/string_util.dart';

class TimeSwitcher extends StatefulWidget {
  const TimeSwitcher({super.key});

  @override
  State<TimeSwitcher> createState() => TimeSwitcherState();
}

class TimeSwitcherState extends State<TimeSwitcher> {
  int selectedIndex = 0;
  List<HabbitTimeSwitcherType> switcherTypes = HabbitsService.switcherTypes;

  @override
  Widget build(BuildContext context) {
    const double height = 48;
    double elementWidth = (MediaQuery.of(context).size.width - 60) / switcherTypes.length;
    return Container(
      height: height,
      decoration: BoxDecoration(color: ColorUtil.elementsBaseColor, borderRadius: BorderRadius.circular(32)),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: switcherTypes.length,
          itemBuilder: (context, index) {
            return TimeSwitcherItem(
              switcherType: switcherTypes[index],
              isSelected: selectedIndex == index,
              width: elementWidth,
              onTap: () => setState(() => selectedIndex = index),
            );
          }),
    );
  }
}

class TimeSwitcherItem extends StatelessWidget {
  const TimeSwitcherItem(
      {super.key, required this.switcherType, required this.isSelected, required this.onTap, required this.width});

  final HabbitTimeSwitcherType switcherType;
  final bool isSelected;
  final VoidCallback onTap;
  final double width;

  @override
  Widget build(BuildContext context) {
    const double padding = 3;
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(padding),
        child: Container(
          width: width - 2 * padding,
          decoration: isSelected
              ? BoxDecoration(color: ColorUtil.backgroundColor, borderRadius: BorderRadius.circular(32))
              : null,
          child: Center(
              child: Text(StringUtil.capitalize(switcherType.name),
                  style: FontUtil.defaultFont.copyWith(fontWeight: FontWeight.w500))),
        ),
      ),
    );
  }
}
