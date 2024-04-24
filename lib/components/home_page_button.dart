import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageButton extends StatelessWidget {
  final void Function() onPressed;
  final EdgeInsets? padding;
  final String text;
  final IconData? icon;
  final double width;
  final double height;
  final String? imageUrl;

  const HomePageButton({
    super.key,
    this.padding,
    required this.onPressed,
    required this.text,
    this.icon,
    required this.width,
    required this.height,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Get.theme.colorScheme.surfaceVariant.withOpacity(0.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          if (imageUrl != null)
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  imageUrl!,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          Positioned.fill(
            child: InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: onPressed,
              child: Padding(
                padding: padding ?? const EdgeInsets.all(8),
                child: Opacity(
                  opacity: 0.75,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (icon != null) ...[
                        const Spacer(),
                        Icon(
                          icon,
                          size: 42,
                        ),
                        const Spacer(),
                      ],
                      Text(
                        text,
                        style: Get.textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
