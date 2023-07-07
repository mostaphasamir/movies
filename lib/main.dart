import 'package:flutter/material.dart';
import 'package:movie/core/services/services_locator.dart';

import 'bottom_navigation_bar/home_bottom_navigation.dart';
import 'core/utils/app_string.dart';
import 'movie/presentation/screens/movies_screen.dart';

void main() {
  ServiceLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppString.appName,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey.shade900,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeBottomNavigation(),
    );
  }
}
