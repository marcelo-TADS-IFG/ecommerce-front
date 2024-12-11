import 'package:flutter/material.dart';
import '../models/role.dart';
import '../services/role_service.dart';

class RoleController extends ChangeNotifier {
  final RoleService _service = RoleService();
  List<Role> _roles = [];

  List<Role> get roles => _roles;

  // Função para carregar os papéis (roles)
  Future<void> loadRoles() async {
    try {
      _roles = await _service.getRoles();  // Chama o serviço para obter os papéis
      notifyListeners();  // Notifica os ouvintes de que a lista foi atualizada
    } catch (e) {
      print('Error loading roles: $e');
    }
  }

  // Função para adicionar um novo papel
  Future<void> addRole(Role role) async {
    try {
      final addedRole = await _service.addRole(role);  // Chama o serviço para adicionar o papel
      _roles.add(addedRole);  // Adiciona o papel à lista interna
      notifyListeners();  // Notifica os ouvintes de que a lista foi atualizada
    } catch (e) {
      print('Error adding role: $e');
    }
  }

  // Função para remover um papel
  Future<void> removeRole(int id) async {
    try {
      await _service.removeRole(id);  // Chama o serviço para remover o papel
      _roles.removeWhere((role) => role.id == id);  // Remove o papel da lista interna
      notifyListeners();  // Notifica os ouvintes de que a lista foi atualizada
    } catch (e) {
      print('Error deleting role: $e');
    }
  }
}
