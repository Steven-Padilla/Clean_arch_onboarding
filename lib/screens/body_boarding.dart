import 'package:veterinaria_app/screens/components/on_boarding.dart';
import 'package:flutter/material.dart';

class BodyBoarding extends StatefulWidget {
  const BodyBoarding({super.key});

  @override
  State<BodyBoarding> createState() => _BodyBoardingState();
}

class _BodyBoardingState extends State<BodyBoarding>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: OnBoarding(),
    );
  }
}
