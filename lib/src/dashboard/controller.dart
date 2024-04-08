// file: auth/controller.dart
import 'package:flutter/material.dart';
import 'service.dart';
import '../home/view.dart';
import '../home/service.dart';
import '../home/controller.dart';
import '../auth/service.dart';
import '../logout/controller.dart';
import '../logout/service.dart';

class DashboardController with ChangeNotifier {
  final DashboardService dashboardService;
  final LogoutController logoutController;

  DashboardController(this.dashboardService)
      : logoutController = LogoutController(LogoutService()) {
    checkSession();
  }

  void navigateToHome(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) =>
            HomeView(controller: HomeController(HomeService())),
      ),
    );
  }

  void checkSession() {
    final token = AuthService.token;
    if (token == null) {
      // If no token exists, navigate back to the home page
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (navigatorKey.currentContext != null) {
          Navigator.pushReplacement(
            navigatorKey.currentContext!,
            MaterialPageRoute(
              builder: (context) =>
                  HomeView(controller: HomeController(HomeService())),
            ),
          );
        }
      });
    } else {
      // Token exists, continue with the dashboard logic
      // ...
    }
  }

  void logout(BuildContext context) {
    logoutController.logout(context);
  }
}

final navigatorKey = GlobalKey<NavigatorState>();
