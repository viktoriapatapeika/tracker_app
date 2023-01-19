import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import 'package:tracker_app/dto/habbits.dart';
import 'package:tracker_app/service/habbits_service.dart';
import 'package:tracker_app/util/color_util.dart';
import 'package:tracker_app/util/font_util.dart';

class HabbitWidget extends StatelessWidget {
  const HabbitWidget({super.key, required this.habbitType});
  final HabbitType habbitType;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double maxHeight = size.height * 0.7;
    double width = size.width;
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        height: maxHeight * HabbitsService.getHeightOccupated(context, habbitType),
        width: (width - 76) / 2,
        decoration: BoxDecoration(
          color: HabbitsService.getHabbitColor(habbitType),
          borderRadius: const BorderRadius.all(Radius.circular(32)),
          boxShadow: [
            BoxShadow(
                color: HabbitsService.getHabbitColor(habbitType).withOpacity(0.6),
                offset: const Offset(4, 4),
                blurRadius: 20,
                spreadRadius: 2)
          ],
        ),
        child: buildChild()!,
      ),
    );
  }

  Widget? buildChild() {
    switch (habbitType) {
      case HabbitType.water:
        return buildWaterHabbitImage();
      case HabbitType.activity:
        return buildActivityHabbitImage();
      case HabbitType.heartRate:
        return buildHeartRateHabbitImage();
      case HabbitType.sleep:
        return buildSleepHabbitImage();
    }
  }

  Widget buildWaterHabbitImage() {
    return Stack(
      children: [
        Positioned(
            top: 37,
            right: 37,
            child: Container(
                height: 58,
                width: 58,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                    border: Border.all(width: 2, color: ColorUtil.backgroundColor)))),
        Positioned(
            top: 12,
            right: 12,
            child: Container(
                height: 108,
                width: 108,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                    border: Border.all(width: 2, color: ColorUtil.backgroundColor.withOpacity(0.7))))),
        Positioned(
            top: -8,
            right: -8,
            child: Container(
                height: 148,
                width: 148,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                    border: Border.all(width: 2, color: ColorUtil.backgroundColor.withOpacity(0.4))))),
        Padding(
          padding: const EdgeInsets.only(left: 20, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('Water', style: FontUtil.habbitTitleFont),
              Text('3 glasses', style: FontUtil.habbitGoalFont),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildActivityHabbitImage() {
    return Stack(
      children: [
        Positioned(
          top: 128,
          right: 48,
          child: Container(
              height: 88,
              width: 88,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(width: 2, color: ColorUtil.backgroundColor))),
        ),
        Positioned(
          top: 98,
          right: 18,
          child: Container(
              height: 88,
              width: 88,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(width: 2, color: ColorUtil.backgroundColor.withOpacity(0.7)))),
        ),
        Positioned(
          top: 68,
          right: -12,
          child: Container(
              height: 88,
              width: 88,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(width: 2, color: ColorUtil.backgroundColor.withOpacity(0.4)))),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Activity', style: FontUtil.habbitTitleFont),
              Column(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Text('Steps', style: FontUtil.habbitGoalFont),
                    Text('6524', style: FontUtil.habbitProgressFont),
                  ]),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Text('Training', style: FontUtil.habbitGoalFont),
                    Text('4h', style: FontUtil.habbitProgressFont)
                  ]),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildHeartRateHabbitImage() {
    return Stack(
      children: [
        Positioned(
            top: 188,
            left: -24,
            child: CustomPaint(size: const Size(128, 88), painter: LineChartPainter(ColorUtil.backgroundColor))),
        Positioned(
            top: 138,
            left: -12,
            child: CustomPaint(
                size: const Size(128, 88), painter: LineChartPainter(ColorUtil.backgroundColor.withOpacity(0.7)))),
        Positioned(
            top: 98,
            left: 0,
            child: CustomPaint(
                size: const Size(128, 88), painter: LineChartPainter(ColorUtil.backgroundColor.withOpacity(0.4)))),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Heart Rate', style: FontUtil.habbitTitleFont),
              Column(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Text('Lowest', style: FontUtil.habbitGoalFont),
                    Text('63 bpm', style: FontUtil.habbitProgressFont)
                  ]),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Text('Highest', style: FontUtil.habbitGoalFont),
                    Text('140 bpm', style: FontUtil.habbitProgressFont)
                  ]),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildSleepHabbitImage() {
    return Stack(
      children: [
        Positioned(
            top: 16,
            right: 48,
            child: Container(
                height: 88,
                width: 88,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                    border: Border.all(width: 2, color: ColorUtil.backgroundColor)))),
        Positioned(
            top: 16,
            right: 16,
            child: Container(
                height: 88,
                width: 88,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                    border: Border.all(width: 2, color: ColorUtil.backgroundColor.withOpacity(0.7))))),
        Positioned(
            top: 16,
            right: -16,
            child: Container(
                height: 88,
                width: 88,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                    border: Border.all(width: 2, color: ColorUtil.backgroundColor.withOpacity(0.4))))),
        Padding(
          padding: const EdgeInsets.only(left: 20, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('Sleep', style: FontUtil.habbitTitleFont),
              Text('8 hours', style: FontUtil.habbitGoalFont),
            ],
          ),
        ),
      ],
    );
  }
}

class LineChartPainter extends CustomPainter {
  final Color color;
  LineChartPainter(this.color);
  @override
  void paint(Canvas canvas, Size size) {
    const pointMode = ui.PointMode.polygon;
    final points = [
      const Offset(0, 0),
      const Offset(40, 0),
      const Offset(58, -32),
      const Offset(74, 18),
      const Offset(96, -16),
      const Offset(104, 0),
      const Offset(132, -0)
    ];
    final paint = Paint()
      ..color = color
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;
    canvas.drawPoints(pointMode, points, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
