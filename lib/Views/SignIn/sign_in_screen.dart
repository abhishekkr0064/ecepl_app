import 'package:ecepl_app/Config/App_assets/app_assets.dart';
import 'package:ecepl_app/Config/Color/app_color.dart';
import 'package:ecepl_app/Config/Components/app_button.dart';
import 'package:ecepl_app/Config/Components/app_dropdown_items.dart';
import 'package:ecepl_app/Config/Components/app_image.dart';
import 'package:ecepl_app/Config/Widget/app_text.dart';
import 'package:ecepl_app/Config/Widget/custom_password_field.dart';
import 'package:ecepl_app/Config/Widget/login_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController usernameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final ValueNotifier<String?> selectedItem = ValueNotifier<String?>(null);

  String selectedRole = "";
  final List<String> roleOptions = ["Admin", "User"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primarycolor,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              height: 120,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Icon(Icons.arrow_back_ios, color: Colors.white),
                  SizedBox(width: 8.w),
                  AppText(
                    title: 'Sign in',
                    fontfemly: 'Poppins',
                    fontweight: FontWeight.w600,
                    fontsize: 20.sp,
                    color: AppColor.whiteColor,
                  ),
                ],
              ),
            ),

            // Body
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(27.r),
                    topRight: Radius.circular(27.r),
                  ),
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        title: "Welcome Back",
                        fontfemly: 'Poppins',
                        fontweight: FontWeight.w600,
                        fontsize: 24.sp,
                        color: AppColor.primarycolor,
                      ),

                      const SizedBox(height: 4),

                      AppText(
                        title: "Hello there, sign in to continue",
                        fontfemly: 'Poppins',
                        fontweight: FontWeight.w500,
                        fontsize: 12.sp,
                        color: AppColor.blackColor,
                      ),

                      AppImage(
                        path: AppAssets.lockIcon,
                        height: 165.h,
                        width: 213.w,
                      ),
                      SizedBox(height: 10.h),
                      AppDropdown(
                        label: "Role",
                        hint: "Select Role",
                        items: const ["Admin", "User"],
                        valueListenable: selectedItem,
                        onChanged: (value) {
                          selectedItem.value = value;
                        },
                      ),
                      SizedBox(height: 10.h),
                      AppTextField(
                        controller: usernameController,
                        label: "Full Name",
                        hintText: "Enter your full name",
                        prefixIcon: const Icon(Icons.person_outline),
                      ),

                      SizedBox(height: 16.h),

                      AppPasswordField(
                        controller: passwordController,
                        label: "Password",
                        hintText: "Enter your password",
                        prefixIcon: const Icon(Icons.lock_outline),
                      ),

                      SizedBox(height: 10.h),

                      Align(
                        alignment: Alignment.centerRight,
                        child: AppText(
                          title: "Forget your password ?",
                          fontweight: FontWeight.normal,
                          fontsize: 12,
                          ontap: () {},
                          color: AppColor.primarycolor,
                        ),
                      ),

                      SizedBox(height: 24.h),

                      AppButton(
                        tittle: 'Sign In',
                        horizontal: 0,
                        ontap: () {
                          context.go('/admin-dashboard');
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
