import 'package:base_flutter_project/model/activity_history.dart';
import 'package:base_flutter_project/model/employee.dart';
import 'package:base_flutter_project/model/project.dart';
import 'package:base_flutter_project/model/role.dart';
import 'package:base_flutter_project/repository/employee_repository.dart';
import 'package:collection/collection.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EmployeeController extends GetxController {
  final repository = EmployeeRepository();
  var employee = Rxn<Employee>();
  var activityHistory = <String, List<ActivityHistory>>{}.obs;
  var roles = <Role>[].obs;
  final projects = <Project>[].obs;

  @override
  void onInit() {
    repository.getEmployeeInfo().then((value) {
      employee.value = value;
      if (value.activityHistory != null) {
        activityHistory.value = groupBy(value.activityHistory!, (p0) {
          var dateTime = DateFormat("yyyy/MM/dd HH:mm:ss").parse(p0.createdAt);
          return DateFormat("yyyy/MM/dd").format(dateTime);
        });
      }
      if (value.roles != null) {
        roles.value = value.roles!;
      }
      if (value.projects != null) {
        projects.value = value.projects!;
      }
    });
    super.onInit();
  }

  final modules = <String>[
    "module 1",
    "module 2",
    "module 3",
    "module 4",
    "module 5",
    "module 6",
    "module 7",
  ];

  String? moduleSelected;
}