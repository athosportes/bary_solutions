import 'package:flutter/material.dart';
import '../constants/constants.dart' as colors;
final ThemeData customTheme = _customTheme();

ThemeData _customTheme() {
  return ThemeData(
    primaryColor: colors.primaryColor,
    fontFamily: 'Nunito',
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: colors.primaryColor,
    ),
  );
}
