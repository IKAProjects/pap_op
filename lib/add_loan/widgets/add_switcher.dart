import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pap_op/resources/app_colors.dart';

class AddSwitcher extends StatelessWidget {
  final bool selected;
  final VoidCallback onAnnuitant;
  final VoidCallback onDifferentiated;

  const AddSwitcher({
    super.key,
    required this.selected,
    required this.onAnnuitant,
    required this.onDifferentiated,
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
            selected: selected,
            onTap: onAnnuitant,
            text: 'Annuitant',
          ),
          _buildButton(
            selected: !selected,
            onTap: onDifferentiated,
            text: 'Differentiated',
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
        width: 168.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: !selected ? Colors.transparent : AppColors.white,
          border: selected ?Border.all(
            color: AppColors.black.withOpacity(0.04),
            width: 0.5,
          ):null,
          boxShadow: !selected ? null:[
            BoxShadow(
              offset: const Offset(0, 3),
              blurRadius: 1,
              spreadRadius: 0,
              color: AppColors.black.withOpacity(0.04),
            ), BoxShadow(
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
