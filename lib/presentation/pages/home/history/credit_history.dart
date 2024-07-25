import 'package:banca_creditos/presentation/pages/home/credit_controller.dart';
import 'package:banca_creditos/presentation/widgets/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreditHistoryScreen extends StatelessWidget {
  final creditcontroller = Get.find<CreditController>();

  @override
  Widget build(BuildContext context) {
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
                rows: const <DataRow>[
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Center(
                        child: Text(
                          '\$12.000.000',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: MyTheme.textGray),
                        ),
                      )),
                      DataCell(Center(
                        child: Text(
                          '12/10/23',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: MyTheme.textBlack),
                        ),
                      )),
                      DataCell(Center(
                          child: Text(
                        '12',
                      ))),
                      DataCell(Center(
                        child: Text('1.5%',
                            style: TextStyle(
                              color: MyTheme.textBlack,
                            )),
                      )),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Center(
                        child: Text(
                          '\$12.000.000',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: MyTheme.textGray),
                        ),
                      )),
                      DataCell(Center(
                        child: Text(
                          '12/10/23',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: MyTheme.textBlack),
                        ),
                      )),
                      DataCell(Center(
                          child: Text(
                        '12',
                      ))),
                      DataCell(Center(
                        child: Text('1.5%',
                            style: TextStyle(
                              color: MyTheme.textBlack,
                            )),
                      )),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
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
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
