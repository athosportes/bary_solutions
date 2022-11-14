import 'package:flutter/material.dart';

final ThemeData customTheme = _customTheme();

ThemeData _customTheme() {
  final ThemeData base = ThemeData();
  final TextTheme textTheme = TextTheme();

  return base.copyWith(
      colorScheme: base.colorScheme.copyWith(primary: Color(0xFFEF7F1A)),
    textTheme: TextTheme()      
      );
      
}
