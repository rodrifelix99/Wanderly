import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wanderly/firebase_options.dart';
import 'package:wanderly/pages.dart';
import 'package:wanderly/routes.dart';
import 'package:wanderly/services/auth_service.dart';
import 'package:wanderly/services/location_service.dart';
import 'package:wanderly/services/wardrobe_service.dart';
import 'package:wanderly/theme.dart';
import 'package:wanderly/translations.dart';

Future<String> init() async {
  Get.lazyPut(() => AuthService(), fenix: true);
  Get.lazyPut(() => WardrobeService(), fenix: true);
  Get.lazyPut(() => LocationService(), fenix: true);
  return Routes.HOME;
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'app_name'.tr,
      translations: Languages(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: '/',
      getPages: appPages,
    ),
  );
}
