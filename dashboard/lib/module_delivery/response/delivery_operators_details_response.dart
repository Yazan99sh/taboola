class DeliveryOperatorsDetailsResponse {
  DeliveryOperatorsDetailsResponse({
      this.deliveryOperator, 
      this.deliveries,});

  DeliveryOperatorsDetailsResponse.fromJson(dynamic json) {
    deliveryOperator = json['delivery_operator'] != null ? Delivery_operator.fromJson(json['deliveryOperator']) : null;
    if (json['deliveries'] != null) {
      deliveries = [];
      json['deliveries'].forEach((v) {
        deliveries?.add(Deliveries.fromJson(v));
      });
    }
  }
  Delivery_operator? deliveryOperator;
  List<Deliveries>? deliveries;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (deliveryOperator != null) {
      map['delivery_operator'] = deliveryOperator?.toJson();
    }
    if (deliveries != null) {
      map['deliveries'] = deliveries?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Deliveries {
  Deliveries({
      this.deliveryId, 
      this.deliveryOperator, 
      this.order, 
      this.orderBackup, 
      this.deliveryReport, 
      this.deliveryProblemReportChoice, 
      this.isDelivered, 
      this.isBeingDelivered, 
      this.city, 
      this.location, 
      this.lang, 
      this.lat,});

  Deliveries.fromJson(dynamic json) {
    deliveryId = json['delivery_id'];
    deliveryOperator = json['delivery_operator'] != null ? Delivery_operator.fromJson(json['deliveryOperator']) : null;
    order = json['order'] != null ? Order.fromJson(json['order']) : null;
    orderBackup = json['order_backup'] != null ? Order_backup.fromJson(json['orderBackup']) : null;
    deliveryReport = json['delivery_report'];
    deliveryProblemReportChoice = json['delivery_problem_report_choice'];
    isDelivered = json['is_delivered'];
    isBeingDelivered = json['is_being_delivered'];
    city = json['city'];
    location = json['location'];
    lang = json['lang'];
    lat = json['lat'];
  }
  String? deliveryId;
  Delivery_operator? deliveryOperator;
  Order? order;
  Order_backup? orderBackup;
  String? deliveryReport;
  String? deliveryProblemReportChoice;
  bool? isDelivered;
  bool? isBeingDelivered;
  String? city;
  String? location;
  String? lang;
  String? lat;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['delivery_id'] = deliveryId;
    if (deliveryOperator != null) {
      map['delivery_operator'] = deliveryOperator?.toJson();
    }
    if (order != null) {
      map['order'] = order?.toJson();
    }
    if (orderBackup != null) {
      map['order_backup'] = orderBackup?.toJson();
    }
    map['delivery_report'] = deliveryReport;
    map['delivery_problem_report_choice'] = deliveryProblemReportChoice;
    map['is_delivered'] = isDelivered;
    map['is_being_delivered'] = isBeingDelivered;
    map['city'] = city;
    map['location'] = location;
    map['lang'] = lang;
    map['lat'] = lat;
    return map;
  }

}

class Order_backup {
  Order_backup({
      this.cartItems,});

  Order_backup.fromJson(dynamic json) {
    if (json['cart_items'] != null) {
      cartItems = [];
      json['cart_items'].forEach((v) {
        cartItems?.add(Cart_items.fromJson(v));
      });
    }
  }
  List<Cart_items>? cartItems;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (cartItems != null) {
      map['cart_items'] = cartItems?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Cart_items {
  Cart_items({
      this.cartItemId, 
      this.meal, 
      this.quantity, 
      this.cartItemOwner,});

  Cart_items.fromJson(dynamic json) {
    cartItemId = json['cart_item_id'];
    meal = json['meal'] != null ? Meal.fromJson(json['meal']) : null;
    quantity = json['quantity'];
    cartItemOwner = json['cart_item_owner'];
  }
  String? cartItemId;
  Meal? meal;
  int? quantity;
  String? cartItemOwner;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cart_item_id'] = cartItemId;
    if (meal != null) {
      map['meal'] = meal?.toJson();
    }
    map['quantity'] = quantity;
    map['cart_item_owner'] = cartItemOwner;
    return map;
  }

}

class Meal {
  Meal({
      this.mealId, 
      this.mealCategory, 
      this.mealProperties, 
      this.mealIngredients, 
      this.mealName, 
      this.mealDescription, 
      this.customerMealPrice, 
      this.supermarketMealPrice, 
      this.agentMealPrice, 
      this.restaurantMealPrice, 
      this.companyMealPrice, 
      this.mealPoints, 
      this.mealRating,});

  Meal.fromJson(dynamic json) {
    mealId = json['meal_id'];
    mealCategory = json['meal_category'] != null ? Meal_category.fromJson(json['mealCategory']) : null;
    if (json['meal_properties'] != null) {
      mealProperties = [];
      json['meal_properties'].forEach((v) {
        mealProperties?.add(Meal_properties.fromJson(v));
      });
    }
    if (json['meal_ingredients'] != null) {
      mealIngredients = [];
      json['meal_ingredients'].forEach((v) {
        mealIngredients?.add(Meal_ingredients.fromJson(v));
      });
    }
    mealName = json['meal_name'];
    mealDescription = json['meal_description'];
    customerMealPrice = json['customer_meal_price'];
    supermarketMealPrice = json['supermarket_meal_price'];
    agentMealPrice = json['agent_meal_price'];
    restaurantMealPrice = json['restaurant_meal_price'];
    companyMealPrice = json['company_meal_price'];
    mealPoints = json['meal_points'];
    mealRating = json['meal_rating'];
  }
  String? mealId;
  Meal_category? mealCategory;
  List<Meal_properties>? mealProperties;
  List<Meal_ingredients>? mealIngredients;
  String? mealName;
  String? mealDescription;
  int? customerMealPrice;
  int? supermarketMealPrice;
  int? agentMealPrice;
  int? restaurantMealPrice;
  int? companyMealPrice;
  double? mealPoints;
  double? mealRating;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['meal_id'] = mealId;
    if (mealCategory != null) {
      map['meal_category'] = mealCategory?.toJson();
    }
    if (mealProperties != null) {
      map['meal_properties'] = mealProperties?.map((v) => v.toJson()).toList();
    }
    if (mealIngredients != null) {
      map['meal_ingredients'] = mealIngredients?.map((v) => v.toJson()).toList();
    }
    map['meal_name'] = mealName;
    map['meal_description'] = mealDescription;
    map['customer_meal_price'] = customerMealPrice;
    map['supermarket_meal_price'] = supermarketMealPrice;
    map['agent_meal_price'] = agentMealPrice;
    map['restaurant_meal_price'] = restaurantMealPrice;
    map['company_meal_price'] = companyMealPrice;
    map['meal_points'] = mealPoints;
    map['meal_rating'] = mealRating;
    return map;
  }

}

class Meal_ingredients {
  Meal_ingredients({
      this.ingredientName,});

  Meal_ingredients.fromJson(dynamic json) {
    ingredientName = json['ingredient_name'];
  }
  String? ingredientName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ingredient_name'] = ingredientName;
    return map;
  }

}

