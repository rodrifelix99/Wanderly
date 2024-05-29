import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wanderly/components/button.dart';

class AuthView extends StatelessWidget {
  final void Function() onGoogleSignIn;
  final void Function() onAppleSignIn;
  final void Function() onOpenTermsAndConditions;
  final bool showAppleSignIn;

  const AuthView({
    super.key,
    required this.onGoogleSignIn,
    required this.onAppleSignIn,
    required this.showAppleSignIn,
    required this.onOpenTermsAndConditions,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/images/welcome/login_bg.jpg',
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 64,
            ),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black87,
                  Colors.transparent,
                ],
              ),
            ),
            child: SafeArea(
              child: Column(
                children: [
                  Text(
                    'app_name'.tr,
                    textAlign: TextAlign.center,
                    style: Get.textTheme.displaySmall!.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'slogan'.tr,
                    textAlign: TextAlign.center,
                    style: Get.textTheme.bodyLarge!.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Get.theme.colorScheme.surface,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 16,
                  offset: const Offset(0, -4),
                ),
              ],
            ),
            child: SafeArea(
              top: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Button(
                    onPressed: onGoogleSignIn,
                    icon: showAppleSignIn ? Icons.g_mobiledata_rounded : null,
                    text: showAppleSignIn
                        ? 'sign_in_with_google'.tr
                        : 'get_started'.tr,
                  ),
                  if (showAppleSignIn) ...[
                    const SizedBox(height: 8),
                    Button(
                      onPressed: onAppleSignIn,
                      icon: Icons.apple_rounded,
                      text: 'sign_in_with_apple'.tr,
                    ),
                  ],
                  TextButton(
                    onPressed:onOpenTermsAndConditions,
                    child: Text('terms_and_conditions'.tr),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
