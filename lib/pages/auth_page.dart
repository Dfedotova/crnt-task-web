import 'dart:ui';

import 'package:crnt_task/controllers/main_page_controller.dart';
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
  final MainPageController c = Get.put(MainPageController());

  bool _initialized = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      _initialized = true;
      c.load();
    }
  }

  Widget _textFieldWidget(String hint) {
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
          style: TextStyle(
            height: 1.2,
            fontSize: 16,
            fontWeight: FontWeight.w300,
            fontFamily: 'Montserrat',
            color: Theme.of(context).colorScheme.surface,
          ),
          cursorColor: Theme.of(context).colorScheme.scrim,
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
                            padding: const EdgeInsets.all(59),
                            child: Column(
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
                                const SizedBox(height: 30),
                                _textFieldWidget('Login'),
                                const SizedBox(height: 19),
                                _textFieldWidget('Password'),
                                const SizedBox(height: 40),
                                GestureDetector(
                                  onTap: () {
                                    locator<NavigationService>()
                                        .navigateTo(HomeRoute);
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
                                      style: Theme.of(context).textTheme.button,
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
