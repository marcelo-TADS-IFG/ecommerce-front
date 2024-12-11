import 'package:flutter/material.dart';
import '../models/category.dart';
import '../services/category_service.dart';

class CategoryController extends ChangeNotifier {
  final CategoryService _service = CategoryService();
  List<Category> _categories = [];

  List<Category> get categories => _categories;

  // Função para carregar as categorias
  Future<void> loadCategories() async {
    try {
      _categories = await _service.getCategories();
      notifyListeners();
    } catch (e) {
      print('Error loading categories: $e');
    }
  }

  // Função para adicionar uma nova categoria
  Future<void> addCategory(Category category) async {
    try {
      final addedCategory = await _service.addCategory(category);
      _categories.add(addedCategory);
      notifyListeners();
    } catch (e) {
      print('Error adding category: $e');
    }
  }

  // Função para remover uma categoria
  Future<void> removeCategory(int id) async {
    try {
      await _service.removeCategory(id);
      _categories.removeWhere((category) => category.id == id);
      notifyListeners();
    } catch (e) {
      print('Error deleting category: $e');
    }
  }
}
