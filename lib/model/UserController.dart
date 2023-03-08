/* import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_posgrado_sigae/model/UserModel.dart';
import 'package:http/http.dart' as http;

class UserController extends GetxController {
//1. Creamos las variables que contendran los datos de la API
//Traemos la clase donde está el model
  var users = <UserModel>[].obs;
  //2.3.1. Declaramos los controller
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

//2. Creamos el metodo para obtener los datos de la API
  /*  addUser() async {
    //2.1. EL LINK
    Uri url =
        Uri.parse('https://63eeea08d466e0c18bb64c88.mockapi.io/api/users');
    //2.3. Crear dato o asigarnlo a una variable
    final userData = UserModel(
        email: emailController.text, password: passwordController.text);

    try {
      //2.2. El await a tráves del postData
      var response = await http.post(url,
          body: jsonEncode(userData.toJson()),
          headers: {"content-type": "application/json"});
      //
      if (response.statusCode == 200) {
        Get.snackbar("post", "DATOS correctamente");
        await getUser();
      } else {
        Get.snackbar("post", "DATOS incorrectamente");
      }
    } catch (e) {
      Get.snackbar("ERROR", "$e");
    }
  } */

  //3. Método para traer los usuarios
  getUser() async {
    //3.1. EL LINK
    Uri url =
        Uri.parse('https://63eeea08d466e0c18bb64c88.mockapi.io/api/users');

    //try-catch
    if (emailController.text.isNotEmpty && emailController.text.isNotEmpty) {
      //3.2. El await a tráves del postData
      var response = await http.get(url);
      //3.3. Condicional para verificar que es un éxito
      if (response.statusCode == 200) {
        var data = List<UserModel>.from(
                jsonDecode(response.body).map((e) => UserModel.fromJson(e)))
            .toList();
        //3.3.1. Condicional para verificar que hay datos
        //Aquí puede ser isEmpty, en caso no funcione con null
        if (data.isNotEmpty) {
          // users.assignAll(data); //En caso lo de abajo no funcione
          users.value = data;
          print('LOGEADO');
        }
      }
    } else {
      // Get.snackbar("Datos", "No hay datos");
      print('False');
    }
  } //final addUser

  @override
  void onInit() {
    super.onInit();
    getUser();
  }
}//finalClase
 */