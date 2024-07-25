import 'package:banca_creditos/domain/repositories/credit_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'dart:math' as math;

class CreditController extends GetxController {
  final CreditRepositoryInterface creditRepositoryInterface;

  CreditController({required this.creditRepositoryInterface});

  final TextEditingController salarycontroller = TextEditingController();
  final TextEditingController feecontroller = TextEditingController();
  final TextEditingController valuecontroller = TextEditingController();
  double interest = 0;

  String maxdebt() {
    final salary = int.parse(salarycontroller.text);
    final salaryPercent = salary * 0.15;

    final maxdebt = (((salary) * 7) / 0.15).toStringAsFixed(2);
    return maxdebt;
  }

  String simulate() {
    num simulateresult = (double.parse(valuecontroller.text) * interest) /
        math.pow(1 - (1 + interest), int.parse(feecontroller.text));
    print(simulateresult);
    return simulateresult.toString();
  }
}
