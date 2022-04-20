import 'package:base_flutter_project/app/flutter_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'configurations/environments.dart';

/// mainApp
void mainApp(EnvironmentType environment) async {
  Environment.config(environment);
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  // NotificationService().initialize();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  initializeDateFormatting().then((_) => runApp(FlutterApp()));
}
