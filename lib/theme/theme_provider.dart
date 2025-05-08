import 'package:expenses_tracker_app_v2/theme/light_mode.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {

  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }
}