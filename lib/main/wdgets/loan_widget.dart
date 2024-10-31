import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../resources/app_colors.dart';

class LoanWidget extends StatelessWidget {
  const LoanWidget({super.key, this.onTap, required this.total, required this.bankName, required this.paidOut, required this.remains});
  final VoidCallback? onTap;
  final String total;
  final String bankName;
  final String paidOut;
  final String remains;

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
                        color:
                        AppColors.black333333.withOpacity(0.5),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Paid out',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color:
                        AppColors.black333333.withOpacity(0.5),
                      ),
                    ),
                    Text(
                      '\$ $paidOut',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.black333333,
                      ),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Remains',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color:
                        AppColors.black333333.withOpacity(0.5),
                      ),
                    ),
                    Text(
                      '\$ $remains',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.black333333,
                      ),
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 10.h),
            LinearProgressIndicator(
              borderRadius: BorderRadius.circular(100.r),
              value: 15874 / 26659,
              backgroundColor: AppColors.blue3596FF.withOpacity(0.1),
              color: AppColors.blue3596FF,
              minHeight: 6.h,
            ),
          ],
        ),
      ),
    );
  }
}
