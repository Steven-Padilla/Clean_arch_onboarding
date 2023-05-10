import 'package:flutter/material.dart';
import '../../models/user_model.dart';
import '../../services/email_verify_interface.dart';
import '../../services/email_verify_service.dart';
import '../../services/recover_pass_interface.dart';
import '../../services/recover_pass_service.dart';
import '../home.dart';

class RecuperarContrasena extends StatefulWidget {
  const RecuperarContrasena({super.key});

  @override
  State<RecuperarContrasena> createState() => _RecuperarContrasenaState();
}

class _RecuperarContrasenaState extends State<RecuperarContrasena> {
  final IEmail emailService = EmailService();
  final emailController = TextEditingController();
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
        title: const Text('Recuperar contrasena'),
        backgroundColor: const Color.fromARGB(255, 65, 3, 141),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            // Texto arriba,
            children: [
              Flexible(
                fit: FlexFit.loose,
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Ingresa tu email para restablecer tu contrasena',
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              //columna con los widgets de correo y texto
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text('Correo electronico',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  hintText: ('Direccion de correo'),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  'Ingrese su correo electronico registrado y le enivaremos un correo electronico que contiene un enlace para restablecer su contrasena',
                  textAlign: TextAlign.justify,
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              //boton
              Flexible(
                fit: FlexFit.tight,
                flex: 12,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50,
                      width: 300,
                      child: MaterialButton(
                        color: const Color.fromARGB(255, 103, 165, 105),
                        onPressed: () async {
                          String email = emailController.text;
                          print('onpressed');
                          if (emailController.text.isNotEmpty) {
                            print('if');
                            UserModel? user = await emailService.emailVerify(
                                emailController.text);
                            print(user);
                            if (user != null) {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (_) =>  SolicitudContrasena(getEmail: email)));
                            }
                            if (emailController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Campos vacios')));
                            }
                          }
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: const Text(
                          'Enviar Solicitud',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SolicitudContrasena extends StatefulWidget {
  const SolicitudContrasena({super.key, this.getEmail});
  final getEmail;
  @override
  State<SolicitudContrasena> createState() => _SolicitudContrasenaState();
}
class _SolicitudContrasenaState extends State<SolicitudContrasena> {
  bool passwordVisible = false;
  final IPass passService = PassRecoveryService();
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
        title: const Text('Recuperar contrasena'),
        backgroundColor: const Color.fromARGB(255, 65, 3, 141),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              const Flexible(
                fit: FlexFit.loose,
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: Text(
                    'Por seguridad, tu contrasena debe tener una longitud de entre 8 y 15 caracteres, usar mayusculas, minusculas, contener por lo menos un numero y un caracter especial',
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
              Flexible(
                fit: FlexFit.loose,
                flex: 7,
                child: SizedBox(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text('Nueva contrasena',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: TextField(
                          obscureText: true,
                          controller: passwordController,
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
                            hintText: ('Nueva contrasena'),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text('Confirmar nueva contrasena',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      TextField(
                        obscureText: true,
                        controller: passwordController,
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
                          hintText: ('Confirmar tu nueva contrasena'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                flex: 6,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50,
                      width: 300,
                      child: MaterialButton(
                        color: const Color.fromARGB(255, 103, 165, 105),
                        onPressed: () async {
                          if (passwordController.text.isNotEmpty) {
                            UserModel? user = await passService.passRecovery(passwordController.text, widget.getEmail);
                            if (user != null) {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (_) => const HomeScreen()));
                            }
                            if (passwordController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Campos vacios')));
                            }
                          }
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        child: const Text(
                          'Actualizar contrasena',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
