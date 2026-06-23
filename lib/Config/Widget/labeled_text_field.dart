import 'package:ecepl_app/Config/Color/app_color.dart';
import 'package:ecepl_app/Config/Widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppInputField extends StatefulWidget {
  final String? title;
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final double left;
  final double textleft;
  final double right;
  final double vertical;
  final double radius;
  final int? maxLength;
  final bool visibleHintText;
  final bool? enabled;
  final bool readOnly;

  const AppInputField({
    super.key,
    this.title,
    required this.hintText,
    required this.controller,
    this.validator,
    this.inputFormatters,
    this.maxLength = 20,
    required this.left,
    required this.textleft,
    required this.right,
    required this.vertical,
    required this.radius,
    this.visibleHintText = true,
    this.enabled = true,
    this.readOnly = false,
  });

  @override
  State<AppInputField> createState() => _AppInputFieldState();
}

class _AppInputFieldState extends State<AppInputField> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Label
          if (widget.title != null)
            AppText(
              latterspace: 0,
              color: AppColor.blackColor,
              textAlign: TextAlign.left,
              title: widget.title!,
              fontfemly: "Roboto",
              fontweight: FontWeight.w500,
              fontsize: 14.sp,
              left: widget.textleft,
              right: widget.right,
              top: 0,
              bottom: 0,
            ),

          SizedBox(height: 6.h),

          /// TextField
          TextFormField(
            readOnly: widget.readOnly,
            controller: widget.controller,
            maxLength: widget.maxLength,
            inputFormatters: widget.inputFormatters,
            validator: widget.validator,
            enabled: widget.enabled,
            style: TextStyle(
              fontFamily: "Roboto",
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: AppColor.blackColor,
            ),
            decoration: InputDecoration(
              counterText: "",
              hintText: widget.visibleHintText ? widget.hintText : null,
              hintStyle: TextStyle(
                fontFamily: "Roboto",
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColor.blackColor.withValues(alpha: 0.6),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.radius.r),
                borderSide: BorderSide(
                  color: AppColor.blackColor.withValues(alpha: 0.8),
                  width: 1.w,
                ),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: widget.left.w,
                vertical: widget.vertical.h,
              ),
              errorStyle: TextStyle(color: Colors.red, fontSize: 12.sp),
            ),
          ),
        ],
      ),
    );
  }
}
