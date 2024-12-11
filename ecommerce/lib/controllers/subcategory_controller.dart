import 'package:flutter/material.dart';
import '../models/subcategory.dart';
import '../services/subcategory_service.dart';

class SubcategoryController extends ChangeNotifier {
  final SubcategoryService _service = SubcategoryService();
  List<SubCategory> _subcategories = [];

  List<SubCategory> get subcategories => _subcategories;

  // Função para carregar as subcategorias
  Future<void> loadSubcategories() async {
    try {
      _subcategories = await _service.getSubcategories();
      notifyListeners();
    } catch (e) {
      print('Error loading subcategories: $e');
    }
  }

  // Função para adicionar uma nova subcategoria
  Future<void> addSubcategory(SubCategory subcategory) async {
    try {
      final addedSubcategory = await _service.addSubcategory(subcategory);
      _subcategories.add(addedSubcategory);
      notifyListeners();
    } catch (e) {
      print('Error adding subcategory: $e');
    }
  }

  // Função para remover uma subcategoria
  Future<void> removeSubcategory(int name) async {
    try {
      await _service.removeSubcategory(name);
      _subcategories.removeWhere((subcategory) => subcategory.name == name);
      notifyListeners();
    } catch (e) {
      print('Error deleting subcategory: $e');
    }
  }
}
