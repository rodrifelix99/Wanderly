import 'package:get/get.dart';
import 'package:wanderly/pages/permissions/permissions_controller.dart';

class PermissionsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PermissionsController>(() => PermissionsController());
  }
}