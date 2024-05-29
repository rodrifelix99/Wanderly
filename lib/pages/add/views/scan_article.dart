import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wanderly/components/button.dart';

class ScanArticle extends StatelessWidget {
  final CameraController controller;
  final void Function() onCapture;

  const ScanArticle({
    super.key,
    required this.controller,
    required this.onCapture,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: CameraPreview(
                controller,
            ),
          ),
          const SizedBox(height: 16.0),
          Button(
            onPressed: onCapture,
            borderRadius: BorderRadius.circular(16.0),
            icon: Icons.camera_alt_rounded,
            text: 'capture'.tr,
          ),
        ],
      ),
    );
  }
}
