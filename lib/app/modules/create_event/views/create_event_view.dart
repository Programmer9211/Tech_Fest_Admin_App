import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:tech_fest_admin_app/app/data/widgets/custom_button.dart';
import 'package:tech_fest_admin_app/app/data/widgets/custom_textfield.dart';
import 'package:tech_fest_admin_app/app/models/event_model.dart';
import 'package:tech_fest_admin_app/const/app_const/participant_detals_list.dart';

import '../controllers/create_event_controller.dart';

class CreateEventView extends GetView<CreateEventController> {
  const CreateEventView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color(0xfffafafa),
        appBar: AppBar(
          backgroundColor: Color(0xfffafafa),
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            "Create Event",
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w400,
              fontFamily: "ubuntu",
              color: Color(0xff000000),
            ),
          ),
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 12.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 200.h,
                  decoration: BoxDecoration(
                      color: Color(0xffD9d9d9),
                      borderRadius: BorderRadius.all(Radius.circular(8.r))),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0.h),
                  child: Row(
                    children: [
                      Text(
                        "Event Details",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: "ubuntu",
                          color: Color(0xff898989),
                        ),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Container(
                        height: 1.h,
                        width: 220.w,
                        color: Color(0xff898989),
                      )
                    ],
                  ),
                ),
                KTextField(
                    hintText: "Event Title",
                    controller: controller.eventTitleController),
                SizedBox(height: 12.h),
                KTextField(
                    hintText: "Event Description",
                    controller: controller.eventTitleController),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Allow Teams",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: "ubuntu",
                        fontWeight: FontWeight.w600,
                        color: Color(0xff000000),
                      ),
                    ),
                    Obx(() {
                      return Switch(
                        value: controller.isTeam.value,
                        focusColor: Colors.black,
                        activeColor: Colors.black,
                        onChanged: (value) {
                          controller.isTeam.value = !controller.isTeam.value;
                        },
                      );
                    }),
                  ],
                ),
                KTextField(
                    hintText: "Event Venue (location)",
                    controller: controller.eventTitleController),
                SizedBox(height: 12.h),
                KTextField(
                    hintText: "Event Timings",
                    controller: controller.eventTitleController),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0.h),
                  child: Row(
                    children: [
                      Text(
                        "Participants Details",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: "ubuntu",
                          color: Color(0xff898989),
                        ),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Container(
                        height: 1.h,
                        width: 180.w,
                        color: Color(0xff898989),
                      )
                    ],
                  ),
                ),
                GetBuilder<CreateEventController>(builder: (cont) {
                  return Flexible(
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: cont.participantDetails.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          ParticipantsDetails details =
                              participantsDetails[index];

                          return CheckboxListTile(
                              title: Text(
                                details.title,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: "ubuntu",
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff000000),
                                ),
                              ),
                              value: details.isEnabled,
                              onChanged: (value) {
                                cont.onSeletedAndUnSelectCalue(
                                  value ?? false,
                                  index,
                                );
                              });
                        }),
                  );
                }),
                KButton(
                  title: "Launch Event",
                  onTap: () {
                    controller.onLaunchEvents();
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
