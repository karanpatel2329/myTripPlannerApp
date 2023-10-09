import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_trip_planner_app/bookmark/view/bookmark.dart';
import 'package:my_trip_planner_app/constant/colors.dart';
import 'package:my_trip_planner_app/home/controller/homeController.dart';
import 'package:my_trip_planner_app/home/view/widgets/destinationCard.dart';
import 'package:my_trip_planner_app/profile/view/profile.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Obx(
          () => SalomonBottomBar(
            currentIndex: homeController.pageIndex.value,
            onTap: (i) {
              homeController.pageIndex.value = i;
              homeController.pageController.jumpToPage(i);
            },
            items: [
              /// Home
              SalomonBottomBarItem(
                icon: Icon(Icons.home),
                title: Text("Home"),
                selectedColor: AppColors.primaryColor,
              ),

              /// Likes
              SalomonBottomBarItem(
                icon: Icon(Icons.favorite_border),
                title: Text("Wishlist"),
                selectedColor: AppColors.primaryColor,
              ),

              /// Profile
              SalomonBottomBarItem(
                icon: Icon(Icons.person),
                title: Text("Profile"),
                selectedColor: AppColors.primaryColor,
              ),
            ],
          ),
        ),
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: homeController.pageController,
          children: [
            Container(
              child: Obx(() => ListView.builder(
                    itemCount: homeController.destinationList.value.length,
                    itemBuilder: (context, index) {
                      return DestinationCard(
                          destinationModel:
                              homeController.destinationList[index]);
                    },
                  )),
            ),
            MyBookmarkScreen(),
            ProfileScreen(),
          ],
        ));
  }
}
