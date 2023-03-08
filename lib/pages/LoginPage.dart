import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:login_posgrado_sigae/componentes/controller.dart';
import 'package:login_posgrado_sigae/pages/HomePage.dart';
import 'package:login_posgrado_sigae/pages/Support.dart';
import 'package:login_posgrado_sigae/pages/forgetPassword.dart';
import 'package:http/http.dart' as http; //Para consumir la Api

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //1.TextEditinController
  TextEditingController user = TextEditingController();
  TextEditingController password = TextEditingController();
  bool obscurePassword = true;

  //2. Creamos el método para consumir la Api
  Future<void> getDatos() async {
    if (user.text.isNotEmpty && password.text.isNotEmpty) {
      //2.1. Hacemos un tryCatch
      try {
        //3. Traemos la url
        Uri url = Uri.parse('http://10.0.2.2/sigaePhp/selectData.php');
        //3.1. Hacemos la peticiónal body
        var res = await http
            .post(url, body: {'user': user.text, 'password': password.text});
        print(res.body); //Para ver si trae los datos

        //3.2. Convertimos la respuesta a json
        var response = jsonDecode(res.body);
        if (response.length != 0) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePage(user.text)),
          );
          print('Ingresó con exito');
        } else {
          print('Falló');
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Color.fromARGB(255, 242, 48, 48),
            content: Text(
              'Los datos no coinciden',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            duration: Duration(seconds: 5),
          ));
        }
      } catch (e) {
        print(e);
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Color.fromARGB(255, 242, 48, 48),
        content: Text(
          'Los campos no pueden quedar vacíos',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        duration: Duration(seconds: 5),
      ));
    }
  }

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
                                    controller: user,
                                    obscureText: false,
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Por favor, ingrese su correo electrónico';
                                      }
                                      return null;
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
                                    controller: password,
                                    obscureText: obscurePassword,
                                    keyboardType: TextInputType.text,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Por favor, ingrese su contraseña';
                                      }
                                      return null;
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
                                      if (formKey.currentState!.validate()) {}
                                    });
                                    //
                                    //
                                    getDatos();
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
