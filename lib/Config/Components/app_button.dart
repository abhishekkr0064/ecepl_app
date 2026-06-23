import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Config/Color/app_color.dart';

class AppButton extends StatelessWidget {
  final double horizontal;
  final double vertical;
  final double height;
  final String tittle;
  final Color bgcolor;
  final Color fontcolor;
  final double fontsize;
  final double borderradius;
  final FontWeight fontweight;
  final VoidCallback? ontap;
  final double width;
  const AppButton({
    super.key,
    this.height = 56,
    this.horizontal = 45,
    this.vertical = 0,
    this.tittle = "Create New Account",
    this.fontsize = 19,
    this.fontcolor = AppColor.whiteColor,
    this.bgcolor = AppColor.primarycolor,
    this.borderradius = 15,
    this.ontap,
    this.fontweight = FontWeight.w500,
    this.width = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: horizontal.w,
        right: horizontal.w,
        top: vertical.h,
        bottom: 0,
      ),
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          height: height.h,
          decoration: BoxDecoration(
            color: bgcolor,
            borderRadius: BorderRadius.circular(borderradius),
          ),
          child: Center(
            child: Text(
              tittle.toString(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: fontweight,
                fontFamily: "Roboto",
                fontSize: fontsize,
                color: fontcolor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
