import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

class CreateArticle extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final String selectedCategory;
  final void Function(String?) onCategoryChanged;
  final List<String> selectedSubCategories;
  final void Function(List<String>) onSubCategoryChanged;
  final String selectedColor;
  final void Function(String) onColorChanged;
  final File image;
  final bool isScanning;
  final void Function() onGoBack;

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
  });

  Widget get aiNotice => Container(
    margin: const EdgeInsets.all(16.0),
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: isScanning ? Center(
            child: SizedBox(
              width: Get.width / 2,
              height: Get.width / 2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.file(image),
                    ),
                    Positioned.fill(
                      child: Lottie.asset('assets/images/scanning.json'),
                    ),
                  ],
                ),
              ),
            ),
          ) : SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.file(image),
                aiNotice,
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
                DropdownButton<String>(
                  value: selectedCategory,
                  onChanged: onCategoryChanged,
                  items: [
                    DropdownMenuItem(
                      value: selectedCategory,
                      child: Text(selectedCategory),
                    ),
                    DropdownMenuItem(
                      value: 'top',
                      child: Text('Top'),
                    ),
                    DropdownMenuItem(
                      value: 'bottom',
                      child: Text('Bottom'),
                    ),
                    DropdownMenuItem(
                      value: 'shoes',
                      child: Text('Shoes'),
                    ),
                    DropdownMenuItem(
                      value: 'accessory',
                      child: Text('Accessory'),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                MultiSelectDropDown(
                    onOptionSelected: (List<ValueItem> selectedValues) {

                    },
                    options: selectedSubCategories.map((e) => ValueItem(label: e, value: e)).toList(),
                ),
              ],
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
                  onPressed: () {},
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
