import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ImageService {

  static Future<File?> pickImage() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image == null) return null;
      return image.path.isEmpty ? null : File(image.path);
    } catch (e) {
      rethrow;
    }
  }
}