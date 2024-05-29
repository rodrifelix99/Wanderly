import 'package:get/get.dart';
import 'package:wanderly/models/article.dart';
import 'package:wanderly/repository/articles_repository.dart';

class WardrobeService extends GetxService {
  final ArticlesRepository _articlesRepository = ArticlesRepository();

  Future<List<Article>> getArticles() async {
    return await _articlesRepository.readAll();
  }

  Future<void> addArticle(Article article) async {
    await _articlesRepository.create(article);
  }

  Future<void> updateArticle(Article article) async {
    await _articlesRepository.update(article);
  }

  Future<void> deleteArticle(int id) async {
    await _articlesRepository.delete(id);
  }

  Future<Article?> getArticle(int id) async {
    return await _articlesRepository.readOne(id);
  }
}