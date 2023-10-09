import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_trip_planner_app/auth/controller/authController.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constant/colors.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({required this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  AuthController authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: authController.nameSignUp,
              decoration: InputDecoration(
                labelText: 'Name',
                labelStyle: TextStyle(color: AppColors.primaryColor),
                prefixIcon: Icon(
                  Icons.person,
                  color: AppColors.primaryColor,
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                    borderSide: BorderSide(color: AppColors.primaryColor)
                    // borderSide: BorderSide.none,
                    ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: AppColors.primaryColor)),
              ),
            ),
            SizedBox(
              height: 20.sp,
            ),
            TextFormField(
              controller: authController.emailSignUp,
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: AppColors.primaryColor),
                prefixIcon: Icon(
                  Icons.mail,
                  color: AppColors.primaryColor,
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                    borderSide: BorderSide(color: AppColors.primaryColor)
                    // borderSide: BorderSide.none,
                    ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: AppColors.primaryColor)),
              ),
            ),
            SizedBox(
              height: 20.sp,
            ),
            TextFormField(
              controller: authController.passwordSignUp,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(color: AppColors.primaryColor),
                prefixIcon: Icon(
                  Icons.lock,
                  color: AppColors.primaryColor,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: AppColors.primaryColor),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: AppColors.primaryColor)),
              ),
            ),
            SizedBox(
              height: 20.sp,
            ),
            InkWell(
              onTap: () {
                authController.register();
              },
              child: Container(
                padding:
                    EdgeInsets.symmetric(vertical: 18.sp, horizontal: 45.sp),
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(8.sp))),
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17.sp,
                      color: AppColors.backgroundColor),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Already have an account? ",
                  style: TextStyle(color: Colors.grey),
                ),
                GestureDetector(
                  onTap: () {
                    widget.toggleView();
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
