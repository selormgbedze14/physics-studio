// lib/theme.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color bg = Color(0xFF06080F);
  static const Color surface = Color(0xFF0D1117);
  static const Color surface2 = Color(0xFF161B22);
  static const Color surface3 = Color(0xFF21262D);
  static const Color border = Color(0xFF30363D);
  static const Color accent = Color(0xFF58A6FF);
  static const Color accentGlow = Color(0xFF1F6FEB);
  static const Color textPrimary = Color(0xFFE6EDF3);
  static const Color textSecondary = Color(0xFF8B949E);
  static const Color textMuted = Color(0xFF484F58);
  static const Color green = Color(0xFF3FB950);
  static const Color orange = Color(0xFFD29922);
  static const Color red = Color(0xFFF85149);
  static const Color purple = Color(0xFFBC8CFF);

  // Chapter colors
  static const List<Color> chapterColors = [
    Color(0xFF58A6FF), // blue
    Color(0xFF3FB950), // green
    Color(0xFFBC8CFF), // purple
    Color(0xFFFF7B72), // red
    Color(0xFFF78166), // orange-red
    Color(0xFFD29922), // gold
    Color(0xFF39D353), // bright green
    Color(0xFF58A6FF), // blue
    Color(0xFF79C0FF), // light blue
    Color(0xFFD2A8FF), // light purple
  ];

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: bg,
      colorScheme: const ColorScheme.dark(
        background: bg,
        surface: surface,
        primary: accent,
        secondary: green,
        error: red,
        onBackground: textPrimary,
        onSurface: textPrimary,
        onPrimary: bg,
      ),
      textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme).copyWith(
        displayLarge: GoogleFonts.inter(
          color: textPrimary,
          fontSize: 32,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.5,
        ),
        displayMedium: GoogleFonts.inter(
          color: textPrimary,
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
        headlineMedium: GoogleFonts.inter(
          color: textPrimary,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        titleLarge: GoogleFonts.inter(
          color: textPrimary,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        bodyLarge: GoogleFonts.inter(
          color: textPrimary,
          fontSize: 15,
          height: 1.6,
        ),
        bodyMedium: GoogleFonts.inter(
          color: textSecondary,
          fontSize: 13,
          height: 1.5,
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: surface,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          color: textPrimary,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        iconTheme: IconThemeData(color: textSecondary),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: surface,
        indicatorColor: accentGlow.withOpacity(0.3),
        labelTextStyle: MaterialStateProperty.all(
          const TextStyle(color: textSecondary, fontSize: 11),
        ),
      ),
      cardTheme: CardTheme(
        color: surface2,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: border, width: 1),
        ),
      ),
      dividerColor: border,
      dividerTheme: const DividerThemeData(color: border, thickness: 1),
    );
  }
}
