
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:platform_maps_flutter/platform_maps_flutter.dart';
import 'package:wanderly/models/article.dart';
import 'package:wanderly/routes.dart';
import 'package:wanderly/services/auth_service.dart';
import 'package:wanderly/services/location_service.dart';
import 'package:wanderly/services/snackbar_service.dart';
import 'package:wanderly/services/wardrobe_service.dart';

class HomeController extends GetxController {
  final Logger _logger = Logger();
  final AuthService _authService = Get.find<AuthService>();
  final LocationService _locationService = Get.find<LocationService>();
  final WardrobeService _wardrobeService = Get.find<WardrobeService>();
  final SnackBarService _snackBarService = SnackBarService();
  final RxBool showMap = false.obs;
  late PlatformMapController mapController;
  int selectedTitle = 1;
  final RxBool isLoading = false.obs;
  final RxSet<Marker> markers = <Marker>{}.obs;
  final RxList<Article> clothes = <Article>[].obs;

  @override
  void onReady() {
    try {
      _subscribeAuthChanges();
      _checkPermissions();
    } catch (e) {
      _logger.e(e);
    } finally {
      super.onReady();
    }
  }

  Future<void> getArticles() async {
    try {
      clothes.value = await _wardrobeService.getArticles();
    } catch (e) {
      _logger.e(e);
      _snackBarService.showSnackBar(
        title: 'Wardrobe',
        message: 'Error getting articles',
      );
    }
  }

  Future<void> deleteArticle(int id) async {
    try {
      await _wardrobeService.deleteArticle(id);
      await getArticles();
    } catch (e) {
      _logger.e(e);
      _snackBarService.showSnackBar(
        title: 'Wardrobe',
        message: 'Error deleting article',
      );
    }
  }

  void _subscribeAuthChanges() {
    if (_authService.user == null) {
      Get.offAllNamed(Routes.LOGIN);
    } else {
      _authService.authStream.listen((user) {
        if (user == null) {
          Get.offAllNamed(Routes.LOGIN);
        }
      });
    }
  }

  Future<void> _checkPermissions() async {
    await _checkLocationPermission();
  }

  Future<void> _checkLocationPermission() async {
    try {
      final isPermissionEnabled = await _locationService.isAllSettingsEnabled();
      if (!isPermissionEnabled) {
        Get.offAllNamed(Routes.LOCATION_PERMISSION);
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

  Future<void> signOut() async {
    await _authService.signOut();
  }
}
