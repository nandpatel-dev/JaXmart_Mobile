import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_radius.dart';
import 'app_text_styles.dart';
import 'app_spacing.dart';
import 'app_dimensions.dart';

/// Centralized reusable button styling.
class AppButtonStyles {
  AppButtonStyles._();

  static ButtonStyle primary({bool isDark = false}) {
    return ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
      elevation: 0,
      minimumSize: const Size(88, AppDimensions.buttonHeightMd),
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.md,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: AppRadius.borderRadiusMD,
      ),
      textStyle: AppTextStyles.labelLarge,
    ).copyWith(
      overlayColor: WidgetStateProperty.resolveWith(
        (states) => states.contains(WidgetState.pressed) 
            ? AppColors.primaryDark 
            : null,
      ),
    );
  }

  static ButtonStyle secondary({bool isDark = false}) {
    return OutlinedButton.styleFrom(
      foregroundColor: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
      minimumSize: const Size(88, AppDimensions.buttonHeightMd),
      side: BorderSide(
        color: isDark ? AppColors.borderDark : AppColors.borderLight,
        width: 1.5,
      ),
      elevation: 0,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.md,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: AppRadius.borderRadiusMD,
      ),
      textStyle: AppTextStyles.labelLarge,
    ).copyWith(
      backgroundColor: WidgetStateProperty.resolveWith(
        (states) => states.contains(WidgetState.pressed)
            ? (isDark ? AppColors.grey800 : AppColors.grey50)
            : Colors.transparent,
      ),
    );
  }

  static ButtonStyle text({bool isDark = false}) {
    return TextButton.styleFrom(
      foregroundColor: AppColors.primary,
      minimumSize: const Size(88, AppDimensions.buttonHeightMd),
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: AppRadius.borderRadiusMD,
      ),
      textStyle: AppTextStyles.labelLarge,
    );
  }
}
