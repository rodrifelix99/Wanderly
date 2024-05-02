import 'package:flutter/material.dart';

class AuthView extends StatelessWidget {
  final void Function()? onGoogleSignIn;
  final void Function()? onAppleSignIn;
  final bool showAppleSignIn;

  const AuthView({
    super.key,
    required this.onGoogleSignIn,
    required this.onAppleSignIn,
    required this.showAppleSignIn,
  });

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
