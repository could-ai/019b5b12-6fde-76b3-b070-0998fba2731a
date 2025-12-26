import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF2563EB), // Tech Blue
      brightness: Brightness.light,
      primary: const Color(0xFF2563EB),
      secondary: const Color(0xFF0F172A), // Slate 900
      surface: const Color(0xFFF8FAFC), // Slate 50
      background: const Color(0xFFF1F5F9), // Slate 100
    ),
    textTheme: GoogleFonts.interTextTheme(),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF3B82F6), // Blue 500
      brightness: Brightness.dark,
      primary: const Color(0xFF3B82F6),
      secondary: const Color(0xFF64748B), // Slate 500
      surface: const Color(0xFF1E293B), // Slate 800
      background: const Color(0xFF0F172A), // Slate 900
    ),
    textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
    ),
    scaffoldBackgroundColor: const Color(0xFF0F172A),
  );
}
