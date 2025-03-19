import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xFFE7D1F3),
    primaryColor: Colors.deepPurple,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF9429E6),
      foregroundColor: Colors.black,
    ),
    colorScheme: const ColorScheme.light(
      primary: Colors.purple,
      secondary: Color(0xFF731FB3),
    ),
    textTheme: GoogleFonts.comicNeueTextTheme(
      const TextTheme(
        bodyMedium: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    iconButtonTheme: const IconButtonThemeData(
      style: ButtonStyle(iconColor: WidgetStatePropertyAll(Colors.black)),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF1E1E1E),
    primaryColor: Colors.purple.shade700,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF9673D2),
      foregroundColor: Colors.white,
    ),
    colorScheme: ColorScheme.dark(
      primary: Colors.purple.shade600,
      secondary: const Color(0xFFC2A8E8),
    ),
    textTheme: GoogleFonts.comicNeueTextTheme(
      const TextTheme(
        bodyMedium: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    iconButtonTheme: const IconButtonThemeData(
      style: ButtonStyle(iconColor: WidgetStatePropertyAll(Colors.white)),
    ),
  );
}
