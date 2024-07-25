import 'package:banca_creditos/presentation/pages/auth/auth_controller.dart';
import 'package:get/get.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController(loginRepositoryInterface: Get.find()));
  }
}
