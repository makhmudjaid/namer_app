import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:namer_app/my_app_state.dart';
import 'package:namer_app/my_home_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<int> changeBackgroundColor =
        Provider.of<MyAppState>(context).backgroundColor;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
