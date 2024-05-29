import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wanderly/pages/add/add_page_controller.dart';
import 'package:wanderly/pages/add/views/create_article.dart';
import 'package:wanderly/pages/add/views/scan_article.dart';

class AddPage extends GetView<AddPageController> {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('add_page_title'.tr),
      ),
      body: Swiper(
        controller: controller.swiperController,
        loop: false,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 3,
        itemBuilder: (context, index) {
          switch (index) {
            case 0:
              return Obx(
                () => controller.cameraController.value != null &&
                        controller.loading.isFalse
                    ? ScanArticle(
                        controller: controller.cameraController.value!,
                        onCapture: () =>
                            controller.onCapture(selectImage: false),
                      )
                    : const Center(
                        child: CircularProgressIndicator(),
                      ),
              );
            case 1:
              return Obx(
                () => CreateArticle(
                  image: controller.image!,
                  isScanning: controller.loading.isTrue,
                  onGoBack: () => controller.swiperController.previous(),
                  titleController: controller.titleController,
                  descriptionController: controller.descriptionController,
                  selectedCategory: controller.category.value,
                  onCategoryChanged: (value) => controller.category.value = value ?? '',
                  selectedSubCategories: controller.subCategories,
                  onSubCategoryChanged: (value) => controller.subCategories.assignAll(value),
                  selectedColor: controller.color.value,
                  onColorChanged: (value) => controller.color.value = value,
                ),
              );
            case 2:
              return Container(
                color: Colors.blue,
                child: const Center(
                  child: Text('Page 3'),
                ),
              );
            default:
              return Container();
          }
        },
      ),
    );
  }
}
