import 'app_details_field.dart';

class AppDetailsSection {
  final String title;
  final List<AppDetailsField> fields;

  /// Number of columns requested for this section.
  ///
  /// 1 = one field per row
  /// 2 = two fields per row
  /// 3 = three fields per row
  final int columns;

  const AppDetailsSection({
    required this.title,
    required this.fields,
    this.columns = 2,
  });
}
