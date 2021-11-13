import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:taboola/abstracts/states/error_state.dart';
import 'package:taboola/abstracts/states/loading_state.dart';
import 'package:taboola/abstracts/states/state.dart';
import 'package:taboola/module_customer/ui/state/customer_loaded_state.dart';
import 'package:taboola/module_delivery/model/delivery_operetors_model.dart';
import 'package:taboola/module_delivery/service/delivery_service.dart';
import 'package:taboola/module_delivery/ui/screen/operators_screen.dart';
import 'package:taboola/module_delivery/ui/state/delivery_loaded_state.dart';

@injectable
class DeliveryOperatorsStateManager {
  final DeliveryService _customersService;

  DeliveryOperatorsStateManager(this._customersService);

  PublishSubject<States> stateSubject = PublishSubject<States>();

  Stream<States> get stateStream => stateSubject.stream;

  void getOperators(DeliveryOperatorsScreenState screenState) {
    stateSubject.add(LoadingState(screenState));
    _customersService.getCustomer().then((value){
      if (value.hasError){
        stateSubject.add(ErrorState(screenState,error: value.error, title: '',onPressed: (){
          getOperators(screenState);
        },hasAppbar: true));
      }
      else {
        DeliveryOperatorsModel model  = value as DeliveryOperatorsModel;
        stateSubject.add(DeliveryOperatorsLoadedState(screenState,operators: model.data));
      }
    });
  }

}
