import 'package:base_flutter_project/routes/routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  var initController = false;

  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 1)).then((_) {
      Get.toNamed(RouteName.root);
    });
  }
}
