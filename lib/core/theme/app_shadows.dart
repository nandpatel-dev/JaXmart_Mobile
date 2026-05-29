import 'package:flutter/material.dart';

/// Global soft shadow system (Stripe/Linear inspired).
class AppShadows {
  AppShadows._();

  // Light Theme Shadows
  static const List<BoxShadow> lightSm = [
    BoxShadow(
      color: Color(0x0A000000), // 4% opacity
      offset: Offset(0, 1),
      blurRadius: 2,
    ),
  ];

  static const List<BoxShadow> lightMd = [
    BoxShadow(
      color: Color(0x0F000000), // 6% opacity
      offset: Offset(0, 4),
      blurRadius: 6,
      spreadRadius: -1,
    ),
    BoxShadow(
      color: Color(0x0A000000),
      offset: Offset(0, 2),
      blurRadius: 4,
      spreadRadius: -1,
    ),
  ];

  static const List<BoxShadow> lightLg = [
    BoxShadow(
      color: Color(0x14000000), // 8% opacity
      offset: Offset(0, 10),
      blurRadius: 15,
      spreadRadius: -3,
    ),
    BoxShadow(
      color: Color(0x0A000000),
      offset: Offset(0, 4),
      blurRadius: 6,
      spreadRadius: -2,
    ),
  ];

  // Dark Theme Shadows
  static const List<BoxShadow> darkSm = [
    BoxShadow(
      color: Color(0x33000000), // 20% opacity
      offset: Offset(0, 1),
      blurRadius: 3,
    ),
  ];

  static const List<BoxShadow> darkMd = [
    BoxShadow(
      color: Color(0x40000000),
      offset: Offset(0, 4),
      blurRadius: 8,
      spreadRadius: -1,
    ),
  ];
  
  static const List<BoxShadow> darkLg = [
    BoxShadow(
      color: Color(0x59000000),
      offset: Offset(0, 10),
      blurRadius: 15,
      spreadRadius: -3,
    ),
  ];

  // Helper method to get correct shadow based on theme
  static List<BoxShadow> getShadow(BuildContext context, {bool isLarge = false, bool isSmall = false}) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    
    if (isLarge) {
      return isDark ? darkLg : lightLg;
    } else if (isSmall) {
      return isDark ? darkSm : lightSm;
    }
    return isDark ? darkMd : lightMd;
  }
}
