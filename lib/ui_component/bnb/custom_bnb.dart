import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tracker_app/util/color_util.dart';

enum CustomBottomNavigationBarIcon { home, myProducts, insights, scanHistory }

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key, this.onTap, required this.onAddTap, this.currentIndex = 0});

  final ValueChanged<int>? onTap;
  final VoidCallback onAddTap;
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    const double containerHeight = 72;
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: containerHeight,
        decoration: const BoxDecoration(color: ColorUtil.backgroundColor),
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomBottomNavigationBarItem(
                iconType: CustomBottomNavigationBarIcon.home,
                onTap: () => onTap!(0),
                isSelected: currentIndex == 0,
              ),
              CustomBottomNavigationBarItem(
                iconType: CustomBottomNavigationBarIcon.myProducts,
                onTap: () => onTap!(1),
                isSelected: currentIndex == 1,
              ),
              FoodIOBottomNavigationBarAddButton(onTap: onAddTap),
              CustomBottomNavigationBarItem(
                iconType: CustomBottomNavigationBarIcon.insights,
                onTap: () => onTap!(2),
                isSelected: currentIndex == 2,
              ),
              CustomBottomNavigationBarItem(
                iconType: CustomBottomNavigationBarIcon.scanHistory,
                onTap: () => onTap!(3),
                isSelected: currentIndex == 3,
              ),
            ]),
      ),
    );
  }
}

class FoodIOBottomNavigationBarAddButton extends StatelessWidget {
  const FoodIOBottomNavigationBarAddButton({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 72,
        decoration: const BoxDecoration(shape: BoxShape.circle, color: ColorUtil.elementsBaseColor),
        child: const Padding(
          padding: EdgeInsets.all(16),
          child: Center(
              child: Icon(
            FontAwesomeIcons.plus,
            color: ColorUtil.textActiveColor,
            size: 20,
          )),
        ),
      ),
    );
  }
}

class CustomBottomNavigationBarItem extends StatelessWidget {
  final CustomBottomNavigationBarIcon iconType;
  final VoidCallback onTap;
  final bool isSelected;
  const CustomBottomNavigationBarItem(
      {super.key, required this.iconType, required this.onTap, required this.isSelected});

  IconData? getIcon(CustomBottomNavigationBarIcon iconType) {
    switch (iconType) {
      case CustomBottomNavigationBarIcon.home:
        return FontAwesomeIcons.house;
      case CustomBottomNavigationBarIcon.myProducts:
        return FontAwesomeIcons.chartPie;
      case CustomBottomNavigationBarIcon.insights:
        return FontAwesomeIcons.dumbbell;
      case CustomBottomNavigationBarIcon.scanHistory:
        return FontAwesomeIcons.utensils;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(getIcon(iconType),
          size: 20, color: isSelected ? ColorUtil.textActiveColor : ColorUtil.textInactiveColor),
    );
  }
}
