import 'dart:math';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:namer_app/title_widget.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<int> changeBackgroundColor =
        Provider.of<MyAppState>(context).backgroundColor;
    return MaterialApp(
      title: 'Namer App',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromARGB(
            changeBackgroundColor[0],
            changeBackgroundColor[1],
            changeBackgroundColor[2],
            changeBackgroundColor[3],
          ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  var favorites = <WordPair>[];

  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }

  var favoriteThemes = [];

  void toggleFavoriteColor() {
    if (favoriteThemes.contains(backgroundColor)) {
      favoriteThemes.remove(backgroundColor);
    } else {
      favoriteThemes.add(backgroundColor);
    }
    notifyListeners();
  }

  List<int> backgroundColor = [
    255,
    Random().nextInt(256),
    Random().nextInt(256),
    Random().nextInt(256),
  ];

  void changeBackgroundColor() {
    backgroundColor = [
      255,
      Random().nextInt(256),
      Random().nextInt(256),
      Random().nextInt(256),
    ];
    print(backgroundColor);
    notifyListeners();
  }

  void setState(Null Function() param0) {}
}

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

class GeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;
    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondaryFixedDim,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTitle(),
            WordCard(pair: pair),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    appState.toggleFavorite();
                  },
                  icon: Icon(icon),
                  label: Text('Like'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    appState.getNext();
                  },
                  child: Text('Randomize'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displaySmall!.copyWith(
      color: theme.colorScheme.onPrimary,
    );
    var appState = context.watch<MyAppState>();
    if (appState.favorites.isEmpty) {
      return Center(
        child: Text('No favorites yet.'),
      );
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('You have ' '${appState.favorites.length} favorites'),
        ),
        for (var pair in appState.favorites)
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text(
              pair.asPascalCase,
              style: style,
            ),
          )
      ],
    );
  }
}

class SwitchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var switchColor = context.watch<MyAppState>();
    IconData icon;
    icon = Icons.palette;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondaryFixedDim,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                switchColor.changeBackgroundColor();
              },
              icon: Icon(icon),
              label: Text('Switch App Color'),
            ),
            ElevatedButton.icon(
              onPressed: () {
                appState.toggleFavoriteColor();
              },
              icon: Icon(icon),
              label: Text('Like'),
            ),
          ],
        ),
      ),
    );
  }
}

class FavoriteColorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var color = appState.backgroundColor;
    var appColor = context.watch<MyAppState>().backgroundColor;
    var switchColor = context.watch<MyAppState>();
    IconData icon;
    if (appState.favoriteThemes.contains(color)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    icon = Icons.palette;
    final theme = Theme.of(context);
    final style = theme.textTheme.displaySmall!.copyWith(
      color: theme.colorScheme.onPrimary,
    );
    if (appState.favoriteThemes.isEmpty) {
      return Center(
        child: Text('No favorites yet.'),
      );
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child:
              Text('You have ' '${appState.favoriteThemes.length} favorites'),
        ),
        for (var color in appState.favoriteThemes)
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text(
              color.toString(),
              style: style,
            ),
          )
      ],
    );
  }
}

class WordCard extends StatelessWidget {
  const WordCard({
    super.key,
    required this.pair,
  });

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.primary,
    );
    return Card(
      color: theme.colorScheme.primary,
      margin: EdgeInsets.all(10),
      elevation: 5.0,
      child: Card(
        margin: EdgeInsets.all(20),
        color: theme.colorScheme.onPrimary,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(pair.asPascalCase, style: style),
        ),
      ),
    );
  }
}
