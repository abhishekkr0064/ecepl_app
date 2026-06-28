import 'package:ecepl_app/Config/Color/app_color.dart';
import 'package:ecepl_app/Config/Widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBackButton extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const AppBackButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.primaryColor,
      elevation: 0,
      titleSpacing: 0,
      leadingWidth: 40,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new, color: AppColor.whiteColor),
        onPressed: () => Navigator.maybePop(context),
      ),
      title: AppText(
        title: title,
        fontweight: FontWeight.w700,
        fontsize: 16.sp,
        color: AppColor.whiteColor,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
