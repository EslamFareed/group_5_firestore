import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:group_5_firestore/screens/profile/profile_screen.dart';

import '../main/main_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MainScreen(),
            // builder: (context) => ProfileScreen(),
          ));
    });

    return const Scaffold(
      backgroundColor: Colors.indigo,
      body: Center(
        child: Icon(
          CupertinoIcons.airplane,
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}
