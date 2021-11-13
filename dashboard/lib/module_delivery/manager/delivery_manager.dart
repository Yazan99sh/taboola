import 'package:injectable/injectable.dart';
import 'package:taboola/module_delivery/repository/delivery_repository.dart';
import 'package:taboola/module_delivery/response/delivery_operators_details_response.dart';
import 'package:taboola/module_delivery/response/delivery_operators_response.dart';

@injectable
class DeliveryManager {
  final DeliveryRepository _deliveryRepository;
  DeliveryManager(this._deliveryRepository);

  Future<DeliveryOperatorsResponse?> getDeliveryOperators() =>
      _deliveryRepository.getDeliveryOperators();

  Future<DeliveryOperatorsDetailsResponse?> getDeliveryOperatorDetails(String customerId) =>
      _deliveryRepository.getDeliveryOperatorDetails(customerId);

}
