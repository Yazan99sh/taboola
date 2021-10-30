import 'package:injectable/injectable.dart';
import 'package:taboola/consts/urls.dart';
import 'package:taboola/module_auth/request/login_request/login_request.dart';
import 'package:taboola/module_auth/request/register_request/register_request.dart';
import 'package:taboola/module_auth/response/login_response/login_response.dart';
import 'package:taboola/module_auth/response/regester_response/regester_response.dart';
import 'package:taboola/module_network/http_client/http_client.dart';
import 'package:taboola/utils/logger/logger.dart';

@injectable
class AuthRepository {
  final ApiClient _apiClient;
  final Logger _logger;
  AuthRepository(this._apiClient, this._logger);

  Future<RegisterResponse?> createUser(RegisterRequest request) async {
    dynamic result = await _apiClient.post(
      Urls.SIGN_UP_API,
      request.toJson(),
    );
    if (result == null) return null;
    return RegisterResponse.fromJson(result);
  }

  Future<LoginResponse?> getToken(LoginRequest loginRequest) async {
    var result = await _apiClient.post(
      Urls.LOGIN_API,
      loginRequest.toJson(),
    );
    if (result == null) {
      return null;
    }
    return LoginResponse.fromJson(result);
  }

}
