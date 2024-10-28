import 'package:flutter/material.dart';

class TextBasedOnTheme extends StatelessWidget {
  const TextBasedOnTheme({
    super.key,
    required this.text,
    this.isBoldFont, required this.textTheme,
  });

  final String text;
  final bool? isBoldFont;
  final TextStyle textTheme;

  @override
  Widget build(BuildContext context) {
    Color color = Colors.black;
    return Text(
      text,
      style: textTheme.copyWith(
            color: color,
            fontWeight:
                isBoldFont == true ? FontWeight.bold : FontWeight.normal,
          ),
    );
  }
}
