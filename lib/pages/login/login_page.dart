import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wanderly/pages/login/login_controller.dart';
import 'package:wanderly/pages/login/views/auth_view.dart';
import 'package:wanderly/pages/login/views/welcome_view.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  String imageUrl(int index) {
    switch (index) {
      case 0:
        return 'assets/images/welcome/welcome.json';
      case 1:
        return 'assets/images/welcome/clothes.json';
      case 2:
        return 'assets/images/welcome/ai.json';
      default:
        return '';
    }
  }

  String title(int index) {
    switch (index) {
      case 0:
        return 'welcome_1'.tr;
      case 1:
        return 'welcome_2'.tr;
      case 2:
        return 'welcome_3'.tr;
      default:
        return '';
    }
  }

  String subtitle(int index) {
    switch (index) {
      case 0:
        return 'welcome_1_subtitle'.tr;
      case 1:
        return 'welcome_2_subtitle'.tr;
      case 2:
        return 'welcome_3_subtitle'.tr;
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Swiper(
        itemCount: 4,
        controller: controller.swiperController,
        loop: false,
        curve: Curves.easeInOut,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          switch (index) {
            case 3:
              return AuthView(
                onGoogleSignIn: controller.signInWithGoogle,
                onAppleSignIn: controller.signInWithApple,
                showAppleSignIn: controller.showAppleSignIn.value,
                onOpenTermsAndConditions: controller.openTermsAndConditions,
              );
            default:
              return WelcomeView(
                imageUrl: imageUrl(index),
                title: title(index),
                subtitle: subtitle(index),
                onTap: () => controller.swiperController.next(),
                buttonText: 'next'.tr,
              );
          }
        },
      ),
    );
  }
}
