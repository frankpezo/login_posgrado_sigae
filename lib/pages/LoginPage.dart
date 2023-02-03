import 'package:flutter/material.dart';
import 'package:login_posgrado_sigae/componentes/controller.dart';
import 'package:login_posgrado_sigae/pages/Support.dart';
import 'package:login_posgrado_sigae/pages/forgetPassword.dart';

import 'HomePage.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //1.TextEditinController
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  bool obscurePassword = true;

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
          child: Form(
            key: formKey,
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
                                            color: Color.fromARGB(
                                                255, 33, 85, 175),
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
                                      const EdgeInsets.only(top: 3, right: 40),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Iniciar Sesión',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 19),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                          'Para acceder a Tramite documentario',
                                          style: TextStyle(fontSize: 15)),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                //3. Usuario campo
                                Container(
                                  margin: EdgeInsets.only(left: 20, right: 20),
                                  width: 325,
                                  height: 45,
                                  padding:
                                      const EdgeInsets.only(top: 3, left: 15),
                                  child: TextFormField(
                                    //2. Para acceder
                                    controller: userNameController,
                                    obscureText: false,
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Por favor, ingrese su correo electrónico';
                                      }
                                    },
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(13),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade400),
                                      ),
                                      fillColor: Colors.white,
                                      filled: true,
                                      hintText: 'Usuario',
                                      hintStyle:
                                          TextStyle(color: Colors.grey[500]),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 17,
                                ),
                                //4. Contraseña campo
                                Container(
                                  margin: EdgeInsets.only(left: 20, right: 20),
                                  width: 325,
                                  height: 45,
                                  padding:
                                      const EdgeInsets.only(top: 3, left: 15),
                                  child: TextFormField(
                                    //2. Para acceder
                                    controller: passwordController,
                                    obscureText: obscurePassword,
                                    keyboardType: TextInputType.text,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Por favor, ingrese su contraseña';
                                      }
                                    },
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(13),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade400),
                                      ),
                                      fillColor: Colors.white,
                                      filled: true,
                                      hintText: 'Contraseña',
                                      hintStyle:
                                          TextStyle(color: Colors.grey[500]),
                                      suffixIcon: IconButton(
                                        onPressed: () => setState(() {
                                          obscurePassword = !obscurePassword;
                                        }),
                                        icon: Icon(obscurePassword
                                            ? Icons.visibility
                                            : Icons.visibility_off),
                                        padding: EdgeInsets.only(bottom: 7),
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                //5. Boton iniciar sesción
                                GestureDetector(
                                  //1. Para que nos lleve a la página deseada
                                  onTap: () {
                                    setState(() {
                                      if (formKey.currentState!.validate()) {
                                        //1.1. Aquí colocaremos para que nos redirecciones a otra parte
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => HomePage()),
                                        );
                                      }
                                    });
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        left: 20, right: 10, top: 20),
                                    width: 310,
                                    height: 45,
                                    padding:
                                        const EdgeInsets.only(top: 3, left: 10),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 33, 85, 175),
                                        borderRadius: BorderRadius.circular(4)),
                                    child: Center(
                                      child: Text(
                                        'Iniciar Sesión',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                    ),
                                  ),
                                ),
                                //6. No se acuerda contraseña
                                SizedBox(
                                  height: 10,
                                ),
                                InkWell(
                                  child: GestureDetector(
                                      child: Text(
                                        '¿Olvidó la contraseña?',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 33, 85, 175),
                                            fontSize: 16),
                                      ),
                                      onTap: () {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ForgetPassword()),
                                        );
                                      }),
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
                          style:
                              TextStyle(fontSize: 14, color: Colors.grey[700]),
                        ),
                        InkWell(
                          child: GestureDetector(
                              child: Text(
                                'Comunícate con Soporte',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 33, 85, 175),
                                    fontSize: 14),
                              ),
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SupportTeam()),
                                );
                              }),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
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
      ),
    );
  }
}
