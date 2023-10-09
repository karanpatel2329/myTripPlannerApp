import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_trip_planner_app/home/models/destinationModel.dart';
import 'package:my_trip_planner_app/home/view/destinationDetail.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../constant/colors.dart';

class DestinationCard extends StatelessWidget {
  const DestinationCard({super.key, required this.destinationModel});
  final DestinationModel destinationModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(DestinationDetail(destinationModel: destinationModel));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12.sp, vertical: 12.sp),
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
                imageUrl: destinationModel.images[0],
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
                    image: NetworkImage(destinationModel.images[0]),
                    fit: BoxFit.cover),
              ),
            ),
            Text(
              destinationModel.name,
              style: TextStyle(
                  fontSize: 22.sp,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w600),
            ),
            Text(destinationModel.description,
                style: TextStyle(
                    fontSize: 16.sp,
                    color: AppColors.secondaryColor,
                    fontWeight: FontWeight.w300)),
            Divider(
              color: AppColors.secondaryColor,
              thickness: 3.sp,
            )
          ],
        ),
      ),
    );
  }
}
