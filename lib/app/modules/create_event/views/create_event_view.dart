import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:tech_fest_admin_app/app/data/widgets/custom_button.dart';
import 'package:tech_fest_admin_app/app/data/widgets/custom_textfield.dart';

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
                    Switch(
                        value: controller.isTeam,
                        focusColor: Colors.black,
                        activeColor: Colors.black,
                        onChanged: (value) {
                          value != controller.isTeam;
                        })
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
                CheckboxListTile(
                  title: Text(
                      "Participant's Name",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: "ubuntu",
                        fontWeight: FontWeight.w600,
                        color: Color(0xff000000),
                      ),
                    ),
                    value: controller.isParticipantName,
                    onChanged: (value) {
                      value != controller.isParticipantName;
                    }),
                CheckboxListTile(
                    title: Text(
                      "Phone Number",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: "ubuntu",
                        fontWeight: FontWeight.w600,
                        color: Color(0xff000000),
                      ),
                    ),
                    value: controller.isParticipantName,
                    onChanged: (value) {
                      value != controller.isParticipantName;
                    }),

                CheckboxListTile(
                    title: Text(
                      "Institution Name",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: "ubuntu",
                        fontWeight: FontWeight.w600,
                        color: Color(0xff000000),
                      ),
                    ),
                    value: controller.isParticipantName,
                    onChanged: (value) {
                      value != controller.isParticipantName;
                    }),
                CheckboxListTile(
                    title: Text(
                      "Institution ID",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: "ubuntu",
                        fontWeight: FontWeight.w600,
                        color: Color(0xff000000),
                      ),
                    ),
                    value: controller.isParticipantName,
                    onChanged: (value) {
                      value != controller.isParticipantName;
                    }),

              KButton(title: "Launch Event", onTap: (){}),
              
              ],
            ),
          ),
        ));
  }
}
