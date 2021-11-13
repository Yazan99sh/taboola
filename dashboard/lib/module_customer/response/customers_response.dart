class CustomersResponse {
  CustomersResponse({
      this.data,});

  CustomersResponse.fromJson(dynamic json) {
    if (json != null) {
      data = [];
      json.forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  List<Data>? data;

}

class Data {
  Data({
      this.user, 
      this.customerId, 
      this.profileImage, 
      this.role,});

  Data.fromJson(dynamic json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    customerId = json['customer_id'];
    profileImage = json['profile_image'];
    role = json['role'];
  }
  User? user;
  String? customerId;
  dynamic profileImage;
  String? role;

}

class User {
  User({
      this.id, 
      this.username, 
      this.email,});

  User.fromJson(dynamic json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
  }
  int? id;
  String? username;
  String? email;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['username'] = username;
    map['email'] = email;
    return map;
  }

}