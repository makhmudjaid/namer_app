import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

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
