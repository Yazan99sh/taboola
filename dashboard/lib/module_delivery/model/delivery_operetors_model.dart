import 'package:taboola/abstracts/data_model/data_model.dart';
import 'package:taboola/module_delivery/response/delivery_operators_response.dart';

class DeliveryOperatorsModel extends DataModel {
  late String deliveryOperatorId;
  late User user;
  late String createdAt;
  late double points;
  late String country;
  late String profileImage;
  late bool online;

  DeliveryOperatorsModel(
      {required this.online,
      required this.points,
      required this.user,
      required this.profileImage,
      required this.createdAt,
      required this.country,
      required this.deliveryOperatorId});

  DeliveryOperatorsModel.withData(List<Data> results) {
    results.forEach((element) {
      _operators.add(DeliveryOperatorsModel(
          user: User(
              id: element.user?.id ?? -1,
              username: element.user?.username ?? '',
              email: element.user?.email ?? ''),
          deliveryOperatorId: element.deliveryOperatorId ?? '',
          profileImage: element.profileImage ?? '',
          country: element.country ?? '',
          online: element.online ?? false,
          points: element.points ?? 0.0,
          createdAt: element.createdAt ?? ''));
    });
  }

  List<DeliveryOperatorsModel> _operators = [];

  List<DeliveryOperatorsModel> get data => _operators;
}

class User {
  int id;
  String username;
  String email;

  User({required this.id, required this.username, required this.email});
}
