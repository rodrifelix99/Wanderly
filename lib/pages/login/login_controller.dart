import 'package:card_swiper/card_swiper.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:wanderly/routes.dart';
import 'package:wanderly/services/auth_service.dart';
import 'package:wanderly/services/snackbar_service.dart';

class LoginController extends GetxController {
  final Logger _logger = Logger();
  final RxBool isLoading = false.obs;
  final SnackBarService _snackBarService = SnackBarService();
  final AuthService _authService = Get.find<AuthService>();
  final RxBool showAppleSignIn = false.obs;
  final SwiperController swiperController = SwiperController();

  @override
  onReady() {
    showAppleSignIn.value = GetPlatform.isIOS;
    super.onReady();
  }

  Future<void> signInWithGoogle() async {
    try {
      isLoading.value = true;
      await _signIn('google');
    } catch (e) {
      _showError(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signInWithApple() async {
    try {
      isLoading.value = true;
      await _signIn('apple');
    } catch (e) {
      _showError(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> _signIn(String provider) async {
    try {
      await _authService.signIn(provider);
      _redirectToHome();
    } catch (e) {
      rethrow;
    }
  }

  void _showError(e) {
    _logger.e(e);
    _snackBarService.showSnackBar(
      title: 'error'.tr,
      message: 'error_sign_in'.tr,
    );
  }

  void _redirectToHome() {
    Get.offAllNamed(Routes.HOME);
  }

  void openTermsAndConditions() {
    // Open the terms and conditions page
  }
}