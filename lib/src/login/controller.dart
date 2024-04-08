// file: login/controller.dart
import 'package:flutter/material.dart';
import 'service.dart';
import '../dashboard/controller.dart';
import '../dashboard/service.dart';
import '../dashboard/view.dart';

class LoginController with ChangeNotifier {
  final LoginService _loginService;

  LoginController(this._loginService);

  Future<void> login(String username, String password) async {
    final success = await _loginService.login(username, password);
    if (success) {
      // Show success message
      if (navigatorKey.currentContext != null) {
        showDialog(
          context: navigatorKey.currentContext!,
          builder: (context) => const AlertDialog(
            title: Text('Success'),
            content: Text('Login successful!'),
          ),
        );

        // Automatically navigate to login screen after 2 seconds
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.pop(navigatorKey.currentContext!);
          Navigator.pushReplacement(
            navigatorKey.currentContext!,
            MaterialPageRoute(
              builder: (context) => DashboardView(
                controller: DashboardController(DashboardService()),
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
