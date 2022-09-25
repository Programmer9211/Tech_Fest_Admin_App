import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../const/app_const/app_color.dart';

class KTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  const KTextField(
      {super.key, required this.hintText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: Colors.blue,
      maxLines: 1,
      decoration: InputDecoration(
        fillColor: Color(0xffF3F3F3),
        filled: true,
        isDense: true,
        hintText: hintText,
        hintStyle: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: AppColor.hintText),
        focusColor: Colors.blue,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 2),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(5.r),
        ),
      ),
    );
  }
}
