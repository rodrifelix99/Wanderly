import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTheme {
  static TextTheme get _textTheme => GoogleFonts.poppinsTextTheme();

  static ThemeData _fromColorScheme(Color colorSchemeSeed) {
    return ThemeData(
      colorSchemeSeed: colorSchemeSeed,
      appBarTheme: const AppBarTheme(
        centerTitle: false,
      ),
      textTheme: _textTheme,
    );
  }

  static ThemeData get lightTheme => _fromColorScheme(Colors.orange);

  static ThemeData get darkTheme => _fromColorScheme(Colors.deepOrange);
}