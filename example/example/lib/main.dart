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
  PageController _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  void bottomNavigationTapped(int index) {
    setState(() {
      currentIndex = index;
      _pageController.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          samplePage(Colors.greenAccent),
          samplePage(Colors.redAccent),
          samplePage(Colors.blueAccent),
          samplePage(Colors.yellow),
        ],
      ),
      bottomNavigationBar: bottomNavMinimalistic(),
    );
  }

  Widget samplePage(Color background) {
    return Center(
      child: Container(
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
      currentIndex: currentIndex,
      onIndexChanged: (index) {
        bottomNavigationTapped(index);
      },
      items: <MinimalisticBottomBarItem>[
        MinimalisticBottomBarItem(
          text: 'Home',
          icon: Icons.home,
          color: Colors.greenAccent
        ),
        MinimalisticBottomBarItem(
          text: 'Music',
          icon: Icons.headset,
          color: Colors.redAccent
        ),
        MinimalisticBottomBarItem(
          text: 'Profile',
          icon: Icons.person,
          color: Colors.blueAccent
        ),
        MinimalisticBottomBarItem(
          text: 'Discover',
          icon: Icons.person,
          color: Colors.yellow
        ),
      ],
    );
  }
}
