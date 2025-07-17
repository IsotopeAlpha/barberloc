import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class MyProgressDialog extends StatelessWidget {
  MyProgressDialog({super.key, this.text});

  String? text;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Row(
        children: [
          const CircularProgressIndicator(),
          Container(
            width: 50.w,
            padding: EdgeInsets.only(
              left: 10.sp,
            ),
            child: text != null ? Text(text!) : const Text("Loading ..."),
          )
        ],
      ),
    );
  }
}
