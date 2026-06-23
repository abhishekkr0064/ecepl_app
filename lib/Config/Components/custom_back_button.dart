import 'package:ecepl_app/Config/App_assets/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomBackButton extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onPressed;
  final bool showBackButton;

  const CustomBackButton({
    super.key,
    this.onPressed,
    this.showBackButton = true,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      leading: showBackButton
          ? IconButton(
              icon: Image.asset(AppAssets.backButton),
              onPressed: onPressed ?? () => Navigator.pop(context),
            )
          : const SizedBox.shrink(),
    );
  }
}
