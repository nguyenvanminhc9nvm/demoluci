import 'package:base_flutter_project/screens/list_employee/list_employee_screen.dart';
import 'package:base_flutter_project/screens/manager_employee/employee_screen.dart';
import 'package:base_flutter_project/screens/splash/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RouteName {
  static const String splash = "/splash";
  static const String listEmployee = "list_employee";
  static const String employeeDetails = "/employee_details";
}

class AppRoutes {
  static final screens = <String, Widget Function()>{
    RouteName.splash: () => const MainScreen(),
    RouteName.listEmployee: () => const ListEmployeeScreen(),
    RouteName.employeeDetails: () => const EmployeeScreen(),
  };

  static Route<Widget> generateRoute(RouteSettings settings) {
    return GetPageRoute(
      settings: settings,
      page: screens[settings.name] ?? getDefaultScreen,
    );
  }

  static Widget getDefaultScreen() => const Scaffold(
    backgroundColor: Colors.white,
        body: Center(child: Text('Undefined')),
      );
}
