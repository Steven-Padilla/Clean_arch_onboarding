import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:veterinaria_app/screens/inicio.dart';
import 'package:veterinaria_app/screens/login.dart';
import 'package:veterinaria_app/screens/components/forgot_password.dart';
import 'package:veterinaria_app/screens/components/on_boarding.dart';
import 'package:veterinaria_app/screens/components/register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Inicio(),
        '/register': (context) => const Register(),
        '/login': (context) => const Login(),
        '/recover_password': (context) => const RecuperarContrasena(),
        '/on_boarding': (context) => const OnBoarding(),
        // '/home': (context) => HomeScreen(userCredential),
      },
    );
  }
}
