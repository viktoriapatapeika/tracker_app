import 'package:flutter/material.dart';
import 'package:tracker_app/dto/habbits.dart';
import 'package:tracker_app/ui_component/habbit_widget.dart';
import 'package:tracker_app/util/color_util.dart';
import 'package:tracker_app/util/font_util.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const String headerText = 'Today\'s Target';
    return Scaffold(
      backgroundColor: ColorUtil.backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Text(headerText, style: FontUtil.headerFont),
              ),
              Row(
                children: [
                  Column(children: const [
                    HabbitWidget(habbitType: HabbitType.water),
                    HabbitWidget(habbitType: HabbitType.heartRate)
                  ]),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Column(children: const [
                      HabbitWidget(habbitType: HabbitType.activity),
                      HabbitWidget(habbitType: HabbitType.sleep)
                    ]),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
