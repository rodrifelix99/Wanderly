import 'dart:io';

import 'package:isar/isar.dart';
import 'package:wanderly/enums/clothing.dart';
import 'package:wanderly/enums/main_categories.dart';

part 'article.g.dart';

@Collection()
class Article {
  Id id = Isar.autoIncrement;
  final String imagePath;
  final String title;
  final String? description;
  final String colorFamily;
  final String mainCategoryIsar;
  final List<String> subCategoriesIsar;
  final DateTime createdAt = DateTime.now();

  Article({
    required this.imagePath,
    required this.title,
    this.description,
    required this.colorFamily,
    required this.mainCategoryIsar,
    required this.subCategoriesIsar,
  });

  @ignore
  File get image => File(imagePath);
  @ignore
  MainCategory get mainCategory => MainCategory.values.firstWhere((e) => e.toString() == mainCategoryIsar);
  @ignore
  List<Clothing> get subCategories => subCategoriesIsar.map((e) => Clothing.values.firstWhere((c) => c.toString() == e)).toList();

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      imagePath: json['imagePath'],
      title: json['title'],
      description: json['description'],
      colorFamily: json['colorFamily'],
      mainCategoryIsar: json['mainCategory'],
      subCategoriesIsar: List<String>.from(json['subCategories']),
    );
  }
}