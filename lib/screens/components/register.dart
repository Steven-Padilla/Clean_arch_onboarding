// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import '../../models/user_model.dart';
import '../../services/register_interface.dart';
import '../../services/register_service.dart';
import '../home.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final IRegister registerService = RegisterService();
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool passwordVisible = false;
  bool agree = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Image.asset('assets/images/logoBlanco.png'),
          )
        ],
        title: const Text('Registrate'),
        backgroundColor: const Color.fromARGB(255, 65, 3, 141),
      ),
      body: Center(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 15.0, left: 15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        'Crea una cuenta para empezar a usar la app',
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text(
                            'Nombre',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      TextField(
                        controller: name,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          hintText: ('Nombre completo'),
                        ),
                        textInputAction: TextInputAction.next,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text('Correo electronico',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                      TextField(
                        controller: email,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          hintText: ('Direccion de correo'),
                        ),
                        textInputAction: TextInputAction.next,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text('Contrasena',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                      TextField(
                        controller: password,
                        obscureText: passwordVisible,
                        decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                passwordVisible = !passwordVisible;
                              });
                            },
                            child: Icon(passwordVisible
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          hintText: ('Contrasena'),
                        ),
                        textInputAction: TextInputAction.done,
                      ),
                      const Text(
                        'La contrasena debe contener caracteres, numeros y simbolos con un minimo de 6 caracteres.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      Row(
                        children: [
                          Checkbox(
                              value: agree,
                              shape: const CircleBorder(),
                              onChanged: (value) {
                                setState(() {
                                  agree = value ?? false;
                                });
                              }),
                          SizedBox(
                            width: 300,
                            child: RichText(
                              text: TextSpan(
                                  text: 'Al registrarme, acepto los',
                                  style: DefaultTextStyle.of(context).style,
                                  children: const [
                                    TextSpan(
                                      text: ' terminos y condiciones',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                    TextSpan(text: ' y la'),
                                    TextSpan(
                                        text: ' politica de privacidad',
                                        style: TextStyle(color: Colors.red))
                                  ]),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                        width: 300,
                        child: MaterialButton(
                          color: const Color.fromARGB(255, 103, 165, 105),
                          onPressed: () async {
                            if (name.text.isNotEmpty && email.text.isNotEmpty &&
                                password.text.isNotEmpty) {
                              UserModel? user = await registerService.register(
                                  name.text,
                                  email.text,
                                  password.text);
                              if (user != null) {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (_) => const HomeScreen()));
                              }
                              if (email.text.isEmpty &&
                                  password.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Campos vacios')));
                              }
                            }
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: const Text(
                            'Crear Cuenta',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Ya tienes cuenta?',
                            style: TextStyle(color: Colors.black),
                          ),
                          TextButton(
                              onPressed: () async {
                                if (name.text.isNotEmpty &&
                                    email.text.isNotEmpty &&
                                    password.text.isNotEmpty) {
                                  UserModel? user =
                                      await registerService.register(
                                          name.text, email.text, password.text);
                                  if (user != null) {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (_) => const HomeScreen()));
                                  }
                                  if (email.text.isEmpty &&
                                      password.text.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text('Campos vacios')));
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                'email or password incorrect')));
                                  }
                                }
                              },
                              child: const Text(
                                'Iniciar sesion',
                                style: TextStyle(color: Colors.red),
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
