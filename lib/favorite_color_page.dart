import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:namer_app/my_app_state.dart';

class FavoriteColorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
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
