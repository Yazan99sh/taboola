import 'package:taboola/abstracts/data_model/data_model.dart';
import 'package:taboola/module_customer/response/customers_details_response.dart';

class CustomerDetailsModel extends DataModel {
  late UserDetails user;
  late String customerId;
  String? profileImage;
  late String role;
  Address? addresses;
  late double points;
  late String country;
  late String createdAt;
  late String updatedAt;

  CustomerDetailsModel(
      {required this.user,
      required this.customerId,
      required this.profileImage,
      required this.role,
      required this.createdAt,
      required this.addresses,
      required this.country,
      required this.points,
      required this.updatedAt});

  CustomerDetailsModel.withData(Customer element) {
    _customer = CustomerDetailsModel(
        user: UserDetails(
          id: element.user?.id ?? -1,
          username: element.user?.username ?? '',
          email: element.user?.email ?? '',
          firstName: element.user?.firstName ?? '',
          isStaff: element.user?.isStaff ?? false,
          dateJoined: element.user?.dateJoined ?? '',
          lastName: element.user?.lastName ?? '',
        ),
        customerId: element.customerId ?? '',
        profileImage: element.profileImage ?? '',
        role: element.role ?? '',
        country: element.country ?? '',
        points: element.points ?? 0.0,
        addresses: Address(
            buildingNo: element.addresses?[0].buildingNo ?? '',
            phoneNo: element.addresses?[0].phoneNo ?? '',
            street: element.addresses?[0].street ?? '',
            areaName: element.addresses?[0].areaName ?? ''),
        updatedAt: element.updatedAt ?? '',
        createdAt: element.createdAt ?? '');
  }

  late CustomerDetailsModel _customer;

  CustomerDetailsModel get data => _customer;
}

class UserDetails {
  int id;
  String username;
  String email;
  String firstName;
  String lastName;
  String dateJoined;
  bool isStaff;

  UserDetails(
      {required this.id,
      required this.username,
      required this.email,
      required this.dateJoined,
      required this.firstName,
      required this.isStaff,
      required this.lastName});
}

class Address {
  String areaName;
  String street;
  String buildingNo;
  String phoneNo;

  Address(
      {required this.areaName,
      required this.street,
      required this.buildingNo,
      required this.phoneNo});
}
