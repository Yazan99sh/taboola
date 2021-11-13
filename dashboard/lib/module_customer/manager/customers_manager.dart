import 'package:injectable/injectable.dart';
import 'package:taboola/module_customer/repository/customer_repository.dart';
import 'package:taboola/module_customer/response/customers_details_response.dart';
import 'package:taboola/module_customer/response/customers_response.dart';

@injectable
class CustomersManager {
  final CustomerRepository _customerRepository;
  CustomersManager(this._customerRepository);

  Future<CustomersResponse?> getCustomers() =>
      _customerRepository.getCustomers();

  Future<CustomersDetailsResponse?> getCustomerDetails(String customerId) =>
      _customerRepository.getCustomerDetails(customerId);

}
