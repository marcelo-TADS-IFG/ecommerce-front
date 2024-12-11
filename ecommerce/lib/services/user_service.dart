import '../models/user.dart';
import '../repositories/user_repository.dart';

class UserService {
  final UserRepository _repository = UserRepository();

  // Função para buscar todos os usuários
  Future<List<User>> getUsers() {
    return _repository.fetchUsers();
  }

  // Função para adicionar um novo usuário
  Future<User> addUser(User user) {
    return _repository.createUser(user);
  }

  // Função para remover um usuário
  Future<void> removeUser(int id) {
    return _repository.deleteUser(id);
  }
}
