import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:platform_maps_flutter/platform_maps_flutter.dart';
import 'package:wanderly/pages/home/home_controller.dart';
import 'package:wanderly/pages/home/views/activity_selector.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'app_name'.tr,
          style: Get.textTheme.titleLarge?.copyWith(
            color: Colors.white,
            fontSize: 32,
            shadows: [
              const Shadow(
                color: Colors.black26,
                offset: Offset(2, 2),
                blurRadius: 25,
              ),
            ],
          ),
        ),
        foregroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black54,
                Colors.transparent,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Positioned.fill(
            child: Obx(
              () => controller.isLoading.isTrue
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : FadeIn(
                      delay: const Duration(milliseconds: 500),
                      duration: const Duration(milliseconds: 1500),
                      curve: Curves.easeInOut,
                      child: Obx(
                        () => PlatformMap(
                          initialCameraPosition: const CameraPosition(
                            target: LatLng(0, 0),
                            zoom: 0.0,
                            tilt: 5.0,
                          ),
                          markers: controller.markers,
                          scrollGesturesEnabled: false,
                          zoomGesturesEnabled: false,
                          tiltGesturesEnabled: false,
                          rotateGesturesEnabled: controller.showMap.isTrue,
                          myLocationEnabled: true,
                          myLocationButtonEnabled: true,
                          compassEnabled: false,
                          zoomControlsEnabled: false,
                          onMapCreated: controller.onMapCreated,
                          padding: const EdgeInsets.only(
                            top: 100,
                            bottom: 300,
                          ),
                        ),
                      ),
                    ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 300,
              padding: const EdgeInsets.only(
                right: 16.0,
                left: 16.0,
                top: 32.0,
                bottom: 8.0,
              ),
              decoration: BoxDecoration(
                color: Get.theme.colorScheme.surface,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
                border: Get.isDarkMode
                    ? Border(
                        top: BorderSide(
                          color:
                              Get.theme.colorScheme.onSurface.withOpacity(0.1),
                        ),
                      )
                    : null,
                boxShadow: Get.isDarkMode
                    ? null
                    : [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          offset: const Offset(0, -2),
                          blurRadius: 4,
                        ),
                      ],
              ),
              child: const SafeArea(
                top: false,
                child: ActivitySelectorView(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
