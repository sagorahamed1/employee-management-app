import 'package:flutter/material.dart';
import 'package:employee_managment/global/custom_assets/assets.gen.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          
          Assets.images.logo.image(),



          Lottie.asset(
            'assets/lottie/loading.json',
            width: 200,
            height: 200,
            fit: BoxFit.cover,
            repeat: true,
            reverse: false,
            animate: true,
          ),
        ],
      ),
    );
  }
}
