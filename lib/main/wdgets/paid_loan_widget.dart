import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../resources/app_colors.dart';

class PaidLoanWidget extends StatelessWidget {
  const PaidLoanWidget({
    super.key,
    this.onTap,
    required this.total,
    required this.bankName,
  });

  final VoidCallback? onTap;
  final String total;
  final String bankName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total - \$ $total',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black333333.withOpacity(0.5),
                      ),
                    ),
                    Text(
                      bankName,
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.black333333,
                      ),
                    )
                  ],
                ),
                SvgPicture.asset(
                  'assets/icons/arrow_right.svg',
                  fit: BoxFit.contain,
                ),
              ],
            ),
            SizedBox(height: 16.h),
            LinearProgressIndicator(
              borderRadius: BorderRadius.circular(100.r),
              value: 200 / 200,
              backgroundColor: AppColors.black333333.withOpacity(0.1),
              color: AppColors.green22A51B,
              minHeight: 6.h,
            ),
          ],
        ),
      ),
    );
  }
}
