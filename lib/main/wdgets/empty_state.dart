import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../resources/app_colors.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          'assets/icons/wallet.svg',
          fit: BoxFit.contain,
        ),
        SizedBox(height: 5.h),
        Text(
          'Empty here',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 30.sp,
            color: AppColors.black333333,
          ),
        ),
        Text(
          'Add new loan information to fill up this screen',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14.sp,
            color: AppColors.black333333.withOpacity(0.5),
          ),
        ),
        SizedBox(height: 16.h),
        GestureDetector(
          child: Container(
            alignment: Alignment.center,
            height: 60.h,
            width: 188.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: AppColors.blue3596FF,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/plus.svg',
                  fit: BoxFit.contain,
                ),
                SizedBox(width: 10.w),
                Text(
                  'Add new loan',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
