class UserModel {
  //1. Declaramos las variables que contrendran los datos de la API
  String? email;
  String? password;
  String? id;

  //2. Creamos el constructor
  UserModel({this.email, this.password, this.id});

  //3. creamos factory para convertir el json a un objeto
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        email: json['email'], password: json['password'], id: json['id']);
  }

  //4. creamos el metodo para convertir el objeto a un json
  Map<String, dynamic> toJson() {
    return {'email': email, 'password': password, 'id': id};
  }
}//fin
