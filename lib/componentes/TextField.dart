import 'package:flutter/material.dart';
import 'controller.dart';

class MyTextField extends StatefulWidget {
  //1. Declaramos las variables necesarias
  final controller;
  final String hintText;
  final bool obscureText;
  final TextInputType textType;
  const MyTextField(
      {Key? key,
      this.controller,
      required this.hintText,
      required this.obscureText,
      required this.textType})
      : super(key: key);

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      width: 325,
      height: 45,
      padding: const EdgeInsets.only(top: 3, left: 15),
      child: TextFormField(
        //2. Para acceder
        controller: this.widget.controller,
        obscureText: this.widget.obscureText,
        keyboardType: widget.textType,
        validator: (value) {
          if (value!.isEmpty) {
            return 'No puede dejar espacios en blanco';
          }
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(13),
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          fillColor: Colors.white,
          filled: true,
          hintText: this.widget.hintText,
          hintStyle: TextStyle(color: Colors.grey[500]),
        ),
      ),
    );
  }
}
