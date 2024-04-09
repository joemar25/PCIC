// file: signin/controller.dart
import 'package:flutter/material.dart';
import 'package:pcic_app/src/auth/services.dart';
import '../navigation/service.dart';

class SignInController with ChangeNotifier {
  final AuthService _authService;
  final NavigationService _navigationService;
  bool isLoading = false;
  String? errorMessage;

  SignInController(this._authService, this._navigationService);

  Future<void> login(String email, String password) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    final user = await _authService.signInWithEmailAndPassword(email, password);
    isLoading = false;

    if (user != null) {
      _navigationService.navigateTo('/dashboard');
    } else {
      errorMessage = 'Failed to sign in. Please check your credentials.';
    }

    notifyListeners();
  }
}
