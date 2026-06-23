import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppText extends StatelessWidget {
  final String title;
  final double? left;
  final double? latterspace;
  final double? right;
  final double? top;
  final double? bottom;
  final Color color;
  final String? fontfemly;
  final FontWeight fontweight;
  final double fontsize;
  final VoidCallback? ontap;
  final TextAlign? textAlign;
  final TextDecoration? decoration;
  final Color? underlineColor;
  final double? lineHeight;

  const AppText({
    super.key,
    required this.title,
    this.fontfemly = "Roboto",
    required this.fontweight,
    required this.fontsize,
    this.ontap,
    this.left,
    this.right,
    this.top,
    this.bottom,
    this.textAlign,
    required this.color,
    this.latterspace,
    this.decoration,
    this.underlineColor,
    this.lineHeight,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Padding(
        padding: EdgeInsets.only(
          top: (top ?? 0).h,
          bottom: (bottom ?? 0).h,
          left: (left ?? 0).w,
          right: (right ?? 0).w,
        ),
        child: Text(
          title.toString(),
          textAlign: textAlign,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            height: lineHeight,
            fontFamily: fontfemly,
            fontSize: fontsize.sp,
            letterSpacing: latterspace,
            color: color,
            fontWeight: fontweight,
            decoration: decoration,
            decorationColor: underlineColor ?? color,
            decorationThickness: 2,
          ),
        ),
      ),
    );
  }
}
