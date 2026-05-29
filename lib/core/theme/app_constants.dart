/// Global configuration constants for UI features (e.g., animation durations, opacities).
class AppConstants {
  AppConstants._();

  // Animation Durations
  static const Duration animationFast = Duration(milliseconds: 150);
  static const Duration animationStandard = Duration(milliseconds: 300);
  static const Duration animationSlow = Duration(milliseconds: 500);

  // Opacities
  static const double disabledOpacity = 0.5;
  static const double overlayOpacity = 0.4;
  
  // Others
  static const int maxLinesStandard = 2;
  static const int maxLinesLarge = 4;
}
