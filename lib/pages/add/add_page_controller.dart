import 'dart:io';

import 'package:camera/camera.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:wanderly/services/ai_service.dart';
import 'package:wanderly/services/image_service.dart';
import 'package:wanderly/services/snackbar_service.dart';

class AddPageController extends GetxController {
  final SnackBarService snackBarService = SnackBarService();
  final Logger _logger = Logger();
  final RxBool loading = true.obs;
  final SwiperController swiperController = SwiperController();
  final Rx<CameraController?> cameraController = Rx<CameraController?>(null);
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final RxString category = ''.obs;
  final RxList<String> subCategories = <String>[].obs;
  final RxString color = ''.obs;
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
    titleController.text = labels.first.label;
    category.value = labels.first.label;
    subCategories.value = labels.map((e) => e.label).toList();
    color.value = labels.first.label;
  }

  @override
  void onClose() {
    cameraController.value?.dispose();
    super.onClose();
  }
}
