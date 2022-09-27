import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:tech_fest_admin_app/app/data/widgets/event_tile.dart';
import 'package:tech_fest_admin_app/app/routes/app_pages.dart';
import 'package:tech_fest_admin_app/const/app_const/app_color.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xffFAFAFA),
        title: Text(
          "Home",
          style: TextStyle(
            fontSize: 20.sp,
            fontFamily: "ubuntu",
            fontWeight: FontWeight.w500,
            color: Color(0xff000000),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(Routes.CREATE_EVENT);
            },
            icon: Icon(
              Icons.add,
              color: Colors.black,
              size: 28.sp,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: GestureDetector(
              onTap: () {
                Get.toNamed(Routes.PROFILE_SCREEN);
              },
              child: Container(
                height: 42.h,
                width: 30.w,
                child: Icon(Icons.person, color: Colors.white),
                decoration: BoxDecoration(
                    color: Color(0xff000000),
                    borderRadius: BorderRadius.all(Radius.circular(8.r))),
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(height: 1.4.h, color: AppColor.black80),
              ),
              Container(
                height: 1.4,
                width: 130.w,
              )
            ],
          ),
          GetBuilder<HomeController>(
            builder: (controller) {
              if (controller.eventModelList.isNotEmpty) {
                return Expanded(
                  child: ListView.builder(
                      itemCount: controller.eventModelList.length,
                      itemBuilder: (context, index) {
                        return EventTile(
                          model: controller.eventModelList[index],
                        );
                      }),
                );
              } else {
                return Column(
                  children: [
                    SizedBox(
                      height: 260.h,
                    ),
                    Text(
                      "Organise Your First Event",
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Color(0x99000000),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed(Routes.CREATE_EVENT);
                      },
                      child: Container(
                        height: 44.h,
                        width: 190.w,
                        alignment: Alignment.center,
                        child: Text(
                          "Create Event",
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: AppColor.buttonColor,
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(4, 4),
                              blurRadius: 8,
                              color: Colors.black26,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
