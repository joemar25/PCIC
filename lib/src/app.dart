// file: app.dart
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pcic_app/src/signin/controller.dart';
import 'auth/view.dart';
import 'dashboard/view.dart';
import 'signout/controller.dart';
import 'signout/view.dart';
import 'navigation/service.dart';
import 'signin/view.dart';
import 'signup/view.dart';
import 'splash/view.dart';
import 'settings/view.dart';
import 'geotagging/view.dart';
import 'tasks/task_details_view.dart';
import 'auth/controller.dart';
import 'signup/controller.dart';
import 'splash/controller.dart';
import 'settings/controller.dart';
import 'dashboard/controller.dart';
import 'geotagging/controller.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.settingsController,
    required this.geotaggingController,
    required this.splashController,
    required this.authController,
    required this.dashboardController,
    required this.signinController,
    required this.signUpController,
    required this.logoutController,
    required this.navigationService,
  });

  final SettingsController settingsController;
  final GeotaggingController geotaggingController;
  final SplashController splashController;
  final AuthController authController;
  final DashboardController dashboardController;
  final SignInController signinController;
  final SignUpController signUpController;
  final SignOutController logoutController;
  final NavigationService navigationService;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: settingsController,
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
            '/auth': (context) => AuthView(controller: authController),
            SettingsView.routeName: (context) =>
                SettingsView(controller: settingsController),
            SampleItemDetailsView.routeName: (context) =>
                const SampleItemDetailsView(),
            GeotaggingView.routeName: (context) =>
                GeotaggingView(controller: geotaggingController),
            '/signin': (context) => SigninView(controller: signinController),
            '/signup': (context) => SignUpView(controller: signUpController),
            '/signout': (context) => LogoutView(controller: logoutController),
            '/dashboard': (context) =>
                DashboardView(controller: dashboardController),
          },
          initialRoute: '/',
          navigatorKey: navigationService.navigatorKey,
        );
      },
    );
  }
}
