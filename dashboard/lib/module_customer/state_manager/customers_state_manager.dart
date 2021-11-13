import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:taboola/abstracts/states/error_state.dart';
import 'package:taboola/abstracts/states/loading_state.dart';
import 'package:taboola/abstracts/states/state.dart';
import 'package:taboola/module_customer/model/customers_model.dart';
import 'package:taboola/module_customer/service/customers_service.dart';
import 'package:taboola/module_customer/ui/screen/customers_screen.dart';
import 'package:taboola/module_customer/ui/state/customer_loaded_state.dart';
import 'package:taboola/module_home/model/categories_model.dart';
import 'package:taboola/module_home/service/home_service.dart';
import 'package:taboola/module_home/ui/screen/home_screen.dart';
import 'package:taboola/module_home/ui/state/home_error_state.dart';
import 'package:taboola/module_home/ui/state/home_loaded_state.dart';

@injectable
class CustomersStateManager {
  final CustomersService _customersService;

  CustomersStateManager(this._customersService);

  PublishSubject<States> stateSubject = PublishSubject<States>();

  Stream<States> get stateStream => stateSubject.stream;

  void getCustomers(CustomersScreenState screenState) {
    stateSubject.add(LoadingState(screenState));
    _customersService.getCustomer().then((value){
      if (value.hasError){
        stateSubject.add(ErrorState(screenState,error: value.error, title: '',onPressed: (){
          getCustomers(screenState);
        }));
      }
      else {
        CustomersModel model  = value as CustomersModel;
        stateSubject.add(CustomersLoadedState(screenState,customers: model.data));
      }
    });
  }

}
