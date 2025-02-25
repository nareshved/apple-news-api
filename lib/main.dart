import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapi/data/api_bloc/news_bloc.dart';
import 'package:newsapi/data/api_helper/api_helper.dart';
import 'package:newsapi/domain/utils/app_info.dart';
import 'package:newsapi/domain/utils/app_theme.dart';

import 'repository/pages/homepage.dart';

void main() async {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
        create: (context) => NewsBloc(apiHelper: ApiHelper())),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       themeMode: ThemeMode.dark,
      themeAnimationCurve: Curves.easeInCirc,
      theme: myLightTheme,
      darkTheme: myDarkTheme,
      title: AppDeveloperInfo.appName,
      home: const HomePage(),
    );
  }
}
