import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wanderly/pages.dart';
import 'package:wanderly/pages/home/home_controller.dart';
import 'package:wanderly/routes.dart';
import 'package:wanderly/services/location_service.dart';
import 'package:wanderly/theme.dart';
import 'package:wanderly/translations.dart';

Future<String> init() async {
  Get.lazyPut(() => LocationService(), fenix: true);
  Get.lazyPut(() => HomeController(), fenix: true);
  return Routes.HOME;
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();

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
