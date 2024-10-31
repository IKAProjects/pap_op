import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pap_op/resources/app_colors.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.hasIcon = false,
    this.isNumeric = false,
    this.isDateField = false,
  });

  final String hintText;
  final TextEditingController? controller;
  final bool hasIcon;
  final bool isNumeric;
  final bool isDateField;

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late TextEditingController _controller;
  bool showIcon = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _controller.addListener(_handleTextChange);
  }

  void _handleTextChange() {
    setState(() {
      showIcon = _controller.text.isNotEmpty;
    });
  }

  Future<void> _showDatePicker(BuildContext context) async {
    DateTime initialDate = DateTime.now();

    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext cont) => CupertinoActionSheet(
        actions: [
          Column(
            children: [
              SizedBox(
                height: 200.h,
                child: CupertinoDatePicker(
                  initialDateTime: initialDate,
                  mode: CupertinoDatePickerMode.date,
                  onDateTimeChanged: (DateTime date) {
                    setState(() {
                      _controller.text = '${date.day}.${date.month}.${date.year}';
                    });
                  },
                ),
              ),
              CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.of(cont).pop();
                },
                child: Text(
                  'Confirm',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () {
            Navigator.of(cont).pop();
          },
          child: Text(
            'Cancel',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 17.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.removeListener(_handleTextChange);
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.isDateField ? () => _showDatePicker(context) : null,
      child: AbsorbPointer(
        absorbing: widget.isDateField,
        child: TextField(
          controller: _controller,
          keyboardType: widget.isNumeric ? TextInputType.number : TextInputType.text,
          inputFormatters: widget.isNumeric ? [FilteringTextInputFormatter.digitsOnly] : [],
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20.sp,
            color: AppColors.black333333,
          ),
          cursorColor: AppColors.blue3596FF,
          decoration: InputDecoration(
            prefix: showIcon && widget.hasIcon
                ? Text(
              '\$',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.black333333,
              ),
            )
                : null,
            hintText: widget.hintText,
            hintStyle: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20.sp,
              color: AppColors.black333333.withOpacity(0.5),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.black333333.withOpacity(0.2)),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.black333333.withOpacity(0.2)),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.black333333.withOpacity(0.2)),
            ),
          ),
        ),
      ),
    );
  }
}