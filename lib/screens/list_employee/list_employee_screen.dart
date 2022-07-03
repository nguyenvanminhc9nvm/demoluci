import 'package:base_flutter_project/model/employee.dart';
import 'package:base_flutter_project/routes/routes.dart';
import 'package:base_flutter_project/screens/list_employee/list_employee_controller.dart';
import 'package:base_flutter_project/screens/splash/main_controller.dart';
import 'package:base_flutter_project/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListEmployeeScreen extends StatefulWidget {
  const ListEmployeeScreen({Key? key}) : super(key: key);

  @override
  State<ListEmployeeScreen> createState() => _ListEmployeeScreenState();
}

class _ListEmployeeScreenState extends State<ListEmployeeScreen> {
  final _controller = Get.put(ListEmployeeController());
  final _mainController = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(
        () {
          final employees = _controller.employees.toList();
          return Column(
            children: [
              Expanded(
                flex: 10,
                child: ListView.builder(
                  itemCount: employees.length,
                  itemBuilder: (context, index) {
                    Employee employee = employees[index];
                    return InkWell(
                      onTap: () {
                        _mainController.addTitle(employee.fullName ?? "");
                        Navigator.of(context)
                            .pushNamed(RouteName.employeeDetails);
                      },
                      child: ListTile(
                        title: Text(
                          employee.fullName ?? "",
                          style: AppTextStyle.t18w700(AppColors.black),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
