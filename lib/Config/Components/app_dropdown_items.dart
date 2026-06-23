import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDropdown extends StatelessWidget {
  final String label;
  final String hint;
  final List<String> items;
  final ValueNotifier<String?> valueListenable;
  final ValueChanged<String?> onChanged;

  const AppDropdown({
    super.key,
    required this.label,
    required this.hint,
    required this.items,
    required this.valueListenable,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String?>(
      valueListenable: valueListenable,
      builder: (context, value, child) {
        return InputDecorator(
          decoration: InputDecoration(
            labelText: value != null ? label : null,
            hintText: value == null ? hint : null,

            floatingLabelBehavior: FloatingLabelBehavior.auto,

            contentPadding: EdgeInsets.symmetric(
              horizontal: 6.w,
              vertical: 3.h,
            ),

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.deepPurple, width: 2),
            ),

            filled: true,
            fillColor: Colors.white,
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              isExpanded: true,
              valueListenable: valueListenable,

              hint: Text(hint, style: TextStyle(color: Colors.grey.shade500)),

              items: items.map((item) {
                return DropdownItem<String>(
                  value: item,
                  child: Text(item, style: const TextStyle(fontSize: 15)),
                );
              }).toList(),

              onChanged: onChanged,

              iconStyleData: const IconStyleData(
                icon: Icon(Icons.keyboard_arrow_down_rounded),
                iconSize: 24,
              ),

              buttonStyleData: const ButtonStyleData(
                height: 50,
                padding: EdgeInsets.zero,
              ),

              dropdownStyleData: DropdownStyleData(
                maxHeight: 250,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 6,
              ),
            ),
          ),
        );
      },
    );
  }
}
