import 'package:flutter/material.dart';
import 'package:login_posgrado_sigae/componentes/botonPasswordConfirmar.dart';

import '../componentes/TextField.dart';

class ChangePassword extends StatelessWidget {
  final passwordController = TextEditingController();
  final passwordControllerDos = TextEditingController();

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
                                    const EdgeInsets.only(top: 3, left: 34),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Cambiar la contraseña',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 19),
                                    ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Text(
                                      'Para cambiar su contraseña, por favor ingrese su nueva contraseña en el siguiente campo: ',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              //3. Usuario campo
                              MyTextField(
                                controller: passwordController,
                                hintText: 'Nueva contraseña',
                                obscureText: true,
                                textType: TextInputType.text,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              //4. Contraseña campo
                              MyTextField(
                                controller: passwordControllerDos,
                                hintText: 'Repetir nueva contraseña',
                                obscureText: true,
                                textType: TextInputType
                                    .text, //Para que la contraseña no se pueda ver
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              //5. Boton iniciar sesción
                              ConfirmarPassword(),
                              //6. No se acuerda contraseña
                              SizedBox(
                                height: 10,
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

                  Text(
                    '© 2023, Escuela Postgrado UNAP\nReservados todos los derechos ',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
