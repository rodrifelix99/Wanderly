import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:wanderly/routes.dart';
import 'package:wanderly/services/location_service.dart';
import 'package:wanderly/services/snackbar_service.dart';

class PermissionsController extends GetxController {
  final Logger _logger = Logger();
  final SnackBarService _snackBarService = SnackBarService();
  final LocationService _locationService = Get.find<LocationService>();

  Future<void> requestLocationPermission() async {
    try {
      final permission = await _locationService.requestPermission();
      if (permission) {
        Get.offAllNamed(Routes.HOME);
      } else {
        _snackBarService.showSnackBar(
          title: 'Location Permission',
          message: 'Permission denied',
        );
      }
    } catch (e) {
      _logger.e(e);
      _snackBarService.showSnackBar(
        title: 'Location Permission',
        message: 'Error requesting location permission',
      );
    }
  }
}