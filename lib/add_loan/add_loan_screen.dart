import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pap_op/add_loan/payment_schedule/payment_schedule_screen.dart';
import 'package:pap_op/add_loan/widgets/add_switcher.dart';
import 'package:pap_op/add_loan/widgets/periodicity_switcher.dart';
import 'package:pap_op/add_loan/widgets/periodicity_widget.dart';
import 'package:pap_op/add_loan/widgets/term_choice_dialog.dart';

import '../resources/app_colors.dart';
import 'widgets/custom_text_field.dart';

class AddLoanScreen extends StatefulWidget {
  const AddLoanScreen({super.key});

  @override
  State<AddLoanScreen> createState() => _AddLoanScreenState();
}

class _AddLoanScreenState extends State<AddLoanScreen> {
  bool isDifferentiated = false;
  Periodicity selectedPeriodicity = Periodicity.monthly;

  void _onDifferentiatedSelected() {
    setState(() {
      isDifferentiated = true;
      _calculateDifferentiatedFormula();
    });
  }

  void _onAnnuitantSelected() {
    setState(() {
      isDifferentiated = false;
      _calculateAnnuitantFormula();
    });
  }


  void _calculateDifferentiatedFormula() {}

  void _calculateAnnuitantFormula() {}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteF1F3F6,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: ()=> Navigator.of(context).pop(),
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h),
                AddSwitcher(
                  selected: !isDifferentiated,
                  onAnnuitant: _onAnnuitantSelected,
                  onDifferentiated: _onDifferentiatedSelected,
                ),
                SizedBox(height: 24.h),
                Text(
                  'Loan title',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    color: AppColors.black333333.withOpacity(0.5),
                  ),
                ),
                SizedBox(height: 5.h),
                CustomTextField(
                  hintText: 'Write here',
                ),
                SizedBox(height: 24.h),
                Text(
                  'Loan amount',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    color: AppColors.black333333.withOpacity(0.5),
                  ),
                ),
                SizedBox(height: 5.h),
                CustomTextField(
                  hintText: '\$ 0',
                  hasIcon: true,
                  isNumeric: true,
                ),
                SizedBox(height: 24.h),
                Text(
                  'Date of first payment',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    color: AppColors.black333333.withOpacity(0.5),
                  ),
                ),
                SizedBox(height: 5.h),
                CustomTextField(
                  hintText: 'dd.mm.yyyy',
                  isDateField: true,
                ),
                SizedBox(height: 24.h),
                Row(
                  children: [
                    Expanded(
                      child: Column(
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
                          CustomTextField(
                            hintText: '0%',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 32.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              _showMenuDialog(context);
                            },
                            child: Row(
                              children: [
                                Text(
                                  'Term (in months)',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp,
                                    color: AppColors.blue3596FF,
                                  ),
                                ),
                                SizedBox(width: 4.w),
                                RotatedBox(
                                  quarterTurns: 1,
                                  child: SvgPicture.asset(
                                    'assets/icons/arrow_right.svg',
                                    fit: BoxFit.contain,
                                    width: 18.w,
                                    height: 18.h,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 5.h),
                          CustomTextField(
                            hintText: '0%',
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 24.h),
                Text(
                  'Loan repayment periodicity',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    color: AppColors.black333333.withOpacity(0.5),
                  ),
                ),
                SizedBox(height: 10.h),
              PeriodicitySwitcher(
                selectedPeriodicity: selectedPeriodicity,
                onMonthly: () {
                  setState(() {
                    selectedPeriodicity = Periodicity.monthly;
                  });
                },
                onQuarterly: () {
                  setState(() {
                    selectedPeriodicity = Periodicity.quarterly;
                  });
                },
                onAnnually: () {
                  setState(() {
                    selectedPeriodicity = Periodicity.annually;
                  });
                },
              ),
                SizedBox(height: 46.h),
                PeriodicityWidget(
                  onScheduleTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PaymentScheduleScreen(),
                      ),
                    );
                  },
                ),
                SizedBox(height: 100.h),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: GestureDetector(
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          height: 60.h,
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
    );
  }

  Future<void> _showMenuDialog(BuildContext context) async {
    return showModalBottomSheet<void>(
      context: context,
      barrierColor: AppColors.black.withOpacity(0.5),
      backgroundColor: Colors.transparent,
      builder: (BuildContext cont) {
        return TermChoiceDialog();
      },
    );
  }
}