import 'package:flutter/material.dart';

class OnHomeScreen extends StatefulWidget {
  const OnHomeScreen({super.key});

  // final UserModel user;
  // OnHomeScreen({required this.user, userCredential});
  @override
  State<OnHomeScreen> createState() => _OnHomeScreenState();
}

class _OnHomeScreenState extends State<OnHomeScreen> {
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
        title: const Text('Home vista'),
        backgroundColor: const Color.fromARGB(255, 65, 3, 141),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("welcome"),
            SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                icon: const Icon(
                  Icons.home,
                  color: Colors.black,
                ),
                onPressed: () async {
                  Navigator.pushNamed(context, '/');
                },
                label: const Text("Regresar a inicio",
                    style: TextStyle(
                        fontSize: 16, color: Color.fromARGB(255, 91, 91, 91))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
