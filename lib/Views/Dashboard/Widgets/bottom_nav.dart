import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavItem {
  final IconData icon;
  final String label; // ✅ label required for all items

  const BottomNavItem({required this.icon, required this.label});
}

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final List<BottomNavItem> items;
  final Color activeColor;
  final Color backgroundColor;
  final ValueChanged<int> onIndexSelected;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.items,
    required this.onIndexSelected,
    this.activeColor = const Color(0xFF3730A3),
    this.backgroundColor = const Color(0xFFF4F5F9),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(items.length, (index) {
          final item = items[index];
          final isActive = index == currentIndex;

          return GestureDetector(
            onTap: () => onIndexSelected(index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              padding: EdgeInsets.symmetric(
                horizontal: isActive ? 18.w : 10.w,
                vertical: 10.h,
              ),
              decoration: BoxDecoration(
                color: isActive ? activeColor : Colors.transparent,
                borderRadius: BorderRadius.circular(25.r),
              ),
              child: Row(
                children: [
                  Icon(
                    item.icon,
                    color: isActive ? Colors.white : Colors.black54,
                    size: 22.sp,
                  ),
                  // ✅ Animate label in/out smoothly
                  AnimatedSize(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    child: isActive
                        ? Row(
                            children: [
                              SizedBox(width: 6.w),
                              Text(
                                item.label,
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )
                        : const SizedBox.shrink(),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
