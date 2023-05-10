import 'package:flutter/material.dart';
import 'package:veterinaria_app/features/onboarding/presentation/pages/components/on_home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // final UserModel user;
  // HomeScreen({required this.user, userCredential});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: OnHomeScreen(),
    );
  }
}
