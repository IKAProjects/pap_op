import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pap_op/add_loan/add_loan_screen.dart';
import 'package:pap_op/main/wdgets/loan_widget.dart';
import 'package:pap_op/main/wdgets/paid_loan_widget.dart';
import 'package:pap_op/main/wdgets/switcher.dart';
import 'package:pap_op/resources/app_colors.dart';
import 'package:pap_op/settings/settings_screen.dart';

import '../loan_info/loan_info_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool showPaidOut = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteF1F3F6,
      appBar: AppBar(
        backgroundColor: AppColors.whiteF1F3F6,
        centerTitle: false,
        title: Text(
          'Loans',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 34.sp,
            color: AppColors.black0A1026,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsScreen(),
                  ),
                );
              },
              child: SvgPicture.asset(
                'assets/icons/settings.svg',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.h),
                    Text(
                      'Total loan amount',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black333333.withOpacity(0.5),
                      ),
                    ),
                    Text(
                      '0\$',
                      style: TextStyle(
                        fontSize: 26.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.black333333,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Switcher(
                      selected: showPaidOut,
                      onPaying: () {
                        setState(() {
                          showPaidOut = false;
                        });
                      },
                      onPaid: () {
                        setState(() {
                          showPaidOut = true;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: 26.h),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              sliver: SliverList.separated(
                itemBuilder: (context, index) {
                  if (showPaidOut) {
                    return PaidLoanWidget(
                      onTap: () {},
                      total: '375',
                      bankName: 'TBC Bank',
                    );
                  } else {
                    return LoanWidget(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoanInfoScreen(),
                          ),
                        );
                      },
                      total: '26 659',
                      bankName: 'Asia Alliance Bank',
                      paidOut: '15 874',
                      remains: '10 785',
                    );
                  }
                },
                separatorBuilder: (context, index) => SizedBox(height: 10.h),
                itemCount: 2,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.blue3596FF,
        heroTag: 'btn1',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddLoanScreen(),
            ),
          );
        },
        child: Container(
          alignment: Alignment.center,
          height: 60.h,
          decoration: const BoxDecoration(
            color: AppColors.blue3596FF,
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset(
            'assets/icons/plus.svg',
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
