import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'config.dart';

class AppTheme {
  static ThemeData defaultTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.white,
      textTheme: TextTheme(
        titleLarge: GoogleFonts.pacifico(
            fontWeight: FontWeight.w700, fontSize: 24, height: 36),
        titleMedium: GoogleFonts.poppins(
            fontWeight: FontWeight.w600, fontSize: 24),
        titleSmall: GoogleFonts.poppins(
            fontWeight: FontWeight.w600, fontSize: 16),
        bodyLarge: GoogleFonts.dmSans(
            fontSize: 32, fontWeight: FontWeight.w500),
        bodyMedium: GoogleFonts.poppins(
            fontSize: 14, fontWeight: FontWeight.w500),
        bodySmall: GoogleFonts.poppins(
            fontSize: 12, fontWeight: FontWeight.w400),
      ));
}