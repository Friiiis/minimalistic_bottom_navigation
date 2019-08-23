import 'package:flutter/material.dart';

class MinimalisticBottomBarItem {
  // Icon to be displayed in the bar
  IconData icon;

  // Title of the item
  String text;

  // The color of the selected item
  Color color;

  MinimalisticBottomBarItem({
    @required this.icon,
    @required this.text,
    @required this.color,
  });
}