import 'package:barberloc/utils/app_colors.dart';
import 'package:barberloc/widgets/button_widget.dart';
import 'package:flutter/material.dart';


class LandingPage extends StatelessWidget {
  const LandingPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: AppColors.defaultColor,
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/baberlocLogo.png', width: 200, height: 200),
            Text('WELCOME TO BARBERLOC!', style: TextStyle(fontSize: 20, color: AppColors.whiteColor, fontWeight: FontWeight.bold)),
            ElevatedButton(
              style: MyButton().myButtonStyle(),
              onPressed: () {
                Navigator.pushNamed(context, '/login'); // Example route
              },
              child: Text('Login'),
            ),
            ElevatedButton(
              style: MyButton().myButtonStyle(),
              onPressed: () {
                Navigator.pushNamed(context, '/register'); // Example route
              },
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}