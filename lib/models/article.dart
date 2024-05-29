import 'dart:io';

import 'package:isar/isar.dart';

part 'article.g.dart';

@Collection()
class Article {
  Id id = Isar.autoIncrement;
  final String imagePath;
  final String title;
  final String? description;
  final String colorFamily;
  final String mainCategory;
  final List<String> subCategories;
  final DateTime createdAt = DateTime.now();

  Article({
    required this.imagePath,
    required this.title,
    this.description,
    required this.colorFamily,
    required this.mainCategory,
    required this.subCategories,
  });

  @ignore
  File get image => File(imagePath);

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      imagePath: json['imagePath'],
      title: json['title'],
      description: json['description'],
      colorFamily: json['colorFamily'],
      mainCategory: json['mainCategory'],
      subCategories: List<String>.from(json['subCategories']),
    );
  }
}