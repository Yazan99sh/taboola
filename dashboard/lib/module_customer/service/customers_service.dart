import 'package:injectable/injectable.dart';
import 'package:taboola/abstracts/data_model/data_model.dart';
import 'package:taboola/generated/l10n.dart';
import 'package:taboola/module_customer/manager/customers_manager.dart';
import 'package:taboola/module_customer/model/customer_detail_model.dart';
import 'package:taboola/module_customer/model/customers_model.dart';
import 'package:taboola/module_customer/response/customers_details_response.dart';
import 'package:taboola/module_customer/response/customers_response.dart';
import 'package:taboola/module_home/model/categories_model.dart';
import 'package:taboola/utils/helpers/status_code_helper.dart';

@injectable
class CustomersService {
  final CustomersManager _customerManager;

  CustomersService(this._customerManager);

  Future<DataModel> getCustomer() async {
    CustomersResponse? customers = await _customerManager.getCustomers();
    if (customers == null) {
      return DataModel.withError(S.current.networkError);
    }
    if (customers.data == null) {
      return DataModel.withError(
          StatusCodeHelper.getStatusCodeMessages('0'));
    }
    return CustomersModel.withData(customers.data ?? []);
  }

  Future<DataModel> getCustomerDetails(String customerId) async {
    CustomersDetailsResponse? customer = await _customerManager.getCustomerDetails(customerId);
    if (customer == null) {
      return DataModel.withError(S.current.networkError);
    }
    if (customer.customer == null) {
      return DataModel.withError(
          StatusCodeHelper.getStatusCodeMessages('0'));
    }
    return CustomerDetailsModel.withData(customer.customer!);
  }

}
