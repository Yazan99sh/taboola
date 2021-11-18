import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:taboola/generated/l10n.dart';
import 'package:taboola/module_home/model/categories_model.dart';
import 'package:taboola/module_home/request/category_request.dart';
import 'package:taboola/module_home/service/home_service.dart';
import 'package:taboola/module_home/ui/screen/home_screen.dart';
import 'package:taboola/module_home/ui/state/home_empty_state.dart';
import 'package:taboola/module_home/ui/state/home_error_state.dart';
import 'package:taboola/module_home/ui/state/home_loaded_state.dart';
import 'package:taboola/module_home/ui/state/home_loading_state.dart';
import 'package:taboola/module_home/ui/state/home_state.dart';
import 'package:taboola/utils/helpers/custom_flushbar.dart';

@injectable
class HomeStateManager {
  final HomeService _homeService;

  HomeStateManager(this._homeService);

  PublishSubject<HomeState> stateSubject = PublishSubject<HomeState>();

  Stream<HomeState> get stateStream => stateSubject.stream;

  void getHomeData(HomeScreenState screenState) {
    stateSubject.add(HomeLoadingState(screenState));
    _homeService.getCategories().then((value){
      if (value.hasError){
        stateSubject.add(HomeErrorState(screenState,[value.error ?? '']));

      }
      else if (value.isEmpty){
        stateSubject.add(HomeEmptyState(screenState,S.current.homeDataEmpty));
      }
      else {
        CategoriesModel model  = value as CategoriesModel;
        stateSubject.add(HomeLoadedState(screenState,categories: model.data));
      }
    });
  }

  void createCategory(HomeScreenState screenState,CategoryRequest request) {
    _homeService.createCategory(request).then((value){
      if (value.hasError){
        CustomFlushBarHelper.createError(title: S.current.warnning, message: S.current.errorHappened).show(screenState.context);
      }
      else {
        getHomeData(screenState);
        CustomFlushBarHelper.createSuccess(title: S.current.warnning, message: S.current.categoryCreatedSuccessfully).show(screenState.context);
      }
    });
  }
}
