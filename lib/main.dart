import 'package:flutter/material.dart';
import 'package:newsapi/domain/utils/app_info.dart';
import 'package:newsapi/domain/utils/app_theme.dart';

import 'repository/pages/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      themeAnimationCurve: Curves.easeInCirc,
      theme: myLightTheme,
      darkTheme: myDarkTheme,
      title: AppDeveloperInfo.appName,
      home: const HomePage(),
    );
  }
}
