import 'package:veterinaria_app/features/onboarding/domain/repositories/onboarding_repository.dart';
import 'package:veterinaria_app/features/onboarding/domain/entities/onboarding.dart';

class GetOnboardingUseCase {
  final OnboardingRepository onboardingRepository;
  GetOnboardingUseCase(this.onboardingRepository);
  Future<List<Onboarding>> execute() async {
    return await onboardingRepository.getOnboarding();
  }
}
