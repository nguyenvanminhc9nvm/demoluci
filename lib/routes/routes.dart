import 'package:base_flutter_project/screens/root/binding/root_binding.dart';
import 'package:base_flutter_project/screens/root/root_screen.dart';
import 'package:base_flutter_project/screens/splash/bindings/splash_binding.dart';
import 'package:base_flutter_project/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RouteName {
  static const String splash = "/splash";
  static const String root = "/root";
  static const String home = "/home";
}

class AppRoutes {
  static final screens = <String, Widget Function()>{
    RouteName.splash: () => SplashScreen(),
    RouteName.root: () => const RootScreen(),
  };

  static final bindings = <String, List<Bindings> Function()>{
    RouteName.splash: () => [SplashBinding()],
    RouteName.root: () => [RootBinding()],
  };

  static Route<Widget> generateRoute(RouteSettings settings) {
    return GetPageRoute(
      settings: settings,
      page: screens[settings.name] ?? getDefaultScreen,
      bindings: bindings[settings.name]?.call(),
    );
  }

  static Widget getDefaultScreen() => const Scaffold(
        body: Center(child: Text('Undefined')),
      );
}
