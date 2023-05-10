import 'package:veterinaria_app/features/onboarding/data/datasource/onboarding_remote_source.dart';
import 'package:veterinaria_app/features/onboarding/data/repositories/onboarding_repository_impl.dart';
import 'package:veterinaria_app/features/onboarding/domain/usecase/get_post_usecase.dart';

class UsecaseConfig {
  GetOnboardingUseCase? getOnboardingUseCase;
 OnboardingRepositoryImpl?onboardingRepositoryImpl;
 OnboardingRemoteDataSourceImpl? onboardingRemoteDataSourceImpl;

  UsecaseConfig() {
   onboardingRemoteDataSourceImpl =OnboardingRemoteDataSourceImpl();
   onboardingRepositoryImpl =OnboardingRepositoryImpl(onboardingRemoteDataSource:onboardingRemoteDataSourceImpl!);
    getOnboardingUseCase = GetOnboardingUseCase(onboardingRepositoryImpl!);
  }
}