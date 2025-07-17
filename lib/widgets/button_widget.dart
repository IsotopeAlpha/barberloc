import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../utils/app_colors.dart';

class MyTextButton extends StatelessWidget {
  const MyTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

// ignore: must_be_immutable
class MyButton {
  Color? buttonColor;

  MyButton({Key? key, this.buttonColor});

  ButtonStyle myButtonStyle() {
    return ElevatedButton.styleFrom(
      foregroundColor: AppColors.blackColor,
        backgroundColor: buttonColor ?? AppColors.greyColor,
        padding: EdgeInsets.symmetric(vertical: 15.sp, horizontal: 30.sp),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.sp)),
        textStyle: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.whiteColor,
        ));
        
  }
}
