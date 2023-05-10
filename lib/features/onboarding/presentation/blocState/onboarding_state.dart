part of 'onboarding_bloc.dart';


@immutable
abstract class OnboardingState {}

class Loading extends OnboardingState {}

class Loaded extends OnboardingState {
  final List<Onboarding> onboard;
  Loaded({required this.onboard});
}

class Error extends OnboardingState{
  final String error;
  Error({required this.error});
}