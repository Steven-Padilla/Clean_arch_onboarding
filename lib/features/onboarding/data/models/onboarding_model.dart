import 'package:veterinaria_app/features/onboarding/domain/entities/onboarding.dart';

class OnboardingModel extends Onboarding {
  OnboardingModel({
    required String title,
    required String image,
    required String description,
  }) : super(title: title, image: image, description: description);

  factory OnboardingModel.fromJson(Map<String, dynamic> json) {
    return OnboardingModel(
        title: json['title'],
        image: json['image'],
        description: json['description']);
  }

  factory OnboardingModel.fromEntity(Onboarding onboarding) {
    return OnboardingModel(
        description: onboarding.description,
        title: onboarding.title,
        image: onboarding.image);
  }
}
