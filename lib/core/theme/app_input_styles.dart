import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_radius.dart';
import 'app_text_styles.dart';
import 'app_spacing.dart';

/// Reusable Input Decorations for Forms and TextFields.
class AppInputStyles {
  AppInputStyles._();

  static InputDecorationTheme getInputDecorationTheme({required bool isDark}) {
    final Color borderColor = isDark ? AppColors.borderDark : AppColors.borderLight;
    final Color fillColor = isDark ? AppColors.surfaceDark : AppColors.grey50;
    final Color textColor = isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight;
    final Color hintColor = isDark ? AppColors.textDisabledDark : AppColors.textDisabledLight;

    return InputDecorationTheme(
      filled: true,
      fillColor: fillColor,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.md,
      ),
      hintStyle: AppTextStyles.bodyMedium.copyWith(color: hintColor),
      labelStyle: AppTextStyles.bodyMedium.copyWith(color: textColor),
      floatingLabelStyle: AppTextStyles.labelMedium.copyWith(color: AppColors.primary),
      errorStyle: AppTextStyles.bodySmall.copyWith(color: AppColors.error),
      
      // Default Border
      border: OutlineInputBorder(
        borderRadius: AppRadius.borderRadiusMD,
        borderSide: BorderSide(color: borderColor),
      ),
      
      // Enabled Border
      enabledBorder: OutlineInputBorder(
        borderRadius: AppRadius.borderRadiusMD,
        borderSide: BorderSide(color: borderColor),
      ),
      
      // Focused Border
      focusedBorder: const OutlineInputBorder(
        borderRadius: AppRadius.borderRadiusMD,
        borderSide: BorderSide(color: AppColors.primary, width: 2.0),
      ),
      
      // Error Border
      errorBorder: const OutlineInputBorder(
        borderRadius: AppRadius.borderRadiusMD,
        borderSide: BorderSide(color: AppColors.error),
      ),
      
      // Focused Error Border
      focusedErrorBorder: const OutlineInputBorder(
        borderRadius: AppRadius.borderRadiusMD,
        borderSide: BorderSide(color: AppColors.error, width: 2.0),
      ),
    );
  }
  
  // For specialized inputs like search bars
  static InputDecoration searchDecoration({required bool isDark, String hintText = "Search..."}) {
    final Color fillColor = isDark ? AppColors.grey800 : AppColors.grey100;
    final Color hintColor = isDark ? AppColors.textDisabledDark : AppColors.textDisabledLight;
    
    return InputDecoration(
      hintText: hintText,
      hintStyle: AppTextStyles.bodyMedium.copyWith(color: hintColor),
      prefixIcon: Icon(Icons.search, color: hintColor),
      filled: true,
      fillColor: fillColor,
      contentPadding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.sm),
      border: const OutlineInputBorder(
        borderRadius: AppRadius.borderRadiusCircular,
        borderSide: BorderSide.none,
      ),
      enabledBorder: const OutlineInputBorder(
        borderRadius: AppRadius.borderRadiusCircular,
        borderSide: BorderSide.none,
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: AppRadius.borderRadiusCircular,
        borderSide: BorderSide(color: AppColors.primary),
      ),
    );
  }
}
