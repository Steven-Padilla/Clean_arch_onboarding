// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import '../../models/user_model.dart';
import '../../services/login_interface.dart';
import '../../services/login_service.dart';
import '../home.dart';

class OnLogin extends StatefulWidget {
  const OnLogin({Key? key}) : super(key: key);

  @override
  State<OnLogin> createState() => _OnLoginState();
}

class _OnLoginState extends State<OnLogin> {
  final ILogin loginService = LoginService();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
        title: const Text('Iniciar sesion'),
        backgroundColor: const Color.fromARGB(255, 65, 3, 141),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: LayoutBuilder(
            builder:
                (BuildContext context, BoxConstraints viewportConstraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: viewportConstraints.maxHeight,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 300),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: TextField(
                            controller: emailController,
                            decoration: const InputDecoration(
                                hintText: ('email'),
                                prefixIcon:
                                    Icon(Icons.email, color: Colors.black)),
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                        TextField(
                          controller: passwordController,
                          decoration: const InputDecoration(
                              hintText: ('password'),
                              prefixIcon:
                                  Icon(Icons.lock, color: Colors.black)),
                          textInputAction: TextInputAction.done,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            MaterialButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, '/recover_password');
                                },
                                child: const Text(
                                  'Olvide mi contrasena',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 11),
                                )),
                          ],
                        ),
                        SizedBox(
                          width: 200,
                          child: RawMaterialButton(
                            fillColor: Colors.lightBlue,
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            onPressed: () async {
                              if (emailController.text.isNotEmpty &&
                                  passwordController.text.isNotEmpty) {
                                UserModel? user = await loginService.login(
                                    emailController.text,
                                    passwordController.text);
                                if (user != null) {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (_) => const HomeScreen()));
                                }
                                if (emailController.text.isEmpty &&
                                    passwordController.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text('Campos vacios')));
                                }
                              }
                            },
                            child: const Text(
                              "Iniciar Sesion",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
