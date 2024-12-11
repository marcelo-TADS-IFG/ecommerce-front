import '../models/subcategory.dart';
import '../repositories/subcategory_repository.dart';

class SubcategoryService {
  final SubCategoryRepository _repository = SubCategoryRepository();

  Future<List<SubCategory>> getSubcategories() {
    return _repository.fetchSubCategories();
  }

  Future<SubCategory> addSubcategory(SubCategory subcategory) {
    return _repository.createSubCategory(subcategory);
  }

  Future<void> removeSubcategory(int id) {
    return _repository.deleteSubCategory(id);
  }
}
