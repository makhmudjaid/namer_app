import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:namer_app/my_app_state.dart';

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
