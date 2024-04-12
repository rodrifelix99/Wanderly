import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wanderly/pages.dart';
import 'package:wanderly/pages/home/home_controller.dart';
import 'package:wanderly/pages/home/home_page.dart';
import 'package:wanderly/theme.dart';

Future<Widget> init() async {
  Get.lazyPut(() => HomeController(), fenix: true);
  return const HomePage();
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    GetMaterialApp(
      title: 'app_name'.tr,
      fallbackLocale: const Locale('en', 'US'),
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: '/',
      getPages: appPages,
    ),
  );
}
