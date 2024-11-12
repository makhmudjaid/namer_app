import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:namer_app/my_app_state.dart';
import 'package:namer_app/my_app.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MyApp(),
    ),
  );
}
