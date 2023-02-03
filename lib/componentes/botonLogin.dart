import 'package:flutter/material.dart';
import 'package:login_posgrado_sigae/pages/HomePage.dart';

class BotonLogin extends StatelessWidget {
  const BotonLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //1. Para que nos lleve a la página deseada
      onTap: () {
        //1.1. Aquí colocaremos la
      },
      child: Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 20),
        width: 330,
        height: 45,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 33, 91, 191),
            borderRadius: BorderRadius.circular(4)),
        child: Center(
          child: Text(
            'Iniciar Sesión',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}