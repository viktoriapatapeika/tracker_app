import 'package:flutter/material.dart';

import 'package:tracker_app/dto/habbits.dart';
import 'package:tracker_app/service/habbits_service.dart';
import 'package:tracker_app/util/font_util.dart';
import 'package:tracker_app/util/string_util.dart';

class ProgressChart extends StatelessWidget {
  ProgressChart({super.key});
  final List<HabbitType> habbitTypes = HabbitsService.habbitTypes;

  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height * 0.2;
    return SizedBox(
      height: maxHeight,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CircleChart(),
          Expanded(
            child: ListView.builder(
                shrinkWrap: false,
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: habbitTypes.length,
                itemBuilder: (context, index) {
                  return ProgressChartItem(habbitType: habbitTypes[index]);
                }),
          ),
        ],
      ),
    );
  }
}

class CircleChart extends StatelessWidget {
  const CircleChart({super.key});

  @override
  Widget build(BuildContext context) {
    Size maxSize = MediaQuery.of(context).size * 0.3;
    return CustomPaint(
      size: maxSize,
      painter: ChartPainter(),
    );
  }
}

class ChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..strokeWidth = 3;
    Offset center = const Offset(50, 50);
    // canvas.d
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class ProgressChartItem extends StatelessWidget {
  const ProgressChartItem({super.key, required this.habbitType});
  final HabbitType habbitType;

  @override
  Widget build(BuildContext context) {
    const Size circleSize = Size(8, 8);
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: circleSize.height,
            width: circleSize.width,
            decoration: BoxDecoration(color: HabbitsService.getHabbitColor(habbitType), shape: BoxShape.circle),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Text(StringUtil.capitalize(habbitType.name), style: FontUtil.defaultFont),
          )
        ],
      ),
    );
  }
}
