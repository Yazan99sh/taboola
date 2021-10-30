class LoginResponse {
  LoginResponse({
      this.adminData,
      this.token,this.statusCode});

  LoginResponse.fromJson(dynamic json) {
    adminData = json['Admin Data'] != null ? AdminData.fromJson(json['Admin Data']) : null;
    token = json['token'];
    statusCode = json['status_code'];
  }
  AdminData? adminData;
  String? token;
  String? statusCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (adminData != null) {
      map['Admin Data'] = adminData?.toJson();
    }
    map['token'] = token;
    return map;
  }

}

class AdminData {
  AdminData({
      this.adminId, 
      this.user, 
      this.createdAt, 
      this.updatedAt, 
      this.profileImage, 
      this.country, 
      this.role,});

  AdminData.fromJson(dynamic json) {
    adminId = json['admin_id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    profileImage = json['profile_image'];
    country = json['country'];
    role = json['role'];
  }
  String? adminId;
  User? user;
  String? createdAt;
  String? updatedAt;
  String? profileImage;
  String? country;
  String? role;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['admin_id'] = adminId;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['profile_image'] = profileImage;
    map['country'] = country;
    map['role'] = role;
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