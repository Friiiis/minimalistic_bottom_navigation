import 'package:flutter/material.dart';
import 'minimalistic_bottom_bar_item.dart';

class MinimalisticBottomBar extends StatefulWidget {
  // Height of the navigation bar item
  final double height;

  // The background color of the BottomNavigationBar
  final Color backgroundColor;

  final Color fontColor;

  // Items in the BottomNavigationBar
  final List<MinimalisticBottomBarItem> items;

  // Duration of the selection animation
  final Duration animationDuration;

  // The selected index of the bar
  final int currentIndex;

  // Callback when an item is selected
  final ValueChanged<int> onIndexChanged;

  MinimalisticBottomBar({
    this.height = 80.0,
    this.backgroundColor = Colors.white,
    this.fontColor = Colors.black54,
    @required this.items,
    this.animationDuration = const Duration(milliseconds: 200),
    @required this.currentIndex,
    @required this.onIndexChanged,
  }) : assert(items.length >= 2 && items.length <= 5);

  @override
  _MinimalisticBottomBarState createState() => _MinimalisticBottomBarState();
}

class _MinimalisticBottomBarState extends State<MinimalisticBottomBar>
    with TickerProviderStateMixin {
  // Hosts all the controllers controlling the boxes.
  AnimationController _controller;

  // Current index chosen
  int index = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.animationDuration);
    // Start animation for initially selected controller.
    // _controllers[widget.selectedIndex].forward();
    index = widget.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: widget.height,
      color: widget.backgroundColor,
      child: Center(
        child: Stack(
          children: <Widget>[
            // I stedet for Positioned, skal vi bruge SlideTransition til at animere bevægelsen.
            // For at animere ikonet så det ændrer sig, skal vi bruge AnimatedCrossFade 
            Positioned(
              top: 10,
              left: screenWidth / widget.items.length * widget.currentIndex,
              child: Container(
                width: screenWidth / widget.items.length,
                // color: Colors.purpleAccent,
                child: Icon(
                  Icons.home,
                  color: Colors.greenAccent,
                  size: widget.height * 0.75,
                ),
              ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: widget.items.map((item) {
                  int index = widget.items.indexOf(item);
                  return InkWell(
                    onTap: () {
                      widget.onIndexChanged(index);
                    },
                    child: Container(
                      width: screenWidth / widget.items.length,
                      child: Center(
                        child: Text(
                          item.text,
                          style: TextStyle(
                            color: widget.fontColor,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList()),
          ],
        ),
      ),
    );
  }
}
