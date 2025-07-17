import 'package:barberloc/utils/app_colors.dart';
import 'package:barberloc/utils/validators.dart';
import 'package:barberloc/widgets/header_text_widget.dart';
import 'package:barberloc/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../widgets/button_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  String email = "", password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          width: 100.w,
          height: 100.h,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 20,
              children: [
                Icon(Icons.key_rounded,
                    size: 50.sp, color: AppColors.greyColor),
                HeaderText(
                  text: "LOGIN TO LOCATE YOUR BARBER",
                ),
                Divider(
                  height: 2.h,
                  color: Colors.transparent,
                ),
                Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      MyTextFormField(
                        inputType: TextInputType.emailAddress,
                        validator: Validators().reqEmailValidator,
                        helperText: "Required",
                        label: "Email",
                        onSaved: (String? value) {
                          setState(() {
                            email = value!;
                          });
                        },
                        icon: const Icon(Icons.email),
                      ),
                      Divider(
                        height: 0.5.h,
                        color: AppColors.whiteColor,
                      ),
                      MyTextFormField(
                        inputType: TextInputType.visiblePassword,
                        validator: Validators().reqPasswordValidator,
                        obscure: true,
                        helperText: "Required",
                        label: "Password",
                        onSaved: (String? value) {
                          setState(() {
                            password = value!;
                          });
                        },
                        icon: const Icon(Icons.lock_open_sharp),
                      ),
                      Divider(
                        height: 1.h,
                        color: AppColors.whiteColor,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, '/homepage'); // Example route
                            // if (_formKey.currentState!.validate()) {
                            //   _formKey.currentState!.save();
                            //   showDialog(
                            //       context: context,
                            //       builder: (context) =>
                            //           MyProgressDialog(),
                            //       barrierDismissible: false);
            
                            //   MyApiRequests.logUser(email, password)
                            //       .then((value) {
                            //     if (value.status == 'ok') {
            
                            //       Navigator.pop(context);
                            //       Hive.box('savedDetails').put(
                            //                 'user', value.details);
                            //             Hive.box('savedDetails')
                            //                 .put('isLogged', true);
                            //             Navigator
                            //                 .pushReplacementNamed(
                            //                     context,
                            //                     Routes.navPage);
                            //     } else if (value.status == 'error') {
                            //       Navigator.pop(context);
                            //       showDialog(
                            //         context: context,
                            //         builder: (context) => MyDialog(
                            //           title: "Login",
                            //           msg: value.msg,
                            //           fwrdBtn: 'Ok',
                            //           fwrdBtnAction: () {
                            //             Navigator.pop(context);
                            //           },
                            //         ),
                            //       );
                            //     } else {
                            //       Navigator.pop(context);
                            //       showDialog(
                            //         context: context,
                            //         builder: (context) => MyDialog(
                            //           title: "Login",
                            //           msg:
                            //               "Error logging in, please check your details and  try again",
                            //           fwrdBtn: "Ok",
                            //           fwrdBtnAction: () {
                            //             Navigator.pop(context);
                            //           },
                            //         ),
                            //       );
                            //     }
                            //   }).onError((error, stackTrace) {
                            //     Navigator.pop(context);
                            //     showDialog(
                            //         context: context,
                            //         builder: (context) => MyDialog(
                            //               title: "Log In",
                            //               msg:
                            //                   "OOps Something went wrong",
                            //               fwrdBtn: "Ok",
                            //               fwrdBtnAction: () {
                            //                 Navigator.pop(context);
                            //               },
                            //             ));
                            //   });
                            // }
                          },
                          style: MyButton().myButtonStyle(),
                          child: MyText(
                            text: 'LOGIN',
                            size: 14,
                            fontWeight: FontWeight.bold,
                            
                          )),
                      Divider(
                        height: 10.sp,
                        color: AppColors.whiteColor,
                      ),
                      InkWell(
                        onTap: () {
                          // Navigator.pushNamed(
                          //     context, Routes.forgotPassword);
                        },
                        splashColor: AppColors.redColor,
                        child: MyText(
                          text: "Forgot Password?",
                          color: AppColors.greenColor,
                        ),
                      ),
                      Divider(
                        height: 10.sp,
                        color: AppColors.whiteColor,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/register');
                        },
                        splashColor: AppColors.redColor,
                        child: MyText(
                          text: "No Account? Register!",
                          color: AppColors.greenColor,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
