// file: splash/service.dart
import 'package:flutter/material.dart';
import 'controller.dart';

class SplashView extends StatefulWidget {
  final SplashController controller;

  const SplashView({super.key, required this.controller});

  @override
  SplashViewState createState() => SplashViewState();
}

class SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    widget.controller.initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/pcic_logo.png'),
            const SizedBox(height: 20),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
