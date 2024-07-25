import 'package:banca_creditos/presentation/widgets/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:circular_gradient_spinner/circular_gradient_spinner.dart';

class LoaderWidget extends StatelessWidget {
  const LoaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularGradientSpinner(
              color: MyTheme.purplebutton,
              size: 200,
              strokeWidth: 20,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Simulando Credito',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: MyTheme.purplebutton),
            ),
          ],
        ),
      ),
    );
  }
}
