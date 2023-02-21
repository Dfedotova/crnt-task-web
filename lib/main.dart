import 'package:crnt_task/app.dart';
import 'package:crnt_task/config/environment.dart';
import 'package:crnt_task/locator.dart';
import 'package:flutter/material.dart';

void main() {
  Environment().init(host: 'release.nostress.dev', port: 1377);
  setupLocator();
  runApp(const App());
}
