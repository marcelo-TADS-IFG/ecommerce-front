import 'package:flutter/material.dart';
import 'package:ecommerce_front/models/user.dart';
import 'package:ecommerce_front/services/user_service.dart';

class UserController extends ChangeNotifier {
  final UserService _service = UserService();
  List<User> _users = [];

  List<User> get users => _users;

  // Função para carregar os usuários
  Future<void> loadUsers() async {
    try {
      _users = await _service.getUsers();
      notifyListeners();
    } catch (e) {
      print('Error loading users: $e');
    }
  }

  // Função para adicionar um novo usuário
  Future<void> addUser(User user) async {
    try {
      final addedUser = await _service.addUser(user);
      _users.add(addedUser);
      notifyListeners();
    } catch (e) {
      print('Error adding user: $e');
    }
  }

  // Função para remover um usuário
  Future<void> removeUser(int userId) async {
    try {
      await _service.removeUser(userId);
      _users.removeWhere((user) => user.id == userId);
      notifyListeners();
    } catch (e) {
      print('Error deleting user: $e');
    }
  }
}
