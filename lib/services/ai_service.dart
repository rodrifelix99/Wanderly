import 'dart:io';

import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';

class AiService {
  static Future<List<ImageLabel>> computeImage(File imageFile) async {
    try {
      final ImageLabelerOptions options = ImageLabelerOptions(confidenceThreshold: 0.5);
      final ImageLabeler imageLabeler = ImageLabeler(options: options);
      final InputImage inputImage = InputImage.fromFilePath(imageFile.path);
      final List<ImageLabel> labels = await imageLabeler.processImage(inputImage);
      return labels;
    } catch (e) {
      rethrow;
    }
  }
}