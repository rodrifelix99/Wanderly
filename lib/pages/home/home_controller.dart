import 'dart:math';

import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:platform_maps_flutter/platform_maps_flutter.dart';
import 'package:wanderly/enums/activity_enum.dart';
import 'package:wanderly/routes.dart';
import 'package:wanderly/services/location_service.dart';
import 'package:wanderly/services/nearby_service.dart';
import 'package:wanderly/services/snackbar_service.dart';

class HomeController extends GetxController {
  final Logger _logger = Logger();
  final NearbyService _nearbyService = Get.find<NearbyService>();
  final LocationService _locationService = Get.find<LocationService>();
  final SnackBarService _snackBarService = SnackBarService();
  final RxBool showMap = false.obs;
  late PlatformMapController mapController;
  late final int selectedTitle;

  @override
  void onInit() {
    selectedTitle = Random().nextInt(10) + 1;
    checkPermissions();
    super.onInit();
  }

  Future<void> checkPermissions() async {
    await _checkLocationPermission();
  }

  Future<void> _checkLocationPermission() async {
    try {
      final isPermissionEnabled = await _locationService.isAllSettingsEnabled();
      if (!isPermissionEnabled) {
        Get.offAllNamed(Routes.LOCATION_PERMISSION);
      } else {
        centerMap();
      }
    } catch (e) {
      _logger.e(e);
      _snackBarService.showSnackBar(
        title: 'Location Permission',
        message: 'Error checking location permission',
      );
    }
  }

  Future<void> onMapCreated(PlatformMapController controller) async {
    mapController = controller;
  }

  Future<void> centerMap() async {
    final locationData = await _locationService.getLocation();
    if (locationData == null) {
      return _logger.e('Error getting location data');
    }
    showMap.value = true;
    Future.delayed(
      const Duration(milliseconds: 3000),
      () {
        mapController.animateCamera(
          CameraUpdate.newLatLngZoom(
            LatLng(locationData.latitude!, locationData.longitude!),
            15.0,
          ),
        );
      },
    );
  }

  Future<void> onActivitySelected(Activity activity) async {
    try {
      final locationData = await _locationService.getLocation();
      if (locationData == null) {
        return _logger.e('Error getting location data');
      }
      await _nearbyService.getNearbyPlaces(
        LatLng(locationData.latitude!, locationData.longitude!),
        radius: 1000,
        activity: activity,
      );
    } catch (e) {
      _logger.e(e);
      _snackBarService.showSnackBar(
        title: 'Nearby Places',
        message: 'Error getting nearby places',
      );
    }
  }
}