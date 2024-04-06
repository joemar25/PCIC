import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';
import 'firebase_options.dart';

import 'src/app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';
import 'src/geotagging/geotagging_controller.dart';

void main() async {
  // Ensure URLs without the hash sign (#) are handled correctly
  setPathUrlStrategy();

  // Ensure Flutter bindings are initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Set up the SettingsController to manage user settings
  final settingsController = SettingsController(SettingsService());
  final geotaggingController = GeotaggingController();

  // Load user's preferred theme while showing the splash screen
  await settingsController.loadSettings();

  // Run the app and pass in the SettingsController
  runApp(MyApp(
    settingsController: settingsController,
    geotaggingController: geotaggingController,
  ));
}
