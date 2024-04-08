import 'package:flutter/material.dart';
import 'package:pcic_app/src/navigation/service.dart';

class DashboardController with ChangeNotifier {
  final NavigationService _navigationService;

  DashboardController(this._navigationService);

  void navigateToLogin() {
    _navigationService.navigateTo('/auth');
  }

  void signout(BuildContext context) {
    _navigationService.navigateTo('/signout');
  }
}
