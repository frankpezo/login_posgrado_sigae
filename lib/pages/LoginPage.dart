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
      // backgroundColor: Colors.grey[300],
      body: Container(
        //Para fondo
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/fondo.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              child: Column(
                children: [
                  Container(
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2)),
                      margin: EdgeInsets.all(15),
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            bottom: 40, left: 10, right: 10),
                        child: Container(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 50,
                              ),
                              //1. Logo

                              Container(
                                padding:
                                    const EdgeInsets.only(top: 3, right: 195),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/images/cubo.png",
                                      width: 45,
                                      height: 43,
                                    ),
                                    Text(
                                      'SIGAE',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 33, 85, 175),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 23),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 14,
                              ),
                              //2. Bievenido
                              Container(
                                padding:
                                    const EdgeInsets.only(top: 3, right: 55),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Iniciar Sesión',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 19),
                                    ),
                                    Text('Para acceder a Tramite documentario'),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              //3. Usuario campo
                              MyTextField(
                                controller: userNameController,
                                hintText: 'Usuario',
                                obscureText: false,
                                textType: TextInputType.emailAddress,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              //4. Contraseña campo
                              MyTextField(
                                controller: passwordController,
                                hintText: 'Contraseña',
                                obscureText: true,
                                textType: TextInputType
                                    .text, //Para que la contraseña no se pueda ver
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              //5. Boton iniciar sesción
                              BotonLogin(),
                              //6. No se acuerda contraseña
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '¿Olvidó la contraseña?',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 33, 85, 175),
                                    fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //7. En caso no pueda acceder a su correo

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '¿No tienes acceso a tu cuenta? ',
                        style: TextStyle(fontSize: 14),
                      ),
                      Text(
                        'Comunícate con soporte',
                        style: TextStyle(
                            color: Color.fromARGB(255, 33, 85, 175),
                            fontSize: 14),
                      ),
                    ],
                  ),

                  Text('© 2023, Escuela Postgrado Unap'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
