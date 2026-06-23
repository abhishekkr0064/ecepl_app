import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../App_assets/app_assets.dart';

// class AppImage extends StatelessWidget {
//   final double height;
//   final double width;
//   final double top;
//   final double bottom;
//   final double left;
//   final double right;
//   final String path;
//   const AppImage({
//     super.key,
//     this.height = 120,
//     this.width = 124,
//     this.top = 160,
//     this.left = 0,
//     this.right = 0,
//     this.bottom = 0,
//     this.path = AppAssets.lockIcon,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(
//         top: top,
//         bottom: bottom,
//         left: left,
//         right: right,
//       ),
//       child: Center(
//         child: SizedBox(
//           height: height.h,
//           width: width.w,
//           child: Image.asset(path.toString()),
//         ),
//       ),
//     );
//   }
// }
class AppImage extends StatelessWidget {
  final double height;
  final double width;
  final double top;
  final double bottom;
  final double left;
  final double right;
  final String path;
  final Alignment alignment;

  const AppImage({
    super.key,
    this.height = 120,
    this.width = 124,
    this.top = 0,
    this.left = 0,
    this.right = 0,
    this.bottom = 0,
    this.path = AppAssets.lockIcon,
    this.alignment = Alignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: top,
        bottom: bottom,
        left: left,
        right: right,
      ),
      child: Align(
        alignment: alignment,
        child: SizedBox(
          height: height.h,
          width: width.w,
          child: Image.asset(path),
        ),
      ),
    );
  }
}
