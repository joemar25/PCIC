// file: home/view.dart
import 'package:flutter/material.dart';

import 'controller.dart';

class HomeView extends StatelessWidget {
  final HomeController controller;

  const HomeView({super.key, required this.controller});

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
              onPressed: () => controller.navigateToLogin(context),
              child: const Text('Login'),
            ),
            ElevatedButton(
              onPressed: () => controller.navigateToSignUp(context),
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
