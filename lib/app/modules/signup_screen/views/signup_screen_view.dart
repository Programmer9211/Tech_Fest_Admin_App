import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:tech_fest_admin_app/app/routes/app_pages.dart';

import '../../../data/widgets/custom_button.dart';
import '../../../data/widgets/custom_textfield.dart';
import '../controllers/signup_screen_controller.dart';

class SignupScreenView extends GetView<SignupScreenController> {
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
                        padding: const EdgeInsets.only(left: 2).r,
                        child: Text(
                          "Organiser",
                          style: TextStyle(
                            fontSize: 19.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Text(
                        "SIGN UP",
                        style: TextStyle(
                          fontSize: 52.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  // SizedBox(width: ,),
                  Image.asset("assets/icon.png"),
                ],
              ),
              SizedBox(
                height: 50.h,
              ),
              KTextField(
                hintText: "Enter Full Name",
                controller: controller.name,
              ),
              SizedBox(
                height: 26.h,
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Transform.scale(
                    scale: 1.4,
                    child: Checkbox(
                      value: controller.isChecked,
                      onChanged: ((value) {
                        value != value;
                      }),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3.5)),
                    ),
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500),
                      children: [
                        TextSpan(
                            text:
                                "By registering to the app you agree to the\n"),
                        TextSpan(
                            text: "Terms and Conditions ",
                            style: TextStyle(color: Colors.blue)),
                        TextSpan(text: "and "),
                        TextSpan(
                          text: "Privacy Policy",
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 18.h,
              ),
              KButton(
                title: "SIGN UP",
                onTap: () {
                  controller.onSignup();
                },
              ),
              SizedBox(
                height: 70.h,
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.SIGNIN_SCREEN);
                },
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500),
                    children: [
                      TextSpan(text: "Already have an account? "),
                      TextSpan(
                        text: "Sign In",
                        style: TextStyle(color: Colors.blue),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
