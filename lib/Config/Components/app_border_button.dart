import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Config/Color/app_color.dart';

class AppBorderButton extends StatelessWidget {
  final double horizontal;
  final double vertical;
  final double height;
  final String tittle;
  final Color bordercolor;
  final Color fontcolor;
  final double fontsize;
  final double borderradius;
  final FontWeight fontweight;
  final VoidCallback? ontap;

  const AppBorderButton({
    super.key,
    this.height = 56,
    this.horizontal = 45,
    this.vertical = 0,
    this.tittle = "Log in",
    this.fontsize = 19,
    this.fontcolor = AppColor.primaryColor,
    this.bordercolor = AppColor.primaryColor,
    this.borderradius = 6,
    this.ontap,
    this.fontweight = FontWeight.w500,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: horizontal.w,
        right: horizontal.w,
        top: vertical.h,
      ),
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          height: height.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: bordercolor),
            borderRadius: BorderRadius.circular(borderradius.r),
          ),
          child: Text(
            tittle,
            style: TextStyle(
              fontSize: fontsize.sp,
              color: fontcolor,
              fontWeight: fontweight,
            ),
          ),
        ),
      ),
    );
  }
}
