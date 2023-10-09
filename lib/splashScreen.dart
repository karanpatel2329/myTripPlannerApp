import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_trip_planner_app/constant/images.dart';
import 'package:my_trip_planner_app/home/view/home.dart';
import 'package:my_trip_planner_app/onboarding.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    checkFirstTime();
    super.initState();
  }
  void checkFirstTime()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool isNewUser = sharedPreferences.getBool('isNewUser')??true;
    await Future.delayed(Duration(seconds: 2));
    if(isNewUser){
      Navigator.push(context,MaterialPageRoute(builder: (context)=>OnboardingScreen()));
    }else{
      Navigator.push(context,MaterialPageRoute(builder: (context)=>HomeScreen()));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
       mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(AppImagePath.splashAnimation,width: 150.w)
        ],
      ),
    );
  }
}
