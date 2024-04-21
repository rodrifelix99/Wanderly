import 'package:wanderly/models/category_id.dart';

class CategoryIds {
  CategoryId? categoryId;

  CategoryIds({this.categoryId});

  factory CategoryIds.fromJson(Map<String, dynamic> json) {
    return CategoryIds(
      categoryId: json['category_id'] != null ? CategoryId.fromJson(json['category_id']) : null,
    );
  }
}
