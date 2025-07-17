import 'package:flutter/material.dart';
import 'header_text_widget.dart';

// ignore: must_be_immutable
class MyDialog extends StatelessWidget {
  MyDialog(
      {super.key,
      this.title,
      this.msg,
      this.msgW,
      this.fwrdBtn,
      this.bckBtn,
      this.fwrdBtnAction,
      this.bckBtnAction});
  String? title, msg, fwrdBtn, bckBtn;
  Widget? msgW;
  Function? fwrdBtnAction, bckBtnAction;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: MyText(text: title ?? "", fontWeight: FontWeight.bold),
      content: Text(msg ?? ""),
      actions: [
        bckBtn != null
            ? TextButton(
                onPressed: () => bckBtnAction!(), child: Text(bckBtn ?? ""))
            : Container(),
        TextButton(
            onPressed: () => fwrdBtnAction!(), child: Text(fwrdBtn ?? ""))
      ],
    );
  }
}
