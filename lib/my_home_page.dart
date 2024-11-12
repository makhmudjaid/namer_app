import 'package:flutter/material.dart';
import 'package:namer_app/favorite_color_page.dart';
import 'package:namer_app/generator_page.dart';
import 'package:namer_app/switch_page.dart';
import 'package:namer_app/favorites_page.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    Widget page;
    final theme = Theme.of(context);
    final style = theme.textTheme.headlineSmall!.copyWith(
      color: theme.colorScheme.onPrimaryContainer,
    );
    switch (selectedIndex) {
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
        body: Row(
          children: [
            SafeArea(
              child: NavigationRail(
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                extended: constraints.maxWidth >= 1200,
                destinations: [
                  NavigationRailDestination(
                    icon: Icon(Icons.play_arrow),
                    label: Text(
                      'Generator',
                      style: style,
                    ),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.favorite),
                    label: Text(
                      'Favorites',
                      style: style,
                    ),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.palette),
                    label: Text(
                      'Switch Theme',
                      style: style,
                    ),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.panorama),
                    label: Text(
                      'Favorite themes',
                      style: style,
                    ),
                  ),
                ],
                selectedIndex: selectedIndex,
                onDestinationSelected: (value) {
                  setState(() {
                    selectedIndex = value;
                  });
                },
              ),
            ),
            Expanded(
              child: Container(
                color: Theme.of(context).colorScheme.secondary,
                child: page,
              ),
            ),
          ],
        ),
      );
    });
  }
}
