// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:veterinaria_app/services/firebase_auth_methods.dart';
import '../home.dart';

void main() => runApp(const OnInicio());

class OnInicio extends StatefulWidget {
  const OnInicio({super.key});
  @override
  State<OnInicio> createState() => _OnInicioState();
}

class _OnInicioState extends State<OnInicio> {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Column(
          children: [
            Expanded(
                flex: 3,
                child: Image.asset("assets/images/logoColor.png",
                    height: 300, width: 300)),
            SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                onPressed: () async {
                  try {
                    await signInWithGoogle();
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => const HomeScreen()));
                  } on FirebaseAuthException catch (e) {
                    print('Error de inicio de sesión con Google: $e');
                  } catch (e) {
                    print('Error: $e');
                  }
                },
                icon: const Icon(Icons.g_mobiledata),
                label: const Text("Continuar con Google",
                    style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: SizedBox(
                height: 50,
                width: 300,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[900],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  onPressed: () async {
                    try {
                      await signInWithFacebook();
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (_) => const HomeScreen()));
                    } on FirebaseAuthException catch (e) {
                      print('Error de inicio de sesión con Facebook: $e');
                    } catch (e) {
                      print('Error: $e');
                    }
                  },
                  icon: const Icon(Icons.facebook),
                  label: const Text("Continuar con Facebook",
                      style: TextStyle(fontSize: 16, color: Colors.white)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SizedBox(
                height: 50,
                width: 300,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  icon: const Icon(
                    Icons.email,
                    color: Colors.grey,
                  ),
                  onPressed: () async {
                    Navigator.pushNamed(context, '/register');
                  },
                  label: const Text("Registrarse con e-mail",
                      style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 91, 91, 91))),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                'Iniciar como invitado',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                'Iniciar como vendedor',
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Ya tienes cuenta?',
                    style: TextStyle(color: Colors.black),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: const Text(
                        'Iniciar sesion',
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
