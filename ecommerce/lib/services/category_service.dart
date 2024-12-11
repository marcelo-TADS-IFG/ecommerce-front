import '../models/category.dart';
import '../repositories/category_repository.dart';

class CategoryService {
  final CategoryRepository _repository = CategoryRepository();

  // Função para obter a lista de categorias
  Future<List<Category>> getCategories() {
    return _repository.fetchCategories();
  }

  // Função para adicionar uma nova categoria
  Future<Category> addCategory(Category category) {
    return _repository.createCategory(category);
  }

  // Função para remover uma categoria
  Future<void> removeCategory(int id) {
    return _repository.deleteCategory(id);
  }
}
