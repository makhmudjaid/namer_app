import 'dart:math';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

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
