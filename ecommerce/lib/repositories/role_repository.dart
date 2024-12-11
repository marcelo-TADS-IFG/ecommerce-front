import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/role.dart';
import '../utils/app_storage.dart';
import '../main.dart';
import '../screens/login_screen.dart';
import 'package:flutter/material.dart';

class RoleRepository {
  final String baseUrl =
      "http://localhost:8000"; // Troque pela URL do seu backend

  /// Método para obter os cabeçalhos de autenticação
  Future<Map<String, String>> _getHeaders() async {
    final token = AppStorage.instance.token;
    if (token != null) {
      return {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      };
    }
    return {"Content-Type": "application/json"};
  }

  /// Método para tratar o erro 401 (Não autorizado)
  void _handleUnauthorized() {
    AppStorage.instance.removeToken(); // Remove o token inválido
    MyApp.navigatorKey.currentState?.pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  /// Método para buscar todos os papéis (roles)
  Future<List<Role>> fetchRoles() async {
    final headers = await _getHeaders();
    final response = await http.get(
      Uri.parse('$baseUrl/roles'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((item) => Role.fromJson(item)).toList();
    } else if (response.statusCode == 401) {
      _handleUnauthorized();
      throw Exception('Unauthorized');
    } else {
      throw Exception('Failed to load roles');
    }
  }

  /// Método para criar um novo papel (role)
  Future<Role> createRole(Role role) async {
    final headers = await _getHeaders();
    final response = await http.post(
      Uri.parse('$baseUrl/role/save'),
      headers: headers,
      body: jsonEncode(role.toJson()),
    );

    if (response.statusCode == 200) {
      return Role.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 401) {
      _handleUnauthorized();
      throw Exception('Unauthorized');
    } else {
      throw Exception('Failed to create role');
    }
  }

  /// Método para deletar um papel (role)
  Future<void> deleteRole(int id) async {
    final headers = await _getHeaders();
    final response = await http.delete(
      Uri.parse('$baseUrl/role/$id'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      return;
    } else if (response.statusCode == 401) {
      _handleUnauthorized();
      throw Exception('Unauthorized');
    } else {
      throw Exception('Failed to delete role');
    }
  }
}
