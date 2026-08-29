import 'package:ecepl_app/Config/Color/app_color.dart';
import 'package:ecepl_app/Views/Dashboard/Admin/profile_drawer.dart';
import 'package:ecepl_app/Views/Dashboard/Widgets/bottom_nav.dart';
import 'package:ecepl_app/Views/Dashboard/Widgets/menu_grid.dart';
import 'package:ecepl_app/Views/Dashboard/Widgets/menu_item_model.dart';
import 'package:ecepl_app/Views/Dashboard/Widgets/task_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import '../widgets/home_header.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  int _currentNavIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late final List<MenuItemModel> _menuItems = [
    MenuItemModel(
      icon: LucideIcons.boxes,
      label: 'Items',
      color: const Color(0xFF3B82F6), // Blue
      onTap: () {
        context.push('/items-record');
      },
    ),
    MenuItemModel(
      icon: LucideIcons.folderTree,
      label: 'Item\nGroup',
      color: const Color(0xFF8B5CF6), // Purple
    ),
    MenuItemModel(
      icon: LucideIcons.clipboardList,
      label: 'BOQ',
      color: const Color(0xFF10B981), // Emerald
    ),
    MenuItemModel(
      icon: LucideIcons.chartColumn,
      label: 'Survey Boq',
      color: const Color(0xFFF59E0B), // Amber
      onTap: () {
        context.push('/trade-blotter');
      },
    ),
    MenuItemModel(
      icon: LucideIcons.shoppingCart,
      label: 'Purchases\nOrder',
      color: const Color(0xFFEF4444), // Red
    ),
    MenuItemModel(
      icon: LucideIcons.badgeIndianRupee,
      label: 'Local\nPurchase Order',
      color: const Color(0xFF06B6D4), // Cyan
    ),
    MenuItemModel(
      icon: LucideIcons.fileCheck,
      label: 'DI',
      color: const Color(0xFFEC4899), // Pink
    ),
    MenuItemModel(
      icon: LucideIcons.package,
      label: 'Packing\nMaterial',
      color: const Color(0xFF84CC16), // Lime
    ),
    MenuItemModel(
      icon: LucideIcons.fileBox,
      label: 'MRN',
      color: const Color(0xFFF97316), // Orange
    ),
    MenuItemModel(
      icon: LucideIcons.clipboardCheck,
      label: 'RFI\nMaterial',
      color: const Color(0xFF14B8A6), // Teal
    ),
    MenuItemModel(
      icon: LucideIcons.receipt,
      label: 'Supply Bill',
      color: const Color(0xFF6366F1), // Indigo
    ),
    MenuItemModel(
      icon: LucideIcons.filePlus,
      label: 'Material\nRequisition',
      color: const Color(0xFFA855F7), // Violet
    ),
    MenuItemModel(
      icon: LucideIcons.userRoundCheck,
      label: 'Contractor Issue',
      color: const Color(0xFF22C55E), // Green
    ),
    MenuItemModel(
      icon: LucideIcons.undo2,
      label: 'Return Form\nContractor',
      color: const Color(0xFFFB7185), // Rose
    ),
    MenuItemModel(
      icon: LucideIcons.chartLine,
      label: 'Progress',
      color: const Color(0xFF0EA5E9), // Sky
    ),
    MenuItemModel(
      icon: LucideIcons.fileSignature,
      label: 'Contractor Billing',
      color: const Color(0xFFD97706), // Dark Amber
    ),
    MenuItemModel(
      icon: LucideIcons.hardHat,
      label: 'Contractor',
      color: const Color(0xFF7C3AED), // Deep Purple
    ),
    MenuItemModel(
      icon: LucideIcons.truck,
      label: 'Vender',
      color: const Color(0xFF16A34A), // Green
    ),
    MenuItemModel(
      icon: LucideIcons.fileText,
      label: 'Tender',
      color: const Color(0xFFDC2626), // Dark Red
    ),
    MenuItemModel(
      icon: LucideIcons.warehouse,
      label: 'Warehouse',
      color: const Color(0xFF2563EB), // Royal Blue
    ),
    MenuItemModel(
      icon: LucideIcons.mapPin,
      label: 'Location',
      color: const Color(0xFF0891B2), // Dark Cyan
    ),
    MenuItemModel(
      icon: LucideIcons.building2,
      label: 'Project',
      color: const Color(0xFF9333EA), // Purple
    ),
    MenuItemModel(
      icon: LucideIcons.users,
      label: 'Members',
      color: const Color(0xFF059669), // Emerald
    ),
    MenuItemModel(
      icon: LucideIcons.shieldCheck,
      label: 'Permission',
      color: const Color(0xFFEA580C), // Deep Orange
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
      key: _scaffoldKey,
      backgroundColor: AppColor.primaryColor,
      drawer: ProfileDrawer(
        userName: 'Push Puttichai',
        avatarPath: 'assets/Icons/lion.png',
        items: _menuItems,
      ),
      body: SafeArea(
        child: Column(
          children: [
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () => _scaffoldKey.currentState?.openDrawer(),
              child: HomeHeader(
                userName: 'Push Puttichai',
                avatarPath: 'assets/Icons/lion.png',
                hasNotification: true,
                onBellTap: () {},
              ),
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
