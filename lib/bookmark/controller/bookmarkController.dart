import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:my_trip_planner_app/auth/view/auth.dart';
import 'package:my_trip_planner_app/bookmark/model/attractionSaved.dart';
import 'package:my_trip_planner_app/bookmark/service/bookmarkService.dart';
import 'package:my_trip_planner_app/home/models/destinationModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookmarkController extends GetxController {
  RxList<DestinationModel> mybookmarkDes = <DestinationModel>[].obs;
  RxList<AttractionSaved> myAttractionList = <AttractionSaved>[].obs;
  RxList<String> mybooking = <String>[].obs;
  RxList<String> myAttraction = <String>[].obs;
  RxBool isLoadingBooking = false.obs;
  void getBookmark() async {
    try {
      myAttractionList.clear();
      myAttraction.clear();
      mybookmarkDes.clear();
      mybooking.clear();
      isLoadingBooking.value = true;
      var res = await BookmarkService.getAllMyBookmark();
      if (res.isNotEmpty) {
        for (var i in res['destination']) {
          mybookmarkDes.add(DestinationModel.fromJson(i));
        }
        mybookmarkDes.map((element) => mybooking.add(element.id));
        for (var i in res['attraction']) {
          myAttractionList.add(AttractionSaved.fromJson(i));
        }
        myAttractionList
            .map((element) => myAttraction.add(element.attraction.id));
      }

      isLoadingBooking.value = false;
    } catch (e) {
      isLoadingBooking.value = false;
    }
  }

  void addBookmark(String destinationId, DestinationModel d) async {
    try {
      isLoadingBooking.value = true;
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      var token = sharedPreferences.getString('token');
      var userId = sharedPreferences.getString('userId');
      if (token == null) {
        Get.to(Auth());
      }
      dio.Response res = await BookmarkService.addBookmark(
          userId ?? "", destinationId, userId ?? "");
      if (res.statusCode == 200) {
        mybooking.add(d.id);
        mybookmarkDes.add(d);
      }
      isLoadingBooking.value = false;
    } catch (e) {
      isLoadingBooking.value = false;
    }
  }

  void removeBookmark(DestinationModel d) async {
    try {
      isLoadingBooking.value = true;
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      var token = sharedPreferences.getString('token');
      if (token == null) {
        Get.to(Auth());
      }
      dio.Response res = await BookmarkService.removeBookmark(
        d.id,
      );
      if (res.statusCode == 200) {
        mybooking.remove(d.id);
        mybookmarkDes.remove(d);
      }
      isLoadingBooking.value = false;
    } catch (e) {
      isLoadingBooking.value = false;
    }
  }

  void addAttraction(
      String destinationId, String attractionId, Attraction a) async {
    try {
      isLoadingBooking.value = true;
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      var token = sharedPreferences.getString('token');
      if (token == null) {
        Get.to(Auth());
      }
      dio.Response res =
          await BookmarkService.addAttraction(destinationId, attractionId);
      if (res.statusCode == 200) {
        myAttractionList
            .add(AttractionSaved(attraction: a, destinationId: destinationId));
        myAttraction.add(attractionId);
      }
      isLoadingBooking.value = false;
    } catch (e) {
      isLoadingBooking.value = false;
    }
  }

  void removeAttraction(
      String destinationId, String attractionId, Attraction a) async {
    try {
      isLoadingBooking.value = true;
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      var token = sharedPreferences.getString('token');
      if (token == null) {
        Get.to(Auth());
      }
      dio.Response res =
          await BookmarkService.removeAttraction(destinationId, attractionId);
      if (res.statusCode == 200) {
        myAttractionList.remove(
            AttractionSaved(attraction: a, destinationId: destinationId));
        getBookmark();
        myAttraction.remove(attractionId);
      }
      isLoadingBooking.value = false;
    } catch (e) {
      isLoadingBooking.value = false;
    }
  }

  @override
  void onInit() {
    getBookmark();
    super.onInit();
  }
}
