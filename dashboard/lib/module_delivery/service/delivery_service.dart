import 'package:injectable/injectable.dart';
import 'package:taboola/abstracts/data_model/data_model.dart';
import 'package:taboola/generated/l10n.dart';
import 'package:taboola/module_delivery/manager/delivery_manager.dart';
import 'package:taboola/module_delivery/model/delivery_operetors_model.dart';
import 'package:taboola/module_delivery/response/delivery_operators_response.dart';
import 'package:taboola/utils/helpers/status_code_helper.dart';

@injectable
class DeliveryService {
  final DeliveryManager _customerManager;

  DeliveryService(this._customerManager);

  Future<DataModel> getCustomer() async {
    DeliveryOperatorsResponse? customers = await _customerManager.getDeliveryOperators();
    if (customers == null) {
      return DataModel.withError(S.current.networkError);
    }
    if (customers.data == null) {
      return DataModel.withError(
          StatusCodeHelper.getStatusCodeMessages('0'));
    }
    return DeliveryOperatorsModel.withData(customers.data ?? []);
  }

  // Future<DataModel> getCustomerDetails(String customerId) async {
  //   CustomersDetailsResponse? customer = await _customerManager.getCustomerDetails(customerId);
  //   if (customer == null) {
  //     return DataModel.withError(S.current.networkError);
  //   }
  //   if (customer.customer == null) {
  //     return DataModel.withError(
  //         StatusCodeHelper.getStatusCodeMessages('0'));
  //   }
  //   return CustomerDetailsModel.withData(customer.customer!);
  // }

}
