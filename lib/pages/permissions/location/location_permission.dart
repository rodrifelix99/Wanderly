import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wanderly/pages/permissions/permissions_controller.dart';

class LocationPermissionPage extends GetView<PermissionsController> {
  const LocationPermissionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('location_permission'.tr),
      ),
      body: Stack(
        children: [
          Positioned(
            bottom: -Get.width * 0.5,
            right: -Get.width * 0.25,
            child: Icon(
              Icons.map_rounded,
              color: Get.theme.primaryColor.withOpacity(0.1),
              size: Get.width * 1.5,
            ),
          ),
          Positioned.fill(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32.0,
                  vertical: 16.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Spacer(),
                    Icon(
                      Icons.map_rounded,
                      size: Get.width / 3,
                    ),
                    const SizedBox(height: 32.0),
                    Text(
                      'location_permission_title'.tr,
                      textAlign: TextAlign.center,
                      style: Get.textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'location_permission_message'.tr,
                      textAlign: TextAlign.center,
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        controller.requestLocationPermission();
                      },
                      child: Text('location_permission_request'.tr),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
