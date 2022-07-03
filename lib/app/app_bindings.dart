import 'package:base_flutter_project/services/network/network_info.dart';
import 'package:base_flutter_project/services/shared_data/storage_service.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() async {
    injectNetworkDependencies();
    injectControllers();
    await StorageService().init();
  }

  void injectControllers() {}

  void injectNetworkDependencies() {
    Get.put(NetworkInfo());
  }
}
