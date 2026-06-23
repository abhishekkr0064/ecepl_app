import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'menu_item_model.dart';
import 'menu_tile.dart';

class MenuGrid extends StatelessWidget {
  final List<MenuItemModel> items;
  final int crossAxisCount;

  const MenuGrid({super.key, required this.items, this.crossAxisCount = 3});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 12.w,
        mainAxisSpacing: 12.h,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) => MenuTile(item: items[index]),
    );
  }
}
