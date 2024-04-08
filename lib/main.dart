// file: main.dart
import 'package:flutter/material.dart';
import 'package:pcic_app/src/login/controller.dart';
import 'package:pcic_app/src/signup/controller.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pcic_app/src/geotagging/service.dart';

import 'src/app.dart';
import 'src/dashboard/controller.dart';
import 'src/dashboard/service.dart';
import 'src/home/controller.dart';
import 'src/home/service.dart';
import 'src/login/service.dart';
import 'src/logout/controller.dart';
import 'src/logout/service.dart';
import 'src/settings/service.dart';
import 'src/signup/service.dart';
import 'src/splash/controller.dart';
import 'src/splash/service.dart';
import 'src/auth/firebase.dart';
import 'src/settings/controller.dart';
import 'src/geotagging/controller.dart';

void main() async {
  // Ensure URLs without the hash sign (#) are handled correctly
  setPathUrlStrategy();

  // Ensure Flutter bindings are initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Set Controllers
  final settingsController = SettingsController(SettingsService());
  final geotaggingController = GeotaggingController(GeotaggingServices());
  final splashController = SplashController(SplashService());
  final homeController = HomeController(HomeService());
  final dashboardController = DashboardController(DashboardService());
  final loginController = LoginController(LoginService());
  final signUpController = SignUpController(SignUpService());
  final logoutController = LogoutController(LogoutService());

  // Load user's preferred theme while showing the splash screen
  await settingsController.loadSettings();

  // Run the app and pass in the SettingsController
  runApp(MyApp(
    settingsController: settingsController,
    geotaggingController: geotaggingController,
    splashController: splashController,
    homeController: homeController,
    dashboardController: dashboardController,
    loginController: loginController,
    signUpController: signUpController,
    logoutController: logoutController,
  ));
}
