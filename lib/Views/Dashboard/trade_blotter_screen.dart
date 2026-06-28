import 'package:ecepl_app/Config/Color/app_color.dart';
import 'package:ecepl_app/Config/Components/app_back_button.dart';
import 'package:ecepl_app/Views/Dashboard/trade_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseTableScreen extends StatefulWidget {
  const CourseTableScreen({super.key});

  @override
  State<CourseTableScreen> createState() => _CourseTableScreenState();
}

class _CourseTableScreenState extends State<CourseTableScreen> {
  final TextEditingController _searchController = TextEditingController();
  final int _perPage = 8;
  int _currentPage = 1;
  String _searchQuery = '';

  static const List<CourseModel> _allData = [
    CourseModel(
      title: 'Flutter Basics',
      category: 'Mobile Dev',
      teacher: 'Teacher James',
      lesson: 'Intro to Flutter',
      enrolled: 16,
      price: 25.00,
    ),
    CourseModel(
      title: 'UI/UX Design',
      category: 'Design',
      teacher: 'Teacher Sara',
      lesson: 'Wireframing 101',
      enrolled: 24,
      price: 35.00,
    ),
    CourseModel(
      title: 'Python for Beginners',
      category: 'Programming',
      teacher: 'Teacher John',
      lesson: 'Variables & Loops',
      enrolled: 40,
      price: 20.00,
    ),
    CourseModel(
      title: 'React Native',
      category: 'Mobile Dev',
      teacher: 'Teacher James',
      lesson: 'Component Basics',
      enrolled: 18,
      price: 30.00,
    ),
    CourseModel(
      title: 'Data Science 101',
      category: 'Data',
      teacher: 'Teacher Nina',
      lesson: 'Pandas & NumPy',
      enrolled: 32,
      price: 45.00,
    ),
    CourseModel(
      title: 'Node.js Mastery',
      category: 'Backend',
      teacher: 'Teacher Alex',
      lesson: 'REST APIs',
      enrolled: 22,
      price: 40.00,
    ),
    CourseModel(
      title: 'Swift iOS Dev',
      category: 'Mobile Dev',
      teacher: 'Teacher Kim',
      lesson: 'SwiftUI Basics',
      enrolled: 14,
      price: 55.00,
    ),
    CourseModel(
      title: 'AWS Cloud Basics',
      category: 'Cloud',
      teacher: 'Teacher Mark',
      lesson: 'EC2 & S3',
      enrolled: 28,
      price: 60.00,
    ),
    CourseModel(
      title: 'Django Web Dev',
      category: 'Backend',
      teacher: 'Teacher John',
      lesson: 'Models & Views',
      enrolled: 19,
      price: 35.00,
    ),
    CourseModel(
      title: 'Graphic Design Pro',
      category: 'Design',
      teacher: 'Teacher Sara',
      lesson: 'Typography Basics',
      enrolled: 11,
      price: 25.00,
    ),
    CourseModel(
      title: 'Kotlin Android',
      category: 'Mobile Dev',
      teacher: 'Teacher James',
      lesson: 'Activities & Frags',
      enrolled: 20,
      price: 30.00,
    ),
  ];

  List<CourseModel> get _filtered => _allData
      .where(
        (c) =>
            c.title.toLowerCase().contains(_searchQuery) ||
            c.category.toLowerCase().contains(_searchQuery) ||
            c.teacher.toLowerCase().contains(_searchQuery),
      )
      .toList();

  List<CourseModel> get _paginated {
    final start = (_currentPage - 1) * _perPage;
    final end = (start + _perPage).clamp(0, _filtered.length);
    return _filtered.sublist(start, end);
  }

