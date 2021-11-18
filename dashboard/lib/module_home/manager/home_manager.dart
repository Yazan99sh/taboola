import 'package:injectable/injectable.dart';
import 'package:taboola/module_home/repository/home_repository.dart';
import 'package:taboola/module_home/request/category_request.dart';
import 'package:taboola/module_home/response/categories_response.dart';

@injectable
class HomeManager {
  final HomeRepository _homeRepository;
  HomeManager(this._homeRepository);
  Future<CategoriesResponse?> getTopProducts() =>
      _homeRepository.getCategories();
  Future<bool?> createCategory(CategoryRequest request) =>
      _homeRepository.createCategory(request);
}
