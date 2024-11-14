import 'dart:math';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
  var favoriteThemes = [];
  var favorites = <WordPair>[];
  List<int> backgroundColor = [
    256,
    256,
    256,
    256,
  ];
  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }

  void toggleFavoriteColor() {
    if (favoriteThemes.contains(backgroundColor)) {
      favoriteThemes.remove(backgroundColor);
    } else {
      favoriteThemes.add(backgroundColor);
    }
    notifyListeners();
  }

  void changeBackgroundColor() {
    backgroundColor = [
      Random().nextInt(256),
      Random().nextInt(256),
      Random().nextInt(256),
      Random().nextInt(256),
    ];
    print(backgroundColor);
    notifyListeners();
  }

  void setState(Null Function() param0) {}
}
