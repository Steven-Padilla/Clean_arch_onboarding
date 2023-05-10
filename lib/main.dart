import 'package:flutter/material.dart';
import 'package:veterinaria_app/features/onboarding/presentation/blocState/onboarding_bloc.dart';
import 'package:veterinaria_app/features/onboarding/presentation/pages/components/on_boarding.dart';
import 'package:veterinaria_app/features/onboarding/presentation/pages/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:veterinaria_app/usecases_config.dart';
UsecaseConfig usecaseConfig = UsecaseConfig();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<OnboardingBloc>(
          create: (BuildContext context) => OnboardingBloc(getOnboardingUsecase: usecaseConfig.getOnboardingUseCase!)
        ),
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const OnBoarding(),
          '/home': (context) => const  HomeScreen(),
        },
      ),
    );
  }
}

