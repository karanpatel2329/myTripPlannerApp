import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:my_trip_planner_app/auth/model/authModel.dart';
import 'package:my_trip_planner_app/auth/service/authService.dart';
import 'package:my_trip_planner_app/home/view/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  TextEditingController emailLogin = TextEditingController();
  TextEditingController passwordLogin = TextEditingController();
  TextEditingController nameSignUp = TextEditingController();
  TextEditingController emailSignUp = TextEditingController();
  TextEditingController passwordSignUp = TextEditingController();
  RxBool isPassVisLogin = false.obs;
  RxBool isPassVisRegister = false.obs;
  RxBool isLoadingLogin = false.obs;
  RxBool isLoadingRegister = false.obs;
  AuthModel? user;
  void login() async {
    try {
      isLoadingLogin.value = true;
      var res = await AuthService.login(
          emailLogin.value.text, passwordLogin.value.text);
      user = AuthModel.fromJson(res['data']);
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString('token', (user?.token ?? ""));
      sharedPreferences.setString('userId', (user?.id ?? ""));
      sharedPreferences.setString('userName', (user?.name ?? ""));
      Get.offAll(HomeScreen());
      isLoadingLogin.value = false;
    } catch (e) {
      isLoadingLogin.value = false;
    }
  }

  void register() async {
    try {
      isLoadingRegister.value = true;
      var res = await AuthService.register(nameSignUp.value.text,
          emailSignUp.value.text, passwordSignUp.value.text);
      user = AuthModel.fromJson(res['data']);
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString('token', (user?.token ?? ""));
      sharedPreferences.setString('userId', (user?.id ?? ""));
      sharedPreferences.setString('userName', (user?.name ?? ""));
      Get.offAll(HomeScreen());
      isLoadingRegister.value = false;
    } catch (e) {
      isLoadingRegister.value = false;
    }
  }
}
