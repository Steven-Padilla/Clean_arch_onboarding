import 'package:veterinaria_app/features/onboarding/domain/entities/onboarding.dart';

abstract class OnboardingRepository {
  Future<List<Onboarding>> getOnboarding();
}
