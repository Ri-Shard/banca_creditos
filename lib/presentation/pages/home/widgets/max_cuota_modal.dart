import 'package:banca_creditos/presentation/pages/home/credit_controller.dart';
import 'package:banca_creditos/presentation/widgets/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class MaxCuotaModal extends StatelessWidget {
  MaxCuotaModal({Key? key}) : super(key: key);
  final creditcontroller = Get.find<CreditController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text(
                'Cuota máxima de préstamo',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  Get.toNamed('/loading');
                },
                child: CircleAvatar(
                  backgroundColor: MyTheme.backgroundwhite,
                  child: Icon(
                    Icons.close,
                    color: MyTheme.purplebutton,
                  ),
                ),
              )
            ],
          ),
          const Text(
            '\$185.798.098,00',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          const Text('*Este valor suele cambiar con respecto a tu salario',
              style: TextStyle(color: MyTheme.purplebutton, fontSize: 14)),
          const SizedBox(height: 24),
          _buildInfoRow('Tasa Efectiva Anual desde', '43.26%'),
          const SizedBox(height: 16),
          _buildInfoRow('Tasa Mensual Vencida desde', '3.04%'),
          const SizedBox(height: 16),
          _buildInfoRow('Valor total del prestamo', '\$950'),
          Divider(
            color: MyTheme.anotherTextGray,
          ),
          const SizedBox(height: 16),
          _buildInfoRow(
            'Valor total a pagar',
            '\$1.112.501',
          ),
          _buildInfoRow(
            '(capital + intereses + seguro)',
            '',
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
