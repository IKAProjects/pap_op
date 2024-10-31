import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TermChoiceDialog extends StatelessWidget {
  const TermChoiceDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 154.h,
          width: 359.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.82),
            borderRadius: BorderRadius.circular(14.r),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Type of loan term',
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF3D3D3D).withOpacity(0.5),
                ),
              ),
              SizedBox(height: 14.h),
              Divider(
                color: const Color(0xFF3C3C43).withOpacity(0.36),
                height: 0.5,
              ),
              SizedBox(height: 12.h),
              GestureDetector(
                onTap: () {},
                child: Text(
                  "Months",
                  style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF007AFF),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 14.h),
              Divider(
                color: const Color(0xFF3C3C43).withOpacity(0.36),
                height: 0.5,
              ),
              SizedBox(height: 14.h),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'Years',
                  style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF007AFF),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

            ],
          ),
        ),
        SizedBox(height: 6.h),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 8.w),
            alignment: Alignment.center,
            height: 56.h,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.82),
              borderRadius: BorderRadius.circular(14.r),
            ),
            child: Text(
              'Cancel',
              style: TextStyle(
                color: const Color(0xFF007AFF),
                fontSize: 17.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        SizedBox(height: 30.h),
      ],
    );
  }
}
