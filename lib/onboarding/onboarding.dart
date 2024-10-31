import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pap_op/main/main_screen.dart';
import 'package:pap_op/resources/app_colors.dart';

import 'utils/box_assets.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteF1F3F6,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                controller: _controller,
                itemCount: boxAssets.length,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (_, i) {
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          boxAssets[i].asset,
                          fit: BoxFit.cover,
                          height: 537.h,
                          width: double.infinity,
                        ),
                        Text(
                          boxAssets[i].text1,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 30.sp,
                            color: AppColors.black333333,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: GestureDetector(
                onTap: _nextPage,
                child: Container(
                  alignment: Alignment.center,
                  height: 60.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: AppColors.blue3596FF,
                  ),
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  void _nextPage() {
    if (currentIndex < boxAssets.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const MainScreen(),
        ),
          (predicate) => false,
      );
    }
  }
}
