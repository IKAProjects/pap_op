import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pap_op/resources/app_colors.dart';

enum Periodicity { monthly, quarterly, annually }

class PeriodicitySwitcher extends StatelessWidget {
  final Periodicity selectedPeriodicity;
  final VoidCallback onMonthly;
  final VoidCallback onQuarterly;
  final VoidCallback onAnnually;

  const PeriodicitySwitcher({
    super.key,
    required this.selectedPeriodicity,
    required this.onMonthly,
    required this.onQuarterly,
    required this.onAnnually,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: AppColors.gray767680.withOpacity(0.12),
      ),
      child: Row(
        children: [
          _buildButton(
            selected: selectedPeriodicity == Periodicity.monthly,
            onTap: onMonthly,
            text: 'Monthly',
          ),
          _buildButton(
            selected: selectedPeriodicity == Periodicity.quarterly,
            onTap: onQuarterly,
            text: 'Quarterly',
          ),
          _buildButton(
            selected: selectedPeriodicity == Periodicity.annually,
            onTap: onAnnually,
            text: 'Annually',
          ),
        ],
      ),
    );
  }

  Widget _buildButton({
    required bool selected,
    required VoidCallback onTap,
    required String text,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 28.h,
        width: 112.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: !selected ? Colors.transparent : AppColors.white,
          border: selected
              ? Border.all(
            color: AppColors.black.withOpacity(0.04),
            width: 0.5,
          )
              : null,
          boxShadow: !selected
              ? null
              : [
            BoxShadow(
              offset: const Offset(0, 3),
              blurRadius: 1,
              spreadRadius: 0,
              color: AppColors.black.withOpacity(0.04),
            ),
            BoxShadow(
              offset: const Offset(0, 3),
              blurRadius: 8,
              spreadRadius: 0,
              color: AppColors.black.withOpacity(0.12),
            ),
          ],
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.w600,
            color:
            selected ? AppColors.black : AppColors.black.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}