import 'package:flutter/material.dart';

class TextBasedOnTheme extends StatelessWidget {
  const TextBasedOnTheme({
    super.key,
    required this.text,
    this.isBoldFont,
  });

  final String text;
  final bool? isBoldFont;

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    Color color = isDarkTheme ? Colors.white : Colors.black;
    return Text(
      text,
      style: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: color,
            fontWeight:
                isBoldFont == true ? FontWeight.bold : FontWeight.normal,
          ),
    );
  }
}
