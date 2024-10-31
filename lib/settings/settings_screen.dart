import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../resources/app_colors.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteF1F3F6,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: RotatedBox(
            quarterTurns: 2,
            child: Center(
              child: SvgPicture.asset(
                'assets/icons/arrow_right.svg',
                fit: BoxFit.contain,
                width: 36.w,
                height: 36.h,
              ),
            ),
          ),
        ),
        backgroundColor: AppColors.whiteF1F3F6,
        title: Text(
          'Settings',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18.sp,
            color: AppColors.blue102F4E,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              SizedBox(height: 10.h),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: AppColors.yellowFFAB35,
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/restore.svg',
                      fit: BoxFit.contain,
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      'Restore Purchases',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16.sp,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: AppColors.blue3596FF,
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/shield.svg',
                      fit: BoxFit.contain,
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      'Restore Purchases',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16.sp,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: AppColors.blue3596FF,
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/bill.svg',
                      fit: BoxFit.contain,
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      'Terms of Use',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16.sp,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: AppColors.blue3596FF,
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/share.svg',
                      fit: BoxFit.contain,
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      'Share',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16.sp,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),SizedBox(height: 10.h),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: AppColors.blue3596FF,
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/discussion.svg',
                      fit: BoxFit.contain,
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      'Support',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16.sp,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
