import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pcic_app/src/auth/services.dart';
import 'package:pcic_app/src/navigation/service.dart';

class AuthController extends ChangeNotifier {
  final AuthService _authService;
  final NavigationService _navigationService;

  AuthController(this._authService, this._navigationService) {
    _authService.authStateChanges.listen((User? user) {
      if (user != null) {
        _navigationService.replaceWith('/dashboard');
      } else {
        _navigationService.replaceWith('/auth');
      }
    });
  }

  void navigateToLogin() {
    _navigationService.navigateTo('/signin');
  }

  void navigateToSignUp() {
    _navigationService.navigateTo('/signup');
  }
}
