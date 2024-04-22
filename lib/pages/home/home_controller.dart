import 'dart:math';

import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:platform_maps_flutter/platform_maps_flutter.dart';
import 'package:wanderly/components/activity_list.dart';
import 'package:wanderly/components/home_page_button.dart';
import 'package:wanderly/enums/activity_enum.dart';
import 'package:wanderly/models/feature.dart';
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
  final RxBool isLoading = false.obs;
  final RxList<HomePageButton> homePageButtons = <HomePageButton>[].obs;
  final RxSet<Marker> markers = <Marker>{}.obs;

  @override
  void onInit() {
    isLoading.value = true;
    selectedTitle = Random().nextInt(10) + 1;
    _checkPermissions();
    _buildHomePageButtons();
    super.onInit();
  }

  Future<void> _checkPermissions() async {
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
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> onMapCreated(PlatformMapController controller) async {
    mapController = controller;
    centerMap();
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

  Future<void> onActivitySelected(Activity activity, {
    int radius = 1000,
  }) async {
    try {
      isLoading.value = true;
      markers.clear();
      final locationData = await _locationService.getLocation();
      final lat = locationData?.latitude;
      final lng = locationData?.longitude;
      if (lat == null || lng == null) {
        return _logger.e('Error getting location data');
      }
      final points = await _nearbyService.getNearbyPlaces(
        LatLng(lat, lng),
        radius: radius,
        activity: activity,
      );

      if (points.isEmpty && radius >= 2000) {
        _snackBarService.showSnackBar(
          title: 'error'.tr,
          message: 'no_places_found'.tr,
        );
        return;
      } else if (points.isEmpty) {
        return onActivitySelected(activity, radius: radius + 1000);
      }

      markers.assignAll(
        points.map(
          (e) => _toMarker(e),
        ),
      );
    } catch (e) {
      _logger.e(e);
      _snackBarService.showSnackBar(
        title: 'error'.tr,
        message: 'error_subtitle'.tr,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Marker _toMarker(Feature feature) {
    return Marker(
      markerId: MarkerId(feature.featureProperties.osmId.toString()),
      position: LatLng(
        feature.geometry.coordinates[1],
        feature.geometry.coordinates[0],
      ),
      infoWindow: InfoWindow(
        title: feature.featureProperties.name,
        snippet: _locationService.distanceBetween(
          feature.geometry.coordinates[1],
          feature.geometry.coordinates[0],
        ),
      ),
    );
  }

  void _buildHomePageButtons() {
    // load 3 home page buttons based on time and day of the week
    final now = DateTime.now();
    final day = now.weekday;
    final hour = now.hour;
    Set<Activity> allActivities = Activity.values.toSet();
    allActivities.removeWhere((element) => element == Activity.other);

    if (day != DateTime.saturday && day != DateTime.friday) {
      allActivities.removeWhere((element) => element == Activity.party);
      if (hour < 12) {
        allActivities.removeWhere((element) => element == Activity.music);
      } else if (hour < 18 && hour >= 14) {
        allActivities.removeWhere((element) => element == Activity.food);
      } else {
        allActivities.removeWhere((element) => element == Activity.culture);
      }
    } else {
      allActivities.removeWhere((element) => element == Activity.knowledge);
    }

    final res = allActivities
        .map(
          (activity) => HomePageButton(
            onPressed: () => onActivitySelected(activity),
            text: activity.tr(),
            icon: activity.icon,
          ),
        )
        .toList();
    res.shuffle();

    homePageButtons.assignAll(res.length > 3 ? res.sublist(0, 3) : res);
  }

  void showBottomSheet() {
    Get.bottomSheet(
      ActivityList(
        onTap: (activity) {
          Get.back();
          onActivitySelected(activity);
        },
      ),
      backgroundColor: Get.theme.scaffoldBackgroundColor,
    );
  }
}
