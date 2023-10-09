import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_trip_planner_app/auth/controller/authController.dart';
import 'package:my_trip_planner_app/auth/view/auth.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constant/colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  AuthController authController = Get.find<AuthController>();
  RxBool isLogin = false.obs;
  RxString name = ''.obs;
  @override
  void initState() {
    checkLogin();
    super.initState();
  }

  void checkLogin() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    if (token != null) {
      isLogin.value = true;
      name.value = sharedPreferences.getString('userName') ?? "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => isLogin.value
        ? Scaffold(
            body: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Obx(
                    () => Text(
                      "Welcome ${name.value}",
                      style: TextStyle(
                          color: AppColors.primaryColor, fontSize: 20.sp),
                    ),
                  ),
                  SizedBox(
                    height: 20.sp,
                  ),
                  InkWell(
                    onTap: () async {
                      SharedPreferences sharedPreference =
                          await SharedPreferences.getInstance();
                      sharedPreference.remove("token");
                      Get.to(Auth());
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.sp, horizontal: 20.sp),
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius:
                              BorderRadius.all(Radius.circular(8.sp))),
                      child: Text(
                        "Logout",
                        style: TextStyle(color: AppColors.backgroundColor),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        : Scaffold(
            body: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Login to view Profile",
                    style: TextStyle(
                        color: AppColors.primaryColor, fontSize: 20.sp),
                  ),
                  SizedBox(
                    height: 20.sp,
                  ),
                  InkWell(
                    onTap: () async {
                      Get.to(Auth());
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.sp, horizontal: 20.sp),
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius:
                              BorderRadius.all(Radius.circular(8.sp))),
                      child: Text(
                        "Login Now",
                        style: TextStyle(color: AppColors.backgroundColor),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ));
  }
}
