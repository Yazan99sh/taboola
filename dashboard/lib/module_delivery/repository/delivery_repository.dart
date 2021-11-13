import 'package:injectable/injectable.dart';
import 'package:taboola/consts/urls.dart';
import 'package:taboola/module_auth/service/auth_service/auth_service.dart';
import 'package:taboola/module_delivery/response/delivery_operators_details_response.dart';
import 'package:taboola/module_delivery/response/delivery_operators_response.dart';
import 'package:taboola/module_network/http_client/http_client.dart';

@injectable
class DeliveryRepository {

  final ApiClient _apiClient;
  final AuthService _authService;
  DeliveryRepository(this._apiClient,this._authService);

  Future<DeliveryOperatorsResponse?> getDeliveryOperators() async {
    var token = await _authService.getToken();
    dynamic response = await _apiClient.get(Urls.DELIVERY_OPERATORS_API,headers: {'Authorization':'$token'});
    if (response == null) return null;
    return DeliveryOperatorsResponse.fromJson(response);
  }

  Future<DeliveryOperatorsDetailsResponse?> getDeliveryOperatorDetails(String id) async {
    var token = await _authService.getToken();
    dynamic response = await _apiClient.get(Urls.DELIVERY_OPERATOR_DETAILS_API+'$id',headers: {'Authorization':'$token'});
    if (response == null) return null;
    return DeliveryOperatorsDetailsResponse.fromJson(response);
  }

}
