import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTheme {
  static TextTheme get _textTheme => GoogleFonts.interTextTheme().copyWith(
    displayLarge: GoogleFonts.inter(
      fontSize: 96,
      fontWeight: FontWeight.w900,
      letterSpacing: -1.5,
    ),
    displayMedium: GoogleFonts.inter(
      fontSize: 60,
      fontWeight: FontWeight.w900,
      letterSpacing: -0.5,
    ),
    displaySmall: GoogleFonts.inter(
      fontSize: 48,
      fontWeight: FontWeight.w900,
    ),
    headlineMedium: GoogleFonts.inter(
      fontSize: 34,
      fontWeight: FontWeight.w900,
      letterSpacing: 0.25,
    ),
    headlineSmall: GoogleFonts.inter(
      fontSize: 24,
      fontWeight: FontWeight.w700,
    ),
    titleLarge: GoogleFonts.inter(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      letterSpacing: 0.15,
    ),
    titleMedium: GoogleFonts.inter(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.15,
    ),
    titleSmall: GoogleFonts.inter(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
    ),
    bodyLarge: GoogleFonts.inter(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
    ),
    bodyMedium: GoogleFonts.inter(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
    ),
    labelLarge: GoogleFonts.inter(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.25,
    ),
    bodySmall: GoogleFonts.inter(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4,
    ),
    labelSmall: GoogleFonts.inter(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      letterSpacing: 1.5,
    ),
  );

  static ThemeData _fromColorScheme(bool isDarkTheme) {
    return ThemeData(
      primaryColor: Colors.orange,
      colorScheme: ColorScheme(
        primary: Colors.orange,
        secondary: Colors.orange,
        surface: isDarkTheme ? Colors.grey[900]! : Colors.white,
        error: Colors.red,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: isDarkTheme ? Colors.white : Colors.black,
        onError: Colors.white,
        brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      ),
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      appBarTheme: const AppBarTheme(
        centerTitle: false,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(Colors.orange),
          foregroundColor: WidgetStateProperty.all(Colors.white),
          elevation: WidgetStateProperty.all(0.0),
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(
              vertical: 16.0,
              horizontal: 32.0,
            ),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.all(isDarkTheme ? Colors.orange : Colors.black87),
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(
              vertical: 16.0,
              horizontal: 32.0,
            ),
          ),
        ),
      ),
      textTheme: _textTheme,
    );
  }

  static ThemeData get lightTheme => _fromColorScheme(false);

  static ThemeData get darkTheme => _fromColorScheme(true);
}