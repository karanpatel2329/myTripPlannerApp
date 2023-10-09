import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:my_trip_planner_app/auth/controller/authController.dart';
import 'package:my_trip_planner_app/bookmark/controller/bookmarkController.dart';
import 'package:my_trip_planner_app/home/controller/homeController.dart';

class RootBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
    Get.put<AuthController>(AuthController());
    Get.put<BookmarkController>(BookmarkController());
  }
}