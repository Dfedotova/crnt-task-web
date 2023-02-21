import 'package:crnt_task/pages/layout_template.dart';
import 'package:crnt_task/repositories/strange_repository.dart';
import 'package:crnt_task/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'locator.dart';
import 'navigation/navigation_service.dart';
import 'navigation/route_names.dart';
import 'navigation/router.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(StrangeRepository());
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
      ],
      child: TaskTrackerApp(),
    );
  }
}

class TaskTrackerApp extends StatelessWidget {
  TaskTrackerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      theme: themeProvider.currentTheme,
      builder: (context, child) => LayoutTemplate(child: child),
      navigatorKey: locator<NavigationService>().navigatorKey,
      onGenerateRoute: generateRoute,
      initialRoute: MainRoute,
    );
  }
}
