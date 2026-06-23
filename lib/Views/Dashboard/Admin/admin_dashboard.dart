import 'package:ecepl_app/Config/Color/app_color.dart';
import 'package:ecepl_app/Views/Dashboard/Widgets/bottom_nav.dart';
import 'package:ecepl_app/Views/Dashboard/Widgets/menu_grid.dart';
import 'package:ecepl_app/Views/Dashboard/Widgets/menu_item_model.dart';
import 'package:ecepl_app/Views/Dashboard/Widgets/task_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../widgets/home_header.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  int _currentNavIndex = 0;

  late final List<MenuItemModel> _menuItems = [
    MenuItemModel(
      icon: Icons.wallet,
      label: 'Account\nand Card',
      color: Color(0xFF3730A3),
    ),
    MenuItemModel(
      icon: Icons.compare_arrows,
      label: 'Transfer',
      color: Color(0xFFE53935),
    ),
    MenuItemModel(
      icon: Icons.download_outlined,
      label: 'Withdraw',
      color: Color(0xFF3730A3),
    ),
    MenuItemModel(
      icon: Icons.inventory,
      label: 'Inventory',
      color: Color(0xFFFF9800),
      onTap: () {
        context.go('/trade-blotter');
      },
    ),
    MenuItemModel(
      icon: Icons.receipt_long,
      label: 'KPI',
      color: Color(0xFF43A047),
    ),
    MenuItemModel(
      icon: Icons.savings,
      label: 'Save\nonline',
      color: Color(0xFF1E88E5),
    ),
    MenuItemModel(
      icon: Icons.credit_card,
      label: 'Credit\ncard',
      color: Color(0xFFE53935),
    ),
    MenuItemModel(
      icon: Icons.bar_chart,
      label: 'Transaction\nreport',
      color: Color(0xFF43A047),
    ),
    MenuItemModel(
      icon: Icons.person_outline,
      label: 'Beneficiary',
      color: Color(0xFFE53935),
    ),
  ];

  final List<BottomNavItem> _navItems = [
    BottomNavItem(icon: Icons.home_rounded, label: 'Home'),
    BottomNavItem(icon: Icons.search, label: 'Search'),
    BottomNavItem(icon: Icons.mail_outline, label: 'Mail'),
    BottomNavItem(icon: Icons.settings_outlined, label: 'Settings'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primarycolor,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            HomeHeader(
              userName: 'Push Puttichai',
              avatarPath: 'assets/Icons/lion.png',
              hasNotification: true,
              onBellTap: () {},
            ),

            // White scrollable body
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFFF4F5F9),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(28.r),
                    topRight: Radius.circular(28.r),
                  ),
                ),
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 20.h,
                  ),
                  child: Column(
                    children: [
                      TaskCard(
                        progress: 0.85,
                        onButtonTap: () {},
                        onMoreTap: () {},
                      ),
                      SizedBox(height: 20.h),
                      MenuGrid(items: _menuItems),
                    ],
                  ),
                ),
              ),
            ),

            // Bottom nav
            BottomNavBar(
              currentIndex: _currentNavIndex,
              items: _navItems,
              onIndexSelected: (i) => setState(() => _currentNavIndex = i),
            ),
          ],
        ),
      ),
    );
  }
}
