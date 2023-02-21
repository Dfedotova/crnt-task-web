import 'package:crnt_task/navigation/route_names.dart';
import 'package:crnt_task/pages/home_page.dart';
import 'package:crnt_task/pages/main_page.dart';
import 'package:crnt_task/pages/setting_page.dart';
import 'package:flutter/material.dart';

Route<dynamic>? generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case MainRoute:
      return _getPageRoute(MainPage(), settings);
    case HomeRoute:
      return _getPageRoute(HomePage(), settings);
    case SettingsRoute:
      return _getPageRoute(SettingsPage(), settings);
    default:
  }
  return null; //todo
}

PageRoute _getPageRoute(Widget child, RouteSettings settings) {
  return MaterialPageRoute(
    settings: settings,
    builder: (context) => child,
  );
}
