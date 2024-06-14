import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

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

  static Future<File> saveImage(File image) async {
    try {
      final Directory path = await getApplicationDocumentsDirectory();
      final String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      final File newImage = await image.copy('${path.path}/$fileName.jpg');
      return newImage;
    } catch (e) {
      rethrow;
    }
  }
}