// file: main.dart
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:firebase_core/firebase_core.dart';
import 'src/app.dart';
import 'src/auth/firebase.dart';
import 'src/signout/controller.dart';
import 'src/signout/service.dart';
import 'src/navigation/service.dart';
import 'src/splash/controller.dart';
import 'src/settings/controller.dart';
import 'src/signin/controller.dart';
import 'src/signup/controller.dart';
import 'src/auth/controller.dart';
import 'src/dashboard/controller.dart';
import 'src/geotagging/controller.dart';
import 'src/auth/services.dart';
import 'src/splash/service.dart';
import 'src/settings/service.dart';
import 'src/signin/service.dart';
import 'src/signup/service.dart';
import 'src/geotagging/service.dart';

void main() async {
  // Ensure URLs without the hash sign (#) are handled correctly
  setPathUrlStrategy();

  // Ensure Flutter bindings are initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final navigationService = NavigationService();

  // Set Controllers
  final settingsController = SettingsController(SettingsService());
  final geotaggingController = GeotaggingController(GeotaggingServices());
  final splashController = SplashController(SplashService(), navigationService);
  final authController = AuthController(AuthService(), navigationService);
  final dashboardController = DashboardController(navigationService);
  final signinController =
      SignInController(SignIntService(), navigationService);
  final signUpController = SignUpController(SignUpService(), navigationService);
  final logoutController = SignOutController(
    service: SignOutService(),
    navigationService: navigationService,
  );

  // Load user's preferred theme while showing the splash screen
  await settingsController.loadSettings();

  // Run the app and pass in the SettingsController
  runApp(MyApp(
    settingsController: settingsController,
    geotaggingController: geotaggingController,
    splashController: splashController,
    authController: authController,
    dashboardController: dashboardController,
    signinController: signinController,
    signUpController: signUpController,
    logoutController: logoutController,
    navigationService: navigationService,
  ));
}