class Meal_properties {
  Meal_properties({
      this.propertyId, 
      this.propertyName, 
      this.propertyFor, 
      this.meal,});

  Meal_properties.fromJson(dynamic json) {
    propertyId = json['property_id'];
    propertyName = json['property_name'];
    propertyFor = json['property_for'];
    meal = json['meal'];
  }
  String? propertyId;
  String? propertyName;
  String? propertyFor;
  String? meal;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['property_id'] = propertyId;
    map['property_name'] = propertyName;
    map['property_for'] = propertyFor;
    map['meal'] = meal;
    return map;
  }

}

class Meal_category {
  Meal_category({
      this.categoryId, 
      this.categoryName, 
      this.categoryImage,});

  Meal_category.fromJson(dynamic json) {
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    categoryImage = json['category_image'];
  }
  String? categoryId;
  String? categoryName;
  String? categoryImage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['category_id'] = categoryId;
    map['category_name'] = categoryName;
    map['category_image'] = categoryImage;
    return map;
  }

}

class Order {
  Order({
      this.orderedAt, 
      this.cart, 
      this.payHome, 
      this.paymentType, 
      this.lang, 
      this.lat, 
      this.bill,});

  Order.fromJson(dynamic json) {
    orderedAt = json['ordered_at'];
    cart = json['cart'] != null ? Cart.fromJson(json['cart']) : null;
    payHome = json['pay_home'];
    paymentType = json['payment_type'];
    lang = json['lang'];
    lat = json['lat'];
    bill = json['bill'];
  }
  String? orderedAt;
  Cart? cart;
  bool? payHome;
  dynamic paymentType;
  String? lang;
  String? lat;
  int? bill;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ordered_at'] = orderedAt;
    if (cart != null) {
      map['cart'] = cart?.toJson();
    }
    map['pay_home'] = payHome;
    map['payment_type'] = paymentType;
    map['lang'] = lang;
    map['lat'] = lat;
    map['bill'] = bill;
    return map;
  }

}

class Cart {
  Cart({
      this.cartId, 
      this.cartItems, 
      this.cartOwner,});

  Cart.fromJson(dynamic json) {
    cartId = json['cart_id'];
    if (json['cart_items'] != null) {
      cartItems = [];
      json['cart_items'].forEach((v) {
        cartItems?.add(Cart_items.fromJson(v));
      });
    }
    cartOwner = json['cart_owner'];
  }
  String? cartId;
  List<Cart_items>? cartItems;
  String? cartOwner;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cart_id'] = cartId;
    if (cartItems != null) {
      map['cart_items'] = cartItems?.map((v) => v.toJson()).toList();
    }
    map['cart_owner'] = cartOwner;
    return map;
  }

}

class Delivery_operator {
  Delivery_operator({
      this.deliveryOperatorId, 
      this.user, 
      this.points, 
      this.online, 
      this.profileImage,});

  Delivery_operator.fromJson(dynamic json) {
    deliveryOperatorId = json['delivery_operator_id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    points = json['points'];
    online = json['online'];
    profileImage = json['profile_image'];
  }
  String? deliveryOperatorId;
  User? user;
  double? points;
  bool? online;
  String? profileImage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['delivery_operator_id'] = deliveryOperatorId;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['points'] = points;
    map['online'] = online;
    map['profile_image'] = profileImage;
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

// class Delivery_operator {
//   Delivery_operator({
//       this.deliveryOperatorId,
//       this.user,
//       this.points,
//       this.online,
//       this.profileImage,});
//
//   Delivery_operator.fromJson(dynamic json) {
//     deliveryOperatorId = json['delivery_operator_id'];
//     user = json['user'] != null ? User.fromJson(json['user']) : null;
//     points = json['points'];
//     online = json['online'];
//     profileImage = json['profile_image'];
//   }
//   String? deliveryOperatorId;
//   User? user;
//   double? points;
//   bool? online;
//   String? profileImage;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['delivery_operator_id'] = deliveryOperatorId;
//     if (user != null) {
//       map['user'] = user?.toJson();
//     }
//     map['points'] = points;
//     map['online'] = online;
//     map['profile_image'] = profileImage;
//     return map;
//   }
//
// }