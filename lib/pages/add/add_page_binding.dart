import 'package:get/get.dart';
import 'package:wanderly/pages/add/add_page_controller.dart';

class AddPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddPageController>(() => AddPageController());
  }
}