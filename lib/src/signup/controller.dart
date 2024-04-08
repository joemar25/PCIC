import 'package:flutter/material.dart';

import 'service.dart';
import '../navigation/service.dart';

class SignUpController with ChangeNotifier {
  final SignUpService _signUpService;
  final NavigationService _navigationService;

  SignUpController(this._signUpService, this._navigationService);

  Future<void> signUp(String username, String email, String password) async {
    final success = await _signUpService.signUp(username, email, password);
    if (success) {
      // Show success message
      _navigationService.navigateTo('/signin');
    } else {
      // Handle sign up failure
    }
  }
}
