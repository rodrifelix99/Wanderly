import 'dart:io';

import 'package:colornames/colornames.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:wanderly/enums/clothing.dart';
import 'package:wanderly/enums/main_categories.dart';
import 'package:wanderly/pages/change_color.dart';

class CreateArticle extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final MainCategory selectedCategory;
  final void Function(MainCategory?) onCategoryChanged;
  final List<Clothing> selectedSubCategories;
  final void Function(List<Clothing>) onSubCategoryChanged;
  final Color selectedColor;
  final void Function(Color) onColorChanged;
  final File image;
  final bool isScanning;
  final void Function() onGoBack;
  final void Function() onAddToWardrobe;

  const CreateArticle({
    super.key,
    required this.image,
    required this.isScanning,
    required this.onGoBack,
    required this.titleController,
    required this.descriptionController,
    required this.selectedCategory,
    required this.onCategoryChanged,
    required this.selectedSubCategories,
    required this.onSubCategoryChanged,
    required this.selectedColor,
    required this.onColorChanged,
    required this.onAddToWardrobe,
  });

  _changeColor() async {
    final color = await Get.bottomSheet(
      ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
          child: ChangeColor(
            color: selectedColor,
          ),
      ),
    );
    if (color != null) {
      onColorChanged(color);
    }
  }

  Widget get aiNotice => Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              Icons.info,
              size: 20.0,
            ),
            const SizedBox(width: 8.0),
            Expanded(
              child: Text(
                'wanderly_ai_notice'.tr,
              ),
            ),
          ],
        ),
      );

  Widget get scanningImage => Center(
        child: SizedBox(
          width: Get.width / 2,
          height: Get.width / 2,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Hero(
                    tag: image.path,
                    child: Image.file(
                      image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Lottie.asset('assets/images/scanning.json'),
                ),
              ],
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: isScanning
              ? scanningImage
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16.0),
                            child: Hero(
                              tag: image.path,
                              child: Image.file(
                                image,
                                width: Get.width,
                                height: Get.width,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        aiNotice,
                        const SizedBox(height: 16.0),
                        TextField(
                          controller: titleController,
                          decoration: InputDecoration(
                            labelText: 'title'.tr,
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        TextField(
                          controller: descriptionController,
                          decoration: InputDecoration(
                            labelText: 'description'.tr,
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        DropdownButton<MainCategory>(
                          value: selectedCategory,
                          onChanged: onCategoryChanged,
                          items: [
                            for (final category in MainCategory.values)
                              DropdownMenuItem(
                                value: category,
                                child:
                                    Text(category.toString().split('.').last),
                              ),
                          ],
                        ),
                        const SizedBox(height: 16.0),
                        MultiSelectDropDown(
                          onOptionSelected: (List<ValueItem> selectedValues) {
                            onSubCategoryChanged(
                              selectedValues
                                  .map((e) => e.value as Clothing)
                                  .toList(),
                            );
                          },
                          selectedOptions: selectedSubCategories
                              .map((e) => ValueItem(label: e.name, value: e))
                              .toList(),
                          options: Clothing.values
                              .map((e) => ValueItem(label: e.name, value: e))
                              .toList(),
                        ),
                        const SizedBox(height: 16.0),
                        Container(
                          height: 100.0,
                          width: 100.0,
                          decoration: BoxDecoration(
                            color: selectedColor,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  'color_family'.tr,
                                  textAlign: TextAlign.center,
                                  style: Get.textTheme.bodyLarge?.copyWith(
                                    color:
                                        selectedColor.computeLuminance() > 0.5
                                            ? Colors.black
                                            : Colors.white,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(selectedColor.colorName,
                                        textAlign: TextAlign.center,
                                        style: Get.textTheme.titleLarge?.copyWith(
                                          color:
                                              selectedColor.computeLuminance() > 0.5
                                                  ? Colors.black
                                                  : Colors.white,
                                        ),
                                    ),
                                    IconButton(
                                        onPressed: () => _changeColor(),
                                        icon: Icon(
                                          Icons.edit,
                                          size: 16.0,
                                          color: selectedColor.computeLuminance() > 0.5
                                              ? Colors.black
                                              : Colors.white,
                                        ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              ElevatedButton(
                onPressed: onGoBack,
                child: const Icon(Icons.arrow_back),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: ElevatedButton(
                  onPressed: onAddToWardrobe,
                  child: Text('add_to_wardrobe'.tr),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
