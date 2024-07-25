import 'package:banca_creditos/presentation/pages/home/credit_controller.dart';
import 'package:banca_creditos/presentation/pages/home/history/credit_history.dart';
import 'package:banca_creditos/presentation/pages/home/simulator/simulator_screen.dart';
import 'package:banca_creditos/presentation/widgets/buttons.dart';
import 'package:banca_creditos/presentation/widgets/dropdown.dart';
import 'package:banca_creditos/presentation/widgets/input.dart';
import 'package:banca_creditos/presentation/widgets/my_theme.dart';
import 'package:banca_creditos/presentation/pages/home/credit_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomepageScreen extends GetWidget<CreditController> {
  final creditcontroller = Get.find<CreditController>();
  int index = 0;
  List<Widget> views = [
    SimulatorScreen(),
    CreditHistoryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final localwidth = MediaQuery.of(context).size.width;

    return GetBuilder<CreditController>(
        id: 'homeview',
        builder: (context) {
          return Scaffold(
              bottomNavigationBar: Container(
                decoration: BoxDecoration(
                  border:
                      Border.all(color: MyTheme.anotherTextGray, width: 0.2),
                ),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        index = 0;
                        creditcontroller.update(['homeview']);
                      },
                      child: SizedBox(
                        width: localwidth / 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.home_filled,
                                color: index == 0
                                    ? MyTheme.purplebutton
                                    : MyTheme.textGray),
                            Text(
                              'Home',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: index == 0
                                      ? MyTheme.purplebutton
                                      : MyTheme.textGray),
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        index = 1;
                        creditcontroller.update(['homeview']);
                      },
                      child: SizedBox(
                        width: localwidth / 2.1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.wallet,
                                color: index == 1
                                    ? MyTheme.purplebutton
                                    : MyTheme.textGray),
                            Text(
                              'Historial créditos',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: index == 1
                                      ? MyTheme.purplebutton
                                      : MyTheme.textGray),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              backgroundColor: MyTheme.backgroundwhite,
              body: PageView(
                children: [views[index]],
              ));
        });
  }
}
