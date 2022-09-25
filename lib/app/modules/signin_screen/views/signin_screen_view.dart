import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:tech_fest_admin_app/app/routes/app_pages.dart';

import '../../../../const/app_const/app_color.dart';
import '../../../data/widgets/custom_button.dart';
import '../../../data/widgets/custom_textfield.dart';
import '../controllers/signin_screen_controller.dart';

class SigninScreenView extends GetView<SigninScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAFAFA),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w),
          child: Column(
            children: [
              SizedBox(
                height: 125.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 2.w),
                        child: Text(
                          "Organiser",
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColor.black80,
                          ),
                        ),
                      ),
                      Text(
                        "LOGIN",
                        style: TextStyle(
                          fontSize: 52.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Image.asset("assets/icon.png"),
                ],
              ),
              SizedBox(
                height: 80.h,
              ),
              KTextField(
                hintText: "Enter Your Email",
                controller: controller.email,
              ),
              SizedBox(
                height: 26.h,
              ),
              KTextField(
                hintText: "Enter Password",
                controller: controller.password,
              ),
              SizedBox(
                height: 18.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Forgot Password?",
                    style: TextStyle(
                        color: AppColor.textColor, fontWeight: FontWeight.w500),
                  )
                ],
              ),
              SizedBox(
                height: 18.h,
              ),
              KButton(
                  title: "LOGIN",
                  onTap: () {
                    controller.onSign();
                  }),
              SizedBox(
                height: 140.h,
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.SIGNUP_SCREEN);
                },
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500),
                    children: [
                      TextSpan(text: "New User? "),
                      TextSpan(
                          text: "Register Here",
                          style: TextStyle(color: AppColor.textColor))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
