// import 'package:flutter/material.dart';
// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class AppDropdown extends StatefulWidget {
//   final String label;
//   final String hint;
//   final List<String> items;
//   final ValueNotifier<String?> valueListenable;
//   final ValueChanged<String?> onChanged;

//   const AppDropdown({
//     super.key,
//     required this.label,
//     required this.hint,
//     required this.items,
//     required this.valueListenable,
//     required this.onChanged,
//   });

//   @override
//   State<AppDropdown> createState() => _AppDropdownState();
// }

// class _AppDropdownState extends State<AppDropdown> {
//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder<String?>(
//       valueListenable: widget.valueListenable,
//       builder: (context, value, child) {
//         return InputDecorator(
//           decoration: InputDecoration(
//             labelText: value != null ? widget.label : null,
//             hintText: value == null ? widget.hint : null,

//             floatingLabelBehavior: FloatingLabelBehavior.auto,

//             contentPadding: EdgeInsets.symmetric(
//               horizontal: 6.w,
//               vertical: 3.h,
//             ),

//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(12.r),
//             ),

//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(12),
//               borderSide: BorderSide(color: Colors.grey.shade400),
//             ),

//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(12),
//               borderSide: const BorderSide(color: Colors.deepPurple, width: 2),
//             ),

//             filled: true,
//             fillColor: Colors.white,
//           ),
//           child: DropdownButtonHideUnderline(
//             child: DropdownButton2<String>(
//               isExpanded: true,
//               valueListenable: widget.valueListenable,

//               hint: Text(
//                 widget.hint,
//                 style: TextStyle(color: Colors.grey.shade500),
//               ),

//               items: widget.items.map((item) {
//                 return DropdownItem<String>(
//                   value: item,
//                   child: Text(item, style: const TextStyle(fontSize: 15)),
//                 );
//               }).toList(),

//               onChanged: widget.onChanged,

//               iconStyleData: const IconStyleData(
//                 icon: Icon(Icons.keyboard_arrow_down_rounded),
//                 iconSize: 24,
//               ),

//               buttonStyleData: const ButtonStyleData(
//                 height: 50,
//                 padding: EdgeInsets.zero,
//               ),

