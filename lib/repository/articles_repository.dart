import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wanderly/models/article.dart';
import 'package:wanderly/repository/repository.dart';

class ArticlesRepository extends Repository<Article> {
  ArticlesRepository() {
    setup();
  }

  Future<void> setup() async {
    final appDocDirectory = await getApplicationDocumentsDirectory();
    final directory = appDocDirectory.path;
    isar = await Isar.open(
      [ArticleSchema],
      directory: directory,
    );
  }

  Future<void> create(Article model) async {
    await isar.writeTxn(() async {
      await isar.articles.put(model);
    });
  }

  Future<void> update(Article model) async {
    await isar.articles.put(model);
  }

  Future<void> delete(int id) async {
    await isar.writeTxn(() async {
      await isar.articles.delete(id);
    });
  }

  Future<List<Article>> readAll() async {
    return await isar.articles.where().findAll();
  }

  Future<Article?> readOne(int id) async {
    return await isar.articles.get(id);
  }

  Future<void> close() async {
    await isar.close();
  }
}