import 'package:flutter/material.dart';
import 'package:login_posgrado_sigae/componentes/controller.dart';
import 'package:login_posgrado_sigae/pages/LoginPage.dart';

class ChangePassword extends StatefulWidget {
  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final passwordControllerUno = TextEditingController();

  final passwordControllerDos = TextEditingController();
  bool obscurePassword = true;
  bool obscurePasswordDos = true;

  //SnackBar
  void showSnackBar(String title) {
    final snackBar = SnackBar(
      backgroundColor: Color.fromARGB(255, 42, 226, 137),
      content: Text(
        title,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      duration: Duration(seconds: 20),
      action: SnackBarAction(
        textColor: Color.fromARGB(255, 255, 255, 255),
        label: 'Click aquí',
        onPressed: (() {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        }),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
            key: formKeyTres,
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
                                      const EdgeInsets.only(top: 3, left: 34),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                    controller: passwordControllerUno,
                                    obscureText: obscurePassword,
                                    keyboardType: TextInputType.text,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Por favor, ingrese la nueva contraseña';
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
                                      hintText: 'Nueva contraseña',
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
                                  height: 18,
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
                                    controller: passwordControllerDos,
                                    obscureText: obscurePasswordDos,
                                    keyboardType: TextInputType.text,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Por favor, ingrese la nueva contraseña';
                                      }
                                      if (passwordControllerUno.text !=
                                          passwordControllerDos.text) {
                                        return 'Las contraseña no coincide';
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
                                      hintText: 'Repetir nueva contraseña',
                                      hintStyle:
                                          TextStyle(color: Colors.grey[500]),
                                      suffixIcon: IconButton(
                                        onPressed: () => setState(() {
                                          obscurePasswordDos =
                                              !obscurePasswordDos;
                                        }),
                                        icon: Icon(obscurePasswordDos
                                            ? Icons.visibility
                                            : Icons.visibility_off),
                                        padding: EdgeInsets.only(bottom: 7),
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 9,
                                ),
                                //5. Boton iniciar sesción
                                GestureDetector(
                                  //1. Para que nos lleve a la página deseada
                                  onTap: () {
                                    setState(() {
                                      if (formKeyTres.currentState!
                                          .validate()) {
                                        //1.1. Aquí colocaremos para que nos redirecciones a otra parte
                                        showSnackBar(
                                            'Se cambió la contraseña correctamente');
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
                                        'Confirmar',
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
      ),
    );
  }
}
