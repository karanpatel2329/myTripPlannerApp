import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_trip_planner_app/auth/controller/authController.dart';
import 'package:my_trip_planner_app/constant/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({required this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
              controller: authController.emailLogin,
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
            Obx(
              () => TextFormField(
                obscureText: authController.isPassVisLogin.value,
                controller: authController.passwordLogin,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: AppColors.primaryColor),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: AppColors.primaryColor,
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      authController.isPassVisLogin.value =
                          !authController.isPassVisLogin.value;
                    },
                    child: Icon(
                      !authController.isPassVisLogin.value
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: AppColors.accentColor,
                    ),
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
            ),
            SizedBox(
              height: 20.sp,
            ),
            InkWell(
                onTap: () {
                  authController.login();
                },
                child: Obx(
                  () => Container(
                    padding: EdgeInsets.symmetric(
                        vertical: 18.sp, horizontal: 45.sp),
                    decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(8.sp))),
                    child: authController.isLoadingLogin.value
                        ? CircularProgressIndicator(
                            color: AppColors.backgroundColor,
                          )
                        : Text(
                            "Login",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 17.sp,
                                color: AppColors.backgroundColor),
                          ),
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Don't have an account? ",
                  style: TextStyle(color: Colors.grey),
                ),
                GestureDetector(
                  onTap: () {
                    widget.toggleView();
                  },
                  child: Text(
                    'Sign Up',
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
