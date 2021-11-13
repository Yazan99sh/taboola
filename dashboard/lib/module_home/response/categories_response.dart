class CategoriesResponse {
  CategoriesResponse({
      this.count, 
      this.next, 
      this.previous, 
      this.results,});

  CategoriesResponse.fromJson(dynamic json) {
    if (json != null) {
      results = [];
      json.forEach((v) {
        results?.add(Results.fromJson(v));
      });
    }
  }
  dynamic count;
  dynamic next;
  dynamic previous;
  List<Results>? results;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    map['next'] = next;
    map['previous'] = previous;
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Results {
  Results({
      this.categoryId, 
      this.categoryName, 
      this.categoryImage,});

  Results.fromJson(dynamic json) {
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