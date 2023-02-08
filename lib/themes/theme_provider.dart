import 'package:crnt_task/themes/material_theme.dart';
import 'package:flutter/material.dart';

enum CustomBrightness { light, dark }

class ThemeProvider extends ChangeNotifier {
  ThemeData _currentTheme = themeLight;
  CustomBrightness _brightness = CustomBrightness.dark;

  ThemeData get currentTheme => _currentTheme;
  CustomBrightness get brightness => _brightness;

  toggle(CustomBrightness brightness){
    if(brightness == CustomBrightness.light){
      _brightness = CustomBrightness.light;
      _currentTheme = themeLight;
    } else {
      _brightness = CustomBrightness.dark;
      _currentTheme = themeDark;
    }
    notifyListeners();
  }
}
