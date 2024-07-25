import 'package:banca_creditos/presentation/widgets/buttons.dart';
import 'package:banca_creditos/presentation/widgets/my_theme.dart';
import 'package:flutter/material.dart';

class CheckScreen extends StatelessWidget {
  const CheckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localheight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: MyTheme.backgroundwhite,
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.asset(
              'assets/images/fadecheck.png',
              fit: BoxFit.fitHeight,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/success.png'),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Registro exitoso',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: MyTheme.textBlack),
              ),
              const Text(
                  'Hemos guardado tus credenciales de forma exitosa, Presiona continuar para seguir adelante.',
                  textAlign: TextAlign.center,
                  style:
                      const TextStyle(fontSize: 16, color: MyTheme.textGray)),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: Buttons(
                  color: MyTheme.purplebutton,
                  content: const Text('Continuar',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  ontap: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
