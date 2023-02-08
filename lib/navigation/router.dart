import 'package:auto_route/auto_route.dart';
import 'package:crnt_task/pages/home_page.dart';
import 'package:crnt_task/pages/main_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(
      path: 'main',
      page: MainPage,
      initial: true,
    ),
    AutoRoute(
      path: 'main',
      page: MainPage,
      children: [
        AutoRoute(path: 'home', page: HomePage, initial: true),
      ],
    ),
  ],
)
class $AppRouter {}
