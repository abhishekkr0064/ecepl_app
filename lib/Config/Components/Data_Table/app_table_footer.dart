import 'package:ecepl_app/Config/Color/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTableFooter extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final int totalEntries;
  final int perPage;
  final VoidCallback? onPrev;
  final VoidCallback? onNext;
  final ValueChanged<int> onPageTap;

  const AppTableFooter({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.totalEntries,
    required this.perPage,
    required this.onPrev,
    required this.onNext,
    required this.onPageTap,
  });

  int get _start => totalEntries == 0 ? 0 : (currentPage - 1) * perPage + 1;
  int get _end => (currentPage * perPage).clamp(0, totalEntries);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Showing $_start–$_end of $totalEntries',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 11.sp,
            color: AppColor.primaryColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        Row(
          children: [
            _AppPageButton(
              icon: Icons.chevron_left,
              onTap: onPrev,
              enabled: onPrev != null,
            ),
            SizedBox(width: 6.w),
            ..._buildPageNumbers(),
            SizedBox(width: 6.w),
            _AppPageButton(
              icon: Icons.chevron_right,
              onTap: onNext,
              enabled: onNext != null,
            ),
          ],
        ),
      ],
    );
  }

  List<Widget> _buildPageNumbers() {
    return List.generate(totalPages, (i) {
      final page = i + 1;
      final isActive = page == currentPage;
      return GestureDetector(
        onTap: () => onPageTap(page),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: EdgeInsets.symmetric(horizontal: 3.w),
          width: 30.w,
          height: 30.w,
          decoration: BoxDecoration(
            color: isActive ? AppColor.primaryColor : AppColor.whiteColor,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(
              color: isActive ? AppColor.primaryColor : Colors.grey.shade300,
            ),
          ),
          child: Center(
            child: Text(
              '$page',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: isActive ? Colors.white : Colors.grey,
              ),
            ),
          ),
        ),
      );
    });
  }
}

class _AppPageButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;
  final bool enabled;

  const _AppPageButton({
    required this.icon,
    required this.onTap,
    required this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 30.w,
        height: 30.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Icon(
          icon,
          size: 18.sp,
          color: enabled ? const Color(0xFF1A1A2E) : Colors.grey.shade300,
        ),
      ),
    );
  }
}
