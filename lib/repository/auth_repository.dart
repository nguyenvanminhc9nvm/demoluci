import 'dart:convert';

import 'package:base_flutter_project/model/employee.dart';
import 'package:base_flutter_project/model/user.dart';

class AuthRepository {
  Future<User> getUserInfo() {
    return Future.value(
      User(
        1,
        "HieuLQ",
        "https://i.pinimg.com/originals/60/d5/bd/60d5bdc60ea11141bd64e1680c738884.jpg",
      ),
    );
  }
}
