// file: signup/controller.dart
import 'package:flutter/material.dart';
import 'package:pcic_app/src/auth/services.dart';
import '../navigation/service.dart';

class SignUpController with ChangeNotifier {
  final AuthService _authService;
  final NavigationService _navigationService;
  bool isLoading = false;
  String? errorMessage;

  SignUpController(this._authService, this._navigationService);

  Future<void> signUp(String email, String password) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    final user = await _authService.signUpWithEmailAndPassword(email, password);
    isLoading = false;

    if (user != null) {
      _navigationService.navigateTo('/dashboard');
    } else {
      errorMessage = 'Failed to sign up. Please try again.';
    }

    notifyListeners();
  }
}
