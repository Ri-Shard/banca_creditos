import 'package:banca_creditos/presentation/pages/home/credit_controller.dart';
import 'package:banca_creditos/presentation/widgets/buttons.dart';
import 'package:banca_creditos/presentation/widgets/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SaveModal extends StatelessWidget {
  SaveModal({Key? key}) : super(key: key);
  final creditcontroller = Get.find<CreditController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const CircleAvatar(
                    backgroundColor: MyTheme.backgroundwhite,
                    child: Icon(
                      Icons.close,
                      color: MyTheme.purplebutton,
                    ),
                  ),
                ),
              ),
              const Center(
                child: Icon(
                  Icons.info_outline,
                  color: Colors.red,
                  size: 80,
                ),
              ),
            ],
          ),
          const Text(
            '¿Está seguro que desea\n Guardar la cotización?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
              'La cotización realizada la podrás consultar \nen tu historial de créditos.',
              textAlign: TextAlign.center,
              style: TextStyle(color: MyTheme.black, fontSize: 14)),
          const SizedBox(height: 24),
          Buttons(
            color: MyTheme.purplebutton,
            content: const Text('Guardar',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            ontap: () async {
              final response = await creditcontroller.saveCredit();
              if (response == 'Guardado') {
                Get.toNamed('/home');
              } else {
                Get.snackbar('Error', 'Error al guardar');
              }
            },
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: Buttons(
              color: Colors.white,
              borderColor: MyTheme.purplebutton,
              content: const Text('Cancelar',
                  style: TextStyle(
                      color: MyTheme.purplebutton,
                      fontWeight: FontWeight.bold)),
              ontap: () {
                Get.back();
              },
            ),
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
