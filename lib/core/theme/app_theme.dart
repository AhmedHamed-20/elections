import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';
import '../constants/app_font_size.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    colorScheme: const ColorScheme.light(
      secondary: AppColors.primaryColor,
      primary: AppColors.primaryColor,
      background: AppColors.lightBackgroundColor,
    ),
    splashColor: AppColors.primaryColor,
    primaryColor: AppColors.primaryColor,
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.transparent,
      modalBackgroundColor: Colors.transparent,
    ),
    textTheme: TextTheme(
      titleMedium: GoogleFonts.firaCode(
        fontSize: AppFontSize.s18,
        color: AppColors.lightTitleTextColor,
      ),
      titleLarge: GoogleFonts.firaCode(
        color: AppColors.lightTitleTextColor,
        fontSize: AppFontSize.s22,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: GoogleFonts.firaCode(
        color: AppColors.lightTitleTextColor,
        fontSize: AppFontSize.s16,
      ),
      labelSmall: GoogleFonts.firaCode(
        color: AppColors.lightTitleTextColor,
        fontSize: AppFontSize.s14,
      ),
    ),
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
    useMaterial3: true,
  );
  static ThemeData dark = ThemeData(
    colorScheme: const ColorScheme.dark(
      secondary: AppColors.primaryColor,
      primary: AppColors.primaryColor,
      background: AppColors.darkBackgroundColor,
    ),
    primaryColor: AppColors.primaryColor,
    splashColor: AppColors.primaryColor,
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.transparent,
      modalBackgroundColor: Colors.transparent,
    ),
    textTheme: TextTheme(
      titleMedium: GoogleFonts.firaCode(
        fontSize: AppFontSize.s18,
        color: AppColors.darkTitleTextColor,
      ),
      titleLarge: GoogleFonts.firaCode(
        color: AppColors.darkTitleTextColor,
        fontSize: AppFontSize.s22,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: GoogleFonts.firaCode(
        color: AppColors.darkTitleTextColor,
        fontSize: AppFontSize.s16,
      ),
      labelSmall: GoogleFonts.firaCode(
        color: AppColors.darkTitleTextColor,
        fontSize: AppFontSize.s14,
      ),
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    useMaterial3: true,
  );
}
