import 'package:ecepl_app/Config/Components/Data_Table/app_action_button.dart';
import 'package:ecepl_app/Config/Components/Data_Table/app_add_new_button.dart';
import 'package:ecepl_app/Config/Components/Data_Table/app_list_card.dart';
import 'package:ecepl_app/Config/Components/Data_Table/app_search_bar.dart';
import 'package:ecepl_app/Config/Components/Data_Table/app_table_footer.dart';
import 'package:ecepl_app/Config/Components/Data_Table/paginated_list_controller.dart';
import 'package:ecepl_app/Config/Components/app_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Fully generic, data-driven list/table screen.
/// Instantiate this once per entity (courses, trades, employees, invoices...)
/// instead of copy-pasting the screen scaffold each time.
class AppDataTableScreen<T> extends StatefulWidget {
  final String title;
  final List<T> data;
  final bool Function(T item, String query) matches;
  final List<AppCardColumn> Function(BuildContext context, T item)
  columnsBuilder;
  final Widget? Function(BuildContext context, T item)? trailingBuilder;
  final List<AppRowAction>? Function(BuildContext context, T item)?
  actionsBuilder;
  final VoidCallback? onAddNew;
  final String addNewLabel;
  final String searchHint;
  final String emptyText;
  final int perPage;

  const AppDataTableScreen({
    super.key,
    required this.title,
    required this.data,
    required this.matches,
    required this.columnsBuilder,
    this.trailingBuilder,
    this.actionsBuilder,
    this.onAddNew,
    this.addNewLabel = 'Add New',
    this.searchHint = 'Search content here...',
    this.emptyText = 'No results found.',
    this.perPage = 8,
  });

  @override
  State<AppDataTableScreen<T>> createState() => _AppDataTableScreenState<T>();
}

class _AppDataTableScreenState<T> extends State<AppDataTableScreen<T>> {
  final TextEditingController _searchController = TextEditingController();
  late final PaginatedListController<T> _controller =
      PaginatedListController<T>(
        allData: widget.data,
        perPage: widget.perPage,
        matches: widget.matches,
      );

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filtered = _controller.filtered;
    final paginated = _controller.paginated;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F8FF),
      appBar: AppBackButton(title: widget.title) as PreferredSizeWidget,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 14.h),

              /// ── Search + Add New ───────────────────────────────────
              Row(
                children: [
                  Expanded(
                    child: AppSearchBar(
                      controller: _searchController,
                      hintText: widget.searchHint,
                      onChanged: (v) => setState(() => _controller.search(v)),
                    ),
                  ),
                  if (widget.onAddNew != null) ...[
                    SizedBox(width: 10.w),
                    AppAddNewButton(
                      onTap: widget.onAddNew!,
                      label: widget.addNewLabel,
                    ),
                  ],
                ],
              ),

              SizedBox(height: 18.h),

              /// ── Table ──────────────────────────────────────────────
              Expanded(
                child: filtered.isEmpty
                    ? Center(
                        child: Text(
                          widget.emptyText,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14.sp,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      )
                    : ListView.separated(
                        itemCount: paginated.length,
                        separatorBuilder: (_, _) => SizedBox(height: 10.h),
                        itemBuilder: (context, i) {
                          final item = paginated[i];
                          return AppListCard(
                            columns: widget.columnsBuilder(context, item),
                            trailingTop: widget.trailingBuilder?.call(
                              context,
                              item,
                            ),
                            actions: widget.actionsBuilder?.call(context, item),
                          );
                        },
                      ),
              ),

              SizedBox(height: 12.h),

              /// ── Footer ─────────────────────────────────────────────
              AppTableFooter(
                currentPage: _controller.currentPage,
                totalPages: _controller.totalPages,
                totalEntries: filtered.length,
                perPage: _controller.perPage,
                onPrev: _controller.currentPage > 1
                    ? () => setState(() => _controller.currentPage--)
                    : null,
                onNext: _controller.currentPage < _controller.totalPages
                    ? () => setState(() => _controller.currentPage++)
                    : null,
                onPageTap: (p) => setState(() => _controller.currentPage = p),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
