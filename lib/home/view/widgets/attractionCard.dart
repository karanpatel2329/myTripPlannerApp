import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_trip_planner_app/bookmark/controller/bookmarkController.dart';
import 'package:my_trip_planner_app/home/models/destinationModel.dart';
import 'package:my_trip_planner_app/home/view/destinationDetail.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../constant/colors.dart';

class AttractionCard extends StatelessWidget {
  AttractionCard(
      {super.key, required this.attractionModel, required this.destinationId});
  final Attraction attractionModel;
  final String destinationId;
  BookmarkController bookmarkController = Get.find<BookmarkController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 30.h,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12.sp)),
              // image: DecorationImage(image: Image(destinationModel.images[0]),fit: BoxFit.fill)
            ),
            child: CachedNetworkImage(
              imageUrl: attractionModel.images[0],
              imageBuilder: (context, image) => Container(
                height: 30.h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12.sp)),
                    image: DecorationImage(image: image, fit: BoxFit.cover)),
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
                  image: NetworkImage(
                    attractionModel.images[0],
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            height: 12.sp,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 75.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      attractionModel.name,
                      style: TextStyle(
                          fontSize: 18.sp,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(attractionModel.description,
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.secondaryColor,
                            fontWeight: FontWeight.w300)),
                  ],
                ),
              ),
              Obx(() => InkWell(
                    child: Icon(
                      Icons.bookmarks_outlined,
                      color: bookmarkController.myAttraction
                              .contains(attractionModel.id)
                          ? AppColors.primaryColor
                          : AppColors.accentColor,
                    ),
                    onTap: () {
                      if (bookmarkController.myAttraction
                          .contains(attractionModel.id)) {
                        bookmarkController.removeAttraction(
                            destinationId, attractionModel.id, attractionModel);
                      } else {
                        bookmarkController.addAttraction(
                            destinationId, attractionModel.id, attractionModel);
                      }
                    },
                  ))
            ],
          ),
          SizedBox(
            height: 12.sp,
          ),
          Divider(
            color: AppColors.secondaryColor,
            thickness: 3.sp,
          )
        ],
      ),
    );
  }
}
