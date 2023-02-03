import 'package:flutter/material.dart';
import 'package:login_posgrado_sigae/componentes/botonPasswordForget.dart';

import '../componentes/TextField.dart';

class ForgetPassword extends StatelessWidget {
  final userNameController = TextEditingController();

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
                                    const EdgeInsets.only(top: 3, left: 25),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '¿Has olvidado la contraseña?',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Escriba su dirección de correo electrónico \nregistrada de su cuenta de postgradounap.edu.pe.',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              //3. Usuario campo
                              MyTextField(
                                controller: userNameController,
                                hintText: 'correo electrónico',
                                obscureText: true,
                                textType: TextInputType.emailAddress,
                              ),

                              //5. Boton iniciar sesción
                              BotonOlvidarPassword(),
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
