// file: signup/view.dart
import 'package:flutter/material.dart';

import 'controller.dart';

class SignUpView extends StatelessWidget {
  final SignUpController controller;

  const SignUpView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            controller.signUp('username', 'email', 'password');
          },
          child: const Text('Sign Up'),
        ),
      ),
    );
  }
}
