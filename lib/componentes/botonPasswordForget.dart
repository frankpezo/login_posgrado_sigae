import 'package:flutter/material.dart';
import 'package:login_posgrado_sigae/pages/changePassword.dart';

class BotonOlvidarPassword extends StatelessWidget {
  const BotonOlvidarPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //1. Para que nos lleve a la página deseada
      onTap: () {
        //1.1. Aquí colocaremos para que nos redirecciones a otra parte
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ChangePassword()),
        );
      },
      child: Container(
        margin: EdgeInsets.only(left: 20, right: 10, top: 20),
        width: 310,
        height: 45,
        padding: const EdgeInsets.only(top: 3, left: 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 33, 85, 175),
            borderRadius: BorderRadius.circular(4)),
        child: Center(
          child: Text(
            'Siguiente',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
