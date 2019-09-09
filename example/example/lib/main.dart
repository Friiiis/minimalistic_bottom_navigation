import 'package:example/minimalistic_bottom_navigation/src/minimalistic_bottom_bar.dart';
import 'package:example/minimalistic_bottom_navigation/src/minimalistic_bottom_bar_item.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // PageController _pageController;
  int currentIndex = 0;
  List<Color> colors = List<Color>();

  @override
  void initState() {
    // _pageController = PageController(initialPage: 0);
    super.initState();
    colors.add(Colors.green);
    colors.add(Colors.redAccent);
    colors.add(Colors.orangeAccent);
  }

  void bottomNavigationTapped(int index) {
    setState(() {
      currentIndex = index;
      // _pageController.jumpToPage(index);
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
      bottomNavigationBar: bottomNavMinimalistic(),
    );
  }

  Widget samplePage(Color background) {
    return Center(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
        color: background,
      ),
    );
  }

  Widget bottomNavStandard() {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      elevation: 5,
      fixedColor: Colors.black,
      onTap: (index) {
        bottomNavigationTapped(index);
      },
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
        BottomNavigationBarItem(
            icon: Icon(Icons.headset), title: Text('Music')),
        BottomNavigationBarItem(
            icon: Icon(Icons.person), title: Text('Profile')),
      ],
    );
  }

  Widget bottomNavMinimalistic() {
    return MinimalisticBottomBar(
      iconOpacity: 0.2,
      elevation: 5,
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
    );
  }
}
