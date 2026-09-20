import 'package:ecepl_app/Config/Components/Buttomsheet_Model/app_details_field.dart';
import 'package:ecepl_app/Config/Components/Buttomsheet_Model/app_details_model.dart';
import 'package:ecepl_app/Config/Components/Buttomsheet_Model/app_details_section.dart';
import 'package:ecepl_app/Config/Components/Data_Table/app_action_button.dart';
import 'package:ecepl_app/Config/Components/Data_Table/app_data_table_screen.dart';
import 'package:ecepl_app/Config/Components/Data_Table/app_list_card.dart';
import 'package:ecepl_app/Data/Model/Item_Group/item_group_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemGroup extends StatefulWidget {
  const ItemGroup({super.key});

  @override
  State<ItemGroup> createState() => _ItemGroupState();
}

class _ItemGroupState extends State<ItemGroup> {
  void _onView(BuildContext context, ItemGroupModel item) {
    AppDetailsModal.show(
      context: context,
      title: "Item Group Details",
      subtitle: item.title,
      icon: Icons.inventory_2,
      sections: [
        AppDetailsSection(
          title: "Item Group Details",
          columns: 2,
          fields: [
            AppDetailsField(
              label: "Course",
              value: item.title,
              icon: Icons.menu_book_outlined,
            ),

            AppDetailsField(
              label: "Category",
              value: item.category,
              icon: Icons.menu_book_outlined,
            ),

            AppDetailsField(
              label: "Teacher",
              value: item.teacher,
              icon: Icons.person_outline,
            ),

            AppDetailsField(
              label: "Lesson",
              value: item.lesson,
              icon: Icons.play_lesson_outlined,
              fullWidth: true,
            ),

            AppDetailsField(
              label: "Enrolled Students",
              value: item.enrolled.toString(),
              icon: Icons.people_outline,
            ),

            AppDetailsField(
              label: "Price",
              value: item.price.toString(),
              icon: Icons.attach_money_outlined,
            ),
          ],
        ),
      ],
      actions: [
        ElevatedButton.icon(
          onPressed: () {
            Navigator.pop(context);

            // Edit item group here
          },
          icon: const Icon(Icons.edit_outlined),
          label: const Text('Edit Item Group'),
        ),
      ],
    );
  }

  static const List<ItemGroupModel> _allData = [
    ItemGroupModel(
      title: 'Flutter Basics',
      category: 'Mobile Dev',
      teacher: 'Teacher James',
      lesson: 'Intro to Flutter',
      enrolled: 16,
      price: 25.00,
      course: 'Flutter Basics',
    ),
    ItemGroupModel(
      title: 'UI/UX Design',
      category: 'Design',
      teacher: 'Teacher Sara',
      lesson: 'Wireframing 101',
      enrolled: 24,
      price: 35.00,
      course: 'UI/UX Design',
    ),
    ItemGroupModel(
      title: 'Python for Beginners',
      category: 'Programming',
      teacher: 'Teacher John',
      lesson: 'Variables & Loops',
      enrolled: 40,
      price: 20.00,
      course: 'Python for Beginners',
    ),
    ItemGroupModel(
      title: 'React Native',
      category: 'Mobile Dev',
      teacher: 'Teacher James',
      lesson: 'Component Basics',
      enrolled: 18,
      price: 30.00,
      course: 'React Native',
    ),
    ItemGroupModel(
      title: 'Data Science 101',
      category: 'Data',
      teacher: 'Teacher Nina',
      lesson: 'Pandas & NumPy',
      enrolled: 32,
      price: 45.00,
      course: 'Data Science 101',
    ),
    ItemGroupModel(
      title: 'Node.js Mastery',
      category: 'Backend',
      teacher: 'Teacher Alex',
      lesson: 'REST APIs',
      enrolled: 22,
      price: 40.00,
      course: 'Node.js Mastery',
    ),
    ItemGroupModel(
      title: 'Swift iOS Dev',
      category: 'Mobile Dev',
      teacher: 'Teacher Kim',
      lesson: 'SwiftUI Basics',
      enrolled: 14,
      price: 55.00,
      course: 'Swift iOS Dev',
    ),
    ItemGroupModel(
      title: 'AWS Cloud Basics',
      category: 'Cloud',
      teacher: 'Teacher Mark',
      lesson: 'EC2 & S3',
      enrolled: 28,
      price: 60.00,
      course: 'AWS Cloud Basics',
    ),
    ItemGroupModel(
      title: 'Django Web Dev',
      category: 'Backend',
      teacher: 'Teacher John',
      lesson: 'Models & Views',
      enrolled: 19,
      price: 35.00,
      course: 'Django Web Dev',
    ),
    ItemGroupModel(
      title: 'Graphic Design Pro',
      category: 'Design',
      teacher: 'Teacher Sara',
      lesson: 'Typography Basics',
      enrolled: 11,
      price: 25.00,
      course: 'Graphic Design Pro',
    ),
    ItemGroupModel(
      title: 'Kotlin Android',
      category: 'Mobile Dev',
      teacher: 'Teacher James',
      lesson: 'Activities & Frags',
      enrolled: 20,
      price: 30.00,
      course: 'Kotlin Android',
    ),
  ];

  // Delete Record
  void _onDelete(BuildContext context, ItemGroupModel removeRecord) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Delete Record'),
        content: Text('Are you sure you want to delete this record?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
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
    return AppDataTableScreen<ItemGroupModel>(
      title: 'Items Group',
      data: _allData,
      onAddNew: () {},
      matches: (c, q) =>
          c.title.toLowerCase().contains(q) ||
          c.category.toLowerCase().contains(q) ||
          c.teacher.toLowerCase().contains(q),
      columnsBuilder: (context, course) => [
        AppCardColumn(
          flex: 5,
          children: [
            Text(course.title, style: AppCardTextStyles.title()),
            SizedBox(height: 4.h),
            Text(course.category, style: AppCardTextStyles.subtitle()),
            SizedBox(height: 2.h),
            Text(course.teacher, style: AppCardTextStyles.subtitle()),
          ],
        ),
        AppCardColumn(
          flex: 4,
          children: [
            Text(course.lesson, style: AppCardTextStyles.body()),
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
      ],
      trailingBuilder: (context, course) => Text(
        '\$${course.price.toStringAsFixed(2)}',
        style: AppCardTextStyles.title(),
      ),
      actionsBuilder: (context, course) => AppRowAction.viewEditDelete(
        onView: () => _onView(context, course),
        onEdit: () {},
        onDelete: () => _onDelete(context, course),
      ),
    );
  }
}
