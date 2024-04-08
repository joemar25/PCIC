// file: app.dart
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pcic_app/src/dashboard/controller.dart';
import 'package:pcic_app/src/home/controller.dart';
import 'package:pcic_app/src/login/controller.dart';
import 'package:pcic_app/src/logout/controller.dart';
import 'package:pcic_app/src/signup/controller.dart';
import 'package:pcic_app/src/splash/controller.dart';

import 'home/view.dart';
import 'settings/view.dart';
import 'geotagging/view.dart';
import 'settings/controller.dart';
import 'geotagging/controller.dart';
import 'tasks/task_details_view.dart';
import 'splash/view.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.settingsController,
    required this.geotaggingController,
    required this.splashController,
    required this.homeController,
    required this.dashboardController,
    required this.loginController,
    required this.signUpController,
    required this.logoutController,
  });

  final SettingsController settingsController;
  final GeotaggingController geotaggingController;
  final SplashController splashController;
  final HomeController homeController;
  final DashboardController dashboardController;
  final LoginController loginController;
  final SignUpController signUpController;
  final LogoutController logoutController;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          restorationScopeId: 'app',
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''), // English, no country code
          ],
          onGenerateTitle: (BuildContext context) =>
              AppLocalizations.of(context)!.appTitle,

          // Theme setup
          theme: ThemeData(),
          darkTheme: ThemeData.dark(),
          themeMode: settingsController.themeMode,

          // Route configuration
          routes: {
            '/': (context) => SplashView(controller: splashController),
            '/home': (context) => HomeView(controller: homeController),
            SettingsView.routeName: (context) =>
                SettingsView(controller: settingsController),
            SampleItemDetailsView.routeName: (context) =>
                const SampleItemDetailsView(),
            GeotaggingView.routeName: (context) =>
                GeotaggingView(controller: geotaggingController),
          },
          initialRoute: '/',
        );
      },
    );
  }
}
