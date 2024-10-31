import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../resources/app_colors.dart';

class PeriodicityWidget extends StatelessWidget {
  const PeriodicityWidget({super.key, this.onScheduleTap});

  final VoidCallback? onScheduleTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: AppColors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total payments',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 13.sp,
                  color: AppColors.black333333.withOpacity(0.5),
                ),
              ),
              Text(
                '\$ 26 659',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16.sp,
                  color: AppColors.black333333,
                ),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Overpayment',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 13.sp,
                  color: AppColors.black333333.withOpacity(0.5),
                ),
              ),
              Text(
                '\$ 1 659',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16.sp,
                  color: AppColors.black333333,
                ),
              )
            ],
          ),
          GestureDetector(
            onTap: onScheduleTap,
            child: Container(
              alignment: Alignment.center,
              width: 48.w,
              height: 48.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13.r),
                color: AppColors.blue3596FF,
              ),
              child: SvgPicture.asset(
                'assets/icons/calendar.svg',
                fit: BoxFit.contain,
              ),
            ),
          )
        ],
      ),
    );
  }
}
