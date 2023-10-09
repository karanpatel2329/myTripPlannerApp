import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_trip_planner_app/bookmark/controller/bookmarkController.dart';
import 'package:my_trip_planner_app/home/controller/homeController.dart';
import 'package:my_trip_planner_app/home/models/destinationModel.dart';
import 'package:my_trip_planner_app/home/view/widgets/attractionCard.dart';
import 'package:my_trip_planner_app/home/view/widgets/destinationCard.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constant/colors.dart';

class DestinationDetail extends StatelessWidget {
  DestinationDetail({super.key, required this.destinationModel});
  final DestinationModel destinationModel;
  final HomeController homeController = Get.find<HomeController>();
  final BookmarkController bookmarkController = Get.find<BookmarkController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(destinationModel.name),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CarouselSlider(
                    carouselController:
                        homeController.destinationDetailController,
                    options: CarouselOptions(
                        height: 35.h,
                        onPageChanged: (i, reason) {
                          homeController.destinationDetailIndex.value = i;
                        }),
                    items: destinationModel.images.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            height: 30.h,
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.all(15.sp),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.sp)),
                              // image: DecorationImage(image: Image(destinationModel.images[0]),fit: BoxFit.fill)
                            ),
                            child: CachedNetworkImage(
                              imageUrl: i,
                              imageBuilder: (context, image) => Container(
                                height: 30.h,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(12.sp)),
                                    image: DecorationImage(
                                        image: image, fit: BoxFit.cover)),
                              ),
                              placeholder: (context, url) => Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 20.sp,
                                    height: 20.sp,
                                    child: CircularProgressIndicator(
                                      color: AppColors.primaryColor,
                                    ),
                                  )
                                ],
                              ),
                              errorWidget: (context, url, error) => Image(
                                  image:
                                      NetworkImage(destinationModel.images[0]),
                                  fit: BoxFit.cover),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 12.sp,
                  ),
                  Container(
                    width: 100.w,
                    height: 12.sp,
                    child: Center(
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: destinationModel.images.length,
                        itemBuilder: (context, index) {
                          return Obx(() {
                            if (homeController.destinationDetailIndex.value ==
                                index) {
                              return Container(
                                width: 10.sp,
                                height: 10.sp,
                                margin: EdgeInsets.symmetric(horizontal: 10.sp),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.sp)),
                                  color: AppColors.primaryColor,
                                ),
                              );
                            }
                            return Container(
                              width: 10.sp,
                              height: 10.sp,
                              margin: EdgeInsets.symmetric(horizontal: 10.sp),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.sp)),
                                  color: AppColors.secondaryColor),
                            );
                          });
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(destinationModel.description,
                            style: TextStyle(
                                fontSize: 16.sp,
                                color: AppColors.secondaryColor,
                                fontWeight: FontWeight.w300)),
                        SizedBox(
                          height: 12.sp,
                        ),
                        Text(
                          "Key Attraction",
                          style: TextStyle(
                              fontSize: 19.sp,
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w500),
                        ),
                        ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: destinationModel.attractions.length,
                          itemBuilder: (context, index) {
                            return AttractionCard(
                              attractionModel:
                                  destinationModel.attractions[index],
                              destinationId: destinationModel.id,
                            );
                          },
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 10.sp,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(() => bookmarkController.isLoadingBooking.value
                        ? CircularProgressIndicator(
                            color: AppColors.primaryColor,
                          )
                        : !bookmarkController.mybooking
                                .contains(destinationModel.id)
                            ? InkWell(
                                onTap: () {
                                  bookmarkController.addBookmark(
                                      destinationModel.id, destinationModel);
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 18.sp, horizontal: 35.sp),
                                  decoration: BoxDecoration(
                                      color: AppColors.primaryColor,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.sp))),
                                  child: Text(
                                    "Add to Wishlist",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17.sp,
                                        color: AppColors.backgroundColor),
                                  ),
                                ),
                              )
                            : SizedBox())
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
