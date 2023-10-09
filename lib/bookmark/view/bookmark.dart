import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_trip_planner_app/auth/view/auth.dart';
import 'package:my_trip_planner_app/bookmark/controller/bookmarkController.dart';
import 'package:my_trip_planner_app/constant/colors.dart';
import 'package:my_trip_planner_app/constant/images.dart';
import 'package:my_trip_planner_app/home/view/widgets/attractionCard.dart';
import 'package:my_trip_planner_app/home/view/widgets/destinationCard.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyBookmarkScreen extends StatefulWidget {
  const MyBookmarkScreen({super.key});

  @override
  State<MyBookmarkScreen> createState() => _MyBookmarkScreenState();
}

class _MyBookmarkScreenState extends State<MyBookmarkScreen> {
  BookmarkController bookmarkController = Get.find<BookmarkController>();
  RxBool isLogin = false.obs;
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
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
          length: 2,
          child: Obx(() => isLogin.value
              ? Scaffold(
                  appBar: TabBar(
                    indicatorColor: AppColors.primaryColor,
                    labelColor: AppColors.primaryColor,
                    tabs: [
                      Tab(
                        icon: Icon(Icons.favorite),
                        text: "My Bookmark",
                      ),
                      Tab(
                        icon: Icon(Icons.star),
                        text: "My Attraction",
                      ),
                    ],
                  ),
                  body: Obx(
                    () => bookmarkController.isLoadingBooking.value
                        ? const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircularProgressIndicator(
                                color: AppColors.primaryColor,
                              ),
                            ],
                          )
                        : TabBarView(
                            children: [
                              Obx(() => bookmarkController
                                      .mybookmarkDes.isNotEmpty
                                  ? ListView.builder(
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        return Container(
                                            child: Stack(
                                          children: [
                                            DestinationCard(
                                                destinationModel:
                                                    bookmarkController
                                                        .mybookmarkDes[index]),
                                            Positioned(
                                              right: 10,
                                              top: 10,
                                              child: InkWell(
                                                onTap: () {
                                                  bookmarkController
                                                      .removeBookmark(
                                                          bookmarkController
                                                                  .mybookmarkDes[
                                                              index]);
                                                },
                                                child: CircleAvatar(
                                                  backgroundColor:
                                                      Colors.red.shade50,
                                                  radius: 30,
                                                  child: const Icon(
                                                    Icons.delete_forever,
                                                    color: Colors.red,
                                                    size: 40,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ));
                                      },
                                      itemCount: bookmarkController
                                          .mybookmarkDes.length,
                                    )
                                  : Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 250.px,
                                          child:
                                              Image.asset(AppImagePath.noData),
                                        ),
                                        Text("No Bookmark added"),
                                      ],
                                    )),
                              Obx(() => bookmarkController
                                      .myAttractionList.value.isNotEmpty
                                  ? ListView.builder(
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        return Container(
                                            child: Stack(
                                          children: [
                                            AttractionCard(
                                              attractionModel:
                                                  bookmarkController
                                                      .myAttractionList[index]
                                                      .attraction,
                                              destinationId: bookmarkController
                                                  .myAttractionList[index]
                                                  .destinationId,
                                            ),
                                            Positioned(
                                              right: 10,
                                              top: 10,
                                              child: InkWell(
                                                onTap: () {
                                                  bookmarkController
                                                      .removeAttraction(
                                                          bookmarkController
                                                              .myAttractionList[
                                                                  index]
                                                              .destinationId,
                                                          bookmarkController
                                                              .myAttractionList[
                                                                  index]
                                                              .attraction
                                                              .id,
                                                          bookmarkController
                                                              .myAttractionList[
                                                                  index]
                                                              .attraction);
                                                },
                                                child: CircleAvatar(
                                                  backgroundColor:
                                                      Colors.red.shade50,
                                                  radius: 30,
                                                  child: const Icon(
                                                    Icons.delete_forever,
                                                    color: Colors.red,
                                                    size: 40,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ));
                                      },
                                      itemCount: bookmarkController
                                          .myAttractionList.length,
                                    )
                                  : Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 250.px,
                                          child:
                                              Image.asset(AppImagePath.noData),
                                        ),
                                        Text("No Attraction Saved"),
                                      ],
                                    ))
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
                          "Login to add bookmark",
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
                              style:
                                  TextStyle(color: AppColors.backgroundColor),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ))),
    );
  }
}
