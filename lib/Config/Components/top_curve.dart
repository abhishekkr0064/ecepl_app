import 'package:flutter/material.dart';

class TopCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    // left side
    path.lineTo(0, size.height - 59);

    // big smooth curve (🔥 deeper)
    path.quadraticBezierTo(
      size.width / 2,
      size.height + 10, // 👈 push down for more curve
      size.width,
      size.height - 59,
    );

    // right side up
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
