import 'package:flutter/material.dart';
import 'package:veterinaria_app/screens/components/on_inicio.dart';

void main() => runApp(const Inicio());

class Inicio extends StatelessWidget {
  const Inicio({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: OnInicio(),
    );
  }
}
