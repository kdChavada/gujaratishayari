import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gujaratishayari/view/wel_come.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  startTime() async {
    var duration = const Duration(seconds: 4);
    return Timer(duration, route);
  }

  //Route For Home Page
  route() {
    Navigator.pushAndRemoveUntil<void>(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const WelComeView(),
      ),
      (Route<dynamic> route) => false,
    );
  }

  @override
  void initState() {
    startTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return SizedBox(
      height: h,
      width: w,
      child: Image.asset(
        "assets/images/splash.png",
        fit: BoxFit.cover,
      ),
    );
  }
}
