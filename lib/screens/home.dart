import 'package:flutter/material.dart';
import 'package:veterinaria_app/screens/components/on_home.dart';

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
