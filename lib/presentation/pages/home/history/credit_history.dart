import 'package:banca_creditos/domain/entities/credit.dart';
import 'package:banca_creditos/presentation/pages/home/credit_controller.dart';
import 'package:banca_creditos/presentation/widgets/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CreditHistoryScreen extends StatelessWidget {
  final creditcontroller = Get.find<CreditController>();
  @override
  Widget build(BuildContext context) {
    NumberFormat currencyFormat = NumberFormat.simpleCurrency();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Historial de créditos',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: MyTheme.textBlack),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications_active_outlined,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Aquí encontrarás tu historial de créditos y el \n registro de todas tus simulaciones.',
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 16, color: MyTheme.textBlack),
          ),
          const SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            child: SizedBox(
              width: 20,
              child: DataTable(
                showCheckboxColumn: false,
                horizontalMargin: 1,
                columnSpacing: 0,
                dataRowHeight: 40,
                headingTextStyle:
                    const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                dividerThickness: 1,
                dataTextStyle: const TextStyle(
                  fontSize: 12,
                ),
                columns: const <DataColumn>[
                  DataColumn(
                    label: Center(child: Text('Monto de crédito')),
                  ),
                  DataColumn(
                    label: Center(child: Text('Fecha')),
                  ),
                  DataColumn(
                    label: Center(child: Text('No. de cuotas')),
                  ),
                  DataColumn(
                    label: Center(
                        child: Text(
                      'Interés',
                    )),
                  ),
                ],
                rows: creditcontroller.creditslist.map((row) {
                  return DataRow(
                    onSelectChanged: (value) {
                      creditcontroller.valuecontroller.text = row.amount;
                      creditcontroller.maxdebtresult = row.amount;
                      creditcontroller.quotacontroller.text = row.quota;
                      creditcontroller.interest = row.interest;

                      creditcontroller.simulatequota();
                      Get.toNamed('/result', arguments: true);
                    },
                    cells: [
                      DataCell(Text(
                          currencyFormat.format(double.parse(row.amount)),
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: MyTheme.textGray))),
                      DataCell(Text(row.date,
                          style: const TextStyle(color: MyTheme.textBlack))),
                      DataCell(Text(row.quota)),
                      DataCell(Text('${row.interest * 100}%',
                          style: const TextStyle(
                              color: MyTheme.textBlack,
                              fontWeight: FontWeight.bold))),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.info_outline,
                color: MyTheme.anotherTextGray,
              ),
              Text(
                'No hay mas datos por mostrar',
                style: TextStyle(color: MyTheme.anotherTextGray, fontSize: 14),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
