import 'package:flutter/material.dart';
import '../../domain/entities/onboarding_entity.dart';

class OnboardingController extends ChangeNotifier {
  int _currentIndex = 0;
  final PageController pageController = PageController();

  int get currentIndex => _currentIndex;

  final List<OnboardingEntity> features = const [
    OnboardingEntity(
      icon: Icons.verified_user_outlined,
      title: "Verified Suppliers",
      subtitle: "Rigorous vetting for quality assurance.",
    ),
    OnboardingEntity(
      icon: Icons.public,
      title: "Global Procurement",
      subtitle: "Source from 120+ regions seamlessly.",
    ),
    OnboardingEntity(
      icon: Icons.inventory_2_outlined,
      title: "Bulk Operations",
      subtitle: "Manage large-scale orders with ease.",
    ),
  ];

  void onPageChanged(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void nextPage() {
    if (_currentIndex < features.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void previousPage() {
    if (_currentIndex > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
