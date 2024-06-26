import 'dart:io';

import 'package:camera/camera.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:colornames/colornames.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:wanderly/enums/clothing.dart';
import 'package:wanderly/enums/main_categories.dart';
import 'package:wanderly/models/article.dart';
import 'package:wanderly/services/ai_service.dart';
import 'package:wanderly/services/image_service.dart';
import 'package:wanderly/services/snackbar_service.dart';
import 'package:wanderly/services/wardrobe_service.dart';

class AddPageController extends GetxController {
  final WardrobeService wardrobeService = Get.find<WardrobeService>();
  final SnackBarService snackBarService = SnackBarService();
  final Logger _logger = Logger();
  final RxBool loading = true.obs;
  final SwiperController swiperController = SwiperController();
  final Rx<CameraController?> cameraController = Rx<CameraController?>(null);
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final Rx<MainCategory> category = MainCategory.top.obs;
  final RxList<Clothing> subCategories = <Clothing>[].obs;
  final Rx<Color> color = Rx<Color>(const Color(0x00ffffff));
  final RxString colorFamily = 'white'.obs;
  File? image;

  @override
  Future<void> onInit() async {
    super.onInit();
    await setupCamera();
  }

  Future<void> setupCamera() async {
    try {
      final cameras = await availableCameras();
      final controller = CameraController(cameras[0], ResolutionPreset.max);
      await controller.initialize();
      cameraController.value = controller;
    } catch (e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            _logger.e('The user did not grant the camera permission!');
            break;
          default:
            _logger.e('Error: ${e.code}');
            break;
        }
      } else {
        _logger.e('Error: $e');
      }
      snackBarService.showSnackBar(
        title: 'error'.tr,
        message: 'error_subtitle'.tr,
      );
    } finally {
      loading.value = false;
    }
  }

  Future<void> onCapture({
    bool selectImage = false,
  }) async {
    if (cameraController.value != null &&
        cameraController.value!.value.isInitialized &&
        !cameraController.value!.value.isTakingPicture) {
      try {
        loading.value = true;
        final dynamic file = selectImage
            ? await ImageService.pickImage()
            : await cameraController.value!.takePicture();
        image = File(file.path);
        await swiperController.next();
        await _computeImage(image!);
      } catch (e) {
        _logger.e('Error: $e');
        snackBarService.showSnackBar(
          title: 'error'.tr,
          message: 'error_capture_image'.tr,
        );
      } finally {
        loading.value = false;
      }
    } else {
      _logger.e('Camera is not initialized or not available');
      snackBarService.showSnackBar(
        title: 'error'.tr,
        message: 'error_camera_not_available'.tr,
      );
    }
  }

  Future<void> _computeImage(File imageFile) async {

    await Future.delayed(const Duration(seconds: 5));
    final labels = await AiService.computeImage(imageFile);
    _logger.i(labels.map((e) => '${e.label} (${e.confidence})\n').toList());
    labels.sort((a, b) => b.confidence.compareTo(a.confidence));
    final String firstLabel = labels.first.label.toLowerCase();
    final Clothing clothing = Clothing.values.firstWhere(
      (element) => element.toString().split('.').last == firstLabel,
      orElse: () => Clothing.unknown,
    );
    titleController.text = labels.first.label;
    category.value = clothing.mainCategory;
    for (final label in labels) {
      final Clothing subCategory = Clothing.values.firstWhere(
        (element) => element.toString().split('.').last == label.label.toLowerCase(),
        orElse: () => Clothing.unknown,
      );
      if (subCategory != Clothing.unknown && !subCategories.contains(subCategory)) {
        subCategories.add(subCategory);
      }
    }
    final PaletteGenerator paletteGenerator = await PaletteGenerator.fromImageProvider(
      FileImage(imageFile),
    );
    color.value = paletteGenerator.dominantColor?.color ?? paletteGenerator.colors.first;
    colorFamily.value = color.value.colorName;
  }

  Future<void> onAddToWardrobe() async {
    try {
      loading.value = true;
      image = await ImageService.saveImage(image!);
      final Article article = Article(
        title: titleController.text,
        description: descriptionController.text,
        mainCategoryIsar: category.value.name,
        subCategoriesIsar: subCategories.map((e) => e.name).toList(),
        colorFamily: color.value.value,
        imagePath: image!.path,
      );
      await wardrobeService.addArticle(article);
      Get.back();
    } catch (e) {
      _logger.e('Error: $e');
      snackBarService.showSnackBar(
        title: 'error'.tr,
        message: 'error'.tr,
      );
    } finally {
      loading.value = false;
    }
  }

  @override
  void onClose() {
    cameraController.value?.dispose();
    super.onClose();
  }
}
