import 'package:base_flutter_project/model/user.dart';
import 'package:base_flutter_project/repository/auth_repository.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  final repository = AuthRepository();
  var user = Rxn<User>();
  final titles = <String>["Quản lý bộ phận cấp tập trung", "Hoàng Thu Hiền"].obs;

  void addTitle(String title) {
    // final newTitles = titles.toList();
    // newTitles.add(title);
    // titles.value = newTitles;
  }

  void removeTitles() {
    // if (titles.toList().length == 1) {
    //   return;
    // }
    // titles.removeLast();
  }

  @override
  void onInit() {
    repository.getUserInfo().then((value) {
      user.value = value;
    });
    super.onInit();
  }

}
