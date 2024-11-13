import 'package:flutter/material.dart';
import 'package:namer_app/favorite_color_page.dart';
import 'package:namer_app/generator_page.dart';
import 'package:namer_app/switch_page.dart';
import 'package:namer_app/favorites_page.dart';
import 'package:namer_app/my_home_page.dart';
import 'package:namer_app/destinations.dart';

class MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  var selectedIndex = 0;

  var screenIndex = 0;

  void handleScreenChanged(int selectedScreen) {
    setState(() {
      screenIndex = selectedScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (screenIndex) {
      case 0:
        page = GeneratorPage();
      case 1:
        page = FavoritesPage();
      case 2:
        page = SwitchPage();
      case 3:
        page = FavoriteColorPage();
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        bottomNavigationBar: NavigationBar(
          destinations: destinations.map(
            (Destination destination) {
              return NavigationDestination(
                label: destination.label,
                icon: destination.icon,
                selectedIcon: destination.selectedIcon,
                tooltip: destination.tooltip,
              );
            },
          ).toList(),
          selectedIndex: screenIndex,
          onDestinationSelected: (value) {
            setState(() {
              screenIndex = value;
            });
          },
        ),
        body: Expanded(
            child: Container(
          color: Theme.of(context).colorScheme.secondary,
          child: page,
        )),
      );
    });
  }
}
