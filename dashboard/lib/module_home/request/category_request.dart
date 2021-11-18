class CategoryRequest {
  CategoryRequest({
      this.categoryImage, 
      this.categoryName,this.categoryId});

  CategoryRequest.fromJson(dynamic json) {
    categoryImage = json['category_image'];
    categoryName = json['category_name'];
  }
  dynamic categoryImage;
  String? categoryName;
  String? categoryId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['category_image'] = categoryImage;
    map['category_name'] = categoryName;
    if (categoryId != null){
      map['categoryId'] = categoryId;
    }
    return map;
  }

}