class CategoryId {
  String? categoryName;
  int? categoryGroup;

  CategoryId({this.categoryName, this.categoryGroup});

  factory CategoryId.fromJson(Map<String, dynamic> json) {
    return CategoryId(
      categoryName: json['category_name'],
      categoryGroup: json['category_group'],
    );
  }
}