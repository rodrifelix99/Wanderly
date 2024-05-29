import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';
import 'package:logger/logger.dart';
import 'package:wanderly/models/article.dart';
import 'package:wanderly/services/image_service.dart';
import 'package:wanderly/services/wardrobe_service.dart';

class AiTestPage extends StatefulWidget {
  const AiTestPage({super.key});

  @override
  State<AiTestPage> createState() => _AiTestPageState();
}

class _AiTestPageState extends State<AiTestPage> {
  final Logger _logger = Logger();
  final _wardrobeService = Get.find<WardrobeService>();
  File? image;
  String labels = '';
  CameraController? controller;
  late final List<CameraDescription> _cameras;

  @override
  void initState() {
    super.initState();
    setup();
  }

  Future<void> setup() async {
    _cameras = await availableCameras();
    controller = CameraController(_cameras[0], ResolutionPreset.max);
    controller!.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            _logger.e('The user did not grant the camera permission!');
            break;
          default:
            _logger.e('Error: ${e.code}');
            break;
        }
      }
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  Future<void> selectImage() async {
    final image = await ImageService.pickImage();
    if (image != null) {
      this.image = image;
      _computeImage(image);
    } else {
      Get.snackbar(
        'error'.tr,
        'error_subtitle'.tr,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> snapImage() async {
    final image = await controller!.takePicture();
    this.image = File(image.path);
    _computeImage(this.image!);
    }

  Future<void> _computeImage(File imageFile) async {
    try {
      final ImageLabelerOptions options = ImageLabelerOptions(confidenceThreshold: 0.5);
      final ImageLabeler imageLabeler = ImageLabeler(options: options);
      final InputImage inputImage = InputImage.fromFilePath(imageFile.path);
      final List<ImageLabel> labels = await imageLabeler.processImage(inputImage);
      this.labels = '';
      for (final ImageLabel label in labels) {
        setState(() {
          this.labels = '${this.labels}\n${label.label} (${label.confidence})';
        });
      }
      await _saveArticle(labels);
    } catch (e) {
      _logger.e(e);
      Get.snackbar(
        'error'.tr,
        'error_subtitle'.tr,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> _saveArticle(List<ImageLabel> labels) async {
    try {
      if (labels.isEmpty || image == null) {
        return;
      }
      final article = Article(
        imagePath: image!.path,
        title: labels.first.label,
        colorFamily: '',
        mainCategory: labels.first.label,
        subCategories: labels.map((e) => e.label).toList(),
      );
      await _wardrobeService.addArticle(article);
    } catch (e) {
      _logger.e(e);
      Get.snackbar(
        'error'.tr,
        'error_subtitle'.tr,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Test'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (controller != null) ...[
              CameraPreview(controller!),
              const SizedBox(height: 16.0),
            ],
            if (image != null) ...[
              Image.file(image!),
              const SizedBox(height: 16.0),
            ],
            Text(labels),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => controller != null ? snapImage() : selectImage(),
              child: const Text('Select Image'),
            ),
          ],
        ),
      ),
    );
  }
}
