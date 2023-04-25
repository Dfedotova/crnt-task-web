import 'package:crnt_task/navigation/route_names.dart';
import 'package:crnt_task/pages/analytics_page.dart';
import 'package:crnt_task/pages/auth_page.dart';
import 'package:crnt_task/pages/chats_page.dart';
import 'package:crnt_task/pages/home_page.dart';
import 'package:crnt_task/pages/layout_template.dart';
import 'package:crnt_task/pages/main_page.dart';
import 'package:crnt_task/pages/setting_page.dart';
import 'package:crnt_task/pages/tasks/tasks_page.dart';
import 'package:flutter/material.dart';

Route<dynamic>? generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case MainRoute:
      return MaterialPageRoute(builder: (context) => const MainPage());
    case AuthRoute:
      return MaterialPageRoute(builder: (context) => const AuthPage());
    case HomeRoute:
      return _getPageRoute(const HomePage(), settings);
    case SettingsRoute:
      return _getPageRoute(const SettingsPage(), settings);
    case TasksRoute:
      return _getPageRoute(const TasksPage(), settings);
    case AnalyticsRoute:
      return _getPageRoute(const AnalyticsPage(), settings);
    case ChatRoute:
      return _getPageRoute(const ChatsPage(), settings);
    default:
  }
  return null;
}

PageRoute _getPageRoute(Widget child, RouteSettings settings) {
  return MaterialPageRoute(
    settings: settings,
    builder: (context) => LayoutTemplate(child: child),
  );
}
