import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../const/app_const/app_color.dart';

class EventTile extends StatelessWidget {
  const EventTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Container(
        height: 260.h,
        width: 360.w,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                      height: 98.h,
                      width: 98.h,
                      //child : Image.asset(""),
                      decoration: BoxDecoration(
                          color: Color(0xff0b0b0b),
                          borderRadius:
                              BorderRadius.all(Radius.circular(8.r)))),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Event Name",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24.sp,
                            fontFamily: 'ubuntu',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Text(
                          "Slogan description goes here",
                          style: TextStyle(
                            color: Color(0x99000000),
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'ubuntu',
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              color: Color(0x66000000),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'ubuntu',
                            ),
                            children: [
                              TextSpan(text: "Participants: "),
                              TextSpan(
                                text: "965",
                                style: TextStyle(
                                  color: Color(0xff000000),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'ubuntu',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 14.h,
              ),
              Row(
                children: [
                  Text(
                    "Venue",
                    style: TextStyle(
                        color: Color(0xff000000),
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Expanded(
                    child: Container(height: 1.3.h, color: Color(0x80000000)),
                  ),
                  Container(
                    height: 1.4,
                    width: 72.w,
                  )
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "Lorem Ipsum Lorem Ipsum Lorem Ipsum",
                style: TextStyle(
                    color: Color(0x99000000),
                    fontWeight: FontWeight.w500,
                    fontSize: 13.sp),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  Text(
                    "Timings",
                    style: TextStyle(
                        color: Color(0xff000000),
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Expanded(
                    child: Container(height: 1.3.h, color: Color(0x80000000)),
                  ),
                  Container(
                    height: 1.5,
                    width: 90.w,
                  )
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "Start at 7:00 AM",
                style: TextStyle(
                    color: Color(0x99000000),
                    fontWeight: FontWeight.w500,
                    fontSize: 13.sp),
              ),
              SizedBox(
                height: 12.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 9.h,
                        width: 9.w,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border:
                                Border.all(width: 2.w, color: Colors.black)),
                      ),
                      SizedBox(
                        width: 6.w,
                      ),
                      Text(
                        "Live",
                        style: TextStyle(
                            color: Color(0xff000000),
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: 85.w,
                      height: 28.h,
                      alignment: Alignment.center,
                      child: Text("Edit",
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontFamily: "ubuntu")),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(
                          Radius.circular(6.r),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
            color: Color(0xffD6d6d6),
            borderRadius: BorderRadius.all(Radius.circular(8.r))),
      ),
    );
  }
}
