import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// A single row action (view / edit / delete / anything else)
class AppRowAction {
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const AppRowAction({
    required this.icon,
    required this.color,
    required this.onTap,
  });

  /// Convenience factory for the common view/edit/delete trio.
  static List<AppRowAction> viewEditDelete({
    required VoidCallback onView,
    required VoidCallback onEdit,
    required VoidCallback onDelete,
  }) {
    return [
      AppRowAction(
        icon: Icons.remove_red_eye_outlined,
        color: const Color(0xFF3B82F6),
        onTap: onView,
      ),
      AppRowAction(
        icon: Icons.edit_outlined,
        color: const Color(0xFF10B981),
        onTap: onEdit,
      ),
      AppRowAction(
        icon: Icons.delete_outline,
        color: const Color(0xFFEF4444),
        onTap: onDelete,
      ),
    ];
  }
}

class AppActionButtons extends StatelessWidget {
  final List<AppRowAction> actions;

  const AppActionButtons({super.key, required this.actions});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 0; i < actions.length; i++) ...[
          if (i != 0) SizedBox(width: 6.w),
          _AppActionIcon(action: actions[i]),
        ],
      ],
    );
  }
}

class _AppActionIcon extends StatelessWidget {
  final AppRowAction action;

  const _AppActionIcon({required this.action});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action.onTap,
      child: Container(
        width: 30.w,
        height: 30.w,
        decoration: BoxDecoration(
          color: action.color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Icon(action.icon, color: action.color, size: 16.sp),
      ),
    );
  }
}
