import 'package:get/get.dart';
import 'package:wanderly/components/splash_screen.dart';
import 'package:wanderly/main.dart';
import 'package:wanderly/pages/add/add_page.dart';
import 'package:wanderly/pages/add/add_page_binding.dart';
import 'package:wanderly/pages/home/home_binding.dart';
import 'package:wanderly/pages/home/home_page.dart';
import 'package:wanderly/pages/login/login_binding.dart';
import 'package:wanderly/pages/login/login_page.dart';
import 'package:wanderly/pages/permissions/location/location_permission.dart';
import 'package:wanderly/pages/permissions/permissions_binding.dart';
import 'package:wanderly/routes.dart';

final appPages = [
  GetPage(
    name: Routes.LAUNCH,
    page: () => const SplashScreen(init: init),
  ),
  GetPage(
    name: Routes.LOGIN,
    page: () => const LoginPage(),
    binding: LoginBinding(),
  ),
  GetPage(
    name: Routes.HOME,
    page: () => const HomePage(),
    binding: HomeBinding(),
  ),
  GetPage(
    name: Routes.PERMISSIONS,
    binding: PermissionsBinding(),
    page: () => const LocationPermissionPage(),
    children: [
      GetPage(
        name: Routes.LOCATION,
        binding: PermissionsBinding(),
        page: () => const LocationPermissionPage(),
      ),
      GetPage(
        name: Routes.NOTIFICATIONS,
        binding: PermissionsBinding(),
        page: () => const HomePage(),
      ),
    ],
  ),
  GetPage(
      name: Routes.ADD,
      binding: AddPageBinding(),
      page: () => const AddPage(),
  ),
];
