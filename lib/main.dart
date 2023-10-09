import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_trip_planner_app/onboarding.dart';
import 'package:my_trip_planner_app/splashScreen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'auth/view/auth.dart';
import 'constant/binding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return GetMaterialApp(
        initialBinding: RootBinding(),
        title: 'My Trip Planner',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF2FBCC8)),
          useMaterial3: true,
        ),
        home: SplashScreen(),
      );
    });
  }
}
