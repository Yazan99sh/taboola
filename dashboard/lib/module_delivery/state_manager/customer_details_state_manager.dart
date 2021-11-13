import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:taboola/abstracts/states/error_state.dart';
import 'package:taboola/abstracts/states/loading_state.dart';
import 'package:taboola/abstracts/states/state.dart';
import 'package:taboola/module_customer/model/customer_detail_model.dart';
import 'package:taboola/module_customer/service/customers_service.dart';
import 'package:taboola/module_customer/ui/screen/customer_details_screen.dart';
import 'package:taboola/module_customer/ui/state/customer_details_loaded_state.dart';

@injectable
class CustomerDetailsStateManager {
  final CustomersService _customersService;

  CustomerDetailsStateManager(this._customersService);

  PublishSubject<States> stateSubject = PublishSubject<States>();

  Stream<States> get stateStream => stateSubject.stream;

  void getCustomerDetails(CustomerDetailsScreenState screenState,String customerId) {
    stateSubject.add(LoadingState(screenState));
    _customersService.getCustomerDetails(customerId).then((value){
      if (value.hasError){
        stateSubject.add(ErrorState(screenState,error: value.error, title: '',onPressed: (){
          getCustomerDetails(screenState,customerId);
        }));
      }
      else {
        CustomerDetailsModel model  = value as CustomerDetailsModel;
        stateSubject.add(CustomerDetailsLoadedState(screenState,customers: model.data));
      }
    });
  }

}
