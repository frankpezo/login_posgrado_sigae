import 'package:flutter/material.dart';
import 'package:login_posgrado_sigae/pages/LoginPage.dart';

class HomePage extends StatefulWidget {
  //1. Para traer el nombre del usuario
  String name;
  HomePage(this.name);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/pic.png",
              width: 300,
            ),
            Text(
              'Bienvenido ${widget.name}',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: Text('Cerrar sesión'))
          ],
        ),
      )),
    );
  }
}
