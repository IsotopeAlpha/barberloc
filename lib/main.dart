import 'package:barberloc/screens/landin_page.dart';
import 'package:barberloc/utils/app_colors.dart';
import 'package:barberloc/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: ((context, orientation, deviceType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: AppColors.greenColor, primaryColor: AppColors.greenColor, focusColor: AppColors.whiteColor),
        home: const LandingPage(),
        routes: Routes.registerRoutes(),
      );
    }));
  }
}

