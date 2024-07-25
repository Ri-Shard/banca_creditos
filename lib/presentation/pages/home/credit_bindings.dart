import 'package:banca_creditos/domain/repositories/credit_repository.dart';
import 'package:banca_creditos/presentation/pages/auth/auth_controller.dart';
import 'package:banca_creditos/presentation/pages/home/credit_controller.dart';
import 'package:get/get.dart';

class CreditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreditController(creditRepositoryInterface: Get.find()));
    Get.lazyPut(() => LoginController(loginRepositoryInterface: Get.find()));
  }
}
