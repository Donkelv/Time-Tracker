


import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:time_tracker/core/constants/hive_const.dart';




final themeProvider = ChangeNotifierProvider<ThemeProvider>((ref) {
  return ThemeProvider(ref);
});

class ThemeProvider extends ChangeNotifier {
  final Ref ref;
  late ThemeData _themeData;

  ThemeProvider(this.ref) {
    _themeData = ThemeData.dark(); // Set the default theme as dark
    _loadTheme();
  }

  ThemeData getTheme() => _themeData;

  void toggleTheme() {
    _themeData = (_themeData == ThemeData.light())
        ? ThemeData.dark()
        : ThemeData.light();
    _saveTheme();
    notifyListeners();
  }

  Future<void> _loadTheme() async {
    final box = await Hive.openBox(HiveConst.themeBox);
    bool isDarkTheme = box.get(HiveConst.themeKey) ?? false;
    _themeData = isDarkTheme ? ThemeData.dark() : ThemeData.light();
    notifyListeners();
  }

  Future<void> _saveTheme() async {
    final box = await Hive.openBox(HiveConst.themeBox);
    box.put(HiveConst.themeKey, _themeData == ThemeData.dark());
  }
}
