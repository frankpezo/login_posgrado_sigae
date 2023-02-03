import 'package:flutter/material.dart';
import 'package:login_posgrado_sigae/componentes/TextField.dart';
import 'package:login_posgrado_sigae/componentes/botonLogin.dart';
import 'package:login_posgrado_sigae/pages/HomePage.dart';

class LoginPage extends StatelessWidget {
  //1.TextEditinController
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[40],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  //1. Logo
                  Image.asset("assets/images/cubo.png"),
                  //2. Bievenido
                  Text(
                    'Iniciar Sesión',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text('Para acceder a Tramite documentario'),
                  //3. Usuario campo
                  MyTextField(
                    controller: userNameController,
                    hintText: 'Usuario',
                    obscureText: false,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  //4. Contraseña campo
                  MyTextField(
                    controller: passwordController,
                    hintText: 'Contraseña',
                    obscureText: true, //Para que la contraseña no se pueda ver
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //5. Boton iniciar sesción
                  BotonLogin(),
                  //6. No se acuerda contraseña
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    '¿Olvidó la contraseña?',
                    style: TextStyle(color: Colors.blueAccent),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  //7. En caso no pueda acceder a su correo

                  Text(
                    '¿No tienes acceso a tu cuenta? ',
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    'Comunicarse con soporte',
                    style: TextStyle(color: Colors.blueAccent, fontSize: 13),
                  ),

                  Text('2023, Escuela Postgrado Unap. Reservado todos lo dee')
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
