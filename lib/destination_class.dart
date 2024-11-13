import 'package:flutter/material.dart';

class Destination {
  const Destination(this.label, this.icon, this.selectedIcon, this.tooltip)

  final String label;
  final Widget icon;
  final Widget selectedIcon;
  final String tooltip;
}
const List<Destination> destinations = <Destination>[
  Destination('Words Generator', Icon(Icons.widgets_outlined), Icon(Icons.widgets), 'Generates a pair of random words.'),
  Destination('Favorite Words', Icon(Icons.favorite_border), Icon(Icons.favorite), 'Wordpairs you liked are saved here'),
  Destination('Change Color Theme', Icon(Icons.palette_outlined), Icon(Icons.palette), 'Generate a random color theme for this app'),
  Destination('Favorite Colors', Icon(Icons.panorama_outlined), Icon(Icons.panorama), 'Color Themes you liked are saved here'),
];