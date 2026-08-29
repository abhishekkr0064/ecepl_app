part of 'project_names_bloc.dart';

abstract class ProjectNamesState extends Equatable {
  const ProjectNamesState();

  @override
  List<Object?> get props => [];
}

class ProjectNamesInitial extends ProjectNamesState {}

class ProjectNamesLoading extends ProjectNamesState {}

class ProjectNamesLoaded extends ProjectNamesState {
  final List<ProjectNameModel> projectNames;

  const ProjectNamesLoaded({required this.projectNames});

  @override
  List<Object?> get props => [projectNames];
}

class ProjectNamesError extends ProjectNamesState {
  final AppException exception;

  const ProjectNamesError({required this.exception});

  @override
  List<Object?> get props => [exception];
}
