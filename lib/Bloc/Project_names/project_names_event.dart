part of 'project_names_bloc.dart';

abstract class ProjectNamesEvent extends Equatable {
  const ProjectNamesEvent();

  @override
  List<Object?> get props => [];
}

class FetchProjectNamesEvent extends ProjectNamesEvent {
  const FetchProjectNamesEvent();

  @override
  List<Object?> get props => [];
}
