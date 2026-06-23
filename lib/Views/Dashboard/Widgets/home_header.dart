import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeHeader extends StatelessWidget {
  final String userName;
  final String avatarPath;
  final VoidCallback? onBellTap;
  final bool hasNotification;

  const HomeHeader({
    super.key,
    required this.userName,
    required this.avatarPath,
    this.onBellTap,
    this.hasNotification = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
      child: Row(
        children: [
          CircleAvatar(radius: 22.r, backgroundImage: AssetImage(avatarPath)),
          SizedBox(width: 12.w),
          Text(
            'Hi, $userName',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 17.sp,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: onBellTap,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(
                  Icons.notifications_outlined,
                  color: Colors.white,
                  size: 26.sp,
                ),
                if (hasNotification)
                  Positioned(
                    top: -4,
                    right: -4,
                    child: Container(
                      width: 10.w,
                      height: 10.h,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
