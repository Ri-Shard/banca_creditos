import 'package:banca_creditos/presentation/pages/auth/auth_controller.dart';
import 'package:banca_creditos/presentation/pages/home/credit_controller.dart';
import 'package:banca_creditos/presentation/pages/home/widgets/max_cuota_modal.dart';
import 'package:banca_creditos/presentation/widgets/buttons.dart';
import 'package:banca_creditos/presentation/widgets/dropdown.dart';
import 'package:banca_creditos/presentation/widgets/input.dart';
import 'package:banca_creditos/presentation/widgets/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SimulatorScreen extends StatelessWidget {
  final GlobalKey<FormState> _key = GlobalKey();
  final creditcontroller = Get.find<CreditController>();
  final logincontroller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    NumberFormat currencyFormat = NumberFormat.simpleCurrency();

    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
      child: Scaffold(
        body: Form(
          key: _key,
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Hola ${logincontroller.name} 👋',
                    style: TextStyle(fontSize: 24),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.notifications_active_outlined))
                ],
              ),
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
                '¿Qué tipo de crédito deseas realizar?',
                style: TextStyle(fontSize: 14, color: MyTheme.textBlack),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomDropdownButton(
                items: const [
                  'Selecciona el tipo de crédito',
                  'Crédito de vehículo',
                  'Crédito de vivienda',
                  'Crédito de libre inversión'
                ],
                hint: 'Selecciona el tipo de crédito',
                initialValue: 'Selecciona el tipo de crédito',
                onChanged: (value) {
                  if (value == 'Crédito de vehículo') {
                    creditcontroller.interest = 0.03;
                  }
                  if (value == 'Crédito de vivienda') {
                    creditcontroller.interest = 0.01;
                  }
                  if (value == 'Crédito de libre inversión') {
                    creditcontroller.interest = 0.035;
                  }

                  print(value);
                },
                textStyle: const TextStyle(
                    fontSize: 14, color: MyTheme.anotherTextGray),
                dropdownTextStyle: const TextStyle(
                    fontSize: 14, color: MyTheme.anotherTextGray),
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
                controller: creditcontroller.quotacontroller,
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
                    if (_key.currentState!.validate() &&
                        creditcontroller.interest != 0) {
                      final response = await creditcontroller.simulatequota();
                      Get.toNamed('/loading');

                      // showModalBottomSheet(
                      //     context: context,
                      //     builder: (builder) {
                      //       return Container(
                      //         decoration: BoxDecoration(
                      //           color: MyTheme.backgroundwhite,
                      //           borderRadius: BorderRadius.circular(10),
                      //         ),
                      //         height: MediaQuery.of(context).size.height * 0.50,
                      //         child: MaxCuotaModal(
                      //           maxcuotadebt: creditcontroller.maxdebt(),
                      //         ),
                      //       );
                      //     });
                      // Get.offAllNamed('/loading');
                    } else {
                      Get.snackbar('Error', 'Debe llenar todos los campos');
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
