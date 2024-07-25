// ignore_for_file: prefer_const_constructors

import 'package:banca_creditos/presentation/pages/credit_result/widgets/save_modal.dart';
import 'package:banca_creditos/presentation/pages/home/credit_controller.dart';
import 'package:banca_creditos/presentation/widgets/buttons.dart';
import 'package:banca_creditos/presentation/widgets/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreditResultScreen extends StatelessWidget {
  CreditResultScreen({super.key});
  final creditcontroller = Get.find<CreditController>();

  @override
  Widget build(BuildContext context) {
    final localwidth = MediaQuery.of(context).size.width;
    final ishistory = Get.arguments;

    List<Cuota> table = creditcontroller.calcularTablaAmortizacion(
        double.parse(creditcontroller.valuecontroller.text),
        int.parse(creditcontroller.quotacontroller.text),
        creditcontroller.interest);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: MyTheme.backgroundwhite,
      ),
      backgroundColor: MyTheme.backgroundwhite,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Resultado de tu\n simulador de crédito',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: MyTheme.purplebutton),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications_active_outlined,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Te presentamos en tu tabla de amortización el\n resultado del movimiento de tu crédito.',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 16, color: MyTheme.textBlack),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tabla de créditos',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: MyTheme.textBlack),
                ),
                Container(
                    child: IconButton(
                        onPressed: () {}, icon: Icon(Icons.tune_outlined)))
              ],
            ),
            SingleChildScrollView(
              child: SizedBox(
                width: 20,
                child: DataTable(
                  horizontalMargin: 0.0,
                  columnSpacing: 0,
                  headingTextStyle:
                      TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  dataTextStyle: TextStyle(
                    fontSize: 12,
                  ),
                  columns: const <DataColumn>[
                    DataColumn(
                      label: Text('No. Cuota'),
                    ),
                    DataColumn(
                      label: Text('Valor de cuota'),
                    ),
                    DataColumn(
                      label: Text('Interés'),
                    ),
                    DataColumn(
                      label: Text('Abono a capital'),
                    ),
                  ],
                  rows: table.map((row) {
                    return DataRow(
                      cells: [
                        DataCell(Text(row.numeroCuota.toString())),
                        DataCell(Text(row.valorCuota.toStringAsFixed(2),
                            style: TextStyle(color: MyTheme.textGray))),
                        DataCell(Text(row.interes.toStringAsFixed(2))),
                        DataCell(Text(row.abonoCapital.toStringAsFixed(2),
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold))),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
            Buttons(
              color: MyTheme.purplebutton,
              content: const Text('Descargar tabla',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
              ontap: () async {
                await creditcontroller.exportToExcel(table);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            ishistory == null
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 50),
                    child: Buttons(
                      color: Colors.white,
                      borderColor: MyTheme.purplebutton,
                      content: const Text('Guardar cotización',
                          style: TextStyle(
                              color: MyTheme.purplebutton,
                              fontWeight: FontWeight.bold)),
                      ontap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (builder) {
                              return Container(
                                decoration: BoxDecoration(
                                  color: MyTheme.backgroundwhite,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                height:
                                    MediaQuery.of(context).size.height * 0.50,
                                child: SaveModal(),
                              );
                            });
                      },
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
