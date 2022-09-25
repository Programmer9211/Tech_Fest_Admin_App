import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ParticipantsTile extends StatelessWidget {
  const ParticipantsTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: 360.w,
      decoration: BoxDecoration(
          color: Color(0xffd6d6d6), borderRadius: BorderRadius.circular(8.r)),
      child: Row(children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
            height: 48.h,
            width: 48.w,
            decoration: BoxDecoration(
                color: Color(0xff000000),
                borderRadius: BorderRadius.all(Radius.circular(8.r))),
          ),
        ),
        SizedBox(
          width: 14.w,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Nitin Singh",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              "Registration ID : 452776484",
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: Color(0x99000000),
              ),
            )
          ],
        )
      ]),
    );
  }
}
