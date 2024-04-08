import 'package:flutter/material.dart';
import 'service.dart';

class LogoutController with ChangeNotifier {
  final LogoutService _logoutService;

  LogoutController(this._logoutService);

  Future<void> logout(BuildContext context) async {
    await _logoutService.logout();
    // Navigate to the home screen after successful logout
    Navigator.pushReplacementNamed(context, '/home');
  }
}
