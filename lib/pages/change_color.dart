
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wanderly/components/button.dart';

class ChangeColor extends StatelessWidget {
  final Color color;

  const ChangeColor({
    super.key,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    Color selectedColor = color;
    return Scaffold(
        appBar: AppBar(
          title: Text('change_color'.tr),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ColorPicker(
                  onColorChanged: (color) => selectedColor = color,
                  color: selectedColor,
                  pickersEnabled: const <ColorPickerType, bool>{
                    ColorPickerType.accent: false,
                    ColorPickerType.primary: false,
                    ColorPickerType.bw: false,
                    ColorPickerType.custom: false,
                    ColorPickerType.wheel: true,
                    ColorPickerType.both: false,
                  },
                ),
                const Spacer(),
                Button(
                  onPressed: () => Get.back(result: selectedColor),
                  text: 'done'.tr,
                ),
              ],
            ),
          ),
        ));
  }
}
