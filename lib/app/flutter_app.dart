import 'package:base_flutter_project/app/app_bindings.dart';
import 'package:base_flutter_project/configurations/environments.dart';
import 'package:base_flutter_project/languages/translation_service.dart';
import 'package:base_flutter_project/routes/routes.dart';
import 'package:base_flutter_project/services/app_lifecycle_observer.dart';
import 'package:base_flutter_project/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlutterApp extends StatefulWidget {
  final EnvironmentType? environment;

  const FlutterApp({Key? key, this.environment}) : super(key: key);

  @override
  State<StatefulWidget> createState() => FlutterAppState();
}

class FlutterAppState extends State<FlutterApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: Get.key,
      theme: AppTheme.base(Get.theme).appTheme,
      onGenerateRoute: AppRoutes.generateRoute,
      initialRoute: RouteName.splash,
      initialBinding: AppBinding(),
      enableLog: true,
      translations: TranslationService(),
      locale: TranslationService.locale,
      fallbackLocale: TranslationService.fallbackLocale,
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(AppLifecycleObserver());
    print('start app lifecycle observer');

    AppLifecycleObserver().status.listen((AppLifecycleState state) {
      print(Get.currentRoute);
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(AppLifecycleObserver());
    print('finish app lifecycle observer');
    super.dispose();
  }
}
