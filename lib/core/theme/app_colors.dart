import 'package:flutter/material.dart';

/// Centralized color system for JaXmart application.
/// Inspired by modern enterprise B2B marketplaces (Stripe, Linear, Alibaba).
class AppColors {
  AppColors._();

  // Primary Theme Colors (Orange base)
  static const Color primary = Color(0xFFFF6D00); // Vibrant B2B Orange
  static const Color primaryLight = Color(0xFFFF9E40);
  static const Color primaryDark = Color(0xFFC45300);
  static const Color primaryBackground = Color(0xFFFFF7ED); // Very light orange background

  // Secondary/Accent Colors
  static const Color secondary = Color(0xFF1E293B); // Slate 800 - Professional Dark
  static const Color secondaryLight = Color(0xFF334155);
  static const Color secondaryDark = Color(0xFF0F172A);

  // Semantic Colors
  static const Color success = Color(0xFF10B981); // Emerald 500
  static const Color successBackground = Color(0xFFD1FAE5);
  
  static const Color warning = Color(0xFFF59E0B); // Amber 500
  static const Color warningBackground = Color(0xFFFEF3C7);
  
  static const Color error = Color(0xFFEF4444); // Red 500
  static const Color errorBackground = Color(0xFFFEE2E2);
  
  static const Color info = Color(0xFF3B82F6); // Blue 500
  static const Color infoBackground = Color(0xFFDBEAFE);

  // Neutrals / Grays (Linear/Stripe inspired grays)
  static const Color grey50 = Color(0xFFF8FAFC);
  static const Color grey100 = Color(0xFFF1F5F9);
  static const Color grey200 = Color(0xFFE2E8F0);
  static const Color grey300 = Color(0xFFCBD5E1);
  static const Color grey400 = Color(0xFF94A3B8);
  static const Color grey500 = Color(0xFF64748B);
  static const Color grey600 = Color(0xFF475569);
  static const Color grey700 = Color(0xFF334155);
  static const Color grey800 = Color(0xFF1E293B);
  static const Color grey900 = Color(0xFF0F172A);

  // Background Colors
  static const Color backgroundLight = Color(0xFFFFFFFF);
  static const Color surfaceLight = Color(0xFFF8FAFC);
  static const Color backgroundDark = Color(0xFF0F172A);
  static const Color surfaceDark = Color(0xFF1E293B);

  // Text Colors
  static const Color textPrimaryLight = grey900;
  static const Color textSecondaryLight = grey600;
  static const Color textDisabledLight = grey400;
  
  static const Color textPrimaryDark = grey50;
  static const Color textSecondaryDark = grey400;
  static const Color textDisabledDark = grey600;

  // Borders & Dividers
  static const Color borderLight = grey200;
  static const Color borderDark = grey700;

  // Overlays
  static const Color overlayLight = Color(0x33000000); // 20% black
  static const Color overlayDark = Color(0x66000000); // 40% black
}
