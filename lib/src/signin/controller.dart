import 'package:flutter/material.dart';
import 'service.dart';
import '../navigation/service.dart';

class SignInController with ChangeNotifier {
  final SignIntService _SigninService;
  final NavigationService _navigationService;

  SignInController(this._SigninService, this._navigationService);

  Future<void> login(String username, String password) async {
    final success = await _SigninService.login(username, password);
    if (success) {
      // Show success message
      _navigationService.navigateTo('/dashboard');
    } else {
      // Handle sign up failure
    }
  }
}
