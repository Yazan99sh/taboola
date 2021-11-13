class CustomersDetailsResponse {
  CustomersDetailsResponse({
      this.customer, 
      this.orders,});

  CustomersDetailsResponse.fromJson(dynamic json) {
    customer = json['customer'] != null ? Customer.fromJson(json['customer']) : null;
    if (json['orders'] != null) {
      orders = [];
      // json['orders'].forEach((v) {
      //   orders?.add(dynamic.fromJson(v));
      // });
    }
  }
  Customer? customer;
  List<dynamic>? orders;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (customer != null) {
      map['customer'] = customer?.toJson();
    }
    if (orders != null) {
      map['orders'] = orders?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Customer {
  Customer({
      this.customerId, 
      this.user, 
      this.addresses, 
      this.points, 
      this.country, 
      this.createdAt, 
      this.updatedAt, 
      this.profileImage, 
      this.role,});

  Customer.fromJson(dynamic json) {
    customerId = json['customer_id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    if (json['addresses'] != null) {
      addresses = [];
      json['addresses'].forEach((v) {
        addresses?.add(Addresses.fromJson(v));
      });
    }
    points = json['points'];
    country = json['country'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    profileImage = json['profile_image'];
    role = json['role'];
  }
  String? customerId;
  User? user;
  List<Addresses>? addresses;
  double? points;
  String? country;
  String? createdAt;
  String? updatedAt;
  dynamic profileImage;
  String? role;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['customer_id'] = customerId;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    if (addresses != null) {
      map['addresses'] = addresses?.map((v) => v.toJson()).toList();
    }
    map['points'] = points;
    map['country'] = country;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['profile_image'] = profileImage;
    map['role'] = role;
    return map;
  }

}

class Addresses {
  Addresses({
      this.areaName, 
      this.street, 
      this.buildingNo, 
      this.phoneNo,});

  Addresses.fromJson(dynamic json) {
    areaName = json['area_name'];
    street = json['street'];
    buildingNo = json['building_no'];
    phoneNo = json['phone_no'];
  }
  String? areaName;
  String? street;
  String? buildingNo;
  String? phoneNo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['area_name'] = areaName;
    map['street'] = street;
    map['building_no'] = buildingNo;
    map['phone_no'] = phoneNo;
    return map;
  }

}

class User {
  User({
      this.id, 
      this.username, 
      this.email, 
      this.firstName, 
      this.lastName, 
      this.dateJoined, 
      this.isStaff,});

  User.fromJson(dynamic json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    dateJoined = json['date_joined'];
    isStaff = json['is_staff'];
  }
  int? id;
  String? username;
  String? email;
  String? firstName;
  String? lastName;
  String? dateJoined;
  bool? isStaff;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['username'] = username;
    map['email'] = email;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['date_joined'] = dateJoined;
    map['is_staff'] = isStaff;
    return map;
  }

}