import 'package:base_flutter_project/network/app_client.dart';
import 'package:base_flutter_project/network/network_info.dart';
import 'package:base_flutter_project/services/shared_data/storage_service.dart';
import 'package:base_flutter_project/utils/database_helper.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() async {
    injectNetworkDependencies();
    injectControllers();
    await DatabaseHelper().initDataBase();
    await StorageService().init();
  }

  void injectControllers() {}

  void injectNetworkDependencies() {
    Get.put(NetworkInfo());
    Get.put(AppClient());
  }
}
