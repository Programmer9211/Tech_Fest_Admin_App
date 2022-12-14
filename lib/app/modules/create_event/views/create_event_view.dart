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
          titleSpacing: 1,
          leadingWidth: 50,
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
              size: 22.sp,
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
                GestureDetector(
                  onTap: () {
                    controller.pickImage();
                  },
                  child:
                      GetBuilder<CreateEventController>(builder: (controller) {
                    return Container(
                      color: Color(0xffd6d6d6),
                      height: 200.h,
                      width: 430.w,
                      child: PageView.builder(
                        itemCount: controller.pickedImageFile.length,
                        onPageChanged: controller.onPageChanged,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              // height: 300.h,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  // scale: 3.0,
                                  image: FileImage(
                                    controller.pickedImageFile[index],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }),
                ),
                GetBuilder<CreateEventController>(
                  builder: (controller) {
                    return SizedBox(
                      height: size.height / 30,
                      width: size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (int i = 0; i < controller.isSelected.length; i++)
                            Obx(() {
                              return indicator(
                                  size, controller.isSelected[i].value);
                            })
                        ],
                      ),
                    );
                  },
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
                  controller: controller.eventTitleController,
                ),
                SizedBox(height: 12.h),
                KTextField(
                  hintText: "Event Description",
                  controller: controller.eventDescController,
                ),
                SizedBox(height: 12.h),
                KTextField(
                  hintText: "Registration Fee (0 = Free)",
                  controller: controller.registrationFees,
                  isNeumericKeyboard: true,
                ),
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
                Obx(
                  (() {
                    return Visibility(
                      visible: controller.isTeam.value,
                      child: Column(
                        children: [
                          KTextField(
                            hintText: "Team Size",
                            controller: controller.teamMemberCount,
                            isNeumericKeyboard: true,
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                        ],
                      ),
                    );
                  }),
                ),

                KTextField(
                    hintText: "Event Venue (location)",
                    controller: controller.eventVenueController),
                SizedBox(height: 12.h),

                KTextField(
                    hintText: "Contact No.",
                    controller: controller.contactDetails),
                SizedBox(height: 12.h),

                KTextField(
                    hintText: "Email Id", controller: controller.emailId),
                SizedBox(height: 12.h),

                KTextField(
                    hintText: "Website Link",
                    controller: controller.websiteLink),
                SizedBox(height: 12.h),

                GetBuilder<CreateEventController>(
                  builder: (controller) {
                    return Text(
                      "Event Start Timing : ${controller.eventStartTimings.time},${controller.eventStartTimings.day}-${controller.eventStartTimings.month}-${controller.eventStartTimings.year}",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    );
                  },
                ),

                TextButton(
                  onPressed: () {
                    controller.onAddEventTimings(context, true);
                  },
                  child: Text(
                    "Add Event Start Timing",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                GetBuilder<CreateEventController>(
                  builder: (controller) {
                    return Text(
                      "Event End Timing : ${controller.eventEndTimings.time},${controller.eventEndTimings.day}-${controller.eventEndTimings.month}-${controller.eventEndTimings.year}",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    );
                  },
                ),

                TextButton(
                  onPressed: () {
                    controller.onAddEventTimings(context, false);
                  },
                  child: Text(
                    "Add Event End Timing",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                // KTextField(
                //     hintText: "Event Timings",
                //     controller: controller.eventTitleController),
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
                SizedBox(
                  height: 10.h,
                ),
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

  Widget indicator(Size size, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        height: isSelected ? size.height / 80 : size.height / 100,
        width: isSelected ? size.height / 80 : size.height / 100,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black,
        ),
      ),
    );
  }
}
