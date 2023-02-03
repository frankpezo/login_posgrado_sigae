import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  //1. Declaramos las variables necesarias
  final controller;
  final String hintText;
  final bool obscureText;

  const MyTextField(
      {Key? key,
      this.controller,
      required this.hintText,
      required this.obscureText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      width: 330,
      height: 45,
      child: TextField(
        //2. Para acceder
        controller: this.controller,
        obscureText: this.obscureText,
        decoration: InputDecoration(
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          fillColor: Colors.white,
          filled: true,
          hintText: this.hintText,
          hintStyle: TextStyle(color: Colors.grey[500]),
        ),
      ),
    );
  }
}
