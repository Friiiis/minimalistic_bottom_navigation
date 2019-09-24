# minimalistic_bottom_navigation

Minimalistic bottom navigation bar for Flutter projects. Based on my [Dribbble design](https://dribbble.com/shots/6958560-Minimalistic-Bottom-Navigation).

I created this design because I find the standard bottom navigation too boring. There is a lot of cool designs available to use, but most of them relies on icons instead of text. An icon without explanatory text can be confusing to some users, which is why I tried to come up with a design that combines beauty and user experience.

**Style guide**

For the best result when using the Minimalistic Bottom Navigation, please use the following style guide:

- The text of the items should be roughly the same length. This is necessary because each item has the same amount of horizontal space on the screen. Fewer items can take bigger differences in length.
- Icons should be solid and have an opacity below 0.5. This makes the icon visible but not taking too much attention.

## Demo

Indsæt gif

## Installation

In the `dependencies:` section of your `pubspec.yaml`, add the following line:

```yaml
  minimalistic_bottom_navigation: <latest_version>
```

## Usage

```dart
import 'package:minimalistic_bottom_navigation/minimalistic_bottom_navigation.dart';

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;
  List<Color> colors = List<Color>();

  @override
  void initState() {
    super.initState();
    colors.add(Colors.green);
    colors.add(Colors.redAccent);
    colors.add(Colors.orangeAccent);
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

```

## Properties

- **height** `double`: Height of the navigation bar. Defaults to `80`.
- **backgroundColor** `Color`: The background color of the navigation bar. Defaults to `Colors.white`.
- **foregroundColor** `Color`: Color of the font. Defaults to `Color(0xff4a4a4a)`.
- **iconOpacity** `double`: The opacity of the color of the icons, should be between `0` and `1`. Defaults to `0.5`.
- **elevation** `double`: The elevation of the navigation bar. Defaults to `2`.
- **items** `List<MinimalisticBottomBarItem>`: Items in the navigation bar. Must contain between 2 and 5 items (both inclusive).
- **currentIndex** `int`: The current index of the navigation bar.
- **onIndexChanged** `ValueChanged<int>`: Callback when an item is selected.

## Example

View the Flutter app in the `example` directory to see a working example of how to use and implement the slider.

## Contributors

Gustav Friis-Hansen: https://github.com/Friiiis
Stefan Petrovic: https://github.com/StefPetro