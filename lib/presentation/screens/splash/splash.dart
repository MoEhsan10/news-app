import 'dart:async';  // Add this import

import 'package:flutter/material.dart';
import 'package:news_app/core/utils/assets_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/colors_manager.dart';
import 'package:news_app/core/utils/routes_manager.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    // Using Timer to delay the navigation by 2 seconds
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, RoutesManager.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: ColorsManager.white,
          child: Image.asset(
            AssetsManager.bgPattern,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Center(
          child: Image.asset(
            AssetsManager.splashLogo,
            width: 199.w,
            height: 208.h,
          ),
        ),
      ],
    );
  }
}
