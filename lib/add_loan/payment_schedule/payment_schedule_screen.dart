import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pap_op/add_loan/payment_schedule/widgets/data_widget.dart';

import '../../resources/app_colors.dart';

class PaymentScheduleScreen extends StatefulWidget {
  const PaymentScheduleScreen({super.key});

  @override
  State<PaymentScheduleScreen> createState() => _PaymentScheduleScreenState();
}

class _PaymentScheduleScreenState extends State<PaymentScheduleScreen> {
  final List<bool> _isExpanded = List.generate(5, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteF1F3F6,
      appBar: AppBar(
        leading: RotatedBox(
          quarterTurns: 2,
          child: Center(
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
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
          'Add new loan',
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
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Total loan amount',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.black333333.withOpacity(0.5),
                              ),
                            ),
                            Text(
                              '\$ 25 000',
                              style: TextStyle(
                                fontSize: 26.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.black333333,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Total overpayment',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.black333333.withOpacity(0.5),
                              ),
                            ),
                            Text(
                              '\$ 1 659',
                              style: TextStyle(
                                fontSize: 26.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.black333333,
                              ),
                            ),
                          ],
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
                                color: AppColors.black333333.withOpacity(0.5),
                              ),
                            ),
                            Text(
                              '\$ 15 874',
                              style: TextStyle(
                                fontSize: 26.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.black333333,
                              ),
                            ),
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
                                color: AppColors.black333333.withOpacity(0.5),
                              ),
                            ),
                            Text(
                              '\$ 10 785',
                              style: TextStyle(
                                fontSize: 26.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.black333333,
                              ),
                            ),
                          ],
                        ),
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
                    SizedBox(height: 16.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Interest rate (annual)',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14.sp,
                                color: AppColors.black333333.withOpacity(0.5),
                              ),
                            ),
                            SizedBox(height: 5.h),
                            Text(
                              '12%',
                              style: TextStyle(
                                fontSize: 26.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.black333333,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 32.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                'Term (in months)',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.sp,
                                  color: AppColors.black333333.withOpacity(0.5),
                                ),
                              ),
                            ),
                            SizedBox(height: 5.h),
                            Text(
                              '12 mo.',
                              style: TextStyle(
                                fontSize: 26.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.black333333,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 26.h),
                  ],
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return ExpansionTile(
                      title: Text(
                        '${2020 + index}',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 26.sp,
                          color: AppColors.black333333,
                        ),
                      ),
                      trailing: RotatedBox(
                        quarterTurns: _isExpanded[index] ? 3 : 1,
                        child: SvgPicture.asset(
                          'assets/icons/arrow_right.svg',
                          fit: BoxFit.contain,
                        ),
                      ),
                      tilePadding: EdgeInsets.zero,
                      childrenPadding: EdgeInsets.zero,
                      onExpansionChanged: (expanded) {
                        setState(() {
                          _isExpanded[index] = expanded;
                        });
                      },
                      children: List.generate(3, (itemIndex) {
                        return const DataWidget(
                          date: '14 january 2025',
                          payment: 2222,
                          percentage: 22,
                          remains: 222,
                        );
                      }),
                    );
                  },
                  childCount: 5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
