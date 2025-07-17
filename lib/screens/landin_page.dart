import 'package:barberloc/widgets/button_widget.dart';
import 'package:flutter/material.dart';


class LandingPage extends StatelessWidget {
  const LandingPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Landing Page'),
      ),
      body: Center(
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to the BaberLoc App!', style: TextStyle(fontSize: 20)),
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