import 'package:flutter/material.dart';
import 'package:minimalistic_bottom_navigation/minimalistic_bottom_navigation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;
  List<Color> colors = List<Color>();

  @override
  void initState() {
    super.initState();
    colors.add(Colors.green);
    colors.add(Colors.redAccent);
    colors.add(Colors.blueAccent);
  }

  void bottomNavigationTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          curve: Curves.ease,
          color: colors[currentIndex],
        ),
      ),
      bottomNavigationBar: MinimalisticBottomBar(
        iconOpacity: 0.2,
        elevation: 0,
        currentIndex: currentIndex,
        onIndexChanged: (index) {
          bottomNavigationTapped(index);
        },
        items: <MinimalisticBottomBarItem>[
          MinimalisticBottomBarItem(
            text: 'Home',
            icon: Icons.home,
            color: colors[0],
          ),
          MinimalisticBottomBarItem(
            text: 'Music',
            icon: Icons.headset,
            color: colors[1],
          ),
          MinimalisticBottomBarItem(
            text: 'Settings',
            icon: Icons.settings,
            color: colors[2],
          ),
        ],
      ),
    );
  }
}
