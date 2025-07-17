import 'package:barberloc/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class MyTextFormField extends StatelessWidget {
  String? label, helperText, hintText, initialValue;
  Icon? icon;
  String? Function(String?)? validator;
  TextEditingController? controller;
  Function(String?)? onSaved, onChanged;
  bool? obscure;
  Color? fillColor;
  TextInputType? inputType;

  MyTextFormField(
      {super.key,
      this.label,
      this.controller,
      this.validator,
      this.icon,
      this.hintText,
      this.obscure,
      this.onSaved,
      this.onChanged,
      this.fillColor,
      this.inputType,
      this.helperText,
      this.initialValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      
      padding: EdgeInsets.all(5.sp),
      child: TextFormField(
        initialValue: initialValue,
        validator: validator,
        controller: controller,
        onSaved: onSaved,
        onChanged: onChanged,
        obscureText: obscure ?? false,
        keyboardType: inputType,
        decoration: InputDecoration(
          fillColor: Colors.white,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30))),
          prefixIconColor: AppColors.whiteColor,
          suffixIconColor: AppColors.greyColor,
          suffixIcon: obscure == true
              ? InkWell(
                  child: const Icon(Icons.visibility),
                  onTap: () {
                    obscure = !obscure!;
                    (context as Element).markNeedsBuild();
                  },
                )
              : obscure == null
                  ? null
                  : InkWell(
                      child: const Icon(Icons.visibility_off),
                      onTap: () {
                        obscure = !obscure!;
                        (context as Element).markNeedsBuild();
                      },
                    ),
          labelText: label,
          iconColor: AppColors.whiteColor,
          hintText: hintText,
          helperText: helperText,
          prefixIcon: icon,
        ),
      ),
    );
  }
}
