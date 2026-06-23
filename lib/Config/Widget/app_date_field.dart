import 'package:ecepl_app/Config/Color/app_color.dart';
import 'package:ecepl_app/Config/Widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class AppDateField extends FormField<String> {
  AppDateField({
    super.key,
    required BuildContext context,
    required TextEditingController controller,
    required String label,
    super.validator,
  }) : super(
         initialValue: controller.text,
         builder: (state) {
           // Keep FormField value in sync with controller
           if (state.value != controller.text) {
             WidgetsBinding.instance.addPostFrameCallback((_) {
               state.didChange(controller.text);
             });
           }

           Future<void> pickDate() async {
             DateTime? pickedDate = await showDatePicker(
               context: context,
               initialDate: DateTime.now(),
               firstDate: DateTime(2000),
               lastDate: DateTime(2100),
             );

             if (pickedDate != null) {
               controller.text = DateFormat('dd-MM-yyyy').format(pickedDate);

               state.didChange(controller.text);
             }
           }

           return Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Padding(
                 padding: const EdgeInsets.only(left: 10, bottom: 5),
                 child: AppText(
                   title: label,
                   fontweight: FontWeight.w500,
                   fontsize: 14.sp,
                   color: AppColor.blackColor,
                 ),
               ),

               GestureDetector(
                 onTap: pickDate,
                 child: AbsorbPointer(
                   child: TextField(
                     controller: controller,
                     decoration: InputDecoration(
                       contentPadding: const EdgeInsets.symmetric(
                         horizontal: 12,
                         vertical: 10,
                       ),
                       hintText: "dd-mm-yyyy",
                       border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(6.r),
                       ),
                       errorText: state.errorText,
                       suffixIcon: const Icon(Icons.date_range),
                     ),
                   ),
                 ),
               ),
             ],
           );
         },
       );
}
