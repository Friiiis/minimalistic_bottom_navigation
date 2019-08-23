import 'package:flutter/material.dart';
import 'package:minimalistic_bottom_navigation/src/minimalistic_bottom_bar_item.dart';

class MinimalisticBottomBar extends StatefulWidget {
  // Height of the navigation bar item
  final double height;

  // Items in the BottomNavigationBar
  final List<MinimalisticBottomBarItem> items;

  // Duration of the selection animation
  final Duration animationDuration;

  // The selected index of the bar
  final int selectedIndex;

  // Callback when an item is selected
  final ValueChanged<int> onIndexChanged;

  // The background color of the BottomNavigationBar
  final Color backgroundColor;

  MinimalisticBottomBar({
    this.height = 120.0,
    @required this.items,
    this.animationDuration = const Duration(milliseconds: 200),
    @required this.selectedIndex,
    @required this.onIndexChanged,
    this.backgroundColor = Colors.white,
  }) : assert(items.length >= 2 && items.length <= 5);

  @override
  _MinimalisticBottomBarState createState() => _MinimalisticBottomBarState();
}

class _MinimalisticBottomBarState extends State<MinimalisticBottomBar> with TickerProviderStateMixin {
  
  // Hosts all the controllers controlling the boxes.
  List<AnimationController> _controllers = [];

  // Current index chosen
  int index = 0;

  @override
  void initState() {
    super.initState();
    // Initialise all animation controllers
    for (int i = 0; i < widget.items.length; i++){
      _controllers.add(
        AnimationController(
          vsync: this,
          duration: widget.animationDuration
        )
      );
    } 
    // Start animation for initially selected controller.
    _controllers[widget.selectedIndex].forward();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}