import 'package:taboola/abstracts/data_model/data_model.dart';
import 'package:taboola/module_customer/response/customers_response.dart';


class CustomersModel extends DataModel {
  late User user;
  late String customerId;
  String? profileImage;
  late String role;

  CustomersModel(
      {required this.user,
      required this.customerId,
      required this.profileImage,
      required this.role
      });

  CustomersModel.withData(List<Data> results) {
    results.forEach((element) {
      _customers.add(CustomersModel(
          user: User(id:element.user?.id ?? -1 ,username: element.user?.username ?? '',email: element.user?.email ?? ''),
          customerId: element.customerId ?? '',
          profileImage: element.profileImage ?? '',
          role: element.role ?? ''
      ));
    });
  }

  List <CustomersModel> _customers = [];

  List <CustomersModel> get data => _customers;
}
class User {
  int id;
  String username;
  String email;

  User({required this.id,required this.username,required this.email});
}
