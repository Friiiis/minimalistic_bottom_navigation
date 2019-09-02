import 'package:flutter/material.dart';
import 'minimalistic_bottom_bar_item.dart';

class MinimalisticBottomBar extends StatefulWidget {
  // Height of the navigation bar item
  final double height;

  // The background color of the BottomNavigationBar
  final Color backgroundColor;

  // Color of the text
  final Color fontColor;

  // The opacity of the color of the icons.
  final double iconOpacity;

  final double elevation;

  // Items in the BottomNavigationBar
  final List<MinimalisticBottomBarItem> items;

  // The selected index of the bar
  final int currentIndex;

  // Callback when an item is selected
  final ValueChanged<int> onIndexChanged;

  MinimalisticBottomBar({
    this.height = 75,
    this.backgroundColor = Colors.white,
    this.fontColor = Colors.black54,
    this.iconOpacity = 1,
    this.elevation = 2,
    @required this.items,
    @required this.currentIndex,
    @required this.onIndexChanged,
  }) : assert(items.length >= 2 &&
            items.length <= 5 &&
            iconOpacity >= 0 &&
            iconOpacity <= 1);

  @override
  _MinimalisticBottomBarState createState() => _MinimalisticBottomBarState();
}

class _MinimalisticBottomBarState extends State<MinimalisticBottomBar>
    with TickerProviderStateMixin {
  bool showingFirstIcon = true;

  Icon firstIcon;
  Icon secondIcon;

  @override
  void initState() {
    super.initState();
    firstIcon = Icon(
      Icons.home,
      color: widget.items[widget.currentIndex].color.withOpacity(widget.iconOpacity),
      size: widget.height * 0.65,
    );
    secondIcon = Icon(
      Icons.home,
      color: widget.items[widget.currentIndex].color.withOpacity(widget.iconOpacity),
      size: widget.height * 0.65,
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    if (showingFirstIcon) {
      secondIcon = Icon(
        widget.items[widget.currentIndex].icon,
        color: widget.items[widget.currentIndex].color.withOpacity(widget.iconOpacity),
        size: widget.height * 0.6,
      );
      showingFirstIcon = false;
    } else {
      firstIcon = Icon(
        widget.items[widget.currentIndex].icon,
        color: widget.items[widget.currentIndex].color.withOpacity(widget.iconOpacity),
        size: widget.height * 0.6,
      );
      showingFirstIcon = true;
    }

    return Container(
      height: widget.height,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: widget.elevation,
            offset: Offset(0, 0),
            spreadRadius: widget.elevation,
          ),
        ],
      ),
      child: Center(
        child: Stack(
          children: <Widget>[
            AnimatedPositioned(
              duration: Duration(milliseconds: 500),
              curve: Curves.fastOutSlowIn,
              top: widget.height * 0.2,
              left: screenWidth / widget.items.length * widget.currentIndex,
              child: Container(
                width: screenWidth / widget.items.length,
                // color: Colors.purpleAccent,
                child: Center(
                  child: AnimatedCrossFade(
                    duration: Duration(milliseconds: 250),
                    firstChild: firstIcon,
                    secondChild: secondIcon,
                    crossFadeState: showingFirstIcon
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                  ),
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
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: widget.fontColor,
                            fontSize: 16,
                            fontWeight: widget.currentIndex == index
                                ? FontWeight.bold
                                : FontWeight.normal,
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
