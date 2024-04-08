// file: login/view.dart
import 'package:flutter/material.dart';

import 'controller.dart';

class LoginView extends StatelessWidget {
  final LoginController controller;

  const LoginView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            controller.login('username', 'password');
          },
          child: const Text('Login'),
        ),
      ),
    );
  }
}
