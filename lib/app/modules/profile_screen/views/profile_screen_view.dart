import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../const/app_const/app_color.dart';
import '../controllers/profile_screen_controller.dart';

class ProfileScreenView extends GetView<ProfileScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFAFAFA),
        title: Text(
          'Profile',
          style: TextStyle(
            fontFamily: "ubuntu",
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            color: Color(0xff000000),
          ),
        ),
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
        titleSpacing: 1,
        leadingWidth: 50,
        elevation: 0,
      ),
      body: GetBuilder<ProfileScreenController>(builder: (controller) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Stack(
            children: [
              Positioned(
                top: 150,
                width: 338.w,
                child: Container(
                  height: 220,
                  width: 360.w,
                  decoration: BoxDecoration(
                    color: AppColor.blocks,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 30.h,
                      ),
                      Text(
                        controller.coordinatorModel.name,
                        style: TextStyle(
                            fontSize: 28.sp,
                            fontFamily: "ubuntu",
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        "Email: ${controller.coordinatorModel.email}",
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontFamily: "ubuntu",
                            color: Color(0xff99000000),
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 95,
                left: 120,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 120.h,
                    width: 120.w,
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 3.w,
                        ),
                        shape: BoxShape.circle),
                    child: CircleAvatar(
                      backgroundColor: AppColor.blocks,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
