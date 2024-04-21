import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:platform_maps_flutter/platform_maps_flutter.dart';
import 'package:wanderly/components/home_page_button.dart';
import 'package:wanderly/enums/activity_enum.dart';
import 'package:wanderly/pages/home/home_controller.dart';

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
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Obx(
              () => FadeIn(
                delay: const Duration(milliseconds: 500),
                duration: const Duration(milliseconds: 1500),
                curve: Curves.easeInOut,
                child: PlatformMap(
                  initialCameraPosition: const CameraPosition(
                    target: LatLng(0, 0),
                    zoom: 0.0,
                    tilt: 5.0,
                  ),
                  markers: <Marker>{
                    Marker(
                      markerId: MarkerId('marker_1'),
                      position: const LatLng(47.6, 8.8796),
                      consumeTapEvents: true,
                      infoWindow: const InfoWindow(
                        title: 'PlatformMarker',
                        snippet: "Hi I'm a Platform Marker",
                      ),
                      onTap: () {
                        print("Marker tapped");
                      },
                    ),
                  },
                  scrollGesturesEnabled: controller.showMap.isTrue,
                  zoomGesturesEnabled: controller.showMap.isTrue,
                  tiltGesturesEnabled: controller.showMap.isTrue,
                  rotateGesturesEnabled: controller.showMap.isTrue,
                  myLocationEnabled: true,
                  myLocationButtonEnabled: false,
                  compassEnabled: false,
                  onMapCreated: controller.onMapCreated,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.only(
                right: 16.0,
                left: 16.0,
                top: 32.0,
                bottom: 8.0,
              ),
              decoration: BoxDecoration(
                color: Get.theme.colorScheme.surface,
                border: Get.isDarkMode ? Border(
                  top: BorderSide(
                    color: Get.theme.colorScheme.onSurface.withOpacity(0.1),
                  ),
                ) : null,
                boxShadow: Get.isDarkMode ? null : [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: const Offset(0, -2),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: SafeArea(
                top: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'home_page_title_${controller.selectedTitle}'.tr,
                      style: Get.textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 16.0),
                    Expanded(
                      child: Row(
                        children: [
                          HomePageButton(
                            onPressed: () => controller.onActivitySelected(Activity.party),
                            text: Activity.party.tr(),
                            icon: Icons.people_alt_rounded,
                          ),
                          const SizedBox(width: 8.0),
                          HomePageButton(
                            onPressed: () {},
                            text: Activity.food.tr(),
                            icon: Icons.restaurant_rounded,
                          ),
                          const SizedBox(width: 8.0),
                          HomePageButton(
                            onPressed: () {},
                            text: Activity.culture.tr(),
                            icon: Icons.brush_rounded,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    HomePageButton(
                      expanded: false,
                      onPressed: () {},
                      padding: const EdgeInsets.symmetric(
                        vertical: 16.0,
                      ),
                      text: 'more_activities'.tr,
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
