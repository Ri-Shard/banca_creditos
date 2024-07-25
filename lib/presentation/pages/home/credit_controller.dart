import 'dart:io';
import 'package:banca_creditos/domain/entities/credit.dart';
import 'package:banca_creditos/domain/repositories/credit_repository.dart';
import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

import 'package:path_provider/path_provider.dart';

class CreditController extends GetxController {
  final CreditRepositoryInterface creditRepositoryInterface;

  CreditController({required this.creditRepositoryInterface});

  final TextEditingController salarycontroller = TextEditingController();
  final TextEditingController quotacontroller = TextEditingController();
  final TextEditingController valuecontroller = TextEditingController();
  double interest = 0;
  double simulateresult = 0;
  String maxdebtresult = '';
  List<Credit> creditslist = [];

  Future<List<Credit>> getCredits() async {
    creditslist = await creditRepositoryInterface.getCredits();
    return creditslist;
  }

  String maxdebt() {
    final salary = int.parse(salarycontroller.text);

    maxdebtresult = (((salary) * 7) / 0.15).toStringAsFixed(2);
    return maxdebtresult;
  }

  String simulate() {
    int cantidadcuotas = int.parse(quotacontroller.text);
    int deuda = int.parse(valuecontroller.text);

    double numerador = deuda * interest;
    num denominador = 1 - math.pow(1 + interest, -cantidadcuotas);
    simulateresult = numerador / denominador;

    return simulateresult.toStringAsFixed(2);
  }

  List<Cuota> calcularTablaAmortizacion() {
    List<Cuota> tablaAmortizacion = [];
    double saldo = double.parse(valuecontroller.text);
    double valorCuota =
        double.parse(valuecontroller.text) / int.parse(quotacontroller.text);
    for (int i = 1; i <= int.parse(quotacontroller.text); i++) {
      double interes = saldo * interest;

      double abonoCapital = valorCuota - interes;

      if (saldo - abonoCapital < 0) {
        abonoCapital = saldo;
        valorCuota = abonoCapital + interes;
      }
      tablaAmortizacion.add(
        Cuota(
          numeroCuota: i,
          valorCuota: valorCuota,
          interes: interes,
          abonoCapital: abonoCapital,
        ),
      );

      saldo -= abonoCapital;
    }
    return tablaAmortizacion;
  }

  Future<String> saveCredit() async {
    final response = await creditRepositoryInterface.saveCredit(Credit('',
        amount: valuecontroller.text,
        date: DateTime.now().toString(),
        quota: quotacontroller.text,
        interest: interest));
    return response;
  }

  exportToExcel(List<Cuota> listcuota) async {
    try {
      var excel = Excel.createExcel();
      Sheet sheetObject = excel['data'];
      var cell = sheetObject.cell(CellIndex.indexByString('A1'));
      cell.value = TextCellValue('No. cuota');
      var cell2 = sheetObject.cell(CellIndex.indexByString('A2'));
      cell2.value = TextCellValue('Valor Cuota');
      var cell3 = sheetObject.cell(CellIndex.indexByString('A3'));
      cell3.value = TextCellValue('Interes');
      var cell4 = sheetObject.cell(CellIndex.indexByString('A4'));
      cell4.value = TextCellValue('Abono a capital');

      for (var row = 0; row < listcuota.length; row++) {
        sheetObject
            .cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: row + 1))
            .value = IntCellValue(listcuota[row].numeroCuota);
        sheetObject
            .cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: row + 1))
            .value = DoubleCellValue(listcuota[row].valorCuota);
        sheetObject
            .cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: row + 1))
            .value = DoubleCellValue(listcuota[row].interes);
        sheetObject
            .cell(CellIndex.indexByColumnRow(columnIndex: 3, rowIndex: row + 1))
            .value = DoubleCellValue(listcuota[row].abonoCapital);
      }

      var fileBytes = excel.save();
      var directory = await getApplicationDocumentsDirectory();

      File(('$directory/output_file_name.xlsx'))
        ..createSync(recursive: true)
        ..writeAsBytesSync(fileBytes!);
    } catch (e) {}
  }
}

class Cuota {
  int numeroCuota;
  double valorCuota;
  double interes;
  double abonoCapital;

  Cuota({
    required this.numeroCuota,
    required this.valorCuota,
    required this.interes,
    required this.abonoCapital,
  });
}
