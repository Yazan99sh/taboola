import 'package:taboola/abstracts/data_model/data_model.dart';
import 'package:taboola/module_home/response/categories_response.dart';

class CategoriesModel extends DataModel {
  String categoryId = '-1';
  String categoryName = '';
  String categoryImage = '';

  CategoriesModel(
      {required this.categoryId,
      required this.categoryName,
      required this.categoryImage});

  CategoriesModel.withData(List<Results> results) {
    results.forEach((element) {
      _categories.add(CategoriesModel(
          categoryId: element.categoryId ?? '-1',
          categoryName: element.categoryName ?? '',
          categoryImage: element.categoryImage ?? ''));
    });
  }

  List <CategoriesModel> _categories = [];

  List <CategoriesModel> get data => _categories;
}
