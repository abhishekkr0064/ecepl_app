import 'package:ecepl_app/Data/Model/Projects_name/projects_name_model.dart';

class ProjectsResponseData {
  final List<ProjectNameModel> projects;

  ProjectsResponseData({required this.projects});

  factory ProjectsResponseData.fromJson(Map<String, dynamic> json) {
    return ProjectsResponseData(
      projects: (json['projects'] as List<dynamic>? ?? [])
          .map((e) => ProjectNameModel.fromJson(e))
          .toList(),
    );
  }
}
