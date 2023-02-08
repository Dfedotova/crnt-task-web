import 'package:auto_route/auto_route.dart';
import 'package:crnt_task/navigation/router.gr.dart';
import 'package:crnt_task/repositories/strange_repository.dart';
import 'package:crnt_task/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

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
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      home: Scaffold(
        body: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerDelegate: AutoRouterDelegate(
            _appRouter,
            navigatorObservers: () => [AutoRouteObserver()],
          ),
          routeInformationParser: _appRouter.defaultRouteParser(),
          theme: themeProvider.currentTheme,
        ),
      ),
    );
  }
}
