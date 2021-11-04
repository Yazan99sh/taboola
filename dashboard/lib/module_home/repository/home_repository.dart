import 'package:injectable/injectable.dart';
import 'package:taboola/consts/urls.dart';
import 'package:taboola/module_home/response/categories_response.dart';
import 'package:taboola/module_network/http_client/http_client.dart';

@injectable
class HomeRepository {
  final ApiClient _apiClient;
  HomeRepository(this._apiClient);
  Future<CategoriesResponse?> getCategories() async {
    dynamic response = await _apiClient.get(Urls.CATEGORIES_API);
    if (response == null) return null;
    return CategoriesResponse.fromJson(response);
  }

}
