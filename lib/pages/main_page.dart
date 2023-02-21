import 'package:crnt_task/controllers/main_page_controller.dart';
import 'package:crnt_task/locator.dart';
import 'package:crnt_task/navigation/navigation_service.dart';
import 'package:crnt_task/navigation/route_names.dart';
import 'package:crnt_task/pages/home_page.dart';
import 'package:crnt_task/pages/layout_template.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../navigation/router.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final MainPageController c = Get.put(MainPageController());

  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    // Можно и здесь:
    // c.load();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      _initialized = true;
      c.load();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(80),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomRight,
                child: Image.asset('assets/title_img.png'),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset('assets/logo.svg'),
                  const Spacer(),
                  const Text(
                    'Current\nagency',
                    style: TextStyle(
                      inherit: false,
                      height: 0.75,
                      fontFamily: 'Druk Wide Cyr',
                      fontSize: 60,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Text(
                    'поможем вашему бизнесу в digital-развитии: \nот '
                    'создания бренда до полного цикла \nпродакшена',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  const SizedBox(height: 24),
                  GestureDetector(
                    onTap: () {
                      locator<NavigationService>().navigateTo(HomeRoute);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 51,
                      width: 144,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        'Войти',
                        style: Theme.of(context).textTheme.button,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
