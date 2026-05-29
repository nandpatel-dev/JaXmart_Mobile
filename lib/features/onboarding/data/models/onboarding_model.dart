import '../../domain/entities/onboarding_entity.dart';

class OnboardingModel extends OnboardingEntity {
  const OnboardingModel({
    required super.title,
    required super.subtitle,
    required super.icon,
  });

  factory OnboardingModel.fromJson(Map<String, dynamic> json) {
    return OnboardingModel(
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      icon: json['icon'], // IconData might not be straightforward to parse from JSON, but handled here dynamically if needed
    );
  }
}
