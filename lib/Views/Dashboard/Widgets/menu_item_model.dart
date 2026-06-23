import 'package:flutter/material.dart';

class MenuItemModel {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback? onTap;

  const MenuItemModel({
    required this.icon,
    required this.label,
    required this.color,
    this.onTap,
  });
}
