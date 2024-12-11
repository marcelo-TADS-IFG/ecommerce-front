import '../models/role.dart';
import '../repositories/role_repository.dart';

class RoleService {
  final RoleRepository _repository = RoleRepository();

  // Função para obter a lista de papéis (roles)
  Future<List<Role>> getRoles() {
    return _repository.fetchRoles();
  }

  // Função para adicionar um novo papel
  Future<Role> addRole(Role role) {
    return _repository.createRole(role);
  }

  // Função para remover um papel
  Future<void> removeRole(int id) {
    return _repository.deleteRole(id);
  }
}
