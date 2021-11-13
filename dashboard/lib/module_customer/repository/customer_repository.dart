import 'package:injectable/injectable.dart';
import 'package:taboola/consts/urls.dart';
import 'package:taboola/module_auth/service/auth_service/auth_service.dart';
import 'package:taboola/module_customer/response/customers_details_response.dart';
import 'package:taboola/module_customer/response/customers_response.dart';
import 'package:taboola/module_network/http_client/http_client.dart';

@injectable
class CustomerRepository {

  final ApiClient _apiClient;
  final AuthService _authService;
  CustomerRepository(this._apiClient,this._authService);

  Future<CustomersResponse?> getCustomers() async {
    var token = await _authService.getToken();
    dynamic response = await _apiClient.get(Urls.CUSTOMERS_API,headers: {'Authorization':'$token'});
    if (response == null) return null;
    return CustomersResponse.fromJson(response);
  }

  Future<CustomersDetailsResponse?> getCustomerDetails(String id) async {
    var token = await _authService.getToken();
    dynamic response = await _apiClient.get(Urls.CUSTOMER_DETAILS_API+'$id',headers: {'Authorization':'$token'});
    if (response == null) return null;
    return CustomersDetailsResponse.fromJson(response);
  }

}
