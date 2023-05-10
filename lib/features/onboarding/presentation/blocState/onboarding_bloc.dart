import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:veterinaria_app/features/onboarding/domain/entities/onboarding.dart';
import 'package:veterinaria_app/features/onboarding/domain/usecase/get_post_usecase.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final GetOnboardingUseCase onboardingUsecase;
  OnboardingBloc({required this.onboardingUsecase}) : super(Loading()) {
    on<OnboardingEvent>((event, emit) async {
      if (event is GetOnboarding) {
        try {
          List<Onboarding> response = await onboardingUsecase.execute();
          emit(Loaded(onboard: response));
        } catch (e) {
          emit(Error(error: e.toString()));
        }
      }
    });
  }
}
//lo voy a subir a git, ahorita lo descragan 
