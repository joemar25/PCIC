// file: dashboard/controller.dart
import 'package:flutter/material.dart';
import 'package:pcic_app/src/auth/services.dart';
import 'package:pcic_app/src/navigation/service.dart';

class DashboardController with ChangeNotifier {
  final NavigationService _navigationService;
  final AuthService _authService;

  String get currentUserEmail => _authService.currentUser?.email ?? '';
  String get currentUserUid => _authService.currentUser?.uid ?? '';

  DashboardController(this._navigationService, this._authService) {
    _authService.authStateChanges.listen((user) {
      if (user == null) {
        _navigationService.navigateTo('/auth');
      }
    });
  }

  Future<void> signOut() async {
    await _authService.signOut();
    _navigationService.navigateTo('/auth');
  }
}
