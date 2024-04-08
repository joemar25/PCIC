// file: auth/view.dart
import 'package:flutter/material.dart';
import 'controller.dart';

class AuthView extends StatelessWidget {
  final AuthController controller;

  const AuthView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: controller.navigateToLogin,
              child: const Text('Login'),
            ),
            ElevatedButton(
              onPressed: controller.navigateToSignUp,
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
