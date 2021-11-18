import 'package:injectable/injectable.dart';
import 'package:taboola/consts/urls.dart';
import 'package:taboola/module_auth/service/auth_service/auth_service.dart';
import 'package:taboola/module_home/request/category_request.dart';
import 'package:taboola/module_home/response/categories_response.dart';
import 'package:taboola/module_network/http_client/http_client.dart';

@injectable
class HomeRepository {
  final ApiClient _apiClient;
  final AuthService _authService;
  HomeRepository(this._apiClient,this._authService);
  Future<CategoriesResponse?> getCategories() async {
    dynamic response = await _apiClient.get(Urls.CATEGORIES_API);
    if (response == null) return null;
    return CategoriesResponse.fromJson(response);
  }
  Future <bool?> createCategory(CategoryRequest request) async {
    dynamic response = await _apiClient.get(Urls.CATEGORIES_MANAGEMENT_API);
    if (response == null) return null;
    return response != null;
  }

}
