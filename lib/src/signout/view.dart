import 'package:flutter/material.dart';
import 'controller.dart';

class LogoutView extends StatelessWidget {
  final SignOutController controller;

  const LogoutView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signout'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => controller.signout(),
          child: const Text('Signout'),
        ),
      ),
    );
  }
}
