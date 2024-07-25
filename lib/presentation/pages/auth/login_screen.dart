import 'package:banca_creditos/presentation/pages/auth/auth_controller.dart';
import 'package:banca_creditos/presentation/widgets/buttons.dart';
import 'package:banca_creditos/presentation/widgets/input.dart';
import 'package:banca_creditos/presentation/widgets/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LoginScreen extends GetWidget<LoginController> {
  final authcontroller = Get.find<LoginController>();
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _key = GlobalKey();

    var _value = false;
    return Scaffold(
      backgroundColor: MyTheme.backgroundwhite,
      body: Form(
        key: _key,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Transform.translate(
              offset: Offset(0, -500),
              child: Image.asset(
                'assets/images/BackLogin.png',
                fit: BoxFit.cover,
              ),
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
                  RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                          text: 'Inicia sesión o continua ',
                          style: TextStyle(
                              fontSize: 16,
                              color: MyTheme.textBlack,
                              fontWeight: FontWeight.bold),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'solo te tomará unos minutos.',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: MyTheme.textBlack,
                                    fontWeight: FontWeight.normal)),
                          ])),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text('Email',
                      style: TextStyle(fontSize: 14, color: MyTheme.textGray)),
                  Custominput(
                    inputType: TextInputType.emailAddress,
                    hint: 'uname@mail.com',
                    controller: authcontroller.emailcontroller,
                    prefix: Icon(
                      Icons.person_outline,
                      color: MyTheme.textGray,
                    ),
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
                  ),
                  const Text('Contraseña',
                      style: TextStyle(fontSize: 14, color: MyTheme.textGray)),
                  Custominput(
                    obscureText: true,
                    hint: 'Contraseña',
                    controller: authcontroller.passwordcontroller,
                    prefix: Icon(
                      Icons.lock_outlined,
                      color: MyTheme.textGray,
                    ),
                    validator: (p0) {
                      if (p0!.isEmpty) {
                        return 'Campo vacio, ingrese una contraseña valida';
                      }
                    },
                  ),
                  Row(
                    children: [
                      Checkbox(value: _value, onChanged: (newValue) {}),
                      const Text(
                        'Recordarme',
                        style:
                            TextStyle(color: MyTheme.textBlack, fontSize: 13),
                      ),
                      const Spacer(),
                      const Text('¿Olvide mi contraseña?',
                          style: TextStyle(color: MyTheme.purplebutton))
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Buttons(
                    color: MyTheme.purplebutton,
                    content: const Text('Iniciar sesión',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    ontap: () async {
                      if (_key.currentState!.validate()) {
                        final response = await authcontroller.login();

                        if (response == 'Bienvenido') {
                          Get.offAllNamed('/home');
                        } else {
                          Get.snackbar('Error', 'Error al ingresar');
                        }
                      }
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Stack(
                    alignment: Alignment.center,
                    children: [
                      Divider(
                        thickness: 1,
                        color: Colors.grey,
                        indent: 16,
                        endIndent: 16,
                      ),
                      CircleAvatar(
                        radius: 12,
                        backgroundColor: MyTheme.backgroundwhite,
                        child: const Text(
                          'O',
                          style:
                              TextStyle(fontSize: 13, color: MyTheme.textGray),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Buttons(
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                width: 20,
                                child: Image.asset(
                                    'assets/images/GoogleLogo.png')),
                            SizedBox(
                              width: 20,
                            ),
                            const Text(
                              'Ingresa con Google',
                              style: TextStyle(color: MyTheme.black),
                            )
                          ],
                        ),
                        width: 328,
                        ontap: () {},
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Buttons(
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                width: 20,
                                child:
                                    Image.asset('assets/images/AppleLogo.png')),
                            SizedBox(
                              width: 20,
                            ),
                            const Text(
                              'Ingresa con Apple',
                              style: TextStyle(color: MyTheme.black),
                            )
                          ],
                        ),
                        width: 328,
                        ontap: () {},
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  InkWell(
                    onTap: () {
                      Get.offAllNamed('/register');
                    },
                    child: Center(
                      child: RichText(
                          text: const TextSpan(
                              text: '¿No tienes una cuenta? ',
                              style: TextStyle(
                                  fontSize: 13, color: MyTheme.anotherTextGray),
                              children: [
                            TextSpan(
                                text: 'Regístrate ',
                                style: TextStyle(color: MyTheme.purplebutton)),
                          ])),
                    ),
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
