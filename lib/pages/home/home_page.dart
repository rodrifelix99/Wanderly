import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wanderly/pages/ai/ai_test_page.dart';
import 'package:wanderly/pages/home/home_controller.dart';
import 'package:wanderly/routes.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wardrobe'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => Get.toNamed(Routes.ADD),
          ),
          IconButton(
            icon: const Icon(Icons.blur_circular_rounded),
            onPressed: () => Get.to(const AiTestPage()),
          ),
        ],
      ),
      body: Obx(() => RefreshIndicator(
          onRefresh: () => controller.getArticles(),
          child: ListView.builder(
            itemCount: controller.clothes.length,
            itemBuilder: (context, index) {
              final article = controller.clothes[index];
              return ListTile(
                leading: Image.file(article.image),
                title: Text(article.title),
                subtitle: Text(article.description ?? article.subCategories.join(', ')),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => controller.deleteArticle(article.id),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
