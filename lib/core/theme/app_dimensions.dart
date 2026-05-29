import 'package:flutter/material.dart';

/// Responsive dimension structure for global use.
class AppDimensions {
  AppDimensions._();

  // Screen breakpoints
  static const double mobileBreakPoint = 600.0;
  static const double tabletBreakPoint = 1024.0;
  static const double desktopBreakPoint = 1440.0;

  // Maximum width for content
  static const double maxContentWidth = 1200.0;

  // Standard component heights
  static const double buttonHeightSm = 32.0;
  static const double buttonHeightMd = 48.0; // Touch-friendly standard
  static const double buttonHeightLg = 56.0;
  
  static const double inputHeight = 48.0;
  static const double appBarHeight = 64.0;
  static const double bottomNavBarHeight = 72.0;

  // Icon sizes
  static const double iconSm = 16.0;
  static const double iconMd = 24.0;
  static const double iconLg = 32.0;
  static const double iconXl = 48.0;

  // Avatar sizes
  static const double avatarSm = 32.0;
  static const double avatarMd = 48.0;
  static const double avatarLg = 64.0;
  static const double avatarXl = 96.0;
  
  // Helper for responsive logic
  static bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < mobileBreakPoint;
  static bool isTablet(BuildContext context) => MediaQuery.of(context).size.width >= mobileBreakPoint && MediaQuery.of(context).size.width < tabletBreakPoint;
  static bool isDesktop(BuildContext context) => MediaQuery.of(context).size.width >= tabletBreakPoint;
}
