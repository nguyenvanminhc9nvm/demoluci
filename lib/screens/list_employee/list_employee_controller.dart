import 'package:base_flutter_project/model/employee.dart';
import 'package:base_flutter_project/repository/list_employee_repository.dart';
import 'package:get/get.dart';

class ListEmployeeController extends GetxController {
  final repository = ListEmployeeRepository();
  final employees = <Employee>[].obs;


  @override
  void onInit() {
    repository.getListEmployee().then((value) {
      employees.value = value;
    });
    super.onInit();
  }
}