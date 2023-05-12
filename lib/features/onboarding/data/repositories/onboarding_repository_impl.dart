import 'package:veterinaria_app/features/onboarding/domain/repositories/onboarding_repository.dart';
import 'package:veterinaria_app/features/onboarding/domain/entities/onboarding.dart';
import 'package:veterinaria_app/features/onboarding/data/datasource/onboarding_remote_source.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  final OnboardingRemoteDataSource onboardingRemoteDataSource;

  OnboardingRepositoryImpl({required this.onboardingRemoteDataSource});

  @override
  Future<List<Onboarding>> getOnboarding() async {
    
    return await onboardingRemoteDataSource.getOnboarding();
  }
}
