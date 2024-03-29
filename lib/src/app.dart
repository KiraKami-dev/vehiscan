import 'package:flutter/material.dart';
import 'package:vehiscan/src/screens/home_screen.dart';
import 'package:get/get.dart';
import 'package:vehiscan/src/services/utils.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'VehiScan',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      theme: ThemeData(
        scaffoldBackgroundColor: Utils.appTheme,
      ),
    );
  }
}


