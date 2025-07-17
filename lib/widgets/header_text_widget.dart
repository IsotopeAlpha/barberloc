import 'package:barberloc/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class HeaderText extends StatelessWidget {
  String text;
  Color? color;
  double? size;
  TextAlign? textAlign;

  HeaderText(
      {super.key, required this.text, this.size, this.color, this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        textAlign: textAlign ?? TextAlign.center,
        style: TextStyle(
            fontSize: size ?? 16.sp,
            color: color ?? AppColors.blackColor,
            fontWeight: FontWeight.bold,
            wordSpacing: 2.sp),
      ),
    );
  }
}

// ignore: must_be_immutable
class MyText extends StatelessWidget {
  String text;
  Color? color;
  double? size;
  FontWeight? fontWeight;
  TextAlign? textAlign;

  MyText(
      {super.key,
      required this.text,
      this.size,
      this.color,
      this.fontWeight,
      this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: textAlign ?? TextAlign.left,
      text,
      style: TextStyle(
          fontWeight: fontWeight,
          fontSize: size ?? 14.sp,
          color: color ?? AppColors.blackColor),
    );
  }
}
