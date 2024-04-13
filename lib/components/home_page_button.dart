import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageButton extends StatelessWidget {
  final bool expanded;
  final void Function() onPressed;
  final EdgeInsets? padding;
  final String text;
  final IconData? icon;

  const HomePageButton({
    super.key,
    this.padding,
    this.expanded = true,
    required this.onPressed,
    required this.text,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: expanded ? 1 : 0,
      child: Container(
        width: double.infinity,
        padding: padding ?? const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Get.theme.colorScheme.surfaceVariant.withOpacity(0.5),
          borderRadius: BorderRadius.circular(8),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: onPressed,
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
    );
  }
}
