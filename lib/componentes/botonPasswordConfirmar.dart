import 'package:flutter/material.dart';

class ConfirmarPassword extends StatelessWidget {
  const ConfirmarPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //1. Para que nos lleve a la página deseada
      onTap: () {
        //1.1. Aquí colocaremos la
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
            'Confirmar',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
