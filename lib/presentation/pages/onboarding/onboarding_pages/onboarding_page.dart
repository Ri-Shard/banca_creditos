import 'package:banca_creditos/presentation/pages/auth/auth_controller.dart';
import 'package:banca_creditos/presentation/widgets/buttons.dart';
import 'package:banca_creditos/presentation/widgets/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingPage extends StatelessWidget {
  final String image;
  final String text;

  OnboardingPage({super.key, required this.image, required this.text});
  final authcontroller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image(
          image: AssetImage(image),
          fit: BoxFit.fill,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SizedBox(
                width: 358,
                child: Text(
                  text,
                  style: const TextStyle(color: Colors.white, fontSize: 26),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Buttons(
              color: Colors.white,
              borderColor: Colors.transparent,
              content: const Text('Ingresar',
                  style: TextStyle(
                      color: MyTheme.black, fontWeight: FontWeight.bold)),
              ontap: () async {
                final response = await authcontroller.verifyUser();
                if (response == 'logged') {
                  Get.offAllNamed('/home');
                } else {
                  Get.offAllNamed('/login');
                }
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: Buttons(
                color: MyTheme.purplebutton,
                content: const Text('Registrarme',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                ontap: () {
                  Get.offAllNamed('/register');
                },
              ),
            )
          ],
        ),
      ],
    );
  }
}
