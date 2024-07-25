import 'package:banca_creditos/domain/entities/userbank.dart';
import 'package:banca_creditos/domain/repositories/login_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final LoginRepositoryInterface loginRepositoryInterface;

  LoginController({required this.loginRepositoryInterface});
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController idcontroller = TextEditingController();
  final TextEditingController namecontroller = TextEditingController();

  @override
  void onReady() {
    super.onReady();
  }

  Future<String> login() async {
    final email = emailcontroller.text;
    final password = passwordcontroller.text;

    final response = await loginRepositoryInterface.login(email, password);
    return response;
  }

  Future<String> saveUser() async {
    final response = await loginRepositoryInterface.saveUser(UserBank(
        name: namecontroller.text,
        id: idcontroller.text,
        email: emailcontroller.text,
        password: passwordcontroller.text));
    return response;
  }

  verifyUser() async {
    final response = await loginRepositoryInterface.verifyUser();
    return response;
  }
}
