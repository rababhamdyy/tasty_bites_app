import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tasty_bites_app/views/home_view.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(
          builder: (context) => HomeView(), 
        ),
      );
    });

    return Scaffold(
      body: Center(
        child: Lottie.asset('assets/animations/Animation2.json'),
      ),
    );
  }
}