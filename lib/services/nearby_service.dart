import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:platform_maps_flutter/platform_maps_flutter.dart';
import 'package:wanderly/api/map_api.dart';
import 'package:wanderly/enums/activity_enum.dart';

class NearbyService extends GetxService {
  final Logger _logger = Logger();

  Future<void> getNearbyPlaces(LatLng coords, {
    required int radius,
    required Activity activity,
  }) async {
    try {
      // Create boundBox based on radius (radius is in meters)
      final boundBox = LatLngBounds(
        southwest: LatLng(
          coords.latitude - (radius / 111111),
          coords.longitude - (radius / 111111),
        ),
        northeast: LatLng(
          coords.latitude + (radius / 111111),
          coords.longitude + (radius / 111111),
        ),
      );
      final res = await MapApi.searchPlaces(boundBox);
      _logger.i('Nearby places: $res');
    } catch (e) {
      _logger.e(e);
    }
  }
}