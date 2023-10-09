import 'package:flutter/material.dart';
import 'package:intro_screen_onboarding_flutter/introduction.dart';
import 'package:intro_screen_onboarding_flutter/introscreenonboarding.dart';
import 'package:my_trip_planner_app/constant/colors.dart';
import 'package:my_trip_planner_app/constant/images.dart';
import 'package:my_trip_planner_app/home/view/home.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatelessWidget {
  final List<Introduction> list = [
    Introduction(
      title: 'Explore Destinations',
      subTitle: 'Discover exciting places to visit and explore on your trip',
      imageUrl: AppImagePath.onboardingImage2,
      titleTextStyle:
          const TextStyle(fontSize: 25, color: AppColors.primaryColor),
      subTitleTextStyle: const TextStyle(
          fontSize: 16,
          color: AppColors.secondaryColor,
          fontWeight: FontWeight.w300),
    ),
    Introduction(
      title: 'Plan Your Journey',
      subTitle: 'Create detailed itineraries and plan your perfect trip',
      imageUrl: AppImagePath.onboardingImage3,
      titleTextStyle:
          const TextStyle(fontSize: 25, color: AppColors.primaryColor),
      subTitleTextStyle: const TextStyle(
          fontSize: 16,
          color: AppColors.secondaryColor,
          fontWeight: FontWeight.w300),
    ),
    Introduction(
      title: 'Get Local Insights',
      subTitle: 'Access tips and recommendations from fellow travelers',
      imageUrl: AppImagePath.onboardingImage4,
      titleTextStyle:
          const TextStyle(fontSize: 25, color: AppColors.primaryColor),
      subTitleTextStyle: const TextStyle(
          fontSize: 16,
          color: AppColors.secondaryColor,
          fontWeight: FontWeight.w300),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return IntroScreenOnboarding(
      foregroundColor: AppColors.primaryColor,
      backgroudColor: AppColors.backgroundColor,
      skipTextStyle: TextStyle(color: AppColors.primaryColor),
      introductionList: list,
      onTapSkipButton: () async {
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setBool('isNewUser', false);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ), //MaterialPageRoute
        );
      },
    );
  }
}
