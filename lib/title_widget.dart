import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.bodyMedium!.copyWith(
      color: theme.colorScheme.onSecondary,
    );
    return Card(
      margin: EdgeInsets.all(10),
      color: theme.colorScheme.secondary,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          'Your random word',
          style: style,
        ),
      ),
    );
  }
}
