import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:my_trip_planner_app/home/models/destinationModel.dart';
import 'package:my_trip_planner_app/home/service/homeService.dart';

class HomeController extends GetxController {
  RxList<DestinationModel> destinationList = <DestinationModel>[].obs;
  RxBool isLoading = false.obs;
  CarouselController destinationDetailController = CarouselController();
  RxInt destinationDetailIndex = 0.obs;
  RxInt pageIndex = 0.obs;
  PageController pageController = PageController();
  void getDestination() async {
    try {
      isLoading = true.obs;
      List res = await HomeService.getDestination();
      destinationList.addAll(res.map((e) => DestinationModel.fromJson(e)));
      isLoading = false.obs;
    } catch (e) {
      isLoading = false.obs;
      Get.snackbar("Error", "Something went wrong");
    }
  }

  @override
  void onInit() {
    getDestination();
    super.onInit();
  }
}
