import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircularProgressWidget extends StatelessWidget {
  final double percent; // 0.0 to 1.0
  final double size;
  final Color progressColor;
  final Color backgroundColor;
  final double strokeWidth;

  const CircularProgressWidget({
    super.key,
    required this.percent,
    this.size = 80,
    this.progressColor = Colors.white,
    this.backgroundColor = const Color(0x33FFFFFF),
    this.strokeWidth = 7,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.w,
      height: size.w,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: size.w,
            height: size.w,
            child: CircularProgressIndicator(
              value: percent,
              strokeWidth: strokeWidth,
              backgroundColor: backgroundColor,
              valueColor: AlwaysStoppedAnimation<Color>(progressColor),
              strokeCap: StrokeCap.round,
            ),
          ),
          Text(
            '${(percent * 100).toInt()}%',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
              color: progressColor,
            ),
          ),
        ],
      ),
    );
  }
}
