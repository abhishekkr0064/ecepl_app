import 'package:ecepl_app/Config/Components/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecepl_app/Config/Color/app_color.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingData> _pages = [
    OnboardingData(
      imagePath: 'assets/Images/ob1.png',
      title: 'Welcome to ECEPL',
      description:
          'Manage transformers, cables, and power sector assets efficiently through a centralized inventory platform.',
    ),

    OnboardingData(
      imagePath: 'assets/Images/ob2.png',
      title: 'Inventory at Your Fingertips',
      description:
          'Track stock availability, asset movement, and maintenance records across power utility operations. everything you need, anytime and anywhere.',
    ),
  ];

  void _onPageChanged(int index) {
    setState(() => _currentPage = index);
  }

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      _goToLogin();
    }
  }

  void _goToLogin() {
    // 🔁 Replace with your actual login route
    // Navigator.pushReplacementNamed(context, '/signin');
    context.go('/signin');
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: SafeArea(
        child: Column(
          children: [
            /// ─── Skip Button ───────────────────────────────────────────
            // Align(
            //   alignment: Alignment.topRight,
            //   child: TextButton(
            //     onPressed: _goToLogin,
            //     child: Text(
            //       'Skip',
            //       style: TextStyle(
            //         fontFamily: 'Roboto',
            //         fontSize: 14.sp,
            //         fontWeight: FontWeight.w500,
            //         color: AppColor.blackColor.withValues(alpha: 0.5),
            //       ),
            //     ),
            //   ),
            // ),

            /// ─── PageView ──────────────────────────────────────────────
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                itemCount: _pages.length,
                itemBuilder: (context, index) {
                  return _OnboardingPage(data: _pages[index]);
                },
              ),
            ),

            /// ─── Dot Indicators ────────────────────────────────────────
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _pages.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(horizontal: 4.w),
                  width: _currentPage == index ? 24.w : 8.w,
                  height: 8.h,
                  decoration: BoxDecoration(
                    color: _currentPage == index
                        ? AppColor.primaryColor
                        : AppColor.blackColor.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
              ),
            ),

            SizedBox(height: 32.h),

            /// ─── Next / Get Started Button ─────────────────────────────
            AppButton(
              horizontal: 24.w,
              tittle: _currentPage == _pages.length - 1
                  ? 'Get Started'
                  : 'Next',
              ontap: _nextPage,
            ),

            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}

/// ─── Single Slide Widget ─────────────────────────────────────────────────────

class _OnboardingPage extends StatelessWidget {
  final OnboardingData data;

  const _OnboardingPage({required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// Image
          ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: Image.asset(
              data.imagePath,
              height: 300.h,
              width: double.infinity,
              fit: BoxFit.contain,
            ),
          ),

          SizedBox(height: 40.h),

          /// Title
          Text(
            data.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 22.sp,
              fontWeight: FontWeight.w700,
              color: AppColor.blackColor,
            ),
          ),

          SizedBox(height: 12.h),

          /// Description
          Text(
            data.description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: AppColor.blackColor.withValues(alpha: 0.6),
            ),
          ),
        ],
      ),
    );
  }
}

/// ─── Data Model ──────────────────────────────────────────────────────────────

class OnboardingData {
  final String imagePath;
  final String title;
  final String description;

  OnboardingData({
    required this.imagePath,
    required this.title,
    required this.description,
  });
}
