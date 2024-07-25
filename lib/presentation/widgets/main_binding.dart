import 'package:banca_creditos/data/repositories/credit_repository_impl.dart';
import 'package:banca_creditos/data/repositories/login_repository_impl.dart';
import 'package:banca_creditos/domain/repositories/credit_repository.dart';
import 'package:banca_creditos/domain/repositories/login_repository.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginRepositoryInterface>(() => LoginReprositoryImpl());
    Get.lazyPut<CreditRepositoryInterface>(() => CreditRepositoryImpl());
  }
}
