import 'package:banca_creditos/presentation/pages/home/credit_controller.dart';
import 'package:banca_creditos/presentation/pages/home/widgets/max_cuota_modal.dart';
import 'package:banca_creditos/presentation/widgets/buttons.dart';
import 'package:banca_creditos/presentation/widgets/dropdown.dart';
import 'package:banca_creditos/presentation/widgets/input.dart';
import 'package:banca_creditos/presentation/widgets/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SimulatorScreen extends StatelessWidget {
  final GlobalKey<FormState> _key = GlobalKey();
  final creditcontroller = Get.find<CreditController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
      child: Form(
        key: _key,
        child: ListView(
          children: [
            const Row(
              children: [
                Text(
                  'Simulador de crédito ',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: MyTheme.purplebutton),
                ),
                Icon(
                  Icons.info_outline,
                  color: MyTheme.purplebutton,
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Ingresa los datos para tu crédito según lo que necesites.',
              style: TextStyle(fontSize: 18, color: MyTheme.textBlack),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              '¿Qué tipo de créditos deseas realizar?',
              style: TextStyle(fontSize: 14, color: MyTheme.textBlack),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomDropdownButton(
              items: const [
                'Selecciona el tipo de créditos',
                'Crédito de vehículo',
                'Crédito de vivienda',
                'Crédito de libre inversión'
              ],
              hint: 'Selecciona el tipo de créditos',
              initialValue: 'Selecciona el tipo de créditos',
              onChanged: (value) {
                if (value == 'Crédito de vehículo') {
                  creditcontroller.interest = 0.3;
                }
                if (value == 'Crédito de vivienda') {
                  print('0.1');
                  creditcontroller.interest = 0.1;
                }
                if (value == 'Crédito de libre inversión') {
                  print('0.35');
                  creditcontroller.interest = 0.35;
                }

                print(value);
              },
              textStyle:
                  const TextStyle(fontSize: 14, color: MyTheme.anotherTextGray),
              dropdownTextStyle:
                  const TextStyle(fontSize: 14, color: MyTheme.anotherTextGray),
              borderRadius: 6,
            ),
            const Text(
              '¿Cuánto es tu salario base?',
              style: TextStyle(fontSize: 14, color: MyTheme.textBlack),
            ),
            const SizedBox(
              height: 10,
            ),
            Custominput(
                onChanged: (p0) {
                  creditcontroller.valuecontroller.text =
                      creditcontroller.maxdebt();
                },
                inputType: TextInputType.number,
                hint: '\$ 10’000.000,00',
                validator: (p0) {
                  if (p0!.isEmpty) {
                    return 'Campo vacio, ingrese un valor';
                  }
                },
                controller: creditcontroller.salarycontroller),
            const Text(
              ' Digíta tu salario para calcular el préstamo que necesitas',
              style: TextStyle(fontSize: 12, color: MyTheme.textBlack),
            ),
            const SizedBox(
              height: 10,
            ),
            Custominput(
              hint: '0',
              enable: false,
              controller: creditcontroller.valuecontroller,
            ),
            const Text(
              '¿A cuántos meses?',
              style: TextStyle(fontSize: 14, color: MyTheme.textBlack),
            ),
            const SizedBox(
              height: 10,
            ),
            Custominput(
              inputType: TextInputType.number,
              hint: '48',
              validator: (p0) {
                if (p0!.isEmpty) {
                  return 'Campo vacio, ingrese un valor';
                }
                if (int.parse(p0) < 12 || int.parse(p0) > 84) {
                  return 'Minimo 12 cuotas y maximo 84 cuotas';
                }
              },
              controller: creditcontroller.feecontroller,
            ),
            const Text(
              ' Elije un plazo desde 12 hasta 84 meses',
              style: TextStyle(fontSize: 12, color: MyTheme.textBlack),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: Buttons(
                color: MyTheme.purplebutton,
                content: const Text('Simular',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                ontap: () async {
                  if (_key.currentState!.validate()) {
                    final response = await creditcontroller.simulate();
                    showModalBottomSheet(
                        context: context,
                        builder: (builder) {
                          return Container(
                            decoration: BoxDecoration(
                              color: MyTheme.backgroundwhite,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            height: MediaQuery.of(context).size.height * 0.50,
                            child: MaxCuotaModal(),
                          );
                        });
                    // Get.offAllNamed('/loading');
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
