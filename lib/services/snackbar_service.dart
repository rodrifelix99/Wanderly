import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class SnackBarService {
  final Logger _logger = Logger();
  void showSnackBar({
    required String title,
    required String message,
    ContentType? contentType,
  }) {
    try {
      contentType ??= ContentType.failure;
      final snackBar = GetSnackBar(
        title: title,
        message: message,
        borderRadius: 10,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        icon: contentType == ContentType.success
            ? const Icon(Icons.check_circle, color: Colors.white)
            : contentType == ContentType.warning
                ? const Icon(Icons.warning, color: Colors.white)
                : contentType == ContentType.failure
                    ? const Icon(Icons.error, color: Colors.white)
                    : const Icon(Icons.info, color: Colors.white),
        backgroundColor: Colors.black54,
        shouldIconPulse: true,
        barBlur: 20,
        isDismissible: true,
        duration: const Duration(seconds: 3),
        forwardAnimationCurve: Curves.easeOutBack,
        reverseAnimationCurve: Curves.easeInBack,
        animationDuration: const Duration(milliseconds: 500),
      );
      Get.showSnackbar(snackBar);
    } catch (e) {
      _logger.e(e);
    }
  }

}