import 'package:flutter/material.dart';

/// Global Border Radius system for rounded modern UI.
class AppRadius {
  AppRadius._();

  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 12.0; // Standard cards & buttons
  static const double lg = 16.0; // Large cards, bottom sheets
  static const double xl = 24.0;
  static const double xxl = 32.0;
  static const double circular = 999.0;

  // BorderRadius instances
  static const BorderRadius borderRadiusXS = BorderRadius.all(Radius.circular(xs));
  static const BorderRadius borderRadiusSM = BorderRadius.all(Radius.circular(sm));
  static const BorderRadius borderRadiusMD = BorderRadius.all(Radius.circular(md));
  static const BorderRadius borderRadiusLG = BorderRadius.all(Radius.circular(lg));
  static const BorderRadius borderRadiusXL = BorderRadius.all(Radius.circular(xl));
  static const BorderRadius borderRadiusCircular = BorderRadius.all(Radius.circular(circular));

  static const BorderRadius topLG = BorderRadius.vertical(top: Radius.circular(lg));
  static const BorderRadius bottomLG = BorderRadius.vertical(bottom: Radius.circular(lg));
}
