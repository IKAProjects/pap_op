import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../onboarding/onboarding.dart';
import '../resources/app_colors.dart';

class Splash extends StatefulWidget {
  const Splash({
    super.key,
  });

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 1),
      () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Onboarding(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue3596FF,
      body: Center(
        child: Container(
          alignment: Alignment.center,
          width: 300.w,
          height: 300.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white.withOpacity(0.11),
          ),
          child: Image.asset(
            'assets/images/logo.png',
            fit: BoxFit.contain,
            width: 200.w,
            height: 200.h,
          ),
        ),
      ),
    );
  }
}
