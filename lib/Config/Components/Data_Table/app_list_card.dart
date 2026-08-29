import 'package:ecepl_app/Config/Components/Data_Table/app_action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppCardColumn {
  final int flex;
  final CrossAxisAlignment crossAxisAlignment;
  final List<Widget> children;

  const AppCardColumn({
    this.flex = 1,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    required this.children,
  });
}

/// Common text styles so every card doesn't redefine TextStyle inline.
class AppCardTextStyles {
  static TextStyle title() => TextStyle(
    fontFamily: 'Roboto',
    fontSize: 13.sp,
    fontWeight: FontWeight.w700,
    color: const Color(0xFF1A1A2E),
  );

  static TextStyle subtitle() =>
      TextStyle(fontFamily: 'Roboto', fontSize: 11.sp, color: Colors.grey);

  static TextStyle body() => TextStyle(
    fontFamily: 'Roboto',
    fontSize: 12.sp,
    color: const Color(0xFF1A1A2E),
  );
}

class AppListCard extends StatelessWidget {
  final List<AppCardColumn> columns;
  final Widget? trailingTop;
  final List<AppRowAction>? actions;

  const AppListCard({
    super.key,
    required this.columns,
    this.trailingTop,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (final col in columns)
            Expanded(
              flex: col.flex,
              child: Column(
                crossAxisAlignment: col.crossAxisAlignment,
                children: col.children,
              ),
            ),
          if (trailingTop != null || actions != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if (trailingTop != null) trailingTop!,
                if (trailingTop != null && actions != null)
                  SizedBox(height: 8.h),
                if (actions != null) AppActionButtons(actions: actions!),
              ],
            ),
        ],
      ),
    );
  }
}
