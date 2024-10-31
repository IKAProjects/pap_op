import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../resources/app_colors.dart';

class DataWidget extends StatelessWidget {
  const DataWidget({
    super.key,
    required this.date,
    required this.payment,
    required this.percentage,
    required this.remains,
    this.isPaid = false,
  });

  final String date;
  final int payment;
  final int percentage;
  final int remains;
  final bool isPaid;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(vertical: 16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color:
            isPaid ? AppColors.green22A51B.withOpacity(0.1) : AppColors.white,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                date,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.black333333,
                ),
              ),
              SvgPicture.asset(
                isPaid? 'assets/icons/paid.svg':'assets/icons/stopwatch.svg',
                fit: BoxFit.contain,
              )
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Text(
                'Payment ',
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                  color: isPaid
                      ?  AppColors.green22A51B: AppColors.black333333.withOpacity(0.5)

                ),
              ),
              Expanded(
                child: Text(
                  '............................................',
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                    color:  isPaid
                        ?AppColors.green22A51B: AppColors.black333333.withOpacity(0.5)

                  ),
                  maxLines: 1,
                ),
              ),
              Text(
                ' \$ $payment',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: isPaid ?AppColors.green22A51B :AppColors.blue3596FF,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Text(
                'Percentages ',
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black333333.withOpacity(0.5),
                ),
              ),
              Expanded(
                child: Text(
                  '............................................',
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black333333.withOpacity(0.5),
                  ),
                  maxLines: 1,
                ),
              ),
              Text(
                ' \$ $percentage',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.blue3596FF,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Text(
                'Remains ',
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black333333.withOpacity(0.5),
                ),
              ),
              Expanded(
                child: Text(
                  '............................................',
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black333333.withOpacity(0.5),
                  ),
                  maxLines: 1,
                ),
              ),
              Text(
                ' \$ $remains',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.blue3596FF,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

}
