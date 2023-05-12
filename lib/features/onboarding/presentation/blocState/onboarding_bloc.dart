import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:veterinaria_app/features/onboarding/domain/entities/onboarding.dart';
import 'package:veterinaria_app/features/onboarding/domain/usecase/get_post_usecase.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final GetOnboardingUseCase getOnboardingUsecase;
  final ChangePageUseCase changeOnboardingUsecase;
  OnboardingBloc(this.changeOnboardingUsecase, {required this.getOnboardingUsecase}) : super(Loading()) {
    on<OnboardingEvent>((event, emit) async {
      if (event is GetOnboarding) {
        try {
          List<Onboarding> response = await getOnboardingUsecase.execute();
          emit(Loaded(onboard: response, infoLength: response.length));
        } catch (e) {
          emit(Error(error: e.toString()));
        }
      }
      if (event is Change) {
       // List<Onboarding> response = await changeOnboardingUsecase.execute();
      }
    });
  }
}
