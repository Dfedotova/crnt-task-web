import 'dart:ui';

import 'package:crnt_task/controllers/auth_controller.dart';
import 'package:crnt_task/locator.dart';
import 'package:crnt_task/navigation/navigation_service.dart';
import 'package:crnt_task/navigation/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late String _inputLogin;
  late String _inputPassword;
  final RxBool _authFailed = false.obs;

  @override
  void initState() {
    super.initState();
  }

  Widget _textFieldWidget(String hint, TextEditingController controller) {
    return Container(
      padding: const EdgeInsets.only(left: 20),
      width: double.infinity,
      height: 48,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.outline,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: TextFormField(
          controller: controller,
          style: TextStyle(
            height: 1.2,
            fontSize: 16,
            fontWeight: FontWeight.w300,
            fontFamily: 'Montserrat',
            color: Theme.of(context).colorScheme.primary,
          ),
          cursorColor: Theme.of(context).colorScheme.primary,
          cursorHeight: 20,
          decoration: InputDecoration.collapsed(
            hintStyle: TextStyle(
              height: 1.2,
              fontSize: 16,
              fontWeight: FontWeight.w300,
              fontFamily: 'Montserrat',
              color: Theme.of(context).colorScheme.background,
            ),
            hintText: hint,
          ),
          onChanged: (value) {
            if (hint == 'Login') {
              _inputLogin = value;
            } else {
              _inputPassword = value;
            }
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                'assets/auth_bg.png',
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset('assets/logo_light.svg'),
                  const SizedBox(height: 60),
                  Align(
                    child: ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          width: 650,
                          height: 400,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Theme.of(context)
                                .colorScheme
                                .primaryContainer
                                .withOpacity(0.25),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 59,
                              vertical: 40,
                            ),
                            child: Obx(
                              () => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'вход',
                                    style: TextStyle(
                                      inherit: false,
                                      height: 0.75,
                                      fontFamily: 'Druk Wide Cyr',
                                      fontSize: 60,
                                    ),
                                  ),
                                  const SizedBox(height: 35),
                                  _textFieldWidget(
                                    'Login',
                                    _loginController,
                                  ),
                                  const SizedBox(height: 19),
                                  _textFieldWidget(
                                    'Password',
                                    _passwordController,
                                  ),
                                  if (_authFailed.value)
                                    const Padding(
                                      padding: EdgeInsets.only(
                                        left: 10,
                                        top: 25,
                                      ),
                                      child: Text(
                                        '* Неверный логин или пароль',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.red,
                                        ),
                                      ),
                                    )
                                  else
                                    const SizedBox(),
                                  const Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      if (_inputLogin == AuthController.login &&
                                          _inputPassword ==
                                              AuthController.password) {
                                        _authFailed.value = false;
                                        locator<NavigationService>()
                                            .navigateTo(HomeRoute);
                                      } else {
                                        _authFailed.value = true;
                                      }
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 50,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: Text(
                                        'Войти',
                                        style:
                                            Theme.of(context).textTheme.button,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
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
