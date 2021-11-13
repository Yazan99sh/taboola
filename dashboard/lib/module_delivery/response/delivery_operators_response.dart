
class DeliveryOperatorsResponse {
  DeliveryOperatorsResponse({
      this.data,});

  DeliveryOperatorsResponse.fromJson(dynamic json) {
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
      this.deliveryOperatorId, 
      this.user, 
      this.createdAt, 
      this.points, 
      this.country, 
      this.profileImage, 
      this.online,});

  Data.fromJson(dynamic json) {
    deliveryOperatorId = json['delivery_operator_id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    createdAt = json['created_at'];
    points = json['points'];
    country = json['country'];
    profileImage = json['profile_image'];
    online = json['online'];
  }
  String? deliveryOperatorId;
  User? user;
  String? createdAt;
  double? points;
  String? country;
  String? profileImage;
  bool? online;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['delivery_operator_id'] = deliveryOperatorId;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['created_at'] = createdAt;
    map['points'] = points;
    map['country'] = country;
    map['profile_image'] = profileImage;
    map['online'] = online;
    return map;
  }

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