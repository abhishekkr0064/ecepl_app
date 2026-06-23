import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BulletItem {
  final String title;
  final String description;

  BulletItem({required this.title, required this.description});
}

// class InformationDialog extends StatelessWidget {
//   final String headTitle;

//   final String heading;
//   final String introText;

//   final String section1Title;
//   final String section1Description;

//   final String section2Title;
//   final List<BulletItem> section2Bullets;

//   final String section3Title;
//   final String section3Description1;
//   final String section3Description2;
//   final String section3Description3;

//   final String footerText;

//   const InformationDialog({
//     super.key,
//     required this.heading,
//     required this.introText,
//     required this.section1Title,
//     required this.section1Description,
//     required this.section2Title,
//     required this.section2Bullets,
//     required this.section3Title,
//     required this.section3Description1,
//     required this.section3Description2,
//     required this.section3Description3,
//     required this.footerText,
//     required this.headTitle,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       backgroundColor: Colors.white,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.r)),
//       child: ConstrainedBox(
//         constraints: BoxConstraints(
//           maxHeight: MediaQuery.of(context).size.height * 0.85,
//           maxWidth: MediaQuery.of(context).size.width * 0.9,
//         ),
//         child: Padding(
//           padding: EdgeInsets.all(16.w),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               /// 🟦 HEAD TITLE (CENTER)
//               Align(
//                 alignment: Alignment.center,
//                 child: Text(
//                   headTitle,
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 16.sp,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               SizedBox(height: 5.h),

//               /// 🟦 MAIN HEADING
//               Text(
//                 heading,
//                 style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
//               ),

//               // SizedBox(height: 8.h),

//               /// INTRO TEXT
//               Text(introText, style: TextStyle(fontSize: 12.sp, height: 1.5)),

//               // SizedBox(height: 14.h),

//               /// 🔹 SECTION 1
//               _sectionTitle(section1Title),
//               if (section1Description.isNotEmpty)
//                 _sectionText(section1Description),

//               // SizedBox(height: 10.h),

//               /// 🔹 SECTION 2 (BULLET LIST)
//               if (section2Title.isNotEmpty) _sectionTitle(section2Title),
//               ...section2Bullets.map(_bulletItem),

//               // SizedBox(height: 10.h),

//               /// 🔹 SECTION 3
//               _sectionTitle(section3Title),
//               _bulletText(section3Description1),
//               _bulletText(section3Description2),
//               _bulletText(section3Description3),

//               // SizedBox(height: 14.h),

//               /// 🔻 FOOTER
//               Text(
//                 footerText,
//                 style: TextStyle(
//                   fontSize: 14.sp,
//                   fontWeight: FontWeight.bold,
//                   // height: 1.4,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   /// SECTION TITLE
//   Widget _sectionTitle(String text) {
//     return Padding(
//       padding: EdgeInsets.only(bottom: 4.h),
//       child: Text(
//         text,
//         style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w700),
//       ),
//     );
//   }

//   /// SECTION TEXT
//   Widget _sectionText(String text) {
//     return Text(text, style: TextStyle(fontSize: 12.sp, height: 1.5));
//   }

//   /// BULLET ITEM WITH TextSpan
//   Widget _bulletItem(BulletItem item) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text("•  ", style: TextStyle(fontSize: 14.sp)),
//         Expanded(
//           child: RichText(
//             text: TextSpan(
//               style: TextStyle(
//                 fontSize: 12.sp,
//                 color: Colors.black,
//                 height: 1.5,
//               ),
//               children: [
//                 TextSpan(
//                   text: "${item.title}: ",
//                   style: const TextStyle(fontWeight: FontWeight.w700),
//                 ),
//                 TextSpan(text: item.description),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   /// BULLET TEXT (for section 3)
//   Widget _bulletText(String text) {
//     if (text.isEmpty) return const SizedBox.shrink();

//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text("•  ", style: TextStyle(fontSize: 14.sp, height: 1.4)),
//         Expanded(
//           child: Text(text, style: TextStyle(fontSize: 12.sp, height: 1.5)),
//         ),
//       ],
//     );
//   }
// }
class InformationDialog extends StatelessWidget {
  /// REQUIRED
  final String headTitle;
  final String footerText;

  /// OPTIONAL
  final String? heading;
  final String? introText;

  final String? section1Title;
  final String? section1Description;

  final String? section2Title;
  final List<BulletItem>? section2Bullets;

  final String? section3Title;
  final String? section3Description1;
  final String? section3Description2;
  final String? section3Description3;

  const InformationDialog({
    super.key,
    required this.headTitle,
    required this.footerText,
    this.heading,
    this.introText,
    this.section1Title,
    this.section1Description,
    this.section2Title,
    this.section2Bullets,
    this.section3Title,
    this.section3Description1,
    this.section3Description2,
    this.section3Description3,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.r)),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.85,
          maxWidth: MediaQuery.of(context).size.width * 0.9,
        ),
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// 🔹 HEAD TITLE (REQUIRED)
              Align(
                alignment: Alignment.center,
                child: Text(
                  headTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              if (heading != null) ...[
                SizedBox(height: 6.h),
                Text(
                  heading!,
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],

              if (introText != null) ...[
                SizedBox(height: 4.h),
                Text(
                  introText!,
                  style: TextStyle(fontSize: 12.sp, height: 1.5),
                ),
              ],

              /// 🔹 SECTION 1
              if (section1Title != null) ...[
                // SizedBox(height: 8.h),
                _sectionTitle(section1Title!),
                if (section1Description != null)
                  _sectionText(section1Description!),
              ],

              /// 🔹 SECTION 2
              if (section2Title != null &&
                  section2Bullets != null &&
                  section2Bullets!.isNotEmpty) ...[
                // SizedBox(height: 8.h),
                // _sectionTitle(section2Title!),
                ...section2Bullets!.map(_bulletItem),
              ],

              /// 🔹 SECTION 3
              if (section3Title != null) ...[
                // SizedBox(height: 8.h),
                _sectionTitle(section3Title!),
                _bulletText(section3Description1),
                _bulletText(section3Description2),
                _bulletText(section3Description3),
              ],

              // SizedBox(height: 10.h),

              /// 🔹 FOOTER (REQUIRED)
              Text(
                footerText,
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// SECTION TITLE
  Widget _sectionTitle(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w700),
    );
  }

  /// SECTION TEXT
  Widget _sectionText(String text) {
    return Text(text, style: TextStyle(fontSize: 12.sp, height: 1.5));
  }

  /// BULLET ITEM (TITLE + DESCRIPTION)
  Widget _bulletItem(BulletItem item) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("•  ", style: TextStyle(fontSize: 14.sp)),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.black,
                height: 1.5,
              ),
              children: [
                TextSpan(
                  text: "${item.title}: ",
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
                TextSpan(text: item.description),
              ],
            ),
          ),
        ),
      ],
    );
  }

  /// BULLET TEXT (SECTION 3)
  Widget _bulletText(String? text) {
    if (text == null || text.isEmpty) {
      return const SizedBox.shrink();
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("•  ", style: TextStyle(fontSize: 14.sp)),
        Expanded(
          child: Text(text, style: TextStyle(fontSize: 12.sp, height: 1.5)),
        ),
      ],
    );
  }
}
