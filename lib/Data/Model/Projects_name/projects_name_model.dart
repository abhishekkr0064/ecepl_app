class ProjectNameModel {
  final String projectKey;
  final String projectName;

  ProjectNameModel({required this.projectKey, required this.projectName});

  factory ProjectNameModel.fromJson(Map<String, dynamic> json) {
    return ProjectNameModel(
      projectKey: json['key'] ?? '',
      projectName: json['name'] ?? '',
    );
  }
}
