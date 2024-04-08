import 'package:flutter/material.dart';
import 'service.dart';
import '../navigation/service.dart';

class SplashController with ChangeNotifier {
  final SplashService _splashService;
  final NavigationService _navigationService;

  SplashController(this._splashService, this._navigationService);

  Future<void> initializeApp() async {
    // Simulate app initialization
    await _splashService.initializeApp();
    _navigationService.navigateTo('/auth');
  }
}
