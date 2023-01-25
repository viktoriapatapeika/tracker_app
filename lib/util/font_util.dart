import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';
import 'package:tracker_app/util/color_util.dart';

class FontUtil {
  static TextStyle defaultFont = GoogleFonts.roboto();
  static TextStyle headerFont = defaultFont.copyWith(fontSize: 28, fontWeight: FontWeight.w900);
  static TextStyle habbitTitleFont =
      defaultFont.copyWith(color: ColorUtil.habbitTextColor, fontWeight: FontWeight.w500, fontSize: 18);
  static TextStyle habbitGoalFont = defaultFont.copyWith(
      color: ColorUtil.habbitTextColor.withOpacity(0.8), fontWeight: FontWeight.w300, fontSize: 12);
  static TextStyle habbitProgressFont =
      defaultFont.copyWith(color: ColorUtil.habbitTextColor, fontWeight: FontWeight.w500, fontSize: 12);
}