//               dropdownStyleData: DropdownStyleData(
//                 maxHeight: 250,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 elevation: 6,
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
import 'package:dropdown_search/dropdown_search.dart';
import 'package:ecepl_app/Config/Color/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDropdownSearch<T> extends StatelessWidget {
  final String label;
  final String hint;
  final T? selectedItem;
  final List<T> items;
  final String Function(T) itemAsString;
  final ValueChanged<T?> onChanged;
  final Future<List<T>> Function(String filter)? asyncItems;
  final IconData? prefixIcon;
  final bool enabled;
  final String? Function(T?)? validator;

  const AppDropdownSearch({
    super.key,
    required this.label,
    required this.hint,
    required this.selectedItem,
    required this.items,
    required this.itemAsString,
    required this.onChanged,
    this.asyncItems,
    this.prefixIcon,
    this.enabled = true,
    this.validator,
  });

  static const String _fontFamily = 'Poppins';
  static const Color _borderIdle = Color(0xFFE3E3EA);
  static const Color _labelColor = Color(0xFF6B7280);

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<T>(
      selectedItem: selectedItem,
      enabled: enabled,

      items: (filter, infiniteScrollProps) async {
        if (asyncItems != null) {
          return await asyncItems!(filter);
        }
        return items;
      },

      itemAsString: itemAsString,
      compareFn: (a, b) => a == b,
      onSaved: onChanged,
      validator: validator,

      decoratorProps: DropDownDecoratorProps(
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          labelStyle: TextStyle(
            fontFamily: _fontFamily,
            color: _labelColor,
            fontSize: 13.sp,
            fontWeight: FontWeight.w500,
          ),
          hintStyle: TextStyle(
            fontFamily: _fontFamily,
            color: Colors.grey.shade400,
            fontSize: 14.sp,
          ),
          prefixIcon: prefixIcon != null
              ? Icon(prefixIcon, size: 20.sp, color: _labelColor)
              : null,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 14.w,
            vertical: 14.h,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14.r),
            borderSide: const BorderSide(color: _borderIdle),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14.r),
            borderSide: const BorderSide(color: _borderIdle),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14.r),
            borderSide: BorderSide(color: AppColor.primaryColor, width: 1.6),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14.r),
            borderSide: BorderSide(color: Colors.red.shade300, width: 1.2),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14.r),
            borderSide: BorderSide(color: Colors.red.shade400, width: 1.6),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14.r),
            borderSide: BorderSide(color: Colors.grey.shade200),
          ),
          filled: true,
          fillColor: enabled ? Colors.white : const Color(0xFFF5F5F7),
        ),
      ),

      suffixProps: DropdownSuffixProps(
        clearButtonProps: const ClearButtonProps(
          isVisible: true,
          icon: Icon(Icons.close_rounded, size: 18),
        ),
        dropdownButtonProps: DropdownButtonProps(
          color: _labelColor,
          iconSize: 24.sp,
        ),
      ),

      popupProps: PopupProps.menu(
        showSearchBox: true,
        fit: FlexFit.loose,
        constraints: BoxConstraints(maxHeight: 320.h),

        containerBuilder: (context, popupWidget) {
          return Container(
            margin: EdgeInsets.only(top: 6.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 24,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: popupWidget,
            ),
          );
        },

        searchFieldProps: TextFieldProps(
          autofocus: true,
          style: TextStyle(fontFamily: _fontFamily, fontSize: 14.sp),
          decoration: InputDecoration(
            hintText: "Search...",
            hintStyle: TextStyle(
              fontFamily: _fontFamily,
              color: Colors.grey.shade400,
              fontSize: 14.sp,
            ),
            prefixIcon: Icon(
              Icons.search_rounded,
              size: 20.sp,
              color: _labelColor,
            ),
            filled: true,
            fillColor: const Color(0xFFF7F7FA),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 14.w,
              vertical: 12.h,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: AppColor.primaryColor, width: 1.4),
            ),
          ),
        ),

        itemBuilder: (context, item, isDisabled, isSelected) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColor.primaryColor.withOpacity(0.08)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    itemAsString(item),
                    style: TextStyle(
                      fontFamily: _fontFamily,
                      fontSize: 14.sp,
                      color: isSelected
                          ? AppColor.primaryColor
                          : Colors.black87,
                      fontWeight: isSelected
                          ? FontWeight.w600
                          : FontWeight.w400,
                    ),
                  ),
                ),
                if (isSelected)
                  Icon(
                    Icons.check_rounded,
                    size: 18.sp,
                    color: AppColor.primaryColor,
                  ),
              ],
            ),
          );
        },

        loadingBuilder: (context, searchEntry) {
          return Padding(
            padding: EdgeInsets.all(24.w),
            child: Center(
              child: SizedBox(
                width: 24.w,
                height: 24.w,
                child: CircularProgressIndicator(
                  strokeWidth: 2.4,
                  color: AppColor.primaryColor,
                ),
              ),
            ),
          );
        },

        emptyBuilder: (context, searchEntry) {
          return Padding(
            padding: EdgeInsets.all(28.w),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.search_off_rounded,
                    size: 32.sp,
                    color: Colors.grey.shade300,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    "No Data Found",
                    style: TextStyle(
                      fontFamily: _fontFamily,
                      color: Colors.grey.shade500,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          );
        },

        errorBuilder: (context, searchEntry, exception) {
          return Padding(
            padding: EdgeInsets.all(24.w),
            child: Center(
              child: Text(
                "Something went wrong",
                style: TextStyle(
                  fontFamily: _fontFamily,
                  color: Colors.red.shade400,
                  fontSize: 13.sp,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