  int get _totalPages => (_filtered.length / _perPage).ceil().clamp(1, 9999);

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onDelete(int globalIndex) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Delete Course'),
        content: const Text('Are you sure you want to delete this course?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8FF),
      appBar: AppBackButton(title: 'Trade Blotter') as PreferredSizeWidget,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// ── Title ──────────────────────────────────────────────
              SizedBox(height: 14.h),

              /// ── Search + Add New ───────────────────────────────────
              Row(
                children: [
                  Expanded(
                    child: _SearchBar(
                      controller: _searchController,
                      onChanged: (v) {
                        setState(() {
                          _searchQuery = v.toLowerCase();
                          _currentPage = 1;
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 10.w),
                  _AddNewButton(onTap: () {}),
                ],
              ),

              SizedBox(height: 18.h),

              /// ── Table ──────────────────────────────────────────────
              Expanded(
                child: _filtered.isEmpty
                    ? Center(
                        child: Text(
                          'No results found.',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14.sp,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      )
                    : ListView.separated(
                        itemCount: _paginated.length,
                        // separatorBuilder: (_, __) =>
                        separatorBuilder: (_, _) => SizedBox(height: 10.h),
                        itemBuilder: (_, i) => _CourseCard(
                          course: _paginated[i],
                          onView: () {},
                          onEdit: () {},
                          onDelete: () => _onDelete(i),
                        ),
                      ),
              ),

              SizedBox(height: 12.h),

              /// ── Footer ─────────────────────────────────────────────
              _TableFooter(
                currentPage: _currentPage,
                totalPages: _totalPages,
                totalEntries: _filtered.length,
                perPage: _perPage,
                onPrev: _currentPage > 1
                    ? () => setState(() => _currentPage--)
                    : null,
                onNext: _currentPage < _totalPages
                    ? () => setState(() => _currentPage++)
                    : null,
                onPageTap: (p) => setState(() => _currentPage = p),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// ── Search Bar ───────────────────────────────────────────────────────────────
class _SearchBar extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  const _SearchBar({required this.controller, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        style: TextStyle(fontSize: 13.sp, fontFamily: 'Roboto'),
        decoration: InputDecoration(
          hintText: 'Search content here...',
          hintStyle: TextStyle(
            fontSize: 13.sp,
            color: Colors.grey,
            fontFamily: 'Roboto',
          ),
          prefixIcon: Icon(Icons.search, color: Colors.grey, size: 18.sp),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 12.h),
        ),
      ),
    );
  }
}

/// ── Add New Button ────────────────────────────────────────────────────────────
class _AddNewButton extends StatelessWidget {
  final VoidCallback onTap;

  const _AddNewButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 44.h,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Center(
          child: Text(
            'Add New',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

/// ── Course Card ───────────────────────────────────────────────────────────────
class _CourseCard extends StatelessWidget {
  final CourseModel course;
  final VoidCallback onView;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const _CourseCard({
    required this.course,
    required this.onView,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Left: title + category + teacher
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  course.title,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF1A1A2E),
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  course.category,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 11.sp,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  course.teacher,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 11.sp,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),

          /// Middle: lesson + enrolled
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  course.lesson,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 12.sp,
                    color: const Color(0xFF1A1A2E),
                  ),
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    Icon(Icons.people_outline, size: 13.sp, color: Colors.grey),
                    SizedBox(width: 3.w),
                    Text(
                      '${course.enrolled} enrolled',
                      style: TextStyle(
                        fontSize: 11.sp,
                        fontFamily: 'Roboto',
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          /// Right: price + action icons
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '\$${course.price.toStringAsFixed(2)}',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF1A1A2E),
                ),
              ),
              SizedBox(height: 8.h),
              _ActionButtons(
                onView: onView,
                onEdit: onEdit,
                onDelete: onDelete,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// ── Action Buttons ────────────────────────────────────────────────────────────
class _ActionButtons extends StatelessWidget {
  final VoidCallback onView;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const _ActionButtons({
    required this.onView,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _ActionIcon(
          icon: Icons.remove_red_eye_outlined,
          color: const Color(0xFF3B82F6),
          onTap: onView,
        ),
        SizedBox(width: 6.w),
        _ActionIcon(
          icon: Icons.edit_outlined,
          color: const Color(0xFF10B981),
          onTap: onEdit,
        ),
        SizedBox(width: 6.w),
        _ActionIcon(
          icon: Icons.delete_outline,
          color: const Color(0xFFEF4444),
          onTap: onDelete,
        ),
      ],
    );
  }
}

class _ActionIcon extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _ActionIcon({
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 30.w,
        height: 30.w,
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Icon(icon, color: color, size: 16.sp),
      ),
    );
  }
}

/// ── Table Footer ──────────────────────────────────────────────────────────────
class _TableFooter extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final int totalEntries;
  final int perPage;
  final VoidCallback? onPrev;
  final VoidCallback? onNext;
  final ValueChanged<int> onPageTap;

  const _TableFooter({
    required this.currentPage,
    required this.totalPages,
    required this.totalEntries,
    required this.perPage,
    required this.onPrev,
    required this.onNext,
    required this.onPageTap,
  });

  int get _start => (currentPage - 1) * perPage + 1;
  int get _end => (currentPage * perPage).clamp(0, totalEntries);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /// Showing X–Y of Z
        Text(
          'Showing $_start–$_end of $totalEntries',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 11.sp,
            color: AppColor.primaryColor,
            fontWeight: FontWeight.w500,
          ),
        ),

        /// Page buttons
        Row(
          children: [
            _PageButton(
              icon: Icons.chevron_left,
              onTap: onPrev,
              enabled: onPrev != null,
            ),
            SizedBox(width: 6.w),
            ...List.generate(totalPages, (i) {
              final page = i + 1;
              final isActive = page == currentPage;
              return GestureDetector(
                onTap: () => onPageTap(page),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  margin: EdgeInsets.symmetric(horizontal: 3.w),
                  width: 30.w,
                  height: 30.w,
                  decoration: BoxDecoration(
                    color: isActive
                        ? AppColor.primaryColor
                        : AppColor.whiteColor,
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(
                      color: isActive
                          ? AppColor.primaryColor
                          : Colors.grey.shade300,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '$page',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: isActive ? Colors.white : Colors.grey,
                      ),
                    ),
                  ),
                ),
              );
            }),
            SizedBox(width: 6.w),
            _PageButton(
              icon: Icons.chevron_right,
              onTap: onNext,
              enabled: onNext != null,
            ),
          ],
        ),
      ],
    );
  }
}

class _PageButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;
  final bool enabled;

  const _PageButton({
    required this.icon,
    required this.onTap,
    required this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 30.w,
        height: 30.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Icon(
          icon,
          size: 18.sp,
          color: enabled ? const Color(0xFF1A1A2E) : Colors.grey.shade300,
        ),
      ),
    );
  }
}
