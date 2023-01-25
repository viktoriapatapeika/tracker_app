import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter/material.dart';

import 'package:tracker_app/util/color_util.dart';
import 'package:tracker_app/util/font_util.dart';

class NavigationText extends StatelessWidget {
  const NavigationText({super.key, required this.title, required this.description, this.page});
  final String title;
  final String description;
  final Widget? page;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: FontUtil.defaultFont
                      .copyWith(color: ColorUtil.textActiveColor, fontWeight: FontWeight.w700, fontSize: 22)),
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(description,
                    style: FontUtil.defaultFont
                        .copyWith(color: ColorUtil.textInactiveColor, fontWeight: FontWeight.w500, fontSize: 14)),
              ),
            ],
          ),
          IconButton(
            onPressed: () {
              debugPrint('Navigate to the $title page');
              // Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => page));
            },
            icon: const Icon(FontAwesomeIcons.chevronRight, color: ColorUtil.elementsBaseColor, size: 18),
          )
        ],
      ),
    );
  }
}
