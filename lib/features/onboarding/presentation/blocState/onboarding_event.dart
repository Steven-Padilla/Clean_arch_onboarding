part of 'onboarding_bloc.dart';


@immutable
abstract class OnboardingEvent {}

class GetOnboarding extends OnboardingEvent{}

class LoadedChange extends OnboardingEvent{}

class ChangePage extends OnboardingEvent{}