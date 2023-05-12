import 'dart:async';

import 'package:veterinaria_app/features/onboarding/data/models/onboarding_model.dart';

List<OnboardingModel> contents = [
  OnboardingModel(
      image: "assets/images/B1.png",
      title: "ESPARCIMIENTO",
      description:
          "Brindamos todos los servicios para consentir a tu mascota."),
  OnboardingModel(
      image: "assets/images/B2.png",
      title: "ADOPCION",
      description:
          "Nulla faucibus ut odio scelerisque, vitae molestie lectus feugiat."),
  OnboardingModel(
      image: "assets/images/B3.png",
      title: "Hospitalidad",
      description:
          "Nulla faucibus tellus ut odio scelerisque, vitar lectus feugiat."),
  OnboardingModel(
      image: "assets/images/B4.png",
      title: "VETERINARIA",
      description:
          "Nulla faucibus ut odio scelerisque, vitae molestie lectus feugiat."),
  OnboardingModel(
      image: "assets/images/B5.png",
      title: "TIENDA",
      description:
          "Nulla faucibus ut odio scelerisque, vitae molestie lectus feugiat.")
];

abstract class OnboardingRemoteDataSource {
  Future<List<OnboardingModel>> getOnboarding();
}

class OnboardingRemoteDataSourceImpl extends OnboardingRemoteDataSource {
  @override
  Future<List<OnboardingModel>> getOnboarding() async {
    return contents
        .map<OnboardingModel>((data) => OnboardingModel.fromEntity(data))
        .toList();
  }
}
