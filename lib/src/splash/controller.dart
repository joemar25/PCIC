// file: splash/controller.dart
import 'package:flutter/material.dart';
import 'service.dart';

class SplashController with ChangeNotifier {
  final SplashService _splashService;

  SplashController(this._splashService);

  Future<void> initializeApp() async {
    // Simulate app initialization
    await _splashService.initializeApp();
    notifyListeners();
  }
}
