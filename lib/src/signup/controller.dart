// file: signup/controller.dart
import 'package:flutter/material.dart';
import 'service.dart';
import '../login/view.dart';
import '../login/controller.dart';
import '../login/service.dart';

class SignUpController with ChangeNotifier {
  final SignUpService _signUpService;

  SignUpController(this._signUpService);

  Future<void> signUp(String username, String email, String password) async {
    final success = await _signUpService.signUp(username, email, password);
    if (success) {
      // Show success message
      if (navigatorKey.currentContext != null) {
        showDialog(
          context: navigatorKey.currentContext!,
          builder: (context) => const AlertDialog(
            title: Text('Success'),
            content: Text('Sign up successful!'),
          ),
        );

        // Automatically navigate to login screen after 2 seconds
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.pop(navigatorKey.currentContext!);
          Navigator.pushReplacement(
            navigatorKey.currentContext!,
            MaterialPageRoute(
              builder: (context) => LoginView(
                controller: LoginController(LoginService()),
              ),
            ),
          );
        });
      }
    } else {
      // Handle sign up failure
    }
  }
}

final navigatorKey = GlobalKey<NavigatorState>();
