import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_radius.dart';
import 'app_shadows.dart';

/// Card decoration system and general container decorations.
class AppDecoration {
  AppDecoration._();

  // Primary Card Decoration (Soft shadows, rounded corners)
  static BoxDecoration card({required bool isDark}) {
    return BoxDecoration(
      color: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
      borderRadius: AppRadius.borderRadiusMD,
      boxShadow: isDark ? AppShadows.darkMd : AppShadows.lightMd,
      border: Border.all(
        color: isDark ? AppColors.borderDark : AppColors.borderLight,
        width: 1.0,
      ),
    );
  }

  // Elevated Card (For modals, dialogs, popups)
  static BoxDecoration elevatedCard({required bool isDark}) {
    return BoxDecoration(
      color: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
      borderRadius: AppRadius.borderRadiusLG,
      boxShadow: isDark ? AppShadows.darkLg : AppShadows.lightLg,
    );
  }

  // Outlined Container (No shadow)
  static BoxDecoration outlined({required bool isDark}) {
    return BoxDecoration(
      color: Colors.transparent,
      borderRadius: AppRadius.borderRadiusMD,
      border: Border.all(
        color: isDark ? AppColors.borderDark : AppColors.borderLight,
        width: 1.0,
      ),
    );
  }

  // Highlighted Container (e.g., Selected item)
  static BoxDecoration selected({required bool isDark}) {
    return BoxDecoration(
      color: isDark ? AppColors.primaryDark.withValues(alpha: 0.2) : AppColors.primaryLight.withValues(alpha: 0.1),
      borderRadius: AppRadius.borderRadiusMD,
      border: Border.all(
        color: AppColors.primary,
        width: 1.5,
      ),
    );
  }
}
