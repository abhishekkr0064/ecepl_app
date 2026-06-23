import 'package:flutter/material.dart';

enum SnackPosition { top, bottom }

class AppSnackBar {
  static void show({
    required BuildContext context,
    required String title,
    required String message,
    IconData icon = Icons.info,
    Color backgroundColor = const Color(0xFFE3F2FD),
    Color borderColor = const Color(0xFF2196F3),
    Color textColor = Colors.black,
    Color iconColor = Colors.blue,
    Duration duration = const Duration(seconds: 3),
    SnackPosition position = SnackPosition.top,
  }) {
    final overlay = Overlay.of(context);
    late OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: position == SnackPosition.top ? 50 : null,
        bottom: position == SnackPosition.bottom ? 50 : null,
        left: 16,
        right: 16,
        child: Material(
          color: Colors.transparent,
          child: _AnimatedSnackBar(
            title: title,
            message: message,
            icon: icon,
            backgroundColor: backgroundColor,
            borderColor: borderColor,
            textColor: textColor,
            iconColor: iconColor,
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);

    Future.delayed(duration, () {
      overlayEntry.remove();
    });
  }
}

class _AnimatedSnackBar extends StatefulWidget {
  final String title;
  final String message;
  final IconData icon;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final Color iconColor;

  const _AnimatedSnackBar({
    required this.title,
    required this.message,
    required this.icon,
    required this.backgroundColor,
    required this.borderColor,
    required this.textColor,
    required this.iconColor,
  });

  @override
  State<_AnimatedSnackBar> createState() => _AnimatedSnackBarState();
}

class _AnimatedSnackBarState extends State<_AnimatedSnackBar>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> slideAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    slideAnimation = Tween(
      begin: const Offset(0, -1),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: slideAnimation,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: widget.borderColor, width: 1.2),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(widget.icon, color: widget.iconColor, size: 24),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: widget.textColor,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.message,
                    style: TextStyle(fontSize: 13, color: widget.textColor),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
