import 'package:ecommerce_front/models/role.dart';

class User {
  int id;
  String userName;
  String password;
  int roleId; // ID do papel (role) associado
  Role role; // Objeto Role associado ao usuário

  // Construtor da classe User
  User({
    required this.id,
    required this.userName,
    required this.password,
    required this.roleId,
    required this.role,
  });

  // Fábrica que cria uma instância de User a partir de um JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      userName: json['user_name'],
      password: json['password'],
      roleId: json['role_id'],
      role: Role.fromJson(json['role']),
    );
  }

  // Método que converte uma instância de User para JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_name': userName,
      'password': password,
      'role_id': roleId,
      'role': role.toJson(), // Podemos incluir o objeto Role no JSON, se necessário
    };
  }
}
