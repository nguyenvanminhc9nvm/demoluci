import 'package:base_flutter_project/model/activity_history.dart';
import 'package:base_flutter_project/model/cccd.dart';
import 'package:base_flutter_project/model/project.dart';
import 'package:base_flutter_project/model/role.dart';

class Employee {
  final int? id;
  final String? employeeId;
  final String? avatar;
  final String? username;
  final String? fullName;
  final String? email;
  final int? phoneNumber;
  final String? birthday;
  final String? gender;
  final String? address;
  final CitizenIdentification? citizenIdentification;
  final String? note;
  final List<ActivityHistory>? activityHistory;
  final List<Role>? roles;
  final List<Project>? projects;

  Employee({
    required this.id,
    required this.employeeId,
    required this.avatar,
    required this.username,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.birthday,
    required this.gender,
    required this.address,
    required this.citizenIdentification,
    required this.note,
    required this.activityHistory,
    required this.roles,
    required this.projects,
  });
}
