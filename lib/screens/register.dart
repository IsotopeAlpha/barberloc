import 'dart:io';
import 'package:barberloc/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../utils/app_colors.dart';
import '../widgets/button_widget.dart';
import '../widgets/header_text_widget.dart';
import '../widgets/text_form_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  // final _verifyKey = GlobalKey<FormState>();

  String email = "",
      name = "",
      gender = "",
      phone = "",
      password = "",
      program = "",
      level = "",
      verifyText = "";
  String? imageUrl, imageId;
  File? imageFile;
  String imageFilePath = "";
  bool verified = false;
  bool openVerify = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(20.sp),
        width: 100.w,
        height: 100.h,
        color: AppColors.defaultColor,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.mark_chat_read,
                  size: 50.sp, color: AppColors.greyColor),
              HeaderText(
                  textAlign: TextAlign.center,
                  text: "REGISTER TO LOCATE THE BEST BARBER NEAR YOU"),
              Divider(
                height: 2.h,
                color: Colors.transparent,
              ),
              Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  spacing: 20,
                  children: [
                    MyTextFormField(
                      inputType: TextInputType.emailAddress,
                      validator: Validators().reqEmailValidator,
                      helperText: "Required",
                      label: "Email",
                      onChanged: (value) {
                        setState(() {
                          email = value!;
                        });
                      },
                      icon: const Icon(Icons.email),
                    ),
                    MyTextFormField(
                      validator: Validators().reqValidator,
                      helperText: "Required",
                      label: "Full Name",
                      onSaved: (value) {
                        setState(() {
                          name = value!;
                        });
                      },
                      icon: const Icon(Icons.contact_page),
                    ),
                    MyTextFormField(
                      inputType: TextInputType.number,
                      validator: Validators().reqPhoneValidator,
                      helperText: "Required",
                      label: "Phone Number",
                      onSaved: (value) {
                        setState(() {
                          phone = value!;
                        });
                      },
                      icon: const Icon(Icons.phone),
                    ),
                    MyTextFormField(
                      validator: Validators().reqPasswordValidator,
                      obscure: true,
                      helperText: "Required",
                      label: "Password",
                      onSaved: (value) {
                        setState(() {
                          password = value!;
                        });
                      },
                      icon: const Icon(Icons.lock),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, '/login'); // Example route
                          // if (_formKey.currentState!.validate()) {
                          //   _formKey.currentState!.save();
                          //   if (imageFilePath == "") {
                          //     showDialog(
                          //         context: context,
                          //         builder: (context) => MyDialog(
                          //               title: "Image",
                          //               msg:
                          //                   "Profile Pic is required",
                          //               fwrdBtn: "Ok",
                          //               fwrdBtnAction: () {
                          //                 Navigator.pop(context);
                          //               },
                          //             ));
                          //   } else if (verified == false) {
                          //     showDialog(
                          //         context: context,
                          //         builder: (context) => MyDialog(
                          //               title: "Email Verification",
                          //               msg:
                          //                   "Email Not Verified! Please Verify to continue!",
                          //               fwrdBtn: "Ok",
                          //               fwrdBtnAction: () {
                          //                 Navigator.pop(context);
                          //               },
                          //             ));
                          //   }else {
                          //     showDialog(
                          //         context: context,
                          //         builder: (context) =>
                          //             MyProgressDialog(),
                          //         barrierDismissible: false);
                          //     signUser()
                          //         .then((value) => {
                          //               if (value['status'] == 'ok')
                          //                 {
                          //                   Navigator.pop(context),
                          //                   showDialog(
                          //                     context: context,
                          //                     builder: (context) =>
                          //                         MyDialog(
                          //                       title: "Sign Up",
                          //                       msg: value['msg'],
                          //                       fwrdBtn: 'Ok',
                          //                       fwrdBtnAction: () {
                          //                         Navigator.pushNamed(
                          //                             context,
                          //                             Routes
                          //                                 .loginPage);
                          //                       },
                          //                     ),
                          //                   )
                          //                 }
                          //               else if (value['status'] ==
                          //                   'error')
                          //                 {
                          //                   Navigator.pop(context),
                          //                   showDialog(
                          //                     context: context,
                          //                     builder: (context) =>
                          //                         MyDialog(
                          //                       title: "Sign Up",
                          //                       msg: value['msg'],
                          //                       fwrdBtn: 'Ok',
                          //                       fwrdBtnAction: () {
                          //                         Navigator.pushNamed(
                          //                             context,
                          //                             Routes
                          //                                 .loginPage);
                          //                       },
                          //                     ),
                          //                   )
                          //                 }
                          //               else
                          //                 {
                          //                   Navigator.pop(context),
                          //                   showDialog(
                          //                     context: context,
                          //                     builder: (context) =>
                          //                         MyDialog(
                          //                       title: "Sign Up",
                          //                       msg:
                          //                           "Couldn't complete Registraion. Please Try Again",
                          //                       fwrdBtn: 'Ok',
                          //                       fwrdBtnAction: () {
                          //                         Navigator.pop(
                          //                             context);
                          //                       },
                          //                     ),
                          //                   )
                          //                 }
                          //             })
                          //         .onError((error, stackTrace) {
                          //       Navigator.pop(context);
                          //       showDialog(
                          //           context: context,
                          //           builder: (context) => MyDialog(
                          //                 title: "Sign Up",
                          //                 msg:
                          //                     "OOps Something went wrong",
                          //                 fwrdBtn: "Ok",
                          //                 fwrdBtnAction: () {
                          //                   Navigator.pop(context);
                          //                 },
                          //               ));
                          //       throw ("");
                          //     });
                          //   }
                          // }
                        },
                        style: MyButton().myButtonStyle(),
                        child: MyText(
                          text: 'REGISTER',
                          fontWeight: FontWeight.bold,
                        )),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: MyText(
                        text: "Already Have An Account? Login!",
                        color: AppColors.blackColor,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // Future verifyEmail(String email) async {
  //   Map data = {"email": email};
  //   MyApiRequests.sendVerification(data).then((value) {
  //     if (value['status'] == 'ok') {
  //       showDialog(
  //           context: context,
  //           builder: (context) => MyDialog(
  //                 title: "Verification",
  //                 msg: value['msg'],
  //                 fwrdBtn: "Ok",
  //                 fwrdBtnAction: () {
  //                   Navigator.pop(context);
  //                   showDialog(
  //                     context: context,
  //                     builder: (context) {
  //                       return AlertDialog(
  //                         title: const Text("Authourization"),
  //                         content: Form(
  //                           key: _verifyKey,
  //                           child: MyTextFormField(
  //                             label: "Enter OTP",
  //                             validator: Validators().reqValidator,
  //                             onSaved: (value) {
  //                               setState(() {
  //                                 verifyText = value!;
  //                               });
  //                             },
  //                           ),
  //                         ),
  //                         actions: [
  //                           TextButton(
  //                               onPressed: () {
  //                                 Navigator.pop(context);
  //                               },
  //                               child: const Text("Cancel")),
  //                           TextButton(
  //                               onPressed: () {
  //                                 if (_verifyKey.currentState!.validate()) {
  //                                   _verifyKey.currentState!.save();
  //                                   showDialog(
  //                                     barrierDismissible: false,
  //                                     context: context,
  //                                     builder: (context) => MyProgressDialog(),
  //                                   );
  //                                   MyApiRequests.verifyEmail(email, verifyText)
  //                                       .then((value) {
  //                                     if (value['status'] == 'ok') {
  //                                       setState(() {
  //                                         verified = true;
  //                                         openVerify = false;
  //                                       });
  //                                       Navigator.pop(context);
  //                                       showDialog(
  //                                           context: context,
  //                                           builder: (context) => MyDialog(
  //                                                 title: "Verification",
  //                                                 msg: value['msg'],
  //                                                 fwrdBtn: "Ok",
  //                                                 fwrdBtnAction: () {
  //                                                   Navigator.pop(context);
  //                                                   Navigator.pop(context);
  //                                                 },
  //                                               ));
  //                                     } else {
  //                                       Navigator.pop(context);
  //                                       showDialog(
  //                                           context: context,
  //                                           builder: (context) => MyDialog(
  //                                                 title: "Verification",
  //                                                 msg: "Verification Failed",
  //                                                 fwrdBtn: "Ok",
  //                                                 fwrdBtnAction: () {
  //                                                   Navigator.pop(context);
  //                                                 },
  //                                               ));
  //                                     }
  //                                   }).onError((error, stackTrace) {
  //                                     Navigator.pop(context);
  //                                     showDialog(
  //                                         context: context,
  //                                         builder: (context) => MyDialog(
  //                                               title: "Verification",
  //                                               msg:
  //                                                   "OOps Something went wrong",
  //                                               fwrdBtn: "Ok",
  //                                               fwrdBtnAction: () {
  //                                                 Navigator.pop(context);
  //                                               },
  //                                             ));
  //                                     throw ("");
  //                                   });
  //                                 }
  //                               },
  //                               child: const Text("Verify"))
  //                         ],
  //                       );
  //                     },
  //                   );
  //                 },
  //               ));
  //     } else {
  //       Navigator.pop(context);
  //       showDialog(
  //           context: context,
  //           builder: (context) => MyDialog(
  //                 title: "Verification",
  //                 msg: "Verification failed",
  //                 fwrdBtn: "Ok",
  //                 fwrdBtnAction: () {
  //                   Navigator.pop(context);
  //                 },
  //               ));
  //     }
  //   }).onError((error, stackTrace) {
  //     Navigator.pop(context);
  //     showDialog(
  //         context: context,
  //         builder: (context) => MyDialog(
  //               title: "Verification",
  //               msg: "OOps Something went wrong",
  //               fwrdBtn: "Ok",
  //               fwrdBtnAction: () {
  //                 Navigator.pop(context);
  //               },
  //             ));
  //     throw ("");
  //   });
  // }

  // Future signUser() async {
  //   final cloudinary = Cloudinary.full(
  //     apiKey: '728234898474631',
  //     apiSecret: 'Xh3iwcfo-HiJw7nY4ttrca-dZ1M',
  //     cloudName: 'dsybyyi1n',
  //   );
  //   final imageResponse = await cloudinary.uploadResource(
  //       CloudinaryUploadResource(
  //           filePath: imageFilePath,
  //           fileBytes: imageFile!.readAsBytesSync(),
  //           resourceType: CloudinaryResourceType.image,
  //           folder: 'mola/users'));
  //   if (imageResponse.isSuccessful) {
  //     setState(() {
  //       imageUrl = imageResponse.url;
  //       imageId = imageResponse.publicId;
  //     });
  //     Map data = {
  //       "phone": phone,
  //       "name": name,
  //       "email": email,
  //       "gender": gender,
  //       "program": program,
  //       "password": password,
  //       "imageUrl": imageUrl,
  //       "imageId": imageId,
  //       "level": level
  //     };

  //     try {
  //       final response = await Dio().post(Endpoints.signUpUrl, data: data);

  //       return response.data;
  //     } catch (err) {
  //       // ignore: avoid_print
  //       print(err);
  //       Future.error(err);
  //     }
  //   } else {
  //     // ignore: avoid_print
  //     print(imageResponse.error);
  //   }
  // }
}
