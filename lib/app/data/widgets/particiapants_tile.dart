import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_fest_admin_app/app/models/user_model.dart';

class ParticipantsTile extends StatelessWidget {
  final UserModel model;
  const ParticipantsTile({super.key, required this.model});

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
              model.name,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              "Registration ID : ${model.registrationId}",
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
