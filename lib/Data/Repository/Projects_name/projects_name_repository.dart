import 'package:ecepl_app/Data/Model/Projects_name/projects_name_response.dart';
import 'package:ecepl_app/Config/API_Constants/api_constants.dart';
import 'package:ecepl_app/Data/Network/network_service_apis.dart';

class ProjectsRepository {
  final NetworkServicesApi _api = NetworkServicesApi();

  Future<ProjectsResponseData> getProjects() async {
    final response = await _api.getApi(ApiConstants.projectNamesUrl);

    return ProjectsResponseData.fromJson(response);
  }
}
