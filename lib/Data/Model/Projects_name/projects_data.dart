import 'package:ecepl_app/Data/Model/Projects_name/projects_name_response.dart';

class ProjectsData {
  final bool status;
  final String message;
  final ProjectsResponseData? data;

  ProjectsData({required this.status, required this.message, this.data});

  factory ProjectsData.fromJson(Map<String, dynamic> json) {
    return ProjectsData(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data: json['data'] != null
          ? ProjectsResponseData.fromJson(json['data'])
          : null,
    );
  }
}
