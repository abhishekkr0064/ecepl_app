import 'package:ecepl_app/Views/Dashboard/Widgets/circular_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final String buttonLabel;
  final double progress; // 0.0 to 1.0
  final Color cardColor;
  final VoidCallback? onButtonTap;
  final VoidCallback? onMoreTap;

  const TaskCard({
    super.key,
    this.title = 'Your today\'s task\nalmost done!',
    this.buttonLabel = 'View Task',
    this.progress = 0.85,
    this.cardColor = const Color(0xFF3730A3),
    this.onButtonTap,
    this.onMoreTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Three dots
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: onMoreTap,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Icon(
                        Icons.more_horiz,
                        color: Colors.white,
                        size: 18.sp,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    height: 1.4,
                  ),
                ),
                SizedBox(height: 16.h),
                ElevatedButton(
                  onPressed: onButtonTap,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: cardColor,
                    padding: EdgeInsets.symmetric(
                      horizontal: 22.w,
                      vertical: 10.h,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    buttonLabel,
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 16.w),
          // Right: circular progress
          Padding(
            padding: EdgeInsets.only(top: 16.h),
            child: CircularProgressWidget(percent: progress),
          ),
        ],
      ),
    );
  }
}
