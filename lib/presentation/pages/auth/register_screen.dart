import 'package:banca_creditos/presentation/pages/auth/auth_controller.dart';
import 'package:banca_creditos/presentation/widgets/buttons.dart';
import 'package:banca_creditos/presentation/widgets/input.dart';
import 'package:banca_creditos/presentation/widgets/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class RegisterScreen extends GetWidget<LoginController> {
  final authcontroller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _key = GlobalKey();

    var _value = false;
    return Scaffold(
      backgroundColor: MyTheme.backgroundwhite,
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _key,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/images/BackRegister.png',
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 80),
                    child: SvgPicture.asset('assets/images/LogoRegister.svg'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Registrate',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: MyTheme.textBlack),
                  ),
                  const Text('Solo te tomará unos minutos',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: MyTheme.textGray)),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text('Nombre completo',
                      style: TextStyle(fontSize: 14, color: MyTheme.textGray)),
                  Custominput(
                    hint: 'Escribe tu nombre',
                    controller: authcontroller.namecontroller,
                    validator: (p0) {
                      if (p0!.isEmpty) {
                        return 'Campo vacio, ingrese un nombre';
                      }
                    },
                    prefix: Icon(
                      Icons.person_outline,
                      color: MyTheme.textGray,
                    ),
                  ),
                  const Text('Identificación',
                      style: TextStyle(fontSize: 14, color: MyTheme.textGray)),
                  Custominput(
                    inputType: TextInputType.number,
                    controller: authcontroller.idcontroller,
                    hint: 'Escribe tu número de identificación',
                    validator: (p0) {
                      if (p0!.isEmpty) {
                        return 'Campo vacio, ingrese una identificacion';
                      }
                    },
                  ),
                  Text('Email',
                      style: TextStyle(fontSize: 14, color: MyTheme.textGray)),
                  Custominput(
                    inputType: TextInputType.emailAddress,
                    controller: authcontroller.emailcontroller,
                    hint: 'uname@mail.com',
                    validator: (p0) {
                      if (p0!.isEmpty) {
                        return 'Campo vacio, ingrese un correo';
                      }
                      if (p0 != null) {
                        if (!GetUtils.isEmail(p0.trim())) {
                          return 'Correo no valido';
                        }
                      }
                    },
                    prefix: Icon(
                      Icons.person_outline,
                      color: MyTheme.textGray,
                    ),
                  ),
                  const Text('Contraseña',
                      style: TextStyle(fontSize: 14, color: MyTheme.textGray)),
                  Custominput(
                    obscureText: true,
                    controller: authcontroller.passwordcontroller,
                    hint: 'Contraseña',
                    validator: (p0) {
                      if (p0!.isEmpty) {
                        return 'Campo vacio, ingrese una contraseña valida';
                      }
                    },
                    prefix: Icon(
                      Icons.lock_outlined,
                      color: MyTheme.textGray,
                    ),
                  ),
                  Row(
                    children: [
                      Checkbox(value: _value, onChanged: (newValue) {}),
                      RichText(
                          text: const TextSpan(
                              text: 'Acepto los ',
                              style: TextStyle(
                                  fontSize: 13, color: MyTheme.textBlack),
                              children: <TextSpan>[
                            TextSpan(
                                text: 'Términos ',
                                style: TextStyle(color: MyTheme.purplebutton)),
                            TextSpan(
                                text: 'y ',
                                style: TextStyle(color: MyTheme.textBlack)),
                            TextSpan(
                                text: 'Condiciones ',
                                style: TextStyle(color: MyTheme.purplebutton)),
                            TextSpan(
                                text: 'y la ',
                                style: TextStyle(color: MyTheme.textBlack)),
                            TextSpan(
                                text: 'Política de\nprivacidad ',
                                style: TextStyle(color: MyTheme.purplebutton)),
                            TextSpan(
                                text: 'de Banca créditos',
                                style: TextStyle(color: MyTheme.textBlack)),
                          ])),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 50),
                    child: Buttons(
                      color: MyTheme.purplebutton,
                      content: const Text('Continuar',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      ontap: () async {
                        if (_key.currentState!.validate()) {
                          final response = await authcontroller.saveUser();

                          if (response == 'Guardado') {
                            Get.offAllNamed('/home');
                          } else {
                            Get.snackbar('Error', 'Error al ingresar');
                          }
                        }
                      },
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.offAllNamed('/login');
                    },
                    child: Center(
                      child: RichText(
                          text: const TextSpan(
                              text: '¿Ya tienes una cuenta? ',
                              style: TextStyle(
                                  fontSize: 13, color: MyTheme.anotherTextGray),
                              children: <TextSpan>[
                            TextSpan(
                                text: 'Inicia sesión ',
                                style: TextStyle(color: MyTheme.purplebutton)),
                          ])),
                    ),
                  ),
                  const SizedBox(
                    height: 200,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
