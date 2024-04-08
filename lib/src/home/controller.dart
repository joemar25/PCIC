// file: home/controller.dart
import 'package:flutter/material.dart';

import 'service.dart';

import '../login/controller.dart';
import '../login/service.dart';
import '../login/view.dart';
import '../signup/controller.dart';
import '../signup/service.dart';
import '../signup/view.dart';

class HomeController {
  final HomeService _homeService;

  HomeController(this._homeService);

  Future<bool> checkSessionToken() async {
    final sessionToken = await _homeService.getSessionToken();
    return sessionToken != null;
  }

  void navigateToLogin(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              LoginView(controller: LoginController(LoginService()))),
    );
  }

  void navigateToSignUp(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              SignUpView(controller: SignUpController(SignUpService()))),
    );
  }
}
