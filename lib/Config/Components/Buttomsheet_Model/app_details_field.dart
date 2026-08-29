import 'package:flutter/material.dart';

class AppDetailsField {
  final String label;
  final String value;

  /// Optional icon shown before the label.
  final IconData? icon;

  /// Use this when value needs custom UI.
  /// Example: Status badge, image, button, chip, etc.
  final Widget? valueWidget;

  /// If true, this field takes the complete row width.
  final bool fullWidth;

  const AppDetailsField({
    required this.label,
    this.value = '',
    this.icon,
    this.valueWidget,
    this.fullWidth = false,
  });
}
