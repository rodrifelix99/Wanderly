import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:platform_maps_flutter/platform_maps_flutter.dart';
import 'package:wanderly/api/map_api.dart';
import 'package:wanderly/enums/activity_enum.dart';
import 'package:wanderly/models/feature.dart';
import 'package:wanderly/models/response.dart';

class NearbyService extends GetxService {
  final Logger _logger = Logger();

  Future<List<Feature>> getNearbyPlaces(
    LatLng coords, {
    required int radius,
    required Activity activity,
  }) async {
    try {
      final ApiResponse res = await MapApi.searchPlaces(
        coords,
        radius: radius,
        categoryIds: activity.categoryIds,
      );
      return res.features;
    } catch (e) {
      _logger.e(e);
      return [];
    }
  }
}
