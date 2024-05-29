import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  final IconData? icon;
  final bool isLoading;
  final bool isDisabled;
  final BorderRadius borderRadius;

  const Button({
    super.key,
    required this.onPressed,
    required this.text,
    this.icon,
    this.isLoading = false,
    this.isDisabled = false,
    this.borderRadius = const BorderRadius.all(Radius.circular(32)),
  });


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isDisabled ? null : onPressed,
      style: ButtonStyle(
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
        ),
        backgroundColor: isDisabled ? WidgetStateProperty.all(Colors.grey) : null,
      ),
      child: isLoading
          ? const SizedBox(
              height: 24,
              width: 24,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.white),
              ),
            )
          : Row(
              children: [
                if (icon != null) Icon(icon),
                const Spacer(),
                Text(text),
                const Spacer(),
              ],
            ),
    );
  }
}
