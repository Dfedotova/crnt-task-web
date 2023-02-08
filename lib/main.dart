import 'package:crnt_task/app.dart';
import 'package:crnt_task/config/environment.dart';
import 'package:flutter/material.dart';

void main() {
  Environment().init(host: 'release.nostress.dev', port: 1377);
  runApp(const App());
}
