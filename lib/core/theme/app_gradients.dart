import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Reusable gradient definitions.
class AppGradients {
  AppGradients._();

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [AppColors.primary, AppColors.primaryLight],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient primaryGradientDark = LinearGradient(
    colors: [AppColors.primaryDark, AppColors.primary],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient darkOverlay = LinearGradient(
    colors: [Colors.transparent, Colors.black87],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  
  static const LinearGradient skeletonLight = LinearGradient(
    colors: [AppColors.grey200, AppColors.grey100, AppColors.grey200],
    stops: [0.0, 0.5, 1.0],
    begin: Alignment(-1.0, -0.5),
    end: Alignment(1.0, 0.5),
  );
}
