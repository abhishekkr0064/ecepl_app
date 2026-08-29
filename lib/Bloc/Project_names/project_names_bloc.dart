import 'package:ecepl_app/Data/Model/Projects_name/projects_data.dart';
import 'package:ecepl_app/Data/Model/Projects_name/projects_name_model.dart';
import 'package:ecepl_app/Data/Network/app_exception.dart';
import 'package:ecepl_app/Data/Repository/Projects_name/projects_name_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'project_names_event.dart';
part 'project_names_state.dart';

class ProjectNamesBloc extends Bloc<ProjectNamesEvent, ProjectNamesState> {
  final ProjectsRepository repository;

  ProjectNamesBloc(this.repository) : super(ProjectNamesInitial()) {
    on<FetchProjectNamesEvent>(_fetchProjectNames);
  }

  Future<void> _fetchProjectNames(
    FetchProjectNamesEvent event,
    Emitter<ProjectNamesState> emit,
  ) async {
    emit(ProjectNamesLoading());

    try {
      final ProjectsData response = await repository.getProjects();

      emit(ProjectNamesLoaded(projectNames: response.data?.projects ?? []));
    } on AppException catch (e) {
      emit(ProjectNamesError(exception: e));
    } catch (e) {
      emit(
        ProjectNamesError(
          exception: const AppException(
            "Something went wrong. Please try again.",
          ),
        ),
      );
    }
  }
}
