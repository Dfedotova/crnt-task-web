import 'package:auto_route/auto_route.dart';
import 'package:crnt_task/pages/main_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(
      path: 'first',
      page: MainPage,
      initial: true,
    ),
  ],
)
class $AppRouter {}
