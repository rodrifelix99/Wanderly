import 'package:get/get.dart';
import 'package:wanderly/components/splash_screen.dart';
import 'package:wanderly/main.dart';
import 'package:wanderly/pages/home/home_page.dart';
import 'package:wanderly/routes.dart';

final appPages = [
  GetPage(
      name: Routes.LAUNCH,
      page: () => const SplashScreen(init: init),
  ),
  GetPage(
      name: Routes.HOME,
      page: () => const HomePage(),
  ),
];