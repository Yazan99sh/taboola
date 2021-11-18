import 'package:injectable/injectable.dart';
import 'package:taboola/abstracts/data_model/data_model.dart';
import 'package:taboola/generated/l10n.dart';
import 'package:taboola/module_home/manager/home_manager.dart';
import 'package:taboola/module_home/model/categories_model.dart';
import 'package:taboola/module_home/request/category_request.dart';
import 'package:taboola/module_home/response/categories_response.dart';
import 'package:taboola/utils/helpers/status_code_helper.dart';

@injectable
class HomeService {
  final HomeManager _homeManager;

  HomeService(this._homeManager);

  Future<DataModel> getCategories() async {
    CategoriesResponse? topProducts = await _homeManager.getTopProducts();
    if (topProducts == null) {
      return DataModel.withError(S.current.networkError);
    }
    if (topProducts.results == null) {
      return DataModel.withError(
          StatusCodeHelper.getStatusCodeMessages('0'));
    }
    if (topProducts.results!.isEmpty) return DataModel.empty();

    return CategoriesModel.withData(topProducts.results ?? []);
  }

  Future<DataModel> createCategory(CategoryRequest request) async {
    bool? topProducts = await _homeManager.createCategory(request);
    if (topProducts == null) {
      return DataModel.withError(S.current.networkError);
    }
    return DataModel.empty();
  }

}
