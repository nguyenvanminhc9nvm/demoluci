import 'package:base_flutter_project/model/activity_history.dart';
import 'package:base_flutter_project/model/cccd.dart';
import 'package:base_flutter_project/model/employee.dart';
import 'package:base_flutter_project/model/project.dart';
import 'package:base_flutter_project/model/role.dart';
import 'package:base_flutter_project/theme/theme.dart';

class ListEmployeeRepository {
  Future<List<Employee>> getListEmployee() {
    var response = [
      Employee(
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
        citizenIdentification: CitizenIdentification(
          1,
          "1234567890",
          "CA, Hà Nội",
          "12/06/2020",
        ),
        note: "Quản lý phòng kế toán tập đoàn",
        activityHistory: [
          ActivityHistory(
            1,
            "Chỉnh Sửa thông tin bất động sản",
            "16/03/2022 16:30:24",
          )
        ],
        roles: [Role(1, "Kế toán trưởng", "Phòng Kế toán", 1)],
        projects: [
          Project(1, "Dự án 1", "Kế toán trưởng"),
        ],
      ),
      Employee(
        id: 1,
        employeeId: "NL08273",
        avatar: AppImages.avatar,
        username: "hiennt",
        fullName: "Hoàng Thu Hiền",
        email: "hienht@gmail.com",
        phoneNumber: 01986486129,
        birthday: "15/12/19988",
        gender: "Nữ",
        address: "Tổ 3, Nghĩa Đô, Cầu giấy, Hà Nội",
        citizenIdentification: CitizenIdentification(
          1,
          "1234567890",
          "CA, Hà Nội",
          "12/06/2020",
        ),
        note: "Quản lý phòng kế toán tập đoàn",
        activityHistory: [
          ActivityHistory(
            1,
            "Chỉnh Sửa thông tin bất động sản",
            "16/03/2022 16:30:24",
          )
        ],
        roles: [Role(1, "Kế toán trưởng", "Phòng Kế toán", 1)],
        projects: [
          Project(1, "Dự án 1", "Kế toán trưởng"),
        ],
      ),
      Employee(
        id: 1,
        employeeId: "NL08273",
        avatar: AppImages.avatar,
        username: "hiennt",
        fullName: "Hoàng Thu Hiền",
        email: "hienht@gmail.com",
        phoneNumber: 01986486129,
        birthday: "15/12/19988",
        gender: "Nữ",
        address: "Tổ 3, Nghĩa Đô, Cầu giấy, Hà Nội",
        citizenIdentification: CitizenIdentification(
          1,
          "1234567890",
          "CA, Hà Nội",
          "12/06/2020",
        ),
        note: "Quản lý phòng kế toán tập đoàn",
        activityHistory: [
          ActivityHistory(
              1, "Chỉnh Sửa thông tin bất động sản", "16/03/2022 16:30:24")
        ],
        roles: [Role(1, "Kế toán trưởng", "Phòng Kế toán", 1)],
        projects: [
          Project(1, "Dự án 1", "Kế toán trưởng"),
        ],
      ),
      Employee(
        id: 1,
        employeeId: "NL08273",
        avatar: AppImages.avatar,
        username: "hiennt",
        fullName: "Hoàng Thu Hiền",
        email: "hienht@gmail.com",
        phoneNumber: 01986486129,
        birthday: "15/12/19988",
        gender: "Nữ",
        address: "Tổ 3, Nghĩa Đô, Cầu giấy, Hà Nội",
        citizenIdentification: CitizenIdentification(
          1,
          "1234567890",
          "CA, Hà Nội",
          "12/06/2020",
        ),
        note: "Quản lý phòng kế toán tập đoàn",
        activityHistory: [
          ActivityHistory(
              1, "Chỉnh Sửa thông tin bất động sản", "16/03/2022 16:30:24")
        ],
        roles: [Role(1, "Kế toán trưởng", "Phòng Kế toán", 1)],
        projects: [
          Project(1, "Dự án 1", "Kế toán trưởng"),
        ],
      )
    ];

    return Future.value(response);
  }
}
