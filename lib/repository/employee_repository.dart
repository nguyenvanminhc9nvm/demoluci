import 'package:base_flutter_project/model/activity_history.dart';
import 'package:base_flutter_project/model/cccd.dart';
import 'package:base_flutter_project/model/employee.dart';
import 'package:base_flutter_project/model/project.dart';
import 'package:base_flutter_project/model/role.dart';
import 'package:base_flutter_project/theme/images.dart';

class EmployeeRepository {
  Future<Employee> getEmployeeInfo() {
    var response = Employee(
      id: 1,
      employeeId: "NL08273",
      avatar: AppImages.avatar,
      username: "hiennt",
      fullName: "Hoàng Thu Hiền",
      email: "hienht@gmail.com",
      phoneNumber: 01986486129,
      birthday: "15/12/1998",
      gender: "Nữ",
      address: "Tổ 3, Nghĩa Đô, Cầu giấy, Hà Nội",
      citizenIdentification:
          CitizenIdentification(1, "1234567890", "CA, Hà Nội", "12/06/2020"),
      note: "Quản lý phòng kế toán tập đoàn",
      activityHistory: [
        ActivityHistory(
          1,
          "Chỉnh Sửa thông tin bất động sản",
          "2022/03/16 16:30:24",
        ),
        ActivityHistory(
          2,
          "Chỉnh Sửa thông tin bất động sản",
          "2022/03/16 13:30:24",
        ),
        ActivityHistory(
          3,
          "Chỉnh Sửa thông tin bất động sản",
          "2022/03/15 16:30:24",
        ),
        ActivityHistory(
          4,
          "Thêm mới bất động sản",
          "2022/03/15 15:30:24",
        ),
        ActivityHistory(
          5,
          "Đăng nhập hệ thống",
          "2022/03/15 08:30:24",
        ),
      ],
      roles: [
        Role(
          1,
          "Quản lý",
          "Phòng Kế toán",
          1,
        ),
        Role(
          1,
          "Nhân viên",
          "Phòng CSKH",
          1,
        ),
      ],
      projects: [
        Project(
          1,
          "Dự án A",
          "Kế toán trưởng",
        ),
        Project(
          1,
          "Dự án B",
          "Kế toán trưởng",
        ),
        Project(
          1,
          "Dự án C",
          "Kế toán trưởng",
        ),
      ],
    );
    return Future.value(response);
  }
}
