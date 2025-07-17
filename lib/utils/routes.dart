import 'package:barberloc/screens/home_page.dart';
import 'package:barberloc/screens/login.dart';
import 'package:barberloc/screens/register.dart';
import 'package:barberloc/screens/landin_page.dart';
import 'package:flutter/material.dart';

class Routes {
  static const loginPage = '/login';
  static const registerPage = '/register';
  static const landingPage = '/landing';
  static const homePage = '/homepage';

  static Map<String, Widget Function(BuildContext)> registerRoutes() {
    return {
      landingPage: (context) => const LandingPage(),
      loginPage: (context) => const LoginPage(),
      registerPage: (context) => const SignUpPage(),
      homePage: (context) => const MyHomePage(), // Assuming you have a HomePage widget
    };
  }
}
