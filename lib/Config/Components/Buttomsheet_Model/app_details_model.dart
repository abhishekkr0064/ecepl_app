import 'package:flutter/material.dart';

import 'app_details_field.dart';
import 'app_details_section.dart';

class AppDetailsModal {
  static Future<T?> show<T>({
    required BuildContext context,
    required String title,

    String? subtitle,

    IconData? icon,

    Widget? header,

    Widget? status,

    required List<AppDetailsSection> sections,

    List<Widget>? actions,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withValues(alpha: 0.45),

      sheetAnimationStyle: const AnimationStyle(
        duration: Duration(milliseconds: 350),
        reverseDuration: Duration(milliseconds: 250),
      ),

      builder: (context) {
        return _AppDetailsModal(
          title: title,
          subtitle: subtitle,
          icon: icon,
          header: header,
          status: status,
          sections: sections,
          actions: actions,
        );
      },
    );
  }
}

class _AppDetailsModal extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData? icon;
  final Widget? header;
  final Widget? status;

  final List<AppDetailsSection> sections;
  final List<Widget>? actions;

  const _AppDetailsModal({
    required this.title,
    required this.sections,
    this.subtitle,
    this.icon,
    this.header,
    this.status,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxHeight: 800),

      decoration: const BoxDecoration(
        color: Color(0xFFF8F9FC),
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),

      child: Column(
        children: [
          _buildHandle(),

          _buildHeader(context),

          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (header != null) ...[header!, const SizedBox(height: 18)],

                  ...sections.map(
                    (section) => Padding(
                      padding: const EdgeInsets.only(bottom: 22),
                      child: _DetailsSectionWidget(section: section),
                    ),
                  ),
                ],
              ),
            ),
          ),

          if (actions != null && actions!.isNotEmpty) _buildActions(),
        ],
      ),
    );
  }

  Widget _buildHandle() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 6),
      child: Container(
        width: 42,
        height: 4,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 12, 14),
      child: Row(
        children: [
          if (icon != null) ...[
            Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                color: const Color(0xFFEDEBFF),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(icon, color: const Color(0xFF3F36A8), size: 23),
            ),

            const SizedBox(width: 12),
          ],

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF17172B),
                  ),
                ),

                if (subtitle != null) ...[
                  const SizedBox(height: 3),

                  Text(
                    subtitle!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
                  ),
                ],
              ],
            ),
          ),

          if (status != null) ...[const SizedBox(width: 8), status!],

          IconButton(
            tooltip: 'Close',
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.close),
          ),
        ],
      ),
    );
  }

  Widget _buildActions() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 18,
            offset: const Offset(0, -5),
            color: Colors.black.withValues(alpha: 0.05),
          ),
        ],
      ),
      child: Row(
        children: actions!
            .map(
              (action) => Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: action,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class _DetailsSectionWidget extends StatelessWidget {
  final AppDetailsSection section;

  const _DetailsSectionWidget({required this.section});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (section.title.trim().isNotEmpty) ...[
          Text(
            section.title.toUpperCase(),
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.8,
              color: Colors.grey.shade600,
            ),
          ),

          const SizedBox(height: 10),
        ],

        _buildFields(context),
      ],
    );
  }

  Widget _buildFields(BuildContext context) {
    final fullWidth = section.fields.where((field) => field.fullWidth).toList();

    final normalFields = section.fields
        .where((field) => !field.fullWidth)
        .toList();

    return LayoutBuilder(
      builder: (context, constraints) {
        final requestedColumns = section.columns.clamp(1, 3);

        // On smaller screens, don't force 3 columns.
        final actualColumns = constraints.maxWidth < 500
            ? requestedColumns.clamp(1, 2)
            : requestedColumns;

        final List<Widget> rows = [];

        for (int i = 0; i < normalFields.length; i += actualColumns) {
          final rowFields = normalFields.skip(i).take(actualColumns).toList();

          rows.add(
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (int index = 0; index < actualColumns; index++) ...[
                    Expanded(
                      child: index < rowFields.length
                          ? _DetailField(field: rowFields[index])
                          : const SizedBox(),
                    ),

                    if (index < actualColumns - 1) const SizedBox(width: 10),
                  ],
                ],
              ),
            ),
          );
        }

        return Column(
          children: [
            ...rows,

            ...fullWidth.map(
              (field) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: _DetailField(field: field),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _DetailField extends StatelessWidget {
  final AppDetailsField field;

  const _DetailField({required this.field});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (field.icon != null) ...[
                Icon(field.icon, size: 15, color: Colors.grey.shade500),

                const SizedBox(width: 6),
              ],

              Expanded(
                child: Text(
                  field.label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade600,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 6),

          field.valueWidget ??
              Text(
                field.value.isEmpty ? '-' : field.value,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF202035),
                ),
              ),
        ],
      ),
    );
  }
}
