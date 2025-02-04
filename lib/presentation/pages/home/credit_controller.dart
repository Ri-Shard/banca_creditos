import 'dart:io';
import 'package:banca_creditos/domain/entities/credit.dart';
import 'package:banca_creditos/domain/repositories/credit_repository.dart';
import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'dart:math' as math;

import 'package:path_provider/path_provider.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:external_path/external_path.dart';

class CreditController extends GetxController {
  final CreditRepositoryInterface creditRepositoryInterface;

  CreditController({required this.creditRepositoryInterface});

  final TextEditingController salarycontroller = TextEditingController();
  final TextEditingController quotacontroller = TextEditingController();
  final TextEditingController valuecontroller = TextEditingController();
  double interest = 0;
  double quotavalor = 0;
  String maxdebtresult = '';
  String maxdebtresultNoformat = '';
  List<Credit> creditslist = [];

  Future<List<Credit>> getCredits() async {
    creditslist = await creditRepositoryInterface.getCredits();
    return creditslist;
  }

  String maxdebt() {
    final salary = int.parse(salarycontroller.text);

    maxdebtresult = ((((salary) * 7) / 0.15) * 0.001).toStringAsFixed(2);
    return maxdebtresult;
  }

  String simulatequota() {
    int cantidadcuotas = int.parse(quotacontroller.text);

    double numerador = double.parse(maxdebtresult) * interest;
    num denominador = 1 - math.pow(1 + interest, -cantidadcuotas);
    quotavalor = numerador / denominador;

    return quotavalor.toStringAsFixed(2);
  }

  List<Cuota> calcularTablaAmortizacion(
      double saldo, int nrocuotas, double interes) {
    List<Cuota> tablaAmortizacion = [];
    for (int i = 1; i <= nrocuotas; i++) {
      double interesSaldo = saldo * interes;

      double abonoCapital = quotavalor - interesSaldo;

      if (saldo - abonoCapital < 0) {
        abonoCapital = saldo;
        quotavalor = abonoCapital + interesSaldo;
      }
      tablaAmortizacion.add(
        Cuota(
          numeroCuota: i,
          valorCuota: quotavalor,
          interes: interes * 100,
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
        date: DateFormat('dd/MM/yy').format(DateTime.now()),
        quota: quotacontroller.text,
        interest: interest));
    return response;
  }

  exportToExcel(List<Cuota> listcuota) async {
    try {
      final status = await Permission.storage.request();
      final permission = await Permission.manageExternalStorage.request();
      if (status.isGranted ||
          await Permission.storage.request().isGranted ||
          permission.isGranted) {
        var excel = Excel.createExcel();
        Sheet sheetObject = excel['data'];
        var cell = sheetObject.cell(CellIndex.indexByString('A1'));
        cell.value = TextCellValue('No. cuota');
        var cell2 = sheetObject.cell(CellIndex.indexByString('B1'));
        cell2.value = TextCellValue('Valor Cuota');
        var cell3 = sheetObject.cell(CellIndex.indexByString('C1'));
        cell3.value = TextCellValue('Interes');
        var cell4 = sheetObject.cell(CellIndex.indexByString('D1'));
        cell4.value = TextCellValue('Abono a capital');

        for (var row = 0; row < listcuota.length; row++) {
          sheetObject
              .cell(
                  CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: row + 1))
              .value = IntCellValue(listcuota[row].numeroCuota);
          sheetObject
              .cell(
                  CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: row + 1))
              .value = DoubleCellValue(listcuota[row].valorCuota);
          sheetObject
              .cell(
                  CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: row + 1))
              .value = DoubleCellValue(listcuota[row].interes);
          sheetObject
              .cell(
                  CellIndex.indexByColumnRow(columnIndex: 3, rowIndex: row + 1))
              .value = DoubleCellValue(listcuota[row].abonoCapital);
        }

        var directory = await ExternalPath.getExternalStoragePublicDirectory(
            ExternalPath.DIRECTORY_DOWNLOADS);
        print(directory);
        var exampleDirectory = Directory('${directory}/example');
        if (!await exampleDirectory.exists()) {
          await exampleDirectory.create();
        }
        print('${directory}/example/example.xlsx');
        final bytes = excel.encode();
        if (bytes != null) {
          File('${directory}/example/example.xlsx')
            ..createSync()
            ..writeAsBytesSync(bytes);
        }
      } else {
        await Permission.storage.request();
      }
    } catch (e) {
      print(e);
    }
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
