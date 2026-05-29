import 'package:flutter/material.dart';
import 'features/onboarding/presentation/pages/onboarding_screen.dart';

void main() {
  runApp(const JaXmartApp());
}

class JaXmartApp extends StatelessWidget {
  const JaXmartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JaXmart',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFB45309), // Primary Orange
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      home: const OnboardingScreen(),
    );
  }
}
