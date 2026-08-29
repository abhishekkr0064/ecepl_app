class PaginatedListController<T> {
  final List<T> allData;
  final bool Function(T item, String query) matches;
  final int perPage;

  int currentPage = 1;
  String query = '';

  PaginatedListController({
    required this.allData,
    required this.matches,
    this.perPage = 8,
  });

  List<T> get filtered => query.isEmpty
      ? allData
      : allData.where((item) => matches(item, query)).toList();

  List<T> get paginated {
    final data = filtered;
    final start = (currentPage - 1) * perPage;
    final end = (start + perPage).clamp(0, data.length);
    return data.sublist(start, end);
  }

  int get totalPages => (filtered.length / perPage).ceil().clamp(1, 9999);

  void search(String value) {
    query = value.toLowerCase();
    currentPage = 1;
  }
}
