import 'package:ecepl_app/Config/Color/app_color.dart';
import 'package:ecepl_app/Views/Dashboard/Widgets/menu_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileDrawer extends StatelessWidget {
  final String userName;
  final String avatarPath;
  final List<MenuItemModel> items;

  const ProfileDrawer({
    super.key,
    required this.userName,
    required this.avatarPath,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      width: 300.w,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with user info
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
              color: AppColor.primaryColor,
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 28.r,
                    backgroundImage: AssetImage(avatarPath),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userName,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          'View Profile',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close, color: Colors.white),
                  ),
                ],
              ),
            ),

            // Menu list
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                itemCount: items.length,
                separatorBuilder: (_, __) => Divider(
                  height: 1,
                  indent: 60.w,
                  color: Colors.grey.shade200,
                ),
                itemBuilder: (context, index) {
                  final item = items[index];
                  return ListTile(
                    onTap: () {
                      Navigator.pop(context); // close drawer first
                      item.onTap?.call();
                    },
                    leading: Container(
                      width: 40.w,
                      height: 40.w,
                      decoration: BoxDecoration(
                        color: item.color.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Icon(item.icon, color: item.color, size: 20.sp),
                    ),
                    title: Text(
                      item.label.replaceAll('\n', ' '),
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
                    dense: true,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
