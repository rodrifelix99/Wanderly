import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wanderly/components/home_page_button.dart';
import 'package:wanderly/pages/home/home_controller.dart';

class ActivitySelectorView extends GetView<HomeController> {
  const ActivitySelectorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        'home_page_title_${controller.selectedTitle}'.tr,
        style: Get.textTheme.headlineSmall,
      ),
      const SizedBox(height: 16.0),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: controller.homePageButtons,
      ),
      const SizedBox(height: 8.0),
      HomePageButton(
        onPressed: controller.showBottomSheet,
        padding: const EdgeInsets.symmetric(
          vertical: 16.0,
        ),
        width: Get.width,
        height: 60.0,
        text: 'more_activities'.tr,
      ),
    ]);
  }
}
