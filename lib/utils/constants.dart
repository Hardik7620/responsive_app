import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  // Primary colors
  static const Color primary = Color(0xFFFFA800);
  static const Color background = Color(0xFF20202C);
  static const Color inputBackground = Color(0xFF20202C);
  static const Color borderColor = Color(0xFF464660);

  // Text colors
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Color(0X66FFFFFF);

  // Status colors
  static const Color error = Colors.red;
  static const Color success = Colors.green;
}



class AppTextStyles {
  static TextStyle get _baseOutfit => GoogleFonts.outfit(
    color: AppColors.textPrimary,
  );

  // Mobile text styles
  static TextStyle titleMobile = _baseOutfit.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static TextStyle bodyMobile = _baseOutfit.copyWith(
    fontSize: 14,
  );

  static TextStyle labelMobile = _baseOutfit.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  static TextStyle subtitleMobile = _baseOutfit.copyWith(
    fontSize: 12,
    color: AppColors.textSecondary,
  );

  // Desktop text styles
  static TextStyle titleDesktop = _baseOutfit.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static TextStyle bodyDesktop = _baseOutfit.copyWith(
    fontSize: 16,
  );

  static TextStyle labelDesktop = _baseOutfit.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static TextStyle subtitleDesktop = _baseOutfit.copyWith(
    fontSize: 14,
    color: AppColors.textSecondary,
  );

  // Input text styles
  static TextStyle inputTextMobile = _baseOutfit.copyWith(
    fontSize: 14,
  );

  static TextStyle inputTextDesktop = _baseOutfit.copyWith(
    fontSize: 16,
  );

  static TextStyle inputHintMobile = _baseOutfit.copyWith(
    fontSize: 14,
    color: AppColors.textSecondary,
  );

  static TextStyle inputHintDesktop = _baseOutfit.copyWith(
    fontSize: 16,
    color: AppColors.textSecondary,
  );

  // Button text styles
  static TextStyle buttonTextMobile = _baseOutfit.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static TextStyle buttonTextDesktop = _baseOutfit.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  // Home screen styles
  static TextStyle homeTitle = _baseOutfit.copyWith(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static TextStyle homeSubtitle = _baseOutfit.copyWith(
    fontSize: 16,
    color: Colors.white70,
  );
}
class AppImages {
  static const String logoImage = 'assets/images/aerial.png';
  static const String antennaImage = 'assets/images/antena.png';
}