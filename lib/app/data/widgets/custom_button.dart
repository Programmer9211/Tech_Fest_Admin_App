import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../const/app_const/app_color.dart';

class KButton extends StatelessWidget {
  final String title;
  final onTap;

  const KButton({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 64.h,
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 18.sp,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11.r),
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
    );
  }
}
